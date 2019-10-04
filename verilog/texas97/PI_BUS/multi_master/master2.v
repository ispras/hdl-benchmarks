/* A couragious try to implement master protocol of Pi bus                   */

//typedef enum{MST_IDLE,MST_REQ,MST_ADDR,MST_ADDR_DATA,MST_DATA,MST_RTRCT} status;
//typedef enum{HW_IDLE,HW_REQ,HW_WAT} masterhwst;

`define MST_IDLE      3'd0
`define MST_REQ       3'd1
`define MST_ADDR      3'd2
`define MST_ADDR_DATA 3'd3
`define MST_DATA      3'd4
`define MST_RTRCT     3'd5

`define HW_IDLE 2'd0
`define HW_REQ  2'd1
`define HW_WAT  2'd2


module
   master_controller(clk,A,OPC,DIN,DOUT,LOCK,READ,REQ,GNT,TOUT,ACK);
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


   wire [2:0] ACK;
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
   

   master_hw M_HW(mst_rd,mst_wr,mst_lock,mst_size,mst_addr,st_mst_last_data,st_mst_restart,st_mst_restart,st_mst_abort,clk);

   reg [2:0] state;
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
    	 
   reg [1:0] statem;
   initial begin
      statem = `HW_IDLE;
      togglerw = $ND(0,1);
      counter = $ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
      mstrd = 0;
      mstwr = 0;
            
   end
   
   assign mst_rd = mstrd;
   assign mst_wr = mstwr;
   assign mst_size = $ND(0,1);
   assign mst_lock = $ND(0,1);
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









































