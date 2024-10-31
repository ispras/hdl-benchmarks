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
-- File:	mem_ihp25_gen.vhd
-- Author:	Marko Isomaki, Gaisler Research
-- Description:	Memory generators for IHP 0.25 um rams
------------------------------------------------------------------------------

library ieee;
library ihp25; 
use ieee.std_logic_1164.all;
use ihp25.ihp25_components.all; 

entity ihp25_syncram is
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (
    clk      : in std_logic;
    address  : in std_logic_vector(abits -1 downto 0);
    datain   : in std_logic_vector(dbits -1 downto 0);
    dataout  : out std_logic_vector(dbits -1 downto 0);
    enable   : in std_logic;
    write    : in std_logic
  );
end;

architecture rtl of ihp25_syncram is
  signal cen  : std_logic;
  signal a    : std_logic_vector(9 downto 0);
  signal d, q : std_logic_vector(128 downto 0);
  signal OEN  : std_logic_vector(3 downto 0);
  signal nWEN : std_ulogic; 
begin

  cen <= not enable;
  a(abits -1 downto 0) <= address;
  a(9 downto abits) <= (others => '0'); 
  d(dbits -1 downto 0) <= datain;
  d(128 downto dbits) <= (others => '0');
  dataout <= q(dbits -1 downto 0);
  OEN <= (others => '1'); nWEN <= write;
 
  a9d32: if (abits < 10) generate
    x : for i in 0 to ((dbits-1)/32) generate
      ram0 : sram2k_pin port map(
       Q(0+i*32),  Q(1+i*32),  Q(2+i*32),  Q(3+i*32), 
       Q(4+i*32),  Q(5+i*32),  Q(6+i*32),  Q(7+i*32),
       Q(8+i*32),  Q(9+i*32),  Q(10+i*32), Q(11+i*32), 
       Q(12+i*32), Q(13+i*32), Q(14+i*32), Q(15+i*32), 
       Q(16+i*32), Q(17+i*32), Q(18+i*32), Q(19+i*32), 
       Q(20+i*32), Q(21+i*32), Q(22+i*32), Q(23+i*32), 
       Q(24+i*32), Q(25+i*32), Q(26+i*32), Q(27+i*32), 
       Q(28+i*32), Q(29+i*32), Q(30+i*32), Q(31+i*32), 
       D(0+i*32),  D(1+i*32),  D(2+i*32),  D(3+i*32), 
       D(4+i*32),  D(5+i*32),  D(6+i*32),  D(7+i*32), 
       D(8+i*32),  D(9+i*32),  D(10+i*32), D(11+i*32), 
       D(12+i*32), D(13+i*32), D(14+i*32), D(15+i*32), 
       D(16+i*32), D(17+i*32), D(18+i*32), D(19+i*32), 
       D(20+i*32), D(21+i*32), D(22+i*32), D(23+i*32), 
       D(24+i*32), D(25+i*32), D(26+i*32), D(27+i*32), 
       D(28+i*32), D(29+i*32), D(30+i*32), D(31+i*32),
       A(0), A(1), A(2), A(3), A(4), A(5), A(6), A(7), A(8), 
       OEN(0), OEN(1), OEN(2), OEN(3), 
       nWEN, nWEN, nWEN, nWEN, CLK, nWEN, CEN
      );
    end generate;
  end generate;

end architecture;

