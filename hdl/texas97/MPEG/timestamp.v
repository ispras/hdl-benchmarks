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
      timeBytes = 4'b0101;
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
    timeBytes = 4'b1010;
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
