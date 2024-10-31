
-------------------------------------------------------------------------------
-- First half of the velocity verlet
-- The velocity verlet is called in two stages theoretically and this is the
-- first step.
-- In this first stage the following calculations are performed:
-- r(t+dt)=r(t)+dt*v(t)+1/2*dt^2*a(t)
-- v(t+1/2*dt)=v(t)+1/2*dt*a(t)
-- This block accepts the parameters for on dimension.  So for 3D operations
-- then 3 versions of this could be instantiate or control logic could time
-- multiplex this unit.
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Notes
-- I only have one parameter of time width meaning I assume that both dt^2
-- and dt are the same width.  This clearly may not be a valid assumption.
-- Note 2:
-- The 1/2 factors in the equation will be implemented by simple shifts
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity verlet_step1 is

  generic (
    pos_width          : integer := 32;
    pos_lsb_log_weight : integer := 0;
    vel_width          : integer := 32;
    vel_lsb_log_weight : integer := 0;
    step2_vel_width : integer := 32;
    step2_vel_lsb_log_weight : integer :=0;
    acc_width          : integer := 32;
    acc_lsb_log_weight : integer := 0;

    dt_width            : integer := 11;
    dt_lsb_log_weight   : integer := 0;
    k_width             : integer := 32;
    k_lsb_log_weight    : integer := 0;
    k_dt_width          : integer := 32;
    k_dt_lsb_log_weight : integer := 0;

    a_dt_mult_width : integer :=32;
    a_dt_lsb_log_weight : integer :=0;
    a_dt2_mult_width : integer :=32;
    a_dt2_lsb_log_weight : integer :=0;
    v_dt_mult_width : integer :=32;
    v_dt_lsb_log_weight : integer :=32
    );

  
  port (
    position_t    : in  std_logic_vector(pos_width-1 downto 0);
    velocity_t    : in  std_logic_vector(step2_vel_width-1 downto 0);
    accel_t       : in  std_logic_vector(acc_width-1 downto 0);
    dt            : in  std_logic_vector(dt_width-1 downto 0);
    k_dt          : in  std_logic_vector(k_dt_width-1 downto 0);
    k             : in  std_logic_vector(k_width-1 downto 0);
    vel_t_half_dt : out std_logic_vector(vel_width-1 downto 0);
    position_t_dt : out std_logic_vector(pos_width-1 downto 0);
    clk           : in  std_logic;
    areset_b      : in  std_logic);
end verlet_step1;

architecture struct of verlet_step1 is

  use work.md_common_multiplier.all;
  use work.verlet_update_comp.all;
  use work.md_common_add.all;
  signal v_dt_prod              : std_logic_vector(v_dt_mult_width-1 downto 0);
  signal a_dt2_prod             : std_logic_vector(a_dt2_mult_width-1 downto 0);
  signal position_t_new         : std_logic_vector(pos_width-1 downto 0);
  signal half_a_dt2_prod        : std_logic_vector(a_dt2_mult_width-1 downto 0);
  signal half_a_dt_prod         : std_logic_vector(a_dt_mult_width-1 downto 0);
  signal a_dt_prod              : std_logic_vector(a_dt_mult_width-1 downto 0);
  signal velocity_t_half_dt_new : std_logic_vector(vel_width-1 downto 0);
  signal add_intermediate : std_logic_vector(a_dt2_mult_width-1 downto 0);
