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
-- Entity: 	various
-- File:	mem_actel_gen.vhd
-- Author:	Jiri Gaisler Gaisler Research
-- Description:	Memory generators for Actel rams
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library actel;
use actel.actel_components.all;

entity axcel_ssram is
  generic (abits : integer := 16; dbits : integer := 36);
  port (
    wa, ra       : in  std_logic_vector(15 downto 0);
    wclk, rclk   : in  std_ulogic;
    di           : in  std_logic_vector(dbits -1 downto 0);
    do           : out std_logic_vector(dbits -1 downto 0);
    width        : in  std_logic_vector(2 downto 0);
    ren, wen     : in  std_ulogic
   ); 
end;

architecture rtl of axcel_ssram is
signal gnd : std_ulogic;
signal depth : std_logic_vector(4 downto 0);
signal d, q : std_logic_vector(36 downto 0);
begin
  depth <= "00000";
  do <= q(dbits-1 downto 0);
  d(dbits-1 downto 0) <= di;
  d(36 downto dbits) <= (others => '0');
    u0 : RAM64K36
-- pragma translate_off
    generic map (abits => abits) 
-- pragma translate_on
    port map (
      WRAD0 => wa(0), WRAD1 => wa(1), WRAD2 => wa(2), WRAD3 => wa(3),
      WRAD4 => wa(4), WRAD5 => wa(5), WRAD6 => wa(6), WRAD7 => wa(7),
      WRAD8 => wa(8), WRAD9 => wa(9), WRAD10 => wa(10), WRAD11 => wa(11),
      WRAD12 => wa(12), WRAD13 => wa(13), WRAD14 => wa(14), WRAD15 => wa(15),
      WD0 => d(0), WD1 => d(1), WD2 => d(2), WD3 => d(3), WD4 => d(4),
      WD5 => d(5), WD6 => d(6), WD7 => d(7), WD8 => d(8), WD9 => d(9),
      WD10 => d(10), WD11 => d(11), WD12 => d(12), WD13 => d(13), WD14 => d(14),
      WD15 => d(15), WD16 => d(16), WD17 => d(17), WD18 => d(18), WD19 => d(19),
      WD20 => d(20), WD21 => d(21), WD22 => d(22), WD23 => d(23), WD24 => d(24),
      WD25 => d(25), WD26 => d(26), WD27 => d(27), WD28 => d(28), WD29 => d(29),
      WD30 => d(30), WD31 => d(31), WD32 => d(32), WD33 => d(33), WD34 => d(34),
      WD35 => d(35), WEN => wen, DEPTH0 => depth(0),
      DEPTH1 => depth(1), DEPTH2 => depth(2), DEPTH3 => depth(3),
      WW0 => width(0), WW1 => width(1), WW2 => width(2), WCLK => wclk,
      RDAD0 => ra(0), RDAD1 => ra(1), RDAD2 => ra(2), RDAD3 => ra(3),
      RDAD4 => ra(4), RDAD5 => ra(5), RDAD6 => ra(6), RDAD7 => ra(7),
      RDAD8 => ra(8), RDAD9 => ra(9), RDAD10 => ra(10), RDAD11 => ra(11),
      RDAD12 => ra(12), RDAD13 => ra(13), RDAD14 => ra(14), RDAD15 => ra(15),
      REN => ren, RW0 => width(0), RW1 => width(1), RW2 => width(2),
      RCLK => rclk,
      RD0 => q(0), RD1 => q(1), RD2 => q(2), RD3 => q(3), RD4 => q(4),
      RD5 => q(5), RD6 => q(6), RD7 => q(7), RD8 => q(8), RD9 => q(9),
      RD10 => q(10), RD11 => q(11), RD12 => q(12), RD13 => q(13), RD14 => q(14),
      RD15 => q(15), RD16 => q(16), RD17 => q(17), RD18 => q(18), RD19 => q(19),
      RD20 => q(20), RD21 => q(21), RD22 => q(22), RD23 => q(23), RD24 => q(24),
      RD25 => q(25), RD26 => q(26), RD27 => q(27), RD28 => q(28), RD29 => q(29),
      RD30 => q(30), RD31 => q(31), RD32 => q(32), RD33 => q(33), RD34 => q(34),
      RD35 => q(35));

  d(dbits -1 downto 0) <= di;
  do <= q(dbits -1 downto 0);
end;

