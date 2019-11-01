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
-- Entity: 	clkgen_actel
-- File:	clkgen_actel.vhd
-- Author:	Jiri Gaisler Gaisler Research
-- Description:	Clock generator for Actel fpga
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library actel;
use actel.actel_components.all;
library gaisler;
use gaisler.misc.all;
use gaisler.libclk.all;
library grlib;
use grlib.stdlib.all;

entity clkgen_actel is
  generic (
    clk_mul  : integer := 1; 
    clk_div  : integer := 1;
    sdramen  : integer := 0;
    sdinvclk : integer := 0;
    pcien    : integer := 0;
    pcidll   : integer := 0;
    pcisysclk: integer := 0);
  port (
    clkin   : in  std_ulogic;
    pciclkin: in  std_ulogic;
    clk     : out std_ulogic;			-- main clock
    clkn    : out std_ulogic;			-- inverted main clock
    sdclk   : out std_ulogic;			-- SDRAM clock
    pciclk  : out std_ulogic;			-- PCI clock
    cgi     : in clkgen_in_type;
    cgo     : out clkgen_out_type);
end; 

architecture struct of clkgen_actel is 
signal clkint, pciclkint : std_ulogic;
begin

  c0 : if (PCIEN = 0) or (PCISYSCLK=0) generate
    u0 : hclkbuf port map (pad => clkin, y => clkint);
    clk <= clkint;
    clkn <= not clkint;
  end generate;

  c2 : if PCIEN/=0 generate
    c1 : if PCISYSCLK=1 generate
      clk <= pciclkint;
      clkn <= not pciclkint;
    end generate;
    u0 : hclkbuf_pci port map (pad => pciclkin, y => pciclkint);
    pciclk <= pciclkint;
  end generate;

  cgo.pcilock <= '1';
  cgo.clklock <= '1';
  sdclk <= '0';

-- pragma translate_off
  bootmsg : report_version 
  generic map (
    "clkgen_actel" & ": using HCLKBUF as clock buffer");
-- pragma translate_on
end;

