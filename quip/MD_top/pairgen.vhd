------------------------------------------------------------------------------
-- Pair Generator (PG) Block
-- Calculates radius between all particle pairs using n^2 algorithm
-- Assumes particle space is a cube with dimension equal to 2^POSITION_WIDTH
------------------------------------------------------------------------------
-- A particle pair is dropped if overflow occurs except the last pair
-- The last pair is never dropped so there is a least one pair per particle
-- If the last pair caused an overflow then the maximum r^2 is sent
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pairgen is
   generic (
      LOG_NUM_PARTICLES        : positive := 8;
      POSITION_WIDTH           : positive := 32;
      RADIUS_SQ_WIDTH          : positive := 64;
      RADIUS_SQ_LSB_LOG_WEIGHT : natural  := 0
   );
   port (
      clk              : in  std_logic;
      rst_b            : in  std_logic;

      -- System Control signals
      sc_start         : in  std_logic;
      sc_finished      : out std_logic;

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
end pairgen;

architecture rtl of pairgen is

   -- Component to calculate shortest distance between particles
   component pg_distance
      generic (
         INTEGER_SIZE : integer := 32
      );
      port (
         a_in      : in  std_logic_vector(INTEGER_SIZE-1 downto 0);
         b_in      : in  std_logic_vector(INTEGER_SIZE-1 downto 0);
         output    : out std_logic_vector(INTEGER_SIZE-2 downto 0);
         force_dir : out std_logic;
         overflow  : out std_logic
      );
   end component;

   -- Multiplier component
   component md_gen_mult
      generic (
         INTEGER_INPUT_SIZE           : integer := 32;
         INTEGER_OUTPUT_SIZE          : integer := 32;
         NUM_BITS_TO_RIGHT_OF_DECIMAL : integer := 8
      );
      port (
         a_in     : in  std_logic_vector(INTEGER_INPUT_SIZE-1  downto 0);
         b_in     : in  std_logic_vector(INTEGER_INPUT_SIZE-1  downto 0);
         output   : out std_logic_vector(INTEGER_OUTPUT_SIZE-1 downto 0);
         overflow : out std_logic
      );
   end component;

   -- Adder component
   component md_gen_add
      generic (
         INTEGER_SIZE : integer := 32
      );
      port (
         a_in     : in  std_logic_vector(INTEGER_SIZE-1 downto 0);
         b_in     : in  std_logic_vector(INTEGER_SIZE-1 downto 0);
         output   : out std_logic_vector(INTEGER_SIZE-1 downto 0);
         overflow : out std_logic
      );
   end component;

   -- Internal state variables
   type pg_state is (
      PG_IDLE,
      PG_LOAD1,
      PG_LOAD2,
      PG_STALL1,
      PG_STALL2
   );
   signal state      : pg_state;
   signal next_state : pg_state;

   -- Enables for particle 1 and 2
   signal en1 : std_logic;
   signal en2 : std_logic;

   -- Pipeline stall signals
   signal stall_s1 : std_logic;
   signal stall_s2 : std_logic;
   signal stall_s3 : std_logic;
   signal stall_s4 : std_logic;

   -- Valid signals for data in pipeline
   signal valid_s1_in  : std_logic;
   signal valid_s1_out : std_logic;
   signal valid_s2_in  : std_logic;
   signal valid_s2_out : std_logic;
   signal valid_s3_in  : std_logic;
   signal valid_s3_out : std_logic;
   signal valid_s4     : std_logic;

   -- Indicates when the pair is the last one for particle A
   -- Prevents pair from being dropped when overflow occurs
   -- Last pair is always sent to LJFC
   signal last_pair    : std_logic;
   signal last_pair_s1 : std_logic;
   signal last_pair_s2 : std_logic;
   signal last_pair_s3 : std_logic;
   signal last_pair_s4 : std_logic;

   -- Overflow signals
   signal x_overflow    : std_logic;
   signal y_overflow    : std_logic;
   signal z_overflow    : std_logic;
   signal x_sq_overflow : std_logic;
   signal y_sq_overflow : std_logic;
   signal z_sq_overflow : std_logic;
   signal add1_overflow : std_logic;
   signal add2_overflow : std_logic;

   -- Particle IDs
   signal   pid      : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
   signal   pid1     : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
   signal   pid2     : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
   signal   pid1_s1  : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
   signal   pid2_s1  : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
   signal   pid1_s2  : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
   signal   pid2_s2  : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
   signal   pid1_s3  : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
   signal   pid2_s3  : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
   signal   next_pid : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0);
   constant last_pid : std_logic_vector(LOG_NUM_PARTICLES-1 downto 0) := (others => '1');

   -- Position vectors of particle 1 and 2
   signal x1 : std_logic_vector(POSITION_WIDTH-1 downto 0);
   signal y1 : std_logic_vector(POSITION_WIDTH-1 downto 0);
   signal z1 : std_logic_vector(POSITION_WIDTH-1 downto 0);
   signal x2 : std_logic_vector(POSITION_WIDTH-1 downto 0);
   signal y2 : std_logic_vector(POSITION_WIDTH-1 downto 0);
   signal z2 : std_logic_vector(POSITION_WIDTH-1 downto 0);

   -- Radius vector to nearest image, requires one less bit
   signal x_s1 : std_logic_vector(POSITION_WIDTH-2 downto 0);
   signal y_s1 : std_logic_vector(POSITION_WIDTH-2 downto 0);
   signal z_s1 : std_logic_vector(POSITION_WIDTH-2 downto 0);
   signal x_s2 : std_logic_vector(POSITION_WIDTH-2 downto 0);
   signal y_s2 : std_logic_vector(POSITION_WIDTH-2 downto 0);
   signal z_s2 : std_logic_vector(POSITION_WIDTH-2 downto 0);
   signal x_s3 : std_logic_vector(POSITION_WIDTH-2 downto 0);
   signal y_s3 : std_logic_vector(POSITION_WIDTH-2 downto 0);
   signal z_s3 : std_logic_vector(POSITION_WIDTH-2 downto 0);
   signal x_s4 : std_logic_vector(POSITION_WIDTH-2 downto 0);
   signal y_s4 : std_logic_vector(POSITION_WIDTH-2 downto 0);
   signal z_s4 : std_logic_vector(POSITION_WIDTH-2 downto 0);

   -- Radius vector to nearest image, full bit width for multiplier
   signal x : std_logic_vector(POSITION_WIDTH-1 downto 0);
   signal y : std_logic_vector(POSITION_WIDTH-1 downto 0);
   signal z : std_logic_vector(POSITION_WIDTH-1 downto 0);

   -- Squared radius vector
   signal x_sq_s2 : std_logic_vector(RADIUS_SQ_WIDTH-1 downto 0);
   signal y_sq_s2 : std_logic_vector(RADIUS_SQ_WIDTH-1 downto 0);
   signal z_sq_s2 : std_logic_vector(RADIUS_SQ_WIDTH-1 downto 0);
   signal x_sq_s3 : std_logic_vector(RADIUS_SQ_WIDTH-1 downto 0);
   signal y_sq_s3 : std_logic_vector(RADIUS_SQ_WIDTH-1 downto 0);
   signal z_sq_s3 : std_logic_vector(RADIUS_SQ_WIDTH-1 downto 0);

   -- Intermediate addition result
   signal sum : std_logic_vector(RADIUS_SQ_WIDTH-1 downto 0);

   -- Magnitude squared of radius vector
   signal r_sq_s3 : std_logic_vector(RADIUS_SQ_WIDTH-1 downto 0);
   signal r_sq_s4 : std_logic_vector(RADIUS_SQ_WIDTH-1 downto 0);

   -- Force direction vectors with mapping (0, 1, 2) => (x, y, z)
   signal dir_s1 : std_logic_vector(2 downto 0);
   signal dir_s2 : std_logic_vector(2 downto 0);
   signal dir_s3 : std_logic_vector(2 downto 0);

