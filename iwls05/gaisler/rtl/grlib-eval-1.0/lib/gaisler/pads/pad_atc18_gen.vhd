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
-- Package: 	pad_atc18_gen
-- File:	pad_atc18_gen.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Atmel ATC18 pad wrappers
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library atmel;
use atmel.components.all;

entity atc18_inpad is
  generic (level : integer := 0; voltage : integer := 0);
  port (pad : in std_ulogic; o : out std_ulogic);
end; 
architecture rtl of atc18_inpad is
begin
  pci0 : if level = pci33 generate
    ip : pc33d00 port map (pad => pad, cin => o);
  end generate;
  gen0 : if level /= pci33 generate
    ip : pc33d00 port map (pad => pad, cin => o);
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library atmel;
use atmel.components.all;

entity atc18_iopad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 0);
  port (pad : inout std_ulogic; i, en : in std_ulogic; o : out std_ulogic);
end ;
architecture rtl of atc18_iopad is
begin
  pci0 : if level = pci33 generate
    op : pp33b015vt port map (i => i, oen => en, pad => pad, cin => o);
  end generate;
  gen0 : if level /= pci33 generate
    f1 : if (strength <= 4)  generate
      op : pt33b01 port map (i => i, oen => en, pad => pad, cin => o);
    end generate;
    f2 : if (strength > 4)  and (strength <= 8)  generate
      op : pt33b02 port map (i => i, oen => en, pad => pad, cin => o);
    end generate;
    f3 : if (strength > 8)  and (strength <= 16)  generate
      op : pt33b03 port map (i => i, oen => en, pad => pad, cin => o);
    end generate;
    f4 : if (strength > 16)  generate
      op : pt33b04 port map (i => i, oen => en, pad => pad, cin => o);
    end generate;
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library gaisler;
use gaisler.pad_atc18.all;

entity atc18_iodpad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 0);
  port (pad : inout std_ulogic; i, en : in std_ulogic; o : out std_ulogic);
end ;
architecture rtl of atc18_iodpad is
signal gnd : std_ulogic;
begin
  gnd <= '0';
  p0 : atc18_iopad generic map (level, slew, voltage, strength)
  port map (pad => pad, i => gnd, en => i, o => o);
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library atmel;
use atmel.components.all;

entity atc18_outpad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 0);
  port (pad : out std_ulogic; i : in std_ulogic);
end ;
architecture rtl of atc18_outpad is
signal gnd : std_logic;
begin

  gnd <= '0';

  pci0 : if level = pci33 generate
    op : pp33t015vt port map (i => i, oen => gnd, pad => pad);
  end generate;
  gen0 : if level /= pci33 generate
    f4 : if (strength <= 4)  generate
      op : pt33o01 port map (i => i, pad => pad);
    end generate;
    f8  : if (strength > 4) and (strength <= 8)  generate
      op : pt33o02 port map (i => i, pad => pad);
    end generate;
    f16 : if (strength > 8) and (strength <= 16)  generate
      op : pt33o03 port map (i => i, pad => pad);
    end generate;
    f32 : if (strength > 16) generate
      op : pt33o02 port map (i => i, pad => pad);
    end generate;
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library atmel;
use atmel.components.all;

entity atc18_toutpad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 0);
  port (pad : out std_ulogic; i, en : in std_ulogic);
end ;
architecture rtl of atc18_toutpad is
begin

  pci0 : if level = pci33 generate
    op : pp33t015vt port map (i => i, oen => en, pad => pad);
  end generate;
  gen0 : if level /= pci33 generate
    f4 : if (strength <= 4)  generate
      op : pt33t01 port map (i => i, oen => en, pad => pad);
    end generate;
    f8  : if (strength > 4) and (strength <= 8)  generate
      op : pt33t02 port map (i => i, oen => en, pad => pad);
    end generate;
    f16 : if (strength > 8) and (strength <= 16)  generate
      op : pt33t03 port map (i => i, oen => en, pad => pad);
    end generate;
    f32 : if (strength > 16) generate
      op : pt33t02 port map (i => i, oen => en, pad => pad);
    end generate;
  end generate;

end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library gaisler;
use gaisler.pad_atc18.all;

entity atc18_odpad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 0);
  port (pad : out std_ulogic; i : in std_ulogic);
end ;
architecture rtl of atc18_odpad is
signal gnd : std_ulogic;
begin
  gnd <= '0';
  p0 : atc18_toutpad generic map (level, slew, voltage, strength)
  port map (pad => pad, i => gnd, en => i);
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library atmel;
use atmel.components.all;

entity atc18_clkpad is
  generic (level : integer := 0; voltage : integer := 0);
  port (pad : in std_ulogic; o : out std_ulogic);
end; 
architecture rtl of atc18_clkpad is
begin
  o <= pad;
end;
