//rotate, direction, a, y, clk

module barrel64 (data_in, data_out, rotate, direction, clk) ;
   input [63:0] data_in ;
   input [5:0] 	 rotate ;
   input 	 clk, direction ;
   output [63:0] data_out ;
   reg [63:0] 	 data_out ;

   reg [63:0] 	 reg_data_in ;
   reg [5:0] 	 reg_rotate ;
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
	       6'b000000: data_out <= reg_data_in [63:0] ;
	       6'b000001: data_out <= {reg_data_in[0], reg_data_in[63:1]};
	       6'b000010: data_out <= {reg_data_in[1:0], reg_data_in[63:2]};
	       6'b000011: data_out <= {reg_data_in[2:0], reg_data_in[63:3]};
	       6'b000100: data_out <= {reg_data_in[3:0], reg_data_in[63:4]};
	       6'b000101: data_out <= {reg_data_in[4:0], reg_data_in[63:5]};
	       6'b000110: data_out <= {reg_data_in[5:0], reg_data_in[63:6]};
	       6'b000111: data_out <= {reg_data_in[6:0], reg_data_in[63:7]};
	       6'b001000: data_out <= {reg_data_in[7:0], reg_data_in[63:8]};
	       6'b001001: data_out <= {reg_data_in[8:0], reg_data_in[63:9]};
	       6'b001010: data_out <= {reg_data_in[9:0], reg_data_in[63:10]};
	       6'b001011: data_out <= {reg_data_in[10:0], reg_data_in[63:11]};
	       6'b001100: data_out <= {reg_data_in[11:0], reg_data_in[63:12]};
	       6'b001101: data_out <= {reg_data_in[12:0], reg_data_in[63:13]};
	       6'b001110: data_out <= {reg_data_in[13:0], reg_data_in[63:14]};
	       6'b001111: data_out <= {reg_data_in[14:0], reg_data_in[63:15]};
	       6'b010000: data_out <= {reg_data_in[15:0], reg_data_in[63:16]};
	       6'b010001: data_out <= {reg_data_in[16:0], reg_data_in[63:17]};
	       6'b010010: data_out <= {reg_data_in[17:0], reg_data_in[63:18]};
	       6'b010011: data_out <= {reg_data_in[18:0], reg_data_in[63:19]};
	       6'b010100: data_out <= {reg_data_in[19:0], reg_data_in[63:20]};
	       6'b010101: data_out <= {reg_data_in[20:0], reg_data_in[63:21]};
	       6'b010110: data_out <= {reg_data_in[21:0], reg_data_in[63:22]};
	       6'b010111: data_out <= {reg_data_in[22:0], reg_data_in[63:23]};
	       6'b011000: data_out <= {reg_data_in[23:0], reg_data_in[63:24]};
	       6'b011001: data_out <= {reg_data_in[24:0], reg_data_in[63:25]};
	       6'b011010: data_out <= {reg_data_in[25:0], reg_data_in[63:26]};
	       6'b011011: data_out <= {reg_data_in[26:0], reg_data_in[63:27]};
	       6'b011100: data_out <= {reg_data_in[27:0], reg_data_in[63:28]};
	       6'b011101: data_out <= {reg_data_in[28:0], reg_data_in[63:29]};
	       6'b011110: data_out <= {reg_data_in[29:0], reg_data_in[63:30]};
	       6'b011111: data_out <= {reg_data_in[30:0], reg_data_in[63:31]};
	       6'b100000: data_out <= {reg_data_in[31:0], reg_data_in[63:32]};
	       6'b100001: data_out <= {reg_data_in[32:0], reg_data_in[63:33]};
	       6'b100010: data_out <= {reg_data_in[33:0], reg_data_in[63:34]};
	       6'b100011: data_out <= {reg_data_in[34:0], reg_data_in[63:35]};
	       6'b100100: data_out <= {reg_data_in[35:0], reg_data_in[63:36]};
	       6'b100101: data_out <= {reg_data_in[36:0], reg_data_in[63:37]};
	       6'b100110: data_out <= {reg_data_in[37:0], reg_data_in[63:38]};
	       6'b100111: data_out <= {reg_data_in[38:0], reg_data_in[63:39]};
	       6'b101000: data_out <= {reg_data_in[39:0], reg_data_in[63:40]};
	       6'b101001: data_out <= {reg_data_in[40:0], reg_data_in[63:41]};
	       6'b101010: data_out <= {reg_data_in[41:0], reg_data_in[63:42]};
	       6'b101011: data_out <= {reg_data_in[42:0], reg_data_in[63:43]};
	       6'b101100: data_out <= {reg_data_in[43:0], reg_data_in[63:44]};
	       6'b101101: data_out <= {reg_data_in[44:0], reg_data_in[63:45]};
	       6'b101110: data_out <= {reg_data_in[45:0], reg_data_in[63:46]};
	       6'b101111: data_out <= {reg_data_in[46:0], reg_data_in[63:47]};
	       6'b110000: data_out <= {reg_data_in[47:0], reg_data_in[63:48]};
	       6'b110001: data_out <= {reg_data_in[48:0], reg_data_in[63:49]};
	       6'b110010: data_out <= {reg_data_in[49:0], reg_data_in[63:50]};
	       6'b110011: data_out <= {reg_data_in[50:0], reg_data_in[63:51]};
	       6'b110100: data_out <= {reg_data_in[51:0], reg_data_in[63:52]};
	       6'b110101: data_out <= {reg_data_in[52:0], reg_data_in[63:53]};
	       6'b110110: data_out <= {reg_data_in[53:0], reg_data_in[63:54]};
	       6'b110111: data_out <= {reg_data_in[54:0], reg_data_in[63:55]};
	       6'b111000: data_out <= {reg_data_in[55:0], reg_data_in[63:56]};
	       6'b111001: data_out <= {reg_data_in[56:0], reg_data_in[63:57]};
	       6'b111010: data_out <= {reg_data_in[57:0], reg_data_in[63:58]};
	       6'b111011: data_out <= {reg_data_in[58:0], reg_data_in[63:59]};
	       6'b111100: data_out <= {reg_data_in[59:0], reg_data_in[63:60]};
	       6'b111101: data_out <= {reg_data_in[60:0], reg_data_in[63:61]};
	       6'b111110: data_out <= {reg_data_in[61:0], reg_data_in[63:62]};
	       6'b111111: data_out <= {reg_data_in[62:0], reg_data_in[63]};
	     endcase 
	  end // if (direction)
	else
	  begin
	     case (reg_rotate) 
	       6'b000000: data_out <= reg_data_in [63:0] ;
	       6'b000001: data_out <= {reg_data_in[62:0], reg_data_in[63]};
	       6'b000010: data_out <= {reg_data_in[61:0], reg_data_in[63:62]};
	       6'b000011: data_out <= {reg_data_in[60:0], reg_data_in[63:61]};
	       6'b000100: data_out <= {reg_data_in[59:0], reg_data_in[63:60]};
	       6'b000101: data_out <= {reg_data_in[58:0], reg_data_in[63:59]};
	       6'b000110: data_out <= {reg_data_in[57:0], reg_data_in[63:58]};
	       6'b000111: data_out <= {reg_data_in[56:0], reg_data_in[63:57]};
	       6'b001000: data_out <= {reg_data_in[55:0], reg_data_in[63:56]};
	       6'b001001: data_out <= {reg_data_in[54:0], reg_data_in[63:55]};
	       6'b001010: data_out <= {reg_data_in[53:0], reg_data_in[63:54]};
	       6'b001011: data_out <= {reg_data_in[52:0], reg_data_in[63:53]};
	       6'b001100: data_out <= {reg_data_in[51:0], reg_data_in[63:52]};
	       6'b001101: data_out <= {reg_data_in[50:0], reg_data_in[63:51]};
	       6'b001110: data_out <= {reg_data_in[49:0], reg_data_in[63:50]};
	       6'b001111: data_out <= {reg_data_in[48:0], reg_data_in[63:49]};
	       6'b010000: data_out <= {reg_data_in[47:0], reg_data_in[63:48]};
	       6'b010001: data_out <= {reg_data_in[46:0], reg_data_in[63:47]};
	       6'b010010: data_out <= {reg_data_in[45:0], reg_data_in[63:46]};
	       6'b010011: data_out <= {reg_data_in[44:0], reg_data_in[63:45]};
	       6'b010100: data_out <= {reg_data_in[43:0], reg_data_in[63:44]};
	       6'b010101: data_out <= {reg_data_in[42:0], reg_data_in[63:43]};
	       6'b010110: data_out <= {reg_data_in[41:0], reg_data_in[63:42]};
	       6'b010111: data_out <= {reg_data_in[40:0], reg_data_in[63:41]};
	       6'b011000: data_out <= {reg_data_in[39:0], reg_data_in[63:40]};
	       6'b011001: data_out <= {reg_data_in[38:0], reg_data_in[63:39]};
	       6'b011010: data_out <= {reg_data_in[37:0], reg_data_in[63:38]};
	       6'b011011: data_out <= {reg_data_in[36:0], reg_data_in[63:37]};
	       6'b011100: data_out <= {reg_data_in[35:0], reg_data_in[63:36]};
	       6'b011101: data_out <= {reg_data_in[34:0], reg_data_in[63:35]};
	       6'b011110: data_out <= {reg_data_in[33:0], reg_data_in[63:34]};
	       6'b011111: data_out <= {reg_data_in[32:0], reg_data_in[63:33]};
	       6'b100000: data_out <= {reg_data_in[31:0], reg_data_in[63:32]};
	       6'b100001: data_out <= {reg_data_in[30:0], reg_data_in[63:31]};
	       6'b100010: data_out <= {reg_data_in[29:0], reg_data_in[63:30]};
	       6'b100011: data_out <= {reg_data_in[28:0], reg_data_in[63:29]};
	       6'b100100: data_out <= {reg_data_in[27:0], reg_data_in[63:28]};
	       6'b100101: data_out <= {reg_data_in[26:0], reg_data_in[63:27]};
	       6'b100110: data_out <= {reg_data_in[25:0], reg_data_in[63:26]};
	       6'b100111: data_out <= {reg_data_in[24:0], reg_data_in[63:25]};
	       6'b101000: data_out <= {reg_data_in[23:0], reg_data_in[63:24]};
	       6'b101001: data_out <= {reg_data_in[22:0], reg_data_in[63:23]};
	       6'b101010: data_out <= {reg_data_in[21:0], reg_data_in[63:22]};
	       6'b101011: data_out <= {reg_data_in[20:0], reg_data_in[63:21]};
	       6'b101100: data_out <= {reg_data_in[19:0], reg_data_in[63:20]};
	       6'b101101: data_out <= {reg_data_in[18:0], reg_data_in[63:19]};
	       6'b101110: data_out <= {reg_data_in[17:0], reg_data_in[63:18]};
	       6'b101111: data_out <= {reg_data_in[16:0], reg_data_in[63:17]};
	       6'b110000: data_out <= {reg_data_in[15:0], reg_data_in[63:16]};
	       6'b110001: data_out <= {reg_data_in[14:0], reg_data_in[63:15]};
	       6'b110010: data_out <= {reg_data_in[13:0], reg_data_in[63:14]};
	       6'b110011: data_out <= {reg_data_in[12:0], reg_data_in[63:13]};
	       6'b110100: data_out <= {reg_data_in[11:0], reg_data_in[63:12]};
	       6'b110101: data_out <= {reg_data_in[10:0], reg_data_in[63:11]};
	       6'b110110: data_out <= {reg_data_in[9:0], reg_data_in[63:10]};
	       6'b110111: data_out <= {reg_data_in[8:0], reg_data_in[63:9]};
	       6'b111000: data_out <= {reg_data_in[7:0], reg_data_in[63:8]};
	       6'b111001: data_out <= {reg_data_in[6:0], reg_data_in[63:7]};
	       6'b111010: data_out <= {reg_data_in[5:0], reg_data_in[63:6]};
	       6'b111011: data_out <= {reg_data_in[4:0], reg_data_in[63:5]};
	       6'b111100: data_out <= {reg_data_in[3:0], reg_data_in[63:4]};
	       6'b111101: data_out <= {reg_data_in[2:0], reg_data_in[63:3]};
	       6'b111110: data_out <= {reg_data_in[1:0], reg_data_in[63:2]};
	       6'b111111: data_out <= {reg_data_in[0], reg_data_in[63:1]};
	     endcase 
	  end // else: !if(direction)
     end 
endmodule 
