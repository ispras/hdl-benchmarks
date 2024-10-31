library ieee;
use ieee.std_logic_1164.all;

package verlet_update_top_pkg is
  component velocity_verlet_top is
    
    generic (
      pos_width  : integer := 32;
      vel_width  : integer := 32;
      acc_width  : integer := 32;
      time_width : integer := 32;
      idx_width  : integer := 16
      );

    port (
      start    : in  std_logic;
      complete : out std_logic;

      --The control signals to retrieve these values haven't been included
      --because  that portion hasn't been decided?
      --Presumably will be something of the folling form
      read_particle_num  : out std_logic_vector(idx_width-1 downto 0);
      read_req           : out std_logic;
      pos_read_req       : out std_logic;
      acc_read_req       : out std_logic;
      vel_read_req       : out std_logic;
      read_ack           : in  std_logic;
      write_particle_num : out std_logic_vector(idx_width-1 downto 0);
      write_req          : out std_logic;
      write_ack          : in  std_logic;

      position_t          : in  std_logic_vector(pos_width-1 downto 0);
      vel_t_minus_half_dt : in  std_logic_vector(vel_width-1 downto 0);
      accel_t             : in  std_logic_vector(acc_width-1 downto 0);
      position_t_dt       : out std_logic_vector(pos_width-1 downto 0);
      vel_t_plus_half_dt  : out std_logic_vector(vel_width-1 downto 0);

      --dt is needed if the calculation isn't normalized
      dt       : in std_logic_vector(time_width-1 downto 0);
      dt2      : in std_logic_vector(time_width-1 downto 0);
      --
      clk      : in std_logic;
      areset_b : in std_logic
      );

  end component;



  component velocity_verlet_top_continuous_old is
    
    generic (
      pos_width  : integer := 32;
      vel_width  : integer := 32;
      acc_width  : integer := 32;
      time_width : integer := 32;
      idx_width  : integer := 16
      );

    port (
      start         : in  std_logic;
      pass_complete : out std_logic;

      --The interface to the AU block which passes along the latest acceleration

      acc_write_req     : in  std_logic;
      acc_write_ack     : out std_logic;
      curr_particle_num : in  std_logic_vector(idx_width -1 downto 0);
      --All 3 dimensions at once
      accel_t_x         : in  std_logic_vector(acc_width-1 downto 0);
      accel_t_y         : in  std_logic_vector(acc_width-1 downto 0);
      accel_t_z         : in  std_logic_vector(acc_width-1 downto 0);



      particle_num_to_mem : out std_logic_vector(idx_width -1 downto 0);

      --Interface for writing updated values to memory
      vel_t_plus_half_dt_x   : out std_logic_vector(vel_width-1 downto 0);
      vel_t_plus_half_dt_y   : out std_logic_vector(vel_width-1 downto 0);
      vel_t_plus_half_dt_z   : out std_logic_vector(vel_width-1 downto 0);
      position_t_dt_x        : out std_logic_vector(pos_width-1 downto 0);
      position_t_dt_y        : out std_logic_vector(pos_width-1 downto 0);
      position_t_dt_z        : out std_logic_vector(pos_width-1 downto 0);
      vel_write_req_to_mem   : out std_logic;
      vel_write_ack_from_mem : in  std_logic;
      pos_write_req_to_PA2   : out std_logic;
      pos_write_ack_from_PA2 : in  std_logic;

      --Interface for reading previous values from memory
      vel_t_minus_half_dt_x : in  std_logic_vector(vel_width-1 downto 0);
      vel_t_minus_half_dt_y : in  std_logic_vector(vel_width-1 downto 0);
      vel_t_minus_half_dt_z : in  std_logic_vector(vel_width-1 downto 0);
      vel_read_req_to_mem   : out std_logic;
      vel_read_ack_from_mem : in  std_logic;

      --Interface when performing the copy+add to the new memory
      pos_read_req_to_PA2  : out std_logic;
      pos_read_ack_to_PA2  : in  std_logic;
      pos_read_req_to_PA1  : out std_logic;
      pos_read_ack_to_PA1  : in  std_logic;
      pos_write_req_to_PA1 : out std_logic;
      pos_write_ack_to_PA1 : in  std_logic;
      position_t_x         : in  std_logic_vector(pos_width-1 downto 0);
      position_t_y         : in  std_logic_vector(pos_width-1 downto 0);
      position_t_z         : in  std_logic_vector(pos_width-1 downto 0);

      --these signals are needed in case we have to perform the add
      position_t_dt_x_PA1 : out std_logic_vector(pos_width-1 downto 0);
      position_t_dt_x_PA2 : in  std_logic_vector(pos_width-1 downto 0);
      position_t_dt_y_PA1 : out std_logic_vector(pos_width-1 downto 0);
      position_t_dt_y_PA2 : in  std_logic_vector(pos_width-1 downto 0);
      position_t_dt_z_PA1 : out std_logic_vector(pos_width-1 downto 0);
      position_t_dt_z_PA2 : in  std_logic_vector(pos_width-1 downto 0);


      -- This requires a massive amount of interconnect since I don't have tri-state buses.  That means "width" bits in each
      -- direction of transfer for each dimension


      --dt is needed if the calculation isn't normalized
      dt  : in std_logic_vector(time_width-1 downto 0);
      dt2 : in std_logic_vector(time_width-1 downto 0);

      -- Control Signals
      clk      : in std_logic;
      areset_b : in std_logic
      );
  end component;


  component velocity_verlet_top_continuous
    
    generic (
      pos_width          : integer := 32;
      pos_lsb_log_weight : integer := 0;
      vel_width          : integer := 32;
      vel_lsb_log_weight : integer := 0;
      acc_width          : integer := 32;
      acc_lsb_log_weight : integer := 0;

    dt_a_width            : integer := 32;
    dt_a_lsb_log_weight   : integer := 0;
    dt_v_width             : integer := 32;
    dt_v_lsb_log_weight    : integer := 0;
    dt2_a_width          : integer := 32;
    dt2_a_lsb_log_weight : integer := 0;
    step2_vel_width : integer := 32;
    step2_vel_lsb_log_weight : integer :=0;

    a_dt_mult_width : integer :=32;
    a_dt_lsb_log_weight : integer :=0;
    v_dt_mult_width : integer :=32;
    v_dt_lsb_log_weight : integer :=32;
    a_dt2_mult_width : integer :=32;
    a_dt2_lsb_log_weight : integer :=0;



      idx_width : integer := 16;

      --The following are no longer used but have been left in to minimize
      --the number of changes
      time_width                          : integer := 32;
      NUM_BITS_TO_RIGHT_OF_DECIMAL : natural := 8
      );

    port (
      start         : in  std_logic;
      pass_complete : out std_logic;

      --The interface to the AU block which passes along the latest acceleration

      acc_write_req     : in  std_logic;
      acc_write_ack     : out std_logic;
      curr_particle_num : in  std_logic_vector(idx_width -1 downto 0);
      --All 3 dimensions at once
      accel_t_x         : in  std_logic_vector(acc_width-1 downto 0);
      accel_t_y         : in  std_logic_vector(acc_width-1 downto 0);
      accel_t_z         : in  std_logic_vector(acc_width-1 downto 0);

      particle_pos_num_to_mem : out std_logic_vector(idx_width -1 downto 0);
      particle_vel_num_to_mem : out std_logic_vector(idx_width -1 downto 0);

      --Interface for writing updated values to memory
      vel_t_plus_half_dt_x   : out std_logic_vector(vel_width-1 downto 0);
      vel_t_plus_half_dt_y   : out std_logic_vector(vel_width-1 downto 0);
      vel_t_plus_half_dt_z   : out std_logic_vector(vel_width-1 downto 0);
      vel_write_req_to_mem   : out std_logic;
      vel_write_ack_from_mem : in  std_logic;

      position_t_dt_x        : out std_logic_vector(pos_width-1 downto 0);
      position_t_dt_y        : out std_logic_vector(pos_width-1 downto 0);
      position_t_dt_z        : out std_logic_vector(pos_width-1 downto 0);
      pos_write_req_to_mem   : out std_logic;
      pos_write_ack_from_mem : in  std_logic;

      --Interface for reading previous values from memory
      vel_t_minus_half_dt_x : in  std_logic_vector(vel_width-1 downto 0);
      vel_t_minus_half_dt_y : in  std_logic_vector(vel_width-1 downto 0);
      vel_t_minus_half_dt_z : in  std_logic_vector(vel_width-1 downto 0);
      vel_read_req_to_mem   : out std_logic;
      vel_read_ack_from_mem : in  std_logic;

      position_t_dt_x_in  : in  std_logic_vector(pos_width-1 downto 0);
      position_t_dt_y_in  : in  std_logic_vector(pos_width-1 downto 0);
      position_t_dt_z_in  : in  std_logic_vector(pos_width-1 downto 0);
      pos_read_req_to_mem : out std_logic;
      pos_read_ack_to_mem : in  std_logic;

      --Interface to use correct position array bank
      position_bank : out std_logic;

      --dt is needed if the calculation isn't normalized
    dt_a   : in std_logic_vector(dt_a_width-1 downto 0);
    dt_v : in std_logic_vector(dt_v_width-1 downto 0);
    dt2_a    : in std_logic_vector(dt2_a_width-1 downto 0);

      -- Control Signals
      clk      : in std_logic;
      areset_b : in std_logic
      );
  end component;

end verlet_update_top_pkg;
