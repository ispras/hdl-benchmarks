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
-- Package: 	vcomponents
-- File:	vcomponents.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Description:	Component declartions of some XILINX primitives
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package vcomponents is
  component ramb4_s16 port (
    do   : out std_logic_vector (15 downto 0);
    addr : in  std_logic_vector (7 downto 0);
    clk  : in  std_ulogic;
    di   : in  std_logic_vector (15 downto 0);
    en, rst, we : in std_ulogic);
  end component;
  component RAMB4_S8
  port (do   : out std_logic_vector (7 downto 0);
        addr : in  std_logic_vector (8 downto 0);
        clk  : in  std_ulogic;
        di   : in  std_logic_vector (7 downto 0);
        en, rst, we : in std_ulogic);
  end component;
  component RAMB4_S4
  port (do   : out std_logic_vector (3 downto 0);
        addr : in  std_logic_vector (9 downto 0);
        clk  : in  std_ulogic;
        di   : in  std_logic_vector (3 downto 0);
        en, rst, we : in std_ulogic);
  end component;
  component RAMB4_S2
  port (do   : out std_logic_vector (1 downto 0);
        addr : in  std_logic_vector (10 downto 0);
        clk  : in  std_ulogic;
        di   : in  std_logic_vector (1 downto 0);
        en, rst, we : in std_ulogic);
  end component;
  component RAMB4_S1
  port (do   : out std_logic_vector (0 downto 0);
        addr : in  std_logic_vector (11 downto 0);
        clk  : in  std_ulogic;
        di   : in  std_logic_vector (0 downto 0);
        en, rst, we : in std_ulogic);
  end component;
  component RAMB4_S1_S1
  port (
        doa    : out std_logic_vector (0 downto 0);
        dob    : out std_logic_vector (0 downto 0);
	addra  : in  std_logic_vector (11 downto 0);
	addrb  : in  std_logic_vector (11 downto 0);
	clka   : in  std_ulogic;
	clkb   : in  std_ulogic;
	dia    : in  std_logic_vector (0 downto 0);
	dib    : in  std_logic_vector (0 downto 0);
	ena    : in  std_ulogic;
	enb    : in  std_ulogic;
	rsta   : in  std_ulogic;
	rstb   : in  std_ulogic;
	wea    : in  std_ulogic;
	web    : in  std_ulogic
       );
  end component;
  component RAMB4_S2_S2
  port (
        doa    : out std_logic_vector (1 downto 0);
        dob    : out std_logic_vector (1 downto 0);
	addra  : in  std_logic_vector (10 downto 0);
	addrb  : in  std_logic_vector (10 downto 0);
	clka   : in  std_ulogic;
	clkb   : in  std_ulogic;
	dia    : in  std_logic_vector (1 downto 0);
	dib    : in  std_logic_vector (1 downto 0);
	ena    : in  std_ulogic;
	enb    : in  std_ulogic;
	rsta   : in  std_ulogic;
	rstb   : in  std_ulogic;
	wea    : in  std_ulogic;
	web    : in  std_ulogic
       );
  end component;
  component RAMB4_S4_S4
  port (
        doa    : out std_logic_vector (3 downto 0);
        dob    : out std_logic_vector (3 downto 0);
	addra  : in  std_logic_vector (9 downto 0);
	addrb  : in  std_logic_vector (9 downto 0);
	clka   : in  std_ulogic;
	clkb   : in  std_ulogic;
	dia    : in  std_logic_vector (3 downto 0);
	dib    : in  std_logic_vector (3 downto 0);
	ena    : in  std_ulogic;
	enb    : in  std_ulogic;
	rsta   : in  std_ulogic;
	rstb   : in  std_ulogic;
	wea    : in  std_ulogic;
	web    : in  std_ulogic
       );
  end component;
  component RAMB4_S8_S8
  port (
        doa    : out std_logic_vector (7 downto 0);
        dob    : out std_logic_vector (7 downto 0);
	addra  : in  std_logic_vector (8 downto 0);
	addrb  : in  std_logic_vector (8 downto 0);
	clka   : in  std_ulogic;
	clkb   : in  std_ulogic;
	dia    : in  std_logic_vector (7 downto 0);
	dib    : in  std_logic_vector (7 downto 0);
	ena    : in  std_ulogic;
	enb    : in  std_ulogic;
	rsta   : in  std_ulogic;
	rstb   : in  std_ulogic;
	wea    : in  std_ulogic;
	web    : in  std_ulogic
       );
  end component;
  component RAMB4_S16_S16
  port (
        doa    : out std_logic_vector (15 downto 0);
        dob    : out std_logic_vector (15 downto 0);
	addra  : in  std_logic_vector (7 downto 0);
	addrb  : in  std_logic_vector (7 downto 0);
	clka   : in  std_ulogic;
	clkb   : in  std_ulogic;
	dia    : in  std_logic_vector (15 downto 0);
	dib    : in  std_logic_vector (15 downto 0);
	ena    : in  std_ulogic;
	enb    : in  std_ulogic;
	rsta   : in  std_ulogic;
	rstb   : in  std_ulogic;
	wea    : in  std_ulogic;
	web    : in  std_ulogic
       );
  end component;

  component RAMB16_S1
  port (
    DO : out std_logic_vector (0 downto 0);
    ADDR : in std_logic_vector (13 downto 0);
    CLK : in std_ulogic;
    DI : in std_logic_vector (0 downto 0);
    EN : in std_ulogic;
    SSR : in std_ulogic;
    WE : in std_ulogic
  );
