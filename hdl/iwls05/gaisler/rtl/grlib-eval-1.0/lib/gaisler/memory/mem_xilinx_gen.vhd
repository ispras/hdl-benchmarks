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
-- File:	mem_xilinx_gen.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Memory generators for Xilinx rams
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.vcomponents.all;

entity virtex_syncram is
  generic ( abits : integer := 6; dbits : integer := 8);
  port (
    clk     : in std_ulogic;
    address : in std_logic_vector (abits -1 downto 0);
    datain  : in std_logic_vector (dbits -1 downto 0);
    dataout : out std_logic_vector (dbits -1 downto 0);
    enable  : in std_ulogic;
    write   : in std_ulogic
  );
end;

architecture behav of virtex_syncram is
signal gnd : std_ulogic;
signal do, di : std_logic_vector(129 downto 0);
signal xa, ya : std_logic_vector(19 downto 0);
begin
  gnd <= '0';
  dataout <= do(dbits-1 downto 0);
  di(dbits-1 downto 0) <= datain; di(129 downto dbits) <= (others => '0');
  xa(abits-1 downto 0) <= address; xa(19 downto abits) <= (others => '0');
  ya(abits-1 downto 0) <= address; ya(19 downto abits) <= (others => '1');

  a7 : if (abits <= 7) and (dbits <= 32) generate
    r0 : RAMB4_S16_S16 port map ( do(31 downto 16), do(15 downto 0),
	xa(7 downto 0), ya(7 downto 0), clk, clk, di(31 downto 16), 
	di(15 downto 0), enable, enable, gnd, gnd, write, write);
  end generate;
  a8 : if ((abits <= 7) and (dbits > 32)) or (abits = 8) generate
    x : for i in 0 to ((dbits-1)/16) generate
      r : RAMB4_S16 port map ( do (((i+1)*16)-1 downto i*16), xa(7 downto 0), 
	clk, di (((i+1)*16)-1 downto i*16), enable, gnd, write );
    end generate;
  end generate;
  a9 : if abits = 9 generate
    x : for i in 0 to ((dbits-1)/8) generate
      r : RAMB4_S8 port map ( do (((i+1)*8)-1 downto i*8), xa(8 downto 0), 
	clk, di (((i+1)*8)-1 downto i*8), enable, gnd, write );
    end generate;
  end generate;
  a10 : if abits = 10 generate
    x : for i in 0 to ((dbits-1)/4) generate
      r : RAMB4_S4 port map ( do (((i+1)*4)-1 downto i*4), xa(9 downto 0), 
	clk, di (((i+1)*4)-1 downto i*4), enable, gnd, write );
    end generate;
  end generate;
  a11 : if abits = 11 generate
    x : for i in 0 to ((dbits-1)/2) generate
      r : RAMB4_S2 port map ( do (((i+1)*2)-1 downto i*2), xa(10 downto 0), 
	clk, di (((i+1)*2)-1 downto i*2), enable, gnd, write );
    end generate;
  end generate;
  a12 : if abits = 12 generate
    x : for i in 0 to (dbits-1) generate
      r : RAMB4_S1 port map ( do (i downto i), xa(11 downto 0), 
	clk, di(i downto i), enable, gnd, write );
    end generate;
  end generate;

-- pragma translate_off
  a_to_high : if abits > 12 generate
    x : process
    begin
      assert false
      report  "Address depth larger than 12 not supported for virtex_syncram"
      severity failure;
      wait;
    end process;
  end generate;
-- pragma translate_on

end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.vcomponents.all;

entity virtex_syncram_dp is
  generic ( 
    abits : integer := 6; dbits : integer := 8
  );
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
    write2   : in std_ulogic);
end;

architecture behav of virtex_syncram_dp is

