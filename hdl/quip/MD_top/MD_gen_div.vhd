LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

-- we are going to use an LPM divider (for now, I know this is going to target Xilinx
-- eventually)
--USE lpm.lpm_components.all;


-----------------------------------------------------------------------------------------
--
--  This block is the general MD_division block.  It is intended that all divides
--  use the same block so that rounding is all the same, and the way the divider works
--  can be easily changed.
--
--
--
--------------------------------------------------------------------------------------------


ENTITY MD_gen_div IS
GENERIC (INTEGER_SIZE : INTEGER; NUMERATOR_SIZE : INTEGER; DENOM_SIZE : INTEGER;
		 NUM_BITS_TO_RIGHT_OF_DECIMAL : INTEGER; QUOT_SIZE : INTEGER;
		 NUM_CYCLES_PER_DIVIDE : INTEGER := 1);
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
END MD_gen_div;	
	
ARCHITECTURE MD_gen_div_behav OF MD_gen_div IS

-- greatest divider in the world
COMPONENT divider
	GENERIC ( N : INTEGER := 8 ) ;
	PORT (	Clock		: IN 		STD_LOGIC ;
			Resetn 		: IN 		STD_LOGIC ;
			s, LA, EB 	: IN 		STD_LOGIC ;
			DataA 		: IN 		STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			DataB 		: IN 		STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			R, Q 		: BUFFER 	STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			Done 		: OUT 		STD_LOGIC ) ;
END COMPONENT;




CONSTANT zero_NUM_BITS_TO_RIGHT_OF_DECIMAL_vec : STD_LOGIC_VECTOR(NUM_BITS_TO_RIGHT_OF_DECIMAL-1 DOWNTO 0)
				:= (OTHERS => '0');

CONSTANT zero_INTEGER_SIZE_vec : STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0) := (OTHERS => '0');	
	-- the below statement has no range when INTEGER_SIZE = QUOT_SIZE			
CONSTANT zero_vec_to_pad_quot : STD_LOGIC_VECTOR(INTEGER_SIZE - QUOT_SIZE DOWNTO 0) := (OTHERS => '0');	
CONSTANT left_most_bits_of_denom : STD_LOGIC_VECTOR(INTEGER_SIZE - DENOM_SIZE DOWNTO 0) := (OTHERS => '0');
CONSTANT left_most_bits_of_numer : STD_LOGIC_VECTOR(INTEGER_SIZE - NUMERATOR_SIZE DOWNTO 0) := (OTHERS => '0');


SIGNAL div_num : STD_LOGIC_VECTOR(NUMERATOR_SIZE-1 DOWNTO 0);
SIGNAL div_denom : STD_LOGIC_VECTOR(DENOM_SIZE-1 DOWNTO 0);	   
SIGNAL div_quotient : STD_LOGIC_VECTOR(QUOT_SIZE-1 DOWNTO 0);
	
TYPE div_states IS (s_idle, s_load, s_working);
SIGNAL s_div_state : div_states;
SIGNAL i_done : STD_LOGIC;
SIGNAL i_div_reset : STD_LOGIC;
SIGNAL i_start : STD_LOGIC;
SIGNAL i_stupid_load : STD_LOGIC; -- the divider implementation requires you to load the data yourself
-- one cycle before start is asserted.
BEGIN

m_SB_divider : divider GENERIC MAP (N => INTEGER_SIZE)
			PORT MAP(Clock => clk, Resetn => i_div_reset, DataA => div_num, DataB => div_denom, q => div_quotient,
					Done => i_done, s => i_start, LA => i_stupid_load, EB => i_stupid_load);
					
