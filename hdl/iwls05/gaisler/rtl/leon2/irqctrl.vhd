



----------------------------------------------------------------------------
--  This file is a part of the LEON VHDL model
--  Copyright (C) 1999  European Space Agency (ESA)
--
--  This library is free software; you can redistribute it and/or
--  modify it under the terms of the GNU Lesser General Public
--  License as published by the Free Software Foundation; either
--  version 2 of the License, or (at your option) any later version.
--
--  See the file COPYING.LGPL for the full details of the license.


-----------------------------------------------------------------------------
-- Entity: 	irqctrl
-- File:	irqctrl.vhd
-- Author:	Jiri Gaisler - ESA/ESTEC
-- Description:	Interrupt controller. Implements a two-level interrupt
--		controller for the 15 SPARC interrupts.
------------------------------------------------------------------------------
-- Version control:
-- 07-08-1998:	First implemetation
-- 26-09-1999:	Release 1.0
------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.iface.all;
use work.macro.decode;
use work.amba.all;


entity irqctrl is
  port (
    rst    : in  std_logic;
    clk    : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    irqi   : in  irq_in_type;
    irqo   : out irq_out_type
  );
end; 
 
architecture rtl of irqctrl is

type irqregs is record
  imask		: std_logic_vector(15 downto 1);
  ilevel	: std_logic_vector(15 downto 1);
  ipend		: std_logic_vector(15 downto 1);
  iforce	: std_logic_vector(15 downto 1);
  irl    	: std_logic_vector( 3 downto 0);
end record;

function priority(v : std_logic_vector(15 downto 1)) return std_logic_vector is
begin
  if    v(15) = '1' then return("1111");
  elsif v(14) = '1' then return("1110");
  elsif v(13) = '1' then return("1101");
  elsif v(12) = '1' then return("1100");
  elsif v(11) = '1' then return("1011");
  elsif v(10) = '1' then return("1010");
  elsif v( 9) = '1' then return("1001");
  elsif v( 8) = '1' then return("1000");
  elsif v( 7) = '1' then return("0111");
  elsif v( 6) = '1' then return("0110");
  elsif v( 5) = '1' then return("0101");
  elsif v( 4) = '1' then return("0100");
  elsif v( 3) = '1' then return("0011");
  elsif v( 2) = '1' then return("0010");
  elsif v( 1) = '1' then return("0001");
  else return ("0000"); end if;
end;

signal ir, irin : irqregs;

begin

  irqhandler : process(rst, ir, apbi, irqi)
  variable irv : irqregs;
  variable temp : std_logic_vector(15 downto 0);
  variable rdata : std_logic_vector(31 downto 0);
  begin

    irv := ir;

-- resolve interrupts

    temp := ((ir.iforce or ir.ipend) and ir.imask) & '0';
    irv.irl := priority(temp(15 downto 1) and ir.ilevel);
    if irv.irl = "0000" then
      irv.irl := priority(temp(15 downto 1) and not ir.ilevel);
    end if;

-- register read/write

    rdata := (others => '0');
    case apbi.paddr(3 downto 2) is
    when "00" => rdata(31 downto 17) := ir.ilevel;
	    	 rdata(15 downto  1) := ir.imask;
    when "01" => rdata(15 downto 1) := ir.ipend;
    when "10" => rdata(15 downto 1) := ir.iforce;
    when others => rdata := (others => '-');
    end case;

    if (apbi.psel and apbi.penable and apbi.pwrite) = '1' then
      case apbi.paddr(3 downto 2) is
      when "00" => irv.ilevel := apbi.pwdata(31 downto 17);
	           irv.imask  := apbi.pwdata(15 downto  1);
      when "01" => irv.ipend  := apbi.pwdata(15 downto  1);
      when "10" => irv.iforce := apbi.pwdata(15 downto  1);
      when "11" => irv.ipend  := ir.ipend and not apbi.pwdata(15 downto 1);
      when others => null;
      end case;
    end if;

    irv.ipend := irv.ipend or irqi.irq;		-- merge incoming interrupts

-- clear irq pending/force on intack

    if irqi.intack = '1' then
      temp := decode(irqi.irl);
      irv.iforce := ir.iforce and not temp(15 downto 1);
      irv.ipend  := irv.ipend and not ((not ir.iforce) and temp(15 downto 1));
    end if;

-- clear irq mask and pending on reset

    if rst = '0' then
      irv.imask := (others => '0');
    end if;

    irin <= irv;
    apbo.prdata <= rdata;
    irqo.irl <= ir.irl;

  end process;


  regs : process(clk)
  begin if rising_edge(clk) then ir <= irin; end if; end process;

end;

