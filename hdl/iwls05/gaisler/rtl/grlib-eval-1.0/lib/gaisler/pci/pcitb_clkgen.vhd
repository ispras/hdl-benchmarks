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
-- Entity:      pcitb_clkgen
-- File:        pcitb_clkgen.vhd
-- Author:      Alf Vaerneus, Gaisler Research
-- Description: PCI clock & reset generator
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library gaisler;
use gaisler.pcitb.all;

entity pcitb_clkgen is
  generic (
    mhz66 : boolean := false;
    rstclocks : integer := 20);
  port (
    rsttrig : in std_logic;
    systclk : out pci_syst_type);
end pcitb_clkgen;

architecture tb of pcitb_clkgen is

signal clk : std_logic;

begin

  systclk.clk <= clk;

  clkgen: process
  begin
    if mhz66 then
      clk <= '1';
      wait for 7 ns;
      clk <= '0';
      wait for 8 ns;
    else
      clk <= '1';
      wait for 15 ns;
      clk <= '0';
      wait for 15 ns;
    end if;
  end process;

  reset : process
  begin
    if rsttrig = '1' then
      systclk.rst <= '0';
      if mhz66 then
        wait for rstclocks*15 ns;
      else
        wait for rstclocks*30 ns;
      end if;
      wait until clk = '1';
    end if;
    systclk.rst <= '1';
    wait for 1 ns;
  end process;

end;

