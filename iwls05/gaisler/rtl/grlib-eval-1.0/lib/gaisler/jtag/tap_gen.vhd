----------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2005 GAISLER RESEARCH
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  See the file COPYING for the full details of the license.
--
-----------------------------------------------------------------------------   
-- Entity:      tap_gen
-- File:        tap_gen.vhd
-- Author:      Edvin Catovic - Gaisler Research
-- Description: JTAG Test Access Port (TAP) Controller component declaration
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.tech.all;

package libtapgen is

component tap_gen 
  generic (
    tech   : integer range 0 to NTECH  := 0;
    irlen  : integer range 2 to 8 := 2;
    idcode : integer range 0 to 255 := 9;
    id_msb : integer range 0 to 65536 := 0;
    id_lsb : integer range 0 to 65536 := 0);
  port (
    rst         : in std_ulogic;
    tck         : in std_ulogic;
    tms         : in std_ulogic;
    tdi         : in std_ulogic;
    tdo         : out std_ulogic;
    tapi_en1    : in std_ulogic;
    tapi_tdo1   : in std_ulogic;
    tapi_tdo2   : in std_ulogic;
    tapo_tck    : out std_ulogic;
    tapo_tdi    : out std_ulogic;
    tapo_inst   : out std_logic_vector(7 downto 0);
    tapo_rst    : out std_ulogic;
    tapo_capt   : out std_ulogic;
    tapo_shft   : out std_ulogic;
    tapo_upd    : out std_ulogic;
    tapo_xsel1  : out std_ulogic;
    tapo_xsel2  : out std_ulogic
    );
end component;

end;
