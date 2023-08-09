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

ENTITY os_blowfish IS
PORT (
	clk  : IN std_logic;

	key      : IN  std_logic_vector(447 downto 0);
	key_size : IN  std_logic_vector(3 downto 0);  -- key size in 32-bit chunks

	data_in  : IN  std_logic_vector(63 downto 0);
	data_out : OUT std_logic_vector(63 downto 0);

	new_key  : IN bit;
	new_data : IN bit;

	encrypt  : IN bit; -- are we encrypting (high) or decrypting (low)?

	ready    : OUT bit  -- ready to receive a new key or new data. Alos means
					  -- that the output is valid for the last blowfish round.
);
END os_blowfish;

ARCHITECTURE fishy OF os_blowfish IS

	COMPONENT sbox0_init
	PORT (
		address : IN     std_logic_vector(7 downto 0);
		data    : INOUT std_logic_vector(31 downto 0)
	);
	END COMPONENT;

	COMPONENT sbox1_init
	PORT (
		address : IN     std_logic_vector(7 downto 0);
		data    : INOUT std_logic_vector(31 downto 0)
	);
	END COMPONENT;

	COMPONENT sbox2_init
	PORT (
		address : IN     std_logic_vector(7 downto 0);
		data    : INOUT std_logic_vector(31 downto 0)
	);
	END COMPONENT;

	COMPONENT sbox3_init
	PORT (
		address : IN     std_logic_vector(7 downto 0);
		data    : INOUT std_logic_vector(31 downto 0)
	);
	END COMPONENT;

	COMPONENT parray_init
	PORT (
		keychunk : IN  std_logic_vector(31 downto 0);
		address  : IN  std_logic_vector(4 downto 0);
		data     : OUT std_logic_vector(31 downto 0)
	);
	END COMPONENT;

	COMPONENT parray
	PORT (
		clk : IN std_logic;

		address  : IN  std_logic_vector(4 downto 0);
		data_in  : IN  std_logic_vector(31 downto 0);
		data_out : OUT std_logic_vector(31 downto 0);

		we : IN bit
	);
	END COMPONENT;

	COMPONENT sbox
	PORT (
		clk : IN std_logic;

		address : IN     std_logic_vector(7 downto 0);
		data_in  : IN  std_logic_vector(31 downto 0);
		data_out : OUT std_logic_vector(31 downto 0);

		we : IN bit
	);
	END COMPONENT;

	COMPONENT crypt
	PORT (
		clk : IN std_logic;

		parray_addr : BUFFER std_logic_vector(4 downto 0);
		parray_data : IN     std_logic_vector(31 downto 0);

		ptext : IN  std_logic_vector(63 downto 0);
		ctext : OUT std_logic_vector(63 downto 0);

		xL_to_F    : OUT std_logic_vector(31 downto 0); -- for the F(xL) function
		FxL_from_F_0 : IN  std_logic_vector(31 downto 0);
		FxL_from_F_1 : IN  std_logic_vector(31 downto 0);

		encrypt : IN bit; -- are we encrypting or decrypting?

		go   : IN  bit;
		done : OUT bit
	);
	END COMPONENT;

	COMPONENT F
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

		FxL_0  : OUT std_logic_vector(31 downto 0);
		FxL_1  : OUT std_logic_vector(31 downto 0)
	);
	END COMPONENT;

	COMPONENT parray_control IS
	PORT (
		clk  : IN std_logic;

		init_parray : IN bit; -- tells us to initialize the parray
		sub_parray  : IN bit; -- tells us to run the zero_block through

		sub_parray_done : OUT bit;              -- we're done doing a sub

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

		key       : IN  std_logic_vector(447 downto 0);
		key_size  : IN  std_logic_vector(3 downto 0)  -- key size in 32-bit chunks
	);
	END COMPONENT;

	COMPONENT sboxes_control IS
	PORT (
		clk  : IN std_logic;

		init_sboxes : IN bit; -- tells us to initialize the sboxes
		sub_sboxes  : IN bit; -- tells us to run the zero_block through

		sub_sboxes_done : OUT bit;              -- we're done doing a sub

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
	END COMPONENT;


	-- sbox and parray and their respective init constant blocks

	SIGNAL sbox0_init_data : std_logic_vector(31 downto 0);
	SIGNAL sbox1_init_data : std_logic_vector(31 downto 0);
	SIGNAL sbox2_init_data : std_logic_vector(31 downto 0);
	SIGNAL sbox3_init_data : std_logic_vector(31 downto 0);

	SIGNAL sbox_init_addr : std_logic_vector(7 downto 0);

	SIGNAL parray_init_data : std_logic_vector(31 downto 0);
	SIGNAL parray_init_addr : std_logic_vector(4 downto 0);
	SIGNAL parray_init_chunk : std_logic_vector(31 downto 0);

	SIGNAL sbox0_data_in : std_logic_vector(31 downto 0);
	SIGNAL sbox1_data_in : std_logic_vector(31 downto 0);
	SIGNAL sbox2_data_in : std_logic_vector(31 downto 0);
	SIGNAL sbox3_data_in : std_logic_vector(31 downto 0);

	SIGNAL sbox0_data_out : std_logic_vector(31 downto 0);
	SIGNAL sbox1_data_out : std_logic_vector(31 downto 0);
	SIGNAL sbox2_data_out : std_logic_vector(31 downto 0);
	SIGNAL sbox3_data_out : std_logic_vector(31 downto 0);

	SIGNAL sbox0_addr : std_logic_vector(7 downto 0);
	SIGNAL sbox1_addr : std_logic_vector(7 downto 0);
	SIGNAL sbox2_addr : std_logic_vector(7 downto 0);
	SIGNAL sbox3_addr : std_logic_vector(7 downto 0);

	SIGNAL sbox0_we : bit;
	SIGNAL sbox1_we : bit;
	SIGNAL sbox2_we : bit;
	SIGNAL sbox3_we : bit;

	SIGNAL parray_data_in  : std_logic_vector(31 downto 0);
	SIGNAL parray_data_out : std_logic_vector(31 downto 0);
	SIGNAL parray_addr : std_logic_vector(4 downto 0);
	SIGNAL parray_we   : bit;

	-- signals going to and from crypt and the F function

	SIGNAL crypt_ptext : std_logic_vector(63 downto 0);
	SIGNAL crypt_ctext : std_logic_vector(63 downto 0); 

	SIGNAL crypt_parray_data : std_logic_vector(31 downto 0);
	SIGNAL crypt_parray_addr : std_logic_vector(4 downto 0);

	SIGNAL xL_to_F    : std_logic_vector(31 downto 0);
	SIGNAL FxL_from_F_0 : std_logic_vector(31 downto 0);  
	SIGNAL FxL_from_F_1 : std_logic_vector(31 downto 0);  

	SIGNAL crypt_encrypt  : bit;
	SIGNAL crypt_go       : bit;
	SIGNAL crypt_done     : bit;

	SIGNAL F_sbox0_data : std_logic_vector(31 downto 0);
	SIGNAL F_sbox1_data : std_logic_vector(31 downto 0);
	SIGNAL F_sbox2_data : std_logic_vector(31 downto 0);
	SIGNAL F_sbox3_data : std_logic_vector(31 downto 0);

	SIGNAL F_sbox0_addr : std_logic_vector(7 downto 0);
	SIGNAL F_sbox1_addr : std_logic_vector(7 downto 0);
	SIGNAL F_sbox2_addr : std_logic_vector(7 downto 0);
	SIGNAL F_sbox3_addr : std_logic_vector(7 downto 0);  

	-- signals for the state machines and other misc control signals

	SIGNAL init_parray : bit; -- tell the parray to start initializing
	SIGNAL init_sboxes : bit; -- tell the sboxes to start initializing

	SIGNAL sub_parray : bit; -- tell the parray to start init stage 2
	SIGNAL sub_sboxes : bit; -- tell the sboxes to start init stage 2

	SIGNAL sub_parray_done : bit;
	SIGNAL sub_sboxes_done : bit;

	SIGNAL parray_crypt_go : bit; -- the go signal for the init stage 2 fsms
	SIGNAL sboxes_crypt_go : bit; -- the go signal for the init stage 2 fsms

	SIGNAL parray_crypt_ptext : std_logic_vector(63 downto 0);
	SIGNAL sboxes_crypt_ptext : std_logic_vector(63 downto 0);

	TYPE CONTROL_STATES IS (S_NORMAL, S_INIT, S_INIT_START, S_SUB_PARRAY_START,
		  S_SUB_SBOXES_START, S_SUB_PARRAY, S_SUB_SBOXES);
	SIGNAL control_state : CONTROL_STATES;

	SIGNAL sboxes_zero_block : std_logic_vector(63 downto 0);
	SIGNAL zero_block_grab : bit;

	SIGNAL keychunk_blob : std_logic_vector(447 downto 0);

BEGIN

	-- hierarchical cell instansiations
	SB0_INIT: sbox0_init PORT MAP (sbox_init_addr, sbox0_init_data);
	SB1_INIT: sbox1_init PORT MAP (sbox_init_addr, sbox1_init_data);
	SB2_INIT: sbox2_init PORT MAP (sbox_init_addr, sbox2_init_data);
	SB3_INIT: sbox3_init PORT MAP (sbox_init_addr, sbox3_init_data);

	PARR_INIT: parray_init 
	PORT MAP (
		parray_init_chunk, 
		parray_init_addr,
		parray_init_data
	); 

	SB0: sbox PORT MAP (clk, sbox0_addr, sbox0_data_in, sbox0_data_out, sbox0_we);
	SB1: sbox PORT MAP (clk, sbox1_addr, sbox1_data_in, sbox1_data_out, sbox1_we);
	SB2: sbox PORT MAP (clk, sbox2_addr, sbox2_data_in, sbox2_data_out, sbox2_we);
	SB3: sbox PORT MAP (clk, sbox3_addr, sbox3_data_in, sbox3_data_out, sbox3_we);

	PARR: parray 
	PORT MAP (
		clk, parray_addr, parray_data_in, parray_data_out,
		parray_we
	); 

	CRY: crypt 
	PORT MAP(
		clk, crypt_parray_addr, crypt_parray_data, crypt_ptext,
		crypt_ctext, xL_to_F, FxL_from_F_0, FxL_from_F_1, crypt_encrypt,
		crypt_go, crypt_done
	);

	CRY_F: F
	PORT MAP(
		clk, F_sbox0_addr, F_sbox1_addr, F_sbox2_addr,
		F_sbox3_addr, F_sbox0_data, F_sbox1_data, F_sbox2_data,
		F_sbox3_data, xL_to_F, FxL_from_F_0, FxL_from_F_1
	);

	PARRCTRL: parray_control 
	PORT MAP(
		clk, init_parray, sub_parray, sub_parray_done,
		sboxes_zero_block, parray_init_addr,
		parray_init_chunk, parray_init_data,
		parray_addr, parray_data_in,
		parray_data_out, parray_we,
		parray_crypt_go, parray_crypt_ptext,
		crypt_ctext, crypt_parray_addr,
		crypt_parray_data, crypt_done,
		key, key_size
	);

	SBCTRL: sboxes_control 
	PORT MAP(
		clk, init_sboxes, sub_sboxes, sub_sboxes_done,
		sboxes_zero_block,
		zero_block_grab, sbox_init_addr,
		sbox0_init_data,
		sbox1_init_data, sbox2_init_data,
		sbox3_init_data, sbox0_addr,
		sbox1_addr, sbox2_addr, sbox3_addr,
		sbox0_data_in, sbox1_data_in, sbox2_data_in,
		sbox3_data_in, sbox0_data_out, sbox1_data_out,
		sbox2_data_out, sbox3_data_out, sbox0_we,
		sbox1_we, sbox2_we, sbox3_we, sboxes_crypt_go,
		sboxes_crypt_ptext, crypt_ctext, F_sbox0_addr,
		F_sbox1_addr, F_sbox2_addr, F_sbox3_addr,
		F_sbox0_data, F_sbox1_data, F_sbox2_data,
		F_sbox3_data, crypt_done
	);

	crypt_go <= new_data OR parray_crypt_go OR sboxes_crypt_go;
	crypt_encrypt <= parray_crypt_go OR sboxes_crypt_go OR encrypt;

	crypt_ptext <= 
		parray_crypt_ptext WHEN (parray_crypt_go = '1') ELSE
		sboxes_crypt_ptext WHEN (sboxes_crypt_go = '1') ELSE
		data_in;

	data_out <= crypt_ctext;

	--  type CONTROL_STATES is (NORMAL, INIT, SUB_PARRAY, SUB_SBOXES);

	PROCESS (crypt_done, control_state)
	BEGIN
		IF (control_state = S_NORMAL) THEN
			ready <= crypt_done;
		ELSE
			ready <= '0';    
		END IF;
	END PROCESS;

	PROCESS (control_state)
	BEGIN
		init_parray <= '0';
		init_sboxes <= '0';
		sub_parray <= '0';
		sub_sboxes <= '0';
		zero_block_grab <= '0';
		CASE (control_state) IS
		WHEN S_INIT_START =>
			init_parray <= '1';
			init_sboxes <= '1';
		WHEN S_SUB_PARRAY_START =>
			sub_parray <= '1';
		WHEN S_SUB_SBOXES_START =>
			sub_sboxes <= '1';
			zero_block_grab <= '1';
		WHEN OTHERS =>
			NULL;
		END CASE;
	END PROCESS;

	PROCESS (clk)
	BEGIN
		IF (clk'event AND clk = '1') THEN
			CASE (control_state) IS
			WHEN S_INIT_START =>
				control_state <= S_INIT;  
			WHEN S_SUB_PARRAY_START =>
				control_state <= S_SUB_PARRAY;
			WHEN S_SUB_SBOXES_START =>
				control_state <= S_SUB_SBOXES;
			WHEN S_NORMAL =>
				IF (new_key = '1') THEN
					control_state <= S_INIT_START;
				ELSE
					control_state <= S_NORMAL;
				END IF;
			WHEN S_INIT =>
				IF (sub_sboxes_done = '1' ) THEN
					control_state <= S_SUB_PARRAY_START;
				ELSE
					control_state <= S_INIT;
				END IF;
			WHEN S_SUB_PARRAY =>
				IF (sub_parray_done = '1' ) THEN
					control_state <= S_SUB_SBOXES_START;
				ELSE
					control_state <= S_SUB_PARRAY;  
				END IF;
			WHEN S_SUB_SBOXES =>
				IF (sub_sboxes_done = '1' ) THEN
					control_state <= S_NORMAL;
				ELSE
					control_state <= S_SUB_SBOXES;
				END IF;
			WHEN OTHERS =>
				NULL;
			END CASE;
		END IF;
	END PROCESS;

END;
