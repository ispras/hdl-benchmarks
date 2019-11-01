//typedef enum {IDLE, WAT, RDM, ERR, RDY, RTR } ack_status;   

//`include "bus_1.v"
//`include "slave_1.v"

`define IDLE 3'b000
`define WAT 3'b001
`define RDM 3'b010
`define ERR 3'b011
`define RDY 3'b100
`define RTR 3'b101


`define BUS_IDLE 3'b000
`define BUS_REQ 3'b001
`define BUS_ADDR 3'b010
`define BUS_ADDRDATA 3'b011
`define BUS_DATA 3'b100

`define RESET 2'b00
`define ADDRESS 2'b01
`define DATA_WAIT 2'b10

//typedef enum{MST_IDLE,MST_REQ,MST_ADDR,MST_ADDR_DATA,MST_DATA,MST_RTRCT} status;
//typedef enum{HW_IDLE,HW_REQ,HW_WAT} masterhwst;

`define MST_IDLE 3'b000
`define MST_REQ 3'b001
`define MST_ADDR 3'b010
`define MST_ADDR_DATA 3'b011
`define MST_DATA 3'b100
`define MST_RTRCT 3'b101


`define HW_IDLE 2'b00
`define HW_REQ 2'b01
`define HW_WAT 2'b10



module
   master_controller(clk,A,OPC,DIN,DOUT,LOCK,READ,REQ,GNT,TOUT,ACK, mst_data_tmp, state);
   input clk;
   input [0:31] DIN;
   input  	ACK;
   input 	GNT;
   input 	TOUT;
   output [0:31] DOUT;
   output [0:29] A;
   output [0:3]  OPC;
   output 	 LOCK;
   output 	 READ;
   output 	 REQ;
   output [0:31] mst_data_tmp;
   output [0:2] state;

    wire ACK;
   wire 	 mst_rd;
   wire 	 mst_wr;
   wire 	 mst_lock;
   wire 	 mst_size;
   wire 	 st_mst_rd;
   wire 	 st_mst_wr;
   wire 	 st_mst_last_data;
   wire 	 st_mst_restart;
   wire 	 st_mst_abort;
   wire [0:29] 	 mst_addr;
   

//   master_hw M_HW(mst_rd,mst_wr,mst_lock,mst_size,mst_addr,st_mst_last_data,st_mst_restart,st_mst_restart,st_mst_abort,clk);
   master_hw M_HW(mst_rd,mst_wr,mst_lock,mst_size,mst_addr,st_mst_last_data,st_mst_abort,st_mst_restart,clk);

    reg [0:2] state;
   reg 		 lock_tmp;
   reg 		 read_tmp;
   reg 		 st_mst_rd_tmp;
   reg 		 st_mst_abort_tmp;
   reg [0:31] 	 mst_data_tmp;
   reg [0:29] 	 addr_tmp;
   reg [0:3] 	 opc_tmp;
   reg 		 req_tmp;
   
   
   initial
      begin
	 state = `MST_IDLE;
	 lock_tmp = 0;
	 read_tmp = 0;
	 st_mst_rd_tmp = 0;
	 st_mst_abort_tmp = 0;
	 mst_data_tmp = {{16{1'b0}},{16{1'b1}}};
	 addr_tmp = {30{1'b0}};
	 opc_tmp = 4'b0000;
	 req_tmp = 0;
	 
      end //end initial
   
   
   assign A = addr_tmp; // this may not work
   assign OPC = opc_tmp;
   assign LOCK = lock_tmp;
   assign READ = read_tmp;
   assign REQ = req_tmp;
   assign st_mst_abort = st_mst_abort_tmp;
   assign DOUT = {32{1'b1}};
   assign st_mst_last_data = (state == `MST_DATA)? 1 : 0;
   assign st_mst_rd = (state == `MST_ADDR || state == `MST_ADDR_DATA)? 1 & read_tmp : 0;
   assign st_mst_wr = (state == `MST_ADDR || state == `MST_ADDR_DATA)? 1 & (~read_tmp):0;
   assign st_mst_restart = (state == `MST_RTRCT)? 1 & GNT : 0;
  
   always @(posedge clk) begin
      case (state)
	`MST_IDLE:
	   begin
	       mst_data_tmp = {{16{1'b0}},{16{1'b1}}}; //default value
	      if (mst_rd==0 && mst_wr==0)
		 begin
		    st_mst_abort_tmp=0;
		    state = `MST_IDLE;
		    lock_tmp = 0;
		    req_tmp = 0;
		    addr_tmp = {30{1'b0}};
		    opc_tmp = 4'b0000;
		    read_tmp = 0;
		 end
	      else
		 begin
		    req_tmp = 1;
		    state = `MST_REQ;
		 end
	   end
	`MST_REQ:
	   begin
	      st_mst_abort_tmp = 0;
	      if (GNT == 0)
		 begin
		    req_tmp = 1;
		    state = `MST_REQ;
		 end
	      else
		 begin
		    state = `MST_ADDR;
		    req_tmp = 0;
		    addr_tmp = mst_addr;
		    opc_tmp = (mst_size==1)? 4'b0001:4'b0000;
		    read_tmp = (mst_rd == 1)? 1 : 0;
		    lock_tmp = mst_lock;
		 end
	   end
	`MST_ADDR:
	   begin
	      if (read_tmp == 1)
		 mst_data_tmp = DIN;
	      //else
		// mst_data_tmp = mst_datain;
	      if (lock_tmp == 1)
		 begin
		    state = `MST_ADDR_DATA;
		    req_tmp = 0;
		    addr_tmp = mst_addr;
		    opc_tmp = (mst_size==1)? 4'b0001:4'b0000;
		    read_tmp = (mst_rd == 1)? 1 : 0;
		    lock_tmp = mst_lock;
		 end
	      else	
		 begin
		    state = `MST_DATA;
		    req_tmp = 0;
		    addr_tmp = {30{1'b0}};
		    opc_tmp = 4'b0000;
		    read_tmp = 0;
		    lock_tmp = 0;
		 end
	   end
	`MST_ADDR_DATA:
	   begin
	      if (read_tmp == 1)
		 mst_data_tmp = DIN;
	      //else
		// mst_data_tmp = mst_datain;
	      if ((ACK == `ERR)||(TOUT == 1)) 
		 begin
		    state = `MST_IDLE;
		    st_mst_abort_tmp = 1;
		    lock_tmp = 0;
		    req_tmp = 0;
		    addr_tmp = {30{1'b0}};
		    opc_tmp = 4'b0000;
		    read_tmp = 0;
		 end
	      else if (ACK == `RTR) 
		 state = `MST_RTRCT;
		   else if (((ACK==`RDM)||(ACK==`RDY))&& (lock_tmp == 1))
		      begin
			 req_tmp = 0;
			 addr_tmp = mst_addr;
			 opc_tmp = (mst_size==1)? 4'b0001:4'b0000;
			 read_tmp = (mst_rd == 1)? 1 : 0;
			 lock_tmp = mst_lock;
			 state = `MST_ADDR_DATA;
		      end
			else if (ACK==`WAT)
			   begin
			      state = `MST_ADDR_DATA;
			   end
			     else
				begin
				   req_tmp = 0;
				   addr_tmp = {30{1'b0}};
				   opc_tmp = 4'b0000;
				   read_tmp = 0;
				   lock_tmp = 0;
				   state = `MST_DATA;
				end
	   end
	`MST_DATA:
	   begin
	      if ((ACK == `ERR)||(TOUT == 1))
		 begin
		    state = `MST_IDLE;
		    st_mst_abort_tmp = 1;
		    lock_tmp = 0;
		    req_tmp = 0;
		    addr_tmp = {30{1'b0}};
		    opc_tmp = 4'b0000;
		    read_tmp = 0;
		 end
	      else if (ACK == `RTR)
		 state = `MST_RTRCT;
		   else if (ACK == `WAT)
		      begin
			 if (read_tmp == 1)
			    mst_data_tmp = DIN;
			 req_tmp = 0;
			 state = `MST_DATA;
			 addr_tmp = {30{1'b0}};
			 opc_tmp = 4'b0000;
			 read_tmp = 0;
			 lock_tmp = 0;
		      end
			else if (mst_rd==1 || mst_wr==1)
			   begin
			      req_tmp = 1;
			      state = `MST_REQ;
			   end // if (mst_rd==1 || mst_wr==1)
			     else
				begin
				   req_tmp = 0;
				   st_mst_abort_tmp=0;
				   lock_tmp = 0;
				   addr_tmp = {30{1'b0}};
				   opc_tmp = 4'b0000;
				   read_tmp = 0;
				   state = `MST_IDLE;
				end
			   
	   end
	`MST_RTRCT:
	   begin
	      if (GNT == 1)
		 begin
		    addr_tmp = mst_addr;
		    opc_tmp = (mst_size==1)? 4'b0001:4'b0000;
		    read_tmp = (mst_rd == 1)? 1 : 0;
		    lock_tmp = mst_lock;
		    state = `MST_ADDR;
		 end
	      else
		 begin
		    req_tmp = 1;
		    state = `MST_REQ;
		 end
	   end
	
	
      endcase
   end
endmodule


module
   master_hw(mst_rd,mst_wr,mst_lock,mst_size,mst_addr,st_mst_last_data,st_mst_abort,st_mst_restart,clk);
   output mst_rd;
   output mst_wr;
   output mst_lock;
   output mst_size;
   output [0:29] mst_addr;
   input 	 st_mst_last_data;
   input 	 st_mst_abort;
   input 	 st_mst_restart;
   input 	 clk;
   
   wire 	 mst_rd;
   wire 	 mst_wr;
   wire 	 mst_lock;
   wire 	 mst_size;
   wire [0:29] 	 mst_addr;
      
   reg [0:3] 	 counter;
   reg 		 mstrd;
   reg 		 mstwr;
   reg 		 togglerw;
    	 
    reg statem;
   initial begin
      statem = `HW_IDLE;
  //    togglerw = $ND(0,1);
    //  counter = $ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
      mstrd = 0;
      mstwr = 0;
            
   end
   
   assign mst_rd = mstrd;
   assign mst_wr = mstwr;
   //assign mst_size = $ND(0,1);
   //assign mst_lock = $ND(0,1);
   assign mst_addr = {30{1'b1}};
  
   always @(posedge clk) begin
      case (statem)
	`HW_IDLE:
	   begin
	      statem = `HW_REQ;
	   end
	`HW_REQ:
	   begin
	      togglerw = ~togglerw;
	      if (togglerw == 1)
		 mstrd = 1;
	      else
		 mstwr = 1;
	      statem = `HW_WAT;
	   end 
	`HW_WAT:
	   begin
	      if ((st_mst_last_data == 1) || (st_mst_abort == 1))
		 begin
		    mstrd = 0;
		    mstwr = 0;
		    statem = `HW_IDLE;
		 end
	      else if (st_mst_restart == 1)
		 statem = `HW_REQ;
		   else
		      statem = `HW_WAT;
	   end 
	
      endcase
   end 
endmodule






module pi_state_machine( clk, Din, A, ACK, OPC, READ, filled, data_ready, error, TOUT, Dout, SEL_0, state, dataout);
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
    wire ACK;

    output [0:1] state;   
     output [0:31] 	dataout;

   // the foll stuff is internal stuff
   reg [0:29] 	address;
   reg [0:3] 	opc; // so far I haven't used the opcode stuff
   reg 		read_or_write; // this may not be necc
   reg [0:31] 	dataout;
   reg [0:31] 	datain;
   reg [0:31] 	data;
   
   //these two are internal status registers
     reg  acknowledge;
    reg [0:1] state;
   
   //internal stuff ends here
   //the state diagram starts here   
   initial state = `RESET;
   initial acknowledge = `IDLE;
   
   initial address = 30'b000000000000000000000000000000;
   initial opc = 4'b0000;
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
					 // ignoring the `RDM mode for now
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
			     // ignoring the `RDM mode for now
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
   
//   assign  filled =$ND(0,1);
  // assign  data_ready = $ND(0,1);
 //  assign  error =$ND(0,1);

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
 


// modific for default master etc....
module
   bus_cont(A,OPC,ACK,LOCK,READ,SEL_0,GNT_0,GNT_1,REQ_0,REQ_1,TOUT,clk);

   input [0:29] A;
   input [0:3] 	OPC;
   input  	ACK;
   input 	LOCK;
   input 	READ;
   input 	clk;
   input 	REQ_0;
   input 	REQ_1;
   output 	GNT_0;
   output 	GNT_1;
   output 	SEL_0;
   output 	TOUT;
  
    wire ACK;
   
   wire 	GNT_0;
   wire 	GNT_1;
   wire 	SEL_0;
   wire 	TOUT;

   reg 		GNT_reg_0;
   reg 		GNT_reg_1;
   reg [0:7] 	TOUT_cnt;
   reg 		r_TOUT;
   reg 		select_reg;
   reg  	GNT_mux;
   
    reg state;
   
   
   //assign GNTdm = GNTdm_tmp;
   assign GNT_0 = GNT_reg_0;
   assign GNT_1 = GNT_reg_1;
   assign TOUT = r_TOUT;
   
   assign SEL_0 = (A[0]==1)&&(A[1]==1)&& select_reg;
   
   initial 
      begin
	 state = `BUS_IDLE;
	 GNT_reg_0 = 0;
	 GNT_reg_1 = 0;
	 TOUT_cnt = 8'b00000000;
	 r_TOUT = 0;
	 select_reg = 0;
	 GNT_mux = 0;
      end // initial begin
   
   always @(posedge clk) 
      begin

	 case (state)
	   `BUS_IDLE:
	      begin
		 TOUT_cnt = 8'b00000000;
		 if ((REQ_0 == 0) && (REQ_1==0))
		    state = `BUS_IDLE;
		 else if (REQ_0==1 && REQ_1==1)
		    begin
		       GNT_reg_0 = ~GNT_mux;
		       GNT_reg_1 = GNT_mux;
		       GNT_mux = ~GNT_mux;
		       state = `BUS_REQ;
		    end // else: !if(REQ_0 == 0)
		      else
			 begin
			    if (REQ_0==1)
			       GNT_reg_0=1;
			    else
			       GNT_reg_1=1;
			    GNT_mux = (REQ_0==1)? 1 : 0;
			    state = `BUS_REQ;
			 end // else: !if(REQ_0==1 && REQ_1==1)
		 
	       	      end // case: `BUS_IDLE
	   `BUS_REQ:
	      begin
		 GNT_reg_0 = 0;
		 GNT_reg_1 = 0;
		 if (OPC == 0)
		    select_reg = 0;
		 else
		    select_reg = 1;
		 state = `BUS_ADDR;
	      end // case: `BUS_REQ
	   `BUS_ADDR:
	      begin
		 if ((LOCK == 1) && (OPC == 0))
		    begin
		       select_reg=0;
		       GNT_reg_0 = 0;
		       GNT_reg_1 = 0;
		       state = `BUS_ADDR;
		    end
		 else if ((LOCK == 0) && (OPC == 0))
		    begin
		       if (REQ_0==1 || REQ_1==1)// any req is on
			  begin
			     if (REQ_0==1 && REQ_1==1)
				begin
				   GNT_reg_0 = ~GNT_mux;
				   GNT_reg_1 = GNT_mux;
				   GNT_mux = ~GNT_mux;
				end // else: !if(REQ_0 == 0)
			     else
				begin
				   if (REQ_0==1)
				      GNT_reg_0=1;
				   else
				      GNT_reg_1=1;
				   GNT_mux = (REQ_0==1)? 1 : 0;
				end // else: !if(REQ_0==1 && REQ_1==1)
			     state = `BUS_REQ;
			  end // if (REQ_0==1 || REQ_1==1)
		       else
			  begin
			     GNT_reg_0 = 0;
			     GNT_reg_1 = 0;
			     TOUT_cnt = 8'b00000000;
			     state = `BUS_IDLE;
			  end
		    end // if ((LOCK == 0) && (OPC == 0))
		 
		      else if ((LOCK == 0) && (!(OPC == 0)))
			 begin
			    select_reg=0;
			    
			    if (ACK == `RDY)
			       begin
				  if (REQ_0==1 || REQ_1==1)// any req is on
				     begin
					if (REQ_0==1 && REQ_1==1)
					   begin
					      GNT_reg_0 = ~GNT_mux;
					      GNT_reg_1 = GNT_mux;
					      GNT_mux = ~GNT_mux;
					   end // if (REQ_0==1 && REQ_1==1)
					else
					   begin
					      if (REQ_0==1)
						 GNT_reg_0=1;
					      else
						 GNT_reg_1=1;
					      GNT_mux = (REQ_0==1)? 1 : 0;
					   end // else: !if(REQ_0==1 && REQ_1==1)
					state = `BUS_REQ;
				     end // if (REQ_0==1 || REQ_1==1)
				  else
				     begin
					GNT_reg_0 = 0;
					GNT_reg_1 = 0;
					TOUT_cnt = 8'b00000000;
					state = `BUS_IDLE;
				     end // else: !if(REQ_0==1 || REQ_1==1)
			       end // if (ACK == `RDY)
			    else if (ACK == `ERR)
			       begin
				  GNT_reg_0 = 0;
				  GNT_reg_1 = 0;
				  TOUT_cnt = 8'b00000000;
				  state = `BUS_IDLE;
			       end // if (ACK == `ERR)
				 else
				    begin
				       state = `BUS_DATA;
				    end // else: !if(ACK == `ERR)
			 end // if ((LOCK == 0) && (!(OPC == 0)))
			   else // lock & ~NOP
			      begin
				 if (ACK==`RDY)  
				    select_reg = 1;
				 else
				    select_reg = 0;
				 GNT_reg_0 = 0;
				 GNT_reg_1 = 0;
				 state = `BUS_ADDRDATA;
			      end // else: !if((LOCK == 0) && (!(OPC == 0)))
	      end // case: `BUS_ADDR
	   	   
	   `BUS_ADDRDATA:
	      begin
		 TOUT_cnt = TOUT_cnt + 1;
		 if (TOUT_cnt == 255|| ACK == `ERR)
		    begin
		       r_TOUT =1;
		       TOUT_cnt = 8'b00000000;
		       GNT_reg_0 = 0;
		       GNT_reg_1 = 0;
		       state = `BUS_IDLE;
		    end // if (TOUT_cnt == 1)
		 else if ((LOCK==0)&&(ACK==`RDY)&&(OPC==0))
			  begin
			     if (REQ_0==1 || REQ_1==1)// any req is on
				begin
				   if (REQ_0==1 && REQ_1==1)
				      begin
					 GNT_reg_0  = ~GNT_mux;
					 GNT_reg_1  = GNT_mux;
					 GNT_mux = ~GNT_mux;
				      end // if (REQ_0==1 && REQ_1==1)
				   else
				      begin
					 if (REQ_0==1)
					    GNT_reg_0 =1;
					 else
					    GNT_reg_1 =1;
					 GNT_mux = (REQ_0==1)? 1 : 0;
				      end // else: !if(REQ_0==1 && REQ_1==1)
				   state = `BUS_REQ;
				end // if (REQ_0==1 || REQ_1==1)
			     else
				begin
				   GNT_reg_0 = 0;
				   GNT_reg_1 = 0;
				   TOUT_cnt = 8'b00000000;
				   state = `BUS_IDLE;
				end
			  end // if ((LOCK==0)&&(ACK==`RDY)&&(OPC==0))
		      else if ((LOCK==1)&&(ACK==`RDY)&&(OPC==0))
			 begin
			    GNT_reg_0 = 0;
			    GNT_reg_1 = 0;
			    select_reg = 0;
			    state = `BUS_ADDR;
			 end // if ((LOCK==1)&&(ACK==`RDY)&&(OPC==0))
			   else if (LOCK==0 && ACK==`RDY && OPC!=0)
			      begin
				 select_reg=0;
				 if (ACK == `RDY)
				    begin
				       if (REQ_0==1 || REQ_1==1)// any req is on
					  begin
					     if (REQ_0==1 && REQ_1==1)
						begin
						   GNT_reg_0  = ~GNT_mux;
						   GNT_reg_1  = GNT_mux;
						   GNT_mux = ~GNT_mux;
						end // if (REQ_0==1 && REQ_1==1)
					     else
						begin
						   if (REQ_0==1)
						      GNT_reg_0 =1;
						   else
						      GNT_reg_1 =1;
						   GNT_mux = (REQ_0==1)? 1 : 0;
						end // else: !if(REQ_0==1 && REQ_1==1)
					     state = `BUS_REQ;
					  end // if (REQ_0==1 || REQ_1==1)
				       else
					  begin
					     GNT_reg_0 = 0;
					     GNT_reg_1 = 0;
					     TOUT_cnt = 8'b00000000;
					     state = `BUS_IDLE;
					  end // else: !if(REQ_0 == 1)
				    end // if (ACK == `RDY)
				 
				 else
				    state = `BUS_DATA;
			      end // if (LOCK==0 && ACK==`RDY && OPC!=0)
				else
				   begin
				      if (!((ACK==`WAT)||(ACK ==`RDY)))
					 begin
					    GNT_reg_0 = 0;
					    GNT_reg_1 = 0;
					    select_reg = 0;  //added
					    state = `BUS_IDLE;
					 end // if (!((ACK==`WAT)||(ACK ==`RDY)))
				      else
					 begin
					    if ((ACK == `WAT)||(OPC==0))
					       select_reg=0;
					    else
					       select_reg=1;
					    GNT_reg_0 = 0;
					    GNT_reg_1 = 0;
					    state = `BUS_ADDRDATA;
					 end // else: !if(!((ACK==`WAT)||(ACK ==`RDY)))
				   end // else: !if(LOCK==0 && ACK==`RDY && OPC!=0)
	      end // case: BUS_ADDRDATA
	   
	   `BUS_DATA:
	      begin
		 TOUT_cnt = TOUT_cnt + 1;
		 if ((TOUT_cnt == 255)||(ACK==`ERR))
		    begin
		       r_TOUT = 1;
		       TOUT_cnt = 8'b00000000;
		       GNT_reg_0 = 0;
		       GNT_reg_1 = 0;
		       state = `BUS_IDLE;
		    end // if ((TOUT_cnt == 255)||(ACK==`ERR))
		 else if (ACK==`RDY)
		    begin
		       if (REQ_0==1 || REQ_1==1)
			  begin
			     if (REQ_0==1 && REQ_1==1)
				begin
				   GNT_reg_0  = ~GNT_mux;
				   GNT_reg_1  = GNT_mux;
				   GNT_mux = ~GNT_mux;
				end // if (REQ_0==1 && REQ_1==1)
			     else
				begin
				   if (REQ_0==1)
				      GNT_reg_0 =1;
				   else
				      GNT_reg_1 =1;
				   GNT_mux = (REQ_0==1)? 1 : 0;
				end // else: !if(REQ_0==1 && REQ_1==1)
			     state = `BUS_REQ;
			  end // if (REQ_0==1 || REQ_1==1)
		       else
			  begin
			     r_TOUT = 1;
			     TOUT_cnt = 8'b00000000;
			     GNT_reg_0 = 0;
			     GNT_reg_1 = 0;
			     state = `BUS_IDLE;
			     state = `BUS_DATA;
			  end // else: !if(REQ_0==1 || REQ_1==1)
		    end // if (ACK==`RDY)
		      else
			 state = `BUS_DATA;
	      end // case: `BUS_DATA
	 endcase // case(state)
      end // always @ (posedge clk)
      
   
endmodule	
   








module main (clk);
   input clk;
// THE FOLL WIRES ARE USED FOR INTERCONNECTION
   wire [0:31] data_master2slave;
   wire [0:31] data_master2slave_0;
   wire [0:31] data_master2slave_1;
   wire [0:29] address;
   wire [0:29] address_0;
   wire [0:29] address_1;
   wire [0:3]  opcode;
   wire [0:3]  opcode_0;
   wire [0:3]  opcode_1;
   
    wire    acknowledge;
   wire        read;
   wire        read_0;
   wire        read_1;
   wire        filled;
   wire        data_ready;
   wire        error;
   wire        timeout;
   wire [0:31] data_slave2master;
   wire        select;
   wire        lock;
   wire        lock_0;
   wire        lock_1;
   wire        req_0;
   wire        req_1;
   wire        gnt_0;
   wire        gnt_1;


  wire [0:31] mst_data_tmp1;
    wire [0:31] mst_data_tmp2;	
wire [0:2] state1;
wire [0:2] state2;

wire [0:1] pi_state;
wire [0:31] pi_dataout;


   assign address = address_0 | address_1;
   assign data_master2slave = data_master2slave_0 | data_master2slave_1;
   assign opcode = opcode_0 | opcode_1;
   assign read = read_0 | read_1;
   assign lock = lock_0 | lock_1;
   
  // reg 	       lock_temp, req_tmp;
  // reg [0:3]	       opc_tmp;
//   initial lock_temp = 1; // change this back
  // initial req_tmp = 1;
   //initial opc_tmp = 4'b0001;
   
   
   pi_state_machine slave_0(clk, data_master2slave, address, acknowledge, opcode, read, filled, data_ready, error, timeout, data_slave2master, select, pi_state, pi_dataout);
   dummyslavedevice d_sl_0( filled,error ,data_ready);
   master_controller M_cnt_0(clk,address_0,opcode_0,data_slave2master,data_master2slave_0,lock_0,read_0,req_0,gnt_0,timeout,acknowledge, mst_data_tmp1, state1);
   master_controller M_cnt_1(clk,address_1,opcode_1,data_slave2master,data_master2slave_1,lock_1,read_1,req_1,gnt_1,timeout,acknowledge, mst_data_tmp2, state2);
   bus_cont B_cnt(address,opcode,acknowledge,lock,read,select,gnt_0,gnt_1,req_0,req_1,timeout,clk);// cahneg lock_temp back to lock and change req_temp back to request

   assert property (!((pi_state==2'b01 | pi_state==2'b10) & (acknowledge==3'b100) & (read==1) & (pi_dataout[31]==1) & (select==1)) | (mst_data_tmp1[31]== 1));
   
endmodule

//`include master2_1.v
