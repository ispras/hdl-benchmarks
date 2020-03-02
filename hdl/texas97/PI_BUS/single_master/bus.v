/* PI BUS CONTROLLER*/
//typedef enum{BUS_IDLE,BUS_REQ,BUS_ADDR,BUS_ADDRDATA,BUS_DATA} busst;

`define BUS_IDLE      3'd0
`define BUS_REQ       3'd1
`define BUS_ADDR      3'd2
`define BUS_ADDRDATA  3'd3
`define BUS_DATA      3'd4

// modific for default master etc....
module
   bus_cont(A,OPC,ACK,LOCK,READ,SEL_0,GNT_0,REQ_0,TOUT,clk);

   input [0:29] A;
   input [0:3] 	OPC;
   input 	LOCK;
   input 	READ;
   input 	clk;
   input 	REQ_0;
   output 	GNT_0;
   output 	SEL_0;
   output 	TOUT;
  
   input wire [2:0] ACK;
   
   wire 	GNT_0;
   wire 	SEL_0;
   wire 	TOUT;

   reg 		GNTndm_tmp;
   reg [0:7] 	TOUT_cnt;
   reg 		r_TOUT;
   reg 		select_reg;
 		
   reg [2:0] state;
   
   
   //assign GNTdm = GNTdm_tmp;
   assign GNT_0 = GNTndm_tmp;
   assign TOUT = r_TOUT;
   
   assign SEL_0 = (A[0]==1)&&(A[1]==1)&& select_reg;
   
   initial 
      begin
	 state = `BUS_IDLE;
	 GNTndm_tmp = 0;
	 TOUT_cnt = 8'b00000000;
	 r_TOUT = 0;
	 select_reg = 0;	   
      end // initial begin
   
   always @(posedge clk) 
      begin

	 case (state)
	   `BUS_IDLE:
	      begin
		 TOUT_cnt = 8'b00000000;
		 if (REQ_0 == 0)
		    state = `BUS_IDLE;
		 else
		    begin
		       GNTndm_tmp = 1; 
		       state = `BUS_REQ;
		    end // else: !if(REQ_0 == 0)
	      end // case: `BUS_IDLE
	   `BUS_REQ:
	      begin
		 GNTndm_tmp = 0;
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
		       GNTndm_tmp = 0;
		       state = `BUS_ADDR;
		    end
		 
		 if ((LOCK == 0) && (OPC == 0))
		    begin
		       if (REQ_0 == 1)// any req is on
			  begin
			     GNTndm_tmp = 1;
			     state = `BUS_REQ;
			  end // if (REQ_0 == 1)
		       else
			  begin
			     GNTndm_tmp = 0;
			     TOUT_cnt = 8'b00000000;
			     state = `BUS_IDLE;
			  end
		    end
		   
		 if ((LOCK == 0) && (!(OPC == 0)))
		    begin
		       select_reg=0;
		       
		       if (ACK == `RDY)
			  begin
			     if (REQ_0 == 1)// any req is on
				begin
				   GNTndm_tmp = 1;
				   state = `BUS_REQ;
				end // if (REQ_0 == 1)
			     else
				begin
				   GNTndm_tmp = 0;
				   TOUT_cnt = 8'b00000000;
				   state = `BUS_IDLE;
				end // else: !if(REQ_0 == 1)
			  end // if (ACK == `RDY)
		       else
			  begin
			     if (ACK == `WAT)
				begin
				   state = `BUS_DATA;
				end // if (ACK == `WAT)
			     else
				begin
				   GNTndm_tmp = 0;
				   TOUT_cnt = 8'b00000000;
				   state = `BUS_IDLE;
				end // else: !if(ACK == `WAT)
			  end // else: !if(ACK == `RDY)
		    end // if ((LOCK == 0) && (!(OPC == 0)))
		 

		 if ((LOCK==1)&&(!(OPC==0)))
		    begin
		       if (ACK==`RDY)  //changed from `WAT
			  select_reg = 1;
		      // else 
			//  select_reg = 1;
		       
		       GNTndm_tmp = 0;
		       state = `BUS_ADDRDATA;
		    end // else: !if(LOCK == 0 && (!(OPC == 0)))
		 
	      end // case: `BUS_ADDR
	   
	   
	   `BUS_ADDRDATA:
	      begin
		 TOUT_cnt = TOUT_cnt + 1;
		 if (TOUT_cnt == 255)
		    begin
		       r_TOUT =1;
		       TOUT_cnt = 8'b00000000;
		       GNTndm_tmp = 0;
		       state = `BUS_IDLE;
		    end // if (TOUT_cnt == 1)
		 else
		    begin
		       
		       if ((LOCK==0)&&(ACK==`RDY)&&(OPC==0))
			  begin
			     if (REQ_0 == 1)// any req is on
				begin
				   GNTndm_tmp = 1;
				   state = `BUS_REQ;
				end // if (REQ_0 == 1)
			     else
				begin
				   GNTndm_tmp = 0;
				   TOUT_cnt = 8'b00000000;
				   state = `BUS_IDLE;
				end
			  end // if ((LOCK==0)&&(ACK==`RDY)&&(OPC==0))
		       else if ((LOCK==1)&&(ACK==`RDY)&&(OPC==0))
			  begin
			     GNTndm_tmp = 0;
			     select_reg = 0;
			     state = `BUS_ADDR;
			  end // if ((LOCK==1)&&(ACK==`RDY)&&(OPC==0))
			    else
			       if (LOCK==0 && ACK==`RDY && OPC!=0)
				  begin
				     select_reg=0;
				     if (ACK == `RDY)
					begin
					   if (REQ_0 == 1)// any req is on
					      begin
						 GNTndm_tmp = 1;
						 state = `BUS_REQ;
					      end // if (REQ_0 == 1)
					   else
					      begin
						 GNTndm_tmp = 0;
						 TOUT_cnt = 8'b00000000;
						 state = `BUS_IDLE;
					      end // else: !if(REQ_0 == 1)
					end // if (ACK == `RDY)
				     else
					begin
					   if (ACK == `WAT)
					      begin
						 state = `BUS_DATA;
					      end // if (ACK == `WAT)
					   else
					      begin
						 GNTndm_tmp = 0;
						 TOUT_cnt = 8'b00000000;
						 state = `BUS_IDLE;
					      end // else: !if(ACK == `WAT)
					end // else: !if(ACK == `RDY)
				  end // if (LOCK==0 && ACK==`RDY && OPC!=0)
			       else
				  if (!((ACK==`WAT)||(ACK ==`RDY)))
				     begin
					GNTndm_tmp = 0;
					select_reg = 0;  //added
					state = `BUS_IDLE;
				     end // if (!((ACK==`WAT)||(ACK ==`RDY)))
				  else
				     begin
					if ((ACK == `WAT)||(OPC==0))
					   select_reg=0;
					else
					   select_reg=1;
					GNTndm_tmp = 0;
					state = `BUS_ADDRDATA;
				     end // else: !if(!((ACK==`WAT)||(ACK ==`RDY)))
		    end // else: !if(TOUT_cnt == 1)
		 
	      end // case: `BUS_ADDRDATA
	   `BUS_DATA:
	      begin
		 TOUT_cnt = TOUT_cnt + 1;
		 if (TOUT_cnt == 255)
		    begin
		       r_TOUT = 1;
		       TOUT_cnt = 8'b00000000;
		       GNTndm_tmp = 0;
		       state = `BUS_IDLE;
		    end // if (TOUT_cnt == 1)
		 else
		    if (!((ACK == `RDY)||(ACK==`WAT)))
		       begin
			  GNTndm_tmp = 0;
		       end // if (!((ACK == `RDY)||(ACK==`WAT)))
		    else 
		       if (ACK == `RDY)
			  begin
			     if (REQ_0 == 1)// any req is on
				begin
				   GNTndm_tmp = 1;
				   state = `BUS_REQ;
				end // if (REQ_0 == 1)
			     else
				begin
				   GNTndm_tmp = 0;
				   TOUT_cnt = 8'b00000000;
				   state = `BUS_IDLE;
				end // else: !if(REQ_0 == 1)
			  end // if (ACK == `RDY)
		       else
			  state = `BUS_DATA;
	   
	      end // case: `BUS_DATA
	   
	 endcase // case(state)
	 
	

	 end // always @ (posedge clk)
   
   
/*   always @(posedge clk)
      begin

      end // always @ (posedge clk)
   
   
  */ 
   
endmodule	
   
