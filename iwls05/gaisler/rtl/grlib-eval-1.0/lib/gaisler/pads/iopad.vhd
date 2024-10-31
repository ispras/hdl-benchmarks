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
-- Entity: 	iopad
-- File:	iopad.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	io pad with technology wrapper
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

entity iopad is
  generic (tech : integer := 0; level : integer := 0; slew : integer := 0;
	   voltage : integer := x33v; strength : integer := 12;
	   oepol : integer := 0);
  port (pad : inout std_ulogic; i, en : in std_ulogic; o : out std_ulogic);
end; 

architecture rtl of iopad is
signal oen : std_ulogic;
begin
  oen <= not en when oepol /= padoen_polarity(tech) else en;
  gen0 : if tech = inferred generate
    pad <= i after 2 ns when oen = '0' 
-- pragma translate_off
           else 'X' after 2 ns when is_x(oen) 
-- pragma translate_on
           else 'Z' after 2 ns;
    o <= to_X01(pad) after 1 ns;
  end generate;
  xcv : if (tech = virtex) or (tech = virtex2) or (tech = spartan3) generate
    u0 : virtex_iopad generic map (level, slew, voltage, strength) 
	 port map (pad, i, oen, o);
  end generate;
  axc : if (tech = axcel) or (tech = proasic) or (tech = proasic3) generate
    u0 : axcel_iopad generic map (level, slew, voltage, strength) 
	 port map (pad, i, oen, o);
  end generate;
  atc : if (tech = atc18) generate
    u0 : atc18_iopad generic map (level, slew, voltage, strength) 
	 port map (pad, i, oen, o);
  end generate;
  rhu : if (tech = rhumc) generate
    u0 : rhumc_iopad generic map (level, slew, voltage, strength) 
	 port map (pad, i, oen, o);
  end generate;
  ihp : if (tech = ihp25) generate
    u0 : ihp25_iopad generic map (level, slew, voltage, strength)
         port map (pad, i, oen, o);
  end generate; 
end;

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.pads.all;

entity iopadv is
  generic (tech : integer := 0; level : integer := 0; slew : integer := 0;
	voltage : integer := 0; strength : integer := 0; width : integer := 1;
	oepol : integer := 0);
  port (
    pad : inout std_logic_vector(width-1 downto 0); 
    i   : in  std_logic_vector(width-1 downto 0);
    en  : in  std_ulogic;
    o   : out std_logic_vector(width-1 downto 0));
end; 
architecture rtl of iopadv is
begin
  v : for j in width-1 downto 0 generate
    u0 : iopad generic map (tech, level, slew, voltage, strength, oepol) 
	 port map (pad(j), i(j), en, o(j));
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.pads.all;

entity iopadvv is
  generic (tech : integer := 0; level : integer := 0; slew : integer := 0;
	voltage : integer := 0; strength : integer := 0; width : integer := 1;
	oepol : integer := 0);
  port (
    pad : inout std_logic_vector(width-1 downto 0); 
    i   : in  std_logic_vector(width-1 downto 0);
    en  : in  std_logic_vector(width-1 downto 0);
    o   : out std_logic_vector(width-1 downto 0));
end; 
architecture rtl of iopadvv is
begin
  v : for j in width-1 downto 0 generate
    u0 : iopad generic map (tech, level, slew, voltage, strength, oepol) 
	 port map (pad(j), i(j), en(j), o(j));
  end generate;
end;
