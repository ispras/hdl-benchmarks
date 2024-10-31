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
-- File:	mem_rhumc_gen.vhd
-- Author:	Jiri Gaisler Gaisler Research
-- Description:	Memory generators for UMC rams
------------------------------------------------------------------------------

library ieee;
library umc;
use ieee.std_logic_1164.all;
use umc.umc_components.all;

entity rhumc_syncram is
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

architecture rtl of rhumc_syncram is
  signal d, q, gnd : std_logic_vector(36 downto 0);
  signal a : std_logic_vector(17 downto 0);
  signal vcc, csn, wen : std_ulogic;
  constant synopsys_bug : std_logic_vector(37 downto 0) := (others => '0');
begin

  csn <= not enable; wen <= not write;
  gnd <= (others => '0'); vcc <= '1';
  a(abits -1 downto 0) <= address; 
  d(dbits -1 downto 0) <= datain(dbits -1 downto 0); 
  a(17 downto abits) <= synopsys_bug(17 downto abits);
  d(36 downto dbits) <= synopsys_bug(36 downto dbits);
  dataout <= q(dbits -1 downto 0);
  q(36 downto dbits) <= synopsys_bug(36 downto dbits);

  d32 : if (dbits <= 32) generate
    a5d32 : if (abits <= 5) generate
      id0 : SRAM_32wx32b port map (a(4 downto 0), d(31 downto 0), csn, 
				   wen, gnd(0), q(31 downto 0), clk);
    end generate;
    a6d32 : if (abits = 6) generate
      id0 : SRAM_64wx32b port map (a(5 downto 0), d(31 downto 0), csn, 
				   wen, gnd(0), q(31 downto 0), clk);
    end generate;
    a7d32 : if (abits = 7) generate
      id0 : SRAM_128wx32b port map (a(6 downto 0), d(31 downto 0), csn, 
				   wen, gnd(0), q(31 downto 0), clk);
    end generate;
    a8d32 : if (abits = 8) generate
      id0 : SRAM_256wx32b port map (a(7 downto 0), d(31 downto 0), csn, 
				   wen, gnd(0), q(31 downto 0), clk);
    end generate;
    a9d32 : if (abits = 9) generate
      id0 : SRAM_512wx32b port map (a(8 downto 0), d(31 downto 0), csn, 
				   wen, gnd(0), q(31 downto 0), clk);
    end generate;
    a10d32 : if (abits = 10) generate
      id0 : SRAM_1024wx32b port map (a(9 downto 0), d(31 downto 0), csn, 
				   wen, gnd(0), q(31 downto 0), clk);
    end generate;
    a11d32 : if (abits = 11) generate
      id0 : SRAM_2048wx32b port map (a(10 downto 0), d(31 downto 0), csn, 
				   wen, gnd(0), q(31 downto 0), clk);
    end generate;
  end generate;

  d36 : if (dbits > 32) and  (dbits <= 36) generate
    a5d36 : if (abits <= 5) generate
      id0 : SRAM_32wx36b port map (a(4 downto 0), d(35 downto 0), csn, 
				   wen, gnd(0), q(35 downto 0), clk);
    end generate;
    a6d36 : if (abits = 6) generate
      id0 : SRAM_64wx36b port map (a(5 downto 0), d(35 downto 0), csn, 
				   wen, gnd(0), q(35 downto 0), clk);
    end generate;
    a7d36 : if (abits = 7) generate
      id0 : SRAM_128wx36b port map (a(6 downto 0), d(35 downto 0), csn, 
				   wen, gnd(0), q(35 downto 0), clk);
    end generate;
    a8d36 : if (abits = 8) generate
      id0 : SRAM_256wx36b port map (a(7 downto 0), d(35 downto 0), csn, 
				   wen, gnd(0), q(35 downto 0), clk);
    end generate;
    a9d36 : if (abits = 9) generate
      id0 : SRAM_512wx36b port map (a(8 downto 0), d(35 downto 0), csn, 
				   wen, gnd(0), q(35 downto 0), clk);
    end generate;
    a10d36 : if (abits = 10) generate
      id0 : SRAM_1024wx36b port map (a(9 downto 0), d(35 downto 0), csn, 
				   wen, gnd(0), q(35 downto 0), clk);
    end generate;
    a11d36 : if (abits = 11) generate
      id0 : SRAM_2048wx36b port map (a(10 downto 0), d(35 downto 0), csn, 
				   wen, gnd(0), q(35 downto 0), clk);
    end generate;
  end generate;

-- pragma translate_off
  a_to_high : if (abits > 12) or (dbits > 36) generate
    x : process
    begin
      assert false
      report  "Unsupported memory size (rhumc)"
      severity failure;
      wait;
    end process;
  end generate;
-- pragma translate_on

end;