begin  -- struct

  --No pipelining just the math.
  mult_v : multiplier generic map (
--    A_width            => dt_width,
--    A_lsb_log_weight   => dt_lsb_log_weight,
--    B_width            => 44,
--    B_lsb_log_weight   => -13,
--    out_width          => 43,
--    out_lsb_log_weight => -62)
    A_width            => dt_width,
    A_lsb_log_weight   => dt_lsb_log_weight,
    B_width            => step2_vel_width,
    B_lsb_log_weight   => step2_vel_lsb_log_weight,
    out_width          => v_dt_mult_width,
    out_lsb_log_weight => v_dt_lsb_log_weight)
    port map (
      A        => dt,
      B        => velocity_t,
      product  => v_dt_prod,
      clk      => clk,
      areset_b => areset_b);

  mult_a : multiplier generic map (
--    A_width            => 11,
--    A_lsb_log_weight   => -60,
--    B_width            => 43,
--    B_lsb_log_weight   => -12,
--    out_width          => 43,
--    out_lsb_log_weight => a_dt2_lsb_log_weight)
    A_width            => k_dt_width,
    A_lsb_log_weight   => k_dt_lsb_log_weight,
    B_width            => acc_width,
    B_lsb_log_weight   => acc_lsb_log_weight,
    out_width          => a_dt2_mult_width,
    out_lsb_log_weight => a_dt2_lsb_log_weight)
    port map (
      A        => k_dt,
      B        => accel_t,
      product  => a_dt2_prod,
      clk      => clk,
      areset_b => areset_b);


  half_a_dt2_prod <= a_dt2_prod(a_dt2_mult_width-1) & a_dt2_prod(a_dt2_mult_width-1 downto 1);
  
--  add_new_r : adder_3in generic map (
--    A_width            => pos_width,
--    A_lsb_log_weight   => pos_lsb_log_weight,
--    B_width            => v_dt_mult_width,
--    B_lsb_log_weight   => v_dt_lsb_log_weight,
--    C_width            => a_dt2_mult_width,
--    C_lsb_log_weight   => a_dt2_lsb_log_weight,
--    sum_width          => pos_width,
--    sum_lsb_log_weight => pos_lsb_log_weight)
--    port map (
--      A   => position_t,
--      B   => v_dt_prod,
--      C   => half_a_dt2_prod,
--      sum => position_t_new);

  add_new_r_first_half : adder generic map (
--    A_width            => 43,
--    A_lsb_log_weight   => 0,
--    B_width            => 43,
--    B_lsb_log_weight   => 0,
--    sum_width          => 43,
--    sum_lsb_log_weight => 0)
    A_width            => a_dt2_mult_width,
    A_lsb_log_weight   => a_dt2_lsb_log_weight,
    B_width            => v_dt_mult_width,
    B_lsb_log_weight   => v_dt_lsb_log_weight,
    sum_width          => a_dt2_mult_width,
    sum_lsb_log_weight => a_dt2_lsb_log_weight)
    port map (
      A   => half_a_dt2_prod,
      B   => v_dt_prod,
      sum => add_intermediate);

  add_new_r_second_half : adder generic map (
    A_width            => a_dt2_mult_width,
    A_lsb_log_weight   => a_dt2_lsb_log_weight,
    B_width            => pos_width,
    B_lsb_log_weight   => pos_lsb_log_weight,
    sum_width          => pos_width,
    sum_lsb_log_weight => pos_lsb_log_weight)
    port map (
      A   => add_intermediate,
      B   => position_t,
      sum => position_t_new);

  
  position_t_dt <= position_t_new;


  --This logic calculates v at t+1/2*dt

  mult_a_dt : multiplier generic map (
    A_width            => k_width,
    A_lsb_log_weight   => k_lsb_log_weight,
    B_width            => acc_width,
    B_lsb_log_weight   => acc_lsb_log_weight,
    out_width          => a_dt_mult_width,
    out_lsb_log_weight => a_dt_lsb_log_weight)
    port map (
      A        => k,
      B        => accel_t,
      product  => a_dt_prod,
      clk      => clk,
      areset_b => areset_b);

  half_a_dt_prod <= a_dt_prod(a_dt_mult_width-1) & a_dt_prod(a_dt_mult_width-1 downto 1);
  
  add_new_v : adder generic map (
    A_width            => step2_vel_width,
    A_lsb_log_weight   => step2_vel_lsb_log_weight,
    B_width            => a_dt_mult_width,
    B_lsb_log_weight   => a_dt_lsb_log_weight,
    sum_width          => vel_width,
    sum_lsb_log_weight => vel_lsb_log_weight)
    port map (
      A   => velocity_t,
      B   => half_a_dt_prod,
      sum => velocity_t_half_dt_new);

  vel_t_half_dt <= velocity_t_half_dt_new;

end struct;

--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_signed.all;

