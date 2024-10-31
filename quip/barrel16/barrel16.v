// Simple 16-bit barrel shifter with rotation.
// Altera Corp.

module barrel16 (data_in, data_out, rotate, direction, clk) ;
   input [15:0] data_in ;
   input [3:0] 	 rotate ;
   input 	 clk, direction ;
   output [15:0] data_out ;
   reg [15:0] 	 data_out ;

   reg [15:0] 	 reg_data_in ;
   reg [3:0] 	 reg_rotate ;
   reg 		 reg_direction;
   
   always @(posedge clk) 
     begin 
	reg_data_in <= data_in ;
	reg_rotate <= rotate ;
	reg_direction <= direction;

	// direction = 1, shift right
	// direction = 0, shift left
	if (reg_direction)
	  begin
	     case (reg_rotate) 
	       4'b0000: data_out <= reg_data_in [15:0] ;
	       4'b0001: data_out <= {reg_data_in[0], reg_data_in[15:1]};
	       4'b0010: data_out <= {reg_data_in[1:0], reg_data_in[15:2]};
	       4'b0011: data_out <= {reg_data_in[2:0], reg_data_in[15:3]};
	       4'b0100: data_out <= {reg_data_in[3:0], reg_data_in[15:4]};
	       4'b0101: data_out <= {reg_data_in[4:0], reg_data_in[15:5]};
	       4'b0110: data_out <= {reg_data_in[5:0], reg_data_in[15:6]};
	       4'b0111: data_out <= {reg_data_in[6:0], reg_data_in[15:7]};
	       4'b1000: data_out <= {reg_data_in[7:0], reg_data_in[15:8]};
	       4'b1001: data_out <= {reg_data_in[8:0], reg_data_in[15:9]};
	       4'b1010: data_out <= {reg_data_in[9:0], reg_data_in[15:10]};
	       4'b1011: data_out <= {reg_data_in[10:0], reg_data_in[15:11]};
	       4'b1100: data_out <= {reg_data_in[11:0], reg_data_in[15:12]};
	       4'b1101: data_out <= {reg_data_in[12:0], reg_data_in[15:13]};
	       4'b1110: data_out <= {reg_data_in[13:0], reg_data_in[15:14]};
	       4'b1111: data_out <= {reg_data_in[14:0], reg_data_in[15]};
	     endcase 
	  end // if (direction)
	else
	  begin
	     case (reg_rotate) 
	       4'b0000: data_out <= reg_data_in [15:0] ;
	       4'b0001: data_out <= {reg_data_in[14:0], reg_data_in[15]};
	       4'b0010: data_out <= {reg_data_in[13:0], reg_data_in[15:14]};
	       4'b0011: data_out <= {reg_data_in[12:0], reg_data_in[15:13]};
	       4'b0100: data_out <= {reg_data_in[11:0], reg_data_in[15:12]};
	       4'b0101: data_out <= {reg_data_in[10:0], reg_data_in[15:11]};
	       4'b0110: data_out <= {reg_data_in[9:0], reg_data_in[15:10]};
	       4'b0111: data_out <= {reg_data_in[8:0], reg_data_in[15:9]};
	       4'b1000: data_out <= {reg_data_in[7:0], reg_data_in[15:8]};
	       4'b1001: data_out <= {reg_data_in[6:0], reg_data_in[15:7]};
	       4'b1010: data_out <= {reg_data_in[5:0], reg_data_in[15:6]};
	       4'b1011: data_out <= {reg_data_in[4:0], reg_data_in[15:5]};
	       4'b1100: data_out <= {reg_data_in[3:0], reg_data_in[15:4]};
	       4'b1101: data_out <= {reg_data_in[2:0], reg_data_in[15:3]};
	       4'b1110: data_out <= {reg_data_in[1:0], reg_data_in[15:2]};
	       4'b1111: data_out <= {reg_data_in[0], reg_data_in[15:1]};
	     endcase 
	  end // else: !if(direction)
     end 
endmodule 
