
  library IEEE;
use IEEE.std_logic_1164.all;

entity MD_flip_flop is

  port(
    Reset  : in  std_logic;
    D      : in  std_logic;
    Q      : out  std_logic;
    Clk    : in  std_logic);
    
end MD_flip_flop;

architecture behaviour of MD_flip_flop is
begin
  process(Clk, Reset)
  begin
    if reset = '1' then
      Q <=  '0';
    elsif Clk'event and Clk = '1' then
        Q <= D;
    end if;
  end process;
end behaviour;


