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
-- Package: 	umc_components
-- File:	umc_components.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	UMC 0.18 component declarations
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package umc_components is

  -- input pad

  component ICMT3V port( A : in std_logic; Z : out std_logic); end component;

  -- input pad with pull-up

  component ICMT3VPU port( A : in std_logic; Z : out std_logic); end component;

  -- input pad with pull-down

  component ICMT3VPD port( A : in std_logic; Z : out std_logic); end component;

  -- schmitt input pad

  component ISTRT3V port( A : in std_logic; Z : out std_logic); end component;

  -- output pads

  component OCM3V4 port( Z : out std_logic; A : in std_logic); end component;
  component OCM3V12 port( Z : out std_logic; A : in std_logic); end component;
  component OCM3V24 port( Z : out std_logic; A : in std_logic); end component;


  -- tri-state output pads

  component OCMTR4 port( EN : in std_logic; A : in std_logic; Z : out std_logic); end component;
  component OCMTR12 port( EN : in std_logic; A : in std_logic; Z : out std_logic); end component;
  component OCMTR24 port( EN : in std_logic; A : in std_logic; Z : out std_logic); end component;

  -- bidirectional pads

  component BICM3V4 port( IO : inout std_logic; EN : in std_logic; A : in std_logic; Z : out std_logic); end component;
  component BICM3V12 port( IO : inout std_logic; EN : in std_logic; A : in std_logic; Z : out std_logic); end component;
  component BICM3V24 port( IO : inout std_logic; EN : in std_logic; A : in std_logic; Z : out std_logic); end component;

  -- single-port memory

  component SRAM_2048wx32b is
  port (
	a    : in  std_logic_vector(10 downto 0);
	data : in  std_logic_vector(31 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(31 downto 0);
	clk  : in  std_logic
       );
  end component;

  component SRAM_1024wx32b is
  port (
	a    : in  std_logic_vector(9 downto 0);
	data : in  std_logic_vector(31 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(31 downto 0);
	clk  : in  std_logic
       );
  end component;

  component SRAM_512wx32b is
  port (
	a    : in  std_logic_vector(8 downto 0);
	data : in  std_logic_vector(31 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(31 downto 0);
	clk  : in  std_logic
       );
  end component;

  component SRAM_256wx32b is
  port (
	a    : in  std_logic_vector(7 downto 0);
	data : in  std_logic_vector(31 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(31 downto 0);
	clk  : in  std_logic
       );
  end component;

  component SRAM_128wx32b is
  port (
	a    : in  std_logic_vector(6 downto 0);
	data : in  std_logic_vector(31 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(31 downto 0);
	clk  : in  std_logic
       );
  end component;

  component SRAM_64wx32b is
  port (
	a    : in  std_logic_vector(5 downto 0);
	data : in  std_logic_vector(31 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(31 downto 0);
	clk  : in  std_logic
       );
  end component;

  component SRAM_32wx32b is
  port (
	a    : in  std_logic_vector(4 downto 0);
	data : in  std_logic_vector(31 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(31 downto 0);
	clk  : in  std_logic
       );
  end component;

  component SRAM_2048wx36b is
  port (
	a    : in  std_logic_vector(10 downto 0);
	data : in  std_logic_vector(35 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(35 downto 0);
	clk  : in  std_logic
       );
  end component;

  component SRAM_1024wx36b is
  port (
	a    : in  std_logic_vector(9 downto 0);
	data : in  std_logic_vector(35 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(35 downto 0);
	clk  : in  std_logic
       );
  end component;

  component SRAM_512wx36b is
  port (
	a    : in  std_logic_vector(8 downto 0);
	data : in  std_logic_vector(35 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(35 downto 0);
	clk  : in  std_logic
       );
  end component;

  component SRAM_256wx36b is
  port (
	a    : in  std_logic_vector(7 downto 0);
	data : in  std_logic_vector(35 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(35 downto 0);
	clk  : in  std_logic
       );
  end component;

  component SRAM_128wx36b is
  port (
	a    : in  std_logic_vector(6 downto 0);
	data : in  std_logic_vector(35 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(35 downto 0);
	clk  : in  std_logic
       );
  end component;

  component SRAM_64wx36b is
  port (
	a    : in  std_logic_vector(5 downto 0);
	data : in  std_logic_vector(35 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(35 downto 0);
	clk  : in  std_logic
       );
  end component;

  component SRAM_32wx36b is
  port (
	a    : in  std_logic_vector(4 downto 0);
	data : in  std_logic_vector(35 downto 0);
	csn  : in  std_logic;
	wen  : in  std_logic;
	oen  : in  std_logic;
	q    : out std_logic_vector(35 downto 0);
	clk  : in  std_logic
       );
  end component;

end;

