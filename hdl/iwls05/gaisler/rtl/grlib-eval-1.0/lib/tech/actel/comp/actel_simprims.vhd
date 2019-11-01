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
-- Package: 	actel_simprims
-- File:	actel_simprims.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Description:	Simple simulation models for ACTEL RAM and pads
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM256x9SST is
    port(
  DO8, DO7, DO6, DO5, DO4, DO3, DO2, DO1, DO0 : out std_ulogic;
  WPE, RPE, DOS : out std_ulogic;
  WADDR7, WADDR6, WADDR5, WADDR4, WADDR3, WADDR2, WADDR1, WADDR0 : in std_ulogic;
  RADDR7, RADDR6, RADDR5, RADDR4, RADDR3, RADDR2, RADDR1, RADDR0 : in std_ulogic;
  WCLKS, RCLKS : in std_ulogic;
  DI8, DI7, DI6, DI5, DI4, DI3, DI2, DI1, DI0 : in std_ulogic;
  WRB, RDB, WBLKB, RBLKB, PARODD, DIS : in std_ulogic);
end;

architecture rtl of RAM256x9SST is
  signal d, q : std_logic_vector(8 downto 0);
  signal wa, ra : std_logic_vector(7 downto 0);
  signal wen, ren : std_ulogic;
  type dregtype is array (0 to 2**8 - 1) 
	of std_logic_vector(8 downto 0);

begin
  wen <= not (WBLKB or WRB); ren <= not (RBLKB or RDB);
  wa  <= WADDR7 & WADDR6 & WADDR5 & WADDR4 & WADDR3 & WADDR2 & WADDR1 & WADDR0;
  ra  <= RADDR7 & RADDR6 & RADDR5 & RADDR4 & RADDR3 & RADDR2 & RADDR1 & RADDR0;
  d   <= DI8 & DI7 & DI6 & DI5 & DI4 & DI3 & DI2 & DI1 & DI0;

  rp : process(WCLKS, RCLKS)
  variable rfd : dregtype;
  begin
    if rising_edge(RCLKS) then
      if (ren = '1') and not is_x(ra) then
   	q <= rfd(to_integer(unsigned(ra))); 
      end if;
    end if;
    if rising_edge(WCLKS) then
      if (wen = '1') and not is_x(wa) then
   	rfd(to_integer(unsigned(wa))) := d; 
      end if;
    end if;
  end process;

  DO8 <= q(8); DO7 <= q(7); DO6 <= q(6); DO5 <= q(5); DO4 <= q(4);
  DO3 <= q(3); DO2 <= q(2); DO1 <= q(1); DO0 <= q(0);
  
end;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM64K36 is generic (abits : integer := 16); port(
  WRAD0, WRAD1, WRAD2, WRAD3, WRAD4, WRAD5, WRAD6, WRAD7, WRAD8, WRAD9, WRAD10,
  WRAD11, WRAD12, WRAD13, WRAD14, WRAD15, WD0, WD1, WD2, WD3, WD4, WD5, WD6,
  WD7, WD8, WD9, WD10, WD11, WD12, WD13, WD14, WD15, WD16, WD17, WD18, WD19,
  WD20, WD21, WD22, WD23, WD24, WD25, WD26, WD27, WD28, WD29, WD30, WD31, WD32,
  WD33, WD34, WD35, WEN, DEPTH0, DEPTH1, DEPTH2, DEPTH3, WW0, WW1, WW2, WCLK,
  RDAD0, RDAD1, RDAD2, RDAD3, RDAD4, RDAD5, RDAD6, RDAD7, RDAD8, RDAD9, RDAD10,
  RDAD11, RDAD12, RDAD13, RDAD14, RDAD15, REN, RW0, RW1, RW2, RCLK : in std_ulogic;
  RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7, RD8, RD9, RD10, RD11, RD12, RD13,
  RD14, RD15, RD16, RD17, RD18, RD19, RD20, RD21, RD22, RD23, RD24, RD25, RD26,
  RD27, RD28, RD29, RD30, RD31, RD32, RD33, RD34, RD35 : out std_ulogic);
end;

architecture rtl of RAM64K36 is
  signal re : std_ulogic;
