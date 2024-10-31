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
-- Package: 	tech.types
-- File:	types.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	technology specific types and constants
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package tech is

constant NTECH : integer := 12;
type tech_ability_type is array (0 to NTECH) of integer;

-- technologies and libraries

constant inferred    : integer := 0;
constant virtex      : integer := 1;
constant virtex2     : integer := 2;
constant memvirage   : integer := 3;
constant axcel       : integer := 4;
constant proasic     : integer := 5;
constant atc18       : integer := 6;
constant stratix     : integer := 7;
constant umc         : integer := 8;
constant rhumc       : integer := 9;
constant proasic3    : integer := 10;
constant spartan3    : integer := 11;
constant ihp25       : integer := 12; 

constant is_fpga : tech_ability_type :=
	(inferred => 1, virtex => 1, virtex2 => 1, memvirage => 0, 
	 axcel => 1, proasic => 1, atc18 => 0, stratix => 1, 
	 umc => 0, rhumc => 0, proasic3 => 1, spartan3 => 1,
         ihp25 => 0);

constant infer_mul : tech_ability_type := is_fpga;

constant syncram_2p_write_through : tech_ability_type :=
	(inferred => 0, virtex => 0, virtex2 => 1, memvirage => 1, 
	 axcel => 0, proasic => 0, atc18 => 0, stratix => 1, 
	 umc => 0, rhumc => 1, proasic3 => 0, spartan3 => 1,
         ihp25 => 0);

constant regfile_3p_write_through : tech_ability_type :=
	(inferred => 0, virtex => 0, virtex2 => 1, memvirage => 1, 
	 axcel => 0, proasic => 0, atc18 => 0, stratix => 1, 
	 umc => 0, rhumc => 1, proasic3 => 0, spartan3 => 1,
         ihp25 => 1);

constant regfile_3p_infer : tech_ability_type :=
	( rhumc => 1, ihp25 => 1, others => 0);

constant has_dpram : tech_ability_type :=
	(inferred => 0, virtex => 1, virtex2 => 1, memvirage => 1, 
	 axcel => 0, proasic => 0, atc18 => 0, stratix => 0, 
	 umc => 0, rhumc => 0, proasic3 => 1, spartan3 => 1,
         ihp25 => 0);

constant padoen_polarity : tech_ability_type :=
        (inferred => 0, virtex => 0, virtex2 => 0, memvirage => 0,
	 axcel => 1, proasic => 1, atc18 => 0, stratix => 0,
	 umc => 0, rhumc => 1, spartan3 => 0, proasic3 => 1,
         ihp25 => 1);

-- pragma translate_off

  subtype tech_description is string(1 to 8);

  type tech_table_type is array (0 to NTECH) of tech_description;

  constant tech_table : tech_table_type := (
  inferred  => "inferred", virtex  => "virtex  ", 
  virtex2  => "virtex2 ", memvirage  => "virage  ", 
  axcel    => "axcel   ", proasic => "proasic ",
  atc18    => "atc18   ", stratix => "stratix ",
  umc      => "umc     ", rhumc   => "rhumc   ",
  proasic3 => "proasic3",   spartan3 => "spartan3",
  ihp25    => "ihp25   ");

-- pragma translate_on

-- input/output voltage

constant x18v      : integer := 1;
constant x25v      : integer := 2;
constant x33v      : integer := 3;
constant x50v      : integer := 5;

-- input/output levels

constant ttl      : integer := 0;
constant cmos     : integer := 1;
constant pci33    : integer := 2;
constant pci66    : integer := 3;

-- output pad drive types

constant normal   : integer := 0;
constant pullup   : integer := 1;
constant pulldown : integer := 2;
constant opendrain: integer := 3;

--boards

constant noboard         : integer := 0;
constant gr_pci_xc2v     : integer := 1;
constant gr_cpci_xc2v    : integer := 2;
constant avnet_xcv1000e  : integer := 4;
constant tiggeler_xcv800 : integer := 5;
constant ge_hpe          : integer := 6;  -- Gleichmann Electronics HPE board
constant gr_3v1500       : integer := 7;
constant avnet_3v1500    : integer := 8;
constant gr_cpci_ax      : integer := 9;
constant nuho_sp31500    : integer := 10; -- Nuhorizons Spartan3-1500 board

end;
