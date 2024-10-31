library ieee;
use ieee.std_logic_1164.all;

entity col16to21 is 
  port(
    dataline : in std_logic_vector(63 downto 0);
    texelselect : in std_logic_vector(1 downto 0);
    r,g,b    : out std_logic_vector(6 downto 0));
end;

architecture rtl of col16to21 is
  signal col16 : std_logic_vector(15 downto 0);
begin
  process (dataline,texelselect) 
  begin
    case (texelselect) is 
      when "00" => col16 <= dataline(15 downto 0);
      when "01" => col16 <= dataline(31 downto 16);
      when "10" => col16 <= dataline(47 downto 32);
      when "11" => col16 <= dataline(63 downto 48);
      when others => col16 <= "XXXXXXXXXXXXXXXX";
	end case;
  end process;
  r <= col16(15 downto 10) & '0';
  g <= col16(9 downto 5) & "00";
  b <= col16(4 downto 0) & "00";
end rtl;
