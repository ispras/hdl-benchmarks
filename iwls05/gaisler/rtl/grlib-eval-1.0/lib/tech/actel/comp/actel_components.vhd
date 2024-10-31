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
-- Package: 	actel_components
-- File:	actel_components.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Description:	Actel RAM and pad component declarations
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package actel_components is

-- Proasic & Proasicplus rams

  component RAM256x9SST port(
    DO8, DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0 : out std_logic;
    WPE, RPE, DOS : out std_logic;
    WADDR7, WADDR6, WADDR5, WADDR4, WADDR3, WADDR2, WADDR1, WADDR0 : in std_logic;
    RADDR7, RADDR6, RADDR5, RADDR4, RADDR3, RADDR2, RADDR1, RADDR0 : in std_logic;
    WCLKS, RCLKS : in std_logic;
    DI8, DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0 : in std_logic;
    WRB, RDB, WBLKB, RBLKB, PARODD, DIS : in std_logic);
  end component;

-- Axcellerator rams

  component RAM64K36 
-- pragma translate_off
    generic (abits : integer := 16);
-- pragma translate_on
    port(
    WRAD0, WRAD1, WRAD2, WRAD3, WRAD4, WRAD5, WRAD6, WRAD7, WRAD8, WRAD9, WRAD10,
    WRAD11, WRAD12, WRAD13, WRAD14, WRAD15, WD0, WD1, WD2, WD3, WD4, WD5, WD6,
    WD7, WD8, WD9, WD10, WD11, WD12, WD13, WD14, WD15, WD16, WD17, WD18, WD19,
    WD20, WD21, WD22, WD23, WD24, WD25, WD26, WD27, WD28, WD29, WD30, WD31, WD32,
    WD33, WD34, WD35, WEN, DEPTH0, DEPTH1, DEPTH2, DEPTH3, WW0, WW1, WW2, WCLK,
    RDAD0, RDAD1, RDAD2, RDAD3, RDAD4, RDAD5, RDAD6, RDAD7, RDAD8, RDAD9, RDAD10,
    RDAD11, RDAD12, RDAD13, RDAD14, RDAD15, REN, RW0, RW1, RW2, RCLK : in std_logic;
    RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8, RD9, RD10, RD11, RD12, RD13,
    RD14, RD15, RD16, RD17, RD18, RD19, RD20, RD21, RD22, RD23, RD24, RD25, RD26,
    RD27, RD28, RD29, RD30, RD31, RD32, RD33, RD34, RD35 : out std_logic);
  end component;

  attribute syn_black_box : boolean;
  attribute syn_black_box of RAM64K36 : component is true;
  attribute syn_tco1 : string;
  attribute syn_tco2 : string;
  attribute syn_tco1 of RAM64K36 : component is
  "RCLK->RD0,RD1,RD2,RD3,RD4,RD5,RD6,RD7,RD8,RD9,RD10,RD11,RD12,RD13,RD14,RD15,RD16,RD17,RD18,RD19,RD20,RD21,RD22,RD23,RD24,RD25,RD26,RD27,RD28,RD29,RD30,RD31,RD32,RD33,RD34,RD35 = 4.0";

-- Buffers

  component hclkbuf
  port( pad : in  std_logic; y   : out std_logic); end component; 
  component clkbuf port(pad : in std_logic; y : out std_logic); end component;
  component inbuf port(pad :in std_logic; y : out std_logic); end component;
  component bibuf port( 
    d, e : in  std_logic; pad : inout std_logic; y : out std_logic);
  end component;
  component outbuf port(d : in std_logic; pad : out std_logic); end component;
  component outbuf_f_8 port(d : in std_logic; pad : out std_logic); end component;
  component outbuf_f_12 port(d : in std_logic; pad : out std_logic); end component;
  component outbuf_f_16 port(d : in std_logic; pad : out std_logic); end component;
  component outbuf_f_24 port(d : in std_logic; pad : out std_logic); end component;
  component tribuff port(d, e : in std_logic; pad : out std_logic); end component;

  component hclkbuf_pci
  port( pad : in  std_logic; y   : out std_logic); end component; 
  component clkbuf_pci port(pad : in std_logic; y : out std_logic); end component;
  component inbuf_pci port(pad :in std_logic; y : out std_logic); end component;
  attribute syn_tpd11 : string; 
  attribute syn_tpd11 of inbuf_pci : component is "pad -> y = 2.0";
  component bibuf_pci port( 
    d, e : in  std_logic; pad : inout std_logic; y : out std_logic);
  end component;
  attribute syn_tpd12 : string; 
  attribute syn_tpd12 of bibuf_pci : component is "pad -> y = 2.0";
  component outbuf_pci port(d : in std_logic; pad : out std_logic); end component;
  attribute syn_tpd13 : string; 
  attribute syn_tpd13 of outbuf_pci : component is "d -> pad = 2.0";
  component tribuff_pci port(d, e : in std_logic; pad : out std_logic); end component;
  attribute syn_tpd14 : string; 
  attribute syn_tpd14 of tribuff_pci : component is "d,e -> pad = 2.0";

