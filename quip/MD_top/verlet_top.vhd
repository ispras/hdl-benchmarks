-------------------------------------------------------------------------------
--
-- Velocity Verlet Update Module
--   by Ian Kuon Feb 13, 2003
--   Additions made throughout Feb and March
--   Two versions reside in this file
--      1) One version for the inital specification with the verlet doing
--      everything in one pass
--      2) The current version is designed to operate directly on the primary
--      data path.
--      I have included both versions should we ever want to switch to the old
--      one, it would be good to at least get it into CVS
--   Performs the velocity verlet update on a set of particles
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity velocity_verlet_combined is
  
  generic (
    pos_width          : integer := 32;
    pos_lsb_log_weight : integer := 0;
    vel_width          : integer := 32;
    vel_lsb_log_weight : integer := 0;
    acc_width          : integer := 32;
    acc_lsb_log_weight : integer := 0;

    dt_width            : integer := 32;
    dt_lsb_log_weight   : integer := 0;
    k_width             : integer := 32;
    k_lsb_log_weight    : integer := 0;
    k_dt_width          : integer := 32;
    k_dt_lsb_log_weight : integer := 0;
    a_dt2_mult_width : integer :=32;
    a_dt2_lsb_log_weight : integer :=0;


    step2_vel_width : integer := 32;
    step2_vel_lsb_log_weight : integer :=0;

    a_dt_mult_width : integer :=32;
    a_dt_lsb_log_weight : integer :=0;
    v_dt_mult_width : integer :=32;
    v_dt_lsb_log_weight : integer :=32;



    --The following have been temporarily left in 
    time_width                          : integer := 64;
    NUM_BITS_TO_RIGHT_OF_lsb_log_weight : integer := 8);

  port (
    position_t          : in  std_logic_vector(pos_width-1 downto 0);
    vel_t_minus_half_dt : in  std_logic_vector(vel_width-1 downto 0);
    accel_t             : in  std_logic_vector(acc_width-1 downto 0);
--    accel_t_dt    : in  std_logic_vector(acc_width-1 downto 0);
    position_t_dt       : out std_logic_vector(pos_width-1 downto 0);
    vel_t_plus_half_dt  : out std_logic_vector(vel_width-1 downto 0);
    dt                  : in  std_logic_vector(dt_width-1 downto 0);
    k                   : in  std_logic_vector(k_width-1 downto 0);
    k_dt                : in  std_logic_vector(k_dt_width-1 downto 0);
    clk                 : in  std_logic;
    areset_b            : in  std_logic
    );

end velocity_verlet_combined;

architecture struct of velocity_verlet_combined is
  use work.verlet_update_comp.all;
  signal vel_t_half_dt          : std_logic_vector(vel_width-1 downto 0);
  signal position_t_dt_noQ      : std_logic_vector(pos_width-1 downto 0);
  signal position_t_Q           : std_logic_vector(pos_width-1 downto 0);
  signal vel_t_plus_half_dt_noQ : std_logic_vector(vel_width-1 downto 0);
  signal vel_t_minus_half_dt_Q  : std_logic_vector(vel_width-1 downto 0);
  signal velocity_t             : std_logic_vector(step2_vel_width-1 downto 0);
  signal accel_t_Q              : std_logic_vector(acc_width-1 downto 0);
  signal enable                 : std_logic;
  
begin  -- struct
  enable <= '1';

  --With the current design the signals are flopped outside of this block
  --Thus there is no need to flop inside since that just increases latency but
  --I'm not interested in pipelining this portion
  --In case I later want the flops again for minimum number of changes I"ll
