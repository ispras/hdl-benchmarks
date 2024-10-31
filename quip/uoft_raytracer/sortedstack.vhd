library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity sortedstack is 
  generic (
    keywidth  : natural := 32;
    datawidth : natural := 32+16;
    depth : natural := 8);
  port(
    keyin : in std_logic_vector(keywidth-1 downto 0);
    datain : in std_logic_vector(datawidth-1 downto 0);
    write : in std_logic;
    reset : in std_logic;
    peekdata : out std_logic_vector(datawidth*depth-1 downto 0);
    globalreset : in std_logic;
    clk : in std_logic);
end;

architecture rtl of sortedstack is 
  type stdlogicarraykey is array(0 to depth-1) of std_logic_vector(keywidth-1 downto 0);
  type stdlogicarraydata is array(0 to depth-1) of std_logic_vector(datawidth-1 downto 0);
  type stdlogicarraybit is array(0 to depth-1) of std_logic;

  signal key : stdlogicarraykey;
  signal data : stdlogicarraydata;
  signal full : stdlogicarraybit;
  signal location : integer range 0 to depth-1;
begin
  peeklp : for k in 0 to depth-1 generate
    peekdata((k+1)*(datawidth)-1 downto k*(datawidth)) <= data(k) when full(k) = '1' else (others => '0');
  end generate peeklp;

  -- Select the proper insertion point
  process (keyin,key,full)
  begin 
    location <= depth-1;
    nrst: for k in depth-2 downto 0 loop
      if ((keyin < key(k)) or (full(k) = '0')) then
        location <= k;
      end if;
    end loop nrst;
  end process;

  process (clk,globalreset,reset)
  begin
    if ((globalreset = '1') or (reset = '1')) then
      clr: for k in 0 to depth-1 loop
        full(k) <= '0';
        key(k) <= (others => '0');
        data(k) <= (others => '0');
      end loop clr;
    elsif rising_edge(clk) then
      if (write = '1') then
        key(location) <= keyin;
        data(location) <= datain;
        full(location) <= '1';
        shft: for k in 0 to depth-2 loop
          if (k >= location) then
            key(k+1) <= key(k);
            data(k+1) <= data(k);
            full(k+1) <= full(k);
          end if;
        end loop shft;
      end if;
    end if;
  end process;

end rtl;
