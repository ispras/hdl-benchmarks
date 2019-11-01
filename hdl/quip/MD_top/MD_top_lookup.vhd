library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity MD_top_lookup is

  generic (
    INTLENGTH              : integer := 32;
    LOG_NUM_PARTICLES      : integer := 4;
    POS_LSB_LOG            : integer := -62;
    LOOKUP_WIDTH           : integer := 17;
    LOOKUP_OFFSET          : integer := -70;
    SLOPE_LSB_LOG          : integer := 79;
    SLOPE_WIDTH            : integer := 32;
    RESIDUAL_SLOPE_LSB_LOG : integer := -45;
    RESIDUAL_SLOPE_WIDTH   : integer := 79;
    FUNCTION_VALUE_LSB_LOG : integer := 18;
    FUNCTION_VALUE_WIDTH   : integer := 43;
    ACCEL_LSB_LOG          : integer := -12;

    constant_dt_a  : std_logic_vector(63 downto 0) := (others => '1');
    constant_dt_v  : std_logic_vector(63 downto 0) := (others => '1');
    constant_dt2_a : std_logic_vector(63 downto 0) := (others => '1');
    --only intlength bits are used but it is fixed at 64 bits wide
    --since I can't dynamically size a generic

    pos_lsb_log_weight : integer := -62;
    vel_lsb_log_weight : integer := -13;
    acc_lsb_log_weight : integer := -12;

    pos_width  : integer := 32;
    vel_width  : integer := 44;
    acc_width  : integer := 43;
    mem_width  : integer := 64;
    pos2_width : integer := 64;

    dt_a_width               : integer := 1;
    dt_a_lsb_log_weight      : integer := 0;
    dt_v_width               : integer := 11;
    dt_v_lsb_log_weight      : integer := -60;
    dt2_a_width              : integer := 11;
    dt2_a_lsb_log_weight     : integer := -60;
    step2_vel_width          : integer := 44;
    step2_vel_lsb_log_weight : integer := -13;

    a_dt2_mult_width     : integer := 43;
    a_dt2_lsb_log_weight : integer := -62;
    a_dt_mult_width      : integer := 43;
    a_dt_lsb_log_weight  : integer := -12;
    v_dt_mult_width      : integer := 43;
    v_dt_lsb_log_weight  : integer := -62
    );

  port(
    tm3_sram_data : inout std_logic_vector(63 downto 0);
    tm3_sram_addr : out   std_logic_vector(18 downto 0);
    tm3_sram_we   : out   std_logic_vector(7 downto 0);
    tm3_sram_oe   : out   std_logic_vector(1 downto 0);
    tm3_sram_adsp : out   std_logic;

    clk          : in  std_logic;
    reset        : in  std_logic;
    stall        : in  std_logic;
    done         : out std_logic;
    time_counter : out std_logic_vector(31 downto 0);

    -- Signals between LJFC and LJMC
    ljmc_radius_mag_sq_slope : out std_logic_vector(LOOKUP_WIDTH-1 downto 0);
    ljmc_slope_read          : out std_logic;
    ljmc_slope_acc           : in  std_logic;
    ljmc_slope               : in  std_logic_vector(63 downto 0);
    ljmc_radius_mag_sq_value : out std_logic_vector(LOOKUP_WIDTH-1 downto 0);
    ljmc_value_read          : out std_logic;
    ljmc_value_acc           : in  std_logic;
    ljmc_value               : in  std_logic_vector(63 downto 0)
    );
end MD_top_lookup;

architecture structure of MD_top_lookup is

-----------------------------------------------------

  component MD_control

    generic (
      INTLENGTH : integer := 24
      );

    port(
      clk                 : in  std_logic;
      reset               : in  std_logic;
      stall               : in  std_logic;
      done                : out std_logic;
      AU_SC_idle          : in  std_logic;
      LJFC_SC_overflow    : in  std_logic;
      LJFC_SC_idle        : in  std_logic;
      VU_SC_PASS_COMPLETE : in  std_logic;
      VU_SC_WRITE_PARTICLE: in  std_logic;
      PG_SC_finished      : in  std_logic;
      SC_VU_START         : out std_logic;
      SC_MC_switch_bank   : out std_logic;
      SC_PG_start         : out std_logic;
      SC_VU_dt            : out std_logic_vector(INTLENGTH-1 downto 0);
      SC_VU_k_dt          : out std_logic_vector(INTLENGTH-1 downto 0);
      SC_VU_k             : out std_logic_vector(INTLENGTH-1 downto 0);
      time_counter        : out std_logic_vector(31 downto 0)
      );
  end component;

