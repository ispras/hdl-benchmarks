/* 
 * Main module 
 * Pray that it works!!!!
 *
 */

module main(clk,input_stream,stream_end);

   
   input input_stream;
   input clk;
   output stream_end;
   
   wire  stream_end;
   wire  input_stream;
   wire  read_enable;
   wire  clk;
   wire [7:0] buffer;
   wire [7:0] data_buffer;
   
   reg packHeadStart;
   reg packParseStart;
   reg sysHeadStart;
   reg sysHeadParseStart;
   reg packetStart;
   wire packHeadStop;
   wire packParseStop;
   wire sysHeadStop;
   wire sysHeadParseStop;
   wire packetStop;
   reg [2:0] main_state;
   wire [39:0] scr;
   wire [23:0] muxRate;

   wire [15:0] sysHeadLen;
   wire [23:0] rateBnd;
   wire [15:0] flagInfo;
   wire [7:0]  resvdByte;

  // initial clk=0;

   //always #1 clk=!clk;
   
   
   initial
      begin
	 packHeadStart=1;
	 packParseStart=0;
	 sysHeadStart=0;
	 sysHeadParseStart=0;
	 packetStart=0;
	 main_state=0;
	 
      end

   //input_buffer          mod1(clk,input_stream,buffer);
   //counter               mod2(clk,read_enable);
   //fsm_for_pack_start    mod3(buffer,packHeadStart,read_enable,packHeadStop);
   //parse_pack_header     mod4(buffer,packParseStart,read_enable,packParseStop,scr,muxRate);
   //fsm_for_syshead_start mod5(buffer,sysHeadStart,read_enable,sysHeadStop);
   parse_system_header   mod6(buffer,sysHeadParseStart,read_enable,sysHeadParseStop,sysHeadLen,rateBnd,flagInfo,resvdByte);
 //  read_packet           mod7(packetStart,packetStop,buffer,read_enable,data_buffer,stream_end);
   
   
   
   always @(posedge clk)
      begin
//	 case (main_state)
	   
      
	      begin
		 if (packHeadStop==1)
		    begin
		       packParseStart=1;
		       packHeadStart=0;
		    end // if (packHeadStop==1)
		 if (packParseStop==1)
		    begin
		       sysHeadStart=1;
		       packParseStart=0;
		    end // if (packParseStop==1)
		 if (sysHeadStop==1)
		    begin
		       sysHeadParseStart=1;
		       sysHeadStart=0;
		    end // if (sysHeadStop==1)
		 if(sysHeadParseStop==1)
		    begin
		       packetStart=1;
		       sysHeadParseStart=0;
		    end // if (sysHeadParseStop==1)
		 if(packetStop  == 1)
		    begin
		       packetStart = 0;
		       packHeadStart=1;
		    end // if (packetStop  == 1)
	      
              end 
	     
	    //  endcase // case(main_state)
      end // always (@posedge clk)
   
    
	 

   
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

module fsm_for_pack_start(one_byte,start,enable,stop);

//input clk;
input one_byte;
input start;
input enable;
output stop;

//wire clk;
wire[7:0] one_byte;
wire start;
wire enable;
reg stop;

reg[2:0] state;

initial 
	begin
	stop=0;
	state=0;
	end


always @(posedge enable)
	begin
	if (start==1) 
	begin
	case (state)
		0:	begin
			case (one_byte)
			8'b00000000: state=1;
			default	   : state=0;	
			endcase
			end
		
		1:	begin
			case (one_byte)
			8'b00000000: state=2;
			default	   : state=0;	
			endcase
			end  

		2:	begin
			case (one_byte)
			8'b00000001: state=3;
			8'b00000000: state=1;
			default	   : state=0;	
			endcase
			end
		
		3:	begin
			case (one_byte)
			8'b01011101: begin
				     stop=1;
			             state=0;
				     end
			8'b00000000: state=1;
			default	   : state=0;
			endcase  
			end
  
	       
		    
	endcase
	end
	else stop=0;
	   
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
 
