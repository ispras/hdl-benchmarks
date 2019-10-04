module start_code_prefix(start,done,input_stream,read_signal);
   
   input start;
   output done;
   input  input_stream;
   input  read_signal;

   reg 	  monitor;
   reg 	  done;
   wire [7:0] input_stream;
   wire       read_signal;
   reg [1:0]  state;
   wire       start;
   
   initial 
      begin
	  state = 0;
	 done = 0;
	 monitor=0;
	 
      end // initial begin
 /*  initial
     $monitor("%0d %b %b %b %b %b",$time,state,input_stream,read_signal,start,done);
  */
  always @(posedge read_signal)
	   
     begin
	monitor=start;
	 if (start==1)
	    begin
	   case(state)
	     
	     2'b00:
		if (input_stream == 0)
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
	    end // if (start=1)
	
      end    
   always if( start==0)
      begin
	  done = 0;
	 monitor=0;
	 
     
	 end
   
endmodule