library ieee;
use ieee.std_logic_1164.all;
library actel;
use actel.actel_components.all;

entity proasic3_ram4k9 is
  generic (abits : integer range 9 to 12 := 9; dbits : integer := 9);
  port (
    addra, addrb : in  std_logic_vector(abits -1 downto 0);
    clka, clkb   : in  std_ulogic;
    dia, dib     : in  std_logic_vector(dbits -1 downto 0);
    doa, dob     : out std_logic_vector(dbits -1 downto 0);
    ena, enb     : in  std_ulogic;
    wea, web     : in  std_ulogic
   ); 
end;

architecture rtl of proasic3_ram4k9 is
signal gnd, vcc : std_ulogic;
signal aa, ab : std_logic_vector(13 downto 0);
signal da, db : std_logic_vector(9 downto 0);
signal qa, qb : std_logic_vector(9 downto 0);
signal width : std_logic_vector(1 downto 0);
begin
  gnd <= '0'; vcc <= '1';
  width <= "11" when abits = 9 else "10" when abits = 10 else
           "01" when abits = 11 else "00";
  doa <= qa(dbits-1 downto 0); dob <= qb(dbits-1 downto 0);
  da(dbits-1 downto 0) <= dia; da(9 downto dbits) <= (others => '0');
  db(dbits-1 downto 0) <= dib; db(9 downto dbits) <= (others => '0');
  aa(abits-1 downto 0) <= addra; aa(13 downto abits) <= (others => '0');
  ab(abits-1 downto 0) <= addrb; ab(13 downto abits) <= (others => '0');
    u0 : RAM4K9
-- pragma translate_off
    generic map (abits => abits) 
-- pragma translate_on
    port map (
      ADDRA0 => aa(0), ADDRA1 => aa(1), ADDRA2 => aa(2), ADDRA3 => aa(3),
      ADDRA4 => aa(4), ADDRA5 => aa(5), ADDRA6 => aa(6), ADDRA7 => aa(7),
      ADDRA8 => aa(8), ADDRA9 => aa(9), ADDRA10 => aa(10), ADDRA11 => aa(11),
      ADDRB0 => ab(0), ADDRB1 => ab(1), ADDRB2 => ab(2), ADDRB3 => ab(3),
      ADDRB4 => ab(4), ADDRB5 => ab(5), ADDRB6 => ab(6), ADDRB7 => ab(7),
      ADDRB8 => ab(8), ADDRB9 => ab(9), ADDRB10 => ab(10), ADDRB11 => ab(11),
      BLKA => ena, WENA => wea, PIPEA =>gnd, WMODEA => gnd, WIDTHA0 => width(0), WIDTHA1 => width(1), 
      BLKB => enb, WENB => web, PIPEB =>gnd, WMODEB => gnd, WIDTHB0 => width(0), WIDTHB1 => width(1), 
      DINA0 => da(0), DINA1 => da(1), DINA2 => da(2), DINA3 => da(3), DINA4 => da(4),
      DINA5 => da(5), DINA6 => da(6), DINA7 => da(7), DINA8 => da(8),
      DINB0 => db(0), DINB1 => db(1), DINB2 => db(2), DINB3 => db(3), DINB4 => db(4),
      DINB5 => db(5), DINB6 => db(6), DINB7 => db(7), DINB8 => db(8),
      RESET => vcc, CLKA => clka, CLKB => clkb,
      DOUTA0 => qa(0), DOUTA1 => qa(1), DOUTA2 => qa(2), DOUTA3 => qa(3), DOUTA4 => qa(4),
      DOUTA5 => qa(5), DOUTA6 => qa(6), DOUTA7 => qa(7), DOUTA8 => qa(8),
      DOUTB0 => qb(0), DOUTB1 => qb(1), DOUTB2 => qb(2), DOUTB3 => qb(3), DOUTB4 => qb(4),
      DOUTB5 => qb(5), DOUTB6 => qb(6), DOUTB7 => qb(7), DOUTB8 => qb(8)
      );
end;

library ieee;
use ieee.std_logic_1164.all;
library actel;
use actel.actel_components.all;

entity proasic3_ram512x18 is
  port (
    addra, addrb : in  std_logic_vector(8 downto 0);
    clka, clkb   : in  std_ulogic;
    di           : in  std_logic_vector(17 downto 0);
    do           : out std_logic_vector(17 downto 0);
    ena, enb     : in  std_ulogic;
    wea          : in  std_ulogic
   ); 
