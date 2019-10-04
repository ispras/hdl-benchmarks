//typedef enum {RESET, ADDRESS, DATA_WAIT} slave_status;

`define RESET     2'd0
`define ADDRESS   2'd1
`define DATA_WAIT 2'd2

module pi_state_machine( clk, Din, A, ACK, OPC, READ, filled, data_ready, error, TOUT, Dout, SEL_0);
   //input slave_abort;
   input [0:31] Din;
   input [0:29] A;
   input [0:3] 	OPC;
   input 	READ;
   input 	SEL_0;
   //   input 	LOCK;
   input 	TOUT;
   input 	clk;

   // the foll are the inputs from the slave device
   input 	filled; // indicates that the data buffer of the uo/p device are filled
   input 	data_ready;
   input 	error; // this is a crappy input; do something about it later

   //   input 	 data_ready;
   //   input    slave_done;
   //   input 	 slave_last;
   //   input 	 slave_retract;
   //   input 	 slave_abort;
   //outputs
   output [0:31] Dout;
   output 	 ACK;
   wire [2:0] ACK;


   // the foll stuff is internal stuff
   reg [0:29] 	address;
   reg [0:3] 	opc; // so far I haven't used the opcode stuff
   reg 		read_or_write; // this may not be necc
   reg [0:31] 	dataout;
   reg [0:31] 	datain;
   reg [0:31] 	data;

   //these two are internal status registers
   reg [2:0]  acknowledge;
   reg [1:0] state;

   //internal stuff ends here
   //the state diagram starts here
   initial state = `RESET;
   initial acknowledge = `IDLE;

   initial address = 'b000000000000000000000000000000;
   initial opc = 'b0000;
   initial read_or_write =0;
   initial data = {32{1'b1}}; //the value sent to mst upon request
   initial datain = 0;
   initial dataout =0; //default value of the output dataline

   //	 Dout = z;
   //	 Din = z;
   assign Dout = dataout;
   assign ACK = acknowledge;

   always @(posedge clk)
      begin
	 case (state)
	   `RESET:
	      begin
		 dataout = 0; // should be tristated
		 acknowledge = `IDLE; // should be tristated
		 if (SEL_0 == 1)
		    begin
		       address = A;
		       opc =  OPC;
		       read_or_write = READ;
		       state = `ADDRESS;
		    end // if (SEL_0 == 1)
		 else // the slave is not selected
		    begin
		       state = `ADDRESS;
		       dataout = 0;
		    end // else: !if(SEL_0 == 1)
	      end // case: IDLE
	   `ADDRESS:
	      begin
		 if (error == 1)
		    begin
		       dataout = {32{1'b0}}; // should be tristated
		       acknowledge = `ERR;
		       state = `ADDRESS;
		    end // if (error = 1)
		 // the prev error code is crappy ; do some shit
		 else
		    begin
		       if (SEL_0 == 0)
			  begin
			     dataout = {32{1'b0}}; // should be tristated
			     acknowledge = `IDLE; // should be tristated
			     if (SEL_0 == 1)
				begin
				   address = A;
				   opc =  OPC;
				   read_or_write = READ;
				   state = `ADDRESS;
				end // if (SEL_0 == 1)

			     else // the slave is not selected
				begin
				   state = `ADDRESS;
				end // else: !if(SEL_0 == 1)
			  end // if (SEL_0 == 0)
		       else
			  begin
			     if ((READ && data_ready)||((!READ)&&(!filled)))
				begin
				   if (READ)  // reading
				      begin
					 dataout = data;
					 acknowledge = `RDY;
					 // ignoring the RDM mode for now
					 if (SEL_0 == 1)
					    begin
					       address = A;
					       opc =  OPC;
					       read_or_write = READ;
					       state = `ADDRESS;
					    end // if (SEL_0 == 1)
					 else
					    begin
					       state = `ADDRESS;
					    end // else: !if(SEL_0 == 1)
				      end // if ( read_or_write)
				   else   // writing
				      begin
					 datain = Din;
					 acknowledge = `RDY;
					 if (SEL_0 == 1)
					    begin
					       address = A;
					       opc =  OPC;
					       read_or_write = READ;
					       state = `ADDRESS;
					       dataout = {32{1'b0}};

					    end // if (SEL_0 == 1)
					 else
					    begin
					       state = `ADDRESS;
					    end // else: !if(SEL_0 == 1)
				      end // else: !if( read_or_write)
				end // if ((read_or_write && data_ready)||((!read_or_write)&&(!filled)))
			     if ((READ && (! data_ready))||((!READ) && filled))
				begin
				   acknowledge = `WAT;
				   state = `DATA_WAIT;
				end // if ((read_or_write && (! data_ready))||((!read_or_write) && filled))
			  end // else: !if(SEL_0 == 0)
		       // remember that I have still to add the error branch
		    end // else: !if(error == 1)

	      end // case: `ADDRESS
	   `DATA_WAIT:
	      begin
		 if ((TOUT == 1)||(error ==1))
		    begin
		       dataout = {32{1'b0}};// must be tristated
		       if (error == 1)
			  begin
			     acknowledge = `ERR;
			     state = `ADDRESS;
			  end // if (error == 1)
		       else
			  begin
			     acknowledge =  `IDLE; // must be tristated
			     state = `ADDRESS;
			  end // else: !if(error == 1)
		    end // if (TOUT == 1)
		 if ((READ && data_ready)||((!READ)&&(!filled)))
		    begin
		       if (READ)  // reading
			  begin
			     dataout = data;
			     acknowledge = `RDY;
			     // ignoring the RDM mode for now
			     if (SEL_0 == 1)
				begin
				   address = A;
				   opc =  OPC;
				   read_or_write = READ;
				   state = `ADDRESS;
				end // if (SEL_0 == 1)
			     else
				begin
				   state = `ADDRESS;
				end // else: !if(SEL_0 == 1)
			  end // if ( read_or_write)
		       else   // writing
			  begin
			     datain= Din;
			     acknowledge = `RDY;
			     if (SEL_0 == 1)
				begin
				   address = A;
				   opc =  OPC;
				   read_or_write = READ;
				   state = `ADDRESS;
				end // if (SEL_0 == 1)
			     else
				begin
				   state = `ADDRESS;
				end // else: !if(SEL_0 == 1)
			  end // else: !if( read_or_write)
		    end // if ((read_or_write && data_ready)||((!read_or_write)&&(!filled)))
		 if ((READ && (! data_ready))||((!READ) && filled))
		    begin
		       acknowledge = `WAT;
		       state = `DATA_WAIT;
		    end // if ((read_or_write && (! data_ready))||((!read_or_write) && filled))
		 //************************************************************************************************
	      end // case: `DATA_WAIT
	 endcase // case(state)
      end // always @ (posedge clk)

endmodule // pi_state_machine

module dummyslavedevice ( filled, error, data_ready);

   output filled;
   output error;
   output data_ready;
   //  reg 	  r_filled;
   //  reg   r_error;
   //  reg   r_data_ready;
   //  wire   randchoice;
   //   assign randchoice = $ND(0,1);

   assign  filled =$ND(0,1);
   assign  data_ready = $ND(0,1);
   assign  error =$ND(0,1);

   /*
    always @(posedge clk)
    begin
    if (randchoice == 1)
    begin
    r_filled = 1;
    r_dataready = 1;
    r_error = 1;
	    end // if (randchoice == 1)
    else
	    begin
	       r_filled = 0;
	       r_dataready = 0;
	       r_error = 0;
	    end // else: !if(randchoice == 1)
      end // always @ (posedge clk)
  */
endmodule // dummyslavedevice



































































