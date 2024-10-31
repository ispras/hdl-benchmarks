
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY mult2_wrap IS
	PORT
	(
	clk: IN std_logic;
	a: IN std_logic_VECTOR(11 downto 0);
	b: IN std_logic_VECTOR(11 downto 0);
	q: OUT std_logic_VECTOR(23 downto 0);
	aclr: IN std_logic
	);
END mult2_wrap;


ARCHITECTURE SYN OF mult2_wrap IS


	COMPONENT mult2_bb

	PORT (
		clock0		: IN STD_LOGIC  := '1';
		dataa_0		: IN STD_LOGIC_VECTOR (11 DOWNTO 0) :=  (OTHERS => '0');
		datab_0		: IN STD_LOGIC_VECTOR (11 DOWNTO 0) :=  (OTHERS => '0');
		result		: OUT STD_LOGIC_VECTOR (23 DOWNTO 0)
	);
	END COMPONENT;

BEGIN

	component1 : mult2_bb

	PORT MAP (
		dataa_0 => a,
		datab_0 => b,
		clock0 => clk,
		result => q
	);



END SYN;

