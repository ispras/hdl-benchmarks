LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
ENTITY obj_g IS
	PORT
	(
		CLK		: IN STD_LOGIC ;
		CE		: IN STD_LOGIC ;
		ACLR	: IN STD_LOGIC ;
		Q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END obj_g;
ARCHITECTURE SYN OF obj_g IS
signal q0001 : STD_LOGIC_VECTOR (7 DOWNTO 0);
begin
process(clk,ce,aclr)
begin
	if (aclr = '1') then
		q0001 <= (others => '0');
	elsif (clk'event and clk = '1') then
		if (ce = '1') then
			q0001 <= std_logic_vector(unsigned(q0001)+1);
		end if;
	end if;
end process;
q <= q0001;
END SYN;
