/* 
 * Main module 
 * Pray that it works!!!!
 *
 */

module main(clk,input_stream);

   input clk;
   input input_stream;
   wire  input_stream;
   
   wire clk;
   
   reg packHeadStart;
   reg packParseStart;
   reg sysHeadStart;
   reg sysHeadParseStart;
   wire packHeadStop;
   wire packParseStop;
   wire sysHeadStop;
   wire sysHeadParseStop;


 /*  initial clk=1;
   
   always #1 clk=!clk;
*/   
   
   
endmodule // main


/*
 *
 * This module reads the serial stream ` input_stream'  and saves it
 * temporarily in a 1 byte buffer output_buffer.
 *
 */
module input_buffer (clk,input_stream,output_buffer);

input clk;
input input_stream;
output output_buffer;

wire input_stream;
reg [7:0] output_buffer;
reg [6:0] temp;

initial 
	begin
	output_buffer=8'b11111111;
	temp=7'b1111111;
	end

always @(posedge clk)
	begin
	temp[6:0]=output_buffer[7:1];
	output_buffer[6:0]=temp[6:0];
	output_buffer[7:7]=input_stream;
	end

endmodule

/* 
 * This module counts 8 clock cycles and then sets a flag `count_over'
 *
 */

module counter (clk,count_over);

input clk;
output count_over;

reg count_over;
reg[2:0] count_value;

initial
	begin
	count_over=0;
	count_value=3'b000;
	end

