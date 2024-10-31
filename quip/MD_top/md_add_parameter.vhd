
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity adder is
  
  generic (
    a_width            : integer := 16;
    a_lsb_log_weight   : integer := 0;
    b_width            : integer := 16;
    b_lsb_log_weight   : integer := 0;
    sum_width          : integer := 16;
    sum_lsb_log_weight : integer := 16);

  port (
    A    : in  std_logic_vector(a_width-1 downto 0);
    B    : in  std_logic_vector(b_width-1 downto 0);
    sum  : out std_logic_vector(sum_width-1 downto 0);
    cout : out std_logic);

end adder;



architecture behav of adder is
  constant massive_offset : integer := 200;
  
  signal a_int   : std_logic_vector( 2*massive_offset downto 0);
  signal b_int   : std_logic_vector( 2*massive_offset downto 0);
  signal sum_int : std_logic_vector (2*massive_offset downto 0);
begin  -- struct
         -- we assume sum_lsb_log_weight is bigger than min (a_lsb_log_weight, b_lsb_log_weight) this is
           -- the case because it wouldn't make sense to add two higher weight numbers 
             -- and expect a lower weight number

  a_int(a_width-1 + a_lsb_log_weight + massive_offset downto a_lsb_log_weight + massive_offset) <= A;
  a_pad_gen : if a_lsb_log_weight +massive_offset> 0 generate
    a_int(a_lsb_log_weight-1  + massive_offset downto 0) <= (others => '0');
  end generate a_pad_gen;
  a_signx_gen: if(a_width-1 + a_lsb_log_weight + massive_offset)<2*massive_offset  generate
    a_int(2*massive_offset downto a_width + a_lsb_log_weight + massive_offset)<= (others => A(a_width-1));
  end generate a_signx_gen;

  b_int(b_width-1 + b_lsb_log_weight  + massive_offset downto b_lsb_log_weight + massive_offset) <= B;
  b_pad_gen : if b_lsb_log_weight +massive_offset> 0 generate
    b_int(b_lsb_log_weight-1 + massive_offset downto 0) <= (others => '0');
  end generate b_pad_gen;
  b_signx_gen: if (b_width-1 + b_lsb_log_weight + massive_offset)<2*massive_offset  generate
    b_int(2*massive_offset downto b_width + b_lsb_log_weight + massive_offset)<= (others => B(b_width-1));
  end generate b_signx_gen;


  sum_int <= a_int+b_int;
--    a_wider_b_in_a_gt_b: if (a_lsb_log_weight+a_width>=b_width+b_lsb_log_weight generate
--      sum_int(a_lsb_log_weight+a_ downto 0) <= a_int+b_int;
--    end generate a_wider_b_in_a_gt_b;
--    b_wider_a_in_a_gt_b: if a_width+a_lsb_log_weight<b_width+b_lsb_log_weight generate
--      sum_int(b_width+b_lsb_log_weight-1 downto 0) <= a_int+b_int;
--    end generate b_wider_a_in_a_gt_b;

sum<=sum_int(sum_width-1 + sum_lsb_log_weight+massive_offset downto sum_lsb_log_weight + massive_offset);
  
--  a_gt_b : if a_lsb_log_weight >= b_lsb_log_weight generate
    
--    sum <= sum_int(sum_width - 1 +(sum_lsb_log_weight-b_lsb_log_weight)  + massive_offset downto sum_lsb_log_weight - b_lsb_log_weight + massive_offset);
--  end generate a_gt_b;
--  b_gt_a : if b_lsb_log_weight > a_lsb_log_weight generate
----    sum_int <= a_int+b_int;
--    sum <= sum_int(sum_width - 1 +(sum_lsb_log_weight-a_lsb_log_weight) + massive_offset downto sum_lsb_log_weight - a_lsb_log_weight + massive_offset);
--  end generate b_gt_a;


                                        --Not sure if a carry will be needed.  For now tie it ground
  cout <= '0';

end behav;



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

package md_common_add is

  component adder
  
  generic (
    a_width            : integer := 16;
    a_lsb_log_weight   : integer := 0;
    b_width            : integer := 16;
    b_lsb_log_weight   : integer := 0;
    sum_width          : integer := 16;
    sum_lsb_log_weight : integer := 16);

  port (
    A    : in  std_logic_vector(a_width-1 downto 0);
    B    : in  std_logic_vector(b_width-1 downto 0);
    sum  : out std_logic_vector(sum_width-1 downto 0);
    cout : out std_logic);

end component;


end md_common_add;
