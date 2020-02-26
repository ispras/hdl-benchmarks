/* 
 * Main module 
 * MPEG System Decoder
 *
 */

module main(clk,input_stream);

   

  input clk; 
  input input_stream;

   
   wire  input_stream;
   wire  clk;
   wire  stream_end;

   wire  read_enable;
   //reg clk;
   wire [7:0] buffer;
   wire [7:0] data_buffer;
   
   reg packHeadStart;
   reg packParseStart;
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
   reg 	       test_enable;
   

 
 
   initial
      begin
	 
	 packHeadStart=1;
	 packParseStart=0;
	 sysHeadParseStart=0;
	 packetStart=0;
	 main_state=0;
	 test_enable = 0; 
      end // initial begin
   
   
  input_buffer          mod1(clk,input_stream,buffer);
  counter               mod2(clk,read_enable);
  fsm_for_pack_start    mod3(clk,buffer,packHeadStart,read_enable,packHeadStop);
  parse_pack_header     mod4(clk,buffer,packParseStart,read_enable,packParseStop,scr,muxRate);
  parse_system_header   mod6(clk,buffer,sysHeadParseStart,read_enable,sysHeadParseStop,sysHeadLen,rateBnd,flagInfo,resvdByte);
   read_packet           mod7(clk,packetStart,packetStop,buffer,read_enable,data_buffer,sysHeadStop,stream_end);
   
  always @(posedge clk)
     begin  
		 if (packHeadStop==1)
		    begin
		       packParseStart=1;
		       packHeadStart=0;
		    end // if (packHeadStop==1)
		 if (packParseStop==1)
		    begin
		       packetStart=1;
		       packParseStart=0;
		    end // if (packParseStop==1)
		 if (sysHeadStop==1)
		    begin
		       sysHeadParseStart=1;
		       packetStart=0;
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
	
     end // always @ (posedge clk)
        
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
output reg [7:0] output_buffer;

wire input_stream;

initial 
	begin
	output_buffer=8'b11111111;
	end

always @(posedge clk)
	begin
	output_buffer[7:1]=output_buffer[6:0];
	output_buffer[0:0]=input_stream;
	end

endmodule

/* 
 * This module counts 8 clock cycles and then sets a flag `count_over'
 *
 */

module counter (clk,count_over);

   input clk;
   input clk;
   
   output count_over;
   

reg count_over;
reg[2:0] count_value;

initial
	begin
	count_over=0;
	count_value=3'b000;
	end // initial begin

   
