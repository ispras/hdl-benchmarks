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
-- Entity:  pci_dma
-- File:  pci_dma.vhd
-- Author:  Jiri Gaisler - Gaisler Research
-- Modified:  Alf Vaerneus - Gaisler Research
-- Description: PCI master and target interface with DMA
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library gaisler;
use gaisler.memory.all;
use gaisler.devices.all;
use gaisler.pci.all;
use gaisler.pcilib.all;

entity pcidma is
  generic (
    memtech   : integer := 0;
    dmstndx   : integer := 0;
    dapbndx   : integer := 0;
    dapbaddr  : integer := 0;
    dapbmask  : integer := 16#fff#;
    blength   : integer := 16;
    mstndx    : integer := 0;
    abits     : integer := 21;
    dmaabits  : integer := 26;
    fifodepth : integer := 3; -- FIFO depth
    device_id : integer := 0; -- PCI device ID
    vendor_id : integer := 0; -- PCI vendor ID
    slvndx    : integer := 0;
    apbndx    : integer := 0;
    apbaddr   : integer := 0;
    apbmask   : integer := 16#fff#;
    haddr     : integer := 16#F00#;
    hmask     : integer := 16#F00#;
    ioaddr    : integer := 16#000#;
    nsync     : integer range 1 to 2 := 2	-- 1 or 2 sync regs between clocks
);
   port(
      rst       : in std_logic;
      clk       : in std_logic;
      pciclk    : in std_logic;
      pcii      : in  pci_in_type;
      pcio      : out pci_out_type;
      dapbo     : out apb_slv_out_type;
      dahbmo    : out ahb_mst_out_type;
      apbi      : in apb_slv_in_type;
      apbo      : out apb_slv_out_type;
      ahbmi     : in  ahb_mst_in_type;
      ahbmo     : out ahb_mst_out_type;
      ahbsi     : in  ahb_slv_in_type;
      ahbso     : out ahb_slv_out_type
);
end;

architecture rtl of pcidma is
signal ahbsi2 : ahb_slv_in_type;
signal ahbso2 : ahb_slv_out_type;

begin
      dma : dmactrl generic map (hindex => dmstndx, pindex => dapbndx, 
				 paddr => dapbaddr, blength => blength)
      port map (rst, clk, apbi, dapbo, ahbmi, dahbmo, ahbsi, ahbso, ahbsi2, ahbso2);

      pci : pci_mtf generic map (memtech => memtech, hmstndx => mstndx, dmamst => dmstndx, 
		fifodepth => fifodepth, device_id => device_id, vendor_id => vendor_id,
      		hslvndx => slvndx, pindex => apbndx, paddr => apbaddr,  
		haddr => haddr, hmask => hmask, ioaddr => ioaddr, nsync => nsync)
      port map (rst, clk, pciclk, pcii, pcio, apbi, apbo, ahbmi, ahbmo, ahbsi2, ahbso2);
end;

