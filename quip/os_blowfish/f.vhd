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

ENTITY F IS
PORT (
	clk   : IN std_logic;

	sbox0_addr : OUT std_logic_vector(7 downto 0);
	sbox1_addr : OUT std_logic_vector(7 downto 0);
	sbox2_addr : OUT std_logic_vector(7 downto 0);
	sbox3_addr : OUT std_logic_vector(7 downto 0);

	sbox0_data : IN std_logic_vector(31 downto 0);
	sbox1_data : IN std_logic_vector(31 downto 0);
	sbox2_data : IN std_logic_vector(31 downto 0);
	sbox3_data : IN std_logic_vector(31 downto 0);

	xL   : IN std_logic_vector(31 downto 0);

	-- FxL = (FxL_0 + FxL_1)
	FxL_0  : OUT std_logic_vector(31 downto 0);
	FxL_1  : OUT std_logic_vector(31 downto 0)
);
END F;

ARCHITECTURE fishy OF F IS

	SIGNAL a : std_logic_vector(7 downto 0);
	SIGNAL b : std_logic_vector(7 downto 0);
	SIGNAL c : std_logic_vector(7 downto 0);
	SIGNAL d : std_logic_vector(7 downto 0);

BEGIN

	-- chunk xL up into bytes
	a <= xL(31 downto 24);
	b <= xL(23 downto 16);
	c <= xL(15 downto 8);
	d <= xL(7 downto 0);

	-- now look these up in the sboxes
	sbox0_addr <= a;
	sbox1_addr <= b;
	sbox2_addr <= c;
	sbox3_addr <= d;

	-- and get the result! (of the last cycle, anyway)
	FxL_0 <= ((sbox0_data + sbox1_data) XOR sbox2_data);
	FxL_1 <= sbox3_data;

END;
