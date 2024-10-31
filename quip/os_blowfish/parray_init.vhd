-- "blowfishvhdl" is a free synthesizable VHDL Blowfish implementation
-- Copyright (C) 2000  Wesley J. Landaker <wjl@mindless.com>

-- Speed and Size Optimizations: 14/Mar/2004
-- Paul Metzgen <pmetzgen@altera.com>  

-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

-- See http://blowfishvhdl.sourceforge.net for more information.


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY parray_init IS
PORT (
	keychunk : IN  std_logic_vector(31 downto 0); 
	address  : IN  std_logic_vector(4 downto 0);
	data     : OUT std_logic_vector(31 downto 0)
);
END parray_init;

ARCHITECTURE fishy OF parray_init IS
	TYPE parray_data IS ARRAY (0 to 18) OF std_logic_vector(31 downto 0); 	-- Location 18 is needed because counters overrun 
	SIGNAL contents : parray_data;

	SIGNAL data_raw : std_logic_vector(31 downto 0);       

BEGIN

	data_raw <= contents(TO_INTEGER(UNSIGNED(address)));

	data <= data_raw XOR keychunk;


	contents(0)  <= x"243f6a88";
	contents(1)  <= x"85a308d3";
	contents(2)  <= x"13198a2e";
	contents(3)  <= x"03707344";
	contents(4)  <= x"a4093822";
	contents(5)  <= x"299f31d0";
	contents(6)  <= x"082efa98";
	contents(7)  <= x"ec4e6c89";
	contents(8)  <= x"452821e6";
	contents(9)  <= x"38d01377";
	contents(10) <= x"be5466cf";
	contents(11) <= x"34e90c6c";
	contents(12) <= x"c0ac29b7";
	contents(13) <= x"c97c50dd";
	contents(14) <= x"3f84d5b5";
	contents(15) <= x"b5470917";
	contents(16) <= x"9216d5d9";
	contents(17) <= x"8979fb1b";
	contents(18) <= x"00000000"; 		-- Location 18 is needed because counters overrun 
  
END;
