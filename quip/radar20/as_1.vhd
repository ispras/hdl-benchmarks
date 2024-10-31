
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY AS_1 IS
	PORT
	(
		A		: IN STD_LOGIC_VECTOR (41 DOWNTO 0);
		B		: IN STD_LOGIC_VECTOR (41 DOWNTO 0);
		CLK		: IN STD_LOGIC ;
		Q		: OUT STD_LOGIC_VECTOR (41 DOWNTO 0)
	);
END AS_1;


ARCHITECTURE SYN OF AS_1 IS

signal q_a : std_logic_vector (41 downto 0);

BEGIN

q_a <= std_logic_vector(unsigned(A)+unsigned(B));

process(clk, q_a)
begin
	if (clk'event and clk = '1') then
		q <= q_a;
	end if;
end process;




END SYN;

