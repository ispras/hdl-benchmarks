library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_unsigned.all;
--library synplify;
--use synplify.attributes.all;

 
-------------------------------------------------------------------

ENTITY LJFC_lookup IS

	GENERIC (
		LOG_NUM_PARTICLES : INTEGER := 8;
		
		POS_LSB_LOG : INTEGER := -62;
		POS_WIDTH : INTEGER := 32;

		LOOKUP_WIDTH : INTEGER := 17;
		LOOKUP_OFFSET: INTEGER :=51;

		SLOPE_LSB_LOG : INTEGER := 79;
		SLOPE_WIDTH : INTEGER := 32;

		RESIDUAL_SLOPE_LSB_LOG : INTEGER := -45;
		RESIDUAL_SLOPE_WIDTH : INTEGER :=79;

		FUNCTION_VALUE_LSB_LOG : INTEGER := 18;
		FUNCTION_VALUE_WIDTH : INTEGER := 43;

		ACCEL_LSB_LOG : INTEGER := -12;
		ACCEL_WIDTH : INTEGER := 43
	);
         
	PORT(

		-- Global Signals
		RESET									: IN STD_LOGIC;
		CLK										: IN STD_LOGIC;

		-- Signals between LJFC and PG
		PG_PARTICLE_A, PG_PARTICLE_B	: IN STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0); -- particle id's
		PG_RADIUS_MAG_SQ						: IN STD_LOGIC_VECTOR(2*POS_WIDTH-1 DOWNTO 0); -- r^2
		PG_RAD_X, PG_RAD_Y, PG_RAD_Z	: IN STD_LOGIC_VECTOR(POS_WIDTH-1 DOWNTO 0); -- unsigned delta x, y, z
		PG_force_direction_vector					: IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- this vector says whether the x,y,z deltas

		PG_PAIR_READY									: IN STD_LOGIC; 
		PG_PAIR_ACCEPTED							: OUT STD_LOGIC; 

		-- Signals between LJFC and AU
		AU_ACC_ACCEPTED							: IN STD_LOGIC; -- for the acceleration update handshake
		AU_DATA_VALID								: OUT STD_LOGIC; -- my outputs mean something, hold until I get an accept from the AU block

		AU_PARTICLE_A, AU_PARTICLE_B	: OUT STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0);
 		AU_ACC_X, AU_ACC_Y, AU_ACC_Z	: OUT STD_LOGIC_VECTOR(ACCEL_WIDTH-1 DOWNTO 0);
		AU_force_direction_vector					: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);

		-- Signals between LJFC and LJMC
		LJMC_RADIUS_MAG_SQ_SLOPE		: OUT STD_LOGIC_VECTOR(LOOKUP_WIDTH-1 DOWNTO 0);
		LJMC_SLOPE_READ							: OUT STD_LOGIC;
		LJMC_SLOPE_ACC								: IN STD_LOGIC;
		LJMC_SLOPE										: IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		LJMC_RADIUS_MAG_SQ_VALUE		: OUT STD_LOGIC_VECTOR(LOOKUP_WIDTH-1 DOWNTO 0);				
		LJMC_VALUE_READ							: OUT STD_LOGIC;		
		LJMC_VALUE_ACC								: IN STD_LOGIC;
		LJMC_VALUE										: IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		LJFC_SC_IDLE									: OUT STD_LOGIC
	);
END LJFC_lookup;

-------------------------------------------------------------------

ARCHITECTURE structure OF LJFC_lookup IS

COMPONENT LJFC_register

	GENERIC(
		INTLENGTH : INTEGER := 64
	);
  
	PORT(
		Reset	: IN  STD_LOGIC;	
		D			: IN  STD_LOGIC_VECTOR(INTLENGTH-1  DOWNTO 0);
		Enable	: IN  STD_LOGIC;
		Clk		: IN  STD_LOGIC;
		Q			: OUT STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0)
	);
END COMPONENT;

-------------------------------------------------------------------

COMPONENT multiplier
  
  generic (
    A_width            		: integer := 16;
    A_lsb_log_weight	: integer := 0;
    B_width					: integer := 16;
    B_lsb_log_weight	: integer := 0;
    out_width				: integer := 32;
    out_lsb_log_weight	: integer := 0);

  port (
    A        : in  std_logic_vector(A_width-1 downto 0);
    B        : in  std_logic_vector(B_width-1 downto 0);
    product  : out std_logic_vector(out_width-1 downto 0);
    clk      : in  std_logic;
    areset_b : in  std_logic);

