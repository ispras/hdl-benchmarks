library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity nearcmpspec is 
  port(
    tin     : in std_logic_vector(31 downto 0);
    uin,vin : in std_logic_vector(15 downto 0);
    triIDin : in std_logic_vector(15 downto 0);
    hit     : in std_logic;
   
    t : buffer std_logic_vector(31 downto 0);
    u,v    : out std_logic_vector(15 downto 0);
    triID  : out std_logic_vector(15 downto 0);
    anyhit : out std_logic;

    enable : in std_logic;
    enablenear : in std_logic;
    reset  : in std_logic;

    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of nearcmpspec is
  type nc_state_type is (S_RESET,S_NOHIT,S_EXISTS);

  signal state,next_state : nc_state_type;
  signal latchnear : std_logic;
begin
  anyhit <= '1' when (state = S_EXISTS) else '0';
  
  process(clk,globalreset)
  begin
    if (globalreset = '1') then
      state <= S_RESET;
      t <= (others => '0');
      u <= (others => '0');
      v <= (others => '0');
      triID  <= (others => '0');
    elsif (rising_edge(clk)) then
      state <= next_state;
      if latchnear = '1' then
        t <= tin;
        u <= uin;
        v <= vin;
        triID <= triIDin;
      end if;
    end if;
  end process;

  process (state,tin,t,enable,hit,reset)
  begin
    latchnear <= '0';
    case state IS
      when S_RESET =>
        if (enable = '1') and (hit = '1') then
          next_state <= S_EXISTS;
          latchnear <= '1';
        elsif (enablenear = '1') and (hit = '1') then
          latchnear <= '1';
          next_state <= S_NOHIT;
        else
          next_state <= S_RESET;
        end if;
      when S_NOHIT =>
        if (reset = '1') then
          if (enable = '1') and (hit = '1') then
            latchnear <= '1';
            next_state <= S_EXISTS;
          elsif (enablenear = '1') and (hit = '1') then
            latchnear <= '1';
            next_state <= S_NOHIT;
          else
            next_state <= S_RESET;
          end if;
        elsif (enable = '1') and (hit = '1') then
          if (tin < t) then
            latchnear <= '1';
          end if;
          next_state <= S_EXISTS;
        elsif (enablenear = '1') and (hit = '1') and (tin < t) then
          latchnear <= '1';
          next_state <= S_NOHIT;
        else
          next_state <= S_NOHIT;
        end if;
      when S_EXISTS =>
        if (reset = '1') then
          if (enable = '1') and (hit = '1') then
            latchnear <= '1';
            next_state <= S_EXISTS;
          elsif (enablenear = '1') and (hit = '1') then
            latchnear <= '1';
            next_state <= S_NOHIT;
          else
            next_state <= S_RESET;
          end if;
        else
          if (enable = '1') and (hit = '1') then
            if (tin < t) then
              latchnear <= '1';
            end if;
          elsif (enablenear = '1') and (hit = '1') then
            if (tin < t) then
              latchnear <= '1';
            end if;
          end if;
          next_state <= S_EXISTS;
        end if;
    end case;
  end process;

end rtl;
