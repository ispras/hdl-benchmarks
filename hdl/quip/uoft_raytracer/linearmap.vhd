library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity linearmap is 
  port(
    u,v : in std_logic_vector(6 downto 0);
    start : in std_logic_vector(17 downto 0);
    addr : out std_logic_vector(17 downto 0);
    texelselect : out std_logic_vector(1 downto 0);
    factor : in std_logic_vector(2 downto 0);
    enable : in std_logic;
    clk : in std_logic);
end;

architecture rtl of linearmap is
  signal ul,vl : std_logic_vector(6 downto 0);
begin
  texelselect <= ul(1 downto 0);
  process (clk)
  begin
    if rising_edge(clk) then
      if enable = '1' then
        ul <= u;
        vl <= v;
      end if;
      case (factor) is 
        when "000" => addr <= start + ("0000000000000" & ul(6 downto 2)) + ("00000000000" & vl);
        when "001" => addr <= start + ("0000000000000" & ul(6 downto 2)) + ("0000000000" & vl & "0");
        when "010" => addr <= start + ("0000000000000" & ul(6 downto 2)) + ("000000000" & vl & "00");
        when "011" => addr <= start + ("0000000000000" & ul(6 downto 2)) + ("00000000" & vl & "000");
        when "100" => addr <= start + ("0000000000000" & ul(6 downto 2)) + ("0000000" & vl & "0000");
        when "101" => addr <= start + ("0000000000000" & ul(6 downto 2)) + ("000000" & vl & "00000");
        when "110" => addr <= start + ("0000000000000" & ul(6 downto 2)) + ("00000" & vl & "000000");
        when others => addr <= start + ("0000000000000" & ul(6 downto 2)) + ("0000" & vl & "0000000");
      
	  end case;
    end if;
  end process;

end rtl;
