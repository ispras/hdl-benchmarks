
//typedef enum{BUS_IDLE,BUS_REQ,BUS_ADDR,BUS_ADDRDATA,BUS_DATA} busst;

`define BUS_IDLE      3'd0
`define BUS_REQ       3'd1
`define BUS_ADDR      3'd2
`define BUS_ADDRDATA  3'd3
`define BUS_DATA      3'd4



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
  
   wire [2:0] ACK;
   
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
   
   reg [2:0] state;
   
   
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
		 
	       	      end // case: BUS_IDLE
	   `BUS_REQ:
	      begin
		 GNT_reg_0 = 0;
		 GNT_reg_1 = 0;
		 if (OPC == 0)
		    select_reg = 0;
		 else
		    select_reg = 1;
		 state = `BUS_ADDR;
	      end // case: BUS_REQ
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
			       end // if (ACK == RDY)
			    else if (ACK == `ERR)
			       begin
				  GNT_reg_0 = 0;
				  GNT_reg_1 = 0;
				  TOUT_cnt = 8'b00000000;
				  state = `BUS_IDLE;
			       end // if (ACK == ERR)
				 else
				    begin
				       state = `BUS_DATA;
				    end // else: !if(ACK == ERR)
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
	      end // case: BUS_ADDR
	   	   
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
			  end // if ((LOCK==0)&&(ACK==RDY)&&(OPC==0))
		      else if ((LOCK==1)&&(ACK==`RDY)&&(OPC==0))
			 begin
			    GNT_reg_0 = 0;
			    GNT_reg_1 = 0;
			    select_reg = 0;
			    state = `BUS_ADDR;
			 end // if ((LOCK==1)&&(ACK==RDY)&&(OPC==0))
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
				    end // if (ACK == RDY)
				 
				 else
				    state = `BUS_DATA;
			      end // if (LOCK==0 && ACK==RDY && OPC!=0)
				else
				   begin
				      if (!((ACK==`WAT)||(ACK ==`RDY)))
					 begin
					    GNT_reg_0 = 0;
					    GNT_reg_1 = 0;
					    select_reg = 0;  //added
					    state = `BUS_IDLE;
					 end // if (!((ACK==WAT)||(ACK ==RDY)))
				      else
					 begin
					    if ((ACK == `WAT)||(OPC==0))
					       select_reg=0;
					    else
					       select_reg=1;
					    GNT_reg_0 = 0;
					    GNT_reg_1 = 0;
					    state = `BUS_ADDRDATA;
					 end // else: !if(!((ACK==WAT)||(ACK ==RDY)))
				   end // else: !if(LOCK==0 && ACK==RDY && OPC!=0)
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
		    end // if ((TOUT_cnt == 255)||(ACK==ERR))
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
		    end // if (ACK==RDY)
		      else
			 state = `BUS_DATA;
	      end // case: BUS_DATA
	 endcase // case(state)
      end // always @ (posedge clk)
      
   
endmodule	
   





