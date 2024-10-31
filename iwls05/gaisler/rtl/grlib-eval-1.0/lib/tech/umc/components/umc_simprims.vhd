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
-- Package: 	umc_simprims
-- File:	umc_simprims.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Simple UMC 0.18 simulation models
------------------------------------------------------------------------------
  
-- input pad

library ieee;
use ieee.std_logic_1164.all;

entity ICMT3V is port( A : in std_logic; Z : out std_logic); end ;
architecture behav of ICMT3V is begin Z <= to_X01(A) after 1 ns; end;

-- input pad with pull-up

library ieee;
use ieee.std_logic_1164.all;

entity ICMT3VPU is port( A : inout std_logic; Z : out std_logic); end ;
architecture behav of ICMT3VPU is begin 
  Z <= to_X01(A) after 1 ns; A <= 'H';
end;

-- input pad with pull-down

library ieee;
use ieee.std_logic_1164.all;

entity ICMT3VPD is port( A : inout std_logic; Z : out std_logic); end ;
architecture behav of ICMT3VPD is begin 
  Z <= to_X01(A) after 1 ns; A <= 'L';
end;

-- schmitt input pad

library ieee;
use ieee.std_logic_1164.all;

entity ISTRT3V is port( A : in std_logic; Z : out std_logic); end ;
architecture behav of ISTRT3V is begin Z <= to_X01(A) after 1 ns; end;

-- output pads

library ieee;
use ieee.std_logic_1164.all;

entity OCM3V4 is port( Z : out std_logic; A : in std_logic); end;
architecture behav of OCM3V4 is begin Z <= to_X01(A) after 3 ns; end;

library ieee;
use ieee.std_logic_1164.all;

entity OCM3V12 is port( Z : out std_logic; A : in std_logic); end;
architecture behav of OCM3V12 is begin Z <= to_X01(A) after 2 ns; end;

library ieee;
use ieee.std_logic_1164.all;

entity OCM3V24 is port( Z : out std_logic; A : in std_logic); end;
architecture behav of OCM3V24 is begin Z <= to_X01(A) after 1 ns; end;


-- tri-state output pads

library ieee;
use ieee.std_logic_1164.all;

entity OCMTR4 is port( EN : in std_logic; A : in std_logic; Z : out std_logic); end;
architecture behav of OCMTR4 is begin 
  Z <= to_X01(A) after 3 ns when to_X01(en) = '1' else
             'Z' after 3 ns when to_X01(en) = '0' else 'X' after 3 ns; 
end;

library ieee;
use ieee.std_logic_1164.all;

entity OCMTR12 is port( EN : in std_logic; A : in std_logic; Z : out std_logic); end;
architecture behav of OCMTR12 is begin 
  Z <= to_X01(A) after 2 ns when to_X01(en) = '1' else
             'Z' after 2 ns when to_X01(en) = '0' else 'X' after 2 ns; 
end;

library ieee;
use ieee.std_logic_1164.all;

entity OCMTR24 is port( EN : in std_logic; A : in std_logic; Z : out std_logic); end;
architecture behav of OCMTR24 is begin 
  Z <= to_X01(A) after 1 ns when to_X01(en) = '1' else
             'Z' after 1 ns when to_X01(en) = '0' else 'X' after 1 ns; 
end;

-- bidirectional pads

library ieee;
use ieee.std_logic_1164.all;

entity BICM3V4 is port( IO : inout std_logic; EN : in std_logic; A : in std_logic; Z : out std_logic); end;
architecture behav of BICM3V4 is begin 
  IO <= to_X01(A) after 3 ns when to_X01(en) = '1' else
             'Z' after 3 ns when to_X01(en) = '0' else 'X' after 3 ns; 
  Z <= to_X01(IO) after 1 ns;
end;

library ieee;
use ieee.std_logic_1164.all;

entity BICM3V12 is port( IO : inout std_logic; EN : in std_logic; A : in std_logic; Z : out std_logic); end;
architecture behav of BICM3V12 is begin 
  IO <= to_X01(A) after 2 ns when to_X01(en) = '1' else
             'Z' after 2 ns when to_X01(en) = '0' else 'X' after 2 ns; 
  Z <= to_X01(IO) after 1 ns;
end;

library ieee;
use ieee.std_logic_1164.all;

entity BICM3V24 is port( IO : inout std_logic; EN : in std_logic; A : in std_logic; Z : out std_logic); end;
architecture behav of BICM3V24 is begin 
  IO <= to_X01(A) after 1 ns when to_X01(en) = '1' else
             'Z' after 1 ns when to_X01(en) = '0' else 'X' after 1 ns; 
  Z <= to_X01(IO) after 1 ns;
end;

-- single-port memory

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.stdlib.all;

entity UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of UMC_SIM_SRAM is
subtype memword is std_logic_vector(dbits-1 downto 0);
type mem_type is array (0 to 2**abits-1) of memword;
signal qint : memword;
begin
  m : process(clk)
  variable mem : mem_type;
  begin
    if rising_edge(clk) then
      qint <= (others => 'X');
      if to_X01(wen) = '0' then mem(conv_integer(a)) := data;
      elsif to_X01(wen) = '1' then qint <= mem(conv_integer(a)); end if;
    end if;
  end process;

  q <= qint when to_X01(oen) = '0' else
        (others => 'Z') when to_X01(oen) = '1' else (others => 'X');
end;

library ieee;
use ieee.std_logic_1164.all;