-- Proasic3 rams

  component RAM4K9
-- pragma translate_off
    generic (abits : integer range 9 to 12 := 9);
-- pragma translate_on
    port(
	ADDRA0, ADDRA1, ADDRA2, ADDRA3, ADDRA4, ADDRA5, ADDRA6, ADDRA7,
	ADDRA8, ADDRA9, ADDRA10, ADDRA11 : in std_logic;
	ADDRB0, ADDRB1, ADDRB2, ADDRB3, ADDRB4, ADDRB5, ADDRB6, ADDRB7,
	ADDRB8, ADDRB9, ADDRB10, ADDRB11 : in std_logic;
	BLKA, WENA, PIPEA, WMODEA, WIDTHA0, WIDTHA1, WENB, BLKB,
	PIPEB, WMODEB, WIDTHB1, WIDTHB0 : in std_logic;
	DINA0, DINA1, DINA2, DINA3, DINA4, DINA5, DINA6, DINA7, DINA8 : in std_logic;
	DINB0, DINB1, DINB2, DINB3, DINB4, DINB5, DINB6, DINB7, DINB8 : in std_logic;
	RESET, CLKA, CLKB : in std_logic; 
	DOUTA0, DOUTA1, DOUTA2, DOUTA3, DOUTA4, DOUTA5, DOUTA6, DOUTA7, DOUTA8 : out std_logic;
	DOUTB0, DOUTB1, DOUTB2, DOUTB3, DOUTB4, DOUTB5, DOUTB6, DOUTB7, DOUTB8 : out std_logic
    );
  end component;
  attribute syn_black_box of RAM4K9: component is true;
  attribute syn_tco1 of RAM4K9 : component is
  "CLKA->DOUTA0,DOUTA1,DOUTA2,DOUTA3,DOUTA4,DOUTA5,DOUTA6,DOUTA7,DOUTA8 = 3.0";
  attribute syn_tco2 of RAM4K9 : component is
  "CLKB->DOUTB0,DOUTB1,DOUTB2,DOUTB3,DOUTB4,DOUTB5,DOUTB6,DOUTB7,DOUTB8 = 3.0";
	
  component RAM512X18
    port(
      RADDR8, RADDR7, RADDR6, RADDR5, RADDR4, RADDR3, RADDR2, RADDR1, RADDR0 : in std_logic;
      WADDR8, WADDR7, WADDR6, WADDR5, WADDR4, WADDR3, WADDR2, WADDR1, WADDR0 : in std_logic;
      WD17, WD16, WD15, WD14, WD13, WD12, WD11, WD10, WD9, 
      WD8, WD7, WD6, WD5, WD4, WD3, WD2, WD1, WD0 : in std_logic;
      REN, WEN, RESET, RW0, RW1, WW1, WW0, PIPE, RCLK, WCLK : in std_logic;
      RD17, RD16, RD15, RD14, RD13, RD12, RD11, RD10, RD9, 
      RD8, RD7, RD6, RD5, RD4, RD3, RD2, RD1, RD0 : out std_logic
    );
  end component;
  attribute syn_black_box of RAM512X18: component is true;
  attribute syn_tco1 of RAM512X18 : component is
  "RCLK->RD17,RD16,RD15,RD14,RD13,RD12,RD11,RD10,RD9,RD8,RD7,RD6,RD5,RD4,RD3,RD2,RD1,RD0 = 3.0";
end;
