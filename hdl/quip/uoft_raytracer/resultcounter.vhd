library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity resultcounter is 
  port(
    resultID : in std_logic_vector(1 downto 0);
    newresult : in std_logic;
    done : out std_logic_vector(1 downto 0);
    reset : in std_logic;
    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of resultcounter is
  signal count : std_logic_vector(3 downto 0);
  signal curr : std_logic_vector(1 downto 0);
begin
  done <= curr when count = 0 else "00";

  process(clk,globalreset,reset)
  begin
    if (globalreset = '1') or (reset = '1') then
      count <= "1000";
      curr <= (others => '0');
    elsif (rising_edge(clk)) then
      if (resultID /= 0) and (newresult = '1') and (count /= 0) then
        count <= count - 1;
        curr <= resultID;
      end if;
    end if;
  end process;

end rtl;
