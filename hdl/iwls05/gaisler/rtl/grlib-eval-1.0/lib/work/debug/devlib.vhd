-----------------------------------------------------------------------------
-- Entity: 	devices
-- File:	devices.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Description:	Vendor and devices id's for amba plug&play
------------------------------------------------------------------------------

use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
library grlib; use grlib.amba.all;

library gaisler;    use gaisler.devices.all;
library esa;        use esa.devices_esa.all;
library opencores;  use opencores.devices_ocr.all;
library openchip;   use openchip.devices_ocp.all;
library gleichmann; use gleichmann.devices_ge.all;

package devlib is

  constant UNKNOWN_DESC : vendor_description :=  "Unknown vendor          ";

  constant unknown_device_table : device_table_type := (
   others              => "Unknown Device                 ");

   constant unknown_lib : vendor_library_type := (
     vendorid 	       => 0,
     vendordesc        => UNKNOWN_DESC,
     device_table      => unknown_device_table
   );

  constant iptable : device_array := (
    VENDOR_GAISLER     => gaisler_lib,
    VENDOR_ESA         => esa_lib,
    VENDOR_OPENCORES   => opencores_lib,
    VENDOR_OPENCHIP    => openchip_lib,
    VENDOR_GLEICHMANN  => gleichmann_lib,
    others             => unknown_lib);

end;