--entity multiplier is
  
  
--  generic (
--    A_width            : integer := 16;
--    A_lsb_log_weight   : integer := 0;
--    B_width            : integer := 16;
--    B_lsb_log_weight   : integer := 0;
--    out_width          : integer := 32;
--    out_lsb_log_weight : integer := 0);

--  port (
--    A        : in  std_logic_vector(A_width-1 downto 0);
--    B        : in  std_logic_vector(B_width-1 downto 0);
--    product  : out std_logic_vector(out_width-1 downto 0);
--    clk      : in  std_logic;
--    areset_b : in  std_logic);

--end multiplier;

--architecture behav of multiplier is
--  use work.gen_mult_package.all;
----  constant INTEGER_INPUT_SIZE  : integer := in_width;
----constant INTEGER_OUTPUT_SIZE : integer := out_width;
--  signal   internal_prod       : std_logic_vector(A_width+B_width-1 downto 0);
--  signal   A_int               : std_logic_vector(A_width+A_lsb_log_weight -1 downto 0);
--  signal   B_int               : std_logic_vector(A_width+A_lsb_log_weight -1 downto 0);

--begin  -- struct

--  --internal_prod is needed because otherwise synplicity isn't too happy about
--  --the sizes not matching up.
----  internal_prod <= A*B;
----  product <= internal_prod(out_width-1 downto 0);
  
--  A_int(a_width-1 + a_lsb_log_weight downto a_lsb_log_weight) <= A;
--  a_pad_gen : if a_lsb_log_weight > 0 generate
--    a_int(a_lsb_log_weight-1 downto 0) <= (others => '0');
--  end generate a_pad_gen;

--  B_int(b_width-1 + b_lsb_log_weight downto b_lsb_log_weight) <= B;
--  b_pad_gen : if b_lsb_log_weight > 0 generate
--    b_int(b_lsb_log_weight-1 downto 0) <= (others => '0');
--  end generate b_pad_gen;

--  internal_prod <= a_int*b_int;

--  a_gt_b : if a_lsb_log_weight >= b_lsb_log_weight generate
--    product <= internal_prod(out_width - 1 +(out_lsb_log_weight-b_lsb_log_weight) downto out_lsb_log_weight - b_lsb_log_weight);
--  end generate a_gt_b;
--  b_gt_a : if b_lsb_log_weight > a_lsb_log_weight generate
--    product <= internal_prod(out_width - 1 +(out_lsb_log_weight-a_lsb_log_weight) downto out_lsb_log_weight - a_lsb_log_weight);
--  end generate b_gt_a;



--                                        --I don't connect the overflow since there is nothing I can do about it

----  generic_multiplier : MD_gen_mult generic map (
----    INTEGER_INPUT_SIZE           => INTEGER_INPUT_SIZE,
----    INTEGER_OUTPUT_SIZE          => INTEGER_OUTPUT_SIZE,
----    NUM_BITS_TO_RIGHT_OF_DECIMAL => NUM_BITS_TO_RIGHT_OF_lsb_log_weight)
----    port map (
----      a_in   => A,
----      b_in   => B,
----      output => product);
  
--end behav;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity adder_3in is
  
  generic (
    a_width            : integer := 16;
    a_lsb_log_weight   : integer := 0;
    b_width            : integer := 16;
    b_lsb_log_weight   : integer := 0;
    c_width            : integer := 16;
    c_lsb_log_weight   : integer := 0;
    sum_width          : integer := 16;
    sum_lsb_log_weight : integer := 0);

  port (
    A    : in  std_logic_vector(a_width-1 downto 0);
    B    : in  std_logic_vector(b_width-1 downto 0);
    C    : in  std_logic_vector(c_width-1 downto 0);
    sum  : out std_logic_vector(sum_width-1 downto 0);
    cout : out std_logic);

end adder_3in;

architecture behav of adder_3in is
  constant massive_number : integer := 1000;
