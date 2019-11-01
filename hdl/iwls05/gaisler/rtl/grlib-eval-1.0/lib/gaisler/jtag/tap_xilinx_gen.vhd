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
-- Description: Xilinx TAP controllers wrappers
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.vcomponents.all;

entity virtex2_tap is
port (
     tapi_tdo1   : in std_ulogic;
     tapi_tdo2   : in std_ulogic;
     tapo_tck    : out std_ulogic;
     tapo_tdi    : out std_ulogic;
     tapo_rst    : out std_ulogic;
     tapo_capt   : out std_ulogic;
     tapo_shft   : out std_ulogic;
     tapo_upd    : out std_ulogic;
     tapo_xsel1  : out std_ulogic;
     tapo_xsel2  : out std_ulogic
    );
end;

architecture rtl of virtex2_tap is

  signal drck1, drck2, sel1, sel2 : std_ulogic;

begin  
  
  u0 : BSCAN_VIRTEX2
    port map (CAPTURE => tapo_capt,
              DRCK1 => drck1,
              DRCK2 => drck2,
              RESET => tapo_rst,
              SEL1 => sel1,
              SEL2 => sel2,
              SHIFT => tapo_shft,
              TDI => tapo_tdi,
              UPDATE => tapo_upd,
              TDO1 => tapi_tdo1,
              TDO2 => tapi_tdo2);
  tapo_tck <= drck1 when sel1 = '1' else drck2;
  tapo_xsel1 <= sel1; tapo_xsel2 <= sel2; 
end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.vcomponents.all;

entity spartan3_tap is
port (
     tapi_tdo1   : in std_ulogic;
     tapi_tdo2   : in std_ulogic;
     tapo_tck    : out std_ulogic;
     tapo_tdi    : out std_ulogic;
     tapo_rst    : out std_ulogic;
     tapo_capt   : out std_ulogic;
     tapo_shft   : out std_ulogic;
     tapo_upd    : out std_ulogic;
     tapo_xsel1  : out std_ulogic;
     tapo_xsel2  : out std_ulogic
    );
end;

architecture rtl of spartan3_tap is

  signal drck1, drck2, sel1, sel2 : std_ulogic;
begin
  
  u0 : BSCAN_SPARTAN3
    port map (CAPTURE => tapo_capt,
              DRCK1 => drck1,
              DRCK2 => drck2,
              RESET => tapo_rst,
              SEL1 => sel1,
              SEL2 => sel2,
              SHIFT => tapo_shft,
              TDI => tapo_tdi,
              UPDATE => tapo_upd,
              TDO1 => tapi_tdo1,
              TDO2 => tapi_tdo2);
  tapo_tck <=  drck1 when sel1 = '1' else drck2;
  tapo_xsel1 <= sel1; tapo_xsel2 <= sel2; 
end;