always @(posedge clk)
	begin
	if (count_value==3'b111)
		begin
		count_over=1;
		count_value=3'b000;
		end
	else 
		begin
		count_over=0;
		count_value=count_value+1;
		end
	end
	
endmodule

/* 
 *
 * This module checks if a valid pack_start code is received
 * Only when `start' is set to 1
 * On getting valid pack_start_code make `stop'=1 
 *
 */

module fsm_for_pack_start(clk,one_byte,start,enable,stop);

input clk;
input one_byte;
input start;
input enable;
output stop;

wire[7:0] one_byte;
wire start;
wire enable;
reg stop;

reg[1:0] state;

initial 
	begin
	stop=0;
	state=2'b00;
	end

always
   begin
      if (start==1)
	 stop=0;
   end // always begin
   
   
always @(posedge enable)
	begin
	if (start==1) 
	begin
	case (state)
		2'b00:	begin
			case (one_byte)
			8'b00000000: state=2'b01;
			default	   : state=2'b00;	
			endcase
			end
		
		2'b01:	begin
			case (one_byte)
			8'b00000000: state=2'b10;
			default	   : state=2'b00;	
			endcase
			end  

		2'b10:	begin
			case (one_byte)
			8'b10000000: state=2'b11;
			default	   : state=2'b00;	
			endcase
			end
		
		2'b11:	begin
			case (one_byte)
			8'b01011101: begin
				     stop=1;
				     state=2'b00;
				     end
			8'b00000000: state=2'b01;
			default	   : state=2'b00;	
			endcase
			end  
	endcase
	end

	end

endmodule	/* fsm_pack_head_start */


/*
 * 
 * This module parses the 8 bytes in the pack header after the pack_start_code
 * scr_reg holds the 33 bit scr value,4 bits for byte alignment and
 * 3 marker bits.
 * mux_rate_reg holds the 22 bit mux_rate and 2 marker bits.
 * when this is done `stop' is set to 1
 *
 */
 
module parse_pack_header(clk,one_byte,start,enable,stop,scr_reg,mux_rate_reg);

input clk;
input one_byte;
input start;
input enable;
output stop;
output scr_reg;
output mux_rate_reg;

wire[7:0] one_byte;
wire start;
wire enable;
reg stop;
reg[39:0] scr_reg;
reg[23:0] mux_rate_reg;

reg[2:0] count;


initial
	begin
	stop=0;
	scr_reg=0;
	mux_rate_reg=0;
	count=3'b000;
	
/* ..check maybe change these initial values later....*/
	end

always
   begin
      if (start==1)
	 stop=0;
   end // always begin
   
always @(posedge enable)

if (start==1)
	begin
	case (count)
		3'b000: begin
			scr_reg[7:0]=one_byte[7:0];
			count=count+1;
			end
		3'b001: begin
			scr_reg[15:8]=one_byte[7:0];
			count=count+1;
			end
		3'b010: begin
			scr_reg[23:16]=one_byte[7:0];
			count=count+1;
			end
                3'b011: begin
			scr_reg[31:24]=one_byte[7:0];
			count=count+1;
			end
		3'b100: begin
			scr_reg[39:32]=one_byte[7:0];
			count=count+1;
			end
		3'b101: begin
			mux_rate_reg[7:0]=one_byte[7:0];
			count=count+1;
			end
		3'b110: begin
			mux_rate_reg[15:8]=one_byte[7:0];
			count=count+1;
			end
		3'b111: begin
			mux_rate_reg[23:16]=one_byte[7:0];
			stop=1;
			count=3'b000;
			end
	endcase
	end

endmodule

/*
 *
 * This module checks for the system_header_start_code and sets `stop'=1
 * when it is recognised.
 *
 */

module fsm_for_syshead_start(clk,one_byte,start,enable,stop);

input clk;
input one_byte;
input start;
input enable;
output stop;

wire[7:0] one_byte;
wire start;
wire enable;
reg stop;
reg[1:0] state;

initial 
	begin
	stop=0;
	state=2'b00;
	end

always
   begin
      if (start==1)
	 stop=0;
   end // always begin
      
always @(posedge enable)
	begin
	if (start==1) 
	begin
	   case(state)
		2'b00:	begin
			case (one_byte)
			  8'b00000000:state=2'b01;
			  default    : state=2'b00;	
			endcase
			end
		
		2'b01:	
			begin
			case (one_byte)
			8'b00000000: state=2'b10;
			default	   : state=2'b00;	
			endcase
			end  

		2'b10:	begin
			case (one_byte)
			8'b10000000: state=2'b11;
			default	   : state=2'b00;	
			endcase
			end
		
		2'b11:	begin
			case (one_byte)
			8'b11011101: begin
					state=2'b00;
					stop=1;
				     end
			8'b00000000: state=2'b01;
			default	   : state=2'b00;	
			endcase
			end  
	endcase
	end

	end

endmodule

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

reg[23:0] Mem[0:7];
reg[7:0] stream_id_temp;
reg[15:0] stream_temp;
reg [23:0] stream_temp1;
   
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
	   stream_temp1 = 0;
	   
	stream_id_temp=0;
	end

always
   begin
      if (start==1)
	 stop=0;
   end // always begin
   
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
		   stream_temp1[7:0] = stream_temp;
     
			case (stream_id_temp)

			8'b00000011: 
			             begin
					Mem[0]=stream_temp1;
					stop=1;
				     end // case: 8'b00000011
			  
			8'b10000011: begin
			  Mem[1]=stream_temp1;
			             stop=1;
			             end
			   
			8'b01000011: begin
			          Mem[2]=stream_temp1;
			             stop=1;
			             end
			8'b11000011: begin
			             Mem[3]=stream_temp1;
			             stop=1;
			             end
			8'b00000111: begin
			   Mem[4]=stream_temp1;
			   
			             stop=1;
			             end
			8'b10000011: begin
                                     Mem[5]=stream_temp1;
			             stop=1;
			             end   
			8'b01000011: begin
			   Mem[6]=stream_temp1;
			  
			             stop=1;
			             end   
			8'b11000011: begin
			   Mem[7]=stream_temp1;
			   
			             stop=1;
			             end
			   
			endcase
			end
		  
		endcase
	      end // if (one_byte[0:0]==1)
	   
	   end // if (flag==1)
	   
	end

endmodule





























































































































