end;

architecture rtl of proasic3_ram512x18 is
signal gnd, vcc : std_ulogic;
signal width : std_logic_vector(1 downto 0);
begin
  gnd <= '0'; vcc <= '1';
  width <= "10";
    u0 : RAM512X18
    port map (
      RADDR0 => addrb(0), RADDR1 => addrb(1), RADDR2 => addrb(2), RADDR3 => addrb(3),
      RADDR4 => addrb(4), RADDR5 => addrb(5), RADDR6 => addrb(6), RADDR7 => addrb(7),
      RADDR8 => addrb(8),
      WADDR0 => addra(0), WADDR1 => addra(1), WADDR2 => addra(2), WADDR3 => addra(3),
      WADDR4 => addra(4), WADDR5 => addra(5), WADDR6 => addra(6), WADDR7 => addra(7),
      WADDR8 => addra(8),
      WD17 => di(17), WD16 => di(16), WD15 => di(15), WD14 => di(14), WD13 => di(13),
      WD12 => di(12), WD11 => di(11), WD10 => di(10), WD9 => di(9),
      WD8 => di(8), WD7 => di(7), WD6 => di(6), WD5 => di(5), WD4 => di(4),
      WD3 => di(3), WD2 => di(2), WD1 => di(1), WD0 => di(0),
      WEN => ena, PIPE => gnd, WW0 => width(0), WW1 => width(1), 
      REN => enb, RW0 => width(0), RW1 => width(1), 
      RESET => vcc, WCLK => clka, RCLK => clkb,
      RD17 => do(17), RD16 => do(16), RD15 => do(15), RD14 => do(14), RD13 => do(13),
      RD12 => do(12), RD11 => do(11), RD10 => do(10), RD9 => do(9),
      RD8 => do(8), RD7 => do(7), RD6 => do(6), RD5 => do(5), RD4 => do(4),
      RD3 => do(3), RD2 => do(2), RD1 => do(1), RD0 => do(0)
      );
end;

library ieee;
use ieee.std_logic_1164.all;

entity axcel_syncram_2p is
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (
    rclk  : in std_ulogic;
    rena  : in std_ulogic;
    raddr : in std_logic_vector (abits -1 downto 0);
    dout  : out std_logic_vector (dbits -1 downto 0);
    wclk  : in std_ulogic;
    waddr : in std_logic_vector (abits -1 downto 0);
    din   : in std_logic_vector (dbits -1 downto 0);
    write : in std_ulogic);
end;

architecture rtl of axcel_syncram_2p is
component axcel_ssram 
  generic (abits : integer := 16; dbits : integer := 36);
  port (
    wa, ra       : in  std_logic_vector(15 downto 0);
    wclk, rclk   : in  std_ulogic;
    di           : in  std_logic_vector(dbits -1 downto 0);
    do           : out std_logic_vector(dbits -1 downto 0);
    width        : in  std_logic_vector(2 downto 0);
    ren, wen     : in  std_ulogic
   ); 
end component;

type dwtype is array (1 to 24) of integer;
constant dwmap : dwtype := (36, 36, 36, 36, 36, 36, 36, 18, 9, 4, 2, others => 1);
constant xbits : integer := dwmap(abits);
constant dw : integer := dbits + 36;
signal wen, gnd : std_ulogic;
signal ra, wa : std_logic_vector(31 downto 0);
signal d, q : std_logic_vector(dw downto 0);
signal ren  : std_ulogic;
signal width : std_logic_vector(2 downto 0);
constant READFAST : std_ulogic := '1';
begin
  width <= "101" when abits <= 7 else
           "100" when abits = 8 else
           "011" when abits = 9 else
           "010" when abits = 10 else
           "001" when abits = 11 else
           "000";
  wen <= write; ren <= rena or READFAST; gnd <= '0';
  ra(31 downto abits) <= (others =>'0'); wa(31 downto abits) <= (others =>'0');
  ra(abits-1 downto 0) <= raddr(abits-1 downto 0);
  wa(abits-1 downto 0) <= waddr(abits-1 downto 0);
  d(dw downto dbits) <= (others =>'0');
  d(dbits-1 downto 0) <= din(dbits-1 downto 0);
  dout <= q(dbits-1 downto 0);

  a7 : if abits <= 7 generate
    agen : for i in 0 to (dbits-1)/xbits generate
      u0 : axcel_ssram
      generic map (abits => 7, dbits => xbits) 
      port map (ra => ra(15 downto 0), wa => wa(15 downto 0), 
	 di => d(xbits*(i+1)-1 downto xbits*i), wen => wen, width => width, 
	 wclk => wclk, ren => ren, rclk => rclk, 
	 do => q(xbits*(i+1)-1 downto xbits*i));
    end generate;
  end generate;
  a8to12 : if (abits > 7) and (abits <= 12) generate
    agen : for i in 0 to (dbits-1)/xbits generate
      u0 : axcel_ssram
      generic map (abits => abits, dbits => xbits) 
      port map (ra => ra(15 downto 0), wa => wa(15 downto 0), 
	 di => d(xbits*(i+1)-1 downto xbits*i), wen => wen, width => width, 
	 wclk => wclk, ren => ren, rclk => rclk, 
	 do => q(xbits*(i+1)-1 downto xbits*i));
    end generate;
  end generate;
