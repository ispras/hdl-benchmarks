LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

-------------------------------------------------------------------------------------
--
--  This is the Lenard-Jones Force Computer Block
--
--  Essential Input:  This block takes in the radius squared, the delta x,y,z coords.
--						ARESET_BAR, which resets the system.  This should be held
--					for at least 10 cycles or so to let everything propagate.
--  
--  Essential Output:  The acceleration magnitude in the x,y,z directions
--                     Whether the accelerations are negative or positive
--					   An overflow flag, per piece of data
--
--
--	This block basically calculates:   (C-R^6)/R^14.  As such, there is significant
--  roundoff errors.  The block uses the standard multipliers.  For details, see the 
--  multiplier declaration.  
--
--  The divider works as follows:
--			Take the numerator (of size INTEGER_SIZE, with NUM_BITS_TO_RIGHT_OF_DECIMAL bits to the 
--			right of the decimal.  The numberator is then shifted NUM_BITS_TO_RIGHT_OF_DECIMAL bits 
--			to the left, and the new numerator is the result.  This can result in overflow if we
--			shift away data.
--		
--			The divisor is the least significant INTEGER_SIZE/2 bits.  This can also result in an
--			"Overflow" error if we are chopping away bits.
--
--			The output is a straight, truncated, integer divide.
--
--
--
--	 Some naming conventions:
--	 things starting with:
--		m_ means main routing
--		d_ mean debug
--		i_ interface
--		PG_ means coming from pair_gen
--		AU_ means going to acceleration update (or coming from)
--		_X means raised to the X power (ie R_14)
--		_CX mean a signal on the Xth cycle (ir R_14_C4)
--		g_ means the signal is global to all modules (g_enable).  clk is also global
--		*CXi means an input into cycle X
--		*CXo means an output from cycle X
--		s_ means a state in a state machine


ENTITY LJ_pot IS
-- The code will work with any value to the generic, but INTEGER_SIZE must be divisible by 2
--	and NUM_BIT_TO_RIGHT_OF_DECIMAL should not be bigger than INTEGER_SIZE/2, or else the
--  the divider may become quite inaccurate.  If you need to do this, the details of this block
--  will need to change.
-- The divider (currently) is INTEGER_SIZE bits in the numerator, and INTEGER_SIZE/2 in the denominator
-- If the numbers are increased much, this will get very very large.  Work is undergoing to fix this problem.
GENERIC (LOG_NUM_PARTICLES : INTEGER := 8; INTEGER_SIZE : INTEGER := 24;
				NUM_BITS_TO_RIGHT_OF_DECIMAL : INTEGER := 8; NUM_CYCLES_PER_DIVIDE : INTEGER := 4);
PORT (
	PG_PARTICLE_A, PG_PARTICLE_B : IN STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0); -- particle id's
	PG_RADIUS_MAG_SQ : IN STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0); -- r^2
	PG_RAD_X, PG_RAD_Y, PG_RAD_Z : IN STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0); -- unsigned delta x, y, z
	PG_PAIR_READY : IN STD_LOGIC; -- asserted when input is valid and waiting
	AU_ACC_ACCEPTED : IN STD_LOGIC; -- for the acceleration update handshake

	clk : IN STD_LOGIC; -- main driving clock
	ARESET_BAR : IN STD_LOGIC; -- asynch reset, active low
	PG_force_direction_vector : IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- this vector says whether the x,y,z deltas
	-- are negative or not.  We cannot currently distinguish this case.  This vector will just flow through,
	-- with the particles.  Hard coded to 3 bits, because we assume that we will always do this in three-d.


	-- debug variable only.  Comment in/out as needed
	-- debug outputs cycle 4
	d_overflow_C4i, d_valid_C4, d_valid_C5, d_valid_C6, d_overflow_div : OUT STD_LOGIC;
	d_C_MINUS_R_6_C4, d_R_14_C4 : OUT STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);
	d_DX_C4, d_DY_C4, d_DZ_C4 : OUT STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);
	d_PA_C4, d_PB_C4 : OUT STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0);
	d_enable : OUT STD_LOGIC;
	d_force_C4, d_force_C5 : OUT STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);
	
	-----------------------------------------end-debug-outputs-----------
	

        SIGMA_6_TIMES_2_C3 : in STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);
	
	OVERFLOW_ERROR : OUT STD_LOGIC; -- asserted when an overflow error occurs.  Block will continue to 
									-- process information however
	AU_DATA_VALID : OUT STD_LOGIC; -- my outputs mean something, hold until I get an accept from the AU block
								   -- If there is a delay, then no more data will be accepted from the PG block
								   -- ie the pipeline will stall.
	PG_PAIR_ACCEPTED : OUT STD_LOGIC; -- for handshaking with PG_PAIR_READY.  Asserted one cycle after the PG_PAIR_READY
									-- signal is asserted, IF we are ready to take in data

	-- here are the acceleration vectors.  They are all unsigned numbers.  See the force dir vector
	-- for the directions.  	
	AU_ACC_X, AU_ACC_Y, AU_ACC_Z : OUT STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);
	-- id's of the output particles.  These are just flow through the various pipeline stages
	AU_PARTICLE_A, AU_PARTICLE_B : OUT STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0); -- flows through from input
	AU_force_direction_vector : OUT STD_LOGIC_VECTOR(2 DOWNTO 0) -- same as the input vector of similar name
	--	except that these may be the negative of what was given, if the resultant force from the calculations
	--  was also negative.  This just avoids having to output a FORCE_NEGATIVE bit as well.
);
END LJ_pot;