entity SRAM_2048wx32b is
  port (
	a    : in  std_logic_vector(10 downto 0);
	data : in  std_logic_vector(31 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(31 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of SRAM_2048wx32b is
  component UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
  end component;
begin
 m : UMC_SIM_SRAM generic map (11, 32) port map (a, data, csn, wen, oen, q, clk);
end;

library ieee;
use ieee.std_logic_1164.all;

entity SRAM_1024wx32b is
  port (
	a    : in  std_logic_vector(9 downto 0);
	data : in  std_logic_vector(31 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(31 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of SRAM_1024wx32b is
  component UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
  end component;
begin
 m : UMC_SIM_SRAM generic map (10, 32) port map (a, data, csn, wen, oen, q, clk);
end;

library ieee;
use ieee.std_logic_1164.all;

entity SRAM_512wx32b is
  port (
	a    : in  std_logic_vector(8 downto 0);
	data : in  std_logic_vector(31 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(31 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of SRAM_512wx32b is
  component UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
  end component;
begin
 m : UMC_SIM_SRAM generic map (9, 32) port map (a, data, csn, wen, oen, q, clk);
end;

library ieee;
use ieee.std_logic_1164.all;

entity SRAM_256wx32b is
  port (
	a    : in  std_logic_vector(7 downto 0);
	data : in  std_logic_vector(31 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(31 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of SRAM_256wx32b is
  component UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
  end component;
begin
 m : UMC_SIM_SRAM generic map (8, 32) port map (a, data, csn, wen, oen, q, clk);
end;

library ieee;
use ieee.std_logic_1164.all;

entity SRAM_128wx32b is
  port (
	a    : in  std_logic_vector(6 downto 0);
	data : in  std_logic_vector(31 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(31 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of SRAM_128wx32b is
  component UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
  end component;
begin
 m : UMC_SIM_SRAM generic map (7, 32) port map (a, data, csn, wen, oen, q, clk);
end;

library ieee;
use ieee.std_logic_1164.all;

entity SRAM_64wx32b is
  port (
	a    : in  std_logic_vector(5 downto 0);
	data : in  std_logic_vector(31 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(31 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of SRAM_64wx32b is
  component UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
  end component;
begin
 m : UMC_SIM_SRAM generic map (6, 32) port map (a, data, csn, wen, oen, q, clk);
end;

library ieee;
use ieee.std_logic_1164.all;

entity SRAM_32wx32b is
  port (
	a    : in  std_logic_vector(4 downto 0);
	data : in  std_logic_vector(31 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(31 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of SRAM_32wx32b is
  component UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
  end component;
begin
 m : UMC_SIM_SRAM generic map (5, 32) port map (a, data, csn, wen, oen, q, clk);
end;

library ieee;
use ieee.std_logic_1164.all;

entity SRAM_2048wx36b is
  port (
	a    : in  std_logic_vector(10 downto 0);
	data : in  std_logic_vector(35 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(35 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of SRAM_2048wx36b is
  component UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
  end component;
begin
 m : UMC_SIM_SRAM generic map (11, 36) port map (a, data, csn, wen, oen, q, clk);
end;

library ieee;
use ieee.std_logic_1164.all;

entity SRAM_1024wx36b is
  port (
	a    : in  std_logic_vector(9 downto 0);
	data : in  std_logic_vector(35 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(35 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of SRAM_1024wx36b is
  component UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
  end component;
begin
 m : UMC_SIM_SRAM generic map (10, 36) port map (a, data, csn, wen, oen, q, clk);
end;

library ieee;
use ieee.std_logic_1164.all;

entity SRAM_512wx36b is
  port (
	a    : in  std_logic_vector(8 downto 0);
	data : in  std_logic_vector(35 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(35 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of SRAM_512wx36b is
  component UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
  end component;
begin
 m : UMC_SIM_SRAM generic map (9, 36) port map (a, data, csn, wen, oen, q, clk);
end;

library ieee;
use ieee.std_logic_1164.all;

entity SRAM_256wx36b is
  port (
	a    : in  std_logic_vector(7 downto 0);
	data : in  std_logic_vector(35 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(35 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of SRAM_256wx36b is
  component UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
  end component;
begin
 m : UMC_SIM_SRAM generic map (8, 36) port map (a, data, csn, wen, oen, q, clk);
end;

library ieee;
use ieee.std_logic_1164.all;

entity SRAM_128wx36b is
  port (
	a    : in  std_logic_vector(6 downto 0);
	data : in  std_logic_vector(35 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(35 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of SRAM_128wx36b is
  component UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
  end component;
begin
 m : UMC_SIM_SRAM generic map (7, 36) port map (a, data, csn, wen, oen, q, clk);
end;

library ieee;
use ieee.std_logic_1164.all;

entity SRAM_64wx36b is
  port (
	a    : in  std_logic_vector(5 downto 0);
	data : in  std_logic_vector(35 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(35 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of SRAM_64wx36b is
  component UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
  end component;
begin
 m : UMC_SIM_SRAM generic map (6, 36) port map (a, data, csn, wen, oen, q, clk);
end;

library ieee;
use ieee.std_logic_1164.all;

entity SRAM_32wx36b is
  port (
	a    : in  std_logic_vector(4 downto 0);
	data : in  std_logic_vector(35 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(35 downto 0);
	clk  : in  std_logic
       );
end;
architecture behav of SRAM_32wx36b is
  component UMC_SIM_SRAM is
  generic (abits, dbits : integer := 8);
  port (
	a    : in  std_logic_vector(abits-1 downto 0);
	data : in  std_logic_vector(dbits-1 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(dbits-1 downto 0);
	clk  : in  std_logic
       );
  end component;
begin
 m : UMC_SIM_SRAM generic map (5, 36) port map (a, data, csn, wen, oen, q, clk);
end;