begin

   ---------------------------------------------------------------------------
   -- Datapath registers
   ---------------------------------------------------------------------------

   process(clk, rst_b)
   begin
      if rst_b = '0' then

         x1 <= (others => '0');
         y1 <= (others => '0');
         z1 <= (others => '0');
         x2 <= (others => '0');
         y2 <= (others => '0');
         z2 <= (others => '0');
         x_s2 <= (others => '0');
         y_s2 <= (others => '0');
         z_s2 <= (others => '0');
         x_s3 <= (others => '0');
         y_s3 <= (others => '0');
         z_s3 <= (others => '0');
         x_s4 <= (others => '0');
         y_s4 <= (others => '0');
         z_s4 <= (others => '0');
         x_sq_s3 <= (others => '0');
         y_sq_s3 <= (others => '0');
         z_sq_s3 <= (others => '0');
         pid1 <= (others => '0');
         pid2 <= (others => '0');
         pid1_s1 <= (others => '0');
         pid2_s1 <= (others => '0');
         pid1_s2 <= (others => '0');
         pid2_s2 <= (others => '0');
         pid1_s3 <= (others => '0');
         pid2_s3 <= (others => '0');
         r_sq_s4 <= (others => '0');
         lj_particle_a <= (others => '0');
         lj_particle_b <= (others => '0');
         lj_force_dir <= "000";
         dir_s2 <= "000";
         dir_s3 <= "000";
         valid_s1_in <= '0';
         valid_s2_in <= '0';
         valid_s3_in <= '0';
         valid_s4 <= '0';
         last_pair_s1 <= '0';
         last_pair_s2 <= '0';
         last_pair_s3 <= '0';
         last_pair_s4 <= '0';

      elsif rising_edge(clk) then

         ---------------------------------------------------------------------
         -- Particle IDs for loading data
         ---------------------------------------------------------------------
         if state = PG_IDLE then
            pid1 <= (others => '0');
         elsif en1 = '1' then
            pid1 <= next_pid;
         end if;
         if en1 = '1' or en2 = '1' then
            pid2 <= next_pid;
         end if;

         ---------------------------------------------------------------------
         -- Pipeline input stage / stage 1
         ---------------------------------------------------------------------
         if en1 = '1' then
            x1 <= pa_read_x;
            y1 <= pa_read_y;
            z1 <= pa_read_z;
            pid1_s1 <= pid1;
         end if;
         if en2 = '1' then
            x2 <= pa_read_x;
            y2 <= pa_read_y;
            z2 <= pa_read_z;
            pid2_s1 <= pid2;
         end if;
         if stall_s1 = '0' then
            valid_s1_in <= en2;
            last_pair_s1 <= en2 and last_pair;
         end if;

         ---------------------------------------------------------------------
         -- Pipeline stage 1 / stage 2
         ---------------------------------------------------------------------
         if stall_s2 = '0' then
            x_s2 <= x_s1;
            y_s2 <= y_s1;
            z_s2 <= z_s1;
            dir_s2 <= dir_s1;
            pid1_s2 <= pid1_s1;
            pid2_s2 <= pid2_s1;
            valid_s2_in <= valid_s1_out;
            last_pair_s2 <= last_pair_s1;
         end if;

         ---------------------------------------------------------------------
         -- Pipeline stage 2 / stage 3
         ---------------------------------------------------------------------
         if stall_s3 = '0' then
            x_s3 <= x_s2;
            y_s3 <= y_s2;
            z_s3 <= z_s2;
            dir_s3 <= dir_s2;
            x_sq_s3 <= x_sq_s2;
            y_sq_s3 <= y_sq_s2;
            z_sq_s3 <= z_sq_s2;
            pid1_s3 <= pid1_s2;
            pid2_s3 <= pid2_s2;
            valid_s3_in <= valid_s2_out;
            last_pair_s3 <= last_pair_s2;
         end if;

         ---------------------------------------------------------------------
         -- Pipeline stage 3 / output stage
         ---------------------------------------------------------------------
         if stall_s4 = '0' then
            x_s4 <= x_s3;
            y_s4 <= y_s3;
            z_s4 <= z_s3;
            lj_force_dir <= dir_s3;
            r_sq_s4 <= r_sq_s3;
            lj_particle_a <= pid1_s3;
            lj_particle_b <= pid2_s3;
            valid_s4 <= valid_s3_out;
            last_pair_s4 <= last_pair_s3;
         end if;

      end if;
   end process;

   ---------------------------------------------------------------------------
   -- Find distance to nearest image (pipeline stage 1)
   ---------------------------------------------------------------------------

   pg_distance_x : pg_distance
      generic map (
         INTEGER_SIZE => POSITION_WIDTH
      )
      port map (
         a_in      => x1,
         b_in      => x2,
         output    => x_s1,
         force_dir => dir_s1(0),
         overflow  => x_overflow
      );

   pg_distance_y : pg_distance
      generic map (
         INTEGER_SIZE => POSITION_WIDTH
      )
      port map (
         a_in      => y1,
         b_in      => y2,
         output    => y_s1,
         force_dir => dir_s1(1),
         overflow  => y_overflow
      );

   pg_distance_z : pg_distance
      generic map (
         INTEGER_SIZE => POSITION_WIDTH
      )
      port map (
         a_in      => z1,
         b_in      => z2,
         output    => z_s1,
         force_dir => dir_s1(2),
         overflow  => z_overflow
      );

   ---------------------------------------------------------------------------
   -- Multipliers (pipeline stage 2)
   ---------------------------------------------------------------------------

   -- Multipler inputs require extra bit
   x <= "0" & x_s2;
   y <= "0" & y_s2;
   z <= "0" & z_s2;

   -- Calculate x^2
   md_gen_mult_x : md_gen_mult
      generic map (
         INTEGER_INPUT_SIZE           => POSITION_WIDTH,
         INTEGER_OUTPUT_SIZE          => RADIUS_SQ_WIDTH,
         NUM_BITS_TO_RIGHT_OF_DECIMAL => RADIUS_SQ_LSB_LOG_WEIGHT
      )
      port map (
         a_in     => x,
         b_in     => x,
         output   => x_sq_s2,
         overflow => x_sq_overflow
      );

   -- Calculate y^2
   md_gen_mult_y : md_gen_mult
      generic map (
         INTEGER_INPUT_SIZE           => POSITION_WIDTH,
         INTEGER_OUTPUT_SIZE          => RADIUS_SQ_WIDTH,
         NUM_BITS_TO_RIGHT_OF_DECIMAL => RADIUS_SQ_LSB_LOG_WEIGHT
      )
      port map (
         a_in     => y,
         b_in     => y,
         output   => y_sq_s2,
         overflow => y_sq_overflow
      );

   -- Calculate z^2
   md_gen_mult_z : md_gen_mult
      generic map (
         INTEGER_INPUT_SIZE           => POSITION_WIDTH,
         INTEGER_OUTPUT_SIZE          => RADIUS_SQ_WIDTH,
         NUM_BITS_TO_RIGHT_OF_DECIMAL => RADIUS_SQ_LSB_LOG_WEIGHT
      )
      port map (
         a_in     => z,
         b_in     => z,
         output   => z_sq_s2,
         overflow => z_sq_overflow
      );

   ---------------------------------------------------------------------------
   -- Adders (pipeline stage 3)
   ---------------------------------------------------------------------------

   -- Calculate sum = x^2 + y^2
   md_gen_add_0 : md_gen_add
      generic map (
         INTEGER_SIZE => RADIUS_SQ_WIDTH
      )
      port map (
         a_in     => x_sq_s3,
         b_in     => y_sq_s3,
         output   => sum,
         overflow => add1_overflow
      );

   -- Calculate r^2 = sum + z^2
   md_gen_add_1 : md_gen_add
      generic map (
         INTEGER_SIZE => RADIUS_SQ_WIDTH
      )
      port map (
         a_in     => sum,
         b_in     => z_sq_s3,
         output   => r_sq_s3,
         overflow => add2_overflow
      );

   ---------------------------------------------------------------------------
   -- Interface to position array and system controller
   ---------------------------------------------------------------------------

   -- Choose particle 1 or 2 and increment
   pid <= pid1 when state = PG_LOAD1 else pid2;
   pa_particle_id <= pid;
   next_pid <= pid + 1;

   -- Check if particle ID 2 has wrapped around to particle 1
   last_pair <= '1' when next_pid = pid1_s1 else '0';

   -- Read from memory when in load state
   pa_read_enable <= '1' when (state = PG_LOAD1 or state = PG_LOAD2) and
                              pa_read_finished = '0' else '0';

   -- Enable input registers when read finished
   en1 <= '1' when pa_read_finished = '1' and state = PG_LOAD1 else '0';
   en2 <= '1' when pa_read_finished = '1' and state = PG_LOAD2 else '0';

   -- Assert finished signal when idle
   sc_finished <= '1' when state = PG_IDLE else '0';

   ---------------------------------------------------------------------------
   -- Overflow and pipeline stall logic, etc.
   ---------------------------------------------------------------------------

   -- Drop particle pair if overflow occurs
   valid_s1_out <= valid_s1_in and not (x_overflow or y_overflow or z_overflow);
   valid_s2_out <= valid_s2_in and not (x_sq_overflow or y_sq_overflow or z_sq_overflow);
   valid_s3_out <= valid_s3_in and not (add1_overflow or add2_overflow);

   -- Stall if data is valid and next stage is stalled
   stall_s4 <= (valid_s4 or last_pair_s4) and not lj_pair_accepted;
   stall_s3 <= (valid_s3_out or last_pair_s3) and stall_s4;
   stall_s2 <= (valid_s2_out or last_pair_s2) and stall_s3;
   stall_s1 <= (valid_s1_out or last_pair_s1) and stall_s2;

   -- Assert pair ready output when valid data in stage 4 and pair not accepted
   lj_pair_ready <= stall_s4;

   -- Output maximum r^2 when data is not valid
   lj_radius_mag_sq <= r_sq_s4 when valid_s4 = '1' else (others => '1');

   -- Highest bit is always zero
   lj_radius_x <= "0" & x_s4;
   lj_radius_y <= "0" & y_s4;
   lj_radius_z <= "0" & z_s4;

   ---------------------------------------------------------------------------
   -- State machine
   ---------------------------------------------------------------------------

   -- State machine register
   process(clk, rst_b)
   begin
      if rst_b = '0' then
         state <= PG_IDLE;
      elsif rising_edge(clk) then
         state <= next_state;
      end if;
   end process;

   -- Next state combinational logic
   process(state, sc_start, pa_read_finished, stall_s1, stall_s2, last_pair, pid1_s1)
   begin
      case state is
         when PG_IDLE =>
            -- Wait for start signal
            if sc_start = '1' then
               -- Check if pipeline stage 1 is stalled
               if stall_s1 = '0' then
                  next_state <= PG_LOAD1;
               else
                  next_state <= PG_STALL1;
               end if;
            else
               next_state <= PG_IDLE;
            end if;

         when PG_LOAD1 =>
            -- Wait for read finished signal
            if pa_read_finished = '1' then
               next_state <= PG_LOAD2;
            else
               next_state <= PG_LOAD1;
            end if;

         when PG_LOAD2 =>
            -- Wait for read finished signal
            if pa_read_finished = '1' then
               -- Check if particle ID 2 has wrapped around to particle 1
               if last_pair = '1' then
                  -- Check if particle ID 1 has reached the end
                  if pid1_s1 = last_pid then
                     next_state <= PG_IDLE;
                  else
                     -- Check if pipeline stage 2 is stalled
                     if stall_s2 = '0' then
                        next_state <= PG_LOAD1;
                     else
                        next_state <= PG_STALL1;
                     end if;
                  end if;
               else
                  -- Check if pipeline stage 2 is stalled
                  if stall_s2 = '0' then
                     next_state <= PG_LOAD2;
                  else
                     next_state <= PG_STALL2;
                  end if;
               end if;
            else
               next_state <= PG_LOAD2;
            end if;

         when PG_STALL1 =>
            -- Check if pipeline stage 1 is still stalled
            if stall_s1 = '0' then
               next_state <= PG_LOAD1;
            else
               next_state <= PG_STALL1;
            end if;

         when PG_STALL2 =>
            -- Check if pipeline stage 1 is still stalled
            if stall_s1 = '0' then
               next_state <= PG_LOAD2;
            else
               next_state <= PG_STALL2;
            end if;

         when others =>
            next_state <= PG_IDLE;

      end case;
   end process;

end rtl;
