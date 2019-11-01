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
-- File:	mem_virage_gen.vhd
-- Author:	Jiri Gaisler Gaisler Research
-- Description:	Memory generators for Virage rams
------------------------------------------------------------------------------

library ieee;
library virage;
use ieee.std_logic_1164.all;
use virage.virage_vcomponents.all;

entity virage_syncram is
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (
    clk      : in std_ulogic;
    address  : in std_logic_vector(abits -1 downto 0);
    datain   : in std_logic_vector(dbits -1 downto 0);
    dataout  : out std_logic_vector(dbits -1 downto 0);
    enable   : in std_ulogic;
    write    : in std_ulogic
  );
end;

architecture rtl of virage_syncram is
  signal d, q, gnd : std_logic_vector(35 downto 0);
  signal a : std_logic_vector(17 downto 0);
  signal vcc : std_ulogic;
  constant synopsys_bug : std_logic_vector(37 downto 0) := (others => '0');
begin

  gnd <= (others => '0'); vcc <= '1';
  a(abits -1 downto 0) <= address; 
  d(dbits -1 downto 0) <= datain(dbits -1 downto 0); 
  a(17 downto abits) <= synopsys_bug(17 downto abits);
  d(35 downto dbits) <= synopsys_bug(35 downto dbits);
  dataout <= q(dbits -1 downto 0);
  q(35 downto dbits) <= synopsys_bug(35 downto dbits);

  a7d32 : if (abits <= 7) and (dbits <= 32) generate
    id0 : hdss1_128x32cm4sw0 
      port map (a(6 downto 0), gnd(6 downto 0),clk, 
	d(31 downto 0), gnd(31 downto 0), q(31 downto 0), 
	enable, vcc, write, gnd(0), gnd(0), gnd(0), gnd(0), gnd(0));
  end generate;

  a8d32 : if (abits = 8) and (dbits <= 32) generate
    id0 : hdss1_256x32cm4sw0 
      port map (a(7 downto 0), gnd(7 downto 0),clk, 
	d(31 downto 0), gnd(31 downto 0), q(31 downto 0), 
	enable, vcc, write, gnd(0), gnd(0), gnd(0), gnd(0), gnd(0));
  end generate;

  a9d32 : if (abits = 9) and (dbits <= 32) generate
    id0 : hdss1_512x32cm4sw0 
      port map (address(8 downto 0), gnd(8 downto 0),clk, 
	d(31 downto 0), gnd(31 downto 0), q(31 downto 0), 
	enable, vcc, write, gnd(0), gnd(0), gnd(0), gnd(0), gnd(0));

  end generate;
  a10d32 : if (abits = 10) and (dbits <= 32) generate
    id0 : hdss1_1024x32cm4sw0 
      port map (address(9 downto 0), gnd(9 downto 0), clk,
	d(31 downto 0), gnd(31 downto 0), q(31 downto 0), 
	enable, vcc, write, gnd(0), gnd(0), gnd(0), gnd(0), gnd(0));
  end generate;

  a11d32 : if (abits = 11) and (dbits <= 32) generate
    id0 : hdss1_2048x32cm8sw0 
      port map (address(10 downto 0), gnd(10 downto 0), clk, 
	d(31 downto 0), gnd(31 downto 0), q(31 downto 0), 
	enable, vcc, write, gnd(0), gnd(0), gnd(0), gnd(0), gnd(0));
  end generate;

end rtl;


library ieee;
library virage;
use ieee.std_logic_1164.all;
use virage.virage_vcomponents.all;

entity virage_syncram_dp is
  generic ( abits : integer := 10; dbits : integer := 8 );
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
architecture rtl of virage_syncram_dp is
  signal vcc : std_ulogic;
  signal d1, d2, a1, a2, q1, q2, gnd : std_logic_vector(35 downto 0);
begin

  vcc <= '1'; gnd <=  (others => '0');
  d1(dbits-1 downto 0) <= datain1; d1(35 downto dbits) <= (others => '0');
  d2(dbits-1 downto 0) <= datain2; d2(35 downto dbits) <= (others => '0');
  a1(abits-1 downto 0) <= address1; a1(35 downto abits) <= (others => '0');
  a2(abits-1 downto 0) <= address2; a2(35 downto abits) <= (others => '0');
  dataout1 <= q1(dbits-1 downto 0); dataout2 <= q2(dbits-1 downto 0);

  a6d32 : if (abits <= 6) and (dbits <= 32) generate
    id0 : hdss2_64x32cm4sw0 
      port map (a1(5 downto 0), gnd(5 downto 0), a2(5 downto 0),
	gnd(5 downto 0), clk1, clk2, 
	d1(31 downto 0), gnd(31 downto 0), d2(31 downto 0), gnd(31 downto 0),
	q1(31 downto 0), q2(31 downto 0), 
	enable1, vcc, write1, gnd(0), gnd(0), gnd(0), gnd(0), gnd(0),
	enable2, vcc, write2, gnd(0), gnd(0), gnd(0), gnd(0), gnd(0));
  end generate;

  a7d32 : if (abits = 7) and (dbits <= 32) generate
    id0 : hdss2_128x32cm4sw0 
      port map (a1(6 downto 0), gnd(6 downto 0), a2(6 downto 0),
	gnd(6 downto 0), clk1, clk2, 
	d1(31 downto 0), gnd(31 downto 0), d2(31 downto 0), gnd(31 downto 0),
	q1(31 downto 0), q2(31 downto 0), 
	enable1, vcc, write1, gnd(0), gnd(0), gnd(0), gnd(0), gnd(0),
	enable2, vcc, write2, gnd(0), gnd(0), gnd(0), gnd(0), gnd(0));
  end generate;

  a8d32 : if (abits = 8) and (dbits <= 32) generate
    id0 : hdss2_256x32cm4sw0 
      port map (a1(7 downto 0), gnd(7 downto 0), a2(7 downto 0),
	gnd(7 downto 0), clk1, clk2, 
	d1(31 downto 0), gnd(31 downto 0), d2(31 downto 0), gnd(31 downto 0),
	q1(31 downto 0), q2(31 downto 0), 
	enable1, vcc, write1, gnd(0), gnd(0), gnd(0), gnd(0), gnd(0),
	enable2, vcc, write2, gnd(0), gnd(0), gnd(0), gnd(0), gnd(0));
  end generate;

  a9d32 : if (abits = 9) and (dbits <= 32) generate
    id0 : hdss2_512x32cm4sw0 
      port map (a1(8 downto 0), gnd(8 downto 0), a2(8 downto 0),
	gnd(8 downto 0), clk1, clk2, 
	d1(31 downto 0), gnd(31 downto 0), d2(31 downto 0), gnd(31 downto 0),
	q1(31 downto 0), q2(31 downto 0), 
	enable1, vcc, write1, gnd(0), gnd(0), gnd(0), gnd(0), gnd(0),
	enable2, vcc, write2, gnd(0), gnd(0), gnd(0), gnd(0), gnd(0));
  end generate;

end;

