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
----------------------------------------------------------------------------
-- Package: 	pad_ihp25
-- File:	pad_ihp25.vhd
-- Author:	Marko Isomaki - Gaisler Research
-- Description:	IHP 0.25um specific pads
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package pad_ihp25 is
  component ihp25_inpad
    generic(level : integer := 0; voltage : integer := 0);
    port (pad : in std_logic; o : out std_logic);
  end component; 

  component ihp25_iopad
    generic (level : integer := 0; slew : integer := 0;
             voltage : integer := 0; strength : integer := 0);
    port (pad : inout std_logic; i, en : in std_logic; o : out std_logic);
  end component;
  
  component ihp25_outpad
    generic (level : integer := 0; slew : integer := 0;
             voltage : integer := 0; strength : integer := 0);
    port (pad : out  std_logic; i : in  std_logic);
  end component; 

  component ihp25_toutpad 
    generic (level : integer := 0; slew : integer := 0;
	     voltage : integer := 0; strength : integer := 0);
    port (pad : out std_ulogic; i, en : in std_logic);
  end component;

  component ihp25_clkpad 
    generic (level : integer := 0; voltage : integer := 0);
    port (pad : in std_ulogic; o : out std_ulogic);
  end component; 
end;
