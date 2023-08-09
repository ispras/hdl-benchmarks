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

ENTITY sbox IS
PORT (
	clk : IN std_logic;

	address  : IN  std_logic_vector(7 downto 0);
	data_in  : IN  std_logic_vector(31 downto 0);
	data_out : OUT std_logic_vector(31 downto 0);

	we : IN bit
);
END sbox;

ARCHITECTURE fishy OF sbox IS
	TYPE sbox_data IS ARRAY (0 to 255) OF std_logic_vector(31 downto 0); 
	SIGNAL contents : sbox_data;
BEGIN

	PROCESS (clk)
	BEGIN
		IF (clk'event AND clk = '1') THEN
			IF (we = '1') THEN
				contents(TO_INTEGER(UNSIGNED(address))) <= data_in;
			END IF; -- we
			data_out <= contents(TO_INTEGER(UNSIGNED(address)));
		END IF; -- clk
	END PROCESS;

END;