--just assign the signals here instead of goinging through flip flops
  position_t_Q          <= position_t;
  vel_t_minus_half_dt_Q <= vel_t_minus_half_dt;
  accel_t_Q             <= accel_t;
  --Outputs
  position_t_dt         <= position_t_dt_noQ;
  vel_t_plus_half_dt    <= vel_t_plus_half_dt_noQ;

  verlet_first_part : verlet_step1 generic map (
    pos_width          => pos_width,
    pos_lsb_log_weight => pos_lsb_log_weight,
    vel_width          => vel_width,
    vel_lsb_log_weight => vel_lsb_log_weight,
    acc_width          => acc_width,
    acc_lsb_log_weight => acc_lsb_log_weight,

    dt_width            => dt_width,
    dt_lsb_log_weight   => dt_lsb_log_weight,
    k_width             => k_width,
    k_lsb_log_weight    => k_lsb_log_weight,
    k_dt_width          => k_dt_width,
    k_dt_lsb_log_weight => k_dt_lsb_log_weight,

    step2_vel_width => step2_vel_width,
    step2_vel_lsb_log_weight => step2_vel_lsb_log_weight,
    a_dt2_mult_width =>a_dt2_mult_width,
    a_dt2_lsb_log_weight => a_dt2_lsb_log_weight,


    a_dt_mult_width =>a_dt_mult_width,
    a_dt_lsb_log_weight => a_dt_lsb_log_weight,
    v_dt_mult_width => v_dt_mult_width,
    v_dt_lsb_log_weight => v_dt_lsb_log_weight



    )
    port map (
      position_t    => position_t_Q,
      velocity_t    => velocity_t,
      accel_t       => accel_t_Q,
      dt            => dt,
      k_dt          => k_dt,
      k             => k,
      vel_t_half_dt => vel_t_plus_half_dt_noQ,
      position_t_dt => position_t_dt_noQ,
      clk           => clk,
      areset_b      => areset_b);

  verlet_second_part : verlet_step2 generic map (
    pos_width          => pos_width,
    pos_lsb_log_weight => pos_lsb_log_weight,
    vel_width          => vel_width,
    vel_lsb_log_weight => vel_lsb_log_weight,
    acc_width          => acc_width,
    acc_lsb_log_weight => acc_lsb_log_weight,

    dt_width            => dt_width,
    dt_lsb_log_weight   => dt_lsb_log_weight,
    k_width             => k_width,
    k_lsb_log_weight    => k_lsb_log_weight,
    k_dt_width          => k_dt_width,
    k_dt_lsb_log_weight => k_dt_lsb_log_weight,
    step2_vel_width => step2_vel_width,
    step2_vel_lsb_log_weight => step2_vel_lsb_log_weight,

    a_dt_lsb_log_weight => a_dt_lsb_log_weight,
    a_dt_mult_width => a_dt_mult_width
    
    )
    port map (
      accel_t_dt    => accel_t_Q,
      k             => k,
      vel_t_half_dt => vel_t_minus_half_dt_Q,
      velocity_t_dt => velocity_t,
      clk           => clk,
      areset_b      => areset_b);

--Note:
-- In software floating point systems there is concern about ensuring that
-- the boundaries are observed and the positions are updated using the periodic
-- boundary conditions.  In this hardware implementation the boundary
-- conditions are implemented for free and one never has to worry explicitly
-- about it.  The fixed point numbers roll over automatically provided we
-- assume that the position vector spans the full range of the box of molecules
-- being analyzed.
--

end struct;

