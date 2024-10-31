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
-- Entity:      tap
-- File:        tap.vhd
-- Author:      Edvin Catovic - Gaisler Research
-- Description: TAP controller technology wrapper
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.stdlib.all;
use grlib.tech.all;
library gaisler;
use gaisler.libtapgen.all;
use gaisler.tap_xilinx.all;

entity tap is
  generic (
    tech   : integer := 0;    
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
    tapo_tck    : out std_ulogic;
    tapo_tdi    : out std_ulogic;
    tapo_inst   : out std_logic_vector(7 downto 0);
    tapo_rst    : out std_ulogic;
    tapo_capt   : out std_ulogic;
    tapo_shft   : out std_ulogic;
    tapo_upd    : out std_ulogic;
    tapo_xsel1  : out std_ulogic;
    tapo_xsel2  : out std_ulogic;
    tapi_en1    : in std_ulogic;
    tapi_tdo1   : in std_ulogic;
    tapi_tdo2   : in std_ulogic
    );
end;


architecture rtl of tap is

begin
  
   xc2v : if tech = virtex2 generate
     u0 : virtex2_tap port map (tapi_tdo1, tapi_tdo1, tapo_tck, tapo_tdi, tapo_rst,   
                                tapo_capt, tapo_shft, tapo_upd, tapo_xsel1, tapo_xsel2);
   end generate;

   xc3s : if tech = spartan3 generate  
     u0 : spartan3_tap port map (tapi_tdo1, tapi_tdo1, tapo_tck, tapo_tdi, tapo_rst,   
                                tapo_capt, tapo_shft, tapo_upd, tapo_xsel1, tapo_xsel2);
   end generate;
  
   inf : if (tech /= virtex2) and (tech /= spartan3) generate
      u0 : tap_gen generic map (tech => tech, irlen => irlen, 
                                id_msb => id_msb, id_lsb => id_lsb, idcode => idcode)
        port map (rst, tck, tms, tdi, tdo, tapi_en1, tapi_tdo1, tapi_tdo2, tapo_tck,
                  tapo_tdi, tapo_inst, tapo_rst, tapo_capt, tapo_shft, tapo_upd, tapo_xsel1,
                  tapo_xsel2);
   end generate;
  
end;  
