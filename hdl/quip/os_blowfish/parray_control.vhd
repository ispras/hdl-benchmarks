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

ENTITY parray_control IS
PORT (
	clk  : IN std_logic;

	init_parray : IN bit; -- tells us to initialize the parray
	sub_parray  : IN bit; -- tells us to run the zero_block through

	sub_parray_done : OUT bit;

	sboxes_zero_block : OUT std_logic_vector(63 downto 0); -- to sboxes_control

	parray_init_addr  : BUFFER std_logic_vector(4 downto 0);
	parray_init_chunk : OUT std_logic_vector(31 downto 0);
	parray_init_data  : IN  std_logic_vector(31 downto 0);
	parray_addr     : OUT std_logic_vector(4 downto 0);
	parray_data_in  : OUT std_logic_vector(31 downto 0);
	parray_data_out : IN  std_logic_vector(31 downto 0);
	parray_we   : OUT bit;
	parray_crypt_go : OUT bit;
	parray_crypt_ptext : OUT std_logic_vector(63 downto 0);

	crypt_ctext : IN  std_logic_vector(63 downto 0);
	crypt_parray_addr : IN std_logic_vector(4 downto 0);
	crypt_parray_data : OUT std_logic_vector(31 downto 0);
	crypt_done : IN bit;

	-- Replaced key-blobbing with key itself (efficient shift register implementation)
	key       : in  std_logic_vector(447 downto 0);
	key_size  : in  std_logic_vector(3 downto 0)  -- key size in 32-bit chunks
);
END parray_control;

ARCHITECTURE fishy OF parray_control IS

	TYPE PARRAY_STATES IS (PASS, INIT, SUB, SUB_WRITE1, SUB_WRITE2);
	SIGNAL parray_state  : PARRAY_STATES;  

	TYPE KEYCHUNK_TYPE IS ARRAY (0 to 13) OF std_logic_vector(31 downto 0); 
	SIGNAL keychunk_shifter : KEYCHUNK_TYPE;

	SIGNAL zero_block : std_logic_vector(63 downto 0);
  
BEGIN

	-- process to control parray initialization
	PROCESS (clk)
		VARIABLE just_started : std_logic;
	BEGIN
		IF (clk'event AND clk = '1') THEN
			sub_parray_done <= '0';
			CASE (parray_state) IS
			WHEN SUB =>
				IF (crypt_done = '1' AND just_started = '0') THEN
					parray_state <= SUB_WRITE1;
					--parray_init_addr - don't modify it
					parray_crypt_go <= '0';
				ELSE
					just_started := '0';
					parray_state <= SUB;
					--parray_init_addr - don't modify it
					parray_crypt_go <= '0';
				END IF;
			WHEN SUB_WRITE1 =>
				parray_state <= SUB_WRITE2;
				parray_init_addr <= parray_init_addr + 1;
				parray_crypt_go <= '0';
			WHEN SUB_WRITE2 =>
				IF (parray_init_addr = 17) THEN
					parray_state <= PASS;
					parray_crypt_go <= '0';
				ELSE
					parray_state <= SUB;
					parray_crypt_go <= '1';
				END IF;
				parray_init_addr <= parray_init_addr + 1;
				just_started := '1';            -- so we don't write two in a row!
			WHEN OTHERS =>
				IF (sub_parray = '1') THEN
					parray_state <= SUB;
					parray_init_addr <= (others => '0');
					parray_crypt_go <= '1';  
					just_started := '1';
				ELSIF (parray_state = INIT) THEN
					IF (parray_init_addr = 17) THEN
						parray_state <= PASS;
					ELSE
						parray_state <= INIT;
					END IF;
					parray_init_addr <= parray_init_addr + 1;
					parray_crypt_go <= '0';
				ELSIF (init_parray = '1') THEN
					parray_state <= INIT;
					parray_init_addr <= (others => '0');
					parray_crypt_go <= '0';
				ELSE -- if we're not initializing, just pass-through
					parray_state <= PASS;
					parray_init_addr <= (others => '0');
					parray_crypt_go <= '0';
					sub_parray_done <= '1';
				END IF;
			END CASE;
		END IF;
	END PROCESS;

	-- process to shift keychunks
	PROCESS (clk)
		VARIABLE just_started : std_logic;
	BEGIN
		IF (clk'event AND clk = '1') THEN
			FOR i IN 0 TO 13 LOOP
				IF (sub_parray /= '1') AND (init_parray = '1') AND (parray_state = PASS) THEN

					-- load the shifter with the key-chunks
					keychunk_shifter(i) <= key((32*i)+31 downto (32*i)+0);

				ELSE

					-- shift out the next keychunk, wrapping at key_size
					IF (i = TO_INTEGER(UNSIGNED(key_size))-1) THEN
						-- wrap key at key_size location
						keychunk_shifter(i) <= keychunk_shifter(0);
					ELSIF (i /= 13) THEN
						keychunk_shifter(i) <= keychunk_shifter(i+1);
					END IF;

				END IF;
			END LOOP;
		END IF;
	END PROCESS;


	parray_init_chunk <= keychunk_shifter(0);


	-- process to control the zero_block used in initalizations
	PROCESS (clk)
	BEGIN
		IF (clk'event AND clk = '1') THEN
			IF (parray_state = SUB_WRITE1) THEN
				zero_block <= crypt_ctext;
				sboxes_zero_block <= crypt_ctext;
			ELSIF (sub_parray = '1') THEN
				zero_block <= (others => '0');
			END IF;
		END IF;
	END PROCESS;

	parray_crypt_ptext <= zero_block;

	crypt_parray_data <= parray_data_out;

	-- process to allow parray init or passthrough to crypt
	PROCESS (parray_state, parray_init_addr, parray_init_data, crypt_parray_addr,
		crypt_ctext)
	BEGIN
		CASE (parray_state) IS
		WHEN SUB_WRITE1 =>
			parray_we <= '1';
			parray_addr <= parray_init_addr;
			parray_data_in <= crypt_ctext(63 downto 32);
		WHEN SUB_WRITE2 =>
			parray_we <= '1';
			parray_addr <= parray_init_addr;
			parray_data_in <= crypt_ctext(31 downto 0);
		WHEN INIT =>
			parray_we <= '1';
			parray_addr <= parray_init_addr;
			parray_data_in <= parray_init_data;
		WHEN OTHERS =>
			parray_we <= '0';
			parray_addr <= crypt_parray_addr;
			parray_data_in <= (others => '0');
		END CASE;
	END PROCESS;

END;