module parse_pack_header(one_byte,start,enable,stop,scr_reg,mux_rate_reg);

//input clk;
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
	
/*...check maybe change these initial values later....*/
	end

//always
  // begin
    //  if (start==1)
	// stop=0;
   //end // always begin
   
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
	end // if (start==1)
   
else stop=0;
   
   

endmodule

/*
 *
 * This module checks for the system_header_start_code and sets `stop'=1
 * when it is recognised.
 *
 */

module fsm_for_syshead_start(one_byte,start,enable,stop);

//input clk;
input one_byte;
input start;
input enable;
output stop;

wire[7:0] one_byte;
wire start;
wire enable;
reg stop;
reg[2:0] state;

initial 
	begin
	stop=0;
	state=0;
	end

//always  @(posedge enable)
  // begin
    //  if (start==1)
	// stop=0;
   //end // always begin
      
always @(posedge enable)
	begin
	if (start==1) 
	begin
	   case(state)
		0:	begin
			case (one_byte)
			  8'b00000000:state=1;
			  default    : state=0;	
			endcase
			end
		
		1:	
			begin
			case (one_byte)
			8'b00000000: state=2;
			default	   : state=0;	
			endcase
			end  

		2:	begin
			case (one_byte)
			8'b10000000: state=3;
			default	   : state=0;	
			endcase
			end
		
		3:	begin
			case (one_byte)
			8'b11011101: begin
					state=7;
					stop=1;
				     end
			8'b00000000: state=1;
			default	   : state=0;
			endcase // case(one_byte)
		   
			end // case: 3
	        7:
		        begin
		       // if (start==0)
			   stop=0;
			end // case: 7
			  
			  
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

module parse_system_header(one_byte,start,enable,stop,syshead_len_reg,rate_bnd_reg,flag_reg,resvd_byte_reg);

//input clk;
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
	count1=0;
	flag=0;
//	for (i=0;i< 8;i=i+1)
//		Mem[i]=0;
	Mem[0]=0;
	Mem[1]=0;
	Mem[2]=0;
	Mem[3]=0;
	Mem[4]=0;
	Mem[5]=0;
	Mem[6]=0;
	Mem[7]=0;

	stream_temp=0;
	   stream_temp1 = 0;
	   
	stream_id_temp=0;
	end

//always
  // begin
    //  if (start==1)
	// begin
	// stop=0;
        // flag=0;
	// end // if (start==1)
      
//   end // always begin
   
always @(posedge enable)
   begin
      
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
	endcase // case(count)
	end // if ((start==1)&&(flag==0))
   
	if ((start==1)&&(flag==1))
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
			   
			endcase // case(stream_id_temp)
		   
		end // case: 2'b10
		  
		  
		endcase // case(count1)
		 
	      end // if (one_byte[0:0]==1)
	   
	   end // if ((start==1)&&(flag==1))
   
	   
   if (start==0) stop=0;
   
   end // always @ (posedge enable)
   
endmodule


module read_packet (start,done,input_stream,read_signal,buffer_out,stream_done);
   

 input start;
 output done;
 input input_stream;
 input read_signal;
 output buffer_out;
 output stream_done;
   

 reg 	stream_done;
 reg done;
// reg buffer_in;
 wire[7:0] input_stream;
 reg[7:0] buffer_out;
 wire prefix_stop;
 reg[3:0] state;
 reg[7:0] stream_id;
 reg[15:0] packet_length;