begin

  rp : process(RCLK, WCLK)
  constant words : integer := 2**abits;
  subtype word is std_logic_vector(35 downto 0);
  type dregtype is array (0 to words - 1) of word;
  variable rfd : dregtype;
  variable wa, ra : std_logic_vector(15 downto 0);
  variable q : std_logic_vector(35 downto 0);
  begin
    if rising_edge(RCLK) then
      ra := RDAD15 & RDAD14 & RDAD13 & RDAD12 & RDAD11 & RDAD10 & RDAD9 &
            RDAD8 & RDAD7 & RDAD6 & RDAD5 & RDAD4 & RDAD3 & RDAD2 & RDAD1 & RDAD0;
      if not (is_x (ra)) and REN = '1' then 
        q := rfd(to_integer(unsigned(ra)) mod words);
      else q := (others => 'X'); end if;
    end if;
    if rising_edge(WCLK) and (wen = '1') then
      wa := WRAD15 & WRAD14 & WRAD13 & WRAD12 & WRAD11 & WRAD10 & WRAD9 &
            WRAD8 & WRAD7 & WRAD6 & WRAD5 & WRAD4 & WRAD3 & WRAD2 & WRAD1 & WRAD0;
      if not is_x (wa) then 
   	rfd(to_integer(unsigned(wa)) mod words) :=
          WD35 & WD34 & WD33 & WD32 & WD31 & WD30 & WD29 & WD28 & WD27 &
	  WD26 & WD25 & WD24 & WD23 & WD22 & WD21 & WD20 & WD19 & WD18 &
	  WD17 & WD16 & WD15 & WD14 & WD13 & WD12 & WD11 & WD10 & WD9 &
	  WD8 & WD7 & WD6 & WD5 & WD4 & WD3 & WD2 & WD1 & WD0;
      end if;
    end if;
    RD35 <= q(35); RD34 <= q(34); RD33 <= q(33); RD32 <= q(32); RD31 <= q(31);
    RD30 <= q(30); RD29 <= q(29); RD28 <= q(28); RD27 <= q(27); RD26 <= q(26);
    RD25 <= q(25); RD24 <= q(24); RD23 <= q(23); RD22 <= q(22); RD21 <= q(21);
    RD20 <= q(20); RD19 <= q(19); RD18 <= q(18); RD17 <= q(17); RD16 <= q(16);
    RD15 <= q(15); RD14 <= q(14); RD13 <= q(13); RD12 <= q(12); RD11 <= q(11);
    RD10 <= q(10); RD9 <= q(9); RD8 <= q(8); RD7 <= q(7); RD6 <= q(6);
    RD5 <= q(5); RD4 <= q(4); RD3 <= q(3); RD2 <= q(2); RD1 <= q(1);
    RD0 <= q(0);
  end process;
end;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM4K9 is generic (abits : integer range 9 to 12 := 9);
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
end ;

architecture sim of RAM4K9 is
  type dwarrtype is array (9 to 12) of integer;
  constant dwarr : dwarrtype := (9, 4, 2, 1);
  constant dwidth : integer := dwarr(abits);
  subtype memword is std_logic_vector(dwidth-1 downto 0);
  type memtype is array (0 to 2**abits-1) of memword;
