library IEEE;
use IEEE.std_logic_1164.all;


ENTITY LJFC_interface IS
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
END LJFC_interface;

-------------------------------------------------------------------

ARCHITECTURE behaviour OF LJFC_interface IS

	TYPE State_type IS (A,Ahalf,B,C,D,E,F,G, I,J);
	SIGNAL y : State_type;
	

-------------------------------------------------------------------
	
BEGIN

	control_gen : PROCESS (y)
	BEGIN  -- process control_gen
		CASE y IS
	
	    	WHEN A =>

				valid_00			 			<= "0";
				input_enable				<= '1';
				value_enable				<= '0';
				slope_enable				<= '0';
				PG_PAIR_ACCEPTED	<= '0';
				LJMC_SLOPE_READ	<= '0';
				LJMC_VALUE_READ	<= '0';
				interface_idle				<= '1';

			WHEN Ahalf =>

				valid_00			 			<= "0";
				input_enable				<= '0';
				value_enable				<= '0';
				slope_enable				<= '0';
				PG_PAIR_ACCEPTED	<= '1';
				LJMC_SLOPE_READ	<= '1';
				LJMC_VALUE_READ	<= '1';				
				interface_idle				<= '0';
			
    		WHEN B =>

				valid_00				 		<= "0";
				input_enable				<= '0';
				value_enable				<= '1';
				slope_enable				<= '1';
				PG_PAIR_ACCEPTED	<= '0';
				LJMC_SLOPE_READ	<= '1';
				LJMC_VALUE_READ	<= '1';	
				interface_idle				<= '0';
    		

    		WHEN C =>

				valid_00				 		<= "0";
				input_enable				<= '0';
				value_enable				<= '0';
				slope_enable				<= '1';
				PG_PAIR_ACCEPTED	<= '0';
				LJMC_SLOPE_READ	<= '1';
				LJMC_VALUE_READ	<= '0';
				interface_idle				<= '0';

	    	WHEN D =>

				valid_00				 		<= "0";
				input_enable				<= '0';
				value_enable				<= '1';
				slope_enable				<= '0';
				PG_PAIR_ACCEPTED	<= '0';	    	
				LJMC_SLOPE_READ	<= '0';
				LJMC_VALUE_READ	<= '1';	
				interface_idle				<= '0';

    		WHEN E =>

				valid_00				 		<= "0";
				input_enable				<= '0';
				value_enable				<= '0';
				slope_enable				<= '0';
				PG_PAIR_ACCEPTED	<= '0';
				LJMC_SLOPE_READ	<= '0';
				LJMC_VALUE_READ	<= '0';
				interface_idle				<= '0';

    		WHEN F =>

				valid_00						<= "1";
				input_enable				<= '0';
				value_enable				<= '0';
				slope_enable				<= '0';
				PG_PAIR_ACCEPTED	<= '0';    		
				LJMC_SLOPE_READ	<= '0';
				LJMC_VALUE_READ	<= '0';
				interface_idle				<= '0';


	    	WHEN G =>

				valid_00						<= "0";
				input_enable				<= '0';
				value_enable				<= '0';
				slope_enable				<= '0';
				PG_PAIR_ACCEPTED	<= '0';
				LJMC_SLOPE_READ	<= '0';
				LJMC_VALUE_READ	<= '0';
				interface_idle				<= '0';
				

    		WHEN I =>

				valid_00						<= "1";
				input_enable				<= '0';
				value_enable				<= '0';
				slope_enable				<= '0';
				PG_PAIR_ACCEPTED	<= '0';    		
				LJMC_SLOPE_READ	<= '0';
				LJMC_VALUE_READ	<= '0';
				interface_idle				<= '0';

    		WHEN J =>

				valid_00						<= "1";
				input_enable				<= '0';
				value_enable				<= '0';
				slope_enable				<= '0';
				PG_PAIR_ACCEPTED	<= '0';    		
				LJMC_SLOPE_READ	<= '0';
				LJMC_VALUE_READ	<= '0';
				interface_idle				<= '0';
				

    	END CASE;
    END PROCESS;


	PROCESS(reset, clk)
	BEGIN
		IF reset = '1' THEN
			y <= A;

		ELSIF (clk'EVENT and clk='1') THEN
			Case y IS

				-- Idle
				WHEN A =>

					IF PG_PAIR_READY = '1' THEN
						y <= Ahalf; 
					ELSE
						y <= A; -- if no pair stay in idle
					END IF;

				-- State to send read requests to LJMC
				WHEN Ahalf =>
						y <= B;

				-- waiting for acks back from LJMC
				WHEN B=>

					-- received both acks and pipeline is stalled, go into another wait stage
					IF LJMC_SLOPE_ACC	= '1' AND LJMC_VALUE_ACC	= '1' AND pipeline_enable = '0' THEN
						y <= E;

					-- recevied both acks and pipeline is going, go into the pipeline stage
					ELSIF LJMC_SLOPE_ACC	= '1' AND LJMC_VALUE_ACC	= '1' THEN
						y <= F;

					-- received one ack, wait for the other
					ELSIF LJMC_SLOPE_ACC	= '1' THEN
						y <= D;

					-- received one ack, wait for the other						
					ELSIF LJMC_VALUE_ACC	= '1' THEN
						y <= C;

					-- wait here
					ELSE
						y <= B;
					END IF;


				-- waiting for ack for slope
				WHEN C=>

					-- received both acks and pipeline is stalled, go into another wait stage
					IF LJMC_SLOPE_ACC	= '1' AND pipeline_enable = '0' THEN
						y <= E;

					-- recevied both acks and pipeline is going, go into the pipeline stage
					ELSIF LJMC_SLOPE_ACC	= '1' THEN
						y <= F;

					-- wait here
					ELSE
						y <= C;
					END IF;


				-- waiting for ack for value
				WHEN D=>

					-- received both acks and pipeline is stalled, go into another wait stage
					IF LJMC_VALUE_ACC = '1' AND pipeline_enable = '0' THEN
						y <= E;

					-- recevied both acks and pipeline is going, go into the pipeline stage
					ELSIF LJMC_VALUE_ACC = '1' THEN
						y <= F;

					-- wait here
					ELSE
						y <= D;
					END IF;

				-- Waiting for pipeline to start, but give back ack to PG
				WHEN E=>

					y <= G; -- go to state waiting for pipeline to start

				-- Give back ack to PG
				WHEN F=>

					IF pipeline_enable = '0' THEN
						y <= J;  -- should not remove valid just yet, so go to new state
					ELSE
						y <= A; -- go back to idle
					END IF;

				WHEN G=>

					IF pipeline_enable = '1' THEN
						y <= I; -- go to state to set valid for pipeline
					ELSE
						y <= G;
					END IF;

				WHEN I=>

					y <= A; -- go back to idle

				WHEN J=>

					IF pipeline_enable = '0' THEN
						y <= J;
					ELSE
						y <= A;
					END IF;
					

					
			END CASE;						
		END IF;
	END PROCESS;
END behaviour;
					
					
			