-------------------------------------------------------------------------------
-- Velocity Verlet Module to run in continuous operation mode
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity velocity_verlet_top_continuous is
  
  generic (

    pos_width          : integer := 32;
    pos_lsb_log_weight : integer := -62;
    vel_width          : integer := 44;
    vel_lsb_log_weight : integer := -13;
    acc_width          : integer := 43;
    acc_lsb_log_weight : integer := -12;

    dt_a_width            : integer := 1;
    dt_a_lsb_log_weight   : integer := 0;
    dt_v_width             : integer := 11;
    dt_v_lsb_log_weight    : integer := -60;
    dt2_a_width          : integer := 11;
    dt2_a_lsb_log_weight : integer := -60;
 
    a_dt2_mult_width : integer := 43;
    a_dt2_lsb_log_weight : integer :=-62;

    idx_width : integer := 16;
    
    step2_vel_width : integer := 44;
    step2_vel_lsb_log_weight : integer :=-13;

    a_dt_mult_width : integer :=43;
    a_dt_lsb_log_weight : integer :=-12;
    v_dt_mult_width : integer :=43;
    v_dt_lsb_log_weight : integer :=-62;



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
    position_t_dt_x        : out std_logic_vector(pos_width-1 downto 0);
    position_t_dt_y        : out std_logic_vector(pos_width-1 downto 0);
    position_t_dt_z        : out std_logic_vector(pos_width-1 downto 0);
    vel_write_req_to_mem   : out std_logic;
    vel_write_ack_from_mem : in  std_logic;
--    pos_write_req_to_PA2    : out std_logic;
--    pos_write_ack_from_PA2  : in  std_logic;
    pos_write_req_to_mem   : out std_logic;
    pos_write_ack_from_mem : in  std_logic;

    --Interface for reading previous values from memory
    vel_t_minus_half_dt_x : in  std_logic_vector(vel_width-1 downto 0);
    vel_t_minus_half_dt_y : in  std_logic_vector(vel_width-1 downto 0);
    vel_t_minus_half_dt_z : in  std_logic_vector(vel_width-1 downto 0);
    vel_read_req_to_mem   : out std_logic;
    vel_read_ack_from_mem : in  std_logic;

    --Interface when performing the copy+add to the new memory
--    pos_read_req_to_PA2  : out std_logic;
--    pos_read_ack_to_PA2  : in  std_logic;
    pos_read_req_to_mem : out std_logic;
    pos_read_ack_to_mem : in  std_logic;
--    pos_write_req_to_PA1 : out std_logic;
--    pos_write_ack_to_PA1 : in  std_logic;

    --These are actually position_t. TODO next rev change this

    position_t_dt_x_in : in std_logic_vector(pos_width-1 downto 0);
    position_t_dt_y_in : in std_logic_vector(pos_width-1 downto 0);
    position_t_dt_z_in : in std_logic_vector(pos_width-1 downto 0);

    --these signals are needed in case we have to perform the add
--    position_t_dt_x_PA1         : out std_logic_vector(pos_width-1 downto 0);
--    position_t_dt_x_PA2 : in  std_logic_vector(pos_width-1 downto 0);
--    position_t_dt_y_PA1         : out std_logic_vector(pos_width-1 downto 0);
--    position_t_dt_y_PA2 : in  std_logic_vector(pos_width-1 downto 0);
--    position_t_dt_z_PA1         : out std_logic_vector(pos_width-1 downto 0);
--    position_t_dt_z_PA2 : in  std_logic_vector(pos_width-1 downto 0);

    position_bank : out std_logic;

    --dt is needed if the calculation isn't normalized
    dt_a   : in std_logic_vector(dt_a_width-1 downto 0);
    dt_v : in std_logic_vector(dt_v_width-1 downto 0);
    dt2_a    : in std_logic_vector(dt2_a_width-1 downto 0);

    -- Control Signals
    clk      : in std_logic;
    areset_b : in std_logic
    );

end velocity_verlet_top_continuous;

architecture struct of velocity_verlet_top_continuous is
  use work.verlet_update_comp.all;

  signal position_t_x_Q            : std_logic_vector(pos_width-1 downto 0);
  signal vel_t_minus_half_dt_x_Q   : std_logic_vector(vel_width-1 downto 0);
  signal accel_t_x_Q               : std_logic_vector(acc_width-1 downto 0);
  signal position_t_dt_x_toQ       : std_logic_vector(pos_width-1 downto 0);
  signal vel_t_plus_half_dt_x_toQ  : std_logic_vector(vel_width-1 downto 0);
  signal vel_t_plus_half_dt_x_Q    : std_logic_vector(vel_width-1 downto 0);
  signal vel_t_minus_half_dt_x_toQ : std_logic_vector(vel_width-1 downto 0);
  signal position_t_x_toQ          : std_logic_vector(pos_width-1 downto 0);
  signal position_t_dt_x_Q         : std_logic_vector(pos_width-1 downto 0);
  signal position_t_y_Q            : std_logic_vector(pos_width-1 downto 0);
  signal vel_t_minus_half_dt_y_Q   : std_logic_vector(vel_width-1 downto 0);
  signal accel_t_y_Q               : std_logic_vector(acc_width-1 downto 0);
  signal position_t_dt_y_toQ       : std_logic_vector(pos_width-1 downto 0);
  signal vel_t_plus_half_dt_y_toQ  : std_logic_vector(vel_width-1 downto 0);
  signal vel_t_plus_half_dt_y_Q    : std_logic_vector(vel_width-1 downto 0);
  signal vel_t_minus_half_dt_y_toQ : std_logic_vector(vel_width-1 downto 0);
  signal position_t_y_toQ          : std_logic_vector(pos_width-1 downto 0);
  signal position_t_dt_y_Q         : std_logic_vector(pos_width-1 downto 0);
  signal position_t_z_Q            : std_logic_vector(pos_width-1 downto 0);
  signal position_t_z_toQ          : std_logic_vector(pos_width-1 downto 0);
  signal vel_t_minus_half_dt_z_Q   : std_logic_vector(vel_width-1 downto 0);
  signal vel_t_minus_half_dt_z_toQ : std_logic_vector(vel_width-1 downto 0);
  signal accel_t_z_Q               : std_logic_vector(acc_width-1 downto 0);
  signal vel_t_plus_half_dt_z_toQ  : std_logic_vector(vel_width-1 downto 0);
  signal vel_t_plus_half_dt_z_Q    : std_logic_vector(vel_width-1 downto 0);
  signal position_t_dt_z_toQ       : std_logic_vector(pos_width-1 downto 0);
  signal position_t_dt_z_Q         : std_logic_vector(pos_width-1 downto 0);
  signal curr_particle_num_Q       : std_logic_vector(idx_width-1 downto 0);
  signal vel_plus_select           : std_logic;
  signal vel_minus_select          : std_logic;
  signal clr_pos_b                 : std_logic;
  signal prev_pos_select           : std_logic;
  signal acc_select                : std_logic;
  signal pos_select                : std_logic;

  signal begin_copy : std_logic;
  signal copy_done  : std_logic;
  signal zeros      : std_logic_vector(pos_width-1 downto 0);

  signal pos_write_req_to_PA2, pos_write_req_to_PA1 : std_logic;
  signal pos_write_ack_to_PA1                       : std_logic;
  signal pos_write_ack_from_PA2                     : std_logic;
  signal pos_read_ack_to_PA2                        : std_logic;
  signal pos_read_ack_to_PA1                        : std_logic;
  signal pos_read_req_to_PA2                        : std_logic;
  signal pos_read_req_to_PA1                        : std_logic;

  
