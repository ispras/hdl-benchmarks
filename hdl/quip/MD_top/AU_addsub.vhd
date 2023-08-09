library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

-------------------------------------------------------------------

ENTITY AU_addsub IS

	GENERIC(
		INTLENGTH : INTEGER := 64
	);

	PORT(
		ADDSUB				: IN STD_LOGIC;
		INPUT_A				: IN STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		INPUT_B				: IN STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		OUTPUT				: OUT STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0)
	);
END AU_addsub;

-------------------------------------------------------------------

ARCHITECTURE behaviour OF AU_addsub IS

SIGNAL in1_signed, in2_signed, sum_signed: SIGNED(INTLENGTH-1 DOWNTO 0);

BEGIN

	in1_signed <= SIGNED(INPUT_A);
	in2_signed <= SIGNED(INPUT_B);

	PROCESS (in1_signed, in2_signed, ADDSUB)
		BEGIN
		IF (ADDSUB = '0') THEN
			sum_signed <= in1_signed + in2_signed;
		ELSE
			sum_signed <= in1_signed - in2_signed;
		END IF;
	END PROCESS;
	
	OUTPUT <= STD_LOGIC_VECTOR(sum_signed);

END behaviour;



