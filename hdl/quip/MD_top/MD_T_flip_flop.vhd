
  library IEEE;
use IEEE.std_logic_1164.all;

entity MD_T_flip_flop is

  port(
    Reset  : in  std_logic;
    T      : in  std_logic;
    Q      : out  std_logic;
    Clk    : in  std_logic);
    
end MD_T_flip_flop;

architecture behaviour of MD_T_flip_flop is

  signal q_inside_prev : std_logic;
  signal q_inside_next : std_logic;

begin

  process(Clk, Reset)
  begin
    if reset = '1' then
      q_inside_next <=  '0';
    elsif Clk'event and Clk = '1' then
    	if T = '1' then
        	q_inside_next <= not q_inside_prev;
	end if;
    end if;
  end process;
  
  Q <= q_inside_next;
  q_inside_prev <= q_inside_next;
  
end behaviour;


