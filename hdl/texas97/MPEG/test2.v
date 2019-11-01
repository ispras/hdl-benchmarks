/*
 *
 * This module parses the 8 bytes of the system header after the 
 * system_header_start_code.
 * syshead_len_reg (2 bytes) : #of bytes in header after start code
 * rate_bnd_reg : 22 bit bound on mux rate and 2 marker bits
 * flag_reg :audio and video bounds and some flags
 * resvd_byte_reg : 1 reserved byte (0xFF)
 *
 */ 

module parse_system_header(clk,one_byte,start,enable,stop,syshead_len_reg,rate_bnd_reg,flag_reg,resvd_byte_reg);

input clk;
input one_byte;
input start;
input enable;
output stop;
output syshead_len_reg;
output rate_bnd_reg;
output flag_reg;
output resvd_byte_reg;

wire[7:0] one_byte;
wire start;
wire enable;
   
reg stop;
reg[15:0] syshead_len_reg;
reg[23:0] rate_bnd_reg;
reg[15:0] flag_reg;
reg[7:0] resvd_byte_reg;

reg[2:0] count;
reg flag;
reg[1:0] count1;

reg[15:0] Mem[0:7];
reg[7:0] stream_id_temp;
reg[15:0] stream_temp;
integer i;

initial
	begin
	stop=0;
	syshead_len_reg=0;
	rate_bnd_reg=0;
	flag_reg=0;
	resvd_byte_reg=0;
	count=3'b000;
	count1=8'b0;
	flag=0;
	for (i=0;i< 8;i=i+1)
		Mem[i]=0;
	stream_temp=0;
	stream_id_temp=0;
	end


always @(posedge enable)

if ((start==1)&&(flag==0))
	begin
	case (count)
		3'b000: begin
			syshead_len_reg[7:0]=one_byte[7:0];
			count=count+1;
			end
		3'b001: begin
			syshead_len_reg[15:8]=one_byte[7:0];
			count=count+1;
			end
		3'b010: begin
			rate_bnd_reg[7:0]=one_byte[7:0];
			count=count+1;
			end
                3'b011: begin
			rate_bnd_reg[15:8]=one_byte[7:0];
			count=count+1;
			end
		3'b100: begin
			rate_bnd_reg[23:16]=one_byte[7:0];
			count=count+1;
			end
		3'b101: begin
			flag_reg[7:0]=one_byte[7:0];
			count=count+1;
			end
		3'b110: begin
			flag_reg[15:8]=one_byte[7:0];
			count=count+1;
			end
		3'b111: begin
			resvd_byte_reg[7:0]=one_byte[7:0];
			flag=1;
			count=3'b000;
			end
	endcase
	if (flag==1)
	   begin
	      if (one_byte[0:0]==1)
	      begin
		    
		case(count1)
		2'b00:	begin
			stream_id_temp[7:0]=one_byte[7:0];
		 	count1=count1+1;
			end
		2'b01:	begin
			stream_temp[7:0]=one_byte[7:0];
		 	count1=count1+1;
			end
		2'b10:	begin
			stream_temp[15:8]=one_byte[7:0];
		 	count1=0;
/*			case (stream_id_temp)

			8'b00000011: 
			             begin
					Mem[0]=stream_temp;
					stop=1;
				     end // case: 8'b00000011
			  
			8'b10000011: begin
			             Mem[1]=stream_temp;
			             stop=1;
			             end
			   
			8'b01000011: begin
			             Mem[2]=stream_temp;
			             stop=1;
			             end
			8'b11000011: begin
			             Mem[3]=stream_temp;
			             stop=1;
			             end
			8'b00000111: begin
			             Mem[4]=stream_temp;
			             stop=1;
			             end
			8'b10000011: begin
                                     Mem[5]=stream_temp;
			             stop=1;
			             end   
			8'b01000011: begin
                                     Mem[6]=stream_temp;
			             stop=1;
			             end   
			8'b11000011: begin
                                     Mem[8]=stream_temp;
			             stop=1;
			             end
			   
			endcase */ // case(count1)
		   
			end
		  
		endcase
	      end // if (one_byte[0:0]==1)
	   
	   end // if (flag==1)
	   
	end

endmodule



