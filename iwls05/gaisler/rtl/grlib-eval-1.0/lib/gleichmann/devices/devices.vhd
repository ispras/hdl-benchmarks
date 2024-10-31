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
-- Entity:  devices
-- File:    devices.vhd
-- Author:  Jiri Gaisler, Gaisler Research
-- Description: Vendor and devices id's for amba plug&play
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
-- pragma translate_off
use std.textio.all;
-- pragma translate_on

package devices_ge is

-- Vendor code

  constant VENDOR_GLEICHMANN : amba_vendor_type := 16#10#;

-- Gleichmann's device id's
  constant GLEICHMANN_CUSTOM   : amba_device_type := 16#001#;
  constant GLEICHMANN_GEOLCD01 : amba_device_type := 16#002#;
  constant GLEICHMANN_DAC      : amba_device_type := 16#003#;

-- pragma translate_off

  constant GLEICHMANN_DESC : vendor_description := "Gleichmann Electronics  ";

  constant gleichmann_device_table : device_table_type := (
    GLEICHMANN_CUSTOM   => "Custom device                  ",
    GLEICHMANN_GEOLCD01 => "GEOLCD01 graphics system       ",
    GLEICHMANN_DAC      => "Sigma delta DAC                ",
    others              => "Unknown Device                 ");

  constant gleichmann_lib : vendor_library_type := (
    vendorid     => VENDOR_GLEICHMANN,
    vendordesc   => GLEICHMANN_DESC,
    device_table => gleichmann_device_table
    );

-- pragma translate_on

end;
