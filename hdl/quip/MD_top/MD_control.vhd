library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

ENTITY MD_control IS

	GENERIC (
		INTLENGTH : INTEGER := 24
	);

	PORT(
		clk						: IN STD_LOGIC;
		reset						: IN STD_LOGIC;
		stall						: IN STD_LOGIC;
		done						: OUT STD_LOGIC;
		AU_SC_idle					: IN STD_LOGIC;
		LJFC_SC_overflow				: IN STD_LOGIC;
		LJFC_SC_idle					: IN STD_LOGIC;
		VU_SC_PASS_COMPLETE				: IN STD_LOGIC;
		VU_SC_WRITE_PARTICLE				: IN STD_LOGIC;
		PG_SC_finished					: IN STD_LOGIC;
		SC_VU_START					: OUT STD_LOGIC;
		SC_MC_switch_bank				: OUT STD_LOGIC;
		SC_PG_start					: OUT STD_LOGIC;
		SC_VU_dt					: OUT STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		SC_VU_k						: OUT STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		SC_VU_k_dt					: OUT STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
		time_counter					: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END MD_control;

ARCHITECTURE behaviour OF MD_control IS

-------------------------------------------------------------------

COMPONENT MD_T_flip_flop 

  PORT(
    Reset  : in  std_logic;
    T      : in  std_logic;
    Q      : out  std_logic;
    Clk    : in  std_logic);
    
END COMPONENT;

COMPONENT MD_counter

	GENERIC(
		INTLENGTH : INTEGER := 64
	);
  
	PORT(
		Reset	: IN  STD_LOGIC;
		Enable	: IN  STD_LOGIC;
		Clk	: IN  STD_LOGIC;
		Q	: OUT STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0)
	);
END COMPONENT;


COMPONENT MD_flip_flop 

  port(
    Reset  : in  std_logic;
    D      : in  std_logic;
    Q      : out  std_logic;
    Clk    : in  std_logic);
    
end COMPONENT;
-------------------------------------------------------------------

	TYPE State_type IS (A,B,B_half,C,F,G,J);
	SIGNAL y : State_type;

	SIGNAL time_counter_enable : STD_LOGIC;
	SIGNAL high : STD_LOGIC;
	SIGNAL switch_bank : STD_LOGIC;

	SIGNAL check_idle_time_counter_reset : STD_LOGIC;
	SIGNAL check_idle_time_counter : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL num_particles_passed : STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
	SIGNAL max_particles : STD_LOGIC_VECTOR(INTLENGTH-1 DOWNTO 0);
	SIGNAL PG_start : STD_LOGIC;
	SIGNAL transition: STD_LOGIC;
	SIGNAL VU_SC_WRITE_PARTICLE_reg: STD_LOGIC;
	SIGNAL T : STD_LOGIC;
-------------------------------------------------------------------
 	