-- pragma translate_off
  a_to_high : if abits > 12 generate
    x : process
    begin
      assert false
      report  "Address depth larger than 12 not supported for AX rams"
      severity failure;
      wait;
    end process;
  end generate;
-- pragma translate_on
end;


library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.mem_actel.all;

entity axcel_syncram is
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (
    clk      : in std_ulogic;
    address  : in std_logic_vector((abits -1) downto 0);
    datain   : in std_logic_vector((dbits -1) downto 0);
    dataout  : out std_logic_vector((dbits -1) downto 0);
    enable   : in std_ulogic;
    write    : in std_ulogic
   ); 
end;

architecture rtl of axcel_syncram is
begin
  u0 : axcel_syncram_2p generic map (abits, dbits)
       port map (clk, enable, address, dataout, clk, address, datain, write);
end;

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.stdlib.all;
library actel;
use actel.actel_components.all;

entity proasic_syncram_2p is
  generic ( abits : integer := 8; dbits : integer := 32);
  port (
    rclk  : in std_ulogic;
    rena  : in std_ulogic;
    raddr : in std_logic_vector (abits -1 downto 0);
    dout  : out std_logic_vector (dbits -1 downto 0);
    wclk  : in std_ulogic;
    waddr : in std_logic_vector (abits -1 downto 0);
    din   : in std_logic_vector (dbits -1 downto 0);
    write : in std_ulogic);
end;

architecture rtl of proasic_syncram_2p is
  type powarr is array (1 to 19) of integer;
  constant ntbl : powarr := (1, 1, 1, 1, 1, 1, 1, 1, 2, 4, 8, 16, 32, others => 64);
  constant dw : integer := dbits + 8;
  subtype dword is std_logic_vector(dw downto 0);
  type qarr is array (0 to 63) of dword;
  signal gnd, wen, ren : std_ulogic;
  signal q : qarr;
  signal d : dword;
  signal rra : std_logic_vector (20 downto 0);
  signal ra, wa : std_logic_vector (63 downto 0);
  signal wenv : std_logic_vector (63 downto 0);
  signal renv : std_logic_vector (63 downto 0);
