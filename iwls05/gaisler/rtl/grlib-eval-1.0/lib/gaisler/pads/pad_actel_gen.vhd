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
-- Package: 	pad_actel_gen
-- File:	pad_actel_gen.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Actel pads wrappers
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library actel;
use actel.actel_components.all;

entity axcel_inpad is
  generic (level : integer := 0; voltage : integer := 0);
  port (pad : in std_ulogic; o : out std_ulogic);
end; 
architecture rtl of axcel_inpad is
begin
  pci0 : if level = pci33 generate
    ip : inbuf_pci port map (pad => pad, y => o);
  end generate;
  gen0 : if level /= pci33 generate
    ip : inbuf port map (pad => pad, y => o);
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library actel;
use actel.actel_components.all;

entity axcel_iopad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 0);
  port (pad : inout std_ulogic; i, en : in std_ulogic; o : out std_ulogic);
end ;
architecture rtl of axcel_iopad is
begin
  pci0 : if level = pci33 generate
    op : bibuf_pci port map (d => i, e => en, pad => pad, y => o);
  end generate;
  gen0 : if level /= pci33 generate
    op : bibuf port map (d => i, e => en, pad => pad, y => o);
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library actel;
use actel.actel_components.all;

entity axcel_iodpad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 0);
  port (pad : inout std_ulogic; i, en : in std_ulogic; o : out std_ulogic);
end ;
architecture rtl of axcel_iodpad is
signal gnd : std_ulogic;
begin
  gnd <= '0';
  pci0 : if level = pci33 generate
    op : bibuf_pci port map (d => gnd, e => en, pad => pad, y => o);
  end generate;
  gen0 : if level /= pci33 generate
    op : bibuf port map (d => gnd, e => en, pad => pad, y => o);
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library actel;
use actel.actel_components.all;

entity axcel_outpad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 0);
  port (pad : out std_ulogic; i : in std_ulogic);
end ;
architecture rtl of axcel_outpad is
begin
  pci0 : if level = pci33 generate
    op : outbuf_pci port map (d => i, pad => pad);
  end generate;
  gen0 : if level /= pci33 generate
    x0 : if slew = 0 generate
      op : outbuf port map (d => i, pad => pad);
    end generate;
    x1 : if slew = 1 generate
      f0 : if (strength = 0)  generate
        op : outbuf port map (d => i, pad => pad);
      end generate;
      f8  : if (strength > 0) and (strength <= 8)  generate
        op : outbuf_f_8 port map (d => i, pad => pad);
      end generate;
      f12 : if (strength > 8) and (strength <= 12)  generate
        op : outbuf_f_12 port map (d => i, pad => pad);
      end generate;
      f16 : if (strength > 12) and (strength <= 16)  generate
        op : outbuf_f_16 port map (d => i, pad => pad);
      end generate;
      f24 : if (strength > 16) generate
        op : outbuf_f_24 port map (d => i, pad => pad);
      end generate;
    end generate;
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library actel;
use actel.actel_components.all;

entity axcel_odpad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 0);
  port (pad : out std_ulogic; i : in std_ulogic);
end ;
architecture rtl of axcel_odpad is
signal gnd : std_ulogic;
begin
  gnd <= '0';
  pci0 : if level = pci33 generate
    op : tribuff_pci port map (d => gnd, e => i, pad => pad);
  end generate;
  gen0 : if level /= pci33 generate
    op : tribuff port map (d => gnd, e => i, pad => pad);
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library actel;
use actel.actel_components.all;

entity axcel_toutpad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 0);
  port (pad : out std_ulogic; i, en : in std_ulogic);
end ;
architecture rtl of axcel_toutpad is
begin
  pci0 : if level = pci33 generate
    op : tribuff_pci port map (d => i, e => en, pad => pad);
  end generate;
  gen0 : if level /= pci33 generate
    op : tribuff port map (d => i, e => en, pad => pad);
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library actel;
use actel.actel_components.all;

entity axcel_clkpad is
  generic (level : integer := 0; voltage : integer := 0);
  port (pad : in std_ulogic; o : out std_ulogic);
end; 
architecture rtl of axcel_clkpad is
begin
  pci0 : if level = pci33 generate
    cp : hclkbuf_pci port map (pad => pad, y => o);
  end generate;
  gen0 : if level /= pci33 generate
    cp : hclkbuf port map (pad => pad, y => o);
  end generate;
end;
