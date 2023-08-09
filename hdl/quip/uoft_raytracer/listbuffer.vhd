library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

library work;
use work.complib.all;

entity listbuffer is 
  generic(
    width : natural := 48;
    subdepth : natural := 3;
    totaldepth : natural := 5); 
  port(
    peekdata : in std_logic_vector(width*(2**subdepth)-1 downto 0);
    commit : in std_logic;
    nextaddr : in std_logic;
    baseaddress : in std_logic_vector(totaldepth-subdepth-1 downto 0);
    dataout : out std_logic_vector(width-1 downto 0);
    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of listbuffer is
  type state_type is (S_IDLE,S_WRITE);
  signal state : state_type;
  signal next_state : state_type;

  signal we : std_logic;
  signal address : std_logic_vector(totaldepth-1 downto 0);
  signal datain : std_logic_vector(width-1 downto 0);
begin
  ram : spram
    generic map(width,totaldepth)
    port map(we,address,dataout,datain,clk);

  Process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_IDLE;
      address <= (others => '0');
    elsif (rising_edge(clk)) then
      state <= next_state;
      case state is
        when S_IDLE =>
          if commit = '1' then
            address(totaldepth-1 downto subdepth) <= baseaddress;
            address(subdepth-1 downto 0) <= (others => '0');
          end if;
          if nextaddr = '1' then
            address(subdepth-1 downto 0) <= address(subdepth-1 downto 0) + 1;
          end if;
        when S_WRITE =>
          address(subdepth-1 downto 0) <= address(subdepth-1 downto 0) + 1;
        when others =>
      end case;
    end if;
  end process;

  process (state,commit,address,peekdata)
  Begin						   
    we <= '0';
    datain <= (others => '-');
    case state IS
      when S_IDLE =>
        if commit = '1' then
          next_state <= S_WRITE;
        else
          next_state <= S_IDLE;
        end if;
      when S_WRITE =>
        writelp : for k in 0 to (2**subdepth)-1 loop
          if k=address(subdepth-1 downto 0) then
            datain <= peekdata((k+1)*width-1 downto k*width);
          end if;
        end loop writelp;
        we <= '1';
        if address(subdepth-1 downto 0) = (2**subdepth)-1 then
          next_state <= S_IDLE;
        else
          next_state <= S_WRITE;
        end if;
    end case; 
  end process;

end rtl;