ARCHITECTURE LJ_pot_behav OF LJ_pot IS

COMPONENT MD_gen_mult 
GENERIC (INTEGER_INPUT_SIZE : INTEGER := 32; INTEGER_OUTPUT_SIZE : INTEGER := 32;
		 NUM_BITS_TO_RIGHT_OF_DECIMAL : INTEGER := 8);
PORT 
(
	a_in, b_in : 		IN STD_LOGIC_VECTOR(INTEGER_INPUT_SIZE-1 DOWNTO 0);
	
	output : 		OUT STD_LOGIC_VECTOR(INTEGER_OUTPUT_SIZE-1 DOWNTO 0);
	overflow : 	OUT STD_LOGIC
);
END COMPONENT;	

COMPONENT MD_gen_div 
GENERIC (INTEGER_SIZE : INTEGER; NUMERATOR_SIZE : INTEGER; DENOM_SIZE : INTEGER;
		 NUM_BITS_TO_RIGHT_OF_DECIMAL : INTEGER; QUOT_SIZE : INTEGER; NUM_CYCLES_PER_DIVIDE : INTEGER);
PORT 
(
	-- all the ports will be checked for truncated roundoff
	-- and the outputs will be padded as neccessary
	num, denom : IN STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);
	-- we may need to stall the divider if the output to the divider is full
	clk : IN STD_LOGIC;
	clk_enable : IN STD_LOGIC := '1';
	start : IN STD_LOGIC; -- asserted when data is valid.  Asserted for only one clock cycle
	ARESET_BAR : IN STD_LOGIC; -- same reset as everyone else

	div_done : OUT STD_LOGIC;
	quotient : OUT STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);	
	overflow : 	OUT STD_LOGIC
);
END COMPONENT;	

-- Global signals
SIGNAL g_enable, g_div_enable, g_AU_enable : STD_LOGIC; -- active high enables
-- this could happen in two ways:  One, the divider says "hold up a minute", I just need
-- a few more cycles.  Or, the AU block cannot accept any more data.  In that case everything
-- will stall as well
SIGNAL i_valid_C1 : STD_LOGIC; -- this is produced by the handshaking.  We need it because we want the pipeline to operate
-- even when no more data is present.  This allows us to flow garbage through the pipe.

