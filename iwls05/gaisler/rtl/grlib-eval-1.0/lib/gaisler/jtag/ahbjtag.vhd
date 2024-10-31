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
-- Entity:      ahbjtag
-- File:        ahbjtag.vhd
-- Author:      Edvin Catovic, Jiri Gaisler - Gaisler Research
-- Description: JTAG communication link with AHB master interface
------------------------------------------------------------------------------  

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.tech.all;
library gaisler;
use gaisler.devices.all;
use gaisler.misc.all;
use gaisler.libjtagcom.all;
use gaisler.jtag.all;

entity ahbjtag is
  generic (
    tech    : integer range 0 to NTECH := 0;
    hindex  : integer := 0;
    nsync : integer range 1 to 2 := 1;
    idcode : integer range 0 to 255 := 9;    
    id_msb : integer range 0 to 65536 := 0;
    id_lsb : integer range 0 to 65536 := 0;
    ainst   : integer range 0 to 255 := 2;
    dinst   : integer range 0 to 255 := 3);
  port (
    rst         : in  std_ulogic;
    clk         : in  std_ulogic;
    tck         : in  std_ulogic;
    tms         : in  std_ulogic;
    tdi         : in  std_ulogic;
    tdo         : out std_ulogic;     
    ahbi        : in  ahb_mst_in_type;
    ahbo        : out ahb_mst_out_type;
    tapo_tck    : out std_ulogic;
    tapo_tdi    : out std_ulogic;
    tapo_inst   : out std_logic_vector(7 downto 0);
    tapo_rst    : out std_ulogic;
    tapo_capt   : out std_ulogic;
    tapo_shft   : out std_ulogic;
    tapo_upd    : out std_ulogic;    
    tapi_tdo    : in std_ulogic
    );
end;      

architecture struct of ahbjtag is

  
constant REVISION : integer := 0;

signal dmai : ahb_dma_in_type;
signal dmao : ahb_dma_out_type;
signal ltapi : tap_in_type;
signal ltapo : tap_out_type;

begin
  
  ahbmst0 : ahbmst 
    generic map (hindex => hindex, venid => VENDOR_GAISLER, devid => GAISLER_AHBJTAG)
    port map (rst, clk, dmai, dmao, ahbi, ahbo);

  tap0 : tap generic map (tech => tech, irlen => 6, idcode => idcode, id_lsb => id_lsb,
                          id_msb => id_msb)
    port map (rst, tck, tms, tdi, tdo, ltapo.tck, ltapo.tdi, ltapo.inst, ltapo.reset, ltapo.capt,  
              ltapo.shift, ltapo.upd, ltapo.asel, ltapo.dsel, ltapi.en, ltapi.tdo, tapi_tdo);
  
  jtagcom0 : jtagcom generic map (tech => tech, nsync => nsync, ainst => ainst, dinst => dinst)
    port map (rst, clk, ltapo, ltapi, dmao, dmai);

  tapo_tck <= ltapo.tck; tapo_tdi <= ltapo.tdi; tapo_inst <= ltapo.inst;  
  tapo_rst <= ltapo.reset; tapo_capt <= ltapo.capt; tapo_shft <= ltapo.shift; 
  tapo_upd <= ltapo.upd;  

  
-- pragma translate_off
    bootmsg : report_version 
    generic map ("ahbjtag AHB Debug JTAG rev " & tost(REVISION));
-- pragma translate_on

end;