begin  -- struct
  zeros <= (others => '0');

  --Possibly for later flexibility I don't connect the flops directly to the input signal names
  --Possibly just silly!

  particle_pos_num_to_mem   <= curr_particle_num_Q;
  particle_vel_num_to_mem   <= curr_particle_num_Q;
  position_t_z_toQ          <= position_t_dt_z_in;  --todo change this
  position_t_dt_z           <= position_t_dt_z_Q;
  vel_t_minus_half_dt_z_toQ <= vel_t_minus_half_dt_z;
  vel_t_plus_half_dt_z      <= vel_t_plus_half_dt_z_Q;
  position_t_y_toQ          <= position_t_dt_y_in;  --todo change this
  position_t_dt_y           <= position_t_dt_y_Q;
  vel_t_minus_half_dt_y_toQ <= vel_t_minus_half_dt_y;
  vel_t_plus_half_dt_y      <= vel_t_plus_half_dt_y_Q;
  position_t_x_toQ          <= position_t_dt_x_in;  --todo change this
  position_t_dt_x           <= position_t_dt_x_Q;
  vel_t_minus_half_dt_x_toQ <= vel_t_minus_half_dt_x;
  vel_t_plus_half_dt_x      <= vel_t_plus_half_dt_x_Q;

--The actual position will be read each time.  There is no sense waiting until
--the end.  I have to access the memory to get the new velocity each new
--particle so I might as well access the position as well.
--Perhaps the memory controller could then switch banks.

