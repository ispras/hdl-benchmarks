-------------------------------------------------------------------------------
-- Components needed for the verlet update
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

package verlet_update_comp is

  
--  component multiplier is
    
--    generic (
--      A_width            : integer := 16;
--      A_lsb_log_weight   : integer := 0;
--      B_width            : integer := 16;
--      B_lsb_log_weight   : integer := 0;
--      out_width          : integer := 32;
--      out_lsb_log_weight : integer := 0
--      );

--    port (
--      A        : in  std_logic_vector(A_width-1 downto 0);
--      B        : in  std_logic_vector(B_width-1 downto 0);
--      product  : out std_logic_vector(out_width-1 downto 0);
--      clk      : in  std_logic;
--      areset_b : in  std_logic);

--  end component;

  component adder_3in is
    
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

  end component;


--  component adder is
    
--    generic (
--      a_width            : integer := 16;
--      a_lsb_log_weight   : integer := 0;
--      b_width            : integer := 16;
--      b_lsb_log_weight   : integer := 0;
--      sum_width          : integer := 16;
--      sum_lsb_log_weight : integer := 16);

--    port (
--      A    : in  std_logic_vector(a_width-1 downto 0);
--      B    : in  std_logic_vector(b_width-1 downto 0);
--      sum  : out std_logic_vector(sum_width-1 downto 0);
--      cout : out std_logic);

--  end component;

  component verlet_step1 is

    generic (
      pos_width          : integer := 32;
      pos_lsb_log_weight : integer := 0;
      vel_width          : integer := 32;
      vel_lsb_log_weight : integer := 0;
      step2_vel_width : integer := 32;
      step2_vel_lsb_log_weight : integer :=0;
      acc_width          : integer := 32;
      acc_lsb_log_weight : integer := 0;
    a_dt2_mult_width : integer :=32;
    a_dt2_lsb_log_weight : integer :=0;

      dt_width            : integer := 32;
      dt_lsb_log_weight   : integer := 0;
      k_width             : integer := 32;
      k_lsb_log_weight    : integer := 0;
      k_dt_width          : integer := 32;
      k_dt_lsb_log_weight : integer := 0;
      
      a_dt_mult_width : integer :=32;
      a_dt_lsb_log_weight : integer :=0;
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

  end component;


  component verlet_step2 is

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
      k_dt_lsb_log_weight : integer := 0

      );

    
    port (
      accel_t_dt    : in  std_logic_vector(acc_width-1 downto 0);
      k             : in  std_logic_vector(k_width-1 downto 0);
      vel_t_half_dt : in  std_logic_vector(vel_width-1 downto 0);
      velocity_t_dt : out std_logic_vector(step2_vel_width-1 downto 0);
      clk           : in  std_logic;
      areset_b      : in  std_logic);

  end component;
  component data_reg is
    generic (
      width : integer := 16);
    port (
      D        : in  std_logic_vector(width-1 downto 0);
      Q        : out std_logic_vector(width-1 downto 0);
      clk      : in  std_logic;
      enable   : in  std_logic;         -- enable signal
      areset_b : in  std_logic);

  end component;


  component velocity_verlet_combined is
    
    generic (
      pos_width          : integer := 32;
      pos_lsb_log_weight : integer := 0;
      vel_width          : integer := 32;
      vel_lsb_log_weight : integer := 0;
      acc_width          : integer := 32;
      acc_lsb_log_weight : integer := 0;
    a_dt2_mult_width : integer :=32;
    a_dt2_lsb_log_weight : integer :=0;

      dt_width            : integer := 32;
      dt_lsb_log_weight   : integer := 0;
      k_width             : integer := 32;
      k_lsb_log_weight    : integer := 0;
      k_dt_width          : integer := 32;
      k_dt_lsb_log_weight : integer := 0;
    step2_vel_width : integer := 32;
    step2_vel_lsb_log_weight : integer :=0;

    a_dt_mult_width : integer :=32;
    a_dt_lsb_log_weight : integer :=0;
    v_dt_mult_width : integer :=32;
    v_dt_lsb_log_weight : integer :=32

      );

    port (
      position_t          : in  std_logic_vector(pos_width-1 downto 0);
      vel_t_minus_half_dt : in  std_logic_vector(vel_width-1 downto 0);
      accel_t             : in  std_logic_vector(acc_width-1 downto 0);
--    accel_t_dt    : in  std_logic_vector(acc_width-1 downto 0);
      position_t_dt       : out std_logic_vector(pos_width-1 downto 0);
      vel_t_plus_half_dt  : out std_logic_vector(vel_width-1 downto 0);
      dt                  : in  std_logic_vector(dt_width-1 downto 0);
      k_dt                : in  std_logic_vector(k_dt_width-1 downto 0);
      k                   : in  std_logic_vector(k_width-1 downto 0);
      clk                 : in  std_logic;
      areset_b            : in  std_logic
      );

  end component;


  component verlet_control is
    
    port (
      clk           : in  std_logic;
      areset_b      : in  std_logic;
      start         : in  std_logic;
      pass_complete : out std_logic;

      pos_select        : out std_logic;
      pos_req           : out std_logic;
      vel_select        : out std_logic;
      vel_req           : out std_logic;
      acc_select        : out std_logic;
      acc_req           : out std_logic;
      reads_done        : in  std_logic;
      read_ack          : in  std_logic;
      write_ack         : in  std_logic;
      read_req          : out std_logic;
      write_req         : out std_logic;
      read_inc          : out std_logic;
      write_inc         : out std_logic;
      write_idx_clear_b : out std_logic;
      read_idx_clear_b  : out std_logic;
      write_start       : in  std_logic;
      writes_done       : in  std_logic);

  end component;


  component verlet_control_continuous is port (
    clk           : in  std_logic;
    areset_b      : in  std_logic;
    start         : in  std_logic;
    pass_complete : in  std_logic;
    vu_idle       : out std_logic;

    acc_select       : out std_logic;
    pos_select       : out std_logic;
    prev_pos_select  : out std_logic;
    vel_minus_select : out std_logic;
    vel_plus_select  : out std_logic;

    acc_write_req          : in  std_logic;
    acc_write_ack          : out std_logic;
    pos_write_req_to_PA2   : out std_logic;
    pos_write_ack_from_PA2 : in  std_logic;
    pos_read_req_to_PA1    : out std_logic;
    pos_read_ack_to_PA1    : in  std_logic;

    vel_write_req_to_mem   : out std_logic;
    vel_write_ack_from_mem : in  std_logic;

    vel_read_req_to_mem   : out std_logic;
    vel_read_ack_from_mem : in  std_logic;

    pos_write_req_to_PA1 : out std_logic;
    pos_write_ack_to_PA1 : in  std_logic;
    pos_read_req_to_PA2  : out std_logic;
    pos_read_ack_to_PA2  : in  std_logic;
    begin_copy           : in  std_logic;
    copy_done            : out std_logic);
  end component;

  

end verlet_update_comp;


library ieee;
use ieee.std_logic_1164.all;

package gen_mult_package is

  component MD_gen_mult is
    generic (INTEGER_INPUT_SIZE                  : integer := 32;
             INTEGER_OUTPUT_SIZE                 : integer := 32;
             NUM_BITS_TO_RIGHT_OF_lsb_log_weight : natural := 8);
    port
      (
        a_in, b_in : in std_logic_vector(INTEGER_INPUT_SIZE-1
                                         downto 0);

        output   : out std_logic_vector(INTEGER_OUTPUT_SIZE-1
                                          downto 0);
        overflow : out std_logic
        );
  end component;



end gen_mult_package;
