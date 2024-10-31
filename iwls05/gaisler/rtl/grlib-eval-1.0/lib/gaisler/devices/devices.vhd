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
-- Description:	Vendor and devices id's for amba plug&play
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
-- pragma translate_off
use std.textio.all;
-- pragma translate_on

package devices is

-- Vendor code

  constant VENDOR_GAISLER   : amba_vendor_type := 16#01#;

-- Gaisler Research device id's

  constant GAISLER_LEON3     : amba_device_type := 16#003#;
  constant GAISLER_LEON3DSU  : amba_device_type := 16#004#;
  constant GAISLER_ETHAHB    : amba_device_type := 16#005#;
  constant GAISLER_APBMST    : amba_device_type := 16#006#;
  constant GAISLER_AHBUART   : amba_device_type := 16#007#;
  constant GAISLER_SRCTRL    : amba_device_type := 16#008#;
  constant GAISLER_SDCTRL    : amba_device_type := 16#009#;
  constant GAISLER_APBUART   : amba_device_type := 16#00C#;
  constant GAISLER_IRQMP     : amba_device_type := 16#00D#;
  constant GAISLER_AHBRAM    : amba_device_type := 16#00E#;
  constant GAISLER_GPTIMER   : amba_device_type := 16#011#;
  constant GAISLER_PCITRG    : amba_device_type := 16#012#;
  constant GAISLER_PCISBRG   : amba_device_type := 16#013#;
  constant GAISLER_PCIFBRG   : amba_device_type := 16#014#;
  constant GAISLER_PCITRACE  : amba_device_type := 16#015#;
  constant GAISLER_DMACTRL   : amba_device_type := 16#016#;
  constant GAISLER_AHBTRACE  : amba_device_type := 16#017#;
  constant GAISLER_DSUCTRL   : amba_device_type := 16#018#;
  constant GAISLER_CANAHB    : amba_device_type := 16#019#;
  constant GAISLER_GPIO      : amba_device_type := 16#01A#;
  constant GAISLER_AHBROM    : amba_device_type := 16#01B#;
  constant GAISLER_AHBJTAG   : amba_device_type := 16#01C#;  

  constant GAISLER_NUHOSP3   : amba_device_type := 16#02B#;

  
  constant GAISLER_GRTM      : amba_device_type := 16#030#;
  constant GAISLER_GRTC      : amba_device_type := 16#031#;
  constant GAISLER_GRPW      : amba_device_type := 16#032#;
  constant GAISLER_GRCTM     : amba_device_type := 16#033#;

  constant GAISLER_AHBMST_EM : amba_device_type := 16#040#;
  constant GAISLER_AHBSLV_EM : amba_device_type := 16#041#;

  constant GAISLER_FTAHBRAM  : amba_device_type := 16#050#;
  constant GAISLER_FTSRCTRL  : amba_device_type := 16#051#;
  constant GAISLER_AHBSTAT   : amba_device_type := 16#052#;
  
-- pragma translate_off

  constant GAISLER_DESC : vendor_description :=  "Gaisler Research        ";

  constant gaisler_device_table : device_table_type := (
   GAISLER_LEON3     => "Leon3 SPARC V8 Processor       ",
   GAISLER_LEON3DSU  => "Leon3 Debug Support Unit       ",
   GAISLER_ETHAHB    => "OC ethernet AHB interface      ",
   GAISLER_AHBRAM    => "Generic AHB SRAM module        ",
   GAISLER_APBMST    => "AHB/APB Bridge                 ",
   GAISLER_AHBUART   => "AHB Debug UART                 ",
   GAISLER_SRCTRL    => "Simple SRAM Controller         ",
   GAISLER_SDCTRL    => "PC133 SDRAM Controller         ",
   GAISLER_APBUART   => "Generic UART                   ",
   GAISLER_IRQMP     => "Multi-processor Interrupt Ctrl.",
   GAISLER_GPTIMER   => "Modular Timer Unit             ",
   GAISLER_PCITRG    => "Simple 32-bit PCI Target       ",
   GAISLER_PCISBRG   => "Simple 32-bit PCI Bridge       ",
   GAISLER_PCIFBRG   => "Fast 32-bit PCI Bridge         ",
   GAISLER_PCITRACE  => "32-bit PCI Trace Buffer        ",
   GAISLER_DMACTRL   => "AMBA DMA controller            ",
   GAISLER_AHBTRACE  => "AMBA Trace Buffer              ",
   GAISLER_DSUCTRL   => "DSU/ETH controller             ",
   GAISLER_GRTM      => "CCSDS Telemetry Encoder        ",
   GAISLER_GRTC      => "CCSDS Telecommand Decoder      ",
   GAISLER_GRPW      => "PacketWire to AMBA AHB I/F     ",
   GAISLER_GRCTM     => "CCSDS Time Manager             ",
   GAISLER_AHBMST_EM => "AMBA Master Emulator           ",
   GAISLER_AHBSLV_EM => "AMBA Slave Emulator            ",
   GAISLER_CANAHB    => "OC CAN AHB interface           ",
   GAISLER_GPIO      => "General Purpose I/O port       ",
   GAISLER_AHBROM    => "Generic AHB ROM                ",
   GAISLER_NUHOSP3   => "Nuhorizons Spartan3 IO I/F     ",
   GAISLER_FTAHBRAM  => "Generic FT AHB SRAM module     ",
   GAISLER_FTSRCTRL  => "Simple FT SRAM Controller      ",
   GAISLER_AHBSTAT   => "AHB Status Register            ",
   GAISLER_AHBJTAG   => "JTAG Debug Link                ",  
   others            => "Unknown Device                 ");

   constant gaisler_lib : vendor_library_type := (
     vendorid 	     => VENDOR_GAISLER,
     vendordesc      => GAISLER_DESC,
     device_table    => gaisler_device_table
   );

-- pragma translate_on

end;