--This is the actual compute block that determines the verlet
  verlet_calculator_x : velocity_verlet_combined generic map (
    pos_width          => pos_width,
    pos_lsb_log_weight => pos_lsb_log_weight,
    vel_width          => vel_width,
    vel_lsb_log_weight => vel_lsb_log_weight,
    acc_width          => acc_width,
    acc_lsb_log_weight => acc_lsb_log_weight,

    dt_width            => dt_v_width,
    dt_lsb_log_weight   => dt_v_lsb_log_weight,
    k_width             => dt_a_width,
    k_lsb_log_weight    => dt_a_lsb_log_weight,
    k_dt_width          => dt2_a_width,
    k_dt_lsb_log_weight => dt2_a_lsb_log_weight,
    a_dt2_mult_width => a_dt2_mult_width,
    a_dt2_lsb_log_weight => a_dt2_lsb_log_weight,

    step2_vel_width => step2_vel_width,
    step2_vel_lsb_log_weight => step2_vel_lsb_log_weight,

    a_dt_mult_width => a_dt_mult_width,
    a_dt_lsb_log_weight => a_dt_lsb_log_weight,
    v_dt_mult_width => v_dt_mult_width,
    v_dt_lsb_log_weight => v_dt_lsb_log_weight

    )
    port map (
      position_t          => position_t_x_Q,
      vel_t_minus_half_dt => vel_t_minus_half_dt_x_Q,
      accel_t             => accel_t_x_Q,
      position_t_dt       => position_t_dt_x_toQ,
      vel_t_plus_half_dt  => vel_t_plus_half_dt_x_toQ,
      dt                  => dt_v,
      k_dt                => dt2_a,
      k                   => dt_a,
      clk                 => clk,
      areset_b            => areset_b);      

  verlet_calculator_y : velocity_verlet_combined generic map (
    pos_width          => pos_width,
    pos_lsb_log_weight => pos_lsb_log_weight,
    vel_width          => vel_width,
    vel_lsb_log_weight => vel_lsb_log_weight,
    acc_width          => acc_width,
    acc_lsb_log_weight => acc_lsb_log_weight,
    a_dt2_mult_width => a_dt2_mult_width,
    a_dt2_lsb_log_weight => a_dt2_lsb_log_weight,

    dt_width            => dt_v_width,
    dt_lsb_log_weight   => dt_v_lsb_log_weight,
    k_width             => dt_a_width,
    k_lsb_log_weight    => dt_a_lsb_log_weight,
    k_dt_width          => dt2_a_width,
    k_dt_lsb_log_weight => dt2_a_lsb_log_weight,

    step2_vel_width => step2_vel_width,
    step2_vel_lsb_log_weight => step2_vel_lsb_log_weight,

    a_dt_mult_width => a_dt_mult_width,
    a_dt_lsb_log_weight => a_dt_lsb_log_weight,
    v_dt_mult_width => v_dt_mult_width,
    v_dt_lsb_log_weight => v_dt_lsb_log_weight
    )
    port map (
      position_t          => position_t_y_Q,
      vel_t_minus_half_dt => vel_t_minus_half_dt_y_Q,
      accel_t             => accel_t_y_Q,
      position_t_dt       => position_t_dt_y_toQ,
      vel_t_plus_half_dt  => vel_t_plus_half_dt_y_toQ,
      dt                  => dt_v,
      k_dt                   => dt2_a,
      k                => dt_a,
      clk                 => clk,
      areset_b            => areset_b);      

  verlet_calculator_z : velocity_verlet_combined generic map (
    pos_width          => pos_width,
    pos_lsb_log_weight => pos_lsb_log_weight,
    vel_width          => vel_width,
    vel_lsb_log_weight => vel_lsb_log_weight,
    acc_width          => acc_width,
    acc_lsb_log_weight => acc_lsb_log_weight,
    a_dt2_mult_width => a_dt2_mult_width,
    a_dt2_lsb_log_weight => a_dt2_lsb_log_weight,

    dt_width            => dt_v_width,
    dt_lsb_log_weight   => dt_v_lsb_log_weight,
    k_width             => dt_a_width,
    k_lsb_log_weight    => dt_a_lsb_log_weight,
    k_dt_width          => dt2_a_width,
    k_dt_lsb_log_weight => dt2_a_lsb_log_weight,

    step2_vel_width => step2_vel_width,
    step2_vel_lsb_log_weight => step2_vel_lsb_log_weight,

    a_dt_mult_width => a_dt_mult_width,
    a_dt_lsb_log_weight => a_dt_lsb_log_weight,
    v_dt_mult_width => v_dt_mult_width,
    v_dt_lsb_log_weight => v_dt_lsb_log_weight
    )
    port map (
      position_t          => position_t_z_Q,
      vel_t_minus_half_dt => vel_t_minus_half_dt_z_Q,
      accel_t             => accel_t_z_Q,
      position_t_dt       => position_t_dt_z_toQ,
      vel_t_plus_half_dt  => vel_t_plus_half_dt_z_toQ,
      dt                  => dt_v,
      k_dt                => dt2_a,
      k                   => dt_a,
      clk                 => clk,
      areset_b            => areset_b);      


  acc_reg_x : data_reg generic map (
    width => acc_width)
    port map (
      D        => accel_t_x,
      Q        => accel_t_x_Q,
      clk      => clk,
      enable   => acc_select,  --When it's acked that means it's safe to store
      areset_b => areset_b);
  acc_reg_y : data_reg generic map (
    width => acc_width)
    port map (
      D        => accel_t_y,
      Q        => accel_t_y_Q,
      clk      => clk,
      enable   => acc_select,  --When it's acked that means it's safe to store
      areset_b => areset_b);
  acc_reg_z : data_reg generic map (
    width => acc_width)
    port map (
      D        => accel_t_z,
      Q        => accel_t_z_Q,
      clk      => clk,
      enable   => acc_select,  --When it's acked that means it's safe to store
      areset_b => areset_b);

  prev_part_reg : data_reg generic map (
    width => idx_width)
    port map (
      D        => curr_particle_num,
      Q        => curr_particle_num_Q,
      clk      => clk,
      enable   => acc_select,  --When it's acked that means it's safe to store
      areset_b => areset_b);


