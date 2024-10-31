library IEEE;
use IEEE.std_logic_1164.all;

ENTITY LJFC_pipeline_controller IS
	PORT(
		clk								: IN STD_LOGIC;
		reset							: IN STD_LOGIC;
		final_valid					: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		pipeline_enable			: OUT STD_LOGIC;
		AU_ACC_ACCEPTED	: IN STD_LOGIC;
		AU_DATA_VALID		: OUT STD_LOGIC
	);
END LJFC_pipeline_controller;


-------------------------------------------------------------------

ARCHITECTURE behaviour OF LJFC_pipeline_controller IS

	TYPE State_type IS (A,B);
	SIGNAL y : State_type;
	

-------------------------------------------------------------------
	
BEGIN

	control_gen : PROCESS (y)
	BEGIN  -- process control_gen
		CASE y IS
			WHEN A =>

				pipeline_enable <= '1';
				AU_DATA_VALID <= '0';

			WHEN B =>

				pipeline_enable <= '0';
				AU_DATA_VALID <= '1';

		END CASE;
	END PROCESS;

	PROCESS(reset, clk)
	BEGIN
		IF reset = '1' THEN
			y <= A;

		ELSIF (clk'EVENT and clk='1') THEN
			Case y IS

				-- Pipeline is advancing
				WHEN A =>

					IF final_valid = "0" THEN
						y <= A;
					ELSE
						y <= B;
					END IF;

				-- Pipeline stalled, waiting for AU ack
				WHEN B=>

					IF AU_ACC_ACCEPTED = '0' THEN
						y <= B;  -- stay here until ack received
					ELSE
						y <= A;  -- pipeline can advance
					END IF;					

			END CASE;						
		END IF;
	END PROCESS;
END behaviour;
