LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
ENTITY obj_f IS
	PORT
	(
	Q: OUT std_logic_VECTOR(4 downto 0);
	CLK: IN std_logic;
	CE: IN std_logic;
	ACLR: IN std_logic
	);
END obj_f;
ARCHITECTURE SYN OF obj_f IS
signal q0001 : STD_LOGIC_VECTOR (4 DOWNTO 0);
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