--Only one bank of velocity registers is technically needed but it becomes a hold time issue.  For a first
--pass I'll use two

  vel_reg_x : data_reg generic map (
    width => vel_width)
    port map (
      D        => vel_t_plus_half_dt_x_toQ,
      Q        => vel_t_plus_half_dt_x_Q,
      clk      => clk,
      enable   => vel_plus_select,
      areset_b => areset_b);
  vel_reg_y : data_reg generic map (
    width => vel_width)
    port map (
      D        => vel_t_plus_half_dt_y_toQ,
      Q        => vel_t_plus_half_dt_y_Q,
      clk      => clk,
      enable   => vel_plus_select,
      areset_b => areset_b);
  vel_reg_z : data_reg generic map (
    width => vel_width)
    port map (
      D        => vel_t_plus_half_dt_z_toQ,
      Q        => vel_t_plus_half_dt_z_Q,
      clk      => clk,
      enable   => vel_plus_select,
      areset_b => areset_b);

  vel_reg_t_minus_x : data_reg generic map (
    width => vel_width)
    port map (
      D        => vel_t_minus_half_dt_x_toQ,
      Q        => vel_t_minus_half_dt_x_Q,
      clk      => clk,
      enable   => vel_minus_select,
      areset_b => areset_b);
  vel_reg_t_minus_y : data_reg generic map (
    width => vel_width)
    port map (
      D        => vel_t_minus_half_dt_y_toQ,
      Q        => vel_t_minus_half_dt_y_Q,
      clk      => clk,
      enable   => vel_minus_select,
      areset_b => areset_b);
  vel_reg_t_minus_z : data_reg generic map (
    width => vel_width)
    port map (
      D        => vel_t_minus_half_dt_z_toQ,
      Q        => vel_t_minus_half_dt_z_Q,
      clk      => clk,
      enable   => vel_minus_select,
      areset_b => areset_b);



  clr_pos_b <= areset_b;                -- and  clear_running_pos_b;

  old_pos_x : data_reg generic map (
    width => pos_width)
    port map (
      D        => position_t_x_toQ,
      Q        => position_t_x_Q,
      clk      => clk,
      enable   => prev_pos_select,
      areset_b => clr_pos_b);
  old_pos_y : data_reg generic map (
    width => pos_width)
    port map (
      D        => position_t_y_toQ,
      Q        => position_t_y_Q,
      clk      => clk,
      enable   => prev_pos_select,
      areset_b => clr_pos_b);
  old_pos_z : data_reg generic map (
    width => pos_width)
    port map (
      D        => position_t_z_toQ,
      Q        => position_t_z_Q,
      clk      => clk,
      enable   => prev_pos_select,
      areset_b => clr_pos_b);

  pos_x : data_reg generic map (
    width => pos_width)
    port map (
      D        => position_t_dt_x_toQ,
      Q        => position_t_dt_x_Q,
      clk      => clk,
      enable   => pos_select,
      areset_b => areset_b);
  pos_y : data_reg generic map (
    width => pos_width)
    port map (
      D        => position_t_dt_y_toQ,
      Q        => position_t_dt_y_Q,
      clk      => clk,
      enable   => pos_select,
      areset_b => areset_b);
  pos_z : data_reg generic map (
    width => pos_width)
    port map (
      D        => position_t_dt_z_toQ,
      Q        => position_t_dt_z_Q,
      clk      => clk,
      enable   => pos_select,
      areset_b => areset_b);

--There is the potential I can reuse the verlet adders to do this computation
--

  --This keeps the address (i.e. particle number) that is currently being
  --accessed.  It is basically just a counter.
