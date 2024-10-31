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
-- Entity: 	clkgen
-- File:	clkgen.vhd
-- Author:	Jiri Gaisler Gaisler Research
-- Description:	Clock generator with tech selection
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library gaisler;
use gaisler.misc.all;
use gaisler.libclk.all;

entity clkgen is
  generic (
    tech     : integer := 1; 
    clk_mul  : integer := 1; 
    clk_div  : integer := 1;
    sdramen  : integer := 0;
    sdinvclk : integer := 0;
    pcien    : integer := 0;
    pcidll   : integer := 0;
    pcisysclk: integer := 0;
    freq     : integer := 25000);	-- clock frequency in KHz
  port (
    clkin   : in  std_logic;
    pciclkin: in  std_logic;
    clk     : out std_logic;			-- main clock
    clkn    : out std_logic;			-- inverted main clock
    clk2x   : out std_logic;			-- inverted main clock
    sdclk   : out std_logic;			-- SDRAM clock
    pciclk  : out std_logic;			-- PCI clock
    cgi     : in clkgen_in_type;
    cgo     : out clkgen_out_type);
end; 

architecture struct of clkgen is 
signal intclk : std_ulogic;
begin
  gen : if (tech /= virtex) and (tech /= virtex2) and (tech /= stratix) and
	(tech /= spartan3) 
  generate
    intclk <= pciclkin when PCISYSCLK = 1 else clkin;
    sdclk <= not intclk when SDINVCLK = 1 else intclk;
    pciclk <= pciclkin; clk <= intclk; clkn <= not intclk;
    cgo.clklock <= '1'; cgo.pcilock <= '1'; clk2x <= '0';
  end generate;
  xcv : if tech = virtex generate
    v : clkgen_virtex 
    generic map (clk_mul, clk_div, sdramen, sdinvclk, pcien, pcidll, pcisysclk)
    port map (clkin, pciclkin, clk, clkn, sdclk, pciclk, cgi, cgo);
  end generate;
  xc2v : if (tech = virtex2) or (tech = spartan3) generate
    v : clkgen_virtex2 
    generic map (clk_mul, clk_div, sdramen, sdinvclk, pcien, pcidll, pcisysclk, freq)
    port map (clkin, pciclkin, clk, clkn, sdclk, pciclk, cgi, cgo);
  end generate;
  str : if tech = stratix generate
    v : clkgen_stratix 
    generic map (clk_mul, clk_div, sdramen, sdinvclk, pcien, pcidll, pcisysclk, freq)
    port map (clkin, pciclkin, clk, clkn, sdclk, pciclk, cgi, cgo);
  end generate;

end;