signal gnd, vcc : std_ulogic;
signal do1, do2, di1, di2 : std_logic_vector(129 downto 0);
signal addr1, addr2 : std_logic_vector(19 downto 0);
begin
  gnd <= '0'; vcc <= '1';
  dataout1 <= do1(dbits-1 downto 0); dataout2 <= do2(dbits-1 downto 0);
  di1(dbits-1 downto 0) <= datain1; di1(129 downto dbits) <= (others => '0');
  di2(dbits-1 downto 0) <= datain2; di2(129 downto dbits) <= (others => '0');
  addr1(abits-1 downto 0) <= address1; addr1(19 downto abits) <= (others => '0');
  addr2(abits-1 downto 0) <= address2; addr2(19 downto abits) <= (others => '0');

  a8 : if abits <= 8 generate
    x : for i in 0 to ((dbits-1)/16) generate
      r0 : RAMB4_S16_S16 port map ( 
	do1(((i+1)*16)-1 downto i*16), do2(((i+1)*16)-1 downto i*16),
	addr1(7 downto 0), addr2(7 downto 0), clk1, clk2,
	di1(((i+1)*16)-1 downto i*16), di2(((i+1)*16)-1 downto i*16),
   	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

  a9 : if abits = 9 generate
    x : for i in 0 to ((dbits-1)/8) generate
      r0 : RAMB4_S8_S8 port map ( 
	do1(((i+1)*8)-1 downto i*8), do2(((i+1)*8)-1 downto i*8),
	addr1(8 downto 0), addr2(8 downto 0), clk1, clk2,
	di1(((i+1)*8)-1 downto i*8), di2(((i+1)*8)-1 downto i*8),
   	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

  a10: if abits = 10 generate
    x : for i in 0 to ((dbits-1)/4) generate
      r0 : RAMB4_S4_S4 port map ( 
	do1(((i+1)*4)-1 downto i*4), do2(((i+1)*4)-1 downto i*4),
	addr1(9 downto 0), addr2(9 downto 0), clk1, clk2,
	di1(((i+1)*4)-1 downto i*4), di2(((i+1)*4)-1 downto i*4),
   	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

  a11: if abits = 11 generate
    x : for i in 0 to ((dbits-1)/2) generate
      r0 : RAMB4_S2_S2 port map ( 
	do1(((i+1)*2)-1 downto i*2), do2(((i+1)*2)-1 downto i*2),
	addr1(10 downto 0), addr2(10 downto 0), clk1, clk2,
	di1(((i+1)*2)-1 downto i*2), di2(((i+1)*2)-1 downto i*2),
   	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

  a12: if abits = 12 generate
    x : for i in 0 to ((dbits-1)/1) generate
      r0 : RAMB4_S1_S1 port map ( 
	do1(((i+1)*1)-1 downto i*1), do2(((i+1)*1)-1 downto i*1),
	addr1(11 downto 0), addr2(11 downto 0), clk1, clk2,
	di1(((i+1)*1)-1 downto i*1), di2(((i+1)*1)-1 downto i*1),
   	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

-- pragma translate_off
  a_to_high : if abits > 12 generate
    x : process
    begin
      assert false
      report  "Address depth larger than 12 not supported for virtex_syncram_dp"
      severity failure;
      wait;
    end process;
  end generate;
-- pragma translate_on

end;


-- parametrisable sync ram generator using virtex2 select rams

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.vcomponents.all;

entity virtex2_syncram is
  generic ( abits : integer := 9; dbits : integer := 32);
  port (
    clk     : in std_ulogic;
    address : in std_logic_vector (abits -1 downto 0);
    datain  : in std_logic_vector (dbits -1 downto 0);
    dataout : out std_logic_vector (dbits -1 downto 0);
    enable  : in std_ulogic;
    write   : in std_ulogic
  );
end;

architecture behav of virtex2_syncram is
signal gnd : std_ulogic;
signal do, di : std_logic_vector(129 downto 0);
signal xa, ya : std_logic_vector(19 downto 0);
begin
  gnd <= '0'; dataout <= do(dbits-1 downto 0); di(dbits-1 downto 0) <= datain; 
  di(129 downto dbits) <= (others => '0'); xa(abits-1 downto 0) <= address; 
  xa(19 downto abits) <= (others => '0'); ya(abits-1 downto 0) <= address; 
  ya(19 downto abits) <= (others => '1');

  a8 : if (abits <= 8) generate
    x : for i in 0 to ((dbits-1)/36) generate
      r : RAMB16_S36 port map ( do(((i+1)*36)-5 downto i*36),
	do(((i+1)*36)-1 downto i*36+32), xa(8 downto 0), clk,
	di(((i+1)*36)-5 downto i*36), di(((i+1)*36)-1 downto i*36+32),
	enable, gnd, write);
    end generate;
  end generate;
  a9 : if (abits = 9) generate
    x : for i in 0 to ((dbits-1)/36) generate
      r : RAMB16_S36 port map ( do(((i+1)*36)-5 downto i*36),
	do(((i+1)*36)-1 downto i*36+32), xa(8 downto 0), clk,
	di(((i+1)*36)-5 downto i*36), di(((i+1)*36)-1 downto i*36+32),
	enable, gnd, write);
    end generate;
  end generate;
  a10 : if (abits = 10) generate
    x : for i in 0 to ((dbits-1)/18) generate
      r : RAMB16_S18 port map ( do(((i+1)*18)-3 downto i*18),
	do(((i+1)*18)-1 downto i*18+16), xa(9 downto 0), clk,
	di(((i+1)*18)-3 downto i*18), di(((i+1)*18)-1 downto i*18+16),
	enable, gnd, write);
    end generate;
  end generate;
  a11 : if abits = 11 generate
    x : for i in 0 to ((dbits-1)/9) generate
      r : RAMB16_S9 port map ( do(((i+1)*9)-2 downto i*9),
	do(((i+1)*9)-1 downto i*9+8), xa(10 downto 0), clk,
	di(((i+1)*9)-2 downto i*9), di(((i+1)*9)-1 downto i*9+8),
	enable, gnd, write);
    end generate;
  end generate;
  a12 : if abits = 12 generate
    x : for i in 0 to ((dbits-1)/4) generate
      r : RAMB16_S4 port map ( do(((i+1)*4)-1 downto i*4), xa(11 downto 0),
	clk, di(((i+1)*4)-1 downto i*4), enable, gnd, write);
    end generate;
  end generate;
  a13 : if abits = 13 generate
    x : for i in 0 to ((dbits-1)/2) generate
      r : RAMB16_S2 port map ( do(((i+1)*2)-1 downto i*2), xa(12 downto 0),
	clk, di(((i+1)*2)-1 downto i*2), enable, gnd, write);
    end generate;
  end generate;
  a14 : if abits = 14 generate
    x : for i in 0 to (dbits-1) generate
      r : RAMB16_S1 port map ( do((i+1)-1 downto i), xa(13 downto 0),
	clk, di((i+1)-1 downto i), enable, gnd, write);
    end generate;
  end generate;

-- pragma translate_off
  a_to_high : if abits > 14 generate
    x : process
    begin
      assert false
      report  "Address depth larger than 14 not supported for virtex2_syncram"
      severity failure;
      wait;
    end process;
  end generate;
-- pragma translate_on

end;

LIBRARY ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.vcomponents.all;

entity virtex2_syncram_dp is
  generic ( 
    abits : integer := 4; dbits : integer := 32
  );
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
    write2   : in std_ulogic);
end;

architecture behav of virtex2_syncram_dp is

signal gnd, vcc : std_ulogic;
signal do1, do2, di1, di2 : std_logic_vector(129 downto 0);
signal addr1, addr2 : std_logic_vector(19 downto 0);
begin
  gnd <= '0'; vcc <= '1';
  dataout1 <= do1(dbits-1 downto 0); dataout2 <= do2(dbits-1 downto 0);
  di1(dbits-1 downto 0) <= datain1; di1(129 downto dbits) <= (others => '0');
  di2(dbits-1 downto 0) <= datain2; di2(129 downto dbits) <= (others => '0');
  addr1(abits-1 downto 0) <= address1; addr1(19 downto abits) <= (others => '0');
  addr2(abits-1 downto 0) <= address2; addr2(19 downto abits) <= (others => '0');

  a9 : if abits <= 9 generate
    x : for i in 0 to ((dbits-1)/36) generate
      r0 : RAMB16_S36_S36 port map (
	do1(((i+1)*36)-5 downto i*36), do2(((i+1)*36)-5 downto i*36), 
	do1(((i+1)*36)-1 downto i*36+32), do2(((i+1)*36)-1 downto i*36+32),
	addr1(8 downto 0), addr2(8 downto 0), clk1, clk2,
	di1(((i+1)*36)-5 downto i*36), di2(((i+1)*36)-5 downto i*36), 
	di1(((i+1)*36)-1 downto i*36+32), di2(((i+1)*36)-1 downto i*36+32),
--	enable1, enable2, gnd, gnd, write1, write2);
	vcc, vcc, gnd, gnd, write1, write2);
    end generate;
  end generate;

  a10 : if abits = 10 generate
    x : for i in 0 to ((dbits-1)/18) generate
      r0 : RAMB16_S18_S18 port map (
	do1(((i+1)*18)-3 downto i*18), do2(((i+1)*18)-3 downto i*18), 
	do1(((i+1)*18)-1 downto i*18+16), do2(((i+1)*18)-1 downto i*18+16),
	addr1(9 downto 0), addr2(9 downto 0), clk1, clk2,
	di1(((i+1)*18)-3 downto i*18), di2(((i+1)*18)-3 downto i*18), 
	di1(((i+1)*18)-1 downto i*18+16), di2(((i+1)*18)-1 downto i*18+16),
	vcc, vcc, gnd, gnd, write1, write2);
--	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

  a11 : if abits = 11 generate
    x : for i in 0 to ((dbits-1)/9) generate
      r0 : RAMB16_S9_S9 port map (
	do1(((i+1)*9)-2 downto i*9), do2(((i+1)*9)-2 downto i*9), 
	do1(((i+1)*9)-1 downto i*9+8), do2(((i+1)*9)-1 downto i*9+8),
	addr1(10 downto 0), addr2(10 downto 0), clk1, clk2,
	di1(((i+1)*9)-2 downto i*9), di2(((i+1)*9)-2 downto i*9), 
	di1(((i+1)*9)-1 downto i*9+8), di2(((i+1)*9)-1 downto i*9+8),
	vcc, vcc, gnd, gnd, write1, write2);
--	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

  a12 : if abits = 12 generate
    x : for i in 0 to ((dbits-1)/4) generate
      r0 : RAMB16_S4_S4 port map (
	do1(((i+1)*4)-1 downto i*4), do2(((i+1)*4)-1 downto i*4), 
	addr1(11 downto 0), addr2(11 downto 0), clk1, clk2,
	di1(((i+1)*4)-1 downto i*4), di2(((i+1)*4)-1 downto i*4), 
	vcc, vcc, gnd, gnd, write1, write2);
--	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

  a13 : if abits = 13 generate
    x : for i in 0 to ((dbits-1)/2) generate
      r0 : RAMB16_S2_S2 port map (
	do1(((i+1)*2)-1 downto i*2), do2(((i+1)*2)-1 downto i*2), 
	addr1(12 downto 0), addr2(12 downto 0), clk1, clk2,
	di1(((i+1)*2)-1 downto i*2), di2(((i+1)*2)-1 downto i*2), 
	vcc, vcc, gnd, gnd, write1, write2);
--	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

  a14 : if abits = 14 generate
    x : for i in 0 to ((dbits-1)/1) generate
      r0 : RAMB16_S1_S1 port map (
	do1(((i+1)*1)-1 downto i*1), do2(((i+1)*1)-1 downto i*1), 
	addr1(13 downto 0), addr2(13 downto 0), clk1, clk2,
	di1(((i+1)*1)-1 downto i*1), di2(((i+1)*1)-1 downto i*1), 
	vcc, vcc, gnd, gnd, write1, write2);
--	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

-- pragma translate_off
  a_to_high : if abits > 14 generate
    x : process
    begin
      assert false
      report  "Address depth larger than 14 not supported for virtex2_syncram_dp"
      severity failure;
      wait;
    end process;
  end generate;
-- pragma translate_on

end;
