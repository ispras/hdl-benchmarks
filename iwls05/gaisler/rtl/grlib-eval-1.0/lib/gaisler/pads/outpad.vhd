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
-- Entity: 	outpad
-- File:	outpad.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	output pad with technology wrapper
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library gaisler;
use gaisler.pad_xilinx.all;
use gaisler.pad_actel.all;
use gaisler.pad_atc18.all;
use gaisler.pad_rhumc.all;
use gaisler.pad_ihp25.all;

entity outpad is
  generic (tech : integer := 0; level : integer := 0; slew : integer := 0;
	   voltage : integer := x33v; strength : integer := 12);
  port (pad : out std_ulogic; i : in std_ulogic);
end; 

architecture rtl of outpad is
begin
  gen0 : if tech = inferred generate
    pad <= i after 2 ns when slew = 0 else i;
  end generate;
  xcv : if (tech = virtex) or (tech = virtex2) or (tech = spartan3) generate
    u0 : virtex_outpad generic map (level, slew, voltage, strength) port map (pad, i);
  end generate;
  axc : if (tech = axcel) or (tech = proasic) or (tech = proasic3) generate
    u0 : axcel_outpad generic map (level, slew, voltage, strength) port map (pad, i);
  end generate;
  atc : if (tech = atc18) generate
    u0 : atc18_outpad generic map (level, slew, voltage, strength) port map (pad, i);
  end generate;
  rhu : if (tech = rhumc) generate
    u0 : rhumc_outpad generic map (level, slew, voltage, strength) port map (pad, i);
  end generate;
  ihp : if (tech = ihp25) generate
    --pad <= i after 2 ns when slew = 0 else i;
    u0 : ihp25_outpad generic map (level, slew, voltage, strength) port map (pad, i);
  end generate; 
end;

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.pads.all;

entity outpadv is
  generic (tech : integer := 0; level : integer := 0; slew : integer := 0;
	voltage : integer := 0; strength : integer := 0; width : integer := 1);
  port (
    pad : out std_logic_vector(width-1 downto 0); 
    i   : in  std_logic_vector(width-1 downto 0));
end; 
architecture rtl of outpadv is
begin
  v : for j in width-1 downto 0 generate
    u0 : outpad generic map (tech, level, slew, voltage, strength) 
	 port map (pad(j), i(j));
  end generate;
end;