--  signal a_int   : std_logic_vector(sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+a_width+b_lsb_log_weight+b_width+c_lsb_log_weight+c_width + massive_number downto 0);
--  signal b_int   : std_logic_vector(sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+a_width+b_lsb_log_weight+b_width+c_lsb_log_weight+c_width  + massive_number downto 0);
--  signal c_int   : std_logic_vector(sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+a_width+b_lsb_log_weight+b_width+c_lsb_log_weight+c_width  + massive_number downto 0);
--  signal sum_int : std_logic_vector (sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+a_width+b_lsb_log_weight+b_width+c_lsb_log_weight+c_width  + massive_number downto 0);
  signal a_int   : std_logic_vector(2*massive_number downto 0);
  signal b_int   : std_logic_vector(2*massive_number downto 0);
  signal c_int   : std_logic_vector(2*massive_number downto 0);
  signal sum_int : std_logic_vector (2*massive_number downto 0);

begin  -- behav
  -- we assume sum_lsb_log_weight is bigger than min (a_lsb_log_weight, b_lsb_log_weight, c_lsb_log_weight) this is
    -- the case because it wouldn't make sense to add two higher weight numbers 
      -- and expect a lower weight number

  a_int(a_width-1 + a_lsb_log_weight  + massive_number downto a_lsb_log_weight + massive_number) <= A;
  a_pad_gen : if a_lsb_log_weight + massive_number> 0 generate
    a_int(a_lsb_log_weight-1  + massive_number downto 0) <= (others => '0');
  end generate a_pad_gen;
  a_signx_gen: if a_width-1 + A_lsb_log_weight <sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+b_lsb_log_weight+a_width+b_width+c_lsb_log_weight+c_width generate
    a_int(sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+b_lsb_log_weight+a_width+b_width+c_width+c_lsb_log_weight + massive_number downto a_width + a_lsb_log_weight + massive_number)<= (others => A(a_width-1));
  end generate a_signx_gen;

  
  b_int(b_width-1 + b_lsb_log_weight + massive_number downto b_lsb_log_weight + massive_number) <= B;
  b_pad_gen : if b_lsb_log_weight + massive_number > 0 generate
    b_int(b_lsb_log_weight-1 + massive_number downto 0) <= (others => '0');
  end generate b_pad_gen;
  b_signx_gen: if b_width-1 + b_lsb_log_weight <sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+b_lsb_log_weight+a_width+b_width+c_lsb_log_weight+c_width generate
    b_int(sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+b_lsb_log_weight+a_width+b_width+c_width+c_lsb_log_weight + massive_number downto b_width + b_lsb_log_weight + massive_number)<= (others => B(b_width-1));
  end generate b_signx_gen;

  c_int(c_width-1 + c_lsb_log_weight  + massive_number downto c_lsb_log_weight + massive_number) <= C;
  c_pad_gen : if c_lsb_log_weight + massive_number > 0 generate
    c_int(c_lsb_log_weight-1  + massive_number downto 0) <= (others => '0');
  end generate c_pad_gen;
  c_signx_gen: if c_width-1 + c_lsb_log_weight <sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+b_lsb_log_weight+a_width+b_width+c_lsb_log_weight+c_width generate
    c_int(sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+b_lsb_log_weight+a_width+b_width+c_width+c_lsb_log_weight + massive_number downto c_width + c_lsb_log_weight + massive_number)<= (others => C(b_width-1));
  end generate c_signx_gen;

  sum_int <= a_int+b_int+c_int;

  a_gt_b : if a_lsb_log_weight >= b_lsb_log_weight generate
    a_gt_b_gt_c : if b_lsb_log_weight >= c_lsb_log_weight generate
      sum <= sum_int(sum_width - 1 +(sum_lsb_log_weight-c_lsb_log_weight) + massive_number downto sum_lsb_log_weight - c_lsb_log_weight + massive_number);
    end generate a_gt_b_gt_c;
    a_gt_c_gt_b : if c_lsb_log_weight > b_lsb_log_weight generate
      sum <= sum_int(sum_width - 1 +(sum_lsb_log_weight-b_lsb_log_weight) + massive_number downto sum_lsb_log_weight - b_lsb_log_weight + massive_number);
    end generate a_gt_c_gt_b;
  end generate a_gt_b;

  b_gt_a : if b_lsb_log_weight > a_lsb_log_weight generate
    b_gt_a_gt_c : if a_lsb_log_weight >= c_lsb_log_weight generate
      sum <= sum_int(sum_width - 1 +(sum_lsb_log_weight-c_lsb_log_weight) + massive_number downto sum_lsb_log_weight - c_lsb_log_weight + massive_number);
    end generate b_gt_a_gt_c;
    b_gt_c_gt_a : if c_lsb_log_weight > a_lsb_log_weight generate
      sum <= sum_int(sum_width - 1 +(sum_lsb_log_weight-a_lsb_log_weight) + massive_number downto sum_lsb_log_weight - a_lsb_log_weight + massive_number);
    end generate b_gt_c_gt_a;
  end generate b_gt_a;

  cout <= '0';

