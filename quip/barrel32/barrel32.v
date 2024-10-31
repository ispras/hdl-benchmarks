//rotate, direction, a, y, clk

module barrel32 (data_in, data_out, rotate, direction, clk) ;
   input [31:0] data_in ;
   input [4:0] 	 rotate ;
   input 	 clk, direction ;
   output [31:0] data_out ;
   reg [31:0] 	 data_out ;

   reg [31:0] 	 reg_data_in ;
   reg [4:0] 	 reg_rotate ;
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
	       5'b00000: data_out <= reg_data_in [31:0] ;
	       5'b00001: data_out <= {reg_data_in[0], reg_data_in[31:1]};
	       5'b00010: data_out <= {reg_data_in[1:0], reg_data_in[31:2]};
	       5'b00011: data_out <= {reg_data_in[2:0], reg_data_in[31:3]};
	       5'b00100: data_out <= {reg_data_in[3:0], reg_data_in[31:4]};
	       5'b00101: data_out <= {reg_data_in[4:0], reg_data_in[31:5]};
	       5'b00110: data_out <= {reg_data_in[5:0], reg_data_in[31:6]};
	       5'b00111: data_out <= {reg_data_in[6:0], reg_data_in[31:7]};
	       5'b01000: data_out <= {reg_data_in[7:0], reg_data_in[31:8]};
	       5'b01001: data_out <= {reg_data_in[8:0], reg_data_in[31:9]};
	       5'b01010: data_out <= {reg_data_in[9:0], reg_data_in[31:10]};
	       5'b01011: data_out <= {reg_data_in[10:0], reg_data_in[31:11]};
	       5'b01100: data_out <= {reg_data_in[11:0], reg_data_in[31:12]};
	       5'b01101: data_out <= {reg_data_in[12:0], reg_data_in[31:13]};
	       5'b01110: data_out <= {reg_data_in[13:0], reg_data_in[31:14]};
	       5'b01111: data_out <= {reg_data_in[14:0], reg_data_in[31:15]};
	       5'b10000: data_out <= {reg_data_in[15:0], reg_data_in[31:16]};
	       5'b10001: data_out <= {reg_data_in[16:0], reg_data_in[31:17]};
	       5'b10010: data_out <= {reg_data_in[17:0], reg_data_in[31:18]};
	       5'b10011: data_out <= {reg_data_in[18:0], reg_data_in[31:19]};
	       5'b10100: data_out <= {reg_data_in[19:0], reg_data_in[31:20]};
	       5'b10101: data_out <= {reg_data_in[20:0], reg_data_in[31:21]};
	       5'b10110: data_out <= {reg_data_in[21:0], reg_data_in[31:22]};
	       5'b10111: data_out <= {reg_data_in[22:0], reg_data_in[31:23]};
	       5'b11000: data_out <= {reg_data_in[23:0], reg_data_in[31:24]};
	       5'b11001: data_out <= {reg_data_in[24:0], reg_data_in[31:25]};
	       5'b11010: data_out <= {reg_data_in[25:0], reg_data_in[31:26]};
	       5'b11011: data_out <= {reg_data_in[26:0], reg_data_in[31:27]};
	       5'b11100: data_out <= {reg_data_in[27:0], reg_data_in[31:28]};
	       5'b11101: data_out <= {reg_data_in[28:0], reg_data_in[31:29]};
	       5'b11110: data_out <= {reg_data_in[29:0], reg_data_in[31:30]};
	       5'b11111: data_out <= {reg_data_in[30:0], reg_data_in[31]};
	     endcase 
	  end // if (direction)
	else
	  begin
	     case (reg_rotate) 
	       5'b00000: data_out <= reg_data_in [31:0] ;
	       5'b00001: data_out <= {reg_data_in[30:0], reg_data_in[31]};
	       5'b00010: data_out <= {reg_data_in[29:0], reg_data_in[31:30]};
	       5'b00011: data_out <= {reg_data_in[28:0], reg_data_in[31:29]};
	       5'b00100: data_out <= {reg_data_in[27:0], reg_data_in[31:28]};
	       5'b00101: data_out <= {reg_data_in[26:0], reg_data_in[31:27]};
	       5'b00110: data_out <= {reg_data_in[25:0], reg_data_in[31:26]};
	       5'b00111: data_out <= {reg_data_in[24:0], reg_data_in[31:25]};
	       5'b01000: data_out <= {reg_data_in[23:0], reg_data_in[31:24]};
	       5'b01001: data_out <= {reg_data_in[22:0], reg_data_in[31:23]};
	       5'b01010: data_out <= {reg_data_in[21:0], reg_data_in[31:22]};
	       5'b01011: data_out <= {reg_data_in[20:0], reg_data_in[31:21]};
	       5'b01100: data_out <= {reg_data_in[19:0], reg_data_in[31:20]};
	       5'b01101: data_out <= {reg_data_in[18:0], reg_data_in[31:19]};
	       5'b01110: data_out <= {reg_data_in[17:0], reg_data_in[31:18]};
	       5'b01111: data_out <= {reg_data_in[16:0], reg_data_in[31:17]};
	       5'b10000: data_out <= {reg_data_in[15:0], reg_data_in[31:16]};
	       5'b10001: data_out <= {reg_data_in[14:0], reg_data_in[31:15]};
	       5'b10010: data_out <= {reg_data_in[13:0], reg_data_in[31:14]};
	       5'b10011: data_out <= {reg_data_in[12:0], reg_data_in[31:13]};
	       5'b10100: data_out <= {reg_data_in[11:0], reg_data_in[31:12]};
	       5'b10101: data_out <= {reg_data_in[10:0], reg_data_in[31:11]};
	       5'b10110: data_out <= {reg_data_in[9:0], reg_data_in[31:10]};
	       5'b10111: data_out <= {reg_data_in[8:0], reg_data_in[31:9]};
	       5'b11000: data_out <= {reg_data_in[7:0], reg_data_in[31:8]};
	       5'b11001: data_out <= {reg_data_in[6:0], reg_data_in[31:7]};
	       5'b11010: data_out <= {reg_data_in[5:0], reg_data_in[31:6]};
	       5'b11011: data_out <= {reg_data_in[4:0], reg_data_in[31:5]};
	       5'b11100: data_out <= {reg_data_in[3:0], reg_data_in[31:4]};
	       5'b11101: data_out <= {reg_data_in[2:0], reg_data_in[31:3]};
	       5'b11110: data_out <= {reg_data_in[1:0], reg_data_in[31:2]};
	       5'b11111: data_out <= {reg_data_in[0], reg_data_in[31:1]};
	     endcase 
	  end // else: !if(direction)
     end 
endmodule 
