module read_packet (start,done,input_stream,read_signal,buffer_out,sys_header,stream_done);
   

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
       sys_header = 0;
       
    end // initial begin

   assign prefix_start = start & packet_done;
   
   
//itial $monitor("%0d %b %b %b %b %b %b %0d %0d %b",$time,state,read_signal,input_stream,stream_id,buffer_out,time_stamp_stop,NumBytes,timeStampBytes,stream_done);
always @(posedge read_signal)
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
always 
if ( time_stamp_stop==1)
   begin
         if ((NumBytes - timeStampBytes) == 0)
           begin
             packet_done = 1;
	   end
        
	    
    end

          
start_code_prefix  module1(prefix_start,prefix_stop,input_stream,read_signal);
//time_stamps        module2(time_stamp_start,time_stamp_stop,input_stream,read_signal,timeStampBytes,timeStampFlag);
time_stamps        module2(time_stamp_start,time_stamp_stop,input_stream,read_signal,timeStampBytes,timeStampFlag);
endmodule



module time_stamps(start,done,input_stream,read_signal,timeBytes,flag);

input start;

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

/*initial 
   $monitor ("%0d     %b   %b  %0d %b  %b %b  %b",$time,start,done,state,timeBytes,read_signal,input_stream,flag);
  */ 
initial
 begin
  done = 0;  
  state = 0;
  PTS=0;
  DTS=0;
  timeBytes=0;
  nextstate = 0;
    
 end

always @(posedge read_signal)
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

module start_code_prefix(start,done,input_stream,read_signal);
   
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
 /*  initial
     $monitor("%0d %b %b %b %b %b",$time,state,input_stream,read_signal,start,done);
  */
  always @(posedge read_signal)
	   
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
   always if( start==0)
      done = 0;
   
endmodule