begin
  gnd <= '0';
  wa(63 downto abits) <= (others => '0'); wa(abits-1 downto 0) <= waddr;
  ra(63 downto abits) <= (others => '0'); ra(abits-1 downto 0) <= raddr;
  d(dw downto dbits)  <= (others => '0'); d(dbits-1 downto 0)  <= din;
  wen <= not write; ren <= not rena;

  x0 : if abits < 15 generate
    b0 : for j in 0 to ntbl(abits)-1 generate
      g0 : for i in 0 to (dbits-1)/9 generate
        u0 : RAM256x9SST port map (
          DO0 => q(j)(i*9+0), DO1 => q(j)(i*9+1), DO2 => q(j)(i*9+2),
          DO3 => q(j)(i*9+3), DO4 => q(j)(i*9+4), DO5 => q(j)(i*9+5), 
          DO6 => q(j)(i*9+6), DO7 => q(j)(i*9+7), DO8 => q(j)(i*9+8),
          DOS => open, RPE => open, WPE => open,
          WADDR0 => wa(0), WADDR1 => wa(1), WADDR2 => wa(2),
          WADDR3 => wa(3), WADDR4 => wa(4), WADDR5 => wa(5),
          WADDR6 => wa(6), WADDR7 => wa(7),
          RADDR0 => ra(0), RADDR1 => ra(1), RADDR2 => ra(2),
          RADDR3 => ra(3), RADDR4 => ra(4), RADDR5 => ra(5),
          RADDR6 => ra(6), RADDR7 => ra(7),
          WCLKS => wclk, RCLKS => rclk,
          DI0 => d(i*9+0), DI1 => d(i*9+1), DI2 => d(i*9+2),
          DI3 => d(i*9+3), DI4 => d(i*9+4), DI5 => d(i*9+5), 
          DI6 => d(i*9+6), DI7 => d(i*9+7), DI8 => d(i*9+8),
          RDB => ren, WRB => wen, RBLKB => renv(j), WBLKB => wenv(j),
	  PARODD => gnd, DIS => gnd
	);
      end generate;
    end generate;

    rra(20 downto abits) <= (others => '0');
    reg : process(rclk)
    begin
      if rising_edge(rclk) then
        rra(abits-1 downto 0) <= raddr(abits-1 downto 0);
        rra(7 downto 0) <= (others => '0');
      end if;
    end process;

    ctrl : process(write, waddr, q, rra, rena, raddr)
    variable we,z,re : std_logic_vector(63 downto 0);
    variable wea,rea : std_logic_vector(63 downto 0);
    begin
      we := (others => '0'); z := (others => '0'); re := (others => '0');
      wea := (others => '0'); rea := (others => '0');
      wea(abits-1 downto 0) := waddr(abits-1 downto 0); wea(7 downto 0) := (others => '0');
      rea(abits-1 downto 0) := raddr(abits-1 downto 0); wea(7 downto 0) := (others => '0');
      z(dbits-1 downto 0) := 
		q(conv_integer(rra(19 downto 8)))(dbits-1 downto 0);
      we (conv_integer(wea(19 downto 8))) := write;
      re (conv_integer(rea(19 downto 8))) := rena;
      wenv <= not we; renv <= not re; dout <= z(dbits-1 downto 0);
    end process;

  end generate;

-- pragma translate_off  
  unsup : if abits > 14 generate
    x : process
    begin
      assert false
      report  "Address depth larger than 14 not supported for ProAsic rams"
      severity failure;
      wait;
    end process;
  end generate;
-- pragma translate_on
  
end;

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.mem_actel.all;

entity proasic_syncram is
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (
    clk      : in std_ulogic;
    address  : in std_logic_vector((abits -1) downto 0);
    datain   : in std_logic_vector((dbits -1) downto 0);
    dataout  : out std_logic_vector((dbits -1) downto 0);
    enable   : in std_ulogic;
    write    : in std_ulogic
   ); 
end;

architecture rtl of proasic_syncram is
begin
  u0 : proasic_syncram_2p generic map (abits, dbits)
       port map (clk, enable, address, dataout, clk, address, datain, write);
end;


library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.mem_actel.all;

entity proasic3_syncram_dp is
  generic ( abits : integer := 6; dbits : integer := 8 );
  port (
    clk1     : in std_ulogic;
    address1 : in std_logic_vector((abits -1) downto 0);
    datain1  : in std_logic_vector((dbits -1) downto 0);
    dataout1 : out std_logic_vector((dbits -1) downto 0);
    enable1  : in std_ulogic;
    write1   : in std_ulogic;
    clk2     : in std_ulogic;
    address2 : in std_logic_vector((abits -1) downto 0);
    datain2  : in std_logic_vector((dbits -1) downto 0);
    dataout2 : out std_logic_vector((dbits -1) downto 0);
    enable2  : in std_ulogic;
    write2   : in std_ulogic
   ); 
end;

architecture rtl of proasic3_syncram_dp is
  component proasic3_ram4k9 is
  generic (abits : integer range 9 to 12 := 9; dbits : integer := 9);
  port (
    addra, addrb : in  std_logic_vector(abits -1 downto 0);
    clka, clkb   : in  std_ulogic;
    dia, dib     : in  std_logic_vector(dbits -1 downto 0);
    doa, dob     : out std_logic_vector(dbits -1 downto 0);
    ena, enb     : in  std_ulogic;
    wea, web     : in  std_ulogic
   ); 
  end component;

  constant dlen : integer := dbits + 9;
  signal di1, di2, q1, q2 : std_logic_vector(dlen downto 0);
  signal a1, a2 : std_logic_vector(12 downto 0);
  signal en1, en2, we1, we2 : std_ulogic;
