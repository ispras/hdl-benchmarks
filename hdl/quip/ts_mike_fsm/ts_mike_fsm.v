//
//	Mike's decoder state machine
//	Dec 18, 2002
//	
//	Intended as a Tsunami test design
//
//  TPD path is from in to out
//  TSU path is from in to state
//  TCO path is from state to out
//  FMAX path is the next state logic
//  

// These are my states
`define yaska	3'h0
`define mike	3'h1 
`define bryan	3'h2 
`define jay		3'h3 
`define andy	3'h4 
`define josh	3'h5 


module ts_mike_fsm(in, clock, out);
	input [3:0]	 in;
	input	clock;
	output [9:0] out;
	reg [9:0] out;
	reg [2:0] 	 current_state;
	reg [2:0]	 next_state;

	// Input patterns
	parameter pattern_X = 4'b0000,
			  pattern_Y = 4'b0101,
			  pattern_Z = 4'b1111,
			  pattern_W = 4'b0011;

	// Output patterns
	parameter pattern_A = 9'b1000101101,
			  pattern_B = 9'b0111110101,
			  pattern_C = 9'b1010110000,
			  pattern_D = 9'b1101010010;

	// Only sequential operation is to remember state.
	always @ (posedge clock)
	begin
		current_state <= next_state;
	end
	  
	// output pattern is based on input pattern and state.
	always@ (in, current_state)
	begin
		case (in)
			pattern_X:
				begin
					if (current_state == `yaska )
					begin
						out = pattern_A;
						next_state = `bryan;
					end
					else if (current_state == `bryan)
					begin
						out = pattern_B;
						next_state = `andy;
					end
					else
					begin
						out = pattern_C;
						next_state = `josh;
					end
				end

			pattern_Y:
				begin
					if (current_state == `jay)
					begin
						out = pattern_A;
						next_state = `jay;
					end
					else if (current_state == `josh)
					begin
						out = pattern_B;
						next_state = `bryan;
					end
					else
					begin
						out = pattern_C;
						next_state = `mike;
					end
				end

			pattern_Z:
				begin
					if (current_state == `jay)
					begin
						out = pattern_A;
						next_state = `andy;
					end
					else
					begin
						out = pattern_B;
						next_state = `mike;
					end
				end

			pattern_W:
				begin
					out = pattern_C;
					next_state = `mike;
				end

			default:
				begin
					out = pattern_D;
					next_state = `yaska;
				end
		endcase
			
	end


endmodule
	

