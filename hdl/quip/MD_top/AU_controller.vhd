library IEEE;
use IEEE.std_logic_1164.all;


ENTITY AU_controller IS
	PORT(
		reset									: IN STD_LOGIC;
		CLK										: IN STD_LOGIC;
		cachetag								: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		
		LJFC_ACC_READY				: IN STD_LOGIC;
		LJFC_ACC_ACCEPTED		: OUT STD_LOGIC;

		VU_WRITE_COMPLETE		: IN STD_LOGIC;		
		AA_WRITE_COMPLETE		: IN STD_LOGIC;

		AA_READ_ENABLE				: OUT STD_LOGIC;
		VU_WRITE_ENABLE			: OUT STD_LOGIC;
		AA_WRITE_ENABLE			: OUT STD_LOGIC;
		
		SC_AU_IDLE						: OUT STD_LOGIC;

		delta_enable						: OUT STD_LOGIC;
		write_enable						: OUT STD_LOGIC;
		cache_enable						: OUT STD_LOGIC;
		cachetag_enable					: OUT STD_LOGIC;
		old_part_a_enable				: OUT STD_LOGIC;
		add_input_a_sel					: OUT STD_LOGIC;
		add_input_b_sel					: OUT STD_LOGIC;		
		LJFC_idle								: IN STD_LOGIC;
		PG_idle								: IN STD_LOGIC

	);
END AU_controller;

-------------------------------------------------------------------

ARCHITECTURE behaviour OF AU_controller IS

	TYPE State_type IS (A,A2,B,C,C2,D,E,F);
	SIGNAL y : State_type;
	

-------------------------------------------------------------------
	
