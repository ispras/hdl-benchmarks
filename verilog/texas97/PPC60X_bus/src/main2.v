
module main(clk);

	input		clk;
   
   /*	See Book IV, p. 44, for a list of signals..  Also see page 7-3 of
    "PowerPC 604 RISC Microprocesor User's Manual".  Here, we use upper
    and lower case characters (input, Inout, and OUTPUT respectively for
    inputs, outputs, and inout ports) to show which signals are of which
    type for each device on the bus.
    
    signal;	// comment :input/Inout/OUTPUT */
   
   /* arbitration signals (for address bus)  */
   
   wire		BR1_;	// bus request CPU1	:CPU1, arb
   wire		BR2_;	// bus request CPU2	:CPU2, arb
   wire		BG1_;	// bus grant CPU1	:cpu1, ARB, mem
   wire		BG2_;	// bus grant CPU2	:cpu2, ARB, mem
   
   wire		ABB_;	// address bus busy	:mem, cpu1, cpu2, arb
   wire         ABB1_;  // address bus busy     :CPU1
   wire         ABB2_;  // address bus busy     :CPU2
   
   /* address start signals */
   
   wire		TS_;	// transfer start	:mem, cpu1, cpu2, arb
   wire         TS1_;   // transfer start       :CPU1
   wire         TS2_;   // transfer start       :CPU2
   
   /* address signals */
   
   wire [0:3] 	AP;	// address bus parity	:mem, cpu1, cpu2, arb
   wire [0:3]   AP1;    // address bus parity   :CPU1
   wire [0:3] 	AP2;    // address bus parity   :CPU2
   
   wire		APE_;	// addr bus parity err	:mem, cpu1, cpu2, arb
   wire		APE1_;	// addr bus parity err	:CPU1
   wire		APE2_;	// addr bus parity err	:CPU2
   
   /* transfer attributes */
   
   wire [4:0] 	TT;	// transfer type	:mem, cpu1, cpu2, arb
   wire [4:0] 	TT1;    // transfer type        :CPU1
   wire [4:0] 	TT2;    // transfer type        :CPU2
   
   wire [2:0] 	TSIZ;	// transfer size	:mem, cpu1, cpu2, arb
   wire [2:0] 	TSIZ1;	// transfer size	:CPU1
   wire [2:0] 	TSIZ2;	// transfer size	:CPU2
   
   wire		TBST_;	// transfer burst	:mem, cpu1, cpu2, arb
   wire         TBST1_; // transfer burst       :CPU1
   wire         TBST2_; // transfer burst       :CPU2
   
   wire [0:2] 	TC;	// transfer code	:mem, cpu1, cpu2, arb
   wire [0:2]   TC1;	// transfer code	:CPU1
   wire [0:2] 	TC2;	// transfer code	:CPU2
   
   wire		CI_;	// cache inhibit	:mem, cpu1, cpu2, arb
   wire		CI1_;	// cache inhibit	:CPU1
   wire		CI2_;	// cache inhibit	:CPU2
   
   wire		WT_;	// write through	:mem, cpu1, cpu2, arb
   wire		WT1_;	// write through	:CPU1
   wire		WT2_;	// write through	:CPU2
   
   wire		GBL_;	// global		:mem, cpu1, cpu2, arb
   wire         GBL1_;  // global               :CPU1 
   wire         GBL2_;  // global               :CPU2
   
   /* address termination signals */
   
   
   wire		AACK_;	// address ack.		:MEM, cpu1, cpu2, arb
   
   wire		ARTRY_;	// address retry	:mem, cpu1, cpu2, arb
   wire		ARTRY1_;// address retry	:CPU1
   wire		ARTRY2_;// address retry	:CPU2
   
   wire		SHD_;	// shared		:mem, cpu1, cpu2, arb
   wire		SHD1_;	// shared		:CPU1
   wire		SHD2_;	// shared		:CPU2
   
   /* data bus arbitration signals */
   
   wire		DBG1_;	// data bus grant CPU1	:cpu1, ARB, mem
   wire		DBG2_;	// data bus grant CPU2	:cpu2, ARB, mem
   
   wire		DBB_;	// data bus busy	:mem, cpu1, cpu2, arb
   wire         DBB1_;  // data bus busy        :CPU1
   wire         DBB2_;  // data bus busy        :CPU2
   
   
   /* data bus signals */
   
   wire [0:7] 	DP;	// data bus parity	:mem, cpu1, cpu2, arb
   wire [0:7]   DP1;	// data bus parity	:CPU1
   wire [0:7] 	DP2;	// data bus parity	:CPU2
   
   wire		DPE_;	// data bus parity err.	:mem, cpu1, cpu2, arb
   wire		DPE1_;	// data bus parity err.	:CPU1
   wire		DPE2_;	// data bus parity err.	:CPU2
   
   /* data bus transfer termination signals */
   
   wire		TA_;	// transfer ack.	:MEM, cpu1, cpu2, arb
   wire		DRTRY_;	// data retry		:MEM, cpu1, cpu2, arb
   
   assign CI_ = CI1_ & CI2_;
   assign APE_ = APE1_ | APE2_;
   assign DPE_ = DPE1_ | DPE2_;
   assign SHD_ = SHD1_ & SHD2_;
   assign WT_ = WT1_ & WT2_;
   assign TSIZ = (TSIZ1 == 'h0) ? TSIZ2 : TSIZ1;
   assign DP = DP1 | DP2;
   assign TC = TC1 | TC2;
   assign AP = AP1 | AP2;
   assign ARTRY_ = ARTRY1_ & ARTRY2_;
   assign GBL_ = GBL1_ & GBL2_;
   assign TBST_ = TBST1_ & TBST2_;
   assign TT = (TT1 == 5'hf) ? TT2 : TT1;
   assign TS_ = TS1_ & TS2_;
   assign ABB_ = ABB1_ & ABB2_;
   assign DBB_ = DBB1_ & DBB2_;   
   
   // Now we lay down instances of the cpu modules, the arbiter, the memory, and
   // perhaps a monitor.
   cpu	cpu1(	.clk(clk),
		.BR_(BR1_),
		.BG_(BG1_),
		.ABB_(ABB_),
		.ABB1_(ABB1_),
		.TS_(TS_),
		.TS1_(TS1_),
		.AP(AP1),
		.APE_(APE1_),
		.TT(TT),
		.TT1(TT1),
		.TSIZ(TSIZ1),
		.TBST_(TBST_),
		.TBST1_(TBST1_),
		.TC(TC1),
		.CI_(CI1_),
		.WT_(WT1_),
		.GBL_(GBL_),
		.GBL1_(GBL1_),
		.AACK_(AACK_),
		.ARTRY_(ARTRY_),
		.ARTRY1_(ARTRY1_),
		.SHD_(SHD1_),
		.DBG_(DBG1_),
		.DBB_(DBB_),
		.DBB1_(DBB1_),
		.DP(DP1),
		.DPE_(DPE1_),
		.TA_(TA_),
		.DRTRY_(DRTRY_));
   
   cpu	cpu2(	.clk(clk),
		.BR_(BR2_),
		.BG_(BG2_),
		.ABB_(ABB_),
		.ABB1_(ABB2_),
		.TS_(TS_),
		.TS1_(TS2_),
		.AP(AP2),
		.APE_(APE2_),
		.TT(TT),
		.TT1(TT2),
		.TSIZ(TSIZ2),
		.TBST_(TBST_),
		.TBST1_(TBST2_),
		.TC(TC2),
		.CI_(CI2_),
		.WT_(WT2_),
		.GBL_(GBL_),
		.GBL1_(GBL2_),
		.AACK_(AACK_),
		.ARTRY_(ARTRY_),
		.ARTRY1_(ARTRY2_),
		.SHD_(SHD2_),
		.DBG_(DBG2_),
		.DBB_(DBB_),
		.DBB1_(DBB2_),
		.DP(DP2),
		.DPE_(DPE2_),
		.TA_(TA_),
		.DRTRY_(DRTRY_));
   
   
   arb2	arb(	.clk(clk),
		.BR1_(BR1_),
		.BR2_(BR2_),
		.BG1_(BG1_),
		.BG2_(BG2_),
		.TS_(TS_),
		.AACK_(AACK_),
		.ARTRY_(ARTRY_),
		.DBG1_(DBG1_),
		.DBG2_(DBG2_));
   
   
   mem	mem(	.clk(clk),
		.TS_(TS_),
		.TT(TT),
		.GBL_(GBL_),
		.AACK_(AACK_),
		.ARTRY_(ARTRY_),
		.DBB_(DBB_),
		.TA_(TA_),
		.DRTRY_(DRTRY_),
		.BG1_(BG1_),
		.BG2_(BG2_),
		.DBG1_(DBG1_));
   
endmodule