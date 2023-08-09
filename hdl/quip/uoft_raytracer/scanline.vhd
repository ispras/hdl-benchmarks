library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
-- library synplify;
-- use synplify.attributes.all;

entity scanline is 
  port(
    nextpixel : in std_logic;

    we : in std_logic;
    datain : in std_logic_vector(62 downto 0);
    pixeldata : out std_logic_vector(20 downto 0);
    globalreset : in std_logic;
    clk : in std_logic);
end;
	
architecture rtl of scanline is
  type memarray is array(106 downto 0) of std_logic_vector(62 downto 0);
 
  signal addr,waddr,raddr : std_logic_vector(6 downto 0);
  signal subitem : std_logic_vector(1 downto 0); 
  signal wedelayed : std_logic;
  signal mem : memarray;
  signal mdataout : std_logic_vector(62 downto 0);
  
--   attribute syn_ramstyle : string;
--   attribute syn_ramstyle of mem : signal is "no_rw_check";

begin
  mdataout <= mem(conv_integer(addr));

  process(clk,globalreset)
  begin
    if globalreset = '1' then
      subitem <= "00";
      waddr <= (others => '0');
      raddr <= (others => '0');
      wedelayed <= '0';
      pixeldata <= (others => '0');
    elsif rising_edge (clk) then
      wedelayed <= we;
      if nextpixel = '1' or wedelayed = '1' then
        case (subitem) is  
          when "00" => pixeldata <= mdataout(62 downto 42);
          when "01" => pixeldata <= mdataout(41 downto 21);
          when "10" => pixeldata <= mdataout(20 downto 0);
          when others => pixeldata <= (others =>'-');
        end case;
      end if;

      if nextpixel = '1' then
        case (subitem) is
          when "00" => subitem <= "01";
          when "01" => subitem <= "10";
          when "10" => 
            subitem <= "00"; 
            if raddr /= "1101010" then
              raddr <= raddr + 1;
            else
              raddr <= (others => '0');
            end if;
          when others =>
        end case;
      end if;
      if we = '1' then
        if waddr /= "1101010" then
          waddr <= waddr+1;
        else
          waddr <= (others => '0');
        end if;
      end if;      
    end if;

    if (rising_edge (clk)) then
      addr <= raddr;
      if (we = '1') then
        mem(conv_integer(waddr)) <= datain;
      end if;
    end if;
  end process;

end rtl;