end COMPONENT;


-------------------------------------------------------------------

COMPONENT adder 
  
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

END COMPONENT;


-------------------------------------------------------------------

COMPONENT LJFC_pipeline_controller
	PORT(
		CLK								: IN STD_LOGIC;
		RESET							: IN STD_LOGIC;
		final_valid					: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		pipeline_enable			: OUT STD_LOGIC;
		AU_ACC_ACCEPTED	: IN STD_LOGIC;
		AU_DATA_VALID		: OUT STD_LOGIC
	);
END COMPONENT;

-------------------------------------------------------------------

COMPONENT LJFC_interface
	PORT(
		CLK								: IN STD_LOGIC;
		RESET							: IN STD_LOGIC;
		valid_00						: OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
		input_enable				: OUT STD_LOGIC;
		pipeline_enable			: IN STD_LOGIC;
		value_enable				: OUT STD_LOGIC;
		slope_enable				: OUT STD_LOGIC;
		PG_PAIR_ACCEPTED	: OUT STD_LOGIC;
		LJMC_SLOPE_ACC		: IN STD_LOGIC;
		LJMC_VALUE_ACC		: IN STD_LOGIC;
		PG_PAIR_READY			: IN STD_LOGIC;
		LJMC_SLOPE_READ	: OUT STD_LOGIC;
		LJMC_VALUE_READ	: OUT STD_LOGIC;
		interface_idle				: OUT STD_LOGIC
	);
END COMPONENT;

-------------------------------------------------------------------

SIGNAL nreset : STD_LOGIC;

SIGNAL pipeline_enable : STD_LOGIC;
SIGNAL input_enable : STD_LOGIC;
SIGNAL value_enable : STD_LOGIC;
SIGNAL slope_enable : STD_LOGIC;

SIGNAL cout : STD_LOGIC;

SIGNAL particle_a_00 : STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0);
SIGNAL particle_b_00 : STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0);
SIGNAL particle_a_01 : STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0);
SIGNAL particle_b_01 : STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0);
SIGNAL particle_a_12 : STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0);
SIGNAL particle_b_12 : STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0);
SIGNAL particle_a_23 : STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0);
SIGNAL particle_b_23 : STD_LOGIC_VECTOR(LOG_NUM_PARTICLES-1 DOWNTO 0);

SIGNAL forcedirection_00 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL forcedirection_01 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL forcedirection_12 : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL forcedirection_23 : STD_LOGIC_VECTOR(2 DOWNTO 0);

SIGNAL rx_00 : STD_LOGIC_VECTOR(POS_WIDTH-1 DOWNTO 0);
SIGNAL rx_01 : STD_LOGIC_VECTOR(POS_WIDTH-1 DOWNTO 0);
SIGNAL rx_12 : STD_LOGIC_VECTOR(POS_WIDTH-1 DOWNTO 0);
SIGNAL rx_23 : STD_LOGIC_VECTOR(POS_WIDTH-1 DOWNTO 0);
SIGNAL ry_00 : STD_LOGIC_VECTOR(POS_WIDTH-1 DOWNTO 0);
SIGNAL ry_01 : STD_LOGIC_VECTOR(POS_WIDTH-1 DOWNTO 0);
SIGNAL ry_12 : STD_LOGIC_VECTOR(POS_WIDTH-1 DOWNTO 0);
SIGNAL ry_23 : STD_LOGIC_VECTOR(POS_WIDTH-1 DOWNTO 0);
SIGNAL rz_00 : STD_LOGIC_VECTOR(POS_WIDTH-1 DOWNTO 0);
SIGNAL rz_01 : STD_LOGIC_VECTOR(POS_WIDTH-1 DOWNTO 0);
SIGNAL rz_12 : STD_LOGIC_VECTOR(POS_WIDTH-1 DOWNTO 0);
SIGNAL rz_23 : STD_LOGIC_VECTOR(POS_WIDTH-1 DOWNTO 0);

