/*
*
*	Taken from VIS Benchmarks <ftp://vlsi.colorado.edu/pub/vis/vis-verilog-models-1.3.tar.gz>
*	Modified by Ahmed Irfan <irfan@fbk.eu>
*
*/
// Branch Prediction Buffer
//
// Author: Bobbie Manne
//
// Modified by Fabio Somenzi to use single-phase clocking.

module branchPredictionBuffer(clock,stall,inst_addr,update,branch_result,
			      buffer_addr,buffer_offset,prediction);
    parameter	 PRED_BUFFER_SIZE = 4; // 128 lines with 4 entries/line.
    input [1:0]  inst_addr; // We need to decode up to 4 instructions.
    input 	 branch_result; // Result of a branch calculation.
    input [1:0]  buffer_addr;
    input [1:0]  buffer_offset;
    input 	 clock;
    input 	 stall;      // Stalls when instructions are not available.
    input 	 update;     // Tells the buffer that an update is ready.
    output [3:0] prediction; // Prediction bits sent out to decoder stage.

    reg [3:0] 	 prediction;
    reg [1:0] 	 state_bank0 [PRED_BUFFER_SIZE-1:0];
    reg [1:0] 	 state_bank1 [PRED_BUFFER_SIZE-1:0];
    reg [1:0] 	 state_bank2 [PRED_BUFFER_SIZE-1:0];
    reg [1:0] 	 state_bank3 [PRED_BUFFER_SIZE-1:0];

	reg [3:0] prediction_old;
	reg [1:0] 	 state_bank0_old [PRED_BUFFER_SIZE-1:0];
	reg [1:0] 	 state_bank1_old [PRED_BUFFER_SIZE-1:0];
	reg [1:0] 	 state_bank2_old [PRED_BUFFER_SIZE-1:0];
	reg [1:0] 	 state_bank3_old [PRED_BUFFER_SIZE-1:0];
	
    integer 	 i;

   reg           old;
   
    // The encoding is the following:
    //  0: strong not taken
    //  1: weak not taken
    //  2: weak taken
    //  3: strong taken
    // A branch result of "taken" causes the appropriate entry to be
    // incremented. A branch result of "not taken" causes it to be
    // decremented.

 
    // Always begin in a weak, not taken state
    
    initial begin
         for (i=0; i<PRED_BUFFER_SIZE; i=i+1) begin
	    state_bank0[i] = 2'b01;
	    state_bank1[i] = 2'b01;
	    state_bank2[i] = 2'b01;
	    state_bank3[i] = 2'b01;
	    state_bank0_old[i] = 2'b01;
	    state_bank1_old[i] = 2'b01;
	    state_bank2_old[i] = 2'b01;
	    state_bank3_old[i] = 2'b01;
	end
       old = 1'b0;
       prediction = 4'b0000;
       prediction_old = 4'b0000;
       
    end 
 
	
    always @(posedge clock) begin
	if (!stall) begin
	    if (state_bank3[inst_addr] > 1)
		prediction[3] <= 1;
	    else
		prediction[3] = 0;
	    if (state_bank2[inst_addr] > 1)
		prediction[2] <= 1;
	    else
		prediction[2] <= 0;
	    if (state_bank1[inst_addr] > 1)
		prediction[1] <= 1;
	    else
		prediction[1] <= 0;
	    if (state_bank0[inst_addr] > 1)
		prediction[0] <= 1;
	    else
		prediction[0] <= 0;
	end // if (!stall)

	// We only need to update one location at a time.
	if (update) begin
	    if (branch_result) begin // The branch was taken.
		if (buffer_offset == 0) begin
		    if (state_bank0[buffer_addr] != 2'b11)
		      state_bank0[buffer_addr] <= state_bank0[buffer_addr] + 1;
		end
		else if (buffer_offset == 1) begin
		    if (state_bank1[buffer_addr] != 2'b11)
		      state_bank1[buffer_addr] <= state_bank1[buffer_addr] + 1;
		end
		else if (buffer_offset == 2) begin
		    if (state_bank2[buffer_addr] != 2'b11)
		      state_bank2[buffer_addr] <= state_bank2[buffer_addr] + 1;
		end
		else begin
		    if (state_bank3[buffer_addr] != 2'b11)
		      state_bank3[buffer_addr] <= state_bank3[buffer_addr] + 1;
		end
	    end // if (branch_result)
	    else begin
		if (buffer_offset == 0) begin
		    if (state_bank0[buffer_addr] != 2'b00)
		      state_bank0[buffer_addr] <= state_bank0[buffer_addr] - 1;
		end
		else if (buffer_offset == 1) begin
		    if (state_bank1[buffer_addr] != 2'b00)
		      state_bank1[buffer_addr] <= state_bank1[buffer_addr] - 1;
		end
		else if (buffer_offset == 2) begin
		    if (state_bank2[buffer_addr] != 2'b00)
		      state_bank2[buffer_addr] <= state_bank2[buffer_addr] - 1;
		end
		else begin
		    if (state_bank3[buffer_addr] != 2'b00)
		      state_bank3[buffer_addr] <= state_bank3[buffer_addr] - 1;
		end
	    end // else: !if(branch_result)
	end // if (update)
	
	//storing the old value for X operator in LTL
       old <= 1'b1;
       prediction_old <= prediction;
	for (i=0; i<PRED_BUFFER_SIZE; i=i+1) begin
	    state_bank0_old[i] <= state_bank0[i];
	    state_bank1_old[i] <= state_bank1[i];
	    state_bank2_old[i] <= state_bank2[i];
	    state_bank3_old[i] <= state_bank3[i];
	end	
    end // always @ (posedge clock)

/*#PASS: From strong taken it is impossible to transition to not taken.
# From strong not taken it is impossible to transition to taken.
G((state_bank0<*0*>[1:0]=3 -> X(state_bank0<*0*>[1]=1)) *
  (state_bank0<*1*>[1:0]=3 -> X(state_bank0<*1*>[1]=1)) *
  (state_bank0<*2*>[1:0]=3 -> X(state_bank0<*2*>[1]=1)) *
  (state_bank0<*3*>[1:0]=3 -> X(state_bank0<*3*>[1]=1)) *
  (state_bank1<*0*>[1:0]=3 -> X(state_bank1<*0*>[1]=1)) *
  (state_bank1<*1*>[1:0]=3 -> X(state_bank1<*1*>[1]=1)) *
  (state_bank1<*2*>[1:0]=3 -> X(state_bank1<*2*>[1]=1)) *
  (state_bank1<*3*>[1:0]=3 -> X(state_bank1<*3*>[1]=1)) *
  (state_bank2<*0*>[1:0]=3 -> X(state_bank2<*0*>[1]=1)) *
  (state_bank2<*1*>[1:0]=3 -> X(state_bank2<*1*>[1]=1)) *
  (state_bank2<*2*>[1:0]=3 -> X(state_bank2<*2*>[1]=1)) *
  (state_bank2<*3*>[1:0]=3 -> X(state_bank2<*3*>[1]=1)) *
  (state_bank3<*0*>[1:0]=3 -> X(state_bank3<*0*>[1]=1)) *
  (state_bank3<*1*>[1:0]=3 -> X(state_bank3<*1*>[1]=1)) *
  (state_bank3<*2*>[1:0]=3 -> X(state_bank3<*2*>[1]=1)) *
  (state_bank3<*3*>[1:0]=3 -> X(state_bank3<*3*>[1]=1)) *
  (state_bank0<*0*>[1:0]=0 -> X(state_bank0<*0*>[1]=0)) *
  (state_bank0<*1*>[1:0]=0 -> X(state_bank0<*1*>[1]=0)) *
  (state_bank0<*2*>[1:0]=0 -> X(state_bank0<*2*>[1]=0)) *
  (state_bank0<*3*>[1:0]=0 -> X(state_bank0<*3*>[1]=0)) *
  (state_bank1<*0*>[1:0]=0 -> X(state_bank1<*0*>[1]=0)) *
  (state_bank1<*1*>[1:0]=0 -> X(state_bank1<*1*>[1]=0)) *
  (state_bank1<*2*>[1:0]=0 -> X(state_bank1<*2*>[1]=0)) *
  (state_bank1<*3*>[1:0]=0 -> X(state_bank1<*3*>[1]=0)) *
  (state_bank2<*0*>[1:0]=0 -> X(state_bank2<*0*>[1]=0)) *
  (state_bank2<*1*>[1:0]=0 -> X(state_bank2<*1*>[1]=0)) *
  (state_bank2<*2*>[1:0]=0 -> X(state_bank2<*2*>[1]=0)) *
  (state_bank2<*3*>[1:0]=0 -> X(state_bank2<*3*>[1]=0)) *
  (state_bank3<*0*>[1:0]=0 -> X(state_bank3<*0*>[1]=0)) *
  (state_bank3<*1*>[1:0]=0 -> X(state_bank3<*1*>[1]=0)) *
  (state_bank3<*2*>[1:0]=0 -> X(state_bank3<*2*>[1]=0)) *
  (state_bank3<*3*>[1:0]=0 -> X(state_bank3<*3*>[1]=0)))*/
	
	assert property (	old == 1'b0 || (
                                (state_bank0_old[0]<2'd3 || state_bank0[0]>=2'd2) &&
				(state_bank0_old[1]<2'd3 || state_bank0[1]>=2'd2) &&
				(state_bank0_old[2]<2'd3 || state_bank0[2]>=2'd2) &&	
				(state_bank0_old[3]<2'd3 || state_bank0[3]>=2'd2) &&	
				(state_bank1_old[0]<2'd3 || state_bank1[0]>=2'd2) &&
				(state_bank1_old[1]<2'd3 || state_bank1[1]>=2'd2) &&
				(state_bank1_old[2]<2'd3 || state_bank1[2]>=2'd2) &&	
				(state_bank1_old[3]<2'd3 || state_bank1[3]>=2'd2) &&	
				(state_bank2_old[0]<2'd3 || state_bank2[0]>=2'd2) &&
				(state_bank2_old[1]<2'd3 || state_bank2[1]>=2'd2) &&
				(state_bank2_old[2]<2'd3 || state_bank2[2]>=2'd2) &&	
				(state_bank2_old[3]<2'd3 || state_bank2[3]>=2'd2) &&	
				(state_bank3_old[0]<2'd3 || state_bank3[0]>=2'd2) &&
				(state_bank3_old[1]<2'd3 || state_bank3[1]>=2'd2) &&
				(state_bank3_old[2]<2'd3 || state_bank3[2]>=2'd2) &&	
				(state_bank3_old[3]<2'd3 || state_bank3[3]>=2'd2) &&	
				(state_bank0_old[0]!=2'd0 || state_bank0[0]<2'd2 ) &&
				(state_bank0_old[1]!=2'd0 || state_bank0[1]<2'd2 ) &&
				(state_bank0_old[2]!=2'd0 || state_bank0[2]<2'd2 ) &&	
				(state_bank0_old[3]!=2'd0 || state_bank0[3]<2'd2 ) &&	
				(state_bank1_old[0]!=2'd0 || state_bank1[0]<2'd2 ) &&
				(state_bank1_old[1]!=2'd0 || state_bank1[1]<2'd2 ) &&
				(state_bank1_old[2]!=2'd0 || state_bank1[2]<2'd2 ) &&	
				(state_bank1_old[3]!=2'd0 || state_bank1[3]<2'd2 ) &&	
				(state_bank2_old[0]!=2'd0 || state_bank2[0]<2'd2 ) &&
				(state_bank2_old[1]!=2'd0 || state_bank2[1]<2'd2 ) &&
				(state_bank2_old[2]!=2'd0 || state_bank2[2]<2'd2 ) &&	
				(state_bank2_old[3]!=2'd0 || state_bank2[3]<2'd2 ) &&	
				(state_bank3_old[0]!=2'd0 || state_bank3[0]<2'd2 ) &&
				(state_bank3_old[1]!=2'd0 || state_bank3[1]<2'd2 ) &&
				(state_bank3_old[2]!=2'd0 || state_bank3[2]<2'd2 ) &&	
				(state_bank3_old[3]!=2'd0 || state_bank3[3]<2'd2 ) ) 	);	
/*#PASS: If all lines agree on taken/not taken, the prediction has to agree
# as well on the next clock cycle. To avoid referring to stall, we weaken
# the property and look only at the case in which the prediction already
# agrees in the current state.
G((state_bank3<*0*>[1]=1 * state_bank3<*1*>[1]=1 * state_bank3<*2*>[1]=1 *
   state_bank3<*3*>[1]=1 * prediction[3]=1 -> X(prediction[3]=1)) *
  (state_bank2<*0*>[1]=1 * state_bank2<*1*>[1]=1 * state_bank2<*2*>[1]=1 *
   state_bank2<*3*>[1]=1 * prediction[2]=1 -> X(prediction[2]=1)) *
  (state_bank1<*0*>[1]=1 * state_bank1<*1*>[1]=1 * state_bank1<*2*>[1]=1 *
   state_bank1<*3*>[1]=1 * prediction[1]=1 -> X(prediction[1]=1)) *
  (state_bank0<*0*>[1]=1 * state_bank0<*1*>[1]=1 * state_bank0<*2*>[1]=1 *
   state_bank0<*3*>[1]=1 * prediction[0]=1 -> X(prediction[0]=1)) *
  (state_bank3<*0*>[1]=0 * state_bank3<*1*>[1]=0 * state_bank3<*2*>[1]=0 *
   state_bank3<*3*>[1]=0 * prediction[3]=0 -> X(prediction[3]=0)) *
  (state_bank2<*0*>[1]=0 * state_bank2<*1*>[1]=0 * state_bank2<*2*>[1]=0 *
   state_bank2<*3*>[1]=0 * prediction[2]=0 -> X(prediction[2]=0)) *
  (state_bank1<*0*>[1]=0 * state_bank1<*1*>[1]=0 * state_bank1<*2*>[1]=0 *
   state_bank1<*3*>[1]=0 * prediction[1]=0 -> X(prediction[1]=0)) *
  (state_bank0<*0*>[1]=0 * state_bank0<*1*>[1]=0 * state_bank0<*2*>[1]=0 *
   state_bank0<*3*>[1]=0 * prediction[0]=0 -> X(prediction[0]=0))
);*/
	
/*#FAIL: If all lines agree on taken/not taken, the prediction has to agree
# as well on the next clock cycle. It fails because it ignores stalls.
G((state_bank3<*0*>[1]=1 * state_bank3<*1*>[1]=1 * state_bank3<*2*>[1]=1 *
   state_bank3<*3*>[1]=1 -> X(prediction[3]=1)) *
  (state_bank2<*0*>[1]=1 * state_bank2<*1*>[1]=1 * state_bank2<*2*>[1]=1 *
   state_bank2<*3*>[1]=1 -> X(prediction[2]=1)) *
  (state_bank1<*0*>[1]=1 * state_bank1<*1*>[1]=1 * state_bank1<*2*>[1]=1 *
   state_bank1<*3*>[1]=1 -> X(prediction[1]=1)) *
  (state_bank0<*0*>[1]=1 * state_bank0<*1*>[1]=1 * state_bank0<*2*>[1]=1 *
   state_bank0<*3*>[1]=1 -> X(prediction[0]=1)) *
  (state_bank3<*0*>[1]=0 * state_bank3<*1*>[1]=0 * state_bank3<*2*>[1]=0 *
   state_bank3<*3*>[1]=0 -> X(prediction[3]=0)) *
  (state_bank2<*0*>[1]=0 * state_bank2<*1*>[1]=0 * state_bank2<*2*>[1]=0 *
   state_bank2<*3*>[1]=0 -> X(prediction[2]=0)) *
  (state_bank1<*0*>[1]=0 * state_bank1<*1*>[1]=0 * state_bank1<*2*>[1]=0 *
   state_bank1<*3*>[1]=0 -> X(prediction[1]=0)) *
  (state_bank0<*0*>[1]=0 * state_bank0<*1*>[1]=0 * state_bank0<*2*>[1]=0 *
   state_bank0<*3*>[1]=0 -> X(prediction[0]=0))
);*/

/*# FAIL
!(prediction[3:0]=b1111 * state_bank3<*3*>[1:0]=0 *
state_bank3<*2*>[1:0]=0 * state_bank3<*1*>[1:0]=0 * state_bank3<*0*>[1:0]=0);*/

endmodule // branchPredictionBuffer