end component;

  component RAMB16_S2
 port (
   DO : out std_logic_vector (1 downto 0);
   ADDR : in std_logic_vector (12 downto 0);
   CLK : in std_ulogic;
   DI : in std_logic_vector (1 downto 0);
   EN : in std_ulogic;
   SSR : in std_ulogic;
   WE : in std_ulogic
 );
  end component;

  component RAMB16_S4
 port (
   DO : out std_logic_vector (3 downto 0);
   ADDR : in std_logic_vector (11 downto 0);
   CLK : in std_ulogic;
   DI : in std_logic_vector (3 downto 0);
   EN : in std_ulogic;
   SSR : in std_ulogic;
   WE : in std_ulogic
 );
  end component;

  component RAMB16_S9
 port (
   DO : out std_logic_vector (7 downto 0);
   DOP : out std_logic_vector (0 downto 0);
   ADDR : in std_logic_vector (10 downto 0);
   CLK : in std_ulogic;
   DI : in std_logic_vector (7 downto 0);
   DIP : in std_logic_vector (0 downto 0);
   EN : in std_ulogic;
   SSR : in std_ulogic;
   WE : in std_ulogic
 );
  end component;

  component RAMB16_S18
  port (
    DO : out std_logic_vector (15 downto 0);
    DOP : out std_logic_vector (1 downto 0);
    ADDR : in std_logic_vector (9 downto 0);
    CLK : in std_ulogic;
    DI : in std_logic_vector (15 downto 0);
    DIP : in std_logic_vector (1 downto 0);
    EN : in std_ulogic;
    SSR : in std_ulogic;
    WE : in std_ulogic
  );
  end component;

  component RAMB16_S36
 port (
   DO : out std_logic_vector (31 downto 0);
   DOP : out std_logic_vector (3 downto 0);
   ADDR : in std_logic_vector (8 downto 0);
   CLK : in std_ulogic;
   DI : in std_logic_vector (31 downto 0);
   DIP : in std_logic_vector (3 downto 0);
   EN : in std_ulogic;
   SSR : in std_ulogic;
   WE : in std_ulogic
 );
