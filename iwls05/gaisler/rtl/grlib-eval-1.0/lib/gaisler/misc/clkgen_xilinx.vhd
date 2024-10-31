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
-- File:	clkgen_xilinx.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Author:	Richard Pender, Pender Electronic Design
-- Description:	Clock generators for Virtex and Virtex-2 fpgas
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.vcomponents.all;
library gaisler;
use gaisler.misc.all;
use gaisler.libclk.all;
use gaisler.pad_xilinx.all;
library grlib;
use grlib.stdlib.all;
use grlib.tech.all;

------------------------------------------------------------------
-- Virtex2 clock generator ---------------------------------------
------------------------------------------------------------------

entity clkgen_virtex2 is
  generic (
    clk_mul  : integer := 1; 
    clk_div  : integer := 1;
    sdramen  : integer := 0;
    sdinvclk : integer := 0;
    pcien    : integer := 0;
    pcidll   : integer := 0;
    pcisysclk: integer := 0;
    freq     : integer := 25000);	-- clock frequency in KHz
  port (
    clkin   : in  std_logic;
    pciclkin: in  std_logic;
    clk     : out std_logic;			-- main clock
    clkn    : out std_logic;			-- inverted main clock
    sdclk   : out std_logic;			-- SDRAM clock
    pciclk  : out std_logic;			-- PCI clock
    cgi     : in clkgen_in_type;
    cgo     : out clkgen_out_type);
end; 

architecture struct of clkgen_virtex2 is 

constant VERSION : integer := 1;
constant CLKIN_PERIOD_ST : string := "25";
attribute CLKIN_PERIOD : string;
attribute CLKIN_PERIOD of dll0: label is CLKIN_PERIOD_ST;
signal gnd, Clk_i, Clk_j, Clk_k, Clk_l, Clk_m, dll0rst, dll0lock, dll1lock : std_logic;
signal dll1rst : std_logic_vector(0 to 3);
signal Clk0B, Clk_FB, Clkint, pciclkint : std_logic;

begin

  gnd <= '0'; clk <= clk_i; clkn <= clk_m;

  c0 : if (PCISYSCLK = 0) or (PCIEN = 0) generate
    clkint <= clkin;
  end generate;

  c2 : if PCIEN /= 0 generate
    pciclkint <= pciclkin;
    p3 : if PCISYSCLK = 1 generate clkint <= pciclkint; end generate;
    p0 : if PCIDLL = 1 generate
      u1 : BUFGDLL port map (I => pciclkint, O => pciclk);
    end generate;
    p1 : if PCIDLL = 0 generate 
      u1 : BUFG port map (I => pciclkint, O => pciclk);
    end generate;
  end generate;

  c3 : if PCIEN = 0 generate 
    pciclk <= '0';
  end generate;

  bufg0 : BUFG port map (I => Clk0B, O => Clk_i);
  bufg1 : BUFG port map (I => Clk_j, O => Clk_k);
  bufg2 : BUFG port map (I => Clk_l, O => Clk_m);
  dll0rst <= not cgi.pllrst;
  dll0 : DCM 
    generic map (CLKFX_MULTIPLY => clk_mul, CLKFX_DIVIDE => clk_div)
    port map ( CLKIN => Clkint, CLKFB => Clk_k, DSSEN => gnd, PSCLK => gnd,
    PSEN => gnd, PSINCDEC => gnd, RST => dll0rst, CLK0 => Clk_j,
    CLKFX => Clk0B, CLKFX180 => Clk_l, LOCKED => dll0lock);
   
  sd0 : if (SDRAMEN /= 0) and (SDINVCLK=0) generate
    cgo.clklock <= dll1lock;
--    ibufg1 : IBUFG port map (I => cgi.pllref, O => Clk_FB);
    dll1 : DCM generic map (CLKFX_MULTIPLY => 2, CLKFX_DIVIDE => 2)
