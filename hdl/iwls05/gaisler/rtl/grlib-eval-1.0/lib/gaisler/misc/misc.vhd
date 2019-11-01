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
-- Package: 	misc
-- File:	misc.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Misc models
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library grlib;
use grlib.amba.all;
library gaisler;
use gaisler.devices.all;

package misc is

-- reset generator with filter

  component rstgen
  generic (acthigh : integer := 0);
  port (
    rstin     : in  std_ulogic;
    clk       : in  std_ulogic;
    clklock   : in  std_ulogic;
    rstout    : out std_ulogic;
    rstoutraw : out std_ulogic);
  end component;

  type gptimer_in_type is record
    dhalt    : std_ulogic;
    extclk   : std_ulogic;
  end record;

  type gptimer_out_type is record
    tick     : std_logic_vector(1 to 7);
  end record;

  component gptimer
  generic (
    pindex   : integer := 0;
    paddr    : integer := 0;
    pmask    : integer := 16#fff#;
    pirq     : integer := 0;
    sepirq   : integer := 0;	-- use separate interrupts for each timer
    sbits    : integer := 16;			-- scaler bits
    ntimers  : integer range 1 to 7 := 1; 	-- number of timers
    nbits    : integer := 32			-- timer bits
  );
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    gpti   : in gptimer_in_type;
    gpto   : out gptimer_out_type
  );
  end component;

-- clock generator

type clkgen_in_type is record
  pllref  : std_logic;			-- optional reference for PLL
  pllrst  : std_logic;			-- optional reset for PLL
  pllctrl : std_logic_vector(1 downto 0);  -- optional control for PLL
end record;

type clkgen_out_type is record
  clklock : std_logic;
  pcilock : std_logic;
end record;

component clkgen 
  generic (
    tech     : integer := 2; 
    clk_mul  : integer := 1; 
    clk_div  : integer := 1;
    sdramen  : integer := 0;
    sdinvclk : integer := 0;
    pcien    : integer := 0;
    pcidll   : integer := 0;
    pcisysclk: integer := 0;
    freq     : integer := 25000);
port (
    clkin   : in  std_logic;
    pciclkin: in  std_logic;
    clk     : out std_logic;			-- main clock
    clkn    : out std_logic;			-- inverted main clock
    clk2x   : out std_logic;			-- inverted main clock
    sdclk   : out std_logic;			-- SDRAM clock
    pciclk  : out std_logic;			-- PCI clock
    cgi     : in clkgen_in_type;
    cgo     : out clkgen_out_type
);
end component;

-- 32-bit ram with AHB interface

  component ahbram
  generic (
    hindex  : integer := 0;
    haddr   : integer := 0;
    hmask   : integer := 16#fff#;
    tech    : integer := 0; 
    kbytes  : integer := 1); 
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    ahbsi  : in  ahb_slv_in_type;
    ahbso  : out ahb_slv_out_type);
  end component;

  type ahbram_out_type is record
    ce : std_ulogic; 
  end record;
  
  component ftahbram is
    generic (
      hindex    : integer := 0;
      haddr     : integer := 0;
      hmask     : integer := 16#fff#;
      tech      : integer := 0; 
      kbytes    : integer := 1;
      pindex    : integer := 0;
      paddr     : integer := 0;
      pmask     : integer := 16#fff#;
      edacen    : integer := 0;
      autoscrub : integer := 0; 
      errcnten  : integer := 0;
      cntbits   : integer range 1 to 8 := 1);
    port (
      rst     : in  std_ulogic;
      clk     : in  std_ulogic;
      ahbsi   : in  ahb_slv_in_type;
      ahbso   : out ahb_slv_out_type;
      apbi    : in  apb_slv_in_type;
      apbo    : out apb_slv_out_type;
      aramo   : out ahbram_out_type
    );
  end component;

  component ahbtrace is
  generic (
    hindex  : integer := 0;
    ioaddr    : integer := 16#000#;
    iomask    : integer := 16#E00#;
    tech    : integer := 0; 
    irq     : integer := 0; 
    kbytes  : integer := 1); 
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    ahbmi  : in  ahb_mst_in_type;
    ahbsi  : in  ahb_slv_in_type;
    ahbso  : out ahb_slv_out_type
  );
  end component; 

type ahb_dma_in_type is record
  address         : std_logic_vector(31 downto 0);
  wdata           : std_logic_vector(31 downto 0);
  start           : std_ulogic;
  burst           : std_ulogic;
  write           : std_ulogic;
  busy            : std_ulogic;
  irq             : std_ulogic;
  size            : std_logic_vector(1 downto 0);