-- Signals for stage 1
SIGNAL i_R_4_C1, i_R_2_C1, i_R_4_C2, i_R_2_C2, i_R_6_C2, i_R_8_C2, i_R_6_C3, i_R_8_C3,
			i_R_14_C3, i_C_MINUS_R_6_C3 : STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);
SIGNAL i_overflow_C1a, i_overflow_C1o, i_overflow_C2i, i_overflow_C2a, i_overflow_C2b, i_overflow_C2o, 
			i_overflow_C3i, i_overflow_C3a, i_overflow_C3o
				: STD_LOGIC; -- all the overflows for stage 1
				
SIGNAL i_valid_C2, i_valid_C3, i_valid_C4 : STD_LOGIC;
SIGNAL i_PA_C1, i_PB_C1, i_PA_C2, i_PB_C2, i_PA_C3, 
			i_PB_C3, i_PA_C4, i_PB_C4 : STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0);
SIGNAL i_DX_C1, i_DY_C1, i_DZ_C1, i_DX_C2, i_DY_C2, 
			i_DZ_C2, i_DX_C3, i_DY_C3, i_DZ_C3 : STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);
			
SIGNAL i_force_dir_vec_C1, i_force_dir_vec_C2, i_force_dir_vec_C3, i_force_dir_vec_C3_temp, i_force_dir_vec_C4,
			i_force_dir_vec_C5, i_force_dir_vec_C6 : STD_LOGIC_VECTOR(2 DOWNTO 0);
-- This signal denotes whether the resulting force vector is negative or positive
-- it is used during cycle 3.  So there is some special case code when registering the data on cycle 4
SIGNAL i_force_is_pos_C3 : STD_LOGIC;
				
-- outputs from stage 1
SIGNAL i_overflow_C4i : STD_LOGIC;
SIGNAL i_C_MINUS_R_6_C4, i_R_14_C4 : STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);
SIGNAL i_DX_C4, i_DY_C4, i_DZ_C4 : STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);
-- end output from stage 1

-- Stage 2 Signals
SIGNAL i_done_div_C4, i_start_div_C4 : STD_LOGIC;
SIGNAL i_DX_C5, i_DY_C5, i_DZ_C5 : STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);
SIGNAL i_FORCE_C4 : STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);
SIGNAL i_FORCE_C5, i_ACC_X_C5, i_ACC_Y_C5, i_ACC_Z_C5 : STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);
SIGNAL i_ACC_X_C6, i_ACC_Y_C6, i_ACC_Z_C6 : STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);
SIGNAL i_PA_C5, i_PB_C5, i_PA_C6, i_PB_C6 : STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0);
SIGNAL i_overflow_C5i, i_overflow_C5o, i_overflow_C6i, i_overflow_C5a, i_overflow_C5b, i_overflow_C5c,
			i_overflow_C4o, i_overflow_C4a, i_overflow_C4_div : STD_LOGIC;
SIGNAL i_valid_C5, i_valid_C6 : STD_LOGIC;

--CONSTANT SIGMA_6_TIMES_2_C3 : STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0) := (OTHERS => '0');

-- state machine types
-- for accepting data
TYPE accept_data_states IS (s_accepted_idle, s_accepted_data);
SIGNAL s_accept_current_state : accept_data_states;
-- end for accepting data

-- for the divider
TYPE divider_states IS (s_div_idle, s_div_calc);
SIGNAL s_div_current_state : divider_states;
-- end for the divider

-- for the sending data block (AU)
TYPE send_data_states IS (s_sending_idle, s_sending_data);
SIGNAL s_send_current_state : send_data_states;
-- end for the sending data block (AU)

