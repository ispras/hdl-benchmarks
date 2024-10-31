
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity multiplier is
  
  
  generic (
    A_width            : integer := 16;
    A_lsb_log_weight   : integer := 0;
    B_width            : integer := 16;
    B_lsb_log_weight   : integer := 0;
    out_width          : integer := 32;
    out_lsb_log_weight : integer := 0);

  port (
    A        : in  std_logic_vector(A_width-1 downto 0);
    B        : in  std_logic_vector(B_width-1 downto 0);
    product  : out std_logic_vector(out_width-1 downto 0);
    clk      : in  std_logic;
    areset_b : in  std_logic);

end multiplier;

architecture behav of multiplier is
  signal internal_prod2 : std_logic_vector(A_width+B_width -1 downto 0);
  signal internal_prod  : std_logic_vector(A_width+B_width-1 downto 0);
  signal A_int          : std_logic_vector(A_width -1 downto 0);
  signal B_int          : std_logic_vector(B_width -1 downto 0);

begin  -- struct

  internal_prod2 <= A*B;


  w_ab_gt_c : if (a_lsb_log_weight+b_lsb_log_weight > out_lsb_log_weight) generate
    --Arithmetic Left shift
    internal_prod(A_width+B_width-1 downto -out_lsb_log_weight +(a_lsb_log_weight + b_lsb_log_weight)) <= internal_prod2(A_width+B_width-1 +out_lsb_log_weight -(a_lsb_log_weight + b_lsb_log_weight) downto 0);
--    internal_prod((a_lsb_log_weight + b_lsb_log_weight) -out_lsb_log_weight -1 downto 0)              <= (others => '0');
    internal_prod(47 downto 0)              <= (others => '0');

  end generate w_ab_gt_c;

  w_ab_lt_c : if (a_lsb_log_weight+b_lsb_log_weight < out_lsb_log_weight) generate
    --Shift Right
    internal_prod(A_width+B_width-1-(-a_lsb_log_weight-b_lsb_log_weight+out_lsb_log_weight) downto 0)                 <= internal_prod2(A_width+B_width-1 downto (-a_lsb_log_weight-b_lsb_log_weight+out_lsb_log_weight));
    internal_prod(A_width+B_width-1 downto (A_width+B_width-(-a_lsb_log_weight-b_lsb_log_weight+out_lsb_log_weight))) <= (others => internal_prod2(A_width+B_width-1));
  end generate w_ab_lt_c;

  w_ab_eq_c : if (a_lsb_log_weight+b_lsb_log_weight = out_lsb_log_weight) generate
    --Do nothing
    internal_prod <= internal_prod2;
  end generate w_ab_eq_c;


  l_ab_lt_c : if (A_width+B_width < out_width) generate
    --Sign extend
    product(A_width+B_width-1 downto 0)         <= internal_prod;
    product(out_width-1 downto A_width+B_width) <= ( others => internal_prod(A_width+B_width-1));
  end generate l_ab_lt_c;
  l_ab_gt_c : if (A_width+B_width >= out_width) generate
    product <= internal_prod(out_width-1 downto 0);
  end generate l_ab_gt_c;
  
  
end behav;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

package md_common_multiplier is

  

  component multiplier
    
    
    generic (
      A_width            : integer := 16;
      A_lsb_log_weight   : integer := 0;
      B_width            : integer := 16;
      B_lsb_log_weight   : integer := 0;
      out_width          : integer := 32;
      out_lsb_log_weight : integer := 0);

    port (
      A        : in  std_logic_vector(A_width-1 downto 0);
      B        : in  std_logic_vector(B_width-1 downto 0);
      product  : out std_logic_vector(out_width-1 downto 0);
      clk      : in  std_logic;
      areset_b : in  std_logic);

  end component;

end md_common_multiplier;