BEGIN



	t0: MD_T_flip_flop port map(reset,T,switch_bank,clk);

	SC_VU_dt <= (OTHERS => '1');
	SC_VU_k_dt <= (OTHERS => '1');
	SC_VU_k <= (OTHERS => '1');
	high <= '1';
	SC_MC_switch_bank <= switch_bank;
	SC_PG_start <= PG_start;
	max_particles <= (OTHERS => '0');

	transition <= VU_SC_WRITE_PARTICLE AND (NOT VU_SC_WRITE_PARTICLE_reg);
	ff0: MD_flip_flop PORT MAP(reset,VU_SC_WRITE_PARTICLE,VU_SC_WRITE_PARTICLE_reg,clk);

	pc0: MD_counter GENERIC MAP(INTLENGTH) PORT MAP(PG_start,transition,clk,num_particles_passed);
	lc0: MD_counter GENERIC MAP(4) PORT MAP(check_idle_time_counter_reset, high,clk,check_idle_time_counter);
	tc0: MD_counter GENERIC MAP(time_counter'length) PORT MAP(reset,time_counter_enable,clk,time_counter);
	

	PROCESS(y)
	BEGIN
			Case y IS

				-- Idle
				WHEN A =>

					done			<= '0';
					SC_VU_START		<= '0';
					T		<= '0';
					PG_start		<= '0';
					time_counter_enable	<= '0';
					check_idle_time_counter_reset <= '0';


				-- start the PG
				WHEN B=>

					done			<= '0';
					SC_VU_START		<= '0';
					T		<= '0';
					PG_start		<= '1';
					time_counter_enable	<= '0';					
					check_idle_time_counter_reset <= '0';

				-- Wait one clock cycle before waiting for idles to be safe
				WHEN B_half =>

					done			<='0';
					T		<='0';
					PG_start    		<= '0';
					time_counter_enable     <= '0';
					check_idle_time_counter_reset <= '0';

				-- Wait for PG, LJFC, AU to finish
				WHEN C=>
					done			<= '0';
					SC_VU_START		<= '0';
					T		<= '0';
					PG_start		<= '0';
					time_counter_enable	<= '0';					
					check_idle_time_counter_reset <= '1';					
		
				-- Update Counter, output done
				WHEN F=>

					done			<= '0';
					SC_VU_START		<= '0';
					T		<= '1';
					PG_start		<= '0';
					time_counter_enable	<= '1';
					check_idle_time_counter_reset <= '0';					


				-- Wait a little bit to see if SUN reponds
				-- not doing this state
				WHEN G=>

					done			<= '0';
					SC_VU_START		<= '0';
					T		<= '0';
					PG_start		<= '0';
					time_counter_enable	<= '0';
					check_idle_time_counter_reset <= '0';					



			-- Wait until SUN is finished
			WHEN J=>

					done			<= '1';
					SC_VU_START		<= '0';
					T		<= '0';
					PG_start		<= '0';
					time_counter_enable	<= '0';
					check_idle_time_counter_reset <= '0';
					
			END CASE;						
	END PROCESS;

	PROCESS(reset, clk)
	BEGIN
--		switch_bank <= '0';--commented out by ICK
		
		IF reset = '1' THEN
			y <= A;
		ELSIF (clk'EVENT and clk='1') THEN
			Case y IS

				-- Idle
				WHEN A =>

					IF stall = '1' THEN
						y <= A;
					ELSE
						y <= B;
					END IF;

				-- start the PG
				WHEN B=>
					y <= B_half;

				-- Wait one clock cycle before waiting for idles to be safe
				WHEN B_half =>

					y <= C;

				-- Wait for PG, LJFC, AU to finish
				WHEN C=>
					IF num_particles_passed = max_particles AND AU_SC_idle = '1' AND PG_SC_finished = '1' AND VU_SC_PASS_COMPLETE ='1' AND LJFC_SC_idle ='1' THEN
						y <= G;
					ELSE
						y <= C;
					END IF;

		
				-- Update Counter, output done
				WHEN F=>


					y <= J;


				-- Wait a little bit to see if all idle stays on
				WHEN G=>

						IF check_idle_time_counter = "1111" THEN
							IF AU_SC_idle = '1' AND PG_SC_finished = '1' AND VU_SC_PASS_COMPLETE ='1' AND LJFC_SC_idle ='1' THEN
								y <= F; -- really finished pass
							ELSE
								y <= C; -- not really finished go back to wait state
							END IF;
						ELSE
							IF AU_SC_idle = '1' AND PG_SC_finished = '1' AND VU_SC_PASS_COMPLETE ='1' AND LJFC_SC_idle ='1' THEN
								y <= G; --ok, good still all idle, keep the counter couting to check that they are all idle
							ELSE
								y <= C; -- not really finished go back to wait State_type
							END IF;
						END IF;
							

			-- Wait until SUN is finished
			WHEN J=>
					IF stall = '1' THEN
						y <= J; -- stay here
					ELSE
						y <= B;  -- start the PG again
					END IF;
					
			END CASE;						
		END IF;
	END PROCESS;
END behaviour;
