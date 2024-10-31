library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity bilinearintrp is 
  port(
    u01a,u01b,u01c,v01a,v01b,v01c : in std_logic_vector(7 downto 0);
    u10a,u10b,u10c,v10a,v10b,v10c : in std_logic_vector(7 downto 0);
    selectuv : in std_logic_vector(2 downto 0);
    ru,rv,rw,gu,gv,gw,bu,bv,bw : in std_logic_vector(6 downto 0);
    r,g,b : out std_logic_vector(6 downto 0);
    clk      : in std_logic);
end;

architecture rtl of bilinearintrp is
signal u,v,ul,vl,wl : std_logic_vector(7 downto 0);
signal i1b,i2b,i3b,i1g,i2g,i3g,i1r,i2r,i3r : std_logic_vector(14 downto 0);
signal rul,rvl,rwl,gul,gvl,gwl,bul,bvl,bwl : std_logic_vector(6 downto 0);
signal r_1,g_1,b_1 : std_logic_vector(14 downto 0);
begin
  process(selectuv,u01a,u01b,u01c,v01a,v01b,v01c,u10a,u10b,u10c,v10a,v10b,v10c)
  begin
    case(selectuv) is
      when "000" => u <= u01a; v <= v01a;
      when "001" => u <= u01b; v <= v01b;
      when "010" => u <= u01c; v <= v01c;
      when "100" => u <= u10a; v <= v10a;
      when "101" => u <= u10b; v <= v10b;
      when "110" => u <= u10c; v <= v10c;
      when others => u <= (others => '-'); v <= (others => '-');
    end case;
  end process;

  process(clk)
  begin
    if (rising_edge(clk)) then
      wl <= "11111111" - u - v;      
      ul <= u;
      vl <= v;
      rul <= ru; rvl <= rv; rwl <= rw;
      gul <= gu; gvl <= gv; gwl <= gw;
      bul <= bu; bvl <= bv; bwl <= bw;
      i1r <= ul*rul;
      i2r <= vl*rvl;
      i3r <= wl*rwl;
      i1g <= ul*gul;
      i2g <= vl*gvl;
      i3g <= wl*gwl;
      i1b <= ul*bul;
      i2b <= vl*bvl;
      i3b <= wl*bwl;
    end if;
  end process;
  r_1 <= i1r+i2r+i3r;
  r <= r_1 (14 downto 8);

  g_1 <= i1g+i2g+i3g;
  g <= g_1 (14 downto 8);
  
  b_1 <= i1b+i2b+i3b;
  b <= b_1 (14 downto 8);

end rtl;
