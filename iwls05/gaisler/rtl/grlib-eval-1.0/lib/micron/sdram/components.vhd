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
-- Package: 	components
-- File:	components.vhd
-- Author:	Jiri Gaisler, Gaisler Research
-- Description:	Component declaration of Micron SDRAM
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

package components is

  component mt48lc16m16a2
    GENERIC (
        -- Timing Parameters for -75 (PC133) and CAS Latency = 2
        tAC       : TIME    :=  6.0 ns;
        tHZ       : TIME    :=  7.0 ns;
        tOH       : TIME    :=  2.7 ns;
        tMRD      : INTEGER :=  2;          -- 2 Clk Cycles
        tRAS      : TIME    := 44.0 ns;
        tRC       : TIME    := 66.0 ns;
        tRCD      : TIME    := 20.0 ns;
        tRP       : TIME    := 20.0 ns;
        tRRD      : TIME    := 15.0 ns;
        tWRa      : TIME    :=  7.5 ns;     -- A2 Version - Auto precharge mode only (1 Clk + 7.5 ns)
        tWRp      : TIME    := 15.0 ns;     -- A2 Version - Precharge mode only (15 ns)

        tAH       : TIME    :=  0.8 ns;
        tAS       : TIME    :=  1.5 ns;
        tCH       : TIME    :=  2.5 ns;
        tCL       : TIME    :=  2.5 ns;
        tCK       : TIME    := 10.0 ns;
        tDH       : TIME    :=  0.8 ns;
        tDS       : TIME    :=  1.5 ns;
        tCKH      : TIME    :=  0.8 ns;
        tCKS      : TIME    :=  1.5 ns;
        tCMH      : TIME    :=  0.8 ns;
        tCMS      : TIME    :=  1.5 ns;

        addr_bits : INTEGER := 13;
        data_bits : INTEGER := 16;
        col_bits  : INTEGER :=  9;
        index     : INTEGER :=  0;
	fname     : string := "sdram.srec"	-- File to read from
    );
    PORT (
        Dq    : INOUT STD_LOGIC_VECTOR (data_bits - 1 DOWNTO 0) := (OTHERS => 'Z');
        Addr  : IN    STD_LOGIC_VECTOR (addr_bits - 1 DOWNTO 0) := (OTHERS => '0');
        Ba    : IN    STD_LOGIC_VECTOR := "00";
        Clk   : IN    STD_LOGIC := '0';
        Cke   : IN    STD_LOGIC := '1';
        Cs_n  : IN    STD_LOGIC := '1';
        Ras_n : IN    STD_LOGIC := '1';
        Cas_n : IN    STD_LOGIC := '1';
        We_n  : IN    STD_LOGIC := '1';
        Dqm   : IN    STD_LOGIC_VECTOR (1 DOWNTO 0) := "00"
    );
  end component;

end;
