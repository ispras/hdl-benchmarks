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
-- Entity: 	odpad
-- File:	odpad.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	tri-state output pad with technology wrapper
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

entity odpad is
  generic (tech : integer := 0; level : integer := 0; slew : integer := 0;
	   voltage : integer := x33v; strength : integer := 12;
	   oepol : integer := 0);
  port (pad : out std_ulogic; i : in std_ulogic);
end; 

architecture rtl of odpad is
signal gnd, oen : std_ulogic;
begin
  oen <= not i when oepol /= padoen_polarity(tech) else i;
  gnd <= '0';
  gen0 : if tech = inferred generate
    pad <= gnd after 2 ns when oen = '0' 
-- pragma translate_off
           else 'X' after 2 ns when is_x(i) 
-- pragma translate_on
           else 'Z' after 2 ns;
  end generate;
  xcv : if (tech = virtex) or (tech = virtex2) or (tech = spartan3) generate
    u0 : virtex_toutpad generic map (level, slew, voltage, strength) 
	 port map (pad, gnd, oen);
  end generate;
  axc : if (tech = axcel) or (tech = proasic) or (tech = proasic3) generate
    u0 : axcel_toutpad generic map (level, slew, voltage, strength) 
	 port map (pad, gnd, oen);
  end generate;
  atc : if (tech = atc18) generate
    u0 : atc18_toutpad generic map (level, slew, voltage, strength) 
	 port map (pad, gnd, oen);
  end generate;
  rhu : if (tech = rhumc) generate
    u0 : rhumc_toutpad generic map (level, slew, voltage, strength) 
	 port map (pad, gnd, oen);
  end generate;
  ihp : if (tech = ihp25) generate
    u0 : ihp25_toutpad generic map(level, slew, voltage, strength)
         port map (pad, gnd, oen);
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.pads.all;

entity odpadv is
  generic (tech : integer := 0; level : integer := 0; slew : integer := 0;
	voltage : integer := 0; strength : integer := 0; width : integer := 1;
	oepol : integer := 0);
  port (
    pad : inout std_logic_vector(width-1 downto 0); 
    i   : in  std_logic_vector(width-1 downto 0));
end; 
architecture rtl of odpadv is
begin
  v : for j in width-1 downto 0 generate
    u0 : odpad generic map (tech, level, slew, voltage, strength, oepol) 
	 port map (pad(j), i(j));
  end generate;
end;