SIGNAL value_00 : STD_LOGIC_VECTOR(FUNCTION_VALUE_WIDTH-1 DOWNTO 0);
SIGNAL value_01 : STD_LOGIC_VECTOR(FUNCTION_VALUE_WIDTH-1 DOWNTO 0);
SIGNAL value_12 : STD_LOGIC_VECTOR(FUNCTION_VALUE_WIDTH-1 DOWNTO 0);

SIGNAL slope_00 : STD_LOGIC_VECTOR(SLOPE_WIDTH-1 DOWNTO 0);
SIGNAL slope_01 : STD_LOGIC_VECTOR(SLOPE_WIDTH-1 DOWNTO 0);

SIGNAL diff_00 : STD_LOGIC_VECTOR(LOOKUP_OFFSET-1 DOWNTO 0);
SIGNAL diff_01 : STD_LOGIC_VECTOR(LOOKUP_OFFSET-1 DOWNTO 0);

SIGNAL valid_00 : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL valid_01 : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL valid_12 : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL valid_23 : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL final_valid : STD_LOGIC_VECTOR(0 DOWNTO 0);

SIGNAL inc_01 : STD_LOGIC_VECTOR(RESIDUAL_SLOPE_WIDTH -1 DOWNTO 0);
SIGNAL inc_12 : STD_LOGIC_VECTOR(RESIDUAL_SLOPE_WIDTH -1 DOWNTO 0);
SIGNAL total_12 : STD_LOGIC_VECTOR(FUNCTION_VALUE_WIDTH-1 DOWNTO 0);
SIGNAL total_23_x : STD_LOGIC_VECTOR(FUNCTION_VALUE_WIDTH-1 DOWNTO 0);
SIGNAL total_23_y : STD_LOGIC_VECTOR(FUNCTION_VALUE_WIDTH-1 DOWNTO 0);
SIGNAL total_23_z : STD_LOGIC_VECTOR(FUNCTION_VALUE_WIDTH-1 DOWNTO 0);

SIGNAL accx: STD_LOGIC_VECTOR(ACCEL_WIDTH-1 DOWNTO 0);
SIGNAL accy: STD_LOGIC_VECTOR(ACCEL_WIDTH-1 DOWNTO 0);
SIGNAL accz: STD_LOGIC_VECTOR(ACCEL_WIDTH-1 DOWNTO 0);

SIGNAL orvector : STD_LOGIC_VECTOR(2*POS_WIDTH-LOOKUP_OFFSET-LOOKUP_WIDTH DOWNTO 0);
SIGNAL top_order_bits : STD_LOGIC_VECTOR(2*POS_WIDTH-LOOKUP_OFFSET-LOOKUP_WIDTH-1 DOWNTO 0);
SIGNAL internal_lookup_address : STD_LOGIC_VECTOR(LOOKUP_WIDTH-1 DOWNTO 0);
SIGNAL internal_lookup_address_reg : STD_LOGIC_VECTOR(LOOKUP_WIDTH-1 DOWNTO 0);	
SIGNAL cutoff_address : STD_LOGIC_VECTOR(LOOKUP_WIDTH-1 DOWNTO 0);


SIGNAL interface_idle : STD_LOGIC;

-- Attributes added to limit the maximum fanout
-- make sure that Library Synplify is in the header
--attribute syn_maxfan of total_23_x: signal is 20;
--attribute syn_maxfan of total_23_y: signal is 20;
--attribute syn_maxfan of total_23_z: signal is 20;

-------------------------------------------------------------------