-----------------------------------------------------

  component memControl

    generic(intlength         :       integer := 64;
            log_num_particles :       integer := 14
            );
    port(
      clk                     : in    std_logic;
      -- signals to interface with SRAM
      tm3_sram_data           : inout std_logic_vector(63 downto 0);
      tm3_sram_addr           : out   std_logic_vector(18 downto 0);
      tm3_sram_we             : out   std_logic_vector(7 downto 0);
      tm3_sram_oe             : out   std_logic_vector(1 downto 0);
      tm3_sram_adsp           : out   std_logic;
      -- position inputs
      md_pos_in_x             : in    std_logic_vector(intlength-1 downto 0);
      md_pos_in_y             : in    std_logic_vector(intlength-1 downto 0);
      md_pos_in_z             : in    std_logic_vector(intlength-1 downto 0);
      -- velocity inputs
      md_veloc_in_x           : in    std_logic_vector(intlength-1 downto 0);
      md_veloc_in_y           : in    std_logic_vector(intlength-1 downto 0);
      md_veloc_in_z           : in    std_logic_vector(intlength-1 downto 0);
      -- acceleration inputs
      md_accel_in_x           : in    std_logic_vector(intlength-1 downto 0);
      md_accel_in_y           : in    std_logic_vector(intlength-1 downto 0);
      md_accel_in_z           : in    std_logic_vector(intlength-1 downto 0);
      -- data outputs (can be position, velocity or accel
      -- it depends on which w/r-complete signal is high
      md_data_out_x           : out   std_logic_vector(intlength-1 downto 0);
      md_data_out_y           : out   std_logic_vector(intlength-1 downto 0);
      md_data_out_z           : out   std_logic_vector(intlength-1 downto 0);
      -- particle id (seperate for r, v, a
      md_particle_id_pos_pg   : in    std_logic_vector(log_num_particles-1 downto 0);
      md_particle_id_pos_vu   : in    std_logic_vector(log_num_particles-1 downto 0);
      md_particle_id_veloc    : in    std_logic_vector(log_num_particles-1 downto 0);
      md_particle_id_accel    : in    std_logic_vector(log_num_particles-1 downto 0);
      -- write/read enables are the same as 'valid' signal
      md_we_pos               : in    std_logic;
      md_re_pos_pg            : in    std_logic;
      md_re_pos_vu            : in    std_logic;
      -- write/read complete are the same as 'accept' signal
      md_write_complete_pos   : out   std_logic;
      md_read_complete_pos_pg : out   std_logic;
      md_read_complete_pos_vu : out   std_logic;
      -- the same set but for velocity
      md_we_veloc             : in    std_logic;
      md_re_veloc             : in    std_logic;
      md_write_complete_veloc : out   std_logic;
      md_read_complete_veloc  : out   std_logic;
      -- the same as above but for acceleration
      md_we_accel             : in    std_logic;
      md_re_accel             : in    std_logic;
      md_write_complete_accel : out   std_logic;
      md_read_complete_accel  : out   std_logic;
      --bank selection
      md_position_bank_sel_vu : in    std_logic;
      md_switch_bank          : in    std_logic;
      -- reset signal
      md_async_reset_bar      : in    std_logic);
  end component;

-----------------------------------------------------

  component velocity_verlet_top_continuous

    generic (
      pos_width          : integer := 32;
      pos_lsb_log_weight : integer := 0;
      vel_width          : integer := 32;
      vel_lsb_log_weight : integer := 0;
      acc_width          : integer := 32;
      acc_lsb_log_weight : integer := 0;

      dt_a_width               : integer := 32;
      dt_a_lsb_log_weight      : integer := 0;
      dt_v_width               : integer := 32;
      dt_v_lsb_log_weight      : integer := 0;
      dt2_a_width              : integer := 32;
      dt2_a_lsb_log_weight     : integer := 0;
      step2_vel_width          : integer := 32;
      step2_vel_lsb_log_weight : integer := 0;

      a_dt_mult_width      : integer := 32;
      a_dt_lsb_log_weight  : integer := 0;
      v_dt_mult_width      : integer := 32;
      v_dt_lsb_log_weight  : integer := 32;
      a_dt2_mult_width     : integer := 32;
      a_dt2_lsb_log_weight : integer := 0;

      idx_width : integer := 16
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
      dt_a  : in std_logic_vector(dt_a_width-1 downto 0);
      dt_v  : in std_logic_vector(dt_v_width-1 downto 0);
      dt2_a : in std_logic_vector(dt2_a_width-1 downto 0);

      -- Control Signals
      clk      : in std_logic;
      areset_b : in std_logic
      );
  end component;

-----------------------------------------------------

  component AU_acceleration_update

    generic(
      LOG_NUM_PARTICLES : integer := 16;
      INTLENGTH         : integer := 64
      );

    port(
      RESET                   : in std_logic;
      CLK                     : in std_logic;
      LJFC_PARTICLE_A         : in std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
      LJFC_PARTICLE_B         : in std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
      LJFC_ACC_X              : in std_logic_vector(INTLENGTH-1 downto 0);
      LJFC_ACC_Y              : in std_logic_vector(INTLENGTH-1 downto 0);
      LJFC_ACC_Z              : in std_logic_vector(INTLENGTH-1 downto 0);
      LJFC_AU_FORCE_DIRECTION : in std_logic_vector(2 downto 0);
      LJFC_ACC_READY          : in std_logic;

      VU_WRITE_COMPLETE  : in std_logic;
      AA_WRITE_COMPLETE  : in std_logic;
      AA_READ_DATA_READY : in std_logic;
      AA_READ_X          : in std_logic_vector(INTLENGTH-1 downto 0);
      AA_READ_Y          : in std_logic_vector(INTLENGTH-1 downto 0);
      AA_READ_Z          : in std_logic_vector(INTLENGTH-1 downto 0);

      LJFC_ACC_ACCEPTED : out std_logic;
      VU_WRITE_ENABLE   : out std_logic;
      AA_WRITE_ENABLE   : out std_logic;
      AA_WRITE_X        : out std_logic_vector(INTLENGTH-1 downto 0);
      AA_WRITE_Y        : out std_logic_vector(INTLENGTH-1 downto 0);
      AA_WRITE_Z        : out std_logic_vector(INTLENGTH-1 downto 0);
      AA_PARTICLE_ID    : out std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
      AA_READ_ENABLE    : out std_logic;
      SC_AU_IDLE        : out std_logic;
      LJFC_idle         : in  std_logic;
      PG_idle           : in  std_logic
      );
  end component;

-------------------------------------------------------------------- 

  component LJFC_lookup

    generic (
      LOG_NUM_PARTICLES : integer := 8;

      POS_LSB_LOG : integer := -62;
      POS_WIDTH   : integer := 32;

      LOOKUP_WIDTH  : integer := 17;
      LOOKUP_OFFSET : integer := -70;

      SLOPE_LSB_LOG : integer := 79;
      SLOPE_WIDTH   : integer := 32;

      RESIDUAL_SLOPE_LSB_LOG : integer := -45;
      RESIDUAL_SLOPE_WIDTH   : integer := 79;

      FUNCTION_VALUE_LSB_LOG : integer := 18;
      FUNCTION_VALUE_WIDTH   : integer := 43;

      ACCEL_LSB_LOG : integer := -12;
      ACCEL_WIDTH   : integer := 43

      );

    port(

      -- Global Signals
      RESET : in std_logic;
      CLK   : in std_logic;

      -- Signals between LJFC and PG
      PG_PARTICLE_A, PG_PARTICLE_B : in std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);  -- particle id's
      PG_RADIUS_MAG_SQ             : in std_logic_vector(2*POS_WIDTH-1 downto 0);  -- r^2
      PG_RAD_X, PG_RAD_Y, PG_RAD_Z : in std_logic_vector(POS_WIDTH-1 downto 0);  -- unsigned delta x, y, z
      PG_force_direction_vector    : in std_logic_vector (2 downto 0);  -- this vector says whether the x,y,z deltas

      PG_PAIR_READY    : in  std_logic;
      PG_PAIR_ACCEPTED : out std_logic;

      -- Signals between LJFC and AU
      AU_ACC_ACCEPTED : in  std_logic;  -- for the acceleration update handshake
      AU_DATA_VALID   : out std_logic;  -- my outputs mean something, hold until I get an accept from the AU block

      AU_PARTICLE_A, AU_PARTICLE_B : out std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
      AU_ACC_X, AU_ACC_Y, AU_ACC_Z : out std_logic_vector(ACCEL_WIDTH-1 downto 0);
      AU_force_direction_vector    : out std_logic_vector(2 downto 0);

      -- Signals between LJFC and LJMC
      LJMC_RADIUS_MAG_SQ_SLOPE : out std_logic_vector(LOOKUP_WIDTH-1 downto 0);
      LJMC_SLOPE_READ          : out std_logic;
      LJMC_SLOPE_ACC           : in  std_logic;
      LJMC_SLOPE               : in  std_logic_vector(63 downto 0);
      LJMC_RADIUS_MAG_SQ_VALUE : out std_logic_vector(LOOKUP_WIDTH-1 downto 0);
      LJMC_VALUE_READ          : out std_logic;
      LJMC_VALUE_ACC           : in  std_logic;
      LJMC_VALUE               : in  std_logic_vector(63 downto 0);
      LJFC_SC_idle             : out std_logic
      );
  end component;

--------------------------------------------------------------------

  component pairgen
    generic (
      LOG_NUM_PARTICLES        :    positive := 8;
      POSITION_WIDTH           :    positive := 32;
      RADIUS_SQ_WIDTH          :    positive := 64;
      RADIUS_SQ_LSB_LOG_WEIGHT :    integer  := 0
      );
    port (
      clk                      : in std_logic;
      rst_b                    : in std_logic;

      -- System Control signals
      sc_start    : in  std_logic;
      sc_finished : out std_logic;

      -- Position Array signals
      pa_read_finished : in  std_logic;
      pa_read_x        : in  std_logic_vector(POSITION_WIDTH-1 downto 0);
      pa_read_y        : in  std_logic_vector(POSITION_WIDTH-1 downto 0);
      pa_read_z        : in  std_logic_vector(POSITION_WIDTH-1 downto 0);
      pa_particle_id   : out std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
      pa_read_enable   : out std_logic;

      -- Lennard-Jones signals
      lj_pair_accepted : in  std_logic;
      lj_particle_a    : out std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
      lj_particle_b    : out std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
      lj_radius_mag_sq : out std_logic_vector(RADIUS_SQ_WIDTH-1 downto 0);
      lj_radius_x      : out std_logic_vector(POSITION_WIDTH-1 downto 0);
      lj_radius_y      : out std_logic_vector(POSITION_WIDTH-1 downto 0);
      lj_radius_z      : out std_logic_vector(POSITION_WIDTH-1 downto 0);
      lj_force_dir     : out std_logic_vector(2 downto 0);
      lj_pair_ready    : out std_logic
      );
  end component;

--------------------------------------------------------------------


--Signals between AU and LJ
  signal AU_LJFC_acceleration_ack   : std_logic;
  signal LJFC_AU_particle_a_id      : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
  signal LJFC_AU_particle_b_id      : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
  signal LJFC_AU_acceleration_x     : std_logic_vector(acc_width-1 downto 0);
  signal LJFC_AU_acceleration_y     : std_logic_vector(acc_width-1 downto 0);
  signal LJFC_AU_acceleration_z     : std_logic_vector(acc_width-1 downto 0);
  signal LJFC_AU_acceleration_ready : std_logic;
  signal LJFC_AU_force_direction    : std_logic_vector(2 downto 0);


--Signals between MC and AU
  signal AU_MC_acceleration_x           : std_logic_vector(mem_width-1 downto 0);
  signal AU_MC_acceleration_y           : std_logic_vector(mem_width-1 downto 0);
  signal AU_MC_acceleration_z           : std_logic_vector(mem_width-1 downto 0);
  signal AU_MC_particle_id              : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
  signal AU_MC_accel_write_req          : std_logic;
  signal AU_VU_accel_write_req          : std_logic;
  signal AU_MC_accel_read_req           : std_logic;
  signal MC_AU_accel_write_complete_ack : std_logic;
  signal MC_AU_accel_read_ready_ack     : std_logic;

-- Signals between VU and AU
  signal VU_AU_acceleration_ack : std_logic;

--Signals between MC and VU
  signal VU_MC_vel_particle_id        : std_logic_vector(LOG_NUM_PARTICLES -1 downto 0);
  signal VU_MC_pos_particle_id        : std_logic_vector(LOG_NUM_PARTICLES -1 downto 0);
  signal VU_MC_vel_x                  : std_logic_vector(mem_width-1 downto 0);
  signal VU_MC_vel_y                  : std_logic_vector(mem_width-1 downto 0);
  signal VU_MC_vel_z                  : std_logic_vector(mem_width-1 downto 0);
  signal VU_MC_pos_x                  : std_logic_vector(mem_width-1 downto 0);
  signal VU_MC_pos_y                  : std_logic_vector(mem_width-1 downto 0);
  signal VU_MC_pos_z                  : std_logic_vector(mem_width-1 downto 0);
  signal VU_MC_position_bank          : std_logic;
  signal VU_MC_pos_read_req           : std_logic;
  signal MC_VU_pos_read_ready_ack     : std_logic;
  signal VU_MC_pos_write_req          : std_logic;
  signal MC_VU_pos_write_complete_ack : std_logic;
  signal VU_MC_vel_write_req          : std_logic;
  signal VU_MC_vel_read_req           : std_logic;
  signal MC_VU_vel_read_ready_ack     : std_logic;
  signal MC_VU_vel_write_complete_ack : std_logic;

--Signals between LJFC and PG
  signal LJFC_PG_pair_ack        : std_logic;
  signal PG_LJFC_particle_a_id   : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
  signal PG_LJFC_particle_b_id   : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
  signal PG_LJFC_radius_mag_sq   : std_logic_vector(pos2_width-1 downto 0);
  signal PG_LJFC_radius_x        : std_logic_vector(pos_width-1 downto 0);
  signal PG_LJFC_radius_y        : std_logic_vector(pos_width-1 downto 0);
  signal PG_LJFC_radius_z        : std_logic_vector(pos_width-1 downto 0);
  signal PG_LJFC_force_direction : std_logic_vector(2 downto 0);
  signal PG_LJFC_pair_ready      : std_logic;

-- Signals between MC and PG
  signal MC_PG_pos_read_ready_ack : std_logic;
  signal PG_MC_pos_particle_id    : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
  signal PG_MC_pos_read_req       : std_logic;

--Signals between MC and everyone
  signal MC_data_out_x : std_logic_vector(mem_width-1 downto 0);
  signal MC_data_out_y : std_logic_vector(mem_width-1 downto 0);
  signal MC_data_out_z : std_logic_vector(mem_width-1 downto 0);

--Signals between control and blocks
  signal AU_SC_idle          : std_logic;
  signal LJFC_SC_overflow    : std_logic;
  signal VU_SC_PASS_COMPLETE : std_logic;
  signal SC_VU_START         : std_logic;
  signal SC_MC_switch_bank   : std_logic;
  signal SC_PG_start         : std_logic;
  signal LJFC_SC_idle        : std_logic;
  signal PG_SC_finished      : std_logic;
  signal SC_VU_dt_a          : std_logic_vector(dt_a_width-1 downto 0);
  signal SC_VU_dt_v          : std_logic_vector(dt_v_width-1 downto 0);
  signal SC_VU_dt2_a         : std_logic_vector(dt2_a_width-1 downto 0);

  signal nreset : std_logic;

--------------------------------------------------------------------

begin

  SC_VU_dt_a  <= constant_dt_a(dt_a_width-1 downto 0);
  SC_VU_dt_v  <= constant_dt_v(dt_v_width-1 downto 0);
  SC_VU_dt2_a <= constant_dt2_a(dt2_a_width-1 downto 0);
  nreset      <= not reset;

  --Put if gen's around this
  AU_check : if mem_width > acc_width generate
    AU_MC_acceleration_x(mem_width-1 downto acc_width) <= (others => '0');
    AU_MC_acceleration_y(mem_width-1 downto acc_width) <= (others => '0');
    AU_MC_acceleration_z(mem_width-1 downto acc_width) <= (others => '0');
  end generate AU_check;



  VU_vel_check : if mem_width > vel_width generate
    VU_MC_vel_x(mem_width-1 downto vel_width) <= (others => '0');
    VU_MC_vel_y(mem_width-1 downto vel_width) <= (others => '0');
    VU_MC_vel_z(mem_width-1 downto vel_width) <= (others => '0');
  end generate VU_vel_check;

  VU_pos_check : if mem_width > pos_width generate
    VU_MC_pos_x(mem_width-1 downto pos_width) <= (others => '0');
    VU_MC_pos_y(mem_width-1 downto pos_width) <= (others => '0');
    VU_MC_pos_z(mem_width-1 downto pos_width) <= (others => '0');
  end generate VU_pos_check;
--------------------------------------------------------------------

  au0 : AU_acceleration_update generic map(LOG_NUM_PARTICLES, acc_width)
    port map(
      RESET                   => reset,
      CLK                     => clk,
      LJFC_PARTICLE_A         => LJFC_AU_particle_a_id,
      LJFC_PARTICLE_B         => LJFC_AU_particle_b_id,
      LJFC_ACC_X              => LJFC_AU_acceleration_x,
      LJFC_ACC_Y              => LJFC_AU_acceleration_y,
      LJFC_ACC_Z              => LJFC_AU_acceleration_z,
      LJFC_AU_FORCE_DIRECTION => LJFC_AU_force_direction,
      LJFC_ACC_READY          => LJFC_AU_acceleration_ready,
      VU_WRITE_COMPLETE       => VU_AU_acceleration_ack,
      AA_WRITE_COMPLETE       => MC_AU_accel_write_complete_ack,
      AA_READ_DATA_READY      => MC_AU_accel_read_ready_ack,
      AA_READ_X               => MC_data_out_x(acc_width-1 downto 0),
      AA_READ_Y               => MC_data_out_y(acc_width-1 downto 0),
      AA_READ_Z               => MC_data_out_z(acc_width-1 downto 0),
      LJFC_ACC_ACCEPTED       => AU_LJFC_acceleration_ack,
      VU_WRITE_ENABLE         => AU_VU_accel_write_req,
      AA_WRITE_ENABLE         => AU_MC_accel_write_req,
      AA_WRITE_X              => AU_MC_acceleration_x(acc_width-1 downto 0),
      AA_WRITE_Y              => AU_MC_acceleration_y(acc_width-1 downto 0),
      AA_WRITE_Z              => AU_MC_acceleration_z(acc_width-1 downto 0),
      AA_PARTICLE_ID          => AU_MC_particle_id,
      AA_READ_ENABLE          => AU_MC_accel_read_req,
      SC_AU_IDLE              => AU_SC_idle,
      PG_idle                 => PG_SC_finished,
      LJFC_idle               => LJFC_SC_idle);

--------------------------------------------------------------------

  pg0 : pairgen
    generic map(
      LOG_NUM_PARTICLES        => LOG_NUM_PARTICLES,
      POSITION_WIDTH           => POS_WIDTH,
      RADIUS_SQ_WIDTH          => pos2_width,
      RADIUS_SQ_LSB_LOG_WEIGHT => 0
      )
    port map(
      clk                      => clk,
      rst_b                    => nreset,
      -- System Control signals
      sc_start                 => SC_PG_start,
      sc_finished              => PG_SC_finished,
      -- Position Array signals
      pa_read_finished         => MC_PG_pos_read_ready_ack,
      pa_read_x                => MC_data_out_x(pos_width-1 downto 0),
      pa_read_y                => MC_data_out_y(pos_width-1 downto 0),
      pa_read_z                => MC_data_out_z(pos_width-1 downto 0),
      pa_particle_id           => PG_MC_pos_particle_id,
      pa_read_enable           => PG_MC_pos_read_req,
      -- Lennard-Jones signals
      lj_pair_accepted         => LJFC_PG_pair_ack,
      lj_particle_a            => PG_LJFC_particle_a_id,
      lj_particle_b            => PG_LJFC_particle_b_id,
      lj_radius_mag_sq         => PG_LJFC_radius_mag_sq,
      lj_radius_x              => PG_LJFC_radius_x(pos_width-1 downto 0),
      lj_radius_y              => PG_LJFC_radius_y(pos_width-1 downto 0),
      lj_radius_z              => PG_LJFC_radius_z(pos_width-1 downto 0),
      lj_force_dir             => PG_LJFC_force_direction,
      lj_pair_ready            => PG_LJFC_pair_ready
      );

--------------------------------------------------------------------

  lj0 : LJFC_lookup
    generic map(
      LOG_NUM_PARTICLES         => LOG_NUM_PARTICLES,
      POS_LSB_LOG               => pos_lsb_log_weight,
      POS_WIDTH                 => POS_WIDTH,
      LOOKUP_WIDTH              => LOOKUP_WIDTH,
      LOOKUP_OFFSET             => LOOKUP_OFFSET,
      SLOPE_LSB_LOG             => SLOPE_LSB_LOG,
      SLOPE_WIDTH               => SLOPE_WIDTH,
      RESIDUAL_SLOPE_LSB_LOG    => RESIDUAL_SLOPE_LSB_LOG,
      RESIDUAL_SLOPE_WIDTH      => RESIDUAL_SLOPE_WIDTH,
      FUNCTION_VALUE_LSB_LOG    => FUNCTION_VALUE_LSB_LOG,
      FUNCTION_VALUE_WIDTH      => FUNCTION_VALUE_WIDTH,
      ACCEL_LSB_LOG             => acc_lsb_log_weight,
      ACCEL_WIDTH               => acc_width
      )
    port map(
      -- Global Signals
      RESET                     => reset,
      CLK                       => clk,
      -- Signals between LJFC and PG
      PG_PARTICLE_A             => PG_LJFC_particle_a_id,
      PG_PARTICLE_B             => PG_LJFC_particle_b_id,
      PG_RADIUS_MAG_SQ          => PG_LJFC_radius_mag_sq,
      PG_RAD_X                  => PG_LJFC_radius_x(pos_width-1 downto 0),
      PG_RAD_Y                  => PG_LJFC_radius_y(pos_width-1 downto 0),
      PG_RAD_Z                  => PG_LJFC_radius_z(pos_width-1 downto 0),
      PG_force_direction_vector => PG_LJFC_force_direction,
      PG_PAIR_READY             => PG_LJFC_pair_ready,
      PG_PAIR_ACCEPTED          => LJFC_PG_pair_ack,
      -- Signals between LJFC and AU
      AU_ACC_ACCEPTED           => AU_LJFC_acceleration_ack,
      AU_DATA_VALID             => LJFC_AU_acceleration_ready,
      AU_PARTICLE_A             => LJFC_AU_particle_a_id,
      AU_PARTICLE_B             => LJFC_AU_particle_b_id,
      AU_ACC_X                  => LJFC_AU_acceleration_x,
      AU_ACC_Y                  => LJFC_AU_acceleration_y,
      AU_ACC_Z                  => LJFC_AU_acceleration_z,
      AU_force_direction_vector => LJFC_AU_force_direction,
      -- Signals between LJFC and LJMC
      LJMC_RADIUS_MAG_SQ_SLOPE  => ljmc_radius_mag_sq_slope,
      LJMC_SLOPE_READ           => ljmc_slope_read,
      LJMC_SLOPE_ACC            => ljmc_slope_acc,
      LJMC_SLOPE                => ljmc_slope,
      LJMC_RADIUS_MAG_SQ_VALUE  => ljmc_radius_mag_sq_value,
      LJMC_VALUE_READ           => ljmc_value_read,
      LJMC_VALUE_ACC            => ljmc_value_acc,
      LJMC_VALUE                => ljmc_value,
      LJFC_SC_idle              => LJFC_SC_idle
      );

--------------------------------------------------------------------

  mc0 : memControl generic map(mem_width, LOG_NUM_PARTICLES)
    port map (clk,
              tm3_sram_data           => tm3_sram_data,
              tm3_sram_addr           => tm3_sram_addr,
              tm3_sram_we             => tm3_sram_we,
              tm3_sram_oe             => tm3_sram_oe,
              tm3_sram_adsp           => tm3_sram_adsp,
              -- position inputs
              md_pos_in_x             => VU_MC_pos_x,
              md_pos_in_y             => VU_MC_pos_y,
              md_pos_in_z             => VU_MC_pos_z,
              -- velocity inputs
              md_veloc_in_x           => VU_MC_vel_x,
              md_veloc_in_y           => VU_MC_vel_y,
              md_veloc_in_z           => VU_MC_vel_z,
              -- acceleration inputs
              md_accel_in_x           => AU_MC_acceleration_x,
              md_accel_in_y           => AU_MC_acceleration_y,
              md_accel_in_z           => AU_MC_acceleration_z,
              -- data outputs (can be position, velocity or accel
              -- it depends on which w/r-complete signal is high
              md_data_out_x           => MC_data_out_x,
              md_data_out_y           => MC_data_out_y,
              md_data_out_z           => MC_data_out_z,
              -- particle id (seperate for r, v, a
              md_particle_id_pos_pg   => PG_MC_pos_particle_id,
              md_particle_id_pos_vu   => VU_MC_pos_particle_id,
              md_particle_id_veloc    => VU_MC_vel_particle_id,
              md_particle_id_accel    => AU_MC_particle_id,
              -- write/read enables are the same as 'valid' signal
              md_we_pos               => VU_MC_pos_write_req,
              md_re_pos_pg            => PG_MC_pos_read_req,
              md_re_pos_vu            => VU_MC_pos_read_req,
              -- write/read complete are the same as 'accept' signal
              md_write_complete_pos   => MC_VU_pos_write_complete_ack,
              md_read_complete_pos_pg => MC_PG_pos_read_ready_ack,
              md_read_complete_pos_vu => MC_VU_pos_read_ready_ack,
              -- the same set but for velocity
              md_we_veloc             => VU_MC_vel_write_req,
              md_re_veloc             => VU_MC_vel_read_req,
              md_write_complete_veloc => MC_VU_vel_write_complete_ack,
              md_read_complete_veloc  => MC_VU_vel_read_ready_ack,
              -- the same as above but for acceleration
              md_we_accel             => AU_MC_accel_write_req,
              md_re_accel             => AU_MC_accel_read_req,
              md_write_complete_accel => MC_AU_accel_write_complete_ack,
              md_read_complete_accel  => MC_AU_accel_read_ready_ack,
              --bank selection
              md_position_bank_sel_vu => VU_MC_position_bank,
              md_switch_bank          => SC_MC_switch_bank,
              -- reset signal
              md_async_reset_bar      => nreset);

--------------------------------------------------------------------

  vv0 : velocity_verlet_top_continuous
    generic map(
--      pos_width                => 32,
--      pos_lsb_log_weight       => -62,
--      vel_width                => 44,
--      vel_lsb_log_weight       => -13,
--      acc_width                => 43,
--      acc_lsb_log_weight       => -12,
--      dt_a_width               => 1,
--      dt_a_lsb_log_weight      => 0,
--      dt_v_width               => 11,
--      dt_v_lsb_log_weight      => -60,
--      dt2_a_width              => 11,
--      dt2_a_lsb_log_weight     => -60,
--      step2_vel_width          => 44,
--      step2_vel_lsb_log_weight => -13,
--      a_dt_mult_width          => 43,
--      a_dt2_lsb_log_weight      => -62,
--      a_dt2_mult_width          => 43,
--      a_dt_lsb_log_weight      => -12,
--      v_dt_mult_width          => 43,
--      v_dt_lsb_log_weight      => -62,
--      idx_width                => 8)
      pos_width                => pos_width,
      pos_lsb_log_weight       => pos_lsb_log_weight,
      vel_width                => vel_width,
      vel_lsb_log_weight       => vel_lsb_log_weight,
      acc_width                => acc_width,
      acc_lsb_log_weight       => acc_lsb_log_weight,
      dt_a_width               => dt_a_width,
      dt_a_lsb_log_weight      => dt_a_lsb_log_weight,
      dt_v_width               => dt_v_width,
      dt_v_lsb_log_weight      => dt_v_lsb_log_weight,
      dt2_a_width              => dt2_a_width,
      dt2_a_lsb_log_weight     => dt2_a_lsb_log_weight,
      step2_vel_width          => step2_vel_width,
      step2_vel_lsb_log_weight => step2_vel_lsb_log_weight,
      a_dt_mult_width          => a_dt_mult_width,
      a_dt2_lsb_log_weight     => a_dt2_lsb_log_weight,
      a_dt2_mult_width         => a_dt2_mult_width,
      a_dt_lsb_log_weight      => a_dt_lsb_log_weight,
      v_dt_mult_width          => v_dt_mult_width,
      v_dt_lsb_log_weight      => v_dt_lsb_log_weight,
      idx_width                => LOG_NUM_PARTICLES)
    port map(
      start                    => SC_VU_START,
      pass_complete            => VU_SC_PASS_COMPLETE,
      --The interface to the AU block which passes along the latest acceleration
      acc_write_req            => AU_VU_accel_write_req,
      acc_write_ack            => VU_AU_acceleration_ack,
      curr_particle_num        => AU_MC_particle_id,
      --All 3 dimensions at once
      accel_t_x                => AU_MC_acceleration_x(acc_width -1 downto 0),
      accel_t_y                => AU_MC_acceleration_y(acc_width -1 downto 0),
      accel_t_z                => AU_MC_acceleration_z(acc_width -1 downto 0),
      particle_pos_num_to_mem  => VU_MC_pos_particle_id,
      particle_vel_num_to_mem  => VU_MC_vel_particle_id,
      --Interface for writing updated values to memory
      vel_t_plus_half_dt_x     => VU_MC_vel_x(vel_width-1 downto 0),
      vel_t_plus_half_dt_y     => VU_MC_vel_y(vel_width-1 downto 0),
      vel_t_plus_half_dt_z     => VU_MC_vel_z(vel_width-1 downto 0),
      vel_write_req_to_mem     => VU_MC_vel_write_req,
      vel_write_ack_from_mem   => MC_VU_vel_write_complete_ack,
      position_t_dt_x          => VU_MC_pos_x(pos_width-1 downto 0),
      position_t_dt_y          => VU_MC_pos_y(pos_width-1 downto 0),
      position_t_dt_z          => VU_MC_pos_z(pos_width-1 downto 0),
      pos_write_req_to_mem     => VU_MC_pos_write_req,
      pos_write_ack_from_mem   => MC_VU_pos_write_complete_ack,
      --Interface for reading previous values from memory
      vel_t_minus_half_dt_x    => MC_data_out_x(vel_width-1 downto 0),
      vel_t_minus_half_dt_y    => MC_data_out_y(vel_width-1 downto 0),
      vel_t_minus_half_dt_z    => MC_data_out_z(vel_width-1 downto 0),
      vel_read_req_to_mem      => VU_MC_vel_read_req,
      vel_read_ack_from_mem    => MC_VU_vel_read_ready_ack,
      position_t_dt_x_in       => MC_data_out_x(pos_width-1 downto 0),
      position_t_dt_y_in       => MC_data_out_y(pos_width-1 downto 0),
      position_t_dt_z_in       => MC_data_out_z(pos_width-1 downto 0),
      pos_read_req_to_mem      => VU_MC_pos_read_req,
      pos_read_ack_to_mem      => MC_VU_pos_read_ready_ack,
      --Interface to use correct position array bank
      position_bank            => VU_MC_position_bank,
      --dt is needed if the calculation isn't normalized
      dt_a                     => SC_VU_dt_a,
      dt_v                     => SC_VU_dt_v,
      dt2_a                    => SC_VU_dt2_a,
      -- Control Signals
      clk                      => clk,
      areset_b                 => nreset);

--------------------------------------------------------------------

  sc0 : MD_control generic map(LOG_NUM_PARTICLES) port map (
    clk                 => clk,
    reset               => reset,
    stall               => stall,
    done                => done,
    AU_SC_idle          => AU_SC_idle,
    LJFC_SC_overflow    => LJFC_SC_overflow,
    LJFC_SC_idle        => LJFC_SC_idle,
    VU_SC_PASS_COMPLETE => VU_SC_PASS_COMPLETE,
    VU_SC_WRITE_PARTICLE=> VU_MC_vel_write_req,
    PG_SC_finished      => PG_SC_finished,
    SC_VU_START         => SC_VU_start,
    SC_MC_switch_bank   => SC_MC_switch_bank,
    SC_PG_start         => SC_PG_start,
--              SC_VU_dt                                                        => SC_VU_dt,
--              SC_VU_k                                                 => SC_VU_k,
--              SC_VU_k_dt                                                      => SC_VU_k_dt,
    time_counter        => time_counter
    );

--------------------------------------------------------------------

end structure;