--      port map ( CLKIN => Clk_i, CLKFB => Clk_FB, DSSEN => gnd, PSCLK => gnd,
      port map ( CLKIN => Clk_i, CLKFB => cgi.pllref, DSSEN => gnd, PSCLK => gnd,
      PSEN => gnd, PSINCDEC => gnd, RST => dll1rst(0), CLK0 => sdclk, 
      LOCKED => dll1lock);
    rstdel : process (clk_i, dll0lock)
    begin
      if dll0lock = '0' then dll1rst <= (others => '1');
      elsif rising_edge(clk_i) then
	dll1rst <= dll1rst(1 to 3) & '0';
      end if;
    end process;
  end generate;

  sd1 : if (SDRAMEN = 0) or (SDINVCLK = 1) generate
    sdclk <= clk_i when SDINVCLK = 0 else not clk_i; 
    cgo.clklock <= dll0lock;
  end generate;

  cgo.pcilock <= '1';

-- pragma translate_off
  bootmsg : report_version 
  generic map (
    "clkgen_virtex2" & ": virtex-2 sdram/pci clock generator, version " & tost(VERSION),
    "clkgen_virtex2" & ": Frequency " &  tost(freq) & " KHz, DCM divisor " & tost(clk_mul) & "/" & tost(clk_div));
-- pragma translate_on


end;

library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.vcomponents.all;
library gaisler;
use gaisler.misc.all;
use gaisler.libclk.all;
use gaisler.pad_xilinx.all;
library grlib;
use grlib.tech.all;

entity clkgen_virtex is
  generic (
    clk_mul  : integer := 1; 
    clk_div  : integer := 1;
    sdramen  : integer := 0;
    sdinvclk : integer := 0;
    pcien    : integer := 0;
    pcidll   : integer := 0;
    pcisysclk: integer := 0);
port (
    clkin   : in  std_logic;
    pciclkin: in  std_logic;
    clk     : out std_logic;			-- main clock
    clkn    : out std_logic;			-- inverted main clock
    sdclk   : out std_logic;			-- SDRAM clock
    pciclk  : out std_logic;			-- PCI clock
    cgi     : in clkgen_in_type;
    cgo     : out clkgen_out_type
);
end;

architecture rtl of clkgen_virtex is

signal gnd, Clk_i, Clk_j, Clk_k, dll0rst, dll0lock, dll1lock : std_logic;
signal dll1rst : std_logic_vector(0 to 3);
signal Clk0B, Clk_FB, Clkint, CLK2X, CLKDV, CLK180, pciclkint : std_logic;

begin

  gnd <= '0'; clk <= clk_i; clkn <= not clk_i;

  c0 : if (PCISYSCLK = 0) or (PCIEN = 0) generate
    clkint <= clkin;
  end generate;

  c2 : if PCIEN /= 0 generate
    pciclkint <= pciclkin;
    p3 : if PCISYSCLK = 1 generate clkint <= pciclkint; end generate;
    p0 : if PCIDLL = 1 generate
      u1 : BUFGDLL port map (I => pciclkint, O => pciclk);
    end generate;
    p1 : if PCIDLL = 0 generate
      u1 : BUFG port map (I => pciclkint, O => pciclk);
    end generate;
  end generate;

  c3 : if PCIEN = 0 generate
    pciclk <= '0';
  end generate;

  bufg0 : BUFG port map (I => Clk0B, O => Clk_i);
  bufg1 : BUFG port map (I => Clk_j, O => Clk_k);
  dll0rst <= not cgi.pllrst;
  dll0 : CLKDLL 
    port map (CLKIN => Clkint, CLKFB => Clk_k, CLK0 => Clk_j, CLK180 => CLK180,
    CLK2X => CLK2X, CLKDV => CLKDV, LOCKED => dll0lock, RST => dll0rst);
   
  Clk0B <= CLK2X when clk_mul/clk_div = 2 
	else CLKDV when clk_div/clk_mul = 2 else Clk_j;

  sd0 : if (SDRAMEN /= 0) and (SDINVCLK = 0) generate
    ibufg1 : IBUFG port map (I => cgi.pllref, O => Clk_FB);
    cgo.clklock <= dll1lock;
    dll1 : CLKDLL 
      port map (CLKIN => Clk_i, CLKFB => Clk_FB, RST => dll1rst(0), CLK0 => sdclk,
	LOCKED => dll1lock);
    rstdel : process (clk_i)
    begin
      if dll0lock = '0' then dll1rst <= (others => '1');
      elsif rising_edge(clk_i) then
	dll1rst <= dll1rst(1 to 3) & '0';
      end if;
    end process;
  end generate;

  sd1 : if not ((SDRAMEN /= 0) and (SDINVCLK = 0)) generate
    sdclk <= not clk_i; cgo.clklock <= dll0lock;
  end generate;

  cgo.pcilock <= '1';

end;


