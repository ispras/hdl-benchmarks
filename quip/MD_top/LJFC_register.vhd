library IEEE;
use IEEE.std_logic_1164.all;

entity LJFC_register is

  generic(
    INTLENGTH : integer := 64
    );

  port(
    Reset  : in  std_logic;
    D      : in  std_logic_vector(INTLENGTH-1 downto 0);
    Enable : in  std_logic;
    Clk    : in  std_logic;
    Q      : out std_logic_vector(INTLENGTH-1 downto 0)
    );
end LJFC_register;

architecture behaviour of LJFC_register is
begin
  process(Clk, Reset)
  begin
    if reset = '1' then
      Q <= (others => '0');
    elsif Clk'event and Clk = '1' then
      if Enable = '1' then
        Q <= D;
      end if;
    end if;
  end process;
end behaviour;


