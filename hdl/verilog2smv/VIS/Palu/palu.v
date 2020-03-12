/*
*
*	Taken from VIS Benchmarks <ftp://vlsi.colorado.edu/pub/vis/vis-verilog-models-1.3.tar.gz>
*	Modified by Ahmed Irfan <irfan@fbk.eu>
*
*/
// Elementary pipeline.
//
// Author: Fabio Somenzi <Fabio@Colorado.EDU>
//
// This pipeline consists of an ALU and a register file.
// At each clock cycle the pipeline starts the execution of a instruction,
// which completes in three cycles unless stalled:
//  1. Read the operands from the register file.
//  2. Perform the ALU operation.
//  3. Write result back to the register file.
//
// The pipeline supports bypass of the write-back stage. Therefore, if an
// instruction depends on the result of the one immediately preceeding it,
// the pipeline needs to stall for just one cycle.
//
// This is a highly artificial example. Notice in particular that the only
// load operations are those that set a register to either 0 or 1.

module palu(clock,stall,opcode,src1,src2,dest,aluOut);
    parameter	   MSB = 3;
    input	   clock;
    input	   stall;
    input [2:0]	   opcode;
    input [1:0]	   src1;
    input [1:0]	   src2;
    input [1:0]	   dest;
    output [MSB:0] aluOut;

    reg		   bubbleEx;
    reg		   bubbleWb;
    reg [1:0]	   destEx;
    reg [1:0]	   destWb;
    reg [2:0]	   opcodeEx;

    reg [MSB:0]	   regFile[0:3];
    reg [MSB:0]	   op1;
    reg [MSB:0]	   op2;
    reg [MSB:0]	   aluOut;

    integer	   i;

    parameter	   ADD = 3'd0,
		   SUB = 3'd1,
		   ONE = 3'd2,
		   AND = 3'd3,
		   NAND = 3'd4,
		   SRL = 3'd5,
		   SRA = 3'd6,
		   CPA = 3'd7;

    function [MSB:0] ALU;
	input [2:0] opc;
	input [MSB:0] o1;
	input [MSB:0] o2;
    begin: _ALU
	case (opc)
	  ADD:  ALU = o1 + o2;
	  SUB:  ALU = o1 - o2;
	  ONE:  ALU = 1;
	  AND:  ALU = o1 & o2;
	  NAND: ALU = ~(o1 & o2);
	  SRL:  ALU = {1'b0,o1[MSB:1]};
	  SRA:  ALU = {o1[MSB],o1[MSB:1]};
	  CPA:  ALU = o1;
	endcase // case (opc)
    end // block: _ALU
    endfunction // ALU

    initial begin
        for (i = 0; i < 4; i = i + 1)
	    regFile[i] = 0;
	op1 = 0;
	op2 = 0;
	aluOut = 0;
	bubbleEx = 0;
	bubbleWb = 0;
	destEx = 2'd0;
	destWb = 2'd0;
	opcodeEx = 3'd0;
    end // initial begin

    always @ (posedge clock) begin
	if (~bubbleWb) begin
	    regFile[destWb] <= aluOut;
	end // if (~bubbleWb)
    end // always @ (posedge clock)
    always @ (posedge clock) begin
	if (~bubbleEx) begin
	    aluOut <= ALU(opcodeEx,op1,op2);
	    destWb <= destEx;
	end // if (~bubbleEx)
    end // always @ (posedge clock)
    always @ (posedge clock) begin
	if (~stall) begin
	    if (src1 == destWb)		// bypass?
		op1 <= aluOut;
	    else
		op1 <= regFile[src1];
	    if (src2 == destWb)		// bypass?
		op2 <= aluOut;
	    else
		op2 <= regFile[src2];
	    opcodeEx <= opcode;
	    destEx <= dest;
	end // if (~stall)
    end // always @ (posedge clock)
    // Update pipe stall registers.
    always @ (posedge clock) begin
	bubbleWb <= bubbleEx;
    end // always @ (posedge clock)
    always @ (posedge clock) begin
	bubbleEx <= stall;
    end // always @ (posedge clock)

//invariant: !((bubbleEx=1)*(bubbleWb=1)*(regFile<*3*>[3:0]=9)+(regFile<*1*>[3:0]=9)+(regFile<*2*>[3:0]=9)+(regFile<*0*>[3:0]=9));
always @(posedge clock) begin
	assert( !( bubbleEx==1 && bubbleWb==1 && (regFile[3]==4'd9 || regFile[1]==4'd9 || regFile[2]==4'd9 || regFile[0]==4'd9 ) )	);
end

endmodule // palu