end behav;


--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_signed.all;

--entity adder is
  
--  generic (
--    a_width            : integer := 16;
--    a_lsb_log_weight   : integer := 0;
--    b_width            : integer := 16;
--    b_lsb_log_weight   : integer := 0;
--    sum_width          : integer := 16;
--    sum_lsb_log_weight : integer := 16);

--  port (
--    A    : in  std_logic_vector(a_width-1 downto 0);
--    B    : in  std_logic_vector(b_width-1 downto 0);
--    sum  : out std_logic_vector(sum_width-1 downto 0);
--    cout : out std_logic);

--end adder;

--architecture behav of adder is
--  signal a_int   : std_logic_vector(sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+b_lsb_log_weight+a_width+b_width downto 0);
--  signal b_int   : std_logic_vector(sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+b_lsb_log_weight+a_width+b_width downto 0);
--  signal sum_int : std_logic_vector (sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+b_lsb_log_weight+a_width+b_width downto 0);
--begin  -- struct
--         -- we assume sum_lsb_log_weight is bigger than min (a_lsb_log_weight, b_lsb_log_weight) this is
--           -- the case because it wouldn't make sense to add two higher weight numbers 
--             -- and expect a lower weight number

--  a_int(a_width-1 + a_lsb_log_weight downto a_lsb_log_weight) <= A;
--  a_pad_gen : if a_lsb_log_weight > 0 generate
--    a_int(a_lsb_log_weight-1 downto 0) <= (others => '0');
--  end generate a_pad_gen;
--  a_signx_gen: if a_width-1 + A_lsb_log_weight <sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+b_lsb_log_weight+a_width+b_width generate
--    a_int(sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+b_lsb_log_weight+a_width+b_width downto a_width + a_lsb_log_weight)<= (others => A(a_width-1));
--  end generate a_signx_gen;

--  b_int(b_width-1 + b_lsb_log_weight downto b_lsb_log_weight) <= B;
--  b_pad_gen : if b_lsb_log_weight > 0 generate
--    b_int(b_lsb_log_weight-1 downto 0) <= (others => '0');
--  end generate b_pad_gen;
--  b_signx_gen: if b_width-1 + b_lsb_log_weight <sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+b_lsb_log_weight+a_width+b_width generate
--    b_int(sum_lsb_log_weight+sum_width-1+a_lsb_log_weight+b_lsb_log_weight+a_width+b_width downto b_width + b_lsb_log_weight)<= (others => B(b_width-1));
--  end generate b_signx_gen;


