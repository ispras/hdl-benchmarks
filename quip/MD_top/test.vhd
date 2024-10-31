library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test IS
	PORT (input : in std_logic;
	output : out std_logic);
end TEST;

ARCHITECTURE test_behav OF test IS 
BEGIN

output <= input;

END test_behav;