end component;

  component RAMB16_S4_S4
 port (
   DOA : out std_logic_vector (3 downto 0);
   DOB : out std_logic_vector (3 downto 0);
   ADDRA : in std_logic_vector (11 downto 0);
   ADDRB : in std_logic_vector (11 downto 0);
   CLKA : in std_ulogic;
   CLKB : in std_ulogic;
   DIA : in std_logic_vector (3 downto 0);
   DIB : in std_logic_vector (3 downto 0);
   ENA : in std_ulogic;
   ENB : in std_ulogic;
   SSRA : in std_ulogic;
   SSRB : in std_ulogic;
   WEA : in std_ulogic;
   WEB : in std_ulogic
 );
  end component;

  component RAMB16_S1_S1
 port (
   DOA : out std_logic_vector (0 downto 0);
   DOB : out std_logic_vector (0 downto 0);
   ADDRA : in std_logic_vector (13 downto 0);
   ADDRB : in std_logic_vector (13 downto 0);
   CLKA : in std_ulogic;
   CLKB : in std_ulogic;
   DIA : in std_logic_vector (0 downto 0);
   DIB : in std_logic_vector (0 downto 0);
   ENA : in std_ulogic;
   ENB : in std_ulogic;
   SSRA : in std_ulogic;
   SSRB : in std_ulogic;
   WEA : in std_ulogic;
   WEB : in std_ulogic
 );
  end component;

  component RAMB16_S2_S2
 port (
   DOA : out std_logic_vector (1 downto 0);
   DOB : out std_logic_vector (1 downto 0);
   ADDRA : in std_logic_vector (12 downto 0);
   ADDRB : in std_logic_vector (12 downto 0);
   CLKA : in std_ulogic;
   CLKB : in std_ulogic;
   DIA : in std_logic_vector (1 downto 0);
   DIB : in std_logic_vector (1 downto 0);
   ENA : in std_ulogic;
   ENB : in std_ulogic;
   SSRA : in std_ulogic;
   SSRB : in std_ulogic;
   WEA : in std_ulogic;
   WEB : in std_ulogic
 );
  end component;

  component RAMB16_S9_S9
 port (
   DOA : out std_logic_vector (7 downto 0);
   DOB : out std_logic_vector (7 downto 0);
   DOPA : out std_logic_vector (0 downto 0);
   DOPB : out std_logic_vector (0 downto 0);
   ADDRA : in std_logic_vector (10 downto 0);
   ADDRB : in std_logic_vector (10 downto 0);
   CLKA : in std_ulogic;
   CLKB : in std_ulogic;
   DIA : in std_logic_vector (7 downto 0);
   DIB : in std_logic_vector (7 downto 0);
   DIPA : in std_logic_vector (0 downto 0);
   DIPB : in std_logic_vector (0 downto 0);
   ENA : in std_ulogic;
   ENB : in std_ulogic;
   SSRA : in std_ulogic;
   SSRB : in std_ulogic;
   WEA : in std_ulogic;
   WEB : in std_ulogic
 );
