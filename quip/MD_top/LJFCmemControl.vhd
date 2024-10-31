library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity LJFCmemControl is
  generic(intlength  :       integer := 64;
          lookupsize :       integer := 17);
  port(
    clk              : in    std_logic;
    tm3_sram_data    : inout std_logic_vector(63 downto 0);
    tm3_sram_addr    : out   std_logic_vector(18 downto 0);
    tm3_sram_we      : out   std_logic_vector(7 downto 0);
    tm3_sram_oe      : out   std_logic_vector(1 downto 0);
    tm3_sram_adsp    : out   std_logic;

    data_x                  : in  std_logic_vector(lookupsize-1 downto 0);
    data_y                  : out std_logic_vector(intlength-1 downto 0);
    -- write/read enables are the same as 'valid' signal
    md_re_pg                : in  std_logic;
    -- write/read complete are the same as 'accept' signal
    md_read_complete_pos_pg : out std_logic;
    -- reset signal
    md_async_reset_bar      : in  std_logic);
end LJFCmemControl;

architecture arch_LJFCmemControl of LJFCmemControl is

  signal leading_zero              : std_logic_vector(18 downto lookupsize);
  type master_state is (STUPID_SYNPLICITY,IDLE, START_READ, WAIT_READ, ACK,WAIT_REQ_LOW);
  signal current_state, next_state : master_state;
  component data_reg_mc is

                          generic (
                            width : integer := 16);

                        port (
                          D        : in  std_logic_vector(width-1 downto 0);
                          Q        : out std_logic_vector(width-1 downto 0);
                          clk      : in  std_logic;
                          enable   : in  std_logic;  -- enable signal
                          areset_b : in  std_logic);

  end component;
  signal address_enable, data_enable : std_logic;
  signal addr_internal               : std_logic_vector(lookupsize-1 downto 0);
  signal data_internal               : std_logic_vector(63 downto 0);

begin
  leading_zero <= (others => '0');

  data_y                               <= data_internal(intlength-1 downto 0);
  tm3_sram_addr(18 downto lookupsize)  <= (others => '0');
  tm3_sram_addr(lookupsize-1 downto 0) <= addr_internal;
  tm3_sram_adsp                        <= '0';
  tm3_sram_we                          <= "11111111";

  WITH current_state SELECT
     tm3_sram_data <= (OTHERS => '0') when stupid_synplicity,
     							     (OTHERS => 'Z') when OTHERS;
  
  lookup_fsm : process (clk, md_async_reset_bar)
  begin  -- process read_fsm
    if md_async_reset_bar = '0' then    -- asynchronous reset (active low)
      current_state <= STUPID_SYNPLICITY;
    elsif clk'event and clk = '1' then  -- rising clock edge
      current_state <= next_state;
    end if;
  end process lookup_fsm;



  master_fsm_update : process (md_re_pg,current_state)
  begin  -- process f
    case current_state is
      when STUPID_SYNPLICITY =>next_state <=IDLE;
      when IDLE       => if (md_re_pg = '1') then
                           next_state <= START_READ;
                         else
                           next_state <= IDLE;
                         end if;
      when START_READ => next_state   <= WAIT_READ;
      when WAIT_READ  => next_state   <= ACK;
      when ACK        => next_state   <= WAIT_REQ_LOW;
      when WAIT_REQ_LOW        => if (md_re_pg='0') then
                                    next_state<=IDLE;
                                  else
                                    next_state<=WAIT_REQ_LOW;
                                  end if;
      when others     => next_state   <= IDLE;
    end case;
  end process master_fsm_update;



  master_output : process (current_state)
  begin  -- process f
    case current_state is

	  when STUPID_SYNPLICITY =>
        address_enable          <= '0';
        data_enable             <= '0';
        md_read_complete_pos_pg <= '0';
		 tm3_sram_oe                          <= "11";        

      when IDLE       =>
        address_enable          <= '1';
        data_enable             <= '0';
        md_read_complete_pos_pg <= '0';
		 tm3_sram_oe                          <= "00";                
      when START_READ =>
        address_enable          <= '0';
        data_enable             <= '1';
        md_read_complete_pos_pg <= '0';
		 tm3_sram_oe                          <= "00";                
      when WAIT_READ =>
        address_enable          <= '0';
        data_enable             <= '1';
        md_read_complete_pos_pg <= '0';
		 tm3_sram_oe                          <= "00";                        
      when ACK       =>
        address_enable          <= '0';
        data_enable             <= '0';
        md_read_complete_pos_pg <= '1';
		 tm3_sram_oe                          <= "00";                        
      when WAIT_REQ_LOW       =>
        address_enable          <= '0';
        data_enable             <= '0';
        md_read_complete_pos_pg <= '0';
		 tm3_sram_oe                          <= "00";                        
      when others    =>
        address_enable          <= '1';
        data_enable             <= '0';
        md_read_complete_pos_pg <= '0';
		 tm3_sram_oe                          <= "00";                        
    end case;
  end process master_output;

  data_registers : data_reg_mc generic map (
    width      => 64)
    port map (
      D        => tm3_sram_data,
      Q        => data_internal,
      clk      => clk,
      enable   => data_enable,
      areset_b => md_async_reset_bar);

  addr_registers : data_reg_mc generic map (
    width      => lookupsize)
    port map (
      D        => data_x,
      Q        => addr_internal,
      clk      => clk,
      enable   => address_enable,
      areset_b => md_async_reset_bar);


end arch_LJFCmemControl;

library ieee;
use ieee.std_logic_1164.all;

entity data_reg_mc is

  generic (
    width : integer := 16);

  port (
    D        : in  std_logic_vector(width-1 downto 0);
    Q        : out std_logic_vector(width-1 downto 0);
    clk      : in  std_logic;
    enable   : in  std_logic;           -- enable signal
    areset_b : in  std_logic);

end data_reg_mc;


architecture behav of data_reg_mc is
  signal Q_internal : std_logic_vector(width-1 downto 0);
begin  -- behav

                                        -- purpose: Register with asynchronous reset
                                        -- type   : sequential
                                        -- inputs : clk, reset, D, enable, reset, shiftr
                                        -- outputs: Q
  regular_reg : process (clk, areset_b)
  begin  -- process shiftty
    if areset_b = '0' then              -- asynchronous reset (active low)
      Q_internal   <= (others => '0');
    elsif clk'event and clk = '1' then  -- rising clock edge
      if enable = '1' then
        Q_internal <= D;
      else
        Q_internal <= Q_internal;
      end if;
    end if;
  end process regular_reg;
  Q                <= Q_internal;
end behav;























