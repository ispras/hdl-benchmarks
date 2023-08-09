

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY altclklock0_wrap IS
	PORT
	(
		inclk0	: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC ;
		c1		: OUT STD_LOGIC 
	);
END altclklock0_wrap;


ARCHITECTURE SYN OF altclklock0_wrap IS


	COMPONENT altclklock0

	PORT (
		inclk0	: IN STD_LOGIC  ;
		c0		: OUT STD_LOGIC ;
		c1		: OUT STD_LOGIC 
	);
	END COMPONENT;

BEGIN

	component1 : altclklock0

	PORT MAP (
		inclk0 => inclk0,
		c0 	   => c0,
		c1 	   => c1
	);



END SYN;