// reg[7:0] packet_byte;
 //reg[15:0] byte_counter;
 
 reg STD_buffer_scale;
 reg[12:0] STD_buffer_size; 
 reg time_stamp_start;
 wire time_stamp_stop;
 reg [15:0] NumBytes;
 wire [3:0] timeStampBytes;
 reg timeStampFlag;
 reg packet_done;
 wire prefix_start;
   
 
 initial
    begin
       state = 15;
       time_stamp_start = 0;
       timeStampFlag = 0;
       done = 0;
       STD_buffer_size=0;
       NumBytes=0;
       STD_buffer_scale=0;
       packet_length=0;
       buffer_out=0;
       stream_id=0;
       stream_done = 0;
       packet_done = 1;
       
    end // initial begin

   assign prefix_start = start & packet_done;
   
   
//initial $monitor("%0d, %b %b %b %b %b",$time,state,input_stream,stream_id,read_signal,NumBytes);
always @(posedge read_signal)
 begin
  case(state)
    15:
        if (start == 1)
         begin
          state = 0;
         end
        
    0: 
	if (prefix_stop == 1)
	   begin
	      if (input_stream == 8'b10111010)
		 begin
		    done = 1;
		    state = 8;
		 end // if (input_stream == 8'b10111010)
	      else
		 begin
		    
		    if (input_stream == 8'b10111001)
		       begin
		       done = 1;
		       stream_done = 1;
		       state = 8;
		       end // if (input_stream = 8'b10111001)
		    else
		       begin
			  state = 2;
			  packet_done = 0;
			  stream_id = input_stream;
		       end // else: !if(input_stream = 8'b10111001)
		 end // else: !if(input_stream == 8'b10111010)
	   end // if (prefix_stop == 1)
    
   
   2:
	  begin
            packet_length[15:8] = input_stream;
	    state = 3;
          end
   3:
         begin
            packet_length[7:0] = input_stream;
            NumBytes = packet_length;
            if (stream_id == 8'hbf)
               begin
                 time_stamp_start = 0;
		 state = 7;
               end
            else
               state = 4;
          end
      
   4:  
      if (input_stream != 8'hff)
	 begin
           if (input_stream[1:0] == 2'b01)
              begin
                state = 5;
                STD_buffer_scale = input_stream[2];
                STD_buffer_size[4:0] = input_stream[7:3];
              end
           else
             begin
              state = 6;
              timeStampFlag = 1;
              time_stamp_start = 1;
            end
         end
       else
             NumBytes = NumBytes - 1;
         
  5:
    
       begin
           state = 6;
           STD_buffer_size[12:5] = input_stream;
           NumBytes = NumBytes - 1;
           timeStampFlag = 0;
           time_stamp_start = 1;
       end       
          
  6:
      if (time_stamp_stop == 1)
	 begin
	 if ((NumBytes - timeStampBytes) == 0)
	    state = 0;
	 else
          begin  
          timeStampFlag = 0;
          buffer_out = input_stream;
          NumBytes = NumBytes - timeStampBytes;
          if (NumBytes > 1)
              begin
                state = 7;
              end
          if (NumBytes == 1)
              begin
                 state = 0;
                 packet_done = 1;
              end
          time_stamp_start = 0;
          end  
       end   
   7:
     begin 
      if (NumBytes  > 1)
         begin
	  buffer_out = input_stream;
          NumBytes = NumBytes - 1;
         end
      else
         begin
          buffer_out = input_stream;
	    state = 0;
          packet_done = 1;
        end
      end

    8: 
       if (start == 0)
       begin
        done = 0;
	 packet_done = 0;
	  
	state = 15;
       end
   endcase 
       
end
//always 
  // begin
    //  if (time_stamp_stop == 1)
	// Begin
 /*         if ((NumBytes - timeStampBytes) == 0) */
/*            begin */
/*              packet_done = 1; */
/* 	   end */
/*          end */
	    
//    end

          
//start_code_prefix  module1(start,prefix_stop,input_stream,read_signal);
//time_stamps        module2(time_stamp_start,time_stamp_stop,input_stream,read_signal,timeStampBytes,timeStampFlag);
//time_stamps        module2(time_stamp_start,time_stamp_stop,input_stream,read_signal,timeStampBytes,timeStampFlag);
endmodule
































































































































































