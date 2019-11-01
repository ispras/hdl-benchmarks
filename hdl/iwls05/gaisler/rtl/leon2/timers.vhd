



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
-- Entity: 	timers
-- File:	timers.vhd
-- Author:	Jiri Gaisler - ESA/ESTEC
-- Description:	This unit implemets two general-pupose timers and one watchdog.
--		All three timers are 24-bit wide down-counters clocked by a
--		common 10-bit pre-scaler. The pre-scaler is clocked by the
--		system clock. All three timers share the same decrementer
--		which means that the minimum pre-scaler division is three.
--		On reset, the scaler and watchdog are set to 'all-ones',
--		the two GP-timers disabled, and the remaining registers are
--		'unknown'. The scaler is frozen when the DSU halts the cpu
--		to freeze the time during debugging.
------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned."-";
use IEEE.std_logic_unsigned."+";
use work.target.all;
use work.config.all;
use work.iface.all;
use work.macro.all;
use work.amba.all;

entity timers is
  port (
    rst    : in  std_logic;
    clk    : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    timo   : out timers_out_type;
    dsuo   : in  dsu_out_type
  );
end; 
 
architecture rtl of timers is

type timer_control_type is record
  enable	:  std_logic;	-- enable counter
  load		:  std_logic;	-- load counter
  restart	:  std_logic;	-- restart counter
  irq   	:  std_logic;	-- interrupt
end record;

type timregs is record
  t0value 	:  std_logic_vector(23 downto 0);
  t0load	:  std_logic_vector(23 downto 0);
  t0ctrl   	:  timer_control_type;
  t1value 	:  std_logic_vector(23 downto 0);
  t1load	:  std_logic_vector(23 downto 0);
  t1ctrl   	:  timer_control_type;
  scalerval	:  std_logic_vector(9 downto 0);
  scalerpre 	:  std_logic_vector(9 downto 0);
  tick          :  std_logic;
  tsel   	:  std_logic_vector(1 downto 0);
end record;

type wdogregs is record
  wdog   	:  std_logic_vector(23 downto 0);
  wdogtout      :  std_logic;
end record;

constant zero :  std_logic_vector(23 downto 0) := (others => '0');
signal r, rin : timregs;
signal wr, wrin : wdogregs;

-- Main process

begin

  timerop : process(rst, r, wr, apbi, dsuo)
  variable sval : std_logic_vector(10 downto 0);
  variable rdata : std_logic_vector(31 downto 0);
  variable res, addin : std_logic_vector(23 downto 0);
  variable tv : timregs;
  variable wv : wdogregs;
  variable z : std_logic;
  begin

    tv := r; tv.t0ctrl.irq := '0'; tv.t1ctrl.irq := '0';
    tv.t0ctrl.load := '0'; tv.t1ctrl.load := '0'; tv.tick := '0';
    wv := wr;

-- scaler operation

-- pragma translate_off
    if not is_x(r.scalerval) then
-- pragma translate_on
      sval := ('0' & r.scalerval) - 1;		-- decrement scaler
-- pragma translate_off
    end if;
-- pragma translate_on
    if not (DEBUG_UNIT and (dsuo.freezetime = '1')) then -- halt timers when DSU active
      if (sval(10) = '1') then
        tv.scalerval := r.scalerpre;			-- reload if carry-out
        tv.tick := '1';
      else
        tv.scalerval := sval(9 downto 0);
      end if;
    end if;

-- timer operation

    if (r.tick = '1') or (r.tsel /= "00") then
-- pragma translate_off
      if not is_x(r.tsel) then
-- pragma translate_on
        tv.tsel := r.tsel + 1;
-- pragma translate_off
      end if;
-- pragma translate_on
    end if;

    addin := (others => '-');
    case r.tsel is		-- select which timer to operate on
    when "01" => addin := r.t0value;
    when "10" => addin := r.t1value;
    when "11" => if WDOGEN then addin := wr.wdog; end if;
    when others =>
    end case;

-- pragma translate_off
    if not is_x(addin) then 
-- pragma translate_on
      res := addin - 1;   -- decrement timer
      if addin = zero then z := '1'; else z := '0'; end if; -- zero detect
-- pragma translate_off
    end if;
-- pragma translate_on

