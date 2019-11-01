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
-- Entity: 	clkpad
-- File:	clkpad.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Clock pad with technology wrapper
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

entity clkpad is
  generic (tech : integer := 0; level : integer := 0; 
	   voltage : integer := x33v; arch : integer := 0);
  port (pad : in std_ulogic; o : out std_ulogic);
end; 

architecture rtl of clkpad is
begin
  gen0 : if tech = inferred generate
    o <= to_X01(pad);
  end generate;
  xcv : if (tech = virtex) generate
    u0 : virtex_clkpad generic map (level, voltage, 0) port map (pad, o);
  end generate;
  xcv2 : if (tech = virtex2) or (tech = spartan3) generate
    u0 : virtex_clkpad generic map (level, voltage, arch) port map (pad, o);
  end generate;
  axc : if (tech = axcel) or (tech = proasic) or (tech = proasic3) generate
    u0 : axcel_clkpad generic map (level, voltage) port map (pad, o);
  end generate;
  atc : if (tech = atc18) generate
    u0 : atc18_clkpad generic map (level, voltage) port map (pad, o);
  end generate;
  rhu : if (tech = rhumc) generate
    u0 : rhumc_inpad generic map (level, voltage) port map (pad, o);
  end generate;
  ihp : if (tech = ihp25) generate
    u0 : ihp25_clkpad generic map (level, voltage) port map (pad, o);
  end generate; 
end;
