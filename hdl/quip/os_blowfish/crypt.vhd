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

ENTITY crypt IS
PORT (
	clk : IN std_logic;

	parray_addr : BUFFER std_logic_vector(4 downto 0);
	parray_data : IN  std_logic_vector(31 downto 0);

	ptext : IN  std_logic_vector(63 downto 0);
	ctext : OUT std_logic_vector(63 downto 0);

	xL_to_F    : OUT std_logic_vector(31 downto 0); -- for the F(xL) function

	-- FxL_from_F = (FxL_from_F_0 + FxL_from_F_1)
    FxL_from_F_0 : IN  std_logic_vector(31 downto 0);
	FxL_from_F_1 : IN  std_logic_vector(31 downto 0);

	encrypt : IN bit; -- are we encrypting or decrypting?

	go   : IN  bit;
	done : OUT bit
);
END crypt;

ARCHITECTURE fishy OF crypt IS

	-- TODO: combine states, look at encrypt the whole time
	TYPE CRYPT_STATES is (IDLE, START, CRUNCH1, CRUNCH2, FINAL1, FINAL2);
	SIGNAL crypt_state : CRYPT_STATES;

	SIGNAL count_up : bit;
	SIGNAL count_reset : bit;

	SIGNAL xL  : std_logic_vector(31 downto 0);
	SIGNAL xR  : std_logic_vector(31 downto 0);

	SIGNAL xL_next : std_logic_vector(31 downto 0);
	SIGNAL xR_next : std_logic_vector(31 downto 0);

	SIGNAL xL_aux0 : std_logic_vector(31 downto 0);
	SIGNAL xL_aux1 : std_logic_vector(31 downto 0);

BEGIN
  
	-- the counter to feed parray_addr and keep track of where we are.
	PROCESS (clk, count_reset, count_up)
	BEGIN
		IF (clk'event AND clk = '1') THEN
			IF (crypt_state = IDLE) THEN	-- counter_reset=1
				IF (go = '1' AND encrypt /= '1') THEN
					parray_addr <= b"10001"; -- count_up
				ELSE 
					parray_addr <= b"00000"; -- count_down
				END IF;
			ELSIF (crypt_state = CRUNCH1) THEN
				IF (count_up = '1') THEN
					parray_addr <= parray_addr + 1;
				ELSE
					parray_addr <= parray_addr - 1;
				END IF;
			ELSIF (parray_addr = 1 AND count_up = '0') THEN
				parray_addr <= parray_addr - 1;
			ELSIF (parray_addr = 16 AND count_up = '1') THEN
				parray_addr <= parray_addr + 1;
			END IF;
		END IF; -- CLK
	END PROCESS;

	-- this process does the combinational logic crunching we need
	xL_to_F <= xL XOR parray_data;

	PROCESS (clk)
	BEGIN
		IF (clk'event AND clk = '1') THEN

			-- By default xL_aux0 + xL_aux1 = 0, so that xL = xL_next
			xL_aux0 <= (others => '0');
			xL_aux1 <= (others => '0');

			CASE crypt_state IS
			WHEN CRUNCH1 =>
				xL_next <= xL XOR parray_data;
			    --xL_to_F <= xL_next;
				xR_next <= xR;
			WHEN CRUNCH2 =>
				xR_next <= xL;
				xL_next <= xR;
				-- Intend to adjust xL by (FxL_from_F)
				xL_aux0 <= FxL_from_F_0;
				xL_aux1 <= FxL_from_F_1;
			WHEN FINAL1 =>
				xR_next <= xL XOR parray_data;
				xL_next <= xR;
			WHEN FINAL2 =>
				xR_next <= xR;
				xL_next <= xL XOR parray_data;
			WHEN OTHERS =>
				xR_next <= xR;
				xL_next <= xL;
			END CASE;
			
			-- Load xL_next and xR_next during crypt_state startup
			IF (crypt_state = IDLE) AND (go = '1') THEN
				xL_aux0 <= (others => '0');
				xL_aux1 <= (others => '0');
				xL_next <= ptext(63 downto 32);
				xR_next <= ptext(31 downto 0);
			END IF;
		END IF;
	END PROCESS;

	-- Construct xL from 3 registered values (retimed for speed)
	xL <= xL_next XOR (xL_aux0 + xL_aux1);
	xR <= xR_next;

	-- the process to control the state of the algorithm
	PROCESS (clk)
	BEGIN
		IF (clk'event AND clk = '1') THEN
			CASE (crypt_state) IS
			WHEN IDLE =>
				IF (go = '1') THEN
					IF (encrypt = '1') THEN
						count_up <= '1';
						count_reset <= '1';
					ELSE
						count_up <= '0';
						count_reset <= '1';
					END IF;
					crypt_state <= START;
					-- start fetching F(xL) and parray[0]/parray[17] right away
					done <= '0';
				ELSE
					count_reset <= '1';
					count_up <= '1';
					crypt_state <= IDLE;
					done <= '1';
					ctext <= xL & xR;
				END IF;
			WHEN START =>
				crypt_state <= CRUNCH1;
				count_reset <= '0';
				done <= '0';
			WHEN CRUNCH1 =>
				crypt_state <= CRUNCH2;
			WHEN CRUNCH2 =>
				IF (count_up = '1') then
					IF (parray_addr = 16) then -- 16 or 15?
						crypt_state <= FINAL1;
					ELSE
						crypt_state <= CRUNCH1;
					END IF;
				ELSE
					IF (parray_addr = 1) THEN -- 1 or 2?
						crypt_state <= FINAL1;
					ELSE
						crypt_state <= CRUNCH1;
					END IF;
				END IF;
				done <= '0';
			WHEN FINAL1 =>
				crypt_state <= FINAL2;
				done <= '0';
			WHEN FINAL2 =>
				crypt_state <= IDLE;
				done <= '0';
			WHEN OTHERS =>
				NULL;
			END CASE;
		END IF; -- clk
	END PROCESS;

END;
