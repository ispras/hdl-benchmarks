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

ENTITY sboxes_control IS
PORT (
	clk  : IN std_logic;

	init_sboxes : IN bit; -- tells us to initialize the sboxes
	sub_sboxes  : IN bit; -- tells us to run the zero_block through

	sub_sboxes_done : OUT bit;

	sboxes_zero_block : IN std_logic_vector(63 downto 0); -- to sboxes_control
	zero_block_grab   : IN bit;

	sbox_init_addr  : BUFFER std_logic_vector(7 downto 0);

	sbox0_init_data  : IN  std_logic_vector(31 downto 0);
	sbox1_init_data  : IN  std_logic_vector(31 downto 0);
	sbox2_init_data  : IN  std_logic_vector(31 downto 0);
	sbox3_init_data  : IN  std_logic_vector(31 downto 0);

	sbox0_addr     : OUT std_logic_vector(7 downto 0);
	sbox1_addr     : OUT std_logic_vector(7 downto 0);
	sbox2_addr     : OUT std_logic_vector(7 downto 0);
	sbox3_addr     : OUT std_logic_vector(7 downto 0);

	sbox0_data_in  : OUT std_logic_vector(31 downto 0);
	sbox1_data_in  : OUT std_logic_vector(31 downto 0);
	sbox2_data_in  : OUT std_logic_vector(31 downto 0);
	sbox3_data_in  : OUT std_logic_vector(31 downto 0);

	sbox0_data_out : IN  std_logic_vector(31 downto 0);
	sbox1_data_out : IN  std_logic_vector(31 downto 0);
	sbox2_data_out : IN  std_logic_vector(31 downto 0);
	sbox3_data_out : IN  std_logic_vector(31 downto 0);

	sbox0_we   : OUT bit;
	sbox1_we   : OUT bit;      
	sbox2_we   : OUT bit;
	sbox3_we   : OUT bit;

	sboxes_crypt_go : OUT bit;
	sboxes_crypt_ptext : OUT std_logic_vector(63 downto 0);

	crypt_ctext : IN  std_logic_vector(63 downto 0);

	F_sbox0_addr : IN std_logic_vector(7 downto 0);
	F_sbox1_addr : IN std_logic_vector(7 downto 0);
	F_sbox2_addr : IN std_logic_vector(7 downto 0);
	F_sbox3_addr : IN std_logic_vector(7 downto 0);

	F_sbox0_data : OUT std_logic_vector(31 downto 0);
	F_sbox1_data : OUT std_logic_vector(31 downto 0);
	F_sbox2_data : OUT std_logic_vector(31 downto 0);
	F_sbox3_data : OUT std_logic_vector(31 downto 0);

	crypt_done : IN bit
);
END sboxes_control;

ARCHITECTURE fishy OF sboxes_control IS

	TYPE SBOXES_STATES is (PASS, INIT, SUB, SUB_WRITE1, SUB_WRITE2);
	SIGNAL sboxes_state  : SBOXES_STATES;  

	SIGNAL zero_block : std_logic_vector(63 downto 0);

	SIGNAL sboxes_counter : std_logic_vector(9 downto 0);

