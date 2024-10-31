
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY AS_2 IS
	PORT
	(
		ADD		: IN STD_LOGIC ;
		A		: IN STD_LOGIC_VECTOR (23 DOWNTO 0);
		B		: IN STD_LOGIC_VECTOR (23 DOWNTO 0);
		CLK		: IN STD_LOGIC ;
		ACLR	: IN STD_LOGIC ;
		Q		: OUT STD_LOGIC_VECTOR (23 DOWNTO 0)
	);
END AS_2;


ARCHITECTURE SYN OF AS_2 IS


signal q_a : std_logic_vector (23 downto 0);

BEGIN

process(a,b,add)
begin
	if (add = '1') then
		q_a <= std_logic_vector(unsigned(A)+unsigned(B));
	else 
		q_a <= std_logic_vector(unsigned(A)-unsigned(B));
	end if;
end process;

process(clk, q_a, aclr)
begin
	if (aclr = '1') then
		q <= (others => '0');
	elsif (clk'event and clk = '1') then
		q <= q_a;
	end if;
end process;




END SYN;

