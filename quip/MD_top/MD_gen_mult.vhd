LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

-----------------------------------------------------------------------------------------
--
--  This block is the general MD_multiply block.  It is intended that all multiplies
--  use the same block so that rounding is all the same, and the way the multiplier works
--  can be easily changed.
--
--  This block is completely combinatorial.  Build your own damn registers!
--
--  Generics:  INTEGER_INPUT_SIZE, INTEGER_OUTPUT_SIZE.  Self explanatory.
--			   NUM_BITS_TO_RIGHT_OF_DECIMAL also self explanatory
--					geez, I complain about lack of comments, and then put the above in!
--				INTEGER_OUTPUT_SIZE must be >= INTEGER_INPUT_SIZE and <= INTEGER_INPUT_SIZE*2 - NUM_BITS...
--					I know this last one is a little strange, but we currently have no method to change
--					the number of bits to the right of the decimal.  It is just one constant.
--
--  Inputs:  a, b of size INTEGER_INPUT_SIZE
--
--  Outputs: o of size INTEGER_OUTPUT_SIZE
--			 overflow flag
--
--  The way this block works is that an intermediate product, of size INTEGER_INPUT_SIZE*2 is generated
--	Then it is shifted right by NUM_BITS_TO_RIGHT_OF_DECIMAL, and the right most INTEGER_OUTPUT_SIZE bits
--  are returned as output.  The most significant bits INTEGER_INPUT_SIZE*2 - INTEGER_OUTPUT_SIZE bits are
--  checked for overflow, and the result placed in the overflow port.
--
--  This is just a first version of the multiplier.  Later we may add better roundoff, or other such things.
--  NOTE:  The roundoff method used here is truncation.
--
--------------------------------------------------------------------------------------------


ENTITY MD_gen_mult IS
GENERIC (INTEGER_INPUT_SIZE : INTEGER := 32; INTEGER_OUTPUT_SIZE : INTEGER := 32;
		 NUM_BITS_TO_RIGHT_OF_DECIMAL : INTEGER := 8);
PORT 
(
	a_in, b_in : 		IN STD_LOGIC_VECTOR(INTEGER_INPUT_SIZE-1 DOWNTO 0);
	
	output : 		OUT STD_LOGIC_VECTOR(INTEGER_OUTPUT_SIZE-1 DOWNTO 0);
	overflow : 	OUT STD_LOGIC
);
END MD_gen_mult;	
	
ARCHITECTURE MD_gen_mult_behav OF MD_gen_mult IS
SIGNAL internal_mult : STD_LOGIC_VECTOR(INTEGER_INPUT_SIZE*2-1 DOWNTO 0);
BEGIN

internal_mult <= a_in * b_in;
output <= internal_mult(INTEGER_OUTPUT_SIZE + NUM_BITS_TO_RIGHT_OF_DECIMAL - 1 DOWNTO 	
			NUM_BITS_TO_RIGHT_OF_DECIMAL);
-- internal_mult(NUM_BITS_TO_RIGHT_OF_DECIMAL-1 DOWNTO 0) is what we have lost due to roundoff
-- here is an area for improvement.  We could check to see if the leftmost bit is a 1, and then
-- add one to the number due to rounding.  This takes area however, but we will likely do it
-- in future as it is very easy.  Paul isn't implementing his multiplier in software like this yet
-- so we won't yet either.

gen_overflow : IF INTEGER_INPUT_SIZE*2 > INTEGER_OUTPUT_SIZE + NUM_BITS_TO_RIGHT_OF_DECIMAL GENERATE
	PROCESS(internal_mult)
	CONSTANT zero_vec_for_overflow : STD_LOGIC_VECTOR(INTEGER_INPUT_SIZE*2 - INTEGER_OUTPUT_SIZE 
			- NUM_BITS_TO_RIGHT_OF_DECIMAL - 1 DOWNTO 0) := (OTHERS => '0');
	BEGIN
		IF (internal_mult(INTEGER_INPUT_SIZE*2 -1 DOWNTO INTEGER_OUTPUT_SIZE + NUM_BITS_TO_RIGHT_OF_DECIMAL)
--			/= (OTHERS => '0')) -- Quartus does not accept this... sigh...
			/= zero_vec_for_overflow)
			-- /= means not equal to.  IE what we are truncating is not zero
		THEN
			overflow <= '1';
		ELSE
			overflow <= '0';
		END IF;
	END PROCESS;
END GENERATE;

gen_no_overflow : IF INTEGER_INPUT_SIZE*2 <= INTEGER_OUTPUT_SIZE + NUM_BITS_TO_RIGHT_OF_DECIMAL GENERATE
	overflow <= '0';
END GENERATE;

END MD_gen_mult_behav;
