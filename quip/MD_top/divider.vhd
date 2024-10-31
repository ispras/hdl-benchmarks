LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all ;

-- This doesn't work in Quartus for some reason
--LIBRARY work;
--USE work.components.all;

ENTITY divider IS
	GENERIC ( N : INTEGER := 8 ) ;
	PORT (	Clock		: IN 		STD_LOGIC ;
			Resetn 		: IN 		STD_LOGIC ;
			s, LA, EB 	: IN 		STD_LOGIC ;
			DataA 		: IN 		STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			DataB 		: IN 		STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			R, Q 		: BUFFER 	STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
			Done 		: OUT 		STD_LOGIC ) ;
END divider ;

ARCHITECTURE Behavior OF divider IS
	TYPE State_type IS ( S1, S2, S3 ) ;
	SIGNAL y : State_type ;
	SIGNAL Zero, Cout, z : STD_LOGIC ;
	SIGNAL EA, Rsel, LR, ER, ER0, LC, EC, R0 : STD_LOGIC ;
	SIGNAL A, B, DataR : STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
	SIGNAL Sum : STD_LOGIC_VECTOR(N DOWNTO 0) ;	-- adder outputs
	CONSTANT zero_Sum_vec : STD_LOGIC_VECTOR(N-1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL Count : INTEGER RANGE 0 TO N-1 ;	

		-- D flip-flop with 2-to-1 multiplexer connected to D
	COMPONENT muxdff
		PORT (	D0, D1, Sel, Clock 	: IN 	STD_LOGIC ;
				Q 					: OUT 	STD_LOGIC );
	END COMPONENT ;

	-- n-bit register with enable
	COMPONENT regne  
		GENERIC ( N : INTEGER := 4 ) ;
		PORT (	R 			: IN 	STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
				Resetn 		: IN 	STD_LOGIC ;
				E, Clock 	: IN 	STD_LOGIC ;
				Q 			: OUT 	STD_LOGIC_VECTOR(N-1 DOWNTO 0) ) ;
	END COMPONENT ;

	-- n-bit right-to-left shift register with parallel load and enable
	COMPONENT shiftlne  
		GENERIC ( N : INTEGER := 4 ) ;
		PORT (	R 			: IN 		STD_LOGIC_VECTOR(N-1 DOWNTO 0) ;
				L, E, w		: IN 		STD_LOGIC ;
				Clock		: IN 		STD_LOGIC ;
				Q 			: BUFFER 	STD_LOGIC_VECTOR(N-1 DOWNTO 0) ) ;
	END COMPONENT ;

	-- down-counter that counts from modulus-1 down to 0
	COMPONENT downcnt 
		GENERIC	( modulus : INTEGER := 8 ) ;
		PORT (	Clock, E, L	: IN 		STD_LOGIC ;
				Q 			: OUT 	INTEGER RANGE 0 TO modulus-1 ) ;
	END COMPONENT ;

BEGIN
	FSM_transitions: PROCESS ( Resetn, Clock )
	BEGIN
		IF Resetn = '0' THEN y <= S1 ;
		ELSIF (Clock'EVENT AND Clock = '1') THEN
			CASE y IS
				WHEN S1 =>
					IF s = '0' THEN	y <= S1 ; ELSE y <= S2 ; END IF ;
				WHEN S2 =>
					IF z = '0' THEN y <= S2 ; ELSE y <= S3 ; END IF ;
				WHEN S3 =>
					IF s = '1' THEN y <= S3 ; ELSE y <= S1 ; END IF ;
			END CASE ;
		END IF ;
	END PROCESS ;

	FSM_outputs: PROCESS ( s, y, Cout, z, LA )
	BEGIN
		LR <= '0' ; ER <= '0' ; ER0 <= '0' ;
		LC <= '0' ; EC <= '0' ; EA <= '0' ; Done <= '0' ;
		Rsel <= '0' ;
		CASE y IS
			WHEN S1 =>
				LC <= '1' ;  EC <= '1' ; ER <= '1' ; 
				IF s = '0' THEN
					LR <= '1' ; 
					IF LA = '1' THEN EA <= '1' ; ELSE EA <= '0' ; END IF ;
				ELSE
					EA <= '1' ; ER0 <= '1' ; 
				END IF ;
			WHEN S2 =>
				Rsel <= '1' ; ER <= '1' ; ER0 <= '1' ; EA <= '1' ;
				IF Cout = '1' THEN LR <= '1' ; ELSE	LR <= '0' ; END IF ;
				IF z = '0' THEN EC <= '1' ; ELSE EC <= '0' ; END IF ;
			WHEN S3 =>
				Done <= '1' ;
		END CASE ;
	END PROCESS ;
	-- define the datapath circuit
	Zero <= '0' ;
	RegB: regne GENERIC MAP ( N => N )
		PORT MAP ( DataB, Resetn, EB, Clock, B ) ;
	ShiftR: shiftlne GENERIC MAP ( N => N )
		PORT MAP ( DataR, LR, ER, R0, Clock, R ) ;
	FF_R0: muxdff PORT MAP ( Zero, A(N-1), ER0, Clock, R0 ) ;
	ShiftA: shiftlne GENERIC MAP ( N => N )
		PORT MAP ( DataA, LA, EA, Cout, Clock, A ) ;
	Q <= A ;
	Counter: downcnt GENERIC MAP ( modulus => N ) 
		PORT MAP ( Clock, EC, LC, Count ) ;
	z <= '1' WHEN Count = 0 ELSE '0' ;

	Sum <= R & R0 + (NOT B +1) ;
	Cout <= Sum(N) ;
	DataR <= zero_Sum_vec WHEN Rsel = '0' ELSE Sum(N-1 DOWNTO 0) ;
END Behavior ;
