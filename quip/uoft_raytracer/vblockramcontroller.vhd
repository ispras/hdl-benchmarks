library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

library work;
use work.complib.all;

entity vblockramcontroller is 
  generic(
    width : natural := 32;
    depth : natural := 10);
  port(
    want_addr : out std_logic;
    addr_ready : in std_logic;
    addrin : in std_logic_vector(depth-1 downto 0);
    want_data : out std_logic;
    data_ready : in std_logic;
    datain : in std_logic_vector(width-1 downto 0);

    addr : in std_logic_vector(depth-1 downto 0);
    addrvalid : in std_logic;
    data : out std_logic_vector(width-1 downto 0);
    datavalid : buffer std_logic;

    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of vblockramcontroller is
  type state_type is (S_IDLE,S_WRITE1,S_WRITE2,S_WRITE3,S_WRITEDONE,S_READ);
  signal state : state_type;
  signal next_state : state_type;

  signal waddr,saddr : std_logic_vector(depth-1 downto 0);
  signal dataout : std_logic_vector(width-1 downto 0);
  signal we : std_logic;  
begin

  saddr <= waddr when state /= S_IDLE else addr;

  ramblock : spramblock
    generic map (width,depth)
    port map(we,saddr,datain,dataout,clk);


  process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_IDLE;
      waddr <= (others => '0');
      data <= (others => '0');
      datavalid <= '0';
    elsif (rising_edge (clk)) then
      state <= next_state;

      case (state) is
        when S_IDLE =>
          if (addr_ready = '1') then
            waddr <= addrin;
          end if;
          if addrvalid = '0' then
            datavalid <= '0';
          end if;
        when S_WRITE2 =>
          if (data_ready = '1') then
            waddr <= waddr+1;
          end if;
        when S_READ => 
          data <= dataout;
          datavalid <= '1';
        when others =>
      end case;
    end if;
  end process;

  process (state,addr_ready,data_ready,addrvalid,datavalid)
  begin
    we <= '0';
    want_addr <= '1';
    want_data <= '0';
    case (state) is
      when S_IDLE =>
        if (addr_ready = '1') then
          next_state <= S_WRITE1;
        elsif addrvalid = '1' and datavalid = '0' then
          next_state <= S_READ;
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
        if (addr_ready = '1') then
          next_state <= S_WRITEDONE;
        elsif (data_ready = '1') then
          we <= '1';
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