div_done <= i_done;
PROCESS (clk, ARESET_BAR)
BEGIN
	IF (ARESET_BAR = '0') THEN
		s_div_state <= s_idle;
		i_div_reset <= '0';
		i_start <= '0';
		i_stupid_load <= '0';
	ELSIF (clk'EVENT AND clk ='1') THEN
		CASE s_div_state IS
			-- called because i_stupid_load is high during this state
			-- after we load the data, then we assert start
			WHEN s_load =>
				i_div_reset <= '1';
				s_div_state <= s_working;
				i_start <= '1';
				i_stupid_load <= '0';
			WHEN s_idle =>
				-- don't do anything
				i_div_reset <= '1';
				i_start <= '0';
				IF (start = '1') THEN
					-- start working
					i_stupid_load <= '1';
					s_div_state <= s_load;
				ELSE
					s_div_state <= s_idle;
					i_stupid_load <= '0';
				END IF;
			WHEN s_working =>
				i_start <= '0';
				i_div_reset <= '1'; -- active low
				i_stupid_load <= '0';
				IF (i_done = '1') THEN
					-- we are done
					s_div_state <= s_idle;
				ELSE
					s_div_state <= s_working;
				END IF;
		END CASE;
	END IF;
END PROCESS;
				
			

PROCESS(num, denom, clk, clk_enable)
-- declare some signals that are one bit larger than they should be
-- this is because VHDL does not give you an easy way to pad INTEGER_SIZE - DENOM_SIZE
-- when the two are equal (ie pad zero bits)
VARIABLE pad_div_num_internal, pad_denom, pad_num, pad_quotient : STD_LOGIC_VECTOR(INTEGER_SIZE DOWNTO 0);
VARIABLE div_num_internal : STD_LOGIC_VECTOR(INTEGER_SIZE-1 DOWNTO 0);


BEGIN


	
	IF (clk'EVENT AND clk = '1') THEN
		
-- Quartus does not accept the logic below, so we just use constants.
--	IF (num /= (OTHERS => '0')) 
		IF (num /= zero_INTEGER_SIZE_vec)
		THEN -- if num != 0
			-- shift left by NUM_BITS_TO_RIGHT_OF_DECIMAL bits
			div_num_internal := num(INTEGER_SIZE - NUM_BITS_TO_RIGHT_OF_DECIMAL -1 DOWNTO 0)
					& zero_NUM_BITS_TO_RIGHT_OF_DECIMAL_vec; 
		
			-- now grab only as many bits as the user requested
			div_num <= div_num_internal(NUMERATOR_SIZE-1 DOWNTO 0);

			div_denom <= denom(DENOM_SIZE-1 DOWNTO 0);
		
			-- now check for overflow, three cases
			--  the leftmost NUM_BITS_TO_RIGHT_OF_DECIMAL bits of num
			--  the leftmost INTEGER_SIZE - NUMERATOR_SIZE bits of div_num_internal
			--  the leftmost INTEGER_SIZE - DENOM_SIZE bits of denom
			pad_num := '0' & num;
			pad_div_num_internal := '0' & div_num_internal;
			pad_denom := '0' & denom;

			IF (pad_num(INTEGER_SIZE DOWNTO INTEGER_SIZE - NUM_BITS_TO_RIGHT_OF_DECIMAL) &
					pad_div_num_internal(INTEGER_SIZE DOWNTO NUMERATOR_SIZE) &
					pad_denom(INTEGER_SIZE DOWNTO DENOM_SIZE) /=
				
				(left_most_bits_of_numer & left_most_bits_of_denom & zero_NUM_BITS_TO_RIGHT_OF_DECIMAL_vec))
		
			THEN
				overflow <= '1';
			ELSE	
				overflow <= '0';
			END IF;
	
			pad_quotient := zero_vec_to_pad_quot & div_quotient;
			quotient <= pad_quotient(INTEGER_SIZE-1 DOWNTO 0);	
			
			-- the statement below is what I really want, but synthesis does not accept it
--			quotient <= (OTHERS => '0') & div_quotient;	
		ELSE
			div_num <= (OTHERS => '0');
			div_denom <= (OTHERS => '1');
			quotient <= (OTHERS => '0');
		END IF;
	END IF;
END PROCESS;

END MD_gen_div_behav;


	