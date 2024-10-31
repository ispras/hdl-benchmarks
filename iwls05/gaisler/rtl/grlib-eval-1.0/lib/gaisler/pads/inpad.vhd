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
-- Entity: 	inpad
-- File:	inpad.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	input pad with technology wrapper
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

entity inpad is
  generic (tech : integer := 0; level : integer := 0; voltage : integer := x33v);
  port (pad : in std_ulogic; o : out std_ulogic);
end; 

architecture rtl of inpad is
begin
  gen0 : if tech = inferred generate
    o <= to_X01(pad) after 1 ns;
  end generate;
  xcv : if (tech = virtex) or (tech = virtex2) or (tech = spartan3) generate
    u0 : virtex_inpad generic map (level, voltage) port map (pad, o);
  end generate;
  axc : if (tech = axcel) or (tech = proasic) or (tech = proasic3) generate
    u0 : axcel_inpad generic map (level, voltage) port map (pad, o);
  end generate;
  atc : if (tech = atc18) generate
    u0 : atc18_inpad generic map (level, voltage) port map (pad, o);
  end generate;
  rhu : if (tech = rhumc) generate
    u0 : rhumc_inpad generic map (level, voltage) port map (pad, o);
  end generate;
  ihp : if (tech = ihp25) generate
    u0 : ihp25_inpad generic map(level, voltage) port map(pad, o);
  end generate; 
end;

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.pads.all;

entity inpadv is
  generic (tech : integer := 0; level : integer := 0; 
	   voltage : integer := 0; width : integer := 1);
  port (
    pad : in  std_logic_vector(width-1 downto 0); 
    o   : out std_logic_vector(width-1 downto 0));
end; 
architecture rtl of inpadv is
begin
  v : for i in width-1 downto 0 generate
    u0 : inpad generic map (tech, level, voltage) port map (pad(i), o(i));
  end generate;
end;
