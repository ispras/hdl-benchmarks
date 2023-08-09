library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity fifo3 is 
  generic (
    datawidth : natural := 18);
  port(
    datain  : in std_logic_vector(datawidth-1 downto 0);
    writeen : in std_logic;
    dataout : out std_logic_vector(datawidth-1 downto 0);
    shiften  : in std_logic;
    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of fifo3 is 
  type stdlogicarray is array(0 to 2) of std_logic_vector(datawidth-1 downto 0);

  signal data : stdlogicarray;
  signal pos  : std_logic_vector(1 downto 0);
begin
  dataout <= data(0);
 
  process(clk,globalreset)
  begin
    if (globalreset = '1') then
      pos <= "00";
      data(0) <= (others => '0');
      data(1) <= (others => '0');
      data(2) <= (others => '0');
    elsif rising_edge(clk) then
      if writeen = '1' and shiften = '1' then
        case (pos) is
          when "00" =>
            data(0) <= (others => '-');
            data(1) <= (others => '-');
            data(2) <= (others => '-');
          when "01" =>
            data(0) <= datain;
            data(1) <= (others => '-');
            data(2) <= (others => '-');
          when "10" =>
            data(0) <= data(1);
            data(1) <= datain;
            data(2) <= (others => '-');
          when "11" =>
            data(0) <= data(1);
            data(1) <= data(2);
            data(2) <= datain;
          when others =>
		  	data(0) <= data(0);
            data(1) <= data(0);
            data(2) <= data(2);
		 
		 end case;
      elsif shiften = '1' then
        data(0) <= data(1);
        data(1) <= data(2);
        pos <= pos-1;
      elsif writeen = '1' then
        case (pos) is
          when "00" => data(0) <= datain;
          when "01" => data(1) <= datain;
          when "10" => data(2) <= datain;
          when others =>
        end case;
        pos <= pos + 1;
      end if;
    end if;
  end process;

end rtl;

