// Simple barrel shifter with no rotation
// Altera Corp
//
// For 4-LUTs this should get synthesized as a shifter network 16 bits high by 
// 4 bits wide of 2:1 muxes for each of the directions, followed by 16-bit 2:1 mux
// array.  Counting the 4-bits to register k that's 148 Stratix LEs.
//
// Should get different results for Stratix II, as will be implemented with
// 6-LUTs as 4:1 muxes to built a 2-level shifter network, followed by
// merging with Shared LUT-mask.  Will depend on synthesis settigns.
//
// Unlike barrel16, this one uses the << operator, which infers an
// LPM_SHIFT.
// 

module barrel16a (data_in, data_out, k, direction, clk) ;
   input [15:0] data_in ;
   input [3:0] 	 k;
   input clk, direction ;
   output [15:0] data_out ;
   reg [15:0] 	 data_out ;

   reg [15:0] 	 reg_data_in ;
   reg [3:0] 	 reg_k ;
   reg 		 reg_direction;
   
   always @(posedge clk) 
   begin 
		reg_data_in <= data_in ;
		reg_k <= k ;
		reg_direction <= direction;
   
	if (reg_direction) 
		begin
			data_out <= reg_data_in << reg_k;
		end
	else 
		begin
			data_out <= reg_data_in >> reg_k;
		end
	end

endmodule 