-- update corresponding register and generate irq/wdrst

    case r.tsel is		-- select which timer to operate on
    when "01" =>
      if r.t0ctrl.enable = '1' then
        tv.t0ctrl.irq := z and not r.t0ctrl.load; -- no irq at load
	if tv.t0ctrl.irq = '1' then 
          tv.t0ctrl.enable := r.t0ctrl.restart;
          if r.t0ctrl.restart = '1' then tv.t0value := r.t0load; end if;
	else tv.t0value := res; end if;
      end if;
    when "10" =>
      if r.t1ctrl.enable = '1' then
        tv.t1ctrl.irq := z and not r.t1ctrl.load; -- no irq at load
	if tv.t1ctrl.irq = '1' then 
          tv.t1ctrl.enable := r.t1ctrl.restart;
          if r.t1ctrl.restart = '1' then tv.t1value := r.t1load; end if;
	else tv.t1value := res; end if;
      end if;
    when "11" =>
      if WDOGEN then
        wv.wdogtout := z;
        if z = '0' then wv.wdog := res; end if;
      end if;
    when others =>
    end case;

    if r.t0ctrl.load = '1' then tv.t0value := r.t0load; end if;
    if r.t1ctrl.load = '1' then tv.t1value := r.t1load; end if;

-- read/write registers
    rdata := (others => '0');

    case apbi.paddr(5 downto 2) is
    when "0000" => rdata(23 downto 0) := r.t0value;
    when "0001" => rdata(23 downto 0) := r.t0load;
    when "0010" => rdata(1 downto 0) := r.t0ctrl.restart & r.t0ctrl.enable;
    when "0011" => if WDOGEN then rdata(23 downto 0) := wr.wdog; end if;
    when "0100" =>  rdata(23 downto 0) := r.t1value;
    when "0101" => rdata(23 downto 0) := r.t1load;
    when "0110" => rdata(1 downto 0) := r.t1ctrl.restart & r.t1ctrl.enable;
    when "1000" => rdata(9 downto 0)  := r.scalerval;
    when "1001" => rdata(9 downto 0)  := r.scalerpre;
    when others => rdata(9 downto 0)  := (others => '-');
    end case;

    if (apbi.psel and apbi.penable and apbi.pwrite) = '1' then
      case apbi.paddr(5 downto 2) is
      when "0000" => tv.t0value := apbi.pwdata(23 downto 0);
      when "0001" => tv.t0load := apbi.pwdata(23 downto 0);
      when "0010" => tv.t0ctrl.load := apbi.pwdata(2);
		     tv.t0ctrl.restart := apbi.pwdata(1);
	             tv.t0ctrl.enable := apbi.pwdata(0);
      when "0011" => if WDOGEN then wv.wdog := apbi.pwdata(23 downto 0); end if;
      when "0100" => tv.t1value := apbi.pwdata(23 downto 0);
      when "0101" => tv.t1load := apbi.pwdata(23 downto 0);
      when "0110" => tv.t1ctrl.load := apbi.pwdata(2);
	             tv.t1ctrl.restart := apbi.pwdata(1);
	             tv.t1ctrl.enable := apbi.pwdata(0);
      when "1000" => tv.scalerval := apbi.pwdata(9 downto 0);
      when "1001" => tv.scalerpre := apbi.pwdata(9 downto 0);
      when others => null;
      end case;
    end if;


-- reset operation

    if rst = '0' then 
      tv.t0ctrl.enable := '0'; tv.t1ctrl.enable := '0';
      if WDOGEN then wv.wdog := (others => '1'); wv.wdogtout := '0'; end if;
      if BOOTOPT /= memory then
        tv.scalerval := std_logic_vector(TPRESC(9 downto 0));
	tv.scalerpre := std_logic_vector(TPRESC(9 downto 0)); 
      else
        tv.scalerval := (others => '0'); tv.scalerpre := (others => '0'); 
      end if;
      tv.tsel := "00";
    end if;

    rin <= tv; wrin <= wv;	-- update registers
    apbo.prdata <= rdata; 	-- drive data bus

  end process;

-- Registers

  regs : process(clk)
  begin
    if rising_edge(clk) then
      r <= rin;
    end if;
  end process;
  wd : if WDOGEN generate
    regs : process(clk)
    begin
      if rising_edge(clk) then
        wr <= wrin;
      end if;
    end process;
  end generate;

-- Drive outputs

  timo.tick <= r.tick;
  timo.irq <= r.t1ctrl.irq & r.t0ctrl.irq;
  timo.wdog <= not wr.wdogtout when WDOGEN else '-';

end;