--  read_address : add_counter generic map (
--    idx_width => idx_width)
--    port map (
--      count    => read_particle_num,
--      overflow => update_done,
--      clr_b    => read_idx_clear_b,
--      clk      => clk,
--      inc      => read_inc);

  verlet_master_controller : verlet_control_continuous port map (
    clk           => clk,
    areset_b      => areset_b,
    start         => start,
    pass_complete => copy_done,
    vu_idle       => pass_complete,

    acc_select       => acc_select,
    pos_select       => pos_select,
    prev_pos_select  => prev_pos_select,
    vel_minus_select => vel_minus_select,
    vel_plus_select  => vel_plus_select,

    acc_write_req          => acc_write_req,
    acc_write_ack          => acc_write_ack,
    pos_write_req_to_PA2   => pos_write_req_to_PA2,
    pos_write_ack_from_PA2 => pos_write_ack_from_PA2,
    pos_read_req_to_PA1    => pos_read_req_to_PA1,
    pos_read_ack_to_PA1    => pos_read_ack_to_PA1,

    vel_write_req_to_mem   => vel_write_req_to_mem,
    vel_write_ack_from_mem => vel_write_ack_from_mem,

    vel_read_req_to_mem   => vel_read_req_to_mem,
    vel_read_ack_from_mem => vel_read_ack_from_mem,

    pos_write_req_to_PA1 => pos_write_req_to_PA1,
    pos_write_ack_to_PA1 => pos_write_ack_to_PA1,
    pos_read_req_to_PA2  => pos_read_req_to_PA2,
    pos_read_ack_to_PA2  => pos_read_ack_to_PA2,
    begin_copy           => begin_copy,
    copy_done            => copy_done);


  --The controller was designed to allow writing to two different bankts of
  --memory with separaet control lines for each one.  To simplify interconnect
  -- though this scheme was abandoned.  For now I will keep this design in the
  -- controller and just add some glue logic to adapt to this interface
  position_bank          <= pos_read_req_to_PA2 or pos_write_req_to_PA2;
  pos_read_req_to_mem    <= pos_read_req_to_PA2 or pos_read_req_to_PA1;
  pos_write_req_to_mem   <= pos_write_req_to_PA2 or pos_write_req_to_PA1;
  pos_write_ack_to_PA1   <= pos_write_ack_from_mem;
  pos_write_ack_from_PA2 <= pos_write_ack_from_mem;
  pos_read_ack_to_PA2    <= pos_read_ack_to_mem;
  pos_read_ack_to_PA1    <= pos_read_ack_to_mem;
  
end struct;



library ieee;
use ieee.std_logic_1164.all;

