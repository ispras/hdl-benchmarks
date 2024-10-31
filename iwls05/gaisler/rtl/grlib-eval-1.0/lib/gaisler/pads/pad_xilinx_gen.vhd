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
-- Package: 	pad_xilinx_gen
-- File:	pad_xilinx_gen.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Xilinx pads wrappers
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library unisim;
use unisim.vcomponents.all;

entity virtex_inpad is
  generic (level : integer := 0; voltage : integer := x33v);
  port (pad : in std_ulogic; o : out std_ulogic);
end; 
architecture rtl of virtex_inpad is
begin
  pci0 : if level = pci33 generate
    pci_5 : if voltage = x50v generate
      ip : IBUF generic map (IOSTANDARD => "PCI33_5") port map (O => o, I => pad);
    end generate;
    pci_3 : if voltage /= x50v generate
      ip : IBUF generic map (IOSTANDARD => "PCI33_3") port map (O => o, I => pad);
    end generate;
  end generate;
  ttl0 : if level = ttl generate
    ip : IBUF generic map (IOSTANDARD => "LVTTL") port map (O => o, I => pad);
  end generate;
  cmos0 : if level = cmos generate
    ip : IBUF generic map (IOSTANDARD => "LVCMOS33") port map (O => o, I => pad);
  end generate;
  gen0 : if (level /= pci33) and (level /= ttl) and (level /= cmos) generate
    ip : IBUF port map (O => o, I => pad);
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library unisim;
use unisim.vcomponents.all;

entity virtex_iopad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := x33v; strength : integer := 12);
  port (pad : inout std_ulogic; i, en : in std_ulogic; o : out std_ulogic);
end ;
architecture rtl of virtex_iopad is
begin
  pci0 : if level = pci33 generate
    pci_5 : if voltage = x50v generate
      op : IOBUF generic map (IOSTANDARD => "PCI33_5")
                 port map (O => o, IO => pad, I => i, T => en);
    end generate;
    pci_3 : if voltage /= x50v generate
      op : IOBUF generic map (IOSTANDARD => "PCI33_3")
                 port map (O => o, IO => pad, I => i, T => en);
    end generate;
  end generate;
  ttl0 : if level = ttl generate
    slow0 : if slew = 0 generate
      op : IOBUF generic map (drive => strength, IOSTANDARD => "LVTTL")
                 port map (O => o, IO => pad, I => i, T => en);
    end generate;
    fast0 : if slew /= 0 generate
      op : IOBUF generic map (drive => strength, IOSTANDARD => "LVTTL", SLEW => "FAST")
                 port map (O => o, IO => pad, I => i, T => en);
    end generate;
  end generate;
  cmos0 : if level = cmos generate
    slow0 : if slew = 0 generate
      op : IOBUF generic map (drive => strength, IOSTANDARD => "LVCMOS33")
                 port map (O => o, IO => pad, I => i, T => en);
    end generate;
    fast0 : if slew /= 0 generate
      op : IOBUF generic map (drive => strength, IOSTANDARD => "LVCMOS33", SLEW => "FAST")
                 port map (O => o, IO => pad, I => i, T => en);
    end generate;
  end generate;
  gen0 : if (level /= pci33) and (level /= ttl) and (level /= cmos) generate
    op : IOBUF port map (O => o, IO => pad, I => i, T => en);
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library unisim;
use unisim.vcomponents.all;

entity virtex_outpad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 12);
  port (pad : out std_ulogic; i : in std_ulogic);
end ;
architecture rtl of virtex_outpad is
begin
  pci0 : if level = pci33 generate
    pci_5 : if voltage = x50v generate
      op : OBUF generic map (drive => strength, IOSTANDARD => "PCI33_5")
                port map (O => pad, I => i);
    end generate;
    pci_3 : if voltage /= x50v generate
      op : OBUF generic map (drive => strength, IOSTANDARD => "PCI33_3")
                port map (O => pad, I => i);
    end generate;
  end generate;
  ttl0 : if level = ttl generate
    slow0 : if slew = 0 generate
      op : OBUF generic map (drive => strength, IOSTANDARD => "LVTTL")
                port map (O => pad, I => i);
    end generate;
    fast0 : if slew /= 0 generate
      op : OBUF generic map (drive => strength, IOSTANDARD => "LVTTL", SLEW => "FAST")
                port map (O => pad, I => i);
    end generate;
  end generate;
  cmos0 : if level = cmos generate
    slow0 : if slew = 0 generate
      op : OBUF generic map (drive => strength, IOSTANDARD => "LVCMOS33")
                port map (O => pad, I => i);
    end generate;
    fast0 : if slew /= 0 generate
      op : OBUF generic map (drive => strength, IOSTANDARD => "LVCMOS33", SLEW => "FAST")
                port map (O => pad, I => i);
    end generate;
  end generate;
  gen0 : if (level /= pci33) and (level /= ttl) and (level /= cmos) generate
      op : OBUF port map (O => pad, I => i);
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library unisim;
use unisim.vcomponents.all;

entity virtex_odpad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 12);
  port (pad : out std_ulogic; i : in std_ulogic);