BEGIN

	-- process to control sboxes initialization
	PROCESS (clk)
		VARIABLE just_started : std_logic;
	BEGIN
		IF (clk'event AND clk = '1') THEN
			sub_sboxes_done <= '0';
			CASE (sboxes_state) IS
			WHEN SUB =>
				IF (crypt_done = '1' AND just_started = '0') THEN
					sboxes_state <= SUB_WRITE1;
					--sboxes_init_addr - don't modify it
					sboxes_crypt_go <= '0';
				ELSE
					just_started := '0';
					sboxes_state <= SUB;
					--sboxes_init_addr - don't modify it
					sboxes_crypt_go <= '0';
				END IF;
			WHEN SUB_WRITE1 =>
				sboxes_state <= SUB_WRITE2;
				sbox_init_addr <= sbox_init_addr + 1;
				sboxes_crypt_go <= '0';
			WHEN SUB_WRITE2 =>
				IF (sboxes_counter = 511) THEN
					sboxes_state <= PASS;
					sboxes_crypt_go <= '0';
				ELSE
					sboxes_state <= SUB;
					sboxes_crypt_go <= '1';
				END IF;
				sbox_init_addr <= sbox_init_addr + 1;
				just_started := '1';            -- so we don't write two in a row!
			WHEN OTHERS =>
				IF (sub_sboxes = '1') THEN
					sboxes_state <= SUB;
					sbox_init_addr <= (others => '0');
					sboxes_crypt_go <= '1';  
					just_started := '1';
				ELSIF (sboxes_state = INIT) THEN
					IF (sbox_init_addr = 255) THEN
						sboxes_state <= PASS;
					ELSE
						sboxes_state <= INIT;
					END IF;
					sbox_init_addr <= sbox_init_addr + 1;
					sboxes_crypt_go <= '0';
				ELSIF (init_sboxes = '1') THEN
					sboxes_state <= INIT;
					sbox_init_addr <= (others => '0');
					sboxes_crypt_go <= '0';
				ELSE -- if we're not initializing, just pass-through
					sboxes_state <= PASS;
					sbox_init_addr <= (others => '0');
					sboxes_crypt_go <= '0';
					sub_sboxes_done <= '1';
				END IF;
			END CASE;
		END IF;
	END PROCESS;

	-- process to count the number of writes we've done so far
	PROCESS (clk)
	BEGIN
		IF (clk'event AND clk = '1') THEN
			IF (sboxes_state = SUB_WRITE2) THEN
				sboxes_counter <= sboxes_counter + 1;
			ELSIF (sboxes_state = PASS) THEN
				sboxes_counter <= (others => '0');
			END IF;
		END IF;
	END PROCESS;

	-- process to control the zero_block used in initalizations
	PROCESS (clk)
	BEGIN
		IF (clk'event AND clk = '1') THEN
			IF (zero_block_grab = '1') THEN
				zero_block <= sboxes_zero_block;
			ELSIF (sboxes_state = SUB_WRITE1) THEN
				zero_block <= crypt_ctext;
			ELSIF (sub_sboxes = '1') THEN
				zero_block <= (others => '0');
			END IF;
		END IF;
	END PROCESS;

	sboxes_crypt_ptext <= zero_block;

	F_sbox0_data <= sbox0_data_out; 
	F_sbox1_data <= sbox1_data_out;
	F_sbox2_data <= sbox2_data_out; 
	F_sbox3_data <= sbox3_data_out;

	-- process to allow sboxes init or passthrough to crypt
	PROCESS (
		sboxes_state, sbox_init_addr, sbox0_init_data, sbox1_init_data, sbox2_init_data,
		sbox3_init_data, F_sbox0_addr, F_sbox1_addr, F_sbox2_addr,
		F_sbox3_addr, crypt_ctext, sboxes_counter
	)
	BEGIN
		sbox0_we <= '0';
		sbox1_we <= '0';
		sbox2_we <= '0';
		sbox3_we <= '0';      
		CASE (sboxes_state) IS
		WHEN SUB_WRITE1 =>
			IF (sboxes_counter < 128) THEN
				sbox0_we <= '1';
			ELSIF (sboxes_counter < 256) THEN
				sbox1_we <= '1';
			ELSIF (sboxes_counter < 384) THEN
				sbox2_we <= '1';
			ELSIF (sboxes_counter < 512) THEN
				sbox3_we <= '1';      
			END IF;
			sbox0_addr <= sbox_init_addr;
			sbox1_addr <= sbox_init_addr;
			sbox2_addr <= sbox_init_addr;
			sbox3_addr <= sbox_init_addr;
			sbox0_data_in <= crypt_ctext(63 downto 32);
			sbox1_data_in <= crypt_ctext(63 downto 32);
			sbox2_data_in <= crypt_ctext(63 downto 32);
			sbox3_data_in <= crypt_ctext(63 downto 32);
		WHEN SUB_WRITE2 =>
			IF (sboxes_counter < 128) THEN
				sbox0_we <= '1';
			ELSIF (sboxes_counter < 256) THEN
				sbox1_we <= '1';
			ELSIF (sboxes_counter < 384) THEN
				sbox2_we <= '1';
			ELSIF (sboxes_counter < 512) THEN
				sbox3_we <= '1';      
			END IF;
			sbox0_addr <= sbox_init_addr;
			sbox1_addr <= sbox_init_addr;
			sbox2_addr <= sbox_init_addr;
			sbox3_addr <= sbox_init_addr;
			sbox0_data_in <= crypt_ctext(31 downto 0);
			sbox1_data_in <= crypt_ctext(31 downto 0);
			sbox2_data_in <= crypt_ctext(31 downto 0);
			sbox3_data_in <= crypt_ctext(31 downto 0);
		WHEN INIT =>
			sbox0_we <= '1';
			sbox1_we <= '1';
			sbox2_we <= '1';
			sbox3_we <= '1';      
			sbox0_addr <= sbox_init_addr;
			sbox1_addr <= sbox_init_addr;
			sbox2_addr <= sbox_init_addr;
			sbox3_addr <= sbox_init_addr;
			sbox0_data_in <= sbox0_init_data;
			sbox1_data_in <= sbox1_init_data;
			sbox2_data_in <= sbox2_init_data;
			sbox3_data_in <= sbox3_init_data;
		WHEN OTHERS =>
			sbox0_we <= '0';
			sbox1_we <= '0';
			sbox2_we <= '0';
			sbox3_we <= '0';      
			sbox0_addr <= F_sbox0_addr;
			sbox1_addr <= F_sbox1_addr;
			sbox2_addr <= F_sbox2_addr;
			sbox3_addr <= F_sbox3_addr;
			sbox0_data_in <= (others => '0');
			sbox1_data_in <= (others => '0');
			sbox2_data_in <= (others => '0');
			sbox3_data_in <= (others => '0');
		END CASE;
	END PROCESS;

END;

