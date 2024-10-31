------------------------------------------
-- Triangle Memory Controller Component --
--                                      --
--  There are 2 nibble bus signals that --
--  allow the component to download     --
--  memory contents from the sun. First --
--  the started address is written,     --
--  then data is written in 64bit       --
--  chunks. The address is auto inc'd   --
--                                      --
--  The dataout and datavalid signals   --
--  contain the triangle data           --
--                                      --
--  wanttriID is high to request a new  --
--  triangle ID for 2nd cycle. A high   --
--  triIDvalid signal indicates it      --
--  that the user has applied that      --
--  signal to the triID port.           --
--                                      --
--  cyclenum is a control signal that   --
--  counts from 0-2.  This signal       --
--  determines the ray to be sent to    --
--  the ray tri unit as well as which   --
--  nearest compare unit to use         --
------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity memoryinterface is 
  port(
    want_addr : out std_logic;
    addr_ready : in std_logic;
    addrin : in std_logic_vector(17 downto 0);
    want_data : out std_logic;
    data_ready : in std_logic;
    datain : in std_logic_vector(63 downto 0);

    dataout       : out std_logic_vector(191 downto 0);
    triIDout      : out std_logic_vector(15 downto 0);
    datavalid     : out std_logic;
    triIDvalid    : in std_logic;
    triID         : in std_logic_vector(15 downto 0);
    wanttriID     : out std_logic;
    cyclenum      : out std_logic_vector(1 downto 0);

    tm3_sram_data : inout std_logic_vector(63 downto 0);
    tm3_sram_addr : out std_logic_vector(18 downto 0);
    tm3_sram_we   : out std_logic_vector(7 downto 0);
    tm3_sram_oe   : out std_logic_vector(1 downto 0);
    tm3_sram_adsp : out std_logic;
    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of memoryinterface is	
  type state_type is (S_READ1,S_READ2,S_READ3,S_WRITE1,S_WRITE2,S_WRITE3,S_WRITEDONE);
  signal state : state_type;
  signal next_state : state_type;

  signal address,oldaddress  : std_logic_vector(15 downto 0);
  signal waddress : std_logic_Vector(17 downto 0);
  signal databuff : std_logic_vector(127 downto 0);
  signal addrvalid, oldaddrvalid : std_logic;
begin

  process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_READ1;
      addrvalid <= '0';
      oldaddrvalid <= '0';
      address <= (others => '0');
      waddress <= (others => '0');
      databuff <= (others => '0');
      dataout <= (others => '0');
      triIDout <= (others => '0');
      oldaddress <= (others => '0');
      datavalid <= '0';
      wanttriID <= '0';
    elsif (rising_edge (clk)) then
      state <= next_state;
      wanttriID <= '0';
      case (state) is
        when S_READ1 =>
          if (addr_ready = '1') then
            waddress <= addrin;
          end if;
          databuff(63 downto 0) <= tm3_sram_data;
        when S_READ2 =>
          databuff(127 downto 64) <= tm3_sram_data;
          oldaddrvalid <= addrvalid;
          oldaddress <= address;
          if (triIDvalid = '1') then
            addrvalid <= '1';
            address <= triID;
          else
            addrvalid <= '0';
          end if;
          wanttriID <= '1';
        when S_READ3 =>
          dataout <= tm3_sram_data & databuff;
          datavalid <= oldaddrvalid;
          triIDout <= oldaddress;
        when S_WRITE2 =>
          if (data_ready = '1') then
            waddress <= waddress+1;
          end if;
        when S_WRITEDONE =>
          addrvalid <= '0';
        when others =>
      end case;
    end if;
  end process;

  process (state,address,addr_ready,data_ready,waddress,datain)
  begin
    tm3_sram_we <= "11111111";
    tm3_sram_oe <= "11";
    tm3_sram_adsp <= '1';
    tm3_sram_data <= (others => 'Z');
    tm3_sram_addr <= (others => '-');
    cyclenum <= (others => '-');
    want_addr <= '1';
    want_data <= '0';
    case (state) is
      when S_READ1 =>
        tm3_sram_addr <= '0' & address & "01";
        tm3_sram_adsp <= '0';
        tm3_sram_oe   <= "01";
        cyclenum <= "00";
        if (addr_ready = '1') then
          next_state <= S_WRITE1;
        else
          next_state <= S_READ2;
        end if;
      when S_READ2 =>
        tm3_sram_addr <= '0' & address & "10";
        tm3_sram_adsp <= '0';
        tm3_sram_oe   <= "01";
        cyclenum <= "01";
        next_state <= S_READ3;
      when S_READ3 =>
        tm3_sram_addr <= '0' & address & "00";
        tm3_sram_adsp <= '0';
        tm3_sram_oe   <= "01";
        cyclenum <= "10";
        next_state <= S_READ1;
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
          next_state <= S_READ1;
        end if;
    end case;
  end process;

end rtl;
