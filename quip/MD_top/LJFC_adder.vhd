library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

-------------------------------------------------------------------

ENTITY LJFC_adder IS

	GENERIC(
		INPUT_SIZE : INTEGER :=32;
		OUTPUT_SIZE : INTEGER := 32
	);

	PORT(
		INPUT_A				: IN STD_LOGIC_VECTOR(INPUT_SIZE-1 DOWNTO 0);
		INPUT_B				: IN STD_LOGIC_VECTOR(INPUT_SIZE-1 DOWNTO 0);
		OUTPUT				: OUT STD_LOGIC_VECTOR(OUTPUT_SIZE-1 DOWNTO 0)
	);
END LJFC_adder;

-------------------------------------------------------------------

ARCHITECTURE behaviour OF LJFC_adder IS

SIGNAL in1_signed, in2_signed:  SIGNED(INPUT_SIZE-1 DOWNTO 0);
SIGNAL sum_signed: SIGNED(OUTPUT_SIZE-1 DOWNTO 0);

BEGIN

	in1_signed <= SIGNED(INPUT_A);
	in2_signed <= SIGNED(INPUT_B);

	PROCESS (in1_signed, in2_signed)
		BEGIN
		sum_signed <= in1_signed + in2_signed;
	END PROCESS;
	
	OUTPUT <= STD_LOGIC_VECTOR(sum_signed);

END behaviour;