begin
  p1 : process(CLKA, CLKB, RESET)
  variable mem : memtype;
  variable ra, rb : std_logic_vector(11 downto 0);
  variable da, db : std_logic_vector(8 downto 0);
  variable qa, qb : std_logic_vector(8 downto 0);
  variable qal, qbl : std_logic_vector(8 downto 0);
  variable qao, qbo : std_logic_vector(8 downto 0);
  begin
   if rising_edge(CLKA) then
     ra := ADDRA11 & ADDRA10 & ADDRA9 & ADDRA8 & ADDRA7 & ADDRA6 & ADDRA5 &
	ADDRA4 & ADDRA3 & ADDRA2 & ADDRA1 & ADDRA0;
     da := DINA8 & DINA7 & DINA6 & DINA5 & DINA4 & DINA3 & DINA2 & 
	DINA1 & DINA0;
      if BLKA = '0' then 
        if not (is_x (ra(abits-1 downto 0))) then 
          qa(dwidth-1 downto 0) := mem(to_integer(unsigned(ra(abits-1 downto 0))));
        else qa := (others => 'X'); end if;
	if WENA = '0' and not (is_x (ra(abits-1 downto 0))) then
	  mem(to_integer(unsigned(ra(abits-1 downto 0)))) := da(dwidth-1 downto 0);
	  if WMODEA = '1' then qa := da(dwidth-1 downto 0); end if;
        end if;
      elsif is_x(BLKA) then qa := (others => 'X'); end if;
      if PIPEA = '1' then qao := qal; else qao := qa; end if;
      qal := qa;
   end if;
   if reset = '0' then qao := (others => '0'); end if;
   (DOUTA8, DOUTA7, DOUTA6, DOUTA5, DOUTA4, DOUTA3, DOUTA2, 
	DOUTA1, DOUTA0) <= qao;
   if rising_edge(CLKB) then
     rb := ADDRB11 & ADDRB10 & ADDRB9 & ADDRB8 & ADDRB7 & ADDRB6 & ADDRB5 &
	ADDRB4 & ADDRB3 & ADDRB2 & ADDRB1 & ADDRB0;
     db := DINB8 & DINB7 & DINB6 & DINB5 & DINB4 & DINB3 & DINB2 & 
	DINB1 & DINB0;
      if BLKB = '0' then 
        if not (is_x (rb(abits-1 downto 0))) then 
          qb(dwidth-1 downto 0) := mem(to_integer(unsigned(rb(abits-1 downto 0))));
        else qb := (others => 'X'); end if;
	if WENB = '0' and not (is_x (rb(abits-1 downto 0))) then
	  mem(to_integer(unsigned(rb(abits-1 downto 0)))) := db(dwidth-1 downto 0);
	  if WMODEB = '1' then qb := db(dwidth-1 downto 0); end if;
        end if;
      elsif is_x(BLKB) then qb := (others => 'X'); end if;
      if PIPEB = '1' then qbo := qbl; else qbo := qb; end if;
      qbl := qb;
   end if;
   if reset = '0' then qbo := (others => '0'); end if;
   (DOUTB8, DOUTB7, DOUTB6, DOUTB5, DOUTB4, DOUTB3, DOUTB2, 
	DOUTB1, DOUTB0) <= qbo;
  end process;
end;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM512X18 is 
    port(
      RADDR8, RADDR7, RADDR6, RADDR5, RADDR4, RADDR3, RADDR2, RADDR1, RADDR0 : in std_logic;
      WADDR8, WADDR7, WADDR6, WADDR5, WADDR4, WADDR3, WADDR2, WADDR1, WADDR0 : in std_logic;
      WD17, WD16, WD15, WD14, WD13, WD12, WD11, WD10, WD9, 
      WD8, WD7, WD6, WD5, WD4, WD3, WD2, WD1, WD0 : in std_logic;
      REN, WEN, RESET, RW0, RW1, WW1, WW0, PIPE, RCLK, WCLK : in std_logic;
      RD17, RD16, RD15, RD14, RD13, RD12, RD11, RD10, RD9, 
      RD8, RD7, RD6, RD5, RD4, RD3, RD2, RD1, RD0 : out std_logic
    );
end ;

architecture sim of RAM512X18 is
  constant abits : integer := 8;
  constant dwidth : integer := 18;
  subtype memword is std_logic_vector(dwidth-1 downto 0);
  type memtype is array (0 to 2**abits-1) of memword;
begin
  p1 : process(RCLK, WCLK, RESET)
  variable mem : memtype;
  variable ra, rb  : std_logic_vector(8 downto 0);
  variable da  : std_logic_vector(17 downto 0);
  variable qb  : std_logic_vector(17 downto 0);
  variable qbl : std_logic_vector(17 downto 0);
  variable qbo : std_logic_vector(17 downto 0);
  begin
   if rising_edge(WCLK) then
     ra :=  '0' & WADDR7 & WADDR6 & WADDR5 &
	WADDR4 & WADDR3 & WADDR2 & WADDR1 & WADDR0;
     da := WD17 & WD16 & WD15 & WD14 & WD13 & WD12 & WD11 & 
	Wd10 & WD9 & WD8 & WD7 & WD6 & WD5 & WD4 & WD3 & WD2 & 
	WD1 & WD0;
     if WEN = '0' and not (is_x (ra(abits-1 downto 0))) then
       mem(to_integer(unsigned(ra(abits-1 downto 0)))) := da(dwidth-1 downto 0);
     end if;
   end if;
   if rising_edge(RCLK) then
     rb :=  '0' & RADDR7 & RADDR6 & RADDR5 &
	RADDR4 & RADDR3 & RADDR2 & RADDR1 & RADDR0;
      if REN = '0' then 
        if not (is_x (rb(abits-1 downto 0))) then 
          qb := mem(to_integer(unsigned(rb(abits-1 downto 0))));
        else qb := (others => 'X'); end if;
      elsif is_x(REN) then qb := (others => 'X'); end if;
      if PIPE = '1' then qbo := qbl; else qbo := qb; end if;
      qbl := qb;
   end if;
   if RESET = '0' then qbo := (others => '0'); end if;
   (RD17, RD16, RD15, RD14, RD13, RD12, RD11, RD10, RD9,
      RD8, RD7, RD6, RD5, RD4, RD3, RD2, RD1, RD0) <= qbo;
  end process;
