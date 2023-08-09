
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY altclklock2_wrap IS
	PORT
	(
		inclk0	: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC 
	);
END altclklock2_wrap;


ARCHITECTURE SYN OF altclklock2_wrap IS


	COMPONENT altclklock2

	PORT (
		inclk0	: IN STD_LOGIC;
		c0		: OUT STD_LOGIC 
	);
	END COMPONENT;

BEGIN

	component1 : altclklock2

	PORT MAP (
		inclk0 => inclk0,
		c0	   => c0
	);



END SYN;

