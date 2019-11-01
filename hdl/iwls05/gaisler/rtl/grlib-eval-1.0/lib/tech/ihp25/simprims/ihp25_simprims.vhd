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
-- Package: 	ihp25_simprims
-- File:	ihp25_simprims.vhd
-- Author:	Marko Isomaki, Gaisler Research
-- Description:	Behavioural pad models for IHP's 0.25um technology
-----------------------------------------------------------------------------

-- Input pad 3.3V tolerant
library ieee;
use ieee.std_logic_1164.all;
entity inbuf3_16 is 
   port (di : out std_logic; pad : in std_logic);
end;
architecture rtl of inbuf3_16 is 
   begin di <= to_x01(pad) after 1 ns;
end;

-- CMOS 3-state output pads 3.3V tolerant 4mA drive
library ieee;
use ieee.std_logic_1164.all;
entity iobuf3_16_4 is
   port (pad : inout std_logic; di : out std_logic; do : in std_logic; en : in std_logic);
end;
architecture rtl of iobuf3_16_4 is 
   begin pad <= to_x01(do) after 3 ns when en = '1' else 'Z' after 3 ns;
end;

-- CMOS 3-state output pads 3.3V tolerant 8mA drive
library ieee;
use ieee.std_logic_1164.all;
entity iobuf3_16_8 is
   port (pad : inout std_logic; di : out std_logic; do : in std_logic; en : in std_logic);
end;
architecture rtl of iobuf3_16_8 is 
   begin pad <= to_x01(do) after 2.5 ns when en = '1' else 'Z' after 2.5 ns;
end;

-- CMOS 3-state output pads 3.3V tolerant 12mA drive
library ieee;
use ieee.std_logic_1164.all;
entity iobuf3_16_12 is
   port (pad : inout std_logic; di : out std_logic; do : in std_logic; en : in std_logic);
end;
architecture rtl of iobuf3_16_12 is 
   begin pad <= to_x01(do) after 2 ns when en = '1' else 'Z' after 2 ns;
end;

-- CMOS 3-state output pad with input and pull-up 3.3V tolerant 4 mA drive
library ieee;
use ieee.std_logic_1164.all;
entity iobuf3_16pu_4 is 
   port (pad : inout std_logic; di : out std_logic; do : in std_logic; en : in std_logic);
end;
architecture rtl of iobuf3_16pu_4 is 
   begin pad <= to_x01(do) after 3 ns when en = '1' else 'Z' after 3 ns;
   	 di  <= to_x01(pad) after 1 ns;
end;

-- CMOS 3-state output pad with input and pull-up 3.3V tolerant 8 mA drive
library ieee;
use ieee.std_logic_1164.all;
entity iobuf3_16pu_8 is 
   port (pad : inout std_logic; di : out std_logic; do : in std_logic; en : in std_logic);
end;
architecture rtl of iobuf3_16pu_8 is 
   begin pad <= to_x01(do) after 2.5 ns when en = '1' else 'Z' after 2.5 ns;
   	 di  <= to_x01(pad) after 1 ns;
end;

-- CMOS 3-state output pad with input and pull-up 3.3V tolerant 12mA drive
library ieee;
use ieee.std_logic_1164.all;
entity iobuf3_16pu_12 is 
   port (pad : inout std_logic; di : out std_logic; do : in std_logic; en : in std_logic);
end;
architecture rtl of iobuf3_16pu_12 is 
   begin pad <= to_x01(do) after 2 ns when en = '1' else 'Z' after 2 ns;
   	 di  <= to_x01(pad) after 1 ns;
end;

--------------------------------------------------------------------
-- Synchronous SRAM simulation model
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ihp25_syncram_ss is
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (
    CLK: in std_logic;
    CEN: in std_logic;
    WEN: in std_logic_vector(3 downto 0);
    A:  in  std_logic_vector((abits -1) downto 0);
    D:  in  std_logic_vector((dbits -1) downto 0);
    Q:  out std_logic_vector((dbits -1) downto 0)
  ); 
end;     

architecture behavioral of ihp25_syncram_ss is
  subtype word is std_logic_vector((dbits -1) downto 0);
  type mem is array(0 to (2**abits -1)) of word;
begin
g0:if dbits = 32 generate
  main : process(CLK)
  variable memarr : mem;
  begin
    if rising_edge(CLK) and (CEN = '0') then
      if not is_x(A) then
        if WEN(0) = '0' then
          memarr(conv_integer(unsigned(A)))(7 downto 0) := D(7 downto 0);
        end if;
        if WEN(1) = '0' then
          memarr(conv_integer(unsigned(A)))(15 downto 8) := D(15 downto 8);
        end if;
        if WEN(2) = '0' then
          memarr(conv_integer(unsigned(A)))(23 downto 16) := D(23 downto 16);
        end if;
        if WEN(3) = '0' then
          memarr(conv_integer(unsigned(A)))(31 downto 24) := D(31 downto 24);
        end if;
        Q <= memarr(conv_integer(unsigned(A)));
      else
        Q <= (others => 'Z');
      end if;
    end if;
  end process;
  end generate;