begin

  di1(dbits-1 downto 0) <= datain1; di1(dlen downto dbits) <= (others => '0');
  di2(dbits-1 downto 0) <= datain1; di2(dlen downto dbits) <= (others => '0');
  a1(abits-1 downto 0) <= address1; a1(12 downto abits) <= (others => '0');
  a2(abits-1 downto 0) <= address1; a2(12 downto abits) <= (others => '0');
  dataout1 <= q1(dbits-1 downto 0); q1(dlen downto dbits) <= (others => '0');
  dataout2 <= q2(dbits-1 downto 0); q2(dlen downto dbits) <= (others => '0');
  en1 <= not enable1; en2 <= not enable2;
  we1 <= not write1; we2 <= not write2;
  a9 : if (abits <= 9) generate
    x : for i in 0 to (dbits-1)/9 generate
      u0 : proasic3_ram4k9 generic map (9, 9) port map (
        a1(8 downto 0), a2(8 downto 0), clk1, clk2, 
	di1(i*9+8 downto i*9), di2(i*9+8 downto i*9),
	q1(i*9+8 downto i*9), q2(i*9+8 downto i*9), 
	en1, en2, we1, we2);
    end generate;
  end generate;
  a10 : if (abits = 10) generate
    x : for i in 0 to (dbits-1)/4 generate
      u0 : proasic3_ram4k9 generic map (10, 4) port map (
        a1(9 downto 0), a2(9 downto 0), clk1, clk2, 
	di1(i*4+3 downto i*4), di2(i*4+3 downto i*4),
	q1(i*4+3 downto i*4), q2(i*4+3 downto i*4), 
	en1, en2, we1, we2);
    end generate;
  end generate;
  a11 : if (abits = 11) generate
    x : for i in 0 to (dbits-1)/2 generate
      u0 : proasic3_ram4k9 generic map (11, 2) port map (
        a1(10 downto 0), a2(10 downto 0), clk1, clk2, 
	di1(i*2+1 downto i*2), di2(i*2+1 downto i*2),
	q1(i*2+1 downto i*2), q2(i*2+1 downto i*2), 
	en1, en2, we1, we2);
    end generate;
  end generate;
  a12 : if (abits = 12) generate
    x : for i in 0 to (dbits-1) generate
      u0 : proasic3_ram4k9 generic map (12, 1) port map (
        a1(11 downto 0), a2(11 downto 0), clk1, clk2, 
	di1(i*1 downto i*1), di2(i*1 downto i*1),
	q1(i*1 downto i*1), q2(i*1 downto i*1), 
	en1, en2, we1, we2);
    end generate;
  end generate;
-- pragma translate_off  
  unsup : if abits > 12 generate
    x : process
    begin
      assert false
      report  "Address depth larger than 12 not supported for ProAsic3 rams"
      severity failure;
      wait;
    end process;
  end generate;
-- pragma translate_on
end;

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.mem_actel.all;

entity proasic3_syncram_2p is
  generic ( abits : integer := 8; dbits : integer := 32);
  port (
    rclk  : in std_ulogic;
    rena  : in std_ulogic;
    raddr : in std_logic_vector (abits -1 downto 0);
    dout  : out std_logic_vector (dbits -1 downto 0);
    wclk  : in std_ulogic;
    waddr : in std_logic_vector (abits -1 downto 0);
    din   : in std_logic_vector (dbits -1 downto 0);
    write : in std_ulogic);
end;

architecture rtl of proasic3_syncram_2p is
  component proasic3_ram4k9 is
  generic (abits : integer range 9 to 12 := 9; dbits : integer := 9);
  port (
    addra, addrb : in  std_logic_vector(abits -1 downto 0);
    clka, clkb   : in  std_ulogic;
    dia, dib     : in  std_logic_vector(dbits -1 downto 0);
    doa, dob     : out std_logic_vector(dbits -1 downto 0);
    ena, enb     : in  std_ulogic;
    wea, web     : in  std_ulogic
   ); 
  end component;
  component proasic3_ram512x18
  port (
    addra, addrb : in  std_logic_vector(8 downto 0);
    clka, clkb   : in  std_ulogic;
    di           : in  std_logic_vector(17 downto 0);
    do           : out std_logic_vector(17 downto 0);
    ena, enb     : in  std_ulogic;
    wea          : in  std_ulogic
   ); 
  end component;
  constant dlen : integer := dbits + 18;
  signal di1, q2, gnd : std_logic_vector(dlen downto 0);
  signal a1, a2 : std_logic_vector(12 downto 0);
  signal en1, en2, we1, vcc : std_ulogic;
