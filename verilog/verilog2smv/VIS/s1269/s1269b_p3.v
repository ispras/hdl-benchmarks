/*
*
*	Taken from VIS Benchmarks <ftp://vlsi.colorado.edu/pub/vis/vis-verilog-models-1.3.tar.gz>
*	Modified by Ahmed Irfan <irfan@fbk.eu>
*
*/
// 18 inputs
// 10 outputs
// 37 D-type flipflops
// 132 inverters
// 437 gates (235 ANDs + 74 NANDs + 41 ORs + 87 NORs 0 XORs 0 XNORs)
module s1269(clock, INS, LDAcc, LDMQ, LDDR, STAcc, STMQ, STDR, TESTMODE,
	     inBUS, outBUS, RDY, oLDALUout);
    input	 clock, LDAcc, LDMQ, LDDR, STAcc, STMQ, STDR, TESTMODE;
    input [2:0]  INS;
    input [7:0]  inBUS;
    output [7:0] outBUS;
    output 	 RDY, oLDALUout;

    reg [7:0] 	 Acc_q, MQ_q, DR_q;
    reg [2:0] 	 qINSo;
    reg 	 I679, I680, I681, I682, I683;
    reg 	 qLDALUout, oLDALUout, qPass1, qPass2, qShiftRight;

    wire [7:0]   ALUout, I235, I236, I238, I240, I241, I242, I243,
		 I246, I247, I248, I250;
    wire [2:1] 	 I783;
    wire [2:0] 	 mINSo, INSo;
    wire 	 mShiftRight, ShiftRight, Pass1, Pass2, F, mLDALUout,
		 LDALUout,
		 I710, I711, I712, I759, I686, I251, I252, I292, I306,
		 I290, I310, I308, I296, I302, I761, I741, I737, I749,
		 I735, I745, I751, I755, I765, I685, I757, I739, I747,
		 I684, I688, I687, I287, I283, I281, I277, I285, I303,
		 I279, I730, I754, I768, I744, I764, I300, I294,
		 I298, I311, I315, I330, I337, I769, I772, I788, I791,
		 I794, I808, I811, I816;

    assign I811 = I749 & I751;
    assign I794 = I739 & ~I747;
    assign I330 = ~I243[0] & I287;
    assign I315 = I242[4] & I298;
    assign I337 = I243[1] | I294;
    assign I311 = ~I242[6] | I302;
    assign I761 = ~(DR_q[7] & MQ_q[0]);
    assign I741 = ~(I679 & I682);
    assign I783[2] = INS[1] & I683;
    assign I783[1] = I754 & MQ_q[0] & ~I683;
    assign INSo[2] = INS[2] | ~I683;
    assign INSo[1] = I783[1] | I783[2];
    assign INSo[0] = INS[0] | ~I683;
    assign Pass1 = I680 | I768 | INS[1];
    assign Pass2 = I747 | MQ_q[0] | ~I739;
    assign I739 = ~(INS[0] & I764);
    assign I747 = I735 & I764;
    assign I684 = ~I769 | I730;
    assign I769 = I711 | I749;
    assign I749 = ~(I710 & I681);
    assign I730 = ~(I710 | I788);
    assign I788 = I680 & I681;
    assign I685 = ~(I772 & I751);
    assign I772 = I680 | I712;
    assign I751 = ~(I680 & I712);
    assign I686 = I791 & I712;
    assign I791 = I744 | I745;
    assign I745 = I679 | I680;
    assign I710 = ~ I679;
    assign I711 = ~ I680;
    assign I712 = ~ I681;
    assign I744 = ~(INS[0] | I735);
    assign I735 = ~INS[2] | INS[1];
    assign I687 = ~(I755 & I759 & I757 & I765);
    assign I755 = ~I737 | I761;
    assign I757 = I808 | ~I711;
    assign I765 = ~(I816 & I754 & I761);
    assign I737 = ~(I679 & I681);
    assign I759 = ~I682 | I811;
    assign I754 = ~(I711 | I737);
    assign I808 = I761 & I741;
    assign I816 = DR_q[7] | MQ_q[0];
    assign I688 = I754 | ~I739 | I747;
    assign ShiftRight = I744 | I680 | I679 | I681;
    assign RDY = I754 | I747 | ~I739;
    assign F = ~(I755 & I757 & I759 & I765);
    assign I287 = ~(I242[0] & I235[0]);
    assign I292 = I243[3] & I242[4];
    assign I283 = ~(I243[4] & I242[5]);
    assign I306 = I242[5] & I242[3] & I242[4] & I242[2];
    assign I290 = I242[4] & I300;
    assign I281 = ~(I242[5] & I292);
    assign I277 = ~(I243[1] & I306);
    assign I285 = ~(I294 & I306);
    assign I310 = I283 & I277;
    assign I308 = I281 & I285;
    assign I303 = I337 & I242[2];
    assign I279 = ~(I242[5] & I290);
    assign I296 = ~I243[5] & I279 & I277 & I281;
    assign I302 = I283 & I296 & I285;
    assign ALUout = mINSo[2] ? I236 : I238;
    assign I236 = I235 ^ I242;
    assign I238 = mINSo[1] ? I241 : I240;
    assign I241 = mINSo[0] ? ~I247 : I250;
    assign I240 = mINSo[0] ? I242 : I243;
    assign I250 = I247 | I248;
    assign I242 = I246 ^ I247;
    assign I243 = I246 & I247;
    assign I247 = I251 ? Acc_q : 0;
    assign I248 = I252 ? DR_q : 0;
    assign I246 = mINSo[1] ? ~I248 : I248;
    assign I251 = TESTMODE ? qPass1 : Pass1;
    assign I252 = TESTMODE ? qPass2 : Pass2;
    assign I235[0] = mINSo[1];
    assign I235[1] = ~I287 | I243[0];
    assign I235[2] = I243[1] | I294;
    assign I235[3] = I243[2] | I303;
    assign I235[4] = I243[3] | I298 | I300;
    assign I235[5] = I315 | I290 | I243[4] | I292;
    assign I235[6] = ~(~I243[5] & I279 & I310 & I308);
    assign I235[7] = ~I311 | I243[6];
    assign outBUS = (MQ_q & {8{STMQ}}) |
	   (DR_q & {8{STDR}}) | (Acc_q & {8{STAcc}});
    assign I768 = ~INS[2] | I679 | INS[0] | I681;
    assign I764 = ~(I681 | I745);
    assign mINSo = TESTMODE ? qINSo : INSo;
    assign mShiftRight = TESTMODE ? qShiftRight : ShiftRight;
    assign LDALUout = ~(LDAcc | I794);
    assign mLDALUout = TESTMODE ? qLDALUout : LDALUout;
    assign I300 = I243[2] & I242[3];
    assign I294 = I242[1] & ~I330;
    assign I298 = I242[3] & I303;

    initial begin
	Acc_q = 0;
	MQ_q = 0;
	DR_q = 0;
	I679 = 0;
	I680 = 0;
	I681 = 0;
	I682 = 0;
	I683 = 0;
	qLDALUout = 0;
	oLDALUout = 0;
	qPass1 = 0;
	qPass2 = 0;
	qShiftRight = 0;
	qINSo = 0;
    end // initial begin

    always @ (posedge clock) begin
	if (LDDR) DR_q = inBUS;
    end

    always @ (posedge clock) begin
	if (mShiftRight) begin
	    if (LDMQ) MQ_q = {ALUout[0],MQ_q[7:1]} | inBUS;
	    else MQ_q = {ALUout[0],MQ_q[7:1]};
	end else if (LDMQ) begin
	    MQ_q = inBUS;
	end
    end

    always @ (posedge clock) begin
	if (mShiftRight || mLDALUout || LDAcc) begin
	    Acc_q = 0;
	    if (mLDALUout)   Acc_q = Acc_q | ALUout;
	    if (mShiftRight) Acc_q = Acc_q | {F,ALUout[7:1]};
	    if (LDAcc)       Acc_q = Acc_q | inBUS;
	end
    end

    always @ (posedge clock) begin
	I679 = I684;
	I680 = I685;
	I681 = I686;
	I682 = I687;
	I683 = I688;
	qLDALUout = LDALUout;
	oLDALUout = mLDALUout;
	qPass1 = Pass1;
	qPass2 = Pass2;
	qShiftRight = ShiftRight;
	qINSo = INSo;
    end // always @ (posedge clock)

   /*
    #PASS:
    I679=1 + I680=1 + I681=1 + I682=0 + I683=1;
    (I679=1 + I680=1 + I681=1) -> I683=0;
    (I679=1 + I680=1 + I681=1) -> qShiftRight=1;
    (I679=1 + I680=1 + I681=1) -> qLDALUout=0;
    (I679=1 + I680=1 + I681=1) -> qINSo[2:1]=b10;
    */

   assert property (!(I679 || I680 || I681) || qShiftRight);

   
endmodule // s1269