end;

-- PCI PADS ----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity hclkbuf_pci is port( pad : in  std_logic; y   : out std_logic); end; 
architecture struct of hclkbuf_pci is begin y <= to_X01(pad); end;

library ieee;
use ieee.std_logic_1164.all;
entity clkbuf_pci is port( pad : in  std_logic; y   : out std_logic); end; 
architecture struct of clkbuf_pci is begin y <= to_X01(pad); end;

library ieee;
use ieee.std_logic_1164.all;
entity inbuf_pci is port( pad : in  std_logic; y   : out std_logic); end; 
architecture struct of inbuf_pci is begin y <= to_X01(pad) after 2 ns; end;

library ieee;
use ieee.std_logic_1164.all;
entity bibuf_pci is port
  (d, e : in  std_logic; pad : inout std_logic; y : out std_logic);
end; 
architecture struct of bibuf_pci is begin 
  y <= to_X01(pad) after 2 ns;
  pad <= d after 5 ns when to_X01(e) = '1' else
	 'Z' after 5 ns when to_X01(e) = '0' else 'X' after 5 ns;
end;

library ieee;
use ieee.std_logic_1164.all;
entity tribuff_pci is port (d, e : in  std_logic; pad : out std_logic ); end; 
architecture struct of tribuff_pci is begin 
  pad <= d after 5 ns when to_X01(e) = '1' else
	 'Z' after 5 ns when to_X01(e) = '0' else 'X' after 5 ns;
end;

library ieee;
use ieee.std_logic_1164.all;
entity outbuf_pci is port (d : in  std_logic; pad : out std_logic ); end; 
architecture struct of outbuf_pci is begin pad <= d after 5 ns; end;

-- STANDARD PADS ----------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
entity clkbuf is port( pad : in  std_logic; y   : out std_logic); end; 
architecture struct of clkbuf is begin y <= to_X01(pad); end;

library ieee;
use ieee.std_logic_1164.all;
entity hclkbuf is port( pad : in  std_logic; y   : out std_logic); end; 
architecture struct of hclkbuf is begin y <= to_X01(pad); end;

library ieee;
use ieee.std_logic_1164.all;
entity inbuf is port( pad : in  std_logic; y   : out std_logic); end; 
architecture struct of inbuf is begin y <= to_X01(pad) after 1 ns; end;

library ieee;
use ieee.std_logic_1164.all;
entity bibuf is port
  (d, e : in  std_logic; pad : inout std_logic; y : out std_logic);
end; 
architecture struct of bibuf is begin 
  y <= to_X01(pad) after 2 ns;
  pad <= d after 2 ns when to_X01(e) = '1' else
	 'Z' after 2 ns when to_X01(e) = '0' else 'X' after 2 ns;
end;

library ieee;
use ieee.std_logic_1164.all;
entity tribuff is port (d, e : in  std_logic; pad : out std_logic ); end; 
architecture struct of tribuff is begin 
  pad <= d after 2 ns when to_X01(e) = '1' else
	 'Z' after 2 ns when to_X01(e) = '0' else 'X' after 2 ns;
end;

library ieee;
use ieee.std_logic_1164.all;
entity outbuf is port (d : in  std_logic; pad : out std_logic ); end; 
architecture struct of outbuf is begin pad <= d after 2 ns; end;

library ieee;
use ieee.std_logic_1164.all;
entity outbuf_f_8 is port (d : in  std_logic; pad : out std_logic ); end; 
architecture struct of outbuf_f_8 is begin pad <= d after 2 ns; end;

library ieee;
use ieee.std_logic_1164.all;
entity outbuf_f_12 is port (d : in  std_logic; pad : out std_logic ); end; 
architecture struct of outbuf_f_12 is begin pad <= d after 2 ns; end;

library ieee;
use ieee.std_logic_1164.all;
entity outbuf_f_16 is port (d : in  std_logic; pad : out std_logic ); end; 
architecture struct of outbuf_f_16 is begin pad <= d after 2 ns; end;

library ieee;
use ieee.std_logic_1164.all;
entity outbuf_f_24 is port (d : in  std_logic; pad : out std_logic ); end; 
architecture struct of outbuf_f_24 is begin pad <= d after 2 ns; end;