begin

  vcc <= '1'; gnd <= (others => '0');
  di1(dbits-1 downto 0) <= din; di1(dlen downto dbits) <= (others => '0');
  a1(abits-1 downto 0) <= waddr; a1(12 downto abits) <= (others => '0');
  a2(abits-1 downto 0) <= raddr; a2(12 downto abits) <= (others => '0');
  dout <= q2(dbits-1 downto 0); q2(dlen downto dbits) <= (others => '0');
  en1 <= not write; en2 <= not rena; we1 <= not write;
  a8 : if (abits <= 8) generate
    x : for i in 0 to (dbits-1)/18 generate
      u0 : proasic3_ram512x18 port map (
        a1(8 downto 0), a2(8 downto 0), wclk, rclk, 
	di1(i*18+17 downto i*18), q2(i*18+17 downto i*18), 
	en1, en2, we1);
    end generate;
  end generate;
  a9 : if (abits = 9) generate
    x : for i in 0 to (dbits-1)/9 generate
      u0 : proasic3_ram4k9 generic map (9, 9) port map (
        a1(8 downto 0), a2(8 downto 0), wclk, rclk, 
	di1(i*9+8 downto i*9), gnd(8 downto 0),
	open, q2(i*9+8 downto i*9), 
	en1, en2, we1, vcc);
    end generate;
  end generate;
  a10 : if (abits = 10) generate
    x : for i in 0 to (dbits-1)/4 generate
      u0 : proasic3_ram4k9 generic map (10, 4) port map (
        a1(9 downto 0), a2(9 downto 0), wclk, rclk, 
	di1(i*4+3 downto i*4), gnd(3 downto 0),
	open, q2(i*4+3 downto i*4), 
	en1, en2, we1, vcc);
    end generate;
  end generate;
  a11 : if (abits = 11) generate
    x : for i in 0 to (dbits-1)/2 generate
      u0 : proasic3_ram4k9 generic map (11, 2) port map (
        a1(10 downto 0), a2(10 downto 0), wclk, rclk, 
	di1(i*2+1 downto i*2), gnd(1 downto 0),
	open, q2(i*2+1 downto i*2), 
	en1, en2, we1, vcc);
    end generate;
  end generate;
  a12 : if (abits = 12) generate
    x : for i in 0 to (dbits-1) generate
      u0 : proasic3_ram4k9 generic map (12, 1) port map (
        a1(11 downto 0), a2(11 downto 0), wclk, rclk, 
	di1(i*1 downto i*1), gnd(0 downto 0),
	open, q2(i*1 downto i*1), 
	en1, en2, we1, vcc);
    end generate;
  end generate;
-- pragma translate_off  
  unsup : if abits > 12 generate
    x : process
    begin
      assert false
      report  "Address depth larger than 12 not supported for ProAsic3 rams"
      severity failure;
      wait;
    end process;
  end generate;
-- pragma translate_on
end;

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.mem_actel.all;

entity proasic3_syncram is
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (
    clk      : in std_ulogic;
    address  : in std_logic_vector((abits -1) downto 0);
    datain   : in std_logic_vector((dbits -1) downto 0);
    dataout  : out std_logic_vector((dbits -1) downto 0);
    enable   : in std_ulogic;
    write    : in std_ulogic
   ); 
end;

architecture rtl of proasic3_syncram is
signal gnd : std_logic_vector(abits+dbits downto 0);
begin
  gnd <= (others => '0');
  r2p  : if abits <= 8 generate 
    u0 : proasic3_syncram_2p generic map (abits, dbits)
       port map (clk, enable, address, dataout, clk, address, datain, write);
  end generate;
  rdp  : if abits > 8 generate 
    u0 : proasic3_syncram_dp generic map (abits, dbits)
         port map (clk, address, datain, dataout, enable, write, 
                   clk, gnd(abits-1 downto 0), gnd(dbits-1 downto 0), open, gnd(0), gnd(0));
  end generate;
end;

