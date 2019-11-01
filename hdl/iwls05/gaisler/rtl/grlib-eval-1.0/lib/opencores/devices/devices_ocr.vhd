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
-- Entity: 	devices
-- File:	devices.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Description:	Opencores vendor and devices id's for amba plug&play
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
-- pragma translate_off
use std.textio.all;
-- pragma translate_on

package devices_ocr is

-- Vendor code

  constant VENDOR_OPENCORES : amba_vendor_type := 16#08#;

-- Opencores device id's

  constant OPENCORES_ETHMAC : amba_device_type := 16#005#;

-- pragma translate_off

  constant OPENCORES_DESC : vendor_description := "Opencores               ";

  constant opencores_device_table : device_table_type := (
   OPENCORES_ETHMAC => "10/100-Mbit Ethernet MAC       ",
   others           => "Unknown Device                 ");

   constant opencores_lib : vendor_library_type := (
     vendorid 	     => VENDOR_OPENCORES,
     vendordesc      => OPENCORES_DESC,
     device_table    => opencores_device_table
   );

-- pragma translate_on

end;
