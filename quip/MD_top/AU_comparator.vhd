library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;


-------------------------------------------------------------------

ENTITY AU_comparator IS

	GENERIC(
		INTLENGTH : INTEGER := 64
	);

	PORT(
		INPUT_A				: IN STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		INPUT_B				: IN STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		OUTPUT				: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
	);
END AU_comparator;

-------------------------------------------------------------------

ARCHITECTURE behaviour OF AU_comparator IS

SIGNAL in1_signed, in2_signed : SIGNED(INTLENGTH-1 DOWNTO 0);

BEGIN

	in1_signed <= SIGNED(INPUT_A);
	in2_signed <= SIGNED(INPUT_B);

	PROCESS (in1_signed, in2_signed)
		BEGIN
		IF (in1_signed = in2_signed) THEN
			OUTPUT <= "1";
		ELSE
			OUTPUT <= "0";
		END IF;
	END PROCESS;

END behaviour;



