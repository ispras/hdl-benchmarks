----------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2004 GAISLER RESEARCH
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  See the file COPYING for the full details of the license.
--
-----------------------------------------------------------------------------
-- Entity: 	irqmp
-- File:	irqmp.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Multi-processor APB interrupt controller. Implements a 
--		two-level interrupt controller for 15 interrupts.
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library gaisler;
use gaisler.devices.all;
use gaisler.leon3.all;

entity irqmp is
  generic (
    pindex  : integer := 0;
    paddr   : integer := 0;
    pmask   : integer := 16#fff#;
    ncpu    : integer := 1;
    cmask   : integer := 16#0001#
  );
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    irqi   : in  irq_out_vector(0 to ncpu-1);
    irqo   : out irq_in_vector(0 to ncpu-1)
  );
end; 
 
architecture rtl of irqmp is

constant REVISION : integer := 3;

constant pconfig : apb_config_type := (
  0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_IRQMP, 0, REVISION, 0),
  1 => apb_iobar(paddr, pmask));

type mask_type is array (0 to ncpu-1) of std_logic_vector(15 downto 1);
type irl_type is array (0 to ncpu-1) of std_logic_vector(3 downto 0);

type reg_type is record
  imask		: mask_type;
  ilevel	: std_logic_vector(15 downto 1);
  ipend		: std_logic_vector(15 downto 1);
  iforce	: mask_type;
  irl    	: irl_type;
end record;

function prioritize(b : std_logic_vector(15 downto 1)) return std_logic_vector is
variable a : std_logic_vector(15 downto 0);
variable irl : std_logic_vector(3 downto 0);
variable level : integer range 0 to 15;
begin
  irl := "0000"; level := 0; a := b & '0';
  for i in NAHBIRQ-1 downto 0 loop
    level := i;
    if a(i) = '1' then exit; end if;
  end loop;
  irl := conv_std_logic_vector(level, 4);
  return(irl);
end;

signal r, rin : reg_type;

begin

  comb : process(rst, r, apbi, irqi)
  variable v : reg_type;
  variable temp : mask_type;
  variable prdata : std_logic_vector(31 downto 0);
  variable tmpirq : std_logic_vector(15 downto 0);
  variable cpurst : std_logic_vector(ncpu-1 downto 0);
  begin

    v := r; cpurst := (others => '0');

-- prioritize interrupts

    for i in 0 to ncpu-1 loop
      temp(i) := ((r.iforce(i) or r.ipend) and r.imask(i));
      v.irl(i) := prioritize(temp(i) and r.ilevel);
      if v.irl(i) = "0000" then
        v.irl(i) := prioritize(temp(i) and not r.ilevel);
      end if;
    end loop;

-- register read

    prdata := (others => '0');
    case apbi.paddr(7 downto 6) is
    when "00" =>
      case apbi.paddr(4 downto 2) is
      when "000" => prdata(15 downto 1) := r.ilevel;
      when "001" => prdata(15 downto 1) := r.ipend;
      when "010" => prdata(15 downto 1) := r.iforce(0);
      when "011" =>
      when others =>
        prdata(31 downto 28) := conv_std_logic_vector(ncpu-1, 4);
        for i in 0 to ncpu -1 loop prdata(i) := irqi(i).pwd; end loop;
      end case;
    when "01" =>
      for i in 0 to ncpu-1 loop 
	if i = conv_integer( apbi.paddr(5 downto 2)) then
	    prdata(15 downto  1) := r.imask(i);
	end if;
      end loop;
    when "10" =>
      for i in 0 to ncpu-1 loop 
	if i = conv_integer( apbi.paddr(5 downto 2)) then
	    prdata(15 downto  1) := r.iforce(i);
	end if;
      end loop;
    when others =>
    end case;

-- register write

    if (apbi.psel(pindex) and apbi.penable and apbi.pwrite) = '1' then
      case apbi.paddr(7 downto 6) is
      when "00" =>
        case apbi.paddr(4 downto 2) is
        when "000" => v.ilevel := apbi.pwdata(15 downto 1);
        when "001" => v.ipend  := apbi.pwdata(15 downto 1);
        when "010" => v.iforce(0) := apbi.pwdata(15 downto 1);
        when "011" => v.ipend  := r.ipend and not apbi.pwdata(15 downto 1);
        when "100" =>
          for i in 0 to ncpu -1 loop cpurst(i) := apbi.pwdata(i); end loop;
        when others =>
        end case;
      when "01" =>
        for i in 0 to ncpu-1 loop 
	  if i = conv_integer( apbi.paddr(5 downto 2)) then
	    v.imask(i) := apbi.pwdata(15 downto 1);
	  end if;
        end loop;
      when "10" =>
        for i in 0 to ncpu-1 loop 
	  if i = conv_integer( apbi.paddr(5 downto 2)) then
	    v.iforce(i) := (r.iforce(i) or apbi.pwdata(15 downto 1)) and
			not apbi.pwdata(31 downto 17);
	  end if;
        end loop;
      when others =>
      end case;
    end if;

-- register new interrupts

    v.ipend := v.ipend or apbi.pirq(NAHBIRQ-1 downto 1);

-- interrupt acknowledge

    for i in 0 to ncpu-1 loop 
      if irqi(i).intack = '1' then
        tmpirq := decode(irqi(i).irl);
        temp(i) := tmpirq(15 downto 1);
        v.iforce(i) := r.iforce(i) and not temp(i);
        v.ipend  := v.ipend and not ((not r.iforce(i)) and temp(i));
      end if;
    end loop;

-- reset

    if rst = '0' then 
      v.imask := (others => (others => '0')); 
      v.iforce := (others => (others => '0'));
    end if;

    apbo.prdata <= prdata; 
    for i in 0 to ncpu-1 loop 
      irqo(i).irl <= r.irl(i); irqo(i).rst <= cpurst(i);
    end loop;

    rin <= v;

  end process;

  apbo.pirq <= (others => '0');
  apbo.pconfig <= pconfig;
  apbo.pindex <= pindex;

  regs : process(clk)
  begin if rising_edge(clk) then r <= rin; end if; end process;

-- pragma translate_off
    bootmsg : report_version 
    generic map ("irqmp" &
	": Multi-processor Interrupt Controller rev " & tost(REVISION) &
	", #cpu " & tost(NCPU));
-- pragma translate_on

end;