//always @(posedge clk)
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
/* This module checks for the presence of a pack start code 
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

reg[2:0] state;

initial 
	begin
	stop=0;
	state=3'b00;
	end


always @(posedge clk)
	begin
	if ((start==1) && (enable == 1)) 
	begin
	case (state)
		3'b00:	begin
			case (one_byte)
			8'b00000000: begin
                                     state=3'b01;
			   end
			   
			default	   : state=3'b00;	
			endcase
			end
		
		3'b01:	begin
			case (one_byte)
			8'b00000000: state=3'b10;
			default	   : state=3'b00;	
			endcase
			end  

		3'b10:	begin
			case (one_byte)
			8'b10000001: state=3'b11;
			default	   : state=3'b00;	
			endcase
			end
		
		3'b11:	begin
			case (one_byte)
			8'b10111010: begin
				     stop=1;
				     state=3'b111;
				     end
			8'b00000000: state=3'b01;
			default	   : state=3'b00;	
			
                       endcase

			end  
	       3'b111: begin
		        if(start==0)
			   begin
			      stop=0;
			      state=0;
			   end // if (start==0)
	       end // case: 3'b111
	  
              endcase
	end
	
	   
	end // always @ (posedge enable)
   

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
   reg 	  monitor;
   
reg[3:0] count;


initial
	begin
	stop=0;
	scr_reg=0;
	mux_rate_reg=0;
	count=4'b000;
	monitor=0;

	end

   
always @(posedge clk)
   begin
   monitor=start;
   
if ((start && enable )==1)
   begin
      
	case (count)
		4'b000: begin
			scr_reg[7:0]=one_byte[7:0];
			count=count+1;
			end
		4'b001: begin
			scr_reg[15:8]=one_byte[7:0];
			count=count+1;
			end
		4'b010: begin
			scr_reg[23:16]=one_byte[7:0];
			count=count+1;
			end
                4'b011: begin
			scr_reg[31:24]=one_byte[7:0];
			count=count+1;
			end
		4'b100: begin
			scr_reg[39:32]=one_byte[7:0];
			count=count+1;
			end
		4'b101: begin
			mux_rate_reg[7:0]=one_byte[7:0];
			count=count+1;
			end
		4'b110: begin
			mux_rate_reg[15:8]=one_byte[7:0];
			count=count+1;
			end
		4'b111: begin
			mux_rate_reg[23:16]=one_byte[7:0];
			stop=1;
			count=4'b1111;
		end // case: 4'b111
	        4'b1111: begin
		         if (start==0)
			    begin
                             stop=0;
			       count=0;
			    end // if (start==0)
		   end
		   
	endcase
	end // if (start==1)
   

   end // always @ (posedge enable)
   
   

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
	count1=0;
	flag=0;
	for (i=0;i< 8;i=i+1)
		Mem[i]=0;
	stream_temp=0;
	   stream_temp1 = 0;
	   
	stream_id_temp=0;
	end


   
always @(posedge clk)
begin

if ((start==1)&&(flag==0)&&(enable ==1))
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
			//count=count+1;
		   count=count+1;
		   
			end
		3'b100: //begin
			begin
		        rate_bnd_reg[23:16]=one_byte[7:0];		   
			count=count+1;
			end
		3'b101: begin
		//	flag_reg[7:0]=one_byte[7:0];
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
   
      if ((start==1)&&(flag==1)&&(enable==1))
	   begin
	      
		case(count1)
		2'b00:	begin
                           count1=2'b11;
		   // need to wait till next enable signal to check for stream id.
		        end // case: 2'b00
		  
		2'b01:	begin
			stream_temp[7:0]=one_byte[7:0];
		 	count1=count1+1;
			end
		2'b10:	begin
			stream_temp[15:8]=one_byte[7:0];
		 	count1=0;
		        stream_temp1[7:0] = stream_temp;
		   
			case (stream_id_temp)

			8'b11000000: 
			             begin
					Mem[0]=stream_temp1;
					stop=1;flag=0;
				     end // case: 8'b00000011
			  
			8'b11000001: begin
			             Mem[1]=stream_temp1;
			             stop=1;
			             flag=0;
			             end
			   
			8'b11000010: begin
			             Mem[2]=stream_temp1;
			             stop=1;flag=0;
			   
			             end
			8'b11000011: begin
			             Mem[3]=stream_temp1;
			             stop=1;
			             flag=0;
			             end
			8'b11100000: begin
			             Mem[4]=stream_temp1;
			             flag=0;
			             stop=1;
			             end
			8'b11100001: begin
                                     Mem[5]=stream_temp1;
			             stop=1;
			             flag=0;
			             end   
			8'b11100010: begin
			             Mem[6]=stream_temp1;
			             flag=0;
			             stop=1;
			             end   
			8'b11100011: begin
			             Mem[7]=stream_temp1;
			             flag=0;
			             stop=1;
			             end
			   
			endcase // case(stream_id_temp)
		   
		end // case: 2'b10
		  
		2'b11 : begin
		         if (one_byte[7:7]==1)
			    begin
			       stream_id_temp[7:0]=one_byte[7:0];
		 	       count1=2'b01;
			    end // if (one_byte[7:7]==1)
	     
		           else begin
			         stop=1;
			         count1=2'b00;
			   end // else: !if(one_byte[7:7]==1)
		   
			      
		        end
		  
		  
		endcase // case(count1)
		 
	      
	   end // if ((start==1)&&(flag==1))
   
	   
   if (start==0) stop=0;
   
   end // always @ (posedge enable)
   
endmodule

/*  
 * This module processes the pack layer.
 * It also checks for the system_header_start_code and sets sys_header =1 if recognised.
 * It also checks for the stream_end_code and sets stream_done =1 if recognised
 *
 */
 
