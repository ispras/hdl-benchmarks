library IEEE;
use IEEE.std_logic_1164.all;

-------------------------------------------------------------------

ENTITY AU_addsub_3D IS

	GENERIC(
		INTLENGTH : INTEGER := 64
	);

	PORT(
		ADDSUB		: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		X_A				: IN STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		Y_A				: IN STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		Z_A				: IN STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		X_B				: IN STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		Y_B				: IN STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		Z_B				: IN STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);		
		OUTX			: OUT STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		OUTY			: OUT STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		OUTZ			: OUT STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0)		
	);
END AU_addsub_3D;

-------------------------------------------------------------------

ARCHITECTURE structure OF AU_addsub_3D IS


-------------------------------------------------------------------
COMPONENT AU_addsub
	GENERIC(
		INTLENGTH : INTEGER := 64
	);

	PORT(
		ADDSUB				: IN STD_LOGIC;
		INPUT_A				: IN STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		INPUT_B				: IN STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		OUTPUT				: OUT STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0)
	);
END COMPONENT;
-------------------------------------------------------------------

BEGIN

	addx0 : AU_addsub GENERIC MAP(INTLENGTH) PORT MAP(ADDSUB(0),X_A,X_B,OUTX);
	addy0 : AU_addsub GENERIC MAP(INTLENGTH) PORT MAP(ADDSUB(1),Y_A,Y_B,OUTY);
	addz0 : AU_addsub GENERIC MAP(INTLENGTH) PORT MAP(ADDSUB(2),Z_A,Z_B,OUTZ);	


END structure;