end component;

  component RAMB16_S18_S18
  port (
    DOA : out std_logic_vector (15 downto 0);
    DOB : out std_logic_vector (15 downto 0);
    DOPA : out std_logic_vector (1 downto 0);
    DOPB : out std_logic_vector (1 downto 0);
    ADDRA : in std_logic_vector (9 downto 0);
    ADDRB : in std_logic_vector (9 downto 0);
    CLKA : in std_ulogic;
    CLKB : in std_ulogic;
    DIA : in std_logic_vector (15 downto 0);
    DIB : in std_logic_vector (15 downto 0);
    DIPA : in std_logic_vector (1 downto 0);
    DIPB : in std_logic_vector (1 downto 0);
    ENA : in std_ulogic;
    ENB : in std_ulogic;
    SSRA : in std_ulogic;
    SSRB : in std_ulogic;
    WEA : in std_ulogic;
    WEB : in std_ulogic);
  end component;

  component RAMB16_S36_S36
  port (
    DOA : out std_logic_vector (31 downto 0);
    DOB : out std_logic_vector (31 downto 0);
    DOPA : out std_logic_vector (3 downto 0);
    DOPB : out std_logic_vector (3 downto 0);
    ADDRA : in std_logic_vector (8 downto 0);
    ADDRB : in std_logic_vector (8 downto 0);
    CLKA : in std_ulogic;
    CLKB : in std_ulogic;
    DIA : in std_logic_vector (31 downto 0);
    DIB : in std_logic_vector (31 downto 0);
    DIPA : in std_logic_vector (3 downto 0);
    DIPB : in std_logic_vector (3 downto 0);
    ENA : in std_ulogic;
    ENB : in std_ulogic;
    SSRA : in std_ulogic;
    SSRB : in std_ulogic;
    WEA : in std_ulogic;
    WEB : in std_ulogic);
  end component;

  component DCM
    generic (
      CLKFX_MULTIPLY : integer := 1 ;
      CLKFX_DIVIDE : integer := 1
    );
    port (
      CLKFB    : in  std_logic;
      CLKIN    : in  std_logic;
      DSSEN    : in  std_logic;
      PSCLK    : in  std_logic;
      PSEN     : in  std_logic;
      PSINCDEC : in  std_logic;
      RST      : in  std_logic;
      CLK0     : out std_logic;
      CLK90    : out std_logic;
      CLK180   : out std_logic;
      CLK270   : out std_logic;
      CLK2X    : out std_logic;
      CLK2X180 : out std_logic;
      CLKDV    : out std_logic;
      CLKFX    : out std_logic;
      CLKFX180 : out std_logic;
      LOCKED   : out std_logic;
      PSDONE   : out std_logic;
      STATUS   : out std_logic_vector (7 downto 0));
  end component;

  component BUFGMUX port (O : out std_logic; I0, I1, S : in std_logic); end component;
  component BUFG port (O : out std_logic; I : in std_logic); end component;
  component BUFGP port (O : out std_logic; I : in std_logic); end component;
  component BUFGDLL port (O : out std_logic; I : in std_logic); end component;

  component IBUFG  generic(
      CAPACITANCE : string := "DONT_CARE"; IOSTANDARD : string := "LVCMOS25");
    port (O : out std_logic; I : in std_logic); end component;
  component IBUF generic(
      CAPACITANCE : string := "DONT_CARE"; IOSTANDARD : string := "LVCMOS25");
    port (O : out std_ulogic; I : in std_ulogic); end component;
  component IOBUF generic (
      CAPACITANCE : string := "DONT_CARE"; DRIVE : integer := 12;
      IOSTANDARD  : string := "LVCMOS25"; SLEW : string := "SLOW");
    port (O : out std_ulogic; IO : inout std_logic; I, T : in std_ulogic); end component;
  component OBUF generic (
      CAPACITANCE : string := "DONT_CARE"; DRIVE : integer := 12;
      IOSTANDARD  : string := "LVCMOS25"; SLEW : string := "SLOW");
    port (O : out std_ulogic; I : in std_ulogic); end component;
  component OBUFT generic (
      CAPACITANCE : string := "DONT_CARE"; DRIVE : integer := 12;
      IOSTANDARD  : string := "LVCMOS25"; SLEW : string := "SLOW");
    port (O : out std_ulogic; I, T : in std_ulogic); end component;

  component CLKDLL
    port (
      CLK0    : out std_ulogic;
      CLK180  : out std_ulogic;
      CLK270  : out std_ulogic;
      CLK2X   : out std_ulogic;
      CLK90   : out std_ulogic;
      CLKDV   : out std_ulogic;
      LOCKED  : out std_ulogic;
      CLKFB   : in  std_ulogic;
      CLKIN   : in  std_ulogic;
      RST     : in  std_ulogic);
  end component;

  component BSCAN_VIRTEX2
      port (CAPTURE : out STD_ULOGIC;
            DRCK1 : out STD_ULOGIC;
            DRCK2 : out STD_ULOGIC;
            RESET : out STD_ULOGIC;
            SEL1 : out STD_ULOGIC;
            SEL2 : out STD_ULOGIC;
            SHIFT : out STD_ULOGIC;
            TDI : out STD_ULOGIC;
            UPDATE : out STD_ULOGIC;
            TDO1 : in STD_ULOGIC;
            TDO2 : in STD_ULOGIC);
  end component;

  component BSCAN_SPARTAN3
     port (CAPTURE : out STD_ULOGIC;
           DRCK1 : out STD_ULOGIC;
           DRCK2 : out STD_ULOGIC;
           RESET : out STD_ULOGIC;
           SEL1 : out STD_ULOGIC;
           SEL2 : out STD_ULOGIC;
           SHIFT : out STD_ULOGIC;
           TDI : out STD_ULOGIC;
           UPDATE : out STD_ULOGIC;
           TDO1 : in STD_ULOGIC;
           TDO2 : in STD_ULOGIC);
  end component;
  
end;

