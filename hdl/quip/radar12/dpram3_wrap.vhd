
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY dpram3_wrap IS
	PORT
	(
	addra: IN std_logic_VECTOR(4 downto 0);
	addrb: IN std_logic_VECTOR(4 downto 0);
	clka: IN std_logic;
	clkb: IN std_logic;
	dina: IN std_logic_VECTOR(10 downto 0);
	doutb: OUT std_logic_VECTOR(10 downto 0);
	ena: IN std_logic;
	enb: IN std_logic;
	wea: IN std_logic
	);
END dpram3_wrap;


ARCHITECTURE SYN OF dpram3_wrap IS


	COMPONENT dpram3

	PORT (
		data		: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
		wren		: IN STD_LOGIC  := '1';
		wraddress		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		rdaddress		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		wrclock		: IN STD_LOGIC ;
		wrclocken		: IN STD_LOGIC  := '1';
		rdclock		: IN STD_LOGIC ;
		rdclocken		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (10 DOWNTO 0)
	);
	END COMPONENT;

BEGIN

	component1 : dpram3

	PORT MAP (
		wrclocken => ena,
		rdclocken => enb,
		wren => wea,
		wrclock => clka,
		rdclock => clkb,
		wraddress => addra,
		rdaddress => addrb,
		data => dina,
		q => doutb
	);



END SYN;