--  sum_int <= a_int+b_int;
----    a_wider_b_in_a_gt_b: if (a_lsb_log_weight+a_width>=b_width+b_lsb_log_weight generate
----      sum_int(a_lsb_log_weight+a_ downto 0) <= a_int+b_int;
----    end generate a_wider_b_in_a_gt_b;
----    b_wider_a_in_a_gt_b: if a_width+a_lsb_log_weight<b_width+b_lsb_log_weight generate
----      sum_int(b_width+b_lsb_log_weight-1 downto 0) <= a_int+b_int;
----    end generate b_wider_a_in_a_gt_b;

--  a_gt_b : if a_lsb_log_weight >= b_lsb_log_weight generate
    
--    sum <= sum_int(sum_width - 1 +(sum_lsb_log_weight-b_lsb_log_weight) downto sum_lsb_log_weight - b_lsb_log_weight);
--  end generate a_gt_b;
--  b_gt_a : if b_lsb_log_weight > a_lsb_log_weight generate
----    sum_int <= a_int+b_int;
--    sum <= sum_int(sum_width - 1 +(sum_lsb_log_weight-a_lsb_log_weight) downto sum_lsb_log_weight - a_lsb_log_weight);
--  end generate b_gt_a;


--                                        --Not sure if a carry will be needed.  For now tie it ground
--  cout <= '0';

--end behav;

-------------------------------------------------------------------------------
-- Part 2 of the velocity verlet update
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity verlet_step2 is

  generic (
    pos_width          : integer := 32;
    pos_lsb_log_weight : integer := 0;
    vel_width          : integer := 32;
    vel_lsb_log_weight : integer := 0;
    acc_width          : integer := 32;
    acc_lsb_log_weight : integer := 0;
    step2_vel_width    : integer := 32;
    step2_vel_lsb_log_weight : integer :=0;

    a_dt_mult_width : integer :=32;
    a_dt_lsb_log_weight : integer :=0;

    dt_width            : integer := 32;
    dt_lsb_log_weight   : integer := 0;
    k_width             : integer := 32;
    k_lsb_log_weight    : integer := 0;
    k_dt_width          : integer := 32;
    k_dt_lsb_log_weight : integer := 0);

  
  port (
    accel_t_dt    : in  std_logic_vector(acc_width-1 downto 0);
    k             : in  std_logic_vector(k_width-1 downto 0);
    vel_t_half_dt : in  std_logic_vector(vel_width-1 downto 0);
    velocity_t_dt : out std_logic_vector(step2_vel_width-1 downto 0);
    clk           : in  std_logic;
    areset_b      : in  std_logic);

end verlet_step2;


architecture struct of verlet_step2 is
  signal a_dt_prod      : std_logic_vector(a_dt_mult_width-1 downto 0);
  signal half_a_dt_prod : std_logic_vector(a_dt_mult_width-1 downto 0);
  signal new_vel        : std_logic_vector(step2_vel_width-1 downto 0);
  use work.verlet_update_comp.all;
  use work.md_common_multiplier.all;
  use work.md_common_add.all;
  
begin  -- struct
--  half_dt<=dt(time_width-1) & dt(time_width-1 downto 1);
  
  mult_a_dt : multiplier generic map (
    A_width            => k_width,
    A_lsb_log_weight   => k_lsb_log_weight,
    B_width            => acc_width,
    B_lsb_log_weight   => acc_lsb_log_weight,
    out_width          => a_dt_mult_width,
    out_lsb_log_weight => a_dt_lsb_log_weight)
    port map (
      A        => k,
      B        => accel_t_dt,
      product  => a_dt_prod,
      clk      => clk,
      areset_b => areset_b);
  half_a_dt_prod <= a_dt_prod(a_dt_mult_width-1)&a_dt_prod(a_dt_mult_width-1 downto 1);

  add_new_v : adder generic map (
    A_width            => vel_width,
    A_lsb_log_weight   => vel_lsb_log_weight,
    B_width            => a_dt_mult_width,
    B_lsb_log_weight   => a_dt_lsb_log_weight,
    sum_width          => step2_vel_width,
    sum_lsb_log_weight => step2_vel_lsb_log_weight)
    port map (
      A   => vel_t_half_dt,
      B   => half_a_dt_prod,
      sum => new_vel);

  velocity_t_dt <= new_vel;

  
end struct;
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity data_reg is

  generic (
    width : integer := 16);

  port (
    D        : in  std_logic_vector(width-1 downto 0);
    Q        : out std_logic_vector(width-1 downto 0);
    clk      : in  std_logic;
    enable   : in  std_logic;           -- enable signal
    areset_b : in  std_logic);

end data_reg;


architecture behav of data_reg is
  signal Q_internal : std_logic_vector(width-1 downto 0);
begin  -- behav

                                        -- purpose: Register with asynchronous reset
                                        -- type   : sequential
                                        -- inputs : clk, reset, D, enable, reset, shiftr
                                        -- outputs: Q
  regular_reg : process (clk, areset_b)
  begin  -- process shiftty
    if areset_b = '0' then              -- asynchronous reset (active low)
      Q_internal <= (others => '0');
    elsif clk'event and clk = '1' then  -- rising clock edge
      if enable = '1' then
        Q_internal <= D;
      else
        Q_internal <= Q_internal;
      end if;
    end if;
  end process regular_reg;
  Q <= Q_internal;
end behav;
