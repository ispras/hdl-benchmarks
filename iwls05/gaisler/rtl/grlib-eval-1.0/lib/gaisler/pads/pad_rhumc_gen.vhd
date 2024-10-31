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
-- Package: 	pad_rhumc_gen
-- File:	pad_rhumc_gen.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	UMC pad wrappers
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library umc;
use umc.umc_components.all;

entity rhumc_inpad is
  generic (level : integer := 0; voltage : integer := 0);
  port (pad : in std_ulogic; o : out std_ulogic);
end; 
architecture rtl of rhumc_inpad is
begin
  ip : ICMT3V port map (a => pad, z => o);
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library umc;
use umc.umc_components.all;

entity rhumc_iopad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 0);
  port (pad : inout std_ulogic; i, en : in std_ulogic; o : out std_ulogic);
end ;
architecture rtl of rhumc_iopad is
begin
  f4 : if (strength <= 4)  generate
      op : BICM3V4 port map (a => i, en => en, io => pad, z => o);
  end generate;
  f12 : if (strength > 4)  and (strength <= 12)  generate
      op : BICM3V12 port map (a => i, en => en, io => pad, z => o);
  end generate;
  f24 : if (strength > 16)  generate
      op : BICM3V24 port map (a => i, en => en, io => pad, z => o);
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library umc;
use umc.umc_components.all;

entity rhumc_outpad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 0);
  port (pad : out std_ulogic; i : in std_ulogic);
end ;
architecture rtl of rhumc_outpad is
begin
  f4 : if (strength <= 4)  generate
      op : OCM3V4 port map (a => i, z => pad);
  end generate;
  f12 : if (strength > 4) and (strength <= 12)  generate
      op : OCM3V12 port map (a => i, z => pad);
  end generate;
  f24 : if (strength > 12) generate
      op : OCM3V24 port map (a => i, z => pad);
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library umc;
use umc.umc_components.all;

entity rhumc_toutpad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 0);
  port (pad : out std_ulogic; i, en : in std_ulogic);
end ;
architecture rtl of rhumc_toutpad is
begin
  f4 : if (strength <= 4)  generate
      op : OCMTR4 port map (a => i, en => en, z => pad);
  end generate;
  f12  : if (strength > 4) and (strength <= 12)  generate
      op : OCMTR12 port map (a => i, en => en, z => pad);
  end generate;
  f24 : if (strength > 12) generate
      op : OCMTR24 port map (a => i, en => en, z => pad);
  end generate;
end;