entity verlet_control_continuous is port (
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
end verlet_control_continuous;

architecture behav of verlet_control_continuous is

  type   master_state is (IDLE, READ_P, READ_V, WRITE_V, WRITE_P,  COMPUTE);
  signal master_curr_state : master_state;
  signal master_next_state : master_state;

begin  -- behav

  --This state machine will control the reading in of data values
-- purpose: Controls the reading of data to be input to the verlet algorithm
-- type   : sequential
-- inputs : clk, areset_b
-- outputs: 
  read_fsm : process (clk, areset_b)
  begin  -- process read_fsm
    if areset_b = '0' then              -- asynchronous reset (active low)
      master_curr_state <= IDLE;
    elsif clk'event and clk = '1' then  -- rising clock edge
      master_curr_state <= master_next_state;
    end if;
  end process read_fsm;


  --NOTE: I am not sure if I will be able to read every dimension at once or if it
  --will have to be done individually.  The states allow for either approach but
  --currently it assumes the all in one approach.

-- purpose: Determines the next state
-- type   : combinational
-- inputs : mased_curr_state
-- outputs: 
  master_fsm_update : process (master_curr_state, vel_write_ack_from_mem, pos_write_ack_from_PA2, pos_read_ack_to_PA1, vel_read_ack_from_mem, acc_write_req )
  begin  -- process f
    case master_curr_state is
      when IDLE => if (acc_write_req = '1') then
                     master_next_state <= READ_V;
                   else
                     master_next_state <= IDLE;
                   end if;
      when READ_V => if (vel_read_ack_from_mem = '1') then
                       master_next_state <= READ_P;
                     else
                       master_next_state <= READ_V;
                     end if;
      when READ_P => if (pos_read_ack_to_PA1 = '1') then
                       master_next_state <= COMPUTE;
                     else
                       master_next_state <= READ_P;
                     end if;
      when COMPUTE => master_next_state <= WRITE_P;  --A compute stage is needed
--as the data was just clocked in
      when WRITE_P => if (pos_write_ack_from_PA2 = '1') then
                        master_next_state <= WRITE_V;
                      else
                        master_next_state <= WRITE_P;
                      end if;
      when WRITE_V => if (vel_write_ack_from_mem = '1') then
                        master_next_state <= IDLE;
                      else
                        master_next_state <= WRITE_V;
                      end if;
      when others => master_next_state <= IDLE;
    end case;
  end process master_fsm_update;

--Now the output portion of the state machine
--I'm also embedding some mux's in here.  I think it should work but perhaps
--it may be necessary to split things up?
  master_output : process (master_curr_state)
  begin  -- process master_output

    case master_curr_state is
      when IDLE =>
        acc_select           <= '1';--acc_write_req;
        pos_select           <= '1';  --This pos select should always be selected for now as it stores the output of the computation
        prev_pos_select      <= '0';
        vel_minus_select     <= '0';
        vel_plus_select      <= '1';
        acc_write_ack        <= '0';
        pos_write_req_to_PA2 <= '0';
        pos_read_req_to_PA1  <= '0';
        vel_write_req_to_mem <= '0';
        vel_read_req_to_mem  <= '0';
        pos_write_req_to_PA1 <= '0';
        pos_read_req_to_PA2  <= '0';
        vu_idle              <= '1';

      when READ_V =>
        acc_select           <= '0';
        pos_select           <= '1';  --This pos select should always be selected for now as it stores the output of the computation
        prev_pos_select      <= '0';
        vel_minus_select     <= '1';--vel_read_ack_from_mem;
        vel_plus_select      <= '1';
        acc_write_ack        <= '0';
        pos_write_req_to_PA2 <= '0';
        pos_read_req_to_PA1  <= '0';
        vel_write_req_to_mem <= '0';
        vel_read_req_to_mem  <= '1';
        pos_write_req_to_PA1 <= '0';
        pos_read_req_to_PA2  <= '0';
        vu_idle              <= '0';
        
      when READ_P =>
        acc_select           <= '0';
        pos_select           <= '1';  --This pos select should always be selected for now as it stores the output of the computation
        prev_pos_select      <= '1';--pos_read_ack_to_PA1;
        vel_minus_select     <= '0';
        vel_plus_select      <= '1';
        acc_write_ack        <= '0';
        pos_write_req_to_PA2 <= '0';
        pos_read_req_to_PA1  <= '1';
        vel_write_req_to_mem <= '0';
        vel_read_req_to_mem  <= '0';
        pos_write_req_to_PA1 <= '0';
        pos_read_req_to_PA2  <= '0';
        vu_idle              <= '0';
      when COMPUTE =>
        acc_select           <= '0';
        pos_select           <= '1';  --This pos select should always be selected for now as it stores the output of the computation
        prev_pos_select      <= '0';
        vel_minus_select     <= '0';
        vel_plus_select      <= '1';
        acc_write_ack        <= '0';
        pos_write_req_to_PA2 <= '0';
        pos_read_req_to_PA1  <= '0';
        vel_write_req_to_mem <= '0';
        vel_read_req_to_mem  <= '0';
        pos_write_req_to_PA1 <= '0';
        pos_read_req_to_PA2  <= '0';
        vu_idle              <= '0';

      when WRITE_V =>
        acc_select           <= '0';
        pos_select           <= '1';  --This pos select should always be selected for now as it stores the output of the computation
        prev_pos_select      <= '0';
        vel_minus_select     <= '0';
        vel_plus_select      <= '1';
        acc_write_ack        <= '0';
        pos_write_req_to_PA2 <= '0';
        pos_read_req_to_PA1  <= '0';
        vel_write_req_to_mem <= '1';
        vel_read_req_to_mem  <= '0';
        pos_write_req_to_PA1 <= '0';
        pos_read_req_to_PA2  <= '0';
        vu_idle              <= '0';
      when WRITE_P =>
        acc_select           <= '0';
        pos_select           <= '1';  --This pos select should always be selected for now as it stores the output of the computation
        prev_pos_select      <= '0';
        vel_minus_select     <= '0';
        vel_plus_select      <= '1';
        acc_write_ack        <= '1';  --Don't ack it until the end so everything waits for this to finish
        pos_write_req_to_PA2 <= '1';
        pos_read_req_to_PA1  <= '0';
        vel_write_req_to_mem <= '0';
        vel_read_req_to_mem  <= '0';
        pos_write_req_to_PA1 <= '0';
        pos_read_req_to_PA2  <= '0';
        vu_idle              <= '0';

--Others is the same as idle
      when others =>
        acc_select           <= '1';--acc_write_req;
        pos_select           <= '1';  --This pos select should always be selected for now as it stores the output of the computation
        prev_pos_select      <= '0';
        vel_minus_select     <= '0';
        vel_plus_select      <= '1';
        acc_write_ack        <= '0';
        pos_write_req_to_PA2 <= '0';
        pos_read_req_to_PA1  <= '0';
        vel_write_req_to_mem <= '0';
        vel_read_req_to_mem  <= '0';
        pos_write_req_to_PA1 <= '0';
        pos_read_req_to_PA2  <= '0';
        vu_idle              <= '1';
    end case;
  end process master_output;


end behav;