end ;
architecture rtl of virtex_odpad is
signal gnd : std_ulogic;
begin
  gnd <= '0';
  pci0 : if level = pci33 generate
    pci_5 : if voltage = x50v generate
      op : OBUFT generic map (drive => strength, IOSTANDARD => "PCI33_5")
                 port map (O => pad, I => gnd, T => i);
    end generate;
    pci_3 : if voltage /= x50v generate
      op : OBUFT generic map (drive => strength, IOSTANDARD => "PCI33_3")
                 port map (O => pad, I => gnd, T => i);
    end generate;
  end generate;
  ttl0 : if level = ttl generate
    slow0 : if slew = 0 generate
      op : OBUFT generic map (drive => strength, IOSTANDARD => "LVTTL")
                 port map (O => pad, I => gnd, T => i);
    end generate;
    fast0 : if slew /= 0 generate
      op : OBUFT generic map (drive => strength, IOSTANDARD => "LVTTL", SLEW => "FAST")
                 port map (O => pad, I => gnd, T => i);
    end generate;
  end generate;
  cmos0 : if level = cmos generate
    slow0 : if slew = 0 generate
      op : OBUFT generic map (drive => strength, IOSTANDARD => "LVCMOS33")
                 port map (O => pad, I => gnd, T => i);
    end generate;
    fast0 : if slew /= 0 generate
      op : OBUFT generic map (drive => strength, IOSTANDARD => "LVCMOS33", SLEW => "FAST")
                 port map (O => pad, I => gnd, T => i);
    end generate;
  end generate;
  gen0 : if (level /= pci33) and (level /= ttl) and (level /= cmos) generate
    op : OBUFT port map (O => pad, I => gnd, T => i);
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library unisim;
use unisim.vcomponents.all;

entity virtex_toutpad  is
  generic (level : integer := 0; slew : integer := 0;
	   voltage : integer := 0; strength : integer := 12);
  port (pad : out std_ulogic; i, en : in std_ulogic);
end ;
architecture rtl of virtex_toutpad is
begin
  pci0 : if level = pci33 generate
    pci_5 : if voltage = x50v generate
      op : OBUFT generic map (drive => strength, IOSTANDARD => "PCI33_5")
                 port map (O => pad, I => i, T => en);
    end generate;
    pci_3 : if voltage /= x50v generate
      op : OBUFT generic map (drive => strength, IOSTANDARD => "PCI33_3")
                 port map (O => pad, I => i, T => en);
    end generate;
  end generate;
  ttl0 : if level = ttl generate
    slow0 : if slew = 0 generate
      op : OBUFT generic map (drive => strength, IOSTANDARD => "LVTTL")
                 port map (O => pad, I => i, T => en);
    end generate;
    fast0 : if slew /= 0 generate
      op : OBUFT generic map (drive => strength, IOSTANDARD => "LVTTL", SLEW => "FAST")
                 port map (O => pad, I => i, T => en);
    end generate;
  end generate;
  cmos0 : if level = cmos generate
    slow0 : if slew = 0 generate
      op : OBUFT generic map (drive => strength, IOSTANDARD => "LVCMOS33")
                 port map (O => pad, I => i, T => en);
    end generate;
    fast0 : if slew /= 0 generate
      op : OBUFT generic map (drive => strength, IOSTANDARD => "LVCMOS33", SLEW => "FAST")
                 port map (O => pad, I => i, T => en);
    end generate;
  end generate;
  gen0 : if (level /= pci33) and (level /= ttl) and (level /= cmos) generate
    op : OBUFT port map (O => pad, I => i, T => en);
  end generate;
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;
library unisim;
use unisim.vcomponents.all;

entity virtex_clkpad is
  generic (level : integer := 0; voltage : integer := x33v; arch : integer := 0);
  port (pad : in std_ulogic; o : out std_ulogic);
end; 
architecture rtl of virtex_clkpad is
signal gnd, ol : std_ulogic;
begin
  gnd <= '0';
  g0 : if arch = 0 generate
    pci0 : if level = pci33 generate
      pci_5 : if voltage = x50v generate
        ip : IBUFG generic map (IOSTANDARD => "PCI33_5") port map (O => o, I => pad);
      end generate;
      pci_3 : if voltage /= x50v generate
        ip : IBUFG generic map (IOSTANDARD => "PCI33_3") port map (O => o, I => pad);
      end generate;
    end generate;
    ttl0 : if level = ttl generate
      ip : IBUFG generic map (IOSTANDARD => "LVTTL") port map (O => o, I => pad);
    end generate;
    cmos0 : if level = cmos generate
      ip : IBUFG generic map (IOSTANDARD => "LVCMOS33") port map (O => o, I => pad);
    end generate;
    gen0 : if (level /= pci33) and (level /= ttl) and (level /= cmos) generate
      ip : IBUFG port map (O => o, I => pad);
    end generate;
  end generate;
  g1 : if arch = 1 generate
    pci0 : if level = pci33 generate
      pci_5 : if voltage = x50v generate
        ip : IBUF generic map (IOSTANDARD => "PCI33_5") port map (O => ol, I => pad);
        bf : BUFGMUX port map (O => o, I0 => ol, I1 => gnd, S => gnd);
      end generate;
      pci_3 : if voltage /= x50v generate
        ip : IBUF generic map (IOSTANDARD => "PCI33_3") port map (O => ol, I => pad);
        bf : BUFGMUX port map (O => o, I0 => ol, I1 => gnd, S => gnd);
      end generate;
    end generate;
    ttl0 : if level = ttl generate
      ip : IBUF generic map (IOSTANDARD => "LVTTL") port map (O => ol, I => pad);
      bf : BUFGMUX port map (O => o, I0 => ol, I1 => gnd, S => gnd);
    end generate;
    cmos0 : if level = cmos generate
      ip : IBUF generic map (IOSTANDARD => "LVCMOS33") port map (O => ol, I => pad);
      bf : BUFGMUX port map (O => o, I0 => ol, I1 => gnd, S => gnd);
    end generate;
    gen0 : if (level /= pci33) and (level /= ttl) and (level /= cmos) generate
      ip : IBUF port map (O => ol, I => pad);
      bf : BUFGMUX port map (O => o, I0 => ol, I1 => gnd, S => gnd);
    end generate;
  end generate;
end;

