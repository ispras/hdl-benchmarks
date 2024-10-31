



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
-- Entity: 	irqctrl2
-- File:	irqctrl2.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Secondary interrupt controller. Handles up to 32 extra
--		interrupts, which are mapped on one of the 15 standard 
--		SPARC interrupts. Filtering is hard-coded in the
--		configuration record.
------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use work.target.all;
use work.iface.all;
use work.macro.orv;
use work.amba.all;
use work.config.all;


entity irqctrl2 is
  port (
    rst    : in  std_logic;
    clk    : in  clk_type;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    irqi   : in  irq2_in_type;
    irqo   : out irq2_out_type
  );
end; 
 
architecture rtl of irqctrl2 is

type irqregs is record
  imask		: std_logic_vector(IRQ2CHAN-1 downto 0);
  ipend		: std_logic_vector(IRQ2CHAN-1 downto 0);
  ireg		: std_logic_vector(IRQ2CHAN-1 downto 0);
  irl    	: std_logic_vector(4 downto 0);
  irq  		: std_logic;
end record;

function priority(v : std_logic_vector(31 downto 0)) return std_logic_vector is
begin
  if    v(31) = '1' then return("11111");
  elsif v(30) = '1' then return("11110");
  elsif v(29) = '1' then return("11101");
  elsif v(28) = '1' then return("11100");
  elsif v(27) = '1' then return("11011");
  elsif v(26) = '1' then return("11010");
  elsif v(25) = '1' then return("11001");
  elsif v(24) = '1' then return("11000");
  elsif v(23) = '1' then return("10111");
  elsif v(22) = '1' then return("10110");
  elsif v(21) = '1' then return("10101");
  elsif v(20) = '1' then return("10100");
  elsif v(19) = '1' then return("10011");
  elsif v(18) = '1' then return("10010");
  elsif v(17) = '1' then return("10001");
  elsif v(16) = '1' then return("10000");
  elsif v(15) = '1' then return("01111");
  elsif v(14) = '1' then return("01110");
  elsif v(13) = '1' then return("01101");
  elsif v(12) = '1' then return("01100");
  elsif v(11) = '1' then return("01011");
  elsif v(10) = '1' then return("01010");
  elsif v( 9) = '1' then return("01001");
  elsif v( 8) = '1' then return("01000");
  elsif v( 7) = '1' then return("00111");
  elsif v( 6) = '1' then return("00110");
  elsif v( 5) = '1' then return("00101");
  elsif v( 4) = '1' then return("00100");
  elsif v( 3) = '1' then return("00011");
  elsif v( 2) = '1' then return("00010");
  elsif v( 1) = '1' then return("00001");
  else return ("00000"); end if;
end;

signal ir, irin : irqregs;

begin

  irqhandler : process(rst, ir, apbi, irqi)
  variable irv : irqregs;
  variable tmp : std_logic_vector(31 downto 0);
  variable rdata : std_logic_vector(31 downto 0);
  begin

    irv := ir;

-- resolve interrupts

    tmp := (others => '0');
    for i in 0 to IRQ2CHAN-1 loop
      case IRQ2TBL(i) is
      when lvl0  => tmp(i) := not irqi.irq(i);
      when lvl1  => tmp(i) := irqi.irq(i);
      when edge0 => tmp(i) := ir.ireg(i) and not irqi.irq(i);
      when edge1 => tmp(i) := (not ir.ireg(i)) and irqi.irq(i);
      end case;
    end loop;

-- register read/write

    rdata := (others => '0');
    case apbi.paddr(3 downto 2) is
    when "00" => rdata(IRQ2CHAN-1 downto 0) := ir.imask;
    when "01" => rdata(IRQ2CHAN-1 downto 0) := ir.ipend;
    when "10" => rdata(5 downto 0) := ir.irq & ir.irl;
    when others => null;
    end case;

    if (apbi.psel and apbi.penable and apbi.pwrite) = '1' then
      case apbi.paddr(3 downto 2) is
      when "00" => irv.imask := apbi.pwdata(IRQ2CHAN-1 downto 0);
      when "01" => irv.ipend := ir.ipend or apbi.pwdata(IRQ2CHAN-1 downto 0);
      when "10" => irv.ipend := ir.ipend and not apbi.pwdata(IRQ2CHAN-1 downto 0);
      when others => null;
      end case;
    end if;

    irv.ipend := irv.ipend or tmp(IRQ2CHAN-1 downto 0);
    tmp(IRQ2CHAN-1 downto 0) := ir.imask and ir.ipend;
    irv.irl := priority(tmp);
    irv.irq := orv(tmp);

-- clear irq mask and pending on reset

    if rst = '0' then
      irv.imask := (others => '0');
      irv.ipend := (others => '0');
    end if;

    irin <= irv;
    apbo.prdata <= rdata;
    irqo.irq <= ir.irq;

  end process;


  regs : process(clk)
  begin 
    if rising_edge(clk) then 
      ir.imask <= irin.imask; ir.ipend <= irin.ipend;
      ir.irq <= irin.irq; ir.irl <= irin.irl;
    end if;
  end process;

-- generate only those registers that are necessary

  filt0 : for i in 0 to (IRQ2CHAN -1) generate
    filt1 : if (IRQ2TBL(i) > lvl1) generate
      regs : process(clk)
      begin if rising_edge(clk) then ir.ireg(i) <= irqi.irq(i); end if; end process;
    end generate;
  end generate;

end;