BEGIN

	nreset <= NOT RESET;

	LJFC_SC_IDLE <= (interface_idle) AND (not valid_01(0)) AND (not valid_12(0)) AND (not valid_23(0)) AND (not final_valid(0));

	--pipeline stage 0
	part_a0:	LJFC_register GENERIC MAP(LOG_NUM_PARTICLES) PORT MAP(RESET,particle_a_00, pipeline_enable,CLK,particle_a_01);
	part_b0:	LJFC_register GENERIC MAP(LOG_NUM_PARTICLES) PORT MAP(RESET,particle_b_00, pipeline_enable,CLK,particle_b_01);	
	fd0:			LJFC_register GENERIC MAP(3) PORT MAP(RESET,forcedirection_00, pipeline_enable,CLK,forcedirection_01);
	rx0:			LJFC_register GENERIC MAP(POS_WIDTH) PORT MAP(RESET,rx_00, pipeline_enable,CLK,rx_01);
	ry0:			LJFC_register GENERIC MAP(POS_WIDTH) PORT MAP(RESET,ry_00, pipeline_enable,CLK,ry_01);
	rz0:			LJFC_register GENERIC MAP(POS_WIDTH) PORT MAP(RESET,rz_00, pipeline_enable,CLK,rz_01);
	vl0:			LJFC_register GENERIC MAP(FUNCTION_VALUE_WIDTH) PORT MAP(RESET,value_00, pipeline_enable,CLK,value_01);
	slope0:	LJFC_register GENERIC MAP(SLOPE_WIDTH) PORT MAP(RESET,slope_00, pipeline_enable,CLK,slope_01);
	diff0:		LJFC_register GENERIC MAP(LOOKUP_OFFSET) PORT MAP(RESET,diff_00, pipeline_enable,CLK,diff_01);
	vld0:		LJFC_register GENERIC MAP(1) PORT MAP(RESET,valid_00,pipeline_enable,CLK,valid_01);

	--pipeline stage 1
	part_a1:	LJFC_register GENERIC MAP(LOG_NUM_PARTICLES) PORT MAP(RESET,particle_a_01, pipeline_enable,CLK,particle_a_12);
	part_b1:	LJFC_register GENERIC MAP(LOG_NUM_PARTICLES) PORT MAP(RESET,particle_b_01, pipeline_enable,CLK,particle_b_12);	
	fd1:			LJFC_register GENERIC MAP(3) PORT MAP(RESET,forcedirection_01, pipeline_enable,CLK,forcedirection_12);
	rx1:			LJFC_register GENERIC MAP(POS_WIDTH) PORT MAP(RESET,rx_01, pipeline_enable,CLK,rx_12);
	ry1:			LJFC_register GENERIC MAP(POS_WIDTH) PORT MAP(RESET,ry_01, pipeline_enable,CLK,ry_12);
	rz1:			LJFC_register GENERIC MAP(POS_WIDTH) PORT MAP(RESET,rz_01, pipeline_enable,CLK,rz_12);
	vl1:			LJFC_register GENERIC MAP(FUNCTION_VALUE_WIDTH) PORT MAP(RESET,value_01, pipeline_enable,CLK,value_12);
	mult1:		multiplier GENERIC MAP(SLOPE_WIDTH,SLOPE_LSB_LOG,
															 LOOKUP_OFFSET, 2*POS_LSB_LOG,
															 RESIDUAL_SLOPE_WIDTH,RESIDUAL_SLOPE_LSB_LOG)
									PORT MAP(slope_01,diff_01,inc_01,CLK,nreset);
	inc1:		LJFC_register GENERIC MAP(RESIDUAL_SLOPE_WIDTH ) PORT MAP(RESET,inc_01, pipeline_enable,CLK,inc_12);
	vld1:		LJFC_register GENERIC MAP(1) PORT MAP(RESET,valid_01,pipeline_enable,CLK,valid_12);

	--pipeline stage 2
	part_a2:	LJFC_register GENERIC MAP(LOG_NUM_PARTICLES) PORT MAP(RESET,particle_a_12, pipeline_enable,CLK,particle_a_23);
	part_b2:	LJFC_register GENERIC MAP(LOG_NUM_PARTICLES) PORT MAP(RESET,particle_b_12, pipeline_enable,CLK,particle_b_23);	
	fd2:			LJFC_register GENERIC MAP(3) PORT MAP(RESET,forcedirection_12, pipeline_enable,CLK,forcedirection_23);
	rx2:			LJFC_register GENERIC MAP(POS_WIDTH) PORT MAP(RESET,rx_12, pipeline_enable,CLK,rx_23);
	ry2:			LJFC_register GENERIC MAP(POS_WIDTH) PORT MAP(RESET,ry_12, pipeline_enable,CLK,ry_23);
	rz2:			LJFC_register GENERIC MAP(POS_WIDTH) PORT MAP(RESET,rz_12, pipeline_enable,CLK,rz_23);
	addg20: IF FUNCTION_VALUE_LSB_LOG >= RESIDUAL_SLOPE_LSB_LOG GENERATE
		add2:		adder GENERIC MAP(FUNCTION_VALUE_WIDTH,FUNCTION_VALUE_LSB_LOG-RESIDUAL_SLOPE_LSB_LOG,
														RESIDUAL_SLOPE_WIDTH,RESIDUAL_SLOPE_LSB_LOG-RESIDUAL_SLOPE_LSB_LOG,
														FUNCTION_VALUE_WIDTH,FUNCTION_VALUE_LSB_LOG-RESIDUAL_SLOPE_LSB_LOG)
								PORT MAP(value_12,inc_12,total_12,cout);
	END GENERATE;
	addg21: IF FUNCTION_VALUE_LSB_LOG < RESIDUAL_SLOPE_LSB_LOG GENERATE
		add2:		adder GENERIC MAP(FUNCTION_VALUE_WIDTH,FUNCTION_VALUE_LSB_LOG-FUNCTION_VALUE_WIDTH,
														RESIDUAL_SLOPE_WIDTH,RESIDUAL_SLOPE_LSB_LOG-FUNCTION_VALUE_WIDTH,
														FUNCTION_VALUE_WIDTH,FUNCTION_VALUE_LSB_LOG-FUNCTION_VALUE_WIDTH)
								PORT MAP(value_12,inc_12,total_12,cout);
	END GENERATE;	
	total2_x:	LJFC_register GENERIC MAP(FUNCTION_VALUE_WIDTH) PORT MAP(RESET,total_12,pipeline_enable,CLK,total_23_x);
	total2_y:	LJFC_register GENERIC MAP(FUNCTION_VALUE_WIDTH) PORT MAP(RESET,total_12,pipeline_enable,CLK,total_23_y);
	total2_z:	LJFC_register GENERIC MAP(FUNCTION_VALUE_WIDTH) PORT MAP(RESET,total_12,pipeline_enable,CLK,total_23_z);
	vld2:		LJFC_register GENERIC MAP(1) PORT MAP(RESET,valid_12,pipeline_enable,CLK,valid_23);

	--pipeline stage 3 (Also Output Stage)
	part_a3:	LJFC_register GENERIC MAP(LOG_NUM_PARTICLES) PORT MAP(RESET,particle_a_23, pipeline_enable,CLK,AU_PARTICLE_A);
	part_b3:	LJFC_register GENERIC MAP(LOG_NUM_PARTICLES) PORT MAP(RESET,particle_b_23, pipeline_enable,CLK,AU_PARTICLE_B);	
	fd3:			LJFC_register GENERIC MAP(3) PORT MAP(RESET,forcedirection_23, pipeline_enable,CLK,AU_force_direction_vector);
	mult3_1:	multiplier GENERIC MAP(FUNCTION_VALUE_WIDTH, FUNCTION_VALUE_LSB_LOG,
															POS_WIDTH, POS_LSB_LOG,
															ACCEL_WIDTH,ACCEL_LSB_LOG)
									PORT MAP(total_23_x,rx_23,accx,CLK, nreset);
	accxr:		LJFC_register GENERIC MAP(ACCEL_WIDTH) PORT MAP(RESET,accx,pipeline_enable,CLK,AU_ACC_X);
	mult3_2:	multiplier GENERIC MAP(FUNCTION_VALUE_WIDTH, FUNCTION_VALUE_LSB_LOG,
															POS_WIDTH, POS_LSB_LOG,
															ACCEL_WIDTH,ACCEL_LSB_LOG)
									PORT MAP(total_23_y,ry_23,accy,CLK, nreset);
	accyr:		LJFC_register GENERIC MAP(ACCEL_WIDTH) PORT MAP(RESET,accy,pipeline_enable,CLK,AU_ACC_Y);									
	mult3_3:	multiplier GENERIC MAP(FUNCTION_VALUE_WIDTH, FUNCTION_VALUE_LSB_LOG,
															POS_WIDTH, POS_LSB_LOG,
															ACCEL_WIDTH,ACCEL_LSB_LOG)
									PORT MAP(total_23_z,rz_23,accz,CLK, nreset);
	acczr:		LJFC_register GENERIC MAP(ACCEL_WIDTH) PORT MAP(RESET,accz,pipeline_enable,CLK,AU_ACC_Z);									
	vld3:		LJFC_register GENERIC MAP(1) PORT MAP(RESET,valid_23,pipeline_enable,CLK,final_valid);

	-- pipeline controller
	pp_con0: LJFC_pipeline_controller PORT MAP (CLK,RESET,valid_23,pipeline_enable,AU_ACC_ACCEPTED,AU_DATA_VALID);
	
	-- input/memory interface
	interface0: LJFC_interface PORT MAP (CLK,RESET,valid_00,input_enable,pipeline_enable,value_enable,slope_enable,PG_PAIR_ACCEPTED,LJMC_SLOPE_ACC,LJMC_VALUE_ACC,PG_PAIR_READY,LJMC_SLOPE_READ, LJMC_VALUE_READ,interface_idle);

	------------------------------------------------------------------------------------
	-- datapath for sending lookup value to LJMC, if any of top order bits are one will send all 1's, else send LOOKUP_WIDTH from the middle

	-- first find top order bits
	top_order_bits <= PG_RADIUS_MAG_SQ(2*POS_WIDTH-1 DOWNTO LOOKUP_OFFSET+LOOKUP_WIDTH);

	-- hack to or all bits in top_order_bits
	orvector(0) <= '0';
	bigor: FOR i IN 0 TO 2*POS_WIDTH-LOOKUP_OFFSET-LOOKUP_WIDTH-1 GENERATE
		orvector(i+1) <= orvector(i) OR top_order_bits(i);
	END GENERATE;

	--hack to create cutoff address, one less than all 1's because SRAM address at all 1's gets overwritten
	cutoff_address(LOOKUP_WIDTH-1 DOWNTO 1) <= (OTHERS => '1');
	cutoff_address(0) <= '0';

	-- if all zeros in top order bits pass through lower order bits, otherwise send all 1's
	WITH orvector(2*POS_WIDTH-LOOKUP_OFFSET-LOOKUP_WIDTH)  SELECT
		internal_lookup_address <= 	PG_RADIUS_MAG_SQ(LOOKUP_OFFSET+LOOKUP_WIDTH -1 DOWNTO LOOKUP_OFFSET) WHEN '0',
														cutoff_address WHEN OTHERS;


	-- register the value that we are looking up on
	lookupreg0 : LJFC_register GENERIC MAP(LOOKUP_WIDTH) PORT MAP(RESET,internal_lookup_address,input_enable,CLK,internal_lookup_address_reg);

	-- Pass the registered value to the LJ Memory Controllers
	LJMC_RADIUS_MAG_SQ_SLOPE <= internal_lookup_address_reg;
	LJMC_RADIUS_MAG_SQ_VALUE <= internal_lookup_address_reg;
	------------------------------------------------------------------------------------
	

	--store info from PG temporarily until it goes into the pipeline
	part_a:	LJFC_register GENERIC MAP(LOG_NUM_PARTICLES) PORT MAP(RESET,PG_PARTICLE_A, input_enable,CLK,particle_a_00);
	part_b:	LJFC_register GENERIC MAP(LOG_NUM_PARTICLES) PORT MAP(RESET,PG_PARTICLE_B, input_enable,CLK,particle_b_00);	
	fd:			LJFC_register GENERIC MAP(3) PORT MAP(RESET,PG_force_direction_vector, input_enable,CLK,forcedirection_00);
	rx:			LJFC_register GENERIC MAP(POS_WIDTH) PORT MAP(RESET,PG_RAD_X, input_enable,CLK,rx_00);
	ry:			LJFC_register GENERIC MAP(POS_WIDTH) PORT MAP(RESET,PG_RAD_Y, input_enable,CLK,ry_00);
	rz:			LJFC_register GENERIC MAP(POS_WIDTH) PORT MAP(RESET,PG_RAD_Z, input_enable,CLK,rz_00);
	diff:			LJFC_register GENERIC MAP(LOOKUP_OFFSET) PORT MAP(RESET,PG_RADIUS_MAG_SQ(LOOKUP_OFFSET-1 DOWNTO 0), input_enable,CLK,diff_00);

	--store info from LJMC temporarily until it goes into the pipleine
	value:		LJFC_register GENERIC MAP(FUNCTION_VALUE_WIDTH) PORT MAP(RESET,LJMC_VALUE(FUNCTION_VALUE_WIDTH-1 DOWNTO 0), value_enable,CLK,value_00);
	slope:		LJFC_register GENERIC MAP(SLOPE_WIDTH) PORT MAP(RESET,LJMC_SLOPE(SLOPE_WIDTH-1 DOWNTO 0), slope_enable,CLK,slope_00);
	

END structure;
