library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity sramcontroller is 
  port(
    want_addr : out std_logic;
    addr_ready : in std_logic;
    addrin : in std_logic_vector(17 downto 0);
    want_data : out std_logic;
    data_ready : in std_logic;
    datain : in std_logic_vector(63 downto 0);

    addr : in std_logic_vector(17 downto 0);
    addrvalid : in std_logic;
    data : out std_logic_vector(63 downto 0);
    datavalid : buffer std_logic;

    tm3_sram_data : inout std_logic_vector(63 downto 0);
    tm3_sram_addr : out std_logic_vector(18 downto 0);
    tm3_sram_we   : out std_logic_vector(7 downto 0);
    tm3_sram_oe   : out std_logic_vector(1 downto 0);
    tm3_sram_adsp : out std_logic;
    globalreset : in std_logic;
    clk : in std_logic;
    statepeek : out std_logic_vector(2 downto 0));
end;

architecture rtl of sramcontroller is	
  type state_type is (S_IDLE,S_WRITE1,S_WRITE2,S_WRITE3,S_WRITEDONE,S_READ);
  signal state : state_type;
  signal next_state : state_type;

  signal waddress : std_logic_vector(17 downto 0);
begin
  process(state)
  begin
    case state is
      when S_IDLE => statepeek <= "001";
      when S_WRITE1 => statepeek <= "010";
      when S_WRITE2 => statepeek <= "011";
      when S_WRITE3 => statepeek <= "100";
      when S_WRITEDONE => statepeek <= "101"; 
      when S_READ => statepeek <= "110";
      when others => statepeek <= "000";
    end case;
  end process;


  process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_IDLE;
      waddress <= (others => '0');
      data <= (others => '0');
      datavalid <= '0';
    elsif (rising_edge (clk)) then
      state <= next_state;

      case (state) is
        when S_IDLE =>
          if (addr_ready = '1') then
            waddress <= addrin;
          end if;
          if addrvalid = '0' then
            datavalid <= '0';
          end if;
        when S_WRITE2 =>
          if (data_ready = '1') then
            waddress <= waddress+1;
          end if;
        when S_READ => 
          data <= tm3_sram_data;
          datavalid <= '1';
        when others =>
      end case;
    end if;
  end process;

  process (state,addr_ready,data_ready,waddress,datain,addrvalid,datavalid,addr)
  begin
    tm3_sram_we <= "11111111";
    tm3_sram_oe <= "11";
    tm3_sram_adsp <= '1';
    tm3_sram_data <= (others => 'Z');
    tm3_sram_addr <= (others => '-');
    want_addr <= '1';
    want_data <= '0';
    case (state) is
      when S_IDLE =>
        if (addr_ready = '1') then
          next_state <= S_WRITE1;
        elsif addrvalid = '1' and datavalid = '0' then
          next_state <= S_READ;
          tm3_sram_addr <= '0' & addr;
          tm3_sram_adsp <= '0';
          tm3_sram_oe   <= "01";
        else
          next_state <= S_IDLE;
        end if;
      when S_READ =>
        next_state <= S_IDLE;
      when S_WRITE1 =>
        want_addr <= '0';
        want_data <= '1'; 
        if (addr_ready = '1') then
          next_state <= S_WRITE1;
        else
          next_state <= S_WRITE2;
        end if;
      when S_WRITE2 =>
        want_data <= '1';
        tm3_sram_addr <= '0' & waddress;
        tm3_sram_data <= datain;
        if (addr_ready = '1') then
          next_state <= S_WRITEDONE;
        elsif (data_ready = '1') then
          tm3_sram_we <= "00000000";
          tm3_sram_adsp <= '0';
          next_state <= S_WRITE3;
        else
          next_state <= S_WRITE2;
        end if;
      when S_WRITE3 =>
        if (data_ready = '1') then
          next_state <= S_WRITE3;
        else 
          next_state <= S_WRITE2;
        end if;
      when S_WRITEDONE =>
        want_addr <= '0';
        if (addr_ready = '1') then
          next_state <= S_WRITEDONE;
        else
          next_state <= S_IDLE;
        end if;
    end case;
  end process;

end rtl;