BEGIN
-- first hook up the debug output
d_overflow_C4i <= i_overflow_C4i;
d_C_MINUS_R_6_C4 <= i_C_MINUS_R_6_C4;
d_R_14_C4 <= i_R_14_C4;
d_DX_C4 <= i_DX_C4;
d_DY_C4 <= i_DY_C4;
d_DZ_C4 <= i_DZ_C4;
d_PA_C4 <= i_PA_C4;
d_PB_C4 <= i_PB_C4;
d_valid_C4 <= i_valid_C4;
d_valid_C5 <= i_valid_C5;
d_valid_C6 <= i_valid_C6;
d_enable <= g_enable;
d_force_C4 <= i_force_C4;
d_force_C5 <= i_force_C5;
d_overflow_div <= i_overflow_C4a;

-- the enable is low if either of the two enable sources are also low
-- the two ways are:
-- 1) Waiting for the divider to finish
-- 2) Waiting for the AU block to continue to accept data
g_enable <= '0' WHEN (g_div_enable = '0' OR g_AU_enable = '0') ELSE '1';

-- The implementation will be in three parts
-- Part 0:  The handshaking.  
-- If PG_Pair_read is asserted, then the data is valid.  Grab the data, and then assert that you have gotten it on 
-- the next clock edge.  That is all the handshaking we need.
PROCESS (clk)
-- this is really a little state machine
-- and this is asserted, it means that we switched state before the stall
-- signal reached us (state transition is synchronous).  So don't raise the
-- accepted data flag.
BEGIN
	IF (clk'EVENT AND clk = '1') THEN
		CASE s_accept_current_state IS
			WHEN s_accepted_idle =>
				-- this means we have data ready, and are not stalling for any reason
				IF (PG_pair_ready = '1' AND g_enable = '1') THEN
					s_accept_current_state <= s_accepted_data;
					i_valid_C1 <= '1';
				ELSE 
					s_accept_current_state <= s_accepted_idle;
					i_valid_C1 <= '0';
				END IF;
				PG_PAIR_ACCEPTED <= '0';
			WHEN s_accepted_data =>
				-- if we are stalling, just wait
				IF (g_enable = '0') THEN
					s_accept_current_state <= s_accepted_data;
					PG_PAIR_ACCEPTED <= '0';
				ELSE
					s_accept_current_state <= s_accepted_idle;
					PG_PAIR_ACCEPTED <= '1';
				END IF;
				i_valid_C1 <= '0';
		END CASE;
	END IF;
END PROCESS;


-- Part 1:  Generate (C-R^6) and R^14.  Flow through the particle IDs, and the x,y,z components of the force
--  This part will be done in three cycles, and will also do the handshaking with the PG component



-- now a bunch of maps
-- Cycle 1:  One multiple R_2 * R_2
stage_1_C1 : MD_gen_mult GENERIC MAP (INTEGER_INPUT_SIZE => INTEGER_SIZE, INTEGER_OUTPUT_SIZE => INTEGER_SIZE,
			NUM_BITS_TO_RIGHT_OF_DECIMAL => NUM_BITS_TO_RIGHT_OF_DECIMAL)
						PORT MAP (a_in => i_R_2_C1, b_in => i_R_2_C1,
								output => i_R_4_C1, overflow => i_overflow_C1a);
			
i_overflow_C1o <= i_overflow_C1a;
								

-- Cycle 2: Two multiples R_2*R_4 and R_4 * R_4
stage_1_mult1_C2 : MD_gen_mult GENERIC MAP (INTEGER_INPUT_SIZE => INTEGER_SIZE, INTEGER_OUTPUT_SIZE => INTEGER_SIZE,
			NUM_BITS_TO_RIGHT_OF_DECIMAL => NUM_BITS_TO_RIGHT_OF_DECIMAL)
						PORT MAP (a_in => i_R_2_C2, b_in => i_R_4_C2,
								output => i_R_6_C2, overflow => i_overflow_C2a);

stage_1_mult2_C2 : MD_gen_mult GENERIC MAP (INTEGER_INPUT_SIZE => INTEGER_SIZE, INTEGER_OUTPUT_SIZE => INTEGER_SIZE,
			NUM_BITS_TO_RIGHT_OF_DECIMAL => NUM_BITS_TO_RIGHT_OF_DECIMAL)
						PORT MAP (a_in => i_R_4_C2, b_in => i_R_4_C2,
								output => i_R_8_C2, overflow => i_overflow_C2b);
								
i_overflow_C2o <= i_overflow_C2a OR i_overflow_C2b OR i_overflow_C2i;
								
-- Cycle 3:  One multiply R_8 * R_6 and one subtract C - R_6

stage_1_mult_C3 : MD_gen_mult GENERIC MAP (INTEGER_INPUT_SIZE => INTEGER_SIZE, INTEGER_OUTPUT_SIZE => INTEGER_SIZE,
			NUM_BITS_TO_RIGHT_OF_DECIMAL => NUM_BITS_TO_RIGHT_OF_DECIMAL)
						PORT MAP (a_in => i_R_8_C3, b_in => i_R_6_C3,
								output => i_R_14_C3, overflow => i_overflow_C3a);

PROCESS (i_R_6_C3, i_force_is_pos_C3, i_force_dir_vec_C3)
BEGIN
	IF (SIGMA_6_TIMES_2_C3 > i_R_6_C3) THEN
		i_C_MINUS_R_6_C3 <= SIGMA_6_TIMES_2_C3 - i_R_6_C3;
		i_force_is_pos_C3 <= '1';
	ELSE
		i_C_MINUS_R_6_C3 <= i_R_6_C3 - SIGMA_6_TIMES_2_C3;
		i_force_is_pos_C3 <= '0'; -- the force is negative
	END IF;
	-- to account for this negative force, we simply invert the force
	-- direction vector(which indicates whether delta x is pos or neg)
	-- when the force calc above is negative
	IF (i_force_is_pos_C3 = '1') THEN
		i_force_dir_vec_C3_temp <= i_force_dir_vec_C3;
	ELSE
		i_force_dir_vec_C3_temp <= NOT i_force_dir_vec_C3;
	END IF;
END PROCESS;

i_overflow_C3o <= i_overflow_C3i OR i_overflow_C3a;

								
-- End Cycle 3



-- now the process to make this whole thing synchronous
-- for now we will do each multiply in one cycle
PROCESS (clk, g_enable, ARESET_BAR)
BEGIN

	IF (ARESET_BAR = '0') THEN
		i_R_4_C2 <= (OTHERS => '0');
		i_R_2_c2 <= (OTHERS => '0');
		i_overflow_C2i <= '0';
		i_valid_C2 <= '0';
		i_valid_C3 <= '0';
		i_valid_C4 <= '0';
		i_overflow_C3i <= '0';
		
--		i_R_6_C3 <= (OTHERS => '0');
--		i_R_8_C3 <= (OTHERS => '0');
	ELSIF (clk'EVENT AND clk = '1') THEN
		IF (g_enable = '1') THEN
			-- latch the data for the first cycle
			-- this is to ensure that this block has registered inputs
			i_R_2_C1 <= PG_RADIUS_MAG_SQ;
			i_DX_C1 <= PG_RAD_X;
			i_DY_C1 <= PG_RAD_Y;
			i_DZ_C1 <= PG_RAD_Z;
			i_PA_C1 <= PG_PARTICLE_A;
			i_PB_C1 <= PG_PARTICLE_B;
			i_force_dir_vec_C1 <= PG_force_direction_vector;		
		
			-- beginning of cycle 2
			i_R_4_C2 <= i_R_4_C1;
			i_R_2_C2 <= i_R_2_C1;
			i_overflow_C2i <= i_overflow_C1o;
			i_valid_C2 <= i_valid_C1; -- set during the handshaking PROCESS
			i_DX_C2 <= i_DX_C1;
			i_DY_C2 <= i_DY_C1;
			i_DZ_C2 <= i_DZ_C1;
			i_PA_C2 <= i_PA_C1;
			i_PB_C2 <= i_PB_C1;
			i_force_dir_vec_C2 <= i_force_dir_vec_C1;
			-- start of cycle 3
			i_R_6_C3 <= i_R_6_C2;
			i_R_8_C3 <= i_R_8_C2;
			i_overflow_C3i <= i_overflow_C2o;
			i_valid_C3 <= i_valid_C2;
			i_DX_C3 <= i_DX_C2;
			i_DY_C3 <= i_DY_C2;
			i_DZ_C3 <= i_DZ_C2;
			i_PA_C3 <= i_PA_C2;
			i_PB_C3 <= i_PB_C2;
			i_force_dir_vec_C3 <= i_force_dir_vec_C2;
		
			-- now register the outputs of stage 1
			i_C_MINUS_R_6_C4 <= i_C_MINUS_R_6_C3;
			i_R_14_C4 <= i_R_14_C3;
			i_overflow_C4i <= i_overflow_C3o;
			i_valid_C4 <= i_valid_C3;
			i_DX_C4 <= i_DX_C3;
			i_DY_C4 <= i_DY_C3;
			i_DZ_C4 <= i_DZ_C3;
			i_PA_C4 <= i_PA_C3;
			i_PB_C4 <= i_PB_C3;
			-- do NOT use i_force_dir_vec_C3.  We need to invert the signal when the force vector is negative.
			i_force_dir_vec_C4 <= i_force_dir_vec_C3_temp;
		END IF;
	END IF;
END PROCESS;


-- stage 2:  The divider

-- cycle 4

m_stage_2_div2 : MD_gen_div GENERIC MAP (INTEGER_SIZE => INTEGER_SIZE, NUMERATOR_SIZE => INTEGER_SIZE,
			DENOM_SIZE => (INTEGER_SIZE), NUM_BITS_TO_RIGHT_OF_DECIMAL => NUM_BITS_TO_RIGHT_OF_DECIMAL,
			QUOT_SIZE => INTEGER_SIZE, NUM_CYCLES_PER_DIVIDE => NUM_CYCLES_PER_DIVIDE)
			PORT MAP(num => i_C_MINUS_R_6_C4, denom => i_R_14_C4, quotient => i_FORCE_C4,
						overflow => i_overflow_C4a, clk => clk, clk_enable => g_enable,
						-- new ports from the restoring divider change
						start => i_start_div_C4  , ARESET_BAR => ARESET_BAR, div_done => i_done_div_C4
						);
					
i_overflow_C4o <= i_overflow_C4i OR i_overflow_C4_div; 


-- cycle 5, three multiplies
stage_2_mult1_C5 : MD_gen_mult GENERIC MAP (INTEGER_INPUT_SIZE => INTEGER_SIZE, INTEGER_OUTPUT_SIZE => INTEGER_SIZE,
			NUM_BITS_TO_RIGHT_OF_DECIMAL => NUM_BITS_TO_RIGHT_OF_DECIMAL)
						PORT MAP (a_in => i_FORCE_C5, b_in => i_DX_C5,
								output => i_ACC_X_C5, overflow => i_overflow_C5a);

stage_2_mult2_C5 : MD_gen_mult GENERIC MAP (INTEGER_INPUT_SIZE => INTEGER_SIZE, INTEGER_OUTPUT_SIZE => INTEGER_SIZE,
			NUM_BITS_TO_RIGHT_OF_DECIMAL => NUM_BITS_TO_RIGHT_OF_DECIMAL)
						PORT MAP (a_in => i_FORCE_C5, b_in => i_DY_C5,
								output => i_ACC_Y_C5, overflow => i_overflow_C5b);

stage_2_mult3_C5 : MD_gen_mult GENERIC MAP (INTEGER_INPUT_SIZE => INTEGER_SIZE, INTEGER_OUTPUT_SIZE => INTEGER_SIZE,
			NUM_BITS_TO_RIGHT_OF_DECIMAL => NUM_BITS_TO_RIGHT_OF_DECIMAL)
						PORT MAP (a_in => i_FORCE_C5, b_in => i_DZ_C5,
								output => i_ACC_Z_C5, overflow => i_overflow_C5c);

i_overflow_C5o <= i_overflow_C5i OR i_overflow_C5a OR i_overflow_C5b OR i_overflow_C5c;
		
-- now we need a state machine for the divider.  Our current algorithm is to wait until the divider is finished.
-- this means when valid data is on the divider, we stop everything (asychronously), and then wait for it to
-- finish before restarting everything
PROCESS (clk, ARESET_BAR, s_div_current_state, i_valid_C4, g_div_enable)
VARIABLE internal_counter : STD_LOGIC_VECTOR(15 DOWNTO 0); -- needs to count up to the number of cycles
-- this divider will go through.  Figure we won't have any numbers bigger than 32756.  The extra memory
-- for this will be automatically synthesized away by any resonable tool.  This tool decided to let the 
-- compiler do it.
BEGIN
	IF (ARESET_BAR = '0') THEN
		s_div_current_state <= s_div_idle;
		g_div_enable <= '1';
		i_overflow_C4_div <= '0';
		i_start_div_C4 <= '0';
	ELSIF (clk'EVENT AND clk = '1') THEN
		CASE s_div_current_state IS
			WHEN s_div_idle =>
				-- if the cycle before is valid, and we are enabled, then
				IF (i_valid_C3 = '1' AND g_enable = '1') THEN
					-- if we have valid input to the divider, then we want to stall for NUM_CYCLES_PER_DIVIDE cycles
					internal_counter := (OTHERS => '0'); -- reset the counter
					g_div_enable <= '0'; 
					s_div_current_state <= s_div_calc;
					i_start_div_C4 <= '1';
				ELSE
					i_start_div_C4 <= '0';
					s_div_current_state <= s_div_idle;
					g_div_enable <= '1';
				END IF;
				i_overflow_C4_div <= i_overflow_C4_div;
			-- here we wait for the divider to complete, holding g_enable low.
			WHEN s_div_calc =>
				i_start_div_C4 <= '0';
				IF (i_done_div_C4 = '1') THEN
					-- we are done
					i_overflow_C4_div <= i_overflow_C4_div;
					g_div_enable <= '1';
					s_div_current_state <= s_div_idle;
				ELSE
					i_overflow_C4_div <= i_overflow_C4_div OR i_overflow_C4a;
					g_div_enable <= '0';
					s_div_current_state <= s_div_calc;
				END IF;
		END CASE;
	END IF;
	-- this ugly piece of async code is to make sure the enable goes low BEFORE
	-- the next clock cycle.  This is because by the next clock cycle (after having
	-- valid input to the divider), we have already overwritten the values we are trying
	-- to preserve by not latching any more data.  We could add another pipeline stage, but
	-- that also seems ugly.
--	IF (s_div_current_state = s_div_idle AND i_valid_C4 = '1' AND internal_counter /= NUM_CYCLES_PER_DIVIDE) THEN
--		g_div_enable <= '0'; -- stop the show!
--	END IF;
		
END PROCESS;
		
PROCESS (clk, g_enable, ARESET_BAR) -- don't need reset, this just flows through
BEGIN
	IF (ARESET_BAR = '0') THEN
		i_valid_C5 <= '0';
		i_valid_C6 <= '0';
	ELSIF (clk'EVENT AND clk = '1') THEN
		IF (g_enable = '1') THEN
			i_FORCE_C5 <= i_FORCE_C4;
			i_PA_C5 <= i_PA_C4;
			i_PB_C5 <= i_PB_C4;
			i_DX_C5 <= i_DX_C4;
			i_DY_C5 <= i_DY_C4;
			i_DZ_C5 <= i_DZ_C4;
			i_valid_C5 <= i_valid_C4;
			i_overflow_C5i <= i_overflow_C4o;
			i_force_dir_vec_C5 <= i_force_dir_vec_C4;
			-- cycle 6 (These are the final outputs)
			i_PA_C6 <= i_PA_C5;
			i_PB_C6 <= i_PB_C5;
			i_ACC_X_C6 <= i_ACC_X_C5;
			i_ACC_Y_C6 <= i_ACC_Y_C5;
			i_ACC_Z_C6 <= i_ACC_Z_C5;
			i_valid_C6 <= i_valid_C5;
			i_overflow_C6i <= i_overflow_C5o;
			i_force_dir_vec_C6 <= i_force_dir_vec_C5;
			-- no longer need to remember the individual delta x,y,z
		END IF;
	END IF;
END PROCESS;		
-- now hook things up to the external wires
AU_PARTICLE_A <= i_PA_C6;
AU_PARTICLE_B <= i_PB_C6;
AU_ACC_X <= i_ACC_X_C6;
AU_ACC_Y <= i_ACC_Y_C6;
AU_ACC_Z <= i_ACC_Z_C6;
OVERFLOW_ERROR <= i_overflow_C6i;
AU_force_direction_vector <= i_force_dir_vec_C6;
-- now we need another state machine to give the data to the AU block.
PROCESS(i_valid_C6, clk, ARESET_BAR, s_send_current_state)
VARIABLE just_sent_data : STD_LOGIC;
BEGIN
	IF (ARESET_BAR = '0') THEN
		s_send_current_state <= s_sending_idle;
		AU_DATA_VALID <= '0';
		g_AU_enable <= '1';
		just_sent_data := '0';
	ELSIF (clk'EVENT AND clk = '1') THEN
		CASE s_send_current_state IS
			WHEN s_sending_idle =>
				-- we need to check if there is valid data ready to be sent on the NEXT cycle
				IF (i_valid_C5 = '1' AND g_enable = '1') THEN
					-- we want to raise AU_DATA_VALID, even if we are stalling
					AU_DATA_VALID <= '1';
					s_send_current_state <= s_sending_data;
					g_AU_enable <= '0'; -- wait for the data to be accepted
				ELSE
					s_send_current_state <= s_sending_idle;
					AU_DATA_VALID <= '0';
					g_AU_enable <= '1'; -- just keep going
				END IF;
				just_sent_data := '0';
			WHEN s_sending_data =>
				-- we need to see the AU block raise its data accept flag
				IF (AU_ACC_ACCEPTED = '1') THEN
				-- we have a handshake, go back to idle mode, start up the pipe
					AU_DATA_VALID <= '0';
					s_send_current_state <= s_sending_idle;
					g_AU_enable <= '0';
					just_sent_data := '1';
				ELSE
					-- wait for them to receive the data
					AU_DATA_VALID <= '1'; -- still valid
					s_send_current_state <= s_sending_data;
					g_AU_enable <= '0'; -- keep holding
					just_sent_data := '0';
				END IF;
		END CASE;
	END IF;
--		IF (s_send_current_state = s_sending_idle AND i_valid_C6 = '1' AND just_sent_data = '0') THEN
--			g_AU_enable <= '0'; -- stop the show, asynchronously
--		ELSIF (just_sent_data = '1') THEN
--			g_AU_enable <= '1';
--		END IF;
END PROCESS;

		
END LJ_pot_behav;

--test_mult : MD_gen_mult GENERIC MAP (INTEGER_INPUT_SIZE => INTEGER_SIZE, INTEGER_OUTPUT_SIZE => INTEGER_SIZE,
--			NUM_BITS_TO_RIGHT_OF_DECIMAL => NUM_BITS_TO_RIGHT_OF_DECIMAL)
--					    PORT MAP (a_in => PG_RAD_X, b_in => PG_RAD_Y, output => d_mult_test,
--								overflow => d_mult_test_overflow);