end record;

type ahb_dma_out_type is record
  start           : std_ulogic;
  active          : std_ulogic;
  ready           : std_ulogic;
  retry           : std_ulogic;
  mexc            : std_ulogic;
  haddr           : std_logic_vector(9 downto 0);
  rdata           : std_logic_vector(31 downto 0);
end record;

  component ahbmst
  generic (
    hindex  : integer := 0;
    hirq    : integer := 0;
    venid   : integer := VENDOR_GAISLER;
    devid   : integer := 0;
    version : integer := 0;
    chprot  : integer := 3;
    incaddr : integer := 0); 
   port (
      rst  : in  std_ulogic;
      clk  : in  std_ulogic;
      dmai : in ahb_dma_in_type;
      dmao : out ahb_dma_out_type;
      ahbi : in  ahb_mst_in_type;
      ahbo : out ahb_mst_out_type 
      );
  end component;

  type gpio_in_type is record
    din      : std_logic_vector(31 downto 0);
  end record;

  type gpio_out_type is record
    dout     : std_logic_vector(31 downto 0);
    oen      : std_logic_vector(31 downto 0);
  end record;

 component grgpio
  generic (
    pindex   : integer := 0;
    paddr    : integer := 0;
    pmask    : integer := 16#fff#;
    imask    : integer := 16#0000#;
    nbits    : integer := 16;			-- GPIO bits
    oepol    : integer := 0                     -- Output enable polarity
  );
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    apbi   : in  apb_slv_in_type;
    apbo   : out apb_slv_out_type;
    gpioi  : in  gpio_in_type;
    gpioo  : out gpio_out_type
  );
  end component;

  type ahbstat_in_type is record
    cerror : std_logic_vector(0 to NAHBSLV-1);
  end record; 
  
  component ahbstat is
    generic(
      pindex : integer := 0;
      paddr  : integer := 0;
      pmask  : integer := 16#FFF#;
      pirq   : integer := 0;
      nftslv : integer range 1 to NAHBSLV - 1 := 3);
    port(
      rst   : in std_ulogic;
      clk   : in std_ulogic;
      ahbmi : in ahb_mst_in_type;
      ahbsi : in ahb_slv_in_type;
      stati : in ahbstat_in_type;
      apbi  : in apb_slv_in_type;
      apbo  : out apb_slv_out_type
    );
  end component;

  type nuhosp3_in_type is record
    flash_d	: std_logic_vector(15 downto 0);
    smsc_data 	: std_logic_vector(31 downto 0);
    smsc_ardy  	: std_ulogic;
    smsc_intr  	: std_ulogic;
    smsc_nldev 	: std_ulogic;
    lcd_data 	: std_logic_vector(7 downto 0);
  end record;

  type nuhosp3_out_type is record
    flash_a 	: std_logic_vector(20 downto 0);
    flash_d	: std_logic_vector(15 downto 0);
    flash_oen  	: std_ulogic;
    flash_wen 	: std_ulogic;
    flash_cen  	: std_ulogic;
    smsc_addr 	: std_logic_vector(14 downto 0);
    smsc_data 	: std_logic_vector(31 downto 0);
    smsc_nbe  	: std_logic_vector(3 downto 0);
    smsc_resetn	: std_ulogic;
    smsc_nrd   	: std_ulogic;
    smsc_nwr   	: std_ulogic;
    smsc_ncs   	: std_ulogic;
    smsc_aen   	: std_ulogic;
    smsc_lclk  	: std_ulogic;
    smsc_wnr   	: std_ulogic;
    smsc_rdyrtn	: std_ulogic;
    smsc_cycle 	: std_ulogic;
    smsc_nads  	: std_ulogic;
    smsc_ben   	: std_ulogic;
    lcd_data 	: std_logic_vector(7 downto 0);
    lcd_rs	: std_ulogic;
    lcd_rw	: std_ulogic;
    lcd_en	: std_ulogic;
    lcd_backl	: std_ulogic;
    lcd_ben	: std_ulogic;
  end record;

  component nuhosp3
  generic (
    hindex  : integer := 0;
    haddr   : integer := 0;
    hmask   : integer := 16#fff#); 
  port (
    rst    : in  std_ulogic;
    clk    : in  std_ulogic;
    ahbsi  : in  ahb_slv_in_type;
    ahbso  : out ahb_slv_out_type;
    nui    : in  nuhosp3_in_type;
    nuo    : out nuhosp3_out_type
  );
  end component;

end;