g1:if dbits /= 32 generate
  main : process(CLK)
  variable memarr : mem;
  begin
    if rising_edge(CLK) and (CEN = '0') then
      if not is_x(A) then
        if WEN(0) = '0' then
          memarr(conv_integer(unsigned(A))) := D;
        end if;
        Q <= memarr(conv_integer(unsigned(A)));
      else
        Q <= (others => 'Z');
      end if;
    end if;
  end process;
  end generate;

end behavioral;

library ieee;
use ieee.std_logic_1164.all;

package tech_ihp25_sim is
  component ihp25_syncram_ss is
    generic ( abits : integer := 10; dbits : integer := 8 );
    port (
      CLK: in std_logic;
      CEN: in std_logic;
      WEN: in std_logic_vector(3 downto 0);
      A:  in  std_logic_vector((abits -1) downto 0);
      D:  in  std_logic_vector((dbits -1) downto 0);
      Q:  out std_logic_vector((dbits -1) downto 0)
    ); 
  end component;     
end package; 

-- library ieee;
-- library ihp25; 
-- use ieee.std_logic_1164.all;
-- use ihp25.tech_ihp25_sim.all;

-- entity ram512x32 is
--    port ( 
--    CLK: in std_logic;
--    CEN: in std_logic;
--    WEN: in std_logic;
--    A: in std_logic_vector(8 downto 0);
--    D: in std_logic_vector(31 downto 0);
--    Q: out std_logic_vector(31 downto 0)
--    );
-- end;

-- architecture behavioral of ram512x32 is
-- signal vect_wen : std_logic_vector(3 downto 0); 
-- begin
--   vect_wen <= (others => WEN);
--   syncram0 : ihp25_syncram_ss
--     generic map ( abits => 9, dbits => 32)
--     port map ( 
--     CLK => CLK,
--     CEN => CEN,
--     WEN => vect_wen,
--     A   => A,
--     D   => D,
--     Q   => Q
--     ); 
-- end behavioral;

library ieee;
library ihp25;
use ieee.std_logic_1164.all;
use ihp25.tech_ihp25_sim.all;

entity sram2k_pin is
  port(
    do0, do1, do2, do3, do4, do5, do6, do7, do8, do9, do10, do11,
    do12, do13, do14, do15, do16, do17, do18, do19, do20, do21,
    do22, do23, do24, do25, do26, do27, do28, do29, do30, do31    : out std_ulogic; 
    di0, di1, di2, di3, di4, di5, di6, di7, di8, di9, di10, di11,  
    di12, di13, di14, di15, di16, di17, di18, di19, di20, di21,   
    di22, di23, di24, di25, di26, di27, di28, di29, di30, di31,   
    a0, a1, a2, a3, a4, a5, a6, a7, a8,                           
    oen0, oen1, oen2, oen3,                                       
    iwen0, iwen1, iwen2, iwen3,                                   
    clk, wrb, ceb                                                 : in std_ulogic);                                                 
end entity;

architecture rtl of sram2k_pin is
  signal q, d : std_logic_vector(31 downto 0);
  signal a    : std_logic_vector(8 downto 0);
  signal wen  : std_logic_vector(3 downto 0);
begin
  do31 <= q(31); do30 <= q(30); do29 <= q(29); do28 <= q(28); do27 <= q(27);
  do26 <= q(26); do25 <= q(25); do24 <= q(24); do23 <= q(23); do22 <= q(22);
  do21 <= q(21); do20 <= q(20); do19 <= q(19); do18 <= q(18); do17 <= q(17);
  do16 <= q(16); do15 <= q(15); do14 <= q(14); do13 <= q(13);do12 <= q(12);
  do11 <= q(11); do10 <= q(10); do9 <= q(9); do8 <= q(8); do7 <= q(7);
  do6 <= q(6); do5 <= q(5); do4 <= q(4); do3 <= q(3); do2 <= q(2);
  do1 <= q(1); do0 <= q(0);
  
  d <= di31 & di30 & di29 & di28 & di27 & di26 & di25 & di24 & di23 & di22
       & di21 & di20 & di19 & di18 & di17 & di16 & di15 & di14 & di13 & di12
       & di11 & di10 & di9 & di8 & di7 & di6 & di5 & di4 & di3 & di2 & di1 & di0;
  a <= a8 & a7 & a6 & a5 & a4 & a3 & a2 & a1 & a0;
  wen <= (others => not wrb);
  syncram0 : ihp25_syncram_ss
    generic map ( abits => 9, dbits => 32)
    port map ( 
    CLK => clk,
    CEN => ceb,
    WEN => wen,
    A   => a,
    D   => d,
    Q   => q
  ); 
  
end architecture; 
