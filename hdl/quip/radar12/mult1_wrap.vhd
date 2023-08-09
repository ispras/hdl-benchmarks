

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY mult1_wrap IS
	PORT
	(
		a		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		b		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		clk		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END mult1_wrap;


ARCHITECTURE SYN OF mult1_wrap IS



	COMPONENT mult1_bb

	PORT (
		clock0		: IN STD_LOGIC  := '1';
		dataa_0		: IN STD_LOGIC_VECTOR (15 DOWNTO 0) :=  (OTHERS => '0');
		datab_0		: IN STD_LOGIC_VECTOR (15 DOWNTO 0) :=  (OTHERS => '0');
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	END COMPONENT;

BEGIN

	component1 : mult1_bb

	PORT MAP (
		dataa_0 => a,
		datab_0 => b,
		clock0 => clk,
		result => q
	);



END SYN;

