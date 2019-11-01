library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

ENTITY MD_counter IS

	GENERIC(
		INTLENGTH : INTEGER := 64
	);
  
	PORT(
		Reset	: IN  STD_LOGIC;
		Enable	: IN  STD_LOGIC;
		Clk	: IN  STD_LOGIC;
		Q	: OUT STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0)
	);
END MD_counter;

ARCHITECTURE behaviour OF MD_counter IS

SIGNAL Q_signed	: SIGNED(INTLENGTH-1 DOWNTO 0);
SIGNAL Q_signed2	: SIGNED(INTLENGTH-1 DOWNTO 0);
SIGNAL Q_inside	: STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
SIGNAL myone : STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);

BEGIN

myone(intlength-1 downto 1) <= (OTHERS => '0') ;
myone(0)<='1';
	PROCESS(Clk,Reset)
	BEGIN
		IF reset = '1' THEN
			Q_inside<= (OTHERS => '0');
			Q_signed <= SIGNED(Q_inside);
			Q_signed2 <= SIGNED(Q_inside);
		ELSIF Clk'EVENT AND Clk='1' AND Enable='1' THEN
			Q_signed <= SIGNED(Q_inside);
			Q_signed2 <=Q_signed+1;
--			Q_inside <= STD_LOGIC_VECTOR(Q_signed2);
			Q_inside <= Q_inside+myone;
		END IF;
	END PROCESS;

	Q <= Q_inside;
	
END behaviour;