module read_packet (clk,start,done,input_stream,read_signal,buffer_out,sys_header,stream_done);
   
 input clk;
 input start;
 output done;
 input input_stream;
 input read_signal;
 output buffer_out;
 output stream_done;
 output sys_header;   

 reg 	stream_done;
 reg done;
 reg sys_header;
   
 wire[7:0] input_stream;
 reg[7:0] buffer_out;
 wire prefix_stop;
 reg[3:0] state;
 reg[7:0] stream_id;
 reg[15:0] packet_length;

 
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
       sys_header = 0;
       
    end // initial begin

   assign prefix_start = start & packet_done;
   
   
always @(posedge clk)
   begin
      if (read_signal == 1)
	 begin
     case(state)
    15:
       begin
	  sys_header = 0;
        if (start == 1)
	      state = 0;
       end // case: 15
        
    0:
	if (prefix_stop == 1)
	   begin
	      if (input_stream == 'b10111010)
		 begin
		    done = 1;
		    state = 8;
		 end // if (input_stream == 'b10111010)
	      else
		 begin
		    
		    if (input_stream == 'b10111001)
		       begin
		       done = 1;
		       stream_done = 1;
		       state = 8;
		       end // if (input_stream = 'b10111001)
		    else 
		       if (input_stream == 'b10111011)
			  begin
			     sys_header = 1;
			     state = 15;
			  end // if (input_stream == 'b10111011)
		       else
			  begin
			     state = 2;
			     packet_done = 0;
			     stream_id = input_stream;
			  end // else: !if(input_stream = 'b10111001)
		 end // else: !if(input_stream == 'b10111010)
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
            if (stream_id == 'hbf)
               begin
                 time_stamp_start = 0;
		 state = 7;
               end
            else
               state = 4;
          end
      
   4:  
      if (input_stream != 'hff)
	 begin
           if (input_stream[7:6] == 2'b01)
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
     begin
	if (time_stamp_stop == 1)
	   begin
	      time_stamp_start = 0;
	      if ((NumBytes - timeStampBytes) == 0)
		 begin
		  state = 0;
		 end
	      else
		 begin  
		    timeStampFlag = 0;
		    buffer_out = input_stream;
		    NumBytes = NumBytes - (timeStampBytes + 1);
		    if (NumBytes > 1)
		       begin
			  state = 7;
		       end
		    if (NumBytes == 0)
		       begin
			  state = 0;
			  packet_done = 1;
		       end
		 end  
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
	    NumBytes = NumBytes - 1;
	    
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
end
always
   
if ( time_stamp_stop==1)
   begin
         if ((NumBytes - timeStampBytes) == 0)
           begin
             packet_done = 1;
	   end
        
	    
    end

          
start_code_prefix  module1(clk,prefix_start,prefix_stop,input_stream,read_signal);
time_stamps        module2(clk,time_stamp_start,time_stamp_stop,input_stream,read_signal,timeStampBytes,timeStampFlag);

endmodule

/* 
 * This module processes the timestamps
 */

module time_stamps(clk,start,done,input_stream,read_signal,timeBytes,flag);

input start;
input clk;
   
input read_signal;
input input_stream;
output done;
output timeBytes;
input flag;

wire[7:0] input_stream;
reg done;
reg [3:0] timeBytes;
reg[3:0] state;
reg[32:0] PTS;
reg[32:0] DTS;
reg [3:0] nextstate;

initial
begin
  done = 0;  
  state = 0;
  PTS=0;
  DTS=0;
  timeBytes=0;
  nextstate = 0;
    
end

always @(posedge clk)
   begin
      if (read_signal ==1)
	 begin
  case(state)
  
  0:
     begin
     if ((start == 1) && (flag == 0))
       begin
        if (input_stream[7:4] == 4'b0010)
          begin
	   state = 1;
           PTS[32:30] = input_stream[6:4];
	 end
        if (input_stream[7:4] == 4'b0011)
          begin
           state = 2;
           PTS[32:30] = input_stream[3:1];
          end
        if (input_stream == 'b00001111)
          begin
           timeBytes = 1;
           state = 15;
           done = 1;
          end
       end
      if ((start == 1) && (flag == 1))
	 state = nextstate;
	     
     end	
  
  1:
    begin
     PTS[29:22] = input_stream;
     state = 3;
   end
 
 2:
  begin
     PTS[29:22] = input_stream;
     state = 6;
   end

 15:
    if (start == 0)
     begin
      done  = 0;
      state = 0;
     end
      
 3:
   begin
     PTS[21:15] = input_stream[7:1];
     state = 4;
   end
 4:
   begin
    PTS[14:7] = input_stream;
    state = 5;
   end

 5:
   begin
    PTS[6:0] = input_stream[7:1];
    timeBytes = 5;
    state = 15;
    done = 1;
   end

6:
  begin
     PTS[21:15] = input_stream[7:1];
     state = 7;
   end
 7:
   begin
    PTS[14:7] = input_stream;
    state = 8;
   end

 8:
   begin
    PTS[6:0] = input_stream[7:1];
    state = 9;
   end
  
 9:
   begin
    state = 10;
    DTS[32:30] = input_stream[3:1];
  end

10:
    begin
     DTS[29:22] = input_stream;
     state = 11;
   end

11:
   begin
    DTS[21:15] = input_stream[7:1];
     state = 12;
   end
 12:
   begin
    DTS[14:7] = input_stream;
    state = 13;
   end

 13:
   begin
    DTS[6:0] = input_stream[7:1];
    timeBytes = 10;
    state = 15;
    done = 1;
   end

endcase
 end
end
 always
 
 if (flag==1)
  begin
    if (start == 1)
       begin
        if (input_stream[7:4] == 4'b0010)
          begin
	   nextstate = 1;
           PTS[32:30] = input_stream[6:4];
	 end
        if (input_stream[7:4] == 4'b0011)
          begin
           nextstate = 2;
           PTS[32:30] = input_stream[6:4];
          end
        if (input_stream == 'b00001111)
          begin
           timeBytes = 1;
           nextstate = 15;
           done = 1;
          end
       end
      else
         timeBytes = 0;
    end
   
endmodule

/* 
 * This module waits for the prefix 0x000001 and sets done =1 when it is recongnised
 *
 */

module start_code_prefix(clk,start,done,input_stream,read_signal);

   input clk;
   input start;
   output done;
   input  input_stream;
   input  read_signal;
   
   reg 	  done;
   wire [7:0] input_stream;
   wire       read_signal;
   reg [1:0]  state;
   wire       start;
   
   initial 
      begin
	  state = 0;
	  done = 0;
      end // initial begin
 
  always @(posedge clk)
	   
	 begin 
	    if (read_signal ==1)
	       begin
	   case(state)
	     
	     2'b00:
		if ((input_stream == 0) && (start == 1))
		   begin
		      state = 2'b01;
		   end
	     2'b01:
		begin
		   if (input_stream == 0)
		      begin
			 state = 2'b10;
		      end
		   if (input_stream != 0)
		      state = 2'b00;
		end
	     
	     2'b10:
		begin
		   if (input_stream == 1)
		      begin
			 state = 2'b11;
			 done = 1;
		      end
		   if (input_stream == 0)
		      begin
			 state = 2'b01;
		      end
		   if (input_stream > 1)
		      begin
			 state = 2'b00;
		      end 
		end
	     2'b11:
		if (start == 0)
	         begin
	              state = 2'b00;
		 end
	   endcase // case(state)
	       end
      end    
   always if( start==0)
      done = 0;
   
endmodule









