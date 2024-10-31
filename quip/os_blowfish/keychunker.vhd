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

ENTITY keychunker IS
PORT (
	key       : IN  std_logic_vector(447 downto 0);
	key_size  : IN  std_logic_vector(3 downto 0);  -- key size in 32-bit chunks

	keychunk_blob  : OUT std_logic_vector(447 downto 0)
);
END keychunker;

ARCHITECTURE fishy OF keychunker IS

	TYPE KEYCHUNK_TYPE IS ARRAY (0 to 13) OF std_logic_vector(31 downto 0); 
	SIGNAL keychunk : KEYCHUNK_TYPE;

BEGIN

	keychunk_blob(31 downto 0) <= keychunk(0);
	keychunk_blob(63 downto 32) <= keychunk(1);
	keychunk_blob(95 downto 64) <= keychunk(2);
	keychunk_blob(127 downto 96) <= keychunk(3);
	keychunk_blob(159 downto 128) <= keychunk(4);
	keychunk_blob(191 downto 160) <= keychunk(5);
	keychunk_blob(223 downto 192) <= keychunk(6);
	keychunk_blob(255 downto 224) <= keychunk(7);
	keychunk_blob(287 downto 256) <= keychunk(8);
	keychunk_blob(319 downto 288) <= keychunk(9);
	keychunk_blob(351 downto 320) <= keychunk(10);
	keychunk_blob(383 downto 352) <= keychunk(11);
	keychunk_blob(415 downto 384) <= keychunk(12);
	keychunk_blob(447 downto 416) <= keychunk(13);

	-- a process to chunk up the key ;
	-- if the key_size was to be hard_coded, this could be eliminated
	-- and reduce the logic for this implementation quite a bit.
	PROCESS (key, key_size)
	BEGIN
		CASE key_size IS
		WHEN "0001" =>
			keychunk(0) <= key(31 downto 0);
			keychunk(1) <= key(31 downto 0);
			keychunk(2) <= key(31 downto 0);
			keychunk(3) <= key(31 downto 0);
			keychunk(4) <= key(31 downto 0);
			keychunk(5) <= key(31 downto 0);
			keychunk(6) <= key(31 downto 0);
			keychunk(7) <= key(31 downto 0);
			keychunk(8) <= key(31 downto 0);
			keychunk(9) <= key(31 downto 0);
			keychunk(10) <= key(31 downto 0);
			keychunk(11) <= key(31 downto 0);
			keychunk(12) <= key(31 downto 0);
			keychunk(13) <= key(31 downto 0);
		WHEN "0010" =>
			keychunk(0) <= key(31 downto 0);
			keychunk(1) <= key(63 downto 32);
			keychunk(2) <= key(31 downto 0);
			keychunk(3) <= key(63 downto 32);
			keychunk(4) <= key(31 downto 0);
			keychunk(5) <= key(63 downto 32);
			keychunk(6) <= key(31 downto 0);
			keychunk(7) <= key(63 downto 32);
			keychunk(8) <= key(31 downto 0);
			keychunk(9) <= key(63 downto 32);
			keychunk(10) <= key(31 downto 0);
			keychunk(11) <= key(63 downto 32);
			keychunk(12) <= key(31 downto 0);
			keychunk(13) <= key(63 downto 32);
		WHEN "0011" =>
			keychunk(0) <= key(31 downto 0);
			keychunk(1) <= key(63 downto 32);
			keychunk(2) <= key(95 downto 64);
			keychunk(3) <= key(31 downto 0);
			keychunk(4) <= key(63 downto 32);
			keychunk(5) <= key(95 downto 64);
			keychunk(6) <= key(31 downto 0);
			keychunk(7) <= key(63 downto 32);
			keychunk(8) <= key(95 downto 64);
			keychunk(9) <= key(31 downto 0);
			keychunk(10) <= key(63 downto 32);
			keychunk(11) <= key(95 downto 64);
			keychunk(12) <= key(31 downto 0);
			keychunk(13) <= key(63 downto 32);
		WHEN "0100" =>
			keychunk(0) <= key(31 downto 0);
			keychunk(1) <= key(63 downto 32);
			keychunk(2) <= key(95 downto 64);
			keychunk(3) <= key(127 downto 96);
			keychunk(4) <= key(31 downto 0);
			keychunk(5) <= key(63 downto 32);
			keychunk(6) <= key(95 downto 64);
			keychunk(7) <= key(127 downto 96);
			keychunk(8) <= key(31 downto 0);
			keychunk(9) <= key(63 downto 32);
			keychunk(10) <= key(95 downto 64);
			keychunk(11) <= key(127 downto 96);
			keychunk(12) <= key(31 downto 0);
			keychunk(13) <= key(63 downto 32);
		WHEN "0101" =>
			keychunk(0) <= key(31 downto 0);
			keychunk(1) <= key(63 downto 32);
			keychunk(2) <= key(95 downto 64);
			keychunk(3) <= key(127 downto 96);
			keychunk(4) <= key(159 downto 128);
			keychunk(5) <= key(31 downto 0);
			keychunk(6) <= key(63 downto 32);
			keychunk(7) <= key(95 downto 64);
			keychunk(8) <= key(127 downto 96);
			keychunk(9) <= key(159 downto 128);
			keychunk(10) <= key(31 downto 0);
			keychunk(11) <= key(63 downto 32);
			keychunk(12) <= key(95 downto 64);
			keychunk(13) <= key(127 downto 96);
		WHEN "0110" =>
			keychunk(0) <= key(31 downto 0);
			keychunk(1) <= key(63 downto 32);
			keychunk(2) <= key(95 downto 64);
			keychunk(3) <= key(127 downto 96);
			keychunk(4) <= key(159 downto 128);
			keychunk(5) <= key(191 downto 160);
			keychunk(6) <= key(31 downto 0);
			keychunk(7) <= key(63 downto 32);
			keychunk(8) <= key(95 downto 64);
			keychunk(9) <= key(127 downto 96);
			keychunk(10) <= key(159 downto 128);
			keychunk(11) <= key(191 downto 160);
			keychunk(12) <= key(31 downto 0);
			keychunk(13) <= key(63 downto 32);
		WHEN "0111" =>
			keychunk(0) <= key(31 downto 0);
			keychunk(1) <= key(63 downto 32);
			keychunk(2) <= key(95 downto 64);
			keychunk(3) <= key(127 downto 96);
			keychunk(4) <= key(159 downto 128);
			keychunk(5) <= key(191 downto 160);
			keychunk(6) <= key(223 downto 192);
			keychunk(7) <= key(31 downto 0);
			keychunk(8) <= key(63 downto 32);
			keychunk(9) <= key(95 downto 64);
			keychunk(10) <= key(127 downto 96);
			keychunk(11) <= key(159 downto 128);
			keychunk(12) <= key(191 downto 160);
			keychunk(13) <= key(223 downto 192);
		WHEN "1000" =>
			keychunk(0) <= key(31 downto 0);
			keychunk(1) <= key(63 downto 32);
			keychunk(2) <= key(95 downto 64);
			keychunk(3) <= key(127 downto 96);
			keychunk(4) <= key(159 downto 128);
			keychunk(5) <= key(191 downto 160);
			keychunk(6) <= key(223 downto 192);
			keychunk(7) <= key(255 downto 224);
			keychunk(8) <= key(31 downto 0);
			keychunk(9) <= key(63 downto 32);
			keychunk(10) <= key(95 downto 64);
			keychunk(11) <= key(127 downto 96);
			keychunk(12) <= key(159 downto 128);
			keychunk(13) <= key(191 downto 160);
		WHEN "1001" =>
			keychunk(0) <= key(31 downto 0);
			keychunk(1) <= key(63 downto 32);
			keychunk(2) <= key(95 downto 64);
			keychunk(3) <= key(127 downto 96);
			keychunk(4) <= key(159 downto 128);
			keychunk(5) <= key(191 downto 160);
			keychunk(6) <= key(223 downto 192);
			keychunk(7) <= key(255 downto 224);
			keychunk(8) <= key(287 downto 256);
			keychunk(9) <= key(31 downto 0);
			keychunk(10) <= key(63 downto 32);
			keychunk(11) <= key(95 downto 64);
			keychunk(12) <= key(127 downto 96);
			keychunk(13) <= key(159 downto 128);
		WHEN "1010" =>
			keychunk(0) <= key(31 downto 0);
			keychunk(1) <= key(63 downto 32);
			keychunk(2) <= key(95 downto 64);
			keychunk(3) <= key(127 downto 96);
			keychunk(4) <= key(159 downto 128);
			keychunk(5) <= key(191 downto 160);
			keychunk(6) <= key(223 downto 192);
			keychunk(7) <= key(255 downto 224);
			keychunk(8) <= key(287 downto 256);
			keychunk(9) <= key(319 downto 288);
			keychunk(10) <= key(31 downto 0);
			keychunk(11) <= key(63 downto 32);
			keychunk(12) <= key(95 downto 64);
			keychunk(13) <= key(127 downto 96);
		WHEN "1011" =>
			keychunk(0) <= key(31 downto 0);
			keychunk(1) <= key(63 downto 32);
			keychunk(2) <= key(95 downto 64);
			keychunk(3) <= key(127 downto 96);
			keychunk(4) <= key(159 downto 128);
			keychunk(5) <= key(191 downto 160);
			keychunk(6) <= key(223 downto 192);
			keychunk(7) <= key(255 downto 224);
			keychunk(8) <= key(287 downto 256);
			keychunk(9) <= key(319 downto 288);
			keychunk(10) <= key(351 downto 320);
			keychunk(11) <= key(31 downto 0);
			keychunk(12) <= key(63 downto 32);
			keychunk(13) <= key(95 downto 64);
		WHEN "1100" =>
			keychunk(0) <= key(31 downto 0);
			keychunk(1) <= key(63 downto 32);
			keychunk(2) <= key(95 downto 64);
			keychunk(3) <= key(127 downto 96);
			keychunk(4) <= key(159 downto 128);
			keychunk(5) <= key(191 downto 160);
			keychunk(6) <= key(223 downto 192);
			keychunk(7) <= key(255 downto 224);
			keychunk(8) <= key(287 downto 256);
			keychunk(9) <= key(319 downto 288);
			keychunk(10) <= key(351 downto 320);
			keychunk(11) <= key(383 downto 352);
			keychunk(12) <= key(31 downto 0);
			keychunk(13) <= key(63 downto 32);
		WHEN "1101" =>
			keychunk(0) <= key(31 downto 0);
			keychunk(1) <= key(63 downto 32);
			keychunk(2) <= key(95 downto 64);
			keychunk(3) <= key(127 downto 96);
			keychunk(4) <= key(159 downto 128);
			keychunk(5) <= key(191 downto 160);
			keychunk(6) <= key(223 downto 192);
			keychunk(7) <= key(255 downto 224);
			keychunk(8) <= key(287 downto 256);
			keychunk(9) <= key(319 downto 288);
			keychunk(10) <= key(351 downto 320);
			keychunk(11) <= key(383 downto 352);
			keychunk(12) <= key(415 downto 384);
			keychunk(13) <= key(31 downto 0);
		WHEN OTHERS =>
			keychunk(0) <= key(31 downto 0);
			keychunk(1) <= key(63 downto 32);
			keychunk(2) <= key(95 downto 64);
			keychunk(3) <= key(127 downto 96);
			keychunk(4) <= key(159 downto 128);
			keychunk(5) <= key(191 downto 160);
			keychunk(6) <= key(223 downto 192);
			keychunk(7) <= key(255 downto 224);
			keychunk(8) <= key(287 downto 256);
			keychunk(9) <= key(319 downto 288);
			keychunk(10) <= key(351 downto 320);
			keychunk(11) <= key(383 downto 352);
			keychunk(12) <= key(415 downto 384);
			keychunk(13) <= key(447 downto 416);
		END CASE;
	END PROCESS;

END;