BEGIN

	PROCESS(y)
	BEGIN
		CASE y IS
			WHEN A =>
			
					SC_AU_IDLE		<= '0'; 
					LJFC_ACC_ACCEPTED	<= '0';
					AA_WRITE_ENABLE		<= '0';
					VU_WRITE_ENABLE		<= '0';
					AA_READ_ENABLE		<= '0';
					delta_enable		<= '1';  -- read in values from LJFC
					write_enable		<= '0';
					cache_enable		<= '0';
					cachetag_enable		<= '1';  -- compare old A with new A and store bit
					old_part_a_enable	<= '0';
					add_input_a_sel		<= '0';
					add_input_b_sel				<= '0';

			-- A2 same as A, except idle signal up
			WHEN A2 =>
			
					SC_AU_IDLE		<= '1';  -- we're idling
					LJFC_ACC_ACCEPTED	<= '0';
					AA_WRITE_ENABLE		<= '0';
					VU_WRITE_ENABLE		<= '0';
					AA_READ_ENABLE		<= '0';
					delta_enable		<= '1';  -- read in values from LJFC
					write_enable		<= '0';
					cache_enable		<= '0';
					cachetag_enable		<= '1';  -- compare old A with new A and store bit
					old_part_a_enable	<= '1'; -- be sure not redoing write
					add_input_a_sel		<= '0';			
					add_input_b_sel				<= '0';
			
			WHEN B =>
			
					SC_AU_IDLE					<= '0';
					LJFC_ACC_ACCEPTED	<= '1';  -- tell the LJFC that we're done
					AA_WRITE_ENABLE		<= '0';
					VU_WRITE_ENABLE		<= '0';					
					AA_READ_ENABLE			<= '0'; 
					delta_enable					<= '0';
					write_enable					<= '1';	 -- write the cache value into the write registers
					cache_enable					<= '1';  -- perform an accumulation
					cachetag_enable				<= '0';
					old_part_a_enable			<= '0';
					add_input_a_sel				<= '0';   -- use the data from the cache as input to ALU
					add_input_b_sel				<= '0';

			WHEN C =>
			
					SC_AU_IDLE					<= '0';
					LJFC_ACC_ACCEPTED	<= '0';
					AA_WRITE_ENABLE		<= '1';  -- ask the AA for a write
					VU_WRITE_ENABLE		<= '1';					
					AA_READ_ENABLE			<= '0';
					delta_enable					<= '0';
					write_enable					<= '0';
					cache_enable					<= '1';  -- store new acceleration for A in cache
					cachetag_enable				<= '0';
					old_part_a_enable			<= '0';
					add_input_a_sel				<= '1';    -- use zero as input to the adder adder
					add_input_b_sel				<= '0';

			WHEN C2 =>
			
					SC_AU_IDLE					<= '0';
					LJFC_ACC_ACCEPTED	<= '0';
					AA_WRITE_ENABLE		<= '1';  -- ask the AA for a write
					VU_WRITE_ENABLE		<= '1';					
					AA_READ_ENABLE			<= '0';
					delta_enable					<= '0';
					write_enable					<= '0';
					cache_enable					<= '1';  -- store new acceleration for A in cache
					cachetag_enable				<= '0';
					old_part_a_enable			<= '0';
					add_input_a_sel				<= '1';    -- use zero as input to the adder adder
					add_input_b_sel				<= '1';    -- use zero as input to the adder adder
			
			
			WHEN D =>
			
					SC_AU_IDLE					<= '0';
					LJFC_ACC_ACCEPTED	<= '0';
					AA_WRITE_ENABLE		<= '1';  -- maybe this should stay on
					VU_WRITE_ENABLE		<= '1';
					AA_READ_ENABLE			<= '0';
					delta_enable					<= '0';
					write_enable					<= '0';
					cache_enable					<= '0';
					cachetag_enable				<= '0';
					old_part_a_enable			<= '1';    -- put the new A address in the old A for next time
					add_input_a_sel				<= '0';
					add_input_b_sel				<= '0';			
			
			WHEN E =>
			
					SC_AU_IDLE					<= '0';
					LJFC_ACC_ACCEPTED	<= '0';
					AA_WRITE_ENABLE		<= '0';  
					VU_WRITE_ENABLE		<= '1';
					AA_READ_ENABLE			<= '0';
					delta_enable					<= '0';
					write_enable					<= '0';
					cache_enable					<= '0';
					cachetag_enable				<= '0';
					old_part_a_enable			<= '0';   
					add_input_a_sel				<= '0';
					add_input_b_sel				<= '0';			
			
			WHEN F =>
			
					SC_AU_IDLE					<= '0';
					LJFC_ACC_ACCEPTED	<= '0';
					AA_WRITE_ENABLE		<= '1';  
					VU_WRITE_ENABLE		<= '0';					
					AA_READ_ENABLE			<= '0';
					delta_enable					<= '0';
					write_enable					<= '0';
					cache_enable					<= '0';
					cachetag_enable				<= '0';
					old_part_a_enable			<= '0';   
					add_input_a_sel				<= '0';
					add_input_b_sel				<= '0';					
			
			
		END CASE;
	END PROCESS;
	


	PROCESS(reset, clk)
	BEGIN
		IF reset = '1' THEN
			y <= A2;
		ELSIF (clk'EVENT and clk='1') THEN 
			Case y IS

				-- Idle (but not outputting idle)
				WHEN A =>


					IF LJFC_ACC_READY = '1' THEN
						y <= B;
					ELSIF PG_idle = '1' AND LJFC_idle = '1' THEN
						y <= C2;  -- everything has finished, write back final particle
					ELSE
						y <= A;
					END IF;

				-- Idle
				WHEN A2 =>


					IF LJFC_ACC_READY = '1' THEN
						y <= B;
					ELSE
						y <= A2;
					END IF;


				-- Get ready for write of oldA if need be and do an accumulation
				WHEN B=>

					IF cachetag = "0" THEN
						y <= C;  -- must store old value
					ELSE
						y <= A;  -- finished go back to idle (but not after cache miss)
					END IF;				



				-- Start write for oldA
				WHEN C=>

					y <= D;

				-- Start write for oldA
				WHEN C2=>

					y <= D;
					

				-- Continue writing for oldA
				WHEN D=>


					IF AA_WRITE_COMPLETE = '1' AND VU_WRITE_COMPLETE = '1' THEN
						y <= A2;  -- go back to idle
					ELSIF AA_WRITE_COMPLETE = '1' THEN
						y <= E;
					ELSIF VU_WRITE_COMPLETE = '1' THEN
						y <= F;
					ELSE
						y <= D;  -- stay here
					END IF;					

				-- Continue writing for oldA (wait for VU feedback)
				WHEN E=>


					IF VU_WRITE_COMPLETE = '1' THEN
						y <= A2; -- go back to idle
					ELSE
						y <= E;  -- stay here
					END IF;					

				-- Continue writing for oldA (wait for AA feedback)
				WHEN F=>


					IF AA_WRITE_COMPLETE = '1' THEN
						y <= A2; -- go back to idle
					ELSE
						y <= F;  -- stay here
					END IF;					

					
			END CASE;						
		END IF;
	END PROCESS;
END behaviour;
					
					
			
