
//`include define.v

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
   
   wire [0:3] 	AP;	// address bus parity	:mem, Cpu1, Cpu2, arb
   wire		APE_;	// addr bus parity err	:mem, CPU1, CPU2, arb
   
   /* transfer attributes */
   
   wire [4:0] 	TT;	// transfer type	:mem, cpu1, cpu2, arb
   wire [4:0] 	TT1;    // transfer type        :CPU1
   wire [4:0] 	TT2;    // transfer type        :CPU2
   
   wire [2:0] 	TSIZ;	// transfer size	:mem, Cpu1, Cpu2, arb
   
   wire		TBST_;	// transfer burst	:mem, cpu1, cpu2, arb
   wire         TBST1_; // transfer burst       :CPU1
   wire         TBST2_; // transfer burst       :CPU2
   
   wire [0:2] 	TC;	// transfer code	:mem, Cpu1, Cpu2, arb
   wire		CI_;	// cache inhibit	:mem, CPU1, CPU2, arb
   wire		WT_;	// write through	:mem, CPU1, CPU2, arb
   
   wire		GBL_;	// global		:mem, cpu1, cpu2, arb
   wire         GBL1_;  // global               :CPU1 
   wire         GBL2_;  // global               :CPU2
   
   /* address termination signals */
   
   wire		AACK_;	// address ack.		:MEM, cpu1, cpu2, arb
   
   wire		ARTRY_;	// address retry	:mem, cpu1, cpu2, arb
   wire		ARTRY1_;// address retry	:CPU1
   wire		ARTRY2_;// address retry	:CPU2
   
   wire		SHD_;	// shared		:mem, Cpu1, Cpu2, arb
   
   /* data bus arbitration signals */
   
   wire		DBG1_;	// data bus grant CPU1	:cpu1, ARB, mem
   wire		DBG2_;	// data bus grant CPU2	:cpu2, ARB, mem
   
   wire		DBB_;	// data bus busy	:mem, cpu1, cpu2, arb
   wire         DBB1_;  // data bus busy        :CPU1
   wire         DBB2_;  // data bus busy        :CPU2
   
   
   /* data bus signals */
   
   wire [0:7]   DP;	// data bus parity	:mem, Cpu1, Cpu2, arb
   wire		DPE_;	// data bus parity err.	:mem, CPU1, CPU2, arb
   
   /* data bus transfer termination signals */
   
   wire		TA_;	// transfer ack.	:MEM, cpu1, cpu2, arb
   wire		DRTRY_;	// data retry		:MEM, cpu1, cpu2, arb

   assign ARTRY2_ = 1;
   assign ARTRY_ = ARTRY1_ & ARTRY2_;
   assign GBL2_ = 1;
   assign GBL_ = GBL1_ & GBL2_;
   assign TBST2_ = 1;
   assign TBST_ = TBST1_ & TBST2_;
   assign TT2 = 5'hz;
   assign TT = TT1;
   assign TS2_ = 1;
   assign TS_ = TS1_ & TS2_;
   assign ABB2_ = 1;
   assign ABB_ = ABB1_ & ABB2_;
   assign DBB2_ = 1;  // only one cpu in this model
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
		.AP(AP),
		.APE_(APE_),
		.TT(TT),
		.TT1(TT1),
		.TSIZ(TSIZ),
		.TBST_(TBST_),
		.TBST1_(TBST1_),
		.TC(TC),
		.CI_(CI_),
		.WT_(WT_),
		.GBL_(GBL_),
		.GBL1_(GBL1_),
		.AACK_(AACK_),
		.ARTRY_(ARTRY_),
		.ARTRY1_(ARTRY1_),
		.SHD_(SHD_),
		.DBG_(DBG1_),
		.DBB_(DBB_),
		.DBB1_(DBB1_),
		.DP(DP),
		.DPE_(DPE_),
		.TA_(TA_),
		.DRTRY_(DRTRY_));
   
   assign	BR2_ = 1;	// There is no cpu2, so we negate BR2_.
   
   
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