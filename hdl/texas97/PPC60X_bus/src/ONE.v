/* Assertion and negation macros for active-low signals: */

`define asserted0  == 0
`define negated1   == 1

// Go ahead and brute force define the transfer types
`define		XferTypeCLEAN_BLOCK	 5'b00000
`define		XferTypeFLUSH_BLOCK      5'b00100
`define		XferTypeSYNC		 5'b01000
`define		XferTypeKILL_BLOCK	 5'b01100
`define		XferTypeEIEIO		 5'b10000
`define		XferTypeTLBIE		 5'b11000
`define		XferTypeLWARX_SET	 5'b00001
`define		XferTypeTLBSYNC		 5'b01001
`define		XferTypeICBI		 5'b01101

		// Write operations
`define		XferTypeWRITE_N_FLUSH	 5'b00010
`define		XferTypeWRITE_N_FLUSH_ATOMIC	 5'b10010
`define		XferTypeWRITE_N_KILL	 5'b00110

		// Read operations
`define		XferTypeREAD		 5'b01010
`define		XferTypeRWITM		 5'b01110
`define		XferTypeREAD_ATOMIC	 5'b11010
`define		XferTypeRWITM_ATOMIC	 5'b11110
`define		XferTypeRWNITC		 5'b01011

/*typedef enum {
	      `CPU1,
	      `CPU2
	      } Cpu;

typedef enum { 
	       ArbiterStatusIDLE1,
	       ArbiterStatusIDLE2,		
	       ArbiterStatusGRANTED1,		
	       ArbiterStatusGRANTED1_AACK,	
	       ArbiterStatusGRANTED2,		
	       ArbiterStatusGRANTED2_AACK 
	       } ArbiterStatus;

typedef enum {
	      AddrStatusIDLE,		
	      AddrStatusDELAY,		
	      AddrStatusAACK_WAIT,
	      AddrStatusAACK	
	      } AddrStatus;


typedef enum {
	       // See for example pp. 8-6 and 8-7, or 8-10 through 8-13 of grey book
	      AddressTenureIDLE,	
	      AddressTenureTS,		// Transaction started
	      AddressTenureAACK_WAIT,	// Wait for AACK
	      AddressTenureAWINDOW,	// Wait one cycle to sample ARTRY_
	      AddressTenureARTRY_HOLD   // Allow other CPU's snoop push
	      } AddressTenure;

typedef enum {
	      DataTenureIDLE,		
	      DataTenureTA_WAIT,	
	      DataTenureDRTRY_CHK_DBB,	   // checking for DRTRY_ of preceding TA_, which wasn't the possible last beat
	      DataTenureDRTRY_CHK_NOT_DBB  // checking for DRTRY_ of preceding last-beat TA_
	      } DataTenure;

typedef enum {	
		SharedControlXU,
		SharedControlXM
		} SharedControl; 

typedef enum {
	      SnoopControlIDLE,
	      SnoopControlTS_1,
	      SnoopControlTS_2,
	      SnoopControlREADY,
	      SnoopControlARTRY,
	      SnoopControlSHARED,
	      SnoopControlBOTH
	      } SnoopControl;

typedef enum {	// Here we use the high-order bit for BR_ assertion, but perhaps that
		// doesn't matter.
		BusRequestIDLE,
		BusRequestNORMAL,
		BusRequestSNOOP,
		BusRequestSNOOP_OLD_DATA,
		BusRequestSNOOP_PENDING_DATA,
		BusRequestSNOOP_FINISH_DATA
	      } BusRequest;*/
//`include define.v

`define		          CPU1 1'b0
`define			      CPU2 1'b1


`define			       ArbiterStatusIDLE1   3'd0
`define			       ArbiterStatusIDLE2	3'd1
`define			       ArbiterStatusGRANTED1	3'd2
`define			       ArbiterStatusGRANTED1_AACK	3'd3
`define			       ArbiterStatusGRANTED2		3'd4
`define			       ArbiterStatusGRANTED2_AACK   3'd5

`define			      AddrStatusIDLE		2'd0
`define			      AddrStatusDELAY		2'd1
`define			      AddrStatusAACK_WAIT   2'd2
`define			      AddrStatusAACK	    2'd3

`define			      AddressTenureIDLE	    3'd0
`define			      AddressTenureTS		3'd1  // Transaction started
`define			      AddressTenureAACK_WAIT	3'd2 // Wait for AACK
`define			      AddressTenureAWINDOW	    3'd3 // Wait one cycle to sample ARTRY_
`define			      AddressTenureARTRY_HOLD   3'd4 // Allow other CPU's snoop push

`define			      DataTenureIDLE		2'd0
`define			      DataTenureTA_WAIT 	2'd1
`define			      DataTenureDRTRY_CHK_DBB	2'd2   // checking for DRTRY_ of preceding TA_, which wasn't the possible last beat
`define			      DataTenureDRTRY_CHK_NOT_DBB  2'd3 // checking for DRTRY_ of preceding last-beat TA_

`define				SharedControlXU  1'b0
`define				SharedControlXM  1'b1

`define			      SnoopControlIDLE  3'd0
`define			      SnoopControlTS_1  3'd1
`define			      SnoopControlTS_2  3'd2
`define			      SnoopControlREADY 3'd3
`define			      SnoopControlARTRY   3'd4
`define			      SnoopControlSHARED  3'd5
`define			      SnoopControlBOTH    3'd6


`define				BusRequestIDLE       3'd0
`define				BusRequestNORMAL     3'd1
`define				BusRequestSNOOP      3'd2
`define				BusRequestSNOOP_OLD_DATA 3'd3
`define				BusRequestSNOOP_PENDING_DATA 3'd4
`define				BusRequestSNOOP_FINISH_DATA  3'd5

module main(clk);
   
	input		clk;
   
   /*	See Book IV, p. 44, for a list of signals..  Also see page 7-3 of
    "PowerPC 604 RISC Microprocesor User's Manual".  Here, we use upper
    and lower case characters (input, Inout, and OUTPUT respectively for
    inputs, outputs, and inout ports) to show which signals are of which
    type for each device on the bus.
    
    signal;	// comment :input/Inout/OUTPUT */
   
   /* arbitration signals (for address bus)  */
   
   wire		BR1_;	// bus request `CPU1	:`CPU1, arb
   wire		BR2_;	// bus request `CPU2	:`CPU2, arb
   wire		BG1_;	// bus grant `CPU1	:cpu1, ARB, mem
   wire		BG2_;	// bus grant `CPU2	:cpu2, ARB, mem
   
   wire		ABB_;	// address bus busy	:mem, cpu1, cpu2, arb
   wire         ABB1_;  // address bus busy     :`CPU1
   wire         ABB2_;  // address bus busy     :`CPU2
   
   /* address start signals */
   
   wire		TS_;	// transfer start	:mem, cpu1, cpu2, arb
   wire         TS1_;   // transfer start       :`CPU1
   wire         TS2_;   // transfer start       :`CPU2
   
   /* address signals */
   
   wire [0:3] 	AP;	// address bus parity	:mem, Cpu1, Cpu2, arb
   wire		APE_;	// addr bus parity err	:mem, `CPU1, `CPU2, arb
   
   /* transfer attributes */
   
   wire [4:0] 	TT;	// transfer type	:mem, cpu1, cpu2, arb
   wire [4:0] 	TT1;    // transfer type        :`CPU1
   wire [4:0] 	TT2;    // transfer type        :`CPU2
   
   wire [2:0] 	TSIZ;	// transfer size	:mem, Cpu1, Cpu2, arb
   
   wire		TBST_;	// transfer burst	:mem, cpu1, cpu2, arb
   wire         TBST1_; // transfer burst       :`CPU1
   wire         TBST2_; // transfer burst       :`CPU2
   
   wire [0:2] 	TC;	// transfer code	:mem, Cpu1, Cpu2, arb
   wire		CI_;	// cache inhibit	:mem, `CPU1, `CPU2, arb
   wire		WT_;	// write through	:mem, `CPU1, `CPU2, arb
   
   wire		GBL_;	// global		:mem, cpu1, cpu2, arb
   wire         GBL1_;  // global               :`CPU1 
   wire         GBL2_;  // global               :`CPU2
   
   /* address termination signals */
   
   wire		AACK_;	// address ack.		:MEM, cpu1, cpu2, arb
   
   wire		ARTRY_;	// address retry	:mem, cpu1, cpu2, arb
   wire		ARTRY1_;// address retry	:`CPU1
   wire		ARTRY2_;// address retry	:`CPU2
   
   wire		SHD_;	// shared		:mem, Cpu1, Cpu2, arb
   
   /* data bus arbitration signals */
   
   wire		DBG1_;	// data bus grant `CPU1	:cpu1, ARB, mem
   wire		DBG2_;	// data bus grant `CPU2	:cpu2, ARB, mem
   
   wire		DBB_;	// data bus busy	:mem, cpu1, cpu2, arb
   wire         DBB1_;  // data bus busy        :`CPU1
   wire         DBB2_;  // data bus busy        :`CPU2
   
   
   /* data bus signals */
   
   wire [0:7]   DP;	// data bus parity	:mem, Cpu1, Cpu2, arb
   wire		DPE_;	// data bus parity err.	:mem, `CPU1, `CPU2, arb
   
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
//`include define.v

/*
 
 ** TABLE OF CONTENTS FOR THIS MODULE
 ************************************
 
 ** PORT DECLARATIONS
 ** FSM ENUMERATION TYPES AND REGISTER DECLARATIONS
 ** SOME OTHER IMPORTANT REGISTERS
 ** SOME USEFUL AUXILIARY TRANSFER ATTRIBUTES
 ** SOME OTHER USEFUL WIRES
 ** BUS REQUEST CONTROLLER	(bus_request_fsm)
 ** ADDRESS TENURE CONTROLLER	(address_tenure_fsm)
 ** "NORMAL DATA PENDING" CONTROLLER
 ** DATA TENURE CONTROLLER	(data_tenure_fsm)
 ** OUTPUTS
 ** SNOOP (AND SHARED) CONTROLLER (snoop_control_fsm)
 ** PROPERTIES
 
 */

/*

 Our cpu includes the following finite state machines.
 
 bus_request_fsm		-- decides non determistically to request for the bus
 (but follows certain requirements, e.g., we request
 the bus when we have snooped an address)
 
 address_tenure_fsm	-- the state of address bus transfer activity;
 
 data_tenure_fsm		-- the state of data bus transfer activity;
 
 snoop_control_fsm	-- controls the address retry mechanism (nondeterministically),
 i.e. ARTRY_ and SHARED_.
 
 */

module	cpu(	.clk(clk),
		.BR_(BR_),
		.BG_(BG_),
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
		.DBG_(DBG_),
		.DBB_(DBB_),
		.DBB1_(DBB1_),
		.DP(DP),
		.DPE_(DPE_),
		.TA_(TA_),
		.DRTRY_(DRTRY_));
   

   /*
    ** PORT DECLARATIONS
    */
   
   input	clk;
   
   /* arbitration signals  */
   
   output		BR_;		// bus request CPU
   input		BG_;		// bus grant CPU
   
   // This pair makes up the former bi-directional ABB_ signal
   input		ABB_;		// address bus busy
   output               ABB1_;
   
   /* address start signals */
   
   // This pair makes up the old bi-directional TS_ signal
   output               TS1_;
   input		TS_;		// transfer start
   
   /* address signals */
   
   // AP not used, configure as output
   output [0:3] 	AP;		// address bus parity
   output		APE_;		// address bus parity error
   
   /* transfer attributes; see page 70, Book IV */
   
   output [4:0] 	TT1;	
   input [4:0] 		TT;		// transfer type
   
   // TSIZ is not truly bi-directional in this module, but it is high-statable... we can just configure it as an output
   output [2:0] 	TSIZ;		// transfer size
   
   // This pair makes up the old bi-directional TBST_ signal
   output               TBST1_;
   input		TBST_;		// transfer burst
   // TC is not implemented, so we'll configure it as an output
   output [0:2] 	TC;		// transfer code
   output		CI_;		// cache inhibit	
   output		WT_;		// write through
   
   // These two implement the old GBL_ signal
   output               GBL1_;
   input		GBL_;		// global
   
   /* address termination signals */
   
   input		AACK_;		// address ack.
   
   // This pair implements the old ARTRY bi-directional signal
   output               ARTRY1_;
   input		ARTRY_;		// address retry
   // SHD is not truly bi-directional... configure it as an output
   output SHD_;		// shared
   
   /* data bus arbitration signals */
   
   input		DBG_;		// data bus grant CPU
   
   // This pair makes up the former bi-direction DBB_ signal
   input	   DBB_;		// data bus busy
   output          DBB1_;
   
   /* data bus signals */
   
   // DP really isn't an output, but since we're not implementing it, it's just easier to configure it as an output 
   output [0:7]    DP;		// data bus parity;
   output		DPE_;		// data bus parity error
   
	/* data bus transfer termination signals */
   
   input		TA_;		// transfer ack.
   input		DRTRY_;		// data retry
   

   /*
    ** FSM ENUMERATION TYPES AND REGISTER DECLARATIONS
    */
   
   
   reg [2:0] address_tenure_fsm;
   
   reg [1:0] data_tenure_fsm;
   
   reg [2:0] snoop_control_fsm;
   
   reg [2:0] bus_request_fsm;
   
   /*
    ** SOME OTHER IMPORTANT REGISTERS
    */
   
   // The register artry_delayed_, which gives the value of ARTRY_ at the previous
   // cycle, is used in the definition of a qualified bus grant.
   
   reg	artry_delayed_;
   always @(posedge clk) begin
		artry_delayed_ <= ARTRY_;
   end
   
   // Here we introduce registers that will be used to generate the corresponding
   // output signals.  Some transaction types can be burst transactions or not, while
   // others are definitely one or the other.  See Table 26, Book IV, p. 70, for a
   // discussion of TBST_.
   
   // NOTE!!!  This model currently ignores snoop pushes when assigning to these
   // registers.  Instead, these registers hold values appropriate to the non-push
   // transactions, so that non-snoop data tenures can trust these signals even when
   // a snoop push address tenure has begun.  Data tenures that occur as part of a
   // snoop push will ignore these signals.
   
   reg  [4:0] out_register_tt;
   
   reg	out_register_gbl_;
   reg	out_register_ci_;
   reg	out_register_wt_;

   reg	tbst_fsm;	// assigned when cpu takes address bus
   
   reg	we_are_last_address_bus_master;
   initial we_are_last_address_bus_master = 1;
   always	@(posedge clk)
      if (TS_`asserted0)
	 we_are_last_address_bus_master =
					 (address_tenure_fsm == `AddressTenureTS);
   
   // The register burst_counter is a number from 0 to 3 that gives the number of TA_
   // assertions during the current data tenure that have not been ruled invalid as
   // of the preceding clock cycle.  We do not need burst_counter to reach 4 because
   // we have a state DataTenureDRTRY_CHK_NOT_DBB of our data tenure fsm that is
   // reached when we might otherwise be tempted to increment burst_counter to 4.
   
   // Note that burst_counter is generally decremented when DRTRY_ invalidates a
   // preceding TA_ (except that if a new TA_ comes in at the same time, then
   // burst_counter is unchanged; and also except that burst_counter is stuck at 3
   // once we have reached the state DataTenureDRTRY_CHK_NOT_DBB).
   
   reg [1:0] burst_counter;
   
   reg	aack_delayed_;	// used by snoop controller
   initial	aack_delayed_ = 1;
   always	@(posedge clk)
      aack_delayed_ = AACK_;
   
   /*
    ** SOME USEFUL AUXILIARY TRANSFER ATTRIBUTES
    */
   
   wire	tt_read;
   wire	tt_write;
   wire	tt_address_only;
   
   assign	tt_write =  (
			     (TT == `XferTypeWRITE_N_FLUSH) ||
			     (TT == `XferTypeWRITE_N_FLUSH_ATOMIC) ||
			     (TT == `XferTypeWRITE_N_KILL) );
   
   assign	tt_read = (
			   (TT == `XferTypeREAD) ||
			   (TT == `XferTypeREAD_ATOMIC) ||
			   (TT == `XferTypeRWITM) ||
			   (TT == `XferTypeRWITM_ATOMIC) );
   
   assign	tt_address_only = !(tt_write || tt_read);
   
   /*
    ** SOME OTHER USEFUL WIRES
    */
   
   wire	data_tenure_in_progress = DBB_`asserted0 || DRTRY_`asserted0; // J. Denison
   
   wire	qualified_data_bus_grant =	// Book IV page 76; see also line above
				  
				  DBG_`asserted0 && !data_tenure_in_progress;
   
   wire	qualified_bus_grant =		// Defined on page 8-10 of grey book and
			     // Book IV, page 64
			     BG_`asserted0 && 
			     ARTRY_`negated1 && 
			     artry_delayed_`negated1 && 
			     
			     // We should really say next that no address tenure is in
			     // progress.  It is OK to use ABB_ to say that, as long as all
			     // devices on the bus use ABB_ (e.g., as long as all devices on
			     // the bus are Typhoons).  If we want to eliminate that
			     // assumption, we will have to add a register that is set when TS_
			     // is asserted and unset when AACK_ is asserted.  Note that our
			     // wire we_are_current_address_bus_master is not appropriate,
			     // because it only tests whether *this* cpu is using the address
			     // bus.
			     
			     // Thus, we should use the ALLOW_NON_TYPHOONS flag here; but if we
			     // do allow non-typhoons, we'll need to define our own abb_
			     // signal, and we prefer to avoid the extra overhead right now.

			     ABB_`negated1;
			     
	reg normal_data_tenure_pending_reg;
	
  // For convenience, here is the indicator of whether we are in the middle of a
   // snoop push, from the assertion of TS_ through the last cycle of the data
   // tenure.
   
   wire snoop_push_in_progress = (	bus_request_fsm == `BusRequestSNOOP_OLD_DATA	||
					bus_request_fsm == `BusRequestSNOOP_PENDING_DATA	||
					bus_request_fsm == `BusRequestSNOOP_FINISH_DATA);
	
	
	   // The complexity in normal_data_tenure_pending (as opposed to just using
   // normal_data_tenure_pending_reg) is due to the _reg taking one cycle after TS_
   // assertion to be up-to-date.
   
	wire normal_data_tenure_pending = (	address_tenure_fsm == `AddressTenureTS &&
						!snoop_push_in_progress &&
						!tt_address_only )
	   ? 1 : normal_data_tenure_pending_reg;
	
   
			     
   // data_tenure_incomplete tells us whether we have to wait to start a new
   // non-snoop address bus transaction.  (We know that we have to wait if there is a
   // current data tenure.)  The point is that we don't yet support any queueing up
   // of data bus transactions (i.e., of TT codes and the like) in a single CPU,
   // except for supporting snoop pushes.
   
   wire data_tenure_incomplete =
				snoop_push_in_progress ||
				((data_tenure_fsm == `DataTenureIDLE) ? normal_data_tenure_pending : 1);
   
   wire	out_register_tbst_ =	// Could ignore the WRITE_N_KILL case; see comment
			    // above out_register_tt.
			( (out_register_tt == `XferTypeWRITE_N_KILL ||
			   out_register_tt == `XferTypeRWITM	   ||
			   out_register_tt == `XferTypeRWITM_ATOMIC)
			  ? 0 : tbst_fsm);
   
   wire snoop_push_data_tenure_in_progress =
					    data_tenure_fsm != `DataTenureIDLE &&
					    (bus_request_fsm == `BusRequestSNOOP_FINISH_DATA ||
					     bus_request_fsm == `BusRequestSNOOP_PENDING_DATA);
   
   wire	data_fsm_tt_write =  (snoop_push_data_tenure_in_progress) ? 1 :
			     
			     // Perhaps we should include WRITE_N_KILL here,
			     // but in the present model that is covered by the
			     // true branch of this if-then-else.
			     
			     ((out_register_tt == `XferTypeWRITE_N_FLUSH) ||
			      (out_register_tt == `XferTypeWRITE_N_FLUSH_ATOMIC));
   
   wire	data_fsm_tt_read = !snoop_push_data_tenure_in_progress && (
								   (out_register_tt == `XferTypeREAD) ||
								   (out_register_tt == `XferTypeREAD_ATOMIC) ||
								   (out_register_tt == `XferTypeRWITM) ||
								   (out_register_tt == `XferTypeRWITM_ATOMIC));
   
   wire	data_fsm_tt_address_only = !(data_fsm_tt_read || data_fsm_tt_write);
   
   wire	data_fsm_tbst_ = (snoop_push_data_tenure_in_progress) ? 0 :
			 out_register_tbst_;
   
   wire	start_data_tenure = (qualified_data_bus_grant &&
			     (snoop_push_in_progress ||
			      (!data_fsm_tt_address_only &&
			       normal_data_tenure_pending)));
   
   wire	artry_asserted_by_this_cpu =
				    (snoop_control_fsm == `SnoopControlARTRY ||
				     snoop_control_fsm == `SnoopControlBOTH);
   
   wire	shd_asserted_by_this_cpu =
				  (snoop_control_fsm == `SnoopControlSHARED ||
				   snoop_control_fsm == `SnoopControlBOTH);
   
   
   
   // The following notion of a "usable" qualified bus grant is not in Book IV, but
   // is intended to avoid granting the address bus while a data bus transaction is
   // pending completion (including the case where a pending data bus transaction has
   // not yet even started).  If we do not make such a restriction, then we will have
   // to save the value of TT (or related nets) for when we are ready to begin the
   // data tenure associated with a given address tenure, and we will have to be
   // careful not to confuse the current data tenure with a change in TT.  We note
   // here (and elsewhere, in more detail) that we give special treatment for the
   // case of snoop push operations.
   
   wire	usable_qualified_bus_grant =
				    qualified_bus_grant && !data_tenure_incomplete;
   
   wire	qualified_need_bus =		// Non-deterministically decided by CPU
			    // 	using bus_request_fsm
			    bus_request_fsm == `BusRequestNORMAL ||
			    bus_request_fsm == `BusRequestSNOOP;

   wire	snoop_push_required =
			     artry_asserted_by_this_cpu && shd_asserted_by_this_cpu;
   
   wire	we_are_current_address_bus_master =
					   
					   // Note that AACK_ is asserted at the final AACK_WAIT cycle, not afterwards, so
					   // the following assignment asserts we_are_current_address_bus_master through
					   // (inclusively) the assertion of AACK_.
					   
					   (address_tenure_fsm == `AddressTenureTS ||
					    address_tenure_fsm == `AddressTenureAACK_WAIT);
   
   // Pages 97-101 of Book IV discuss the various possible snoop responses (ARTRY_
   // and SHD_) for the allowable, non-reserved TT values.  For most of these TT
   // values, ARTRY_ can be asserted, even if only to indicate that snooping wasn't
   // possible (Book IV, page 97, third bullet).  Pages 99-101 describe a number of
   // scenarios in which ARTRY_ can be asserted with SHD_ in order to indicate the
   // necessity of a snoop push; in these cases, it appears that SHD_ may only be
   // asserted with ARTRY_.  However, READ and READ_ATOMIC instructions can produce
   // any combination of ARTRY_ and SHD_.  Some instruction that allow ARTRY_ do not
   // allow SHD_.  Note that we never snoop for TT corresponding to eieio or lwarx
   // (p. 97, Book IV and page 7-15 of grey book).  Nor do we snoop for graphics read
   // or graphics write or reserved instructions.
   
   // For convenience, then, we introduce the following wires corresponding to these
   // various possibilities.  We will use them in our snoop controller.  They should
   // only be sampled during an address tenure.
   
   wire	artry_enabled =
		       
		       ( (GBL_`asserted0 && !we_are_current_address_bus_master &&
			  (TT == `XferTypeCLEAN_BLOCK	||
			   TT == `XferTypeFLUSH_BLOCK	||
			   TT == `XferTypeKILL_BLOCK	||
			   TT == `XferTypeWRITE_N_FLUSH	||
			   TT == `XferTypeWRITE_N_FLUSH_ATOMIC ||
			   TT == `XferTypeWRITE_N_KILL	||
			   TT == `XferTypeREAD		||
			   TT == `XferTypeREAD_ATOMIC	||
			   TT == `XferTypeRWITM		||
			   TT == `XferTypeRWITM_ATOMIC	||
			   TT == `XferTypeTLBIE		||
			   TT == `XferTypeTLBSYNC	||
			   TT == `XferTypeSYNC		||
			   TT == `XferTypeICBI))
			 ||	// We can snoop our own address transactions in the
			 // following cases even if GBL_ is not asserted (Book IV,
									  // page 97).
			 (we_are_current_address_bus_master &&
			  (TT == `XferTypeTLBIE	 ||
			   TT == `XferTypeTLBSYNC ||
			   TT == `XferTypeSYNC	 ||
			   TT == `XferTypeICBI)) );
   
   wire	shared_enabled =
			( (GBL_`asserted0 && !we_are_current_address_bus_master &&
			   (TT == `XferTypeCLEAN_BLOCK		||
			    TT == `XferTypeFLUSH_BLOCK		||
			    TT == `XferTypeWRITE_N_FLUSH	||
			    TT == `XferTypeWRITE_N_FLUSH_ATOMIC ||
			    TT == `XferTypeREAD		||
			    TT == `XferTypeREAD_ATOMIC		||
			    TT == `XferTypeRWITM		||
			    TT == `XferTypeRWITM_ATOMIC	||
			    TT == `XferTypeICBI))
			  ||
			  (we_are_current_address_bus_master && TT == `XferTypeICBI) );
   
   wire	shared_implies_artry =
			      TT == `XferTypeCLEAN_BLOCK	||
			      TT == `XferTypeFLUSH_BLOCK	||
			      TT == `XferTypeWRITE_N_FLUSH	||
			      TT == `XferTypeWRITE_N_FLUSH_ATOMIC ||
			      TT == `XferTypeRWITM		||
			      TT == `XferTypeRWITM_ATOMIC	||
			      TT == `XferTypeICBI ;
   

   
   /*
    ** BUS REQUEST CONTROLLER (bus_request_fsm)
    */

   // bus_request_fsm decides non determistically to request for the bus.
   
   wire [2:0] ran_bus_request_fsm;
   assign ran_bus_request_fsm = $ND(`BusRequestIDLE,`BusRequestNORMAL);
   
   initial	bus_request_fsm <= `BusRequestIDLE;
   
   always @(posedge clk) begin
      
      // Book IV, page 45:  Negation of BR_ occurs for at least 1 bus cycle
      // after a qualified bus grant.  Note that we are not requesting the bus
      // when in state `BusRequestSNOOP_xxx, so we do not implement this
      // requirement simply by moving to the idle state; sometimes we move to
      // the snoop_in_progress state.
      
      // We believe that it is legal to pass up the opportunity for a snoop
      // push.  This will indeed happn if we are in one of the states
      // `BusRequestSNOOP_xxx when snoop_push_required is asserted.  See also the
      // comment in the main module for Book IV, page 75, where we refer to some
      // help we got from Duane Cawthron.
      
      case(bus_request_fsm)
	
	`BusRequestIDLE:
	   if (qualified_bus_grant)
	      bus_request_fsm <= `BusRequestIDLE;
	   else if (snoop_push_required)
	      bus_request_fsm <= `BusRequestSNOOP;
	   else if (ARTRY_`asserted0)
	      
	      // Book IV, page 45:  Must negate BR_ "for at least one
	      // cycle after detection of an ARTRY_, unless this
	      // processor asserted the ARTRY_ itself through a need to
	      // perform a cache line push," i.e., snoop_push_required
	      // holds (the case already covered just above).
	      
	      bus_request_fsm <= `BusRequestIDLE;
	
	   else if (!data_tenure_incomplete)
	      
	      // It's important that we do not ask for the bus if we are
	      // not ready to take it, in order for the timing
	      // requirement of BR_ (page 45, Book IV) to be met:
	      // "Negation occurs for at least 1 bus cycle after a
	      // qualified bus grant...."
	      
	      bus_request_fsm <= ran_bus_request_fsm;
	
	`BusRequestNORMAL:
	   
	   // Note that we have a spec that shows that qualified_bus_grant
	   // and snoop_push_required cannot both be asserted.
	   
	   if (snoop_push_required)

	      // The pending request from BUS has been interrupted by
	      // higher priority from snoop fsm.  Must do a snoop push.
	      
	      bus_request_fsm <= `BusRequestSNOOP;

	   else if (qualified_bus_grant || ARTRY_`asserted0)
	      bus_request_fsm <= `BusRequestIDLE;
	
	`BusRequestSNOOP:
	   if(qualified_bus_grant)	// same condition as for entering
	      // TS state in address_tenure_fsm
	      if (data_tenure_fsm != `DataTenureIDLE)
		 bus_request_fsm <= `BusRequestSNOOP_OLD_DATA;
	      else
		 bus_request_fsm <= `BusRequestSNOOP_PENDING_DATA;
	
	`BusRequestSNOOP_OLD_DATA:
	   if (data_tenure_fsm == `DataTenureIDLE ||
	       
	       // Perhaps we are about to start a new data tenure without
	       // passing through the idle state.
	       
	       (data_tenure_fsm == `DataTenureDRTRY_CHK_NOT_DBB &&
		DRTRY_`negated1))
	      
	      bus_request_fsm <= `BusRequestSNOOP_PENDING_DATA;
	
	`BusRequestSNOOP_PENDING_DATA:
			if (data_tenure_fsm != `DataTenureIDLE)
			   bus_request_fsm <= `BusRequestSNOOP_FINISH_DATA;

	`BusRequestSNOOP_FINISH_DATA:
	   if ((data_tenure_fsm == `DataTenureIDLE ||
		
		// Here we know we will pass through the idle state,
		// because another address tenure cannot start yet.  But
		// let's play it safe in case the model changes later and
		// we forget this part.
		
		(data_tenure_fsm == `DataTenureDRTRY_CHK_NOT_DBB &&
		 DRTRY_`negated1))
	       &&
	       address_tenure_fsm != `AddressTenureAACK_WAIT)
	      
	      if (qualified_bus_grant)
		 bus_request_fsm <= `BusRequestIDLE;
	
	// If we leave out the following case, we can get a
	// violation of the spec labeled /*(1)*/ above, because we
	// could be granted the bus for a normal transaction
	// instead of (the higher-priority) snoop push.  At least,
	// this was true at one point during this model's
	// development:  we found the mistake using Verdict.
	
	      else if (snoop_push_required)
		 bus_request_fsm <= `BusRequestSNOOP;
	      else if (ARTRY_`asserted0)
		 bus_request_fsm <= `BusRequestIDLE;
	      else
		 bus_request_fsm <= ran_bus_request_fsm;
      endcase // case(bus_request_fsm)   
   end // always @ (posedge clk)
   
   
   /*
    ** ADDRESS TENURE CONTROLLER (address_tenure_fsm)
    */
   
   initial	address_tenure_fsm <= `AddressTenureIDLE;
   
   // In order to allow code sharing, we assign the out_registers and tbst_fsm in a
   // separate block, below this one.
   
   always @(posedge clk) begin
      case(address_tenure_fsm) 
	
	`AddressTenureIDLE:
	   
	   // In the current model, we won't start an address tenure until
	   // data tenure has completed.  We plan to remove this restriction
	   // soon; when we do so, we will have to be careful not to confound
	   // the ongoing data tenure with new values of certain nets, e.g.,
	   // TT.  At any rate, even now we allow another cpu's data tenure
	   // to be ongoing.
	   
	   if(	qualified_bus_grant &&
		bus_request_fsm == `BusRequestSNOOP)
	      
	      // The out_registers for tt, gbl_, ci_, and wt_ are not
	      // set during a snoop push.  Instead, there is logic
	      // assigning the appropriate values to the outputs.
	      
	      address_tenure_fsm <= `AddressTenureTS;
	
	   else if(usable_qualified_bus_grant &&
		   bus_request_fsm == `BusRequestNORMAL) begin
		      
		      address_tenure_fsm <= `AddressTenureTS;
		      
		      // out_registers and tbst_fsm assigned elsewhere
		      
		   end
	
	`AddressTenureTS:
	   address_tenure_fsm <= `AddressTenureAACK_WAIT;
	
	// Note that we don't have to force a delay here.  It's the memory's job
	// not to assert AACK_ too soon (as described in the comment in
	// comments.v).
	
	`AddressTenureAACK_WAIT:
	   if(AACK_`asserted0) 
	      address_tenure_fsm <= `AddressTenureAWINDOW;
	
	`AddressTenureAWINDOW:
	   if(ARTRY_`asserted0)
			   
	      // This is the artry_window and current transaction has
	      // been snooped by another cpu.  The transaction queue
	      // need not be empty (i.e bus_request is NORMAL) but we
	      // cannot assert BR_ (book IV page 45); need to go to HOLD
	      // state.
	      
	      address_tenure_fsm <= `AddressTenureARTRY_HOLD;
	
	   else if (usable_qualified_bus_grant) begin
	      
	      // Parked case, p. 66 Book IV.
	      
	      /*??*/				// Somewhere I seem to recall someone saying that bus
	      // parking has a restriction related to whether there is a
	      // corresponding four-beat data tenure, but I don't see
	      // any such restriction in Book IV.
	      
	      address_tenure_fsm <= `AddressTenureTS;
	      
	      // out_registers and tbst_fsm assigned elsewhere
	      
	   end
	
	   else
	      address_tenure_fsm <= `AddressTenureIDLE;
	
	`AddressTenureARTRY_HOLD:
	   address_tenure_fsm <= `AddressTenureIDLE;  
	
      endcase // case(address_tenure_fsm)
   end // always @ (posedge clk)
   
   
   wire [4:0] ran_out_register_tt;
   wire [3:0] ran_out_num;

   assign ran_out_num  = $ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
   assign ran_out_register_tt = (ran_out_num == 0) ? `XferTypeCLEAN_BLOCK :
				(ran_out_num == 1) ? `XferTypeFLUSH_BLOCK :
				(ran_out_num == 2) ? `XferTypeSYNC :
				(ran_out_num == 3) ? `XferTypeKILL_BLOCK :
				(ran_out_num == 4) ? `XferTypeEIEIO :
				(ran_out_num == 5) ? `XferTypeTLBIE :
				(ran_out_num == 6) ? `XferTypeLWARX_SET :
				(ran_out_num == 7) ? `XferTypeTLBSYNC :
				(ran_out_num == 8) ? `XferTypeREAD : // `XferTypeICBI :
				(ran_out_num == 9) ? `XferTypeWRITE_N_FLUSH :
				(ran_out_num == 10) ? `XferTypeWRITE_N_FLUSH_ATOMIC :
				(ran_out_num == 11) ? `XferTypeRWITM :
				(ran_out_num == 12) ? `XferTypeREAD :
				(ran_out_num == 13) ? `XferTypeREAD_ATOMIC : `XferTypeRWITM_ATOMIC;
   wire ran_tbst_fsm;
   assign ran_tbst_fsm = $ND(0,1);
   wire ran_out_register_gbl_;
   assign ran_out_register_gbl_ = $ND(0,1);
   wire ran_out_register_ci_;
   assign ran_out_register_ci_ = $ND(0,1);
   wire ran_out_register_wt_;
   assign ran_out_register_wt_ = $ND(0,1);
   
   always @(posedge clk)

      if ((address_tenure_fsm == `AddressTenureIDLE &&
	   (usable_qualified_bus_grant &&
	    bus_request_fsm == `BusRequestNORMAL))
	  ||
	  (address_tenure_fsm == `AddressTenureAWINDOW &&
	   ARTRY_`negated1 && usable_qualified_bus_grant)) begin
	      
	      out_register_tt <= ran_out_register_tt;
	      
	      tbst_fsm = ran_tbst_fsm; // only used when needed... see out_register_tbst_
	      out_register_gbl_ <= ran_out_register_gbl_;
	      out_register_ci_  <= ran_out_register_ci_;
	      out_register_wt_  <= ran_out_register_wt_;
	   end
   
   /*
    ** "NORMAL DATA PENDING" CONTROLLER
    */
   
   // It is useful to introduce the notion of a normal "pending" data tenure, i.e., a
   // data tenure that has not yet started (or has perhaps just now started) and is
   // "normal" in the sense that it is not part of a snoop push operation.
   

   initial normal_data_tenure_pending_reg <= 0;
   always @(posedge clk)
      if (ARTRY_`asserted0 && we_are_last_address_bus_master)
	 
	 // If ARTRY_ is asserted by another cpu, then the corresponding data tenure is
	 // cancelled (pp. 77-78, Book IV).  Here we rely on the fact that we do not have
	 // address pipelining within a single cpu, i.e., a cpu's pending data tenure must
	 // complete before that cpu starts a new address tenure.  Actually we now do allow
	 // a cpu to start a snoop push address tenure while a previous data tenure of the
	 // cpu is pending completion, but ARTRY_ will not be asserted during a snoop push.
	 
	 normal_data_tenure_pending_reg <= 0;
      else if (address_tenure_fsm == `AddressTenureTS && !snoop_push_in_progress)
	 if (tt_address_only)
	    
	    // Presumably normal_data_tenure_pending_reg is already 0 in
	    // this case, but we haven't checked this.
	    
	    normal_data_tenure_pending_reg <= 0;
	 else
	    normal_data_tenure_pending_reg <= 1;
      else if (data_tenure_fsm != `DataTenureIDLE)
	 
	 // Then we are not waiting for a normal data tenure to start,
	 // since we do not currently queue them up.  We could conjoin
	 // !snoop_push_in_progress) into the condition of the `if' here,
	 // but that is unnecessary:  it's also the case that if we start
	 // the data tenure of a snoop push, then no address tenure has
	 // started since the snoop push address tenure (because the snoop
	 // push data tenure is incomplete; see usable_qualified_bus_grant
	 // and bus_request_fsm), and hence there is no pending normal data
	 // tenure.
	 
	 normal_data_tenure_pending_reg <= 0;
   

   
   /*
    ** DATA TENURE CONTROLLER (data_tenure_fsm)
    */
   
   initial	data_tenure_fsm <= `DataTenureIDLE;
   
   always @(posedge clk) begin
      if(ARTRY_`asserted0 && we_are_last_address_bus_master)
	 
	 // Abort current data transaction when ARTRY_ is asserted.  We
	 // should only do so if the address transaction for the ARTRY_ is
	 // the current address transaction.
	 
	 data_tenure_fsm <= `DataTenureIDLE;
      
      else
			
	 case(data_tenure_fsm) 
	   `DataTenureIDLE:
	      if (start_data_tenure) begin
		 burst_counter = 0;
		 data_tenure_fsm <= `DataTenureTA_WAIT;
	      end
	   
	   `DataTenureTA_WAIT:
	      if (TA_`asserted0)
		 
		 if (data_fsm_tbst_`negated1 || burst_counter == 3)
		    
		    // Data tenure is over, except for possible DRTRY
		    
		    if (data_fsm_tt_write)
		       data_tenure_fsm <= `DataTenureIDLE;
		    else
		       data_tenure_fsm <= `DataTenureDRTRY_CHK_NOT_DBB;
	   
		 else begin
		    burst_counter = burst_counter + 1;
		    if (!data_fsm_tt_write) // No DRTRY on writes
		       data_tenure_fsm <= `DataTenureDRTRY_CHK_DBB;
		    
				end
	   
	   `DataTenureDRTRY_CHK_DBB:
	      
	      // This state will be entered only in read mode, and then only if we are
	      // in burst mode and have not yet seen a final-beat TA_.
	      
	      if(DRTRY_`asserted0)		// darn need to do it again
		 if(TA_`asserted0)		
		    // correction was immediate
		    data_tenure_fsm <= `DataTenureDRTRY_CHK_DBB;
		 else begin
		    burst_counter = burst_counter - 1 ;
		    data_tenure_fsm <= `DataTenureTA_WAIT;
		 end
	   
	      else	// DRTRY_ not asserted.  Since we were not checking the
		 // final-beat TA_, we must be in burst mode and not done
		 // yet.
		 
		 if (TA_`asserted0)
		    if (burst_counter == 3)
		       data_tenure_fsm <= `DataTenureDRTRY_CHK_NOT_DBB;
		    else begin
		       burst_counter = burst_counter + 1 ;
		       data_tenure_fsm <= `DataTenureDRTRY_CHK_DBB;
		    end
		 else
		    data_tenure_fsm <= `DataTenureTA_WAIT;
	   
	   `DataTenureDRTRY_CHK_NOT_DBB:
	      
	      // This state will be entered only in read mode, and then if and only if
	      // we have seen a final-beat TA_.
	      
			if (DRTRY_`asserted0)		// darn need to do it again
			   if(TA_`asserted0)	// correction was immediate
			      data_tenure_fsm <= `DataTenureDRTRY_CHK_NOT_DBB;
			   else			// burst_counter remains at 3
			      data_tenure_fsm <= `DataTenureTA_WAIT;
 			else if (start_data_tenure) begin
			   burst_counter = 0;
			   data_tenure_fsm <= `DataTenureTA_WAIT;
			end
			else
			   data_tenure_fsm <= `DataTenureIDLE;
	 endcase
   end
   
   /* 
    ** OUTPUTS
    */
   
   // Here are the outputs that our model does not yet consider.
   
   // J. Denison
   assign	AP	= 4'bz;
   assign	APE_	= 1'bz;
   assign	TC	= 3'bz;
   assign	DP	= 8'bz;
   assign	DPE_	= 1'bz;

   // BR_
   // Book IV page 45:
   
   // BR_ is only asserted if there is a qualified need bus.  During that time BR_
   // must be retracted when TS is asserted and in case of a retry.  BR_ is also
   // asserted when a snoop push is required.
   
   // We do not request the bus when we are still trying to finish a data tenure,
   // unless we are the snooper.  That's because we can't start a new address tenure
   // until the data tenure is complete.  A different approach would simply be to
   // release BR_ the cycle after a qualified_bus_grant, but we would presumably have
   // to introduce an extra register (qualified_bus_grant_delayed) in order to
   // implement such an approach.  The present approach could waste a cycle, but
   // since we are already severely restricting pipelining, that seems like a minor
   // point.  It is probably a good idea to add address bus pipelining when we get a
   // chance.  For the Typhoon (Book IV, p. 67), up to four data tenures may be
   // queued up and not yet begun, so for example one could have an address tenure
   // whose corresponding data tenure has not yet completed even though many other
   // address tenures (of which 4 are not address-only) have already completed.
   
   assign BR_ =  !(	// BR_ is active low, so we negate the following
			(	!data_tenure_incomplete &&
				
				bus_request_fsm == `BusRequestNORMAL &&
				
				// Should release immediately when TS_ is issued, and
				// also should never request bus during hold state unless
				// snoop push is required (handled with `BusRequestSNOOP
							   // below).
				
				!((address_tenure_fsm == `AddressTenureTS) || 
				  (address_tenure_fsm == `AddressTenureARTRY_HOLD))
				)
		        || bus_request_fsm == `BusRequestSNOOP);
   
   
   // DBB_:
   // book IV page 53; see also page 83
   assign	ABB1_	= we_are_current_address_bus_master ? 1'b0 : 1'b1;
   
   assign	DBB1_	= 	(data_tenure_fsm == `DataTenureTA_WAIT ||
				 data_tenure_fsm == `DataTenureDRTRY_CHK_DBB)
      ?  1'b0 : 1'b1;
   
   assign	TT1	= we_are_current_address_bus_master ?
			  (snoop_push_in_progress ? `XferTypeWRITE_N_KILL
			   : out_register_tt)
      : 5'b1;
   
   assign	TBST1_	= we_are_current_address_bus_master ?
			  (snoop_push_in_progress ? 1'b0 : out_register_tbst_)
      : 1'b1;
   
   /*??*/	// Do we have the following right?
   // Page 101, Book IV says to pretend that WIM=000 for copybacks and snoop pushes,
   // with an exception for WT_ pointed to (page 72).  At the moment I believe that
   // we do not implement copybacks, so there is no exception:  and since the
   // following three signals are active low, we assign them each to the value 1
   // during a snoop push while we are the address bus master.
   
	assign	GBL1_	= we_are_current_address_bus_master ?
			  (snoop_push_in_progress ?	1'b1 : (
								
								// Book IV, point #6 near the top of page 102 says that
								// WIM=xx1 in the following cases, so we assign GBL_ to 0
								// in these cases since GBL_ is active low.
								
								(TT == `XferTypeSYNC	||
								 TT == `XferTypeTLBSYNC	||
								 TT ==`XferTypeTLBIE	||
								 TT == `XferTypeEIEIO)	?	1'b0 : out_register_gbl_))
	   : 1'b1;
   
   assign	CI_	= we_are_current_address_bus_master ?
			  (snoop_push_in_progress ? 1'b1 : out_register_ci_)
      : 1'b1;	
   assign	WT_	= we_are_current_address_bus_master ?
			  (snoop_push_in_progress ? 1'b0 : out_register_wt_)
      : 1'b1;	
   
   assign 	TS1_	= (address_tenure_fsm == `AddressTenureTS) ?  1'b0 : 1'b1;
   
   assign	ARTRY1_	= artry_asserted_by_this_cpu ? 1'b0 : 1'b1;
   
   assign	SHD_	= shd_asserted_by_this_cpu ? 1'b0 : 1'b1;
   
        wire [2:0] ran_TSIZ;
   assign ran_TSIZ = $ND(0,1,2,3,4,5,6,7);
   assign	TSIZ	= we_are_current_address_bus_master ?
			  (TBST_`asserted0 ? 3'b010 : ran_TSIZ) :
			  3'b0;
   
   /*
    ** SNOOP (AND SHARED) CONTROLLER (snoop_control_fsm)
    */
   
   // (Via Anna, from Suksoon:)  For 1:1 ratio, the snoop RESPONSE window can occur
   // as early as four cycles after the assertion of TS_.  ARTRY_ is deasserted one
   // cycle following the assertion of AACK_ (Book IV, page 50).
   
   wire [2:0] ran_snoop_control_fsm;
   assign ran_snoop_control_fsm = $ND(`SnoopControlBOTH, `SnoopControlREADY);
   wire [2:0] ran_snoop_control_fsm2;
   assign ran_snoop_control_fsm2 = $ND(`SnoopControlBOTH, `SnoopControlARTRY, `SnoopControlSHARED, `SnoopControlREADY);
   wire [2:0] ran_snoop_control_fsm3;
   assign ran_snoop_control_fsm3 = $ND(`SnoopControlARTRY, `SnoopControlREADY);
   
   initial	snoop_control_fsm <= `SnoopControlIDLE;
   always @(posedge clk) begin
      
      if (TS_`asserted0)
	 snoop_control_fsm <= `SnoopControlTS_1;
      else if (aack_delayed_`asserted0)
	 snoop_control_fsm <= `SnoopControlIDLE;
      else
	 
	 case (snoop_control_fsm)
	   
	   `SnoopControlTS_1:	// TS_ asserted one cycle ago
	      
	      snoop_control_fsm <= `SnoopControlTS_2;
	   
	   `SnoopControlTS_2:	// TS_ asserted two cycles ago; must wait at least
	      // one more cycle
	      
	      snoop_control_fsm <= `SnoopControlREADY;
	   
	   `SnoopControlREADY:
	      
	      if (shared_enabled)
		 if (shared_implies_artry)
		    snoop_control_fsm <= ran_snoop_control_fsm;
		 else	// note shared_enabled implies artry_enabled
		    snoop_control_fsm <= ran_snoop_control_fsm2;
	   
	      else if (artry_enabled)
		 snoop_control_fsm <= ran_snoop_control_fsm3;						  
	   
		default: // must wait for TS_ assertion to change states; handled above
		   
			snoop_control_fsm <= snoop_control_fsm;
	   
		endcase
      
   end // always @ (posedge clk)
endmodule // cpu
//`include define.v

module	mem(	.clk(clk),
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

	input	clk;

	/* address start signals */
	
	input		TS_;		// transfer start

	/* transfer attributes; see page 70, Book IV */

	input	[0:4] TT;	       	// transfer type
   
	input		GBL_;		// global

	/* address termination signals */

	output		AACK_;		// address ack.
	input		ARTRY_;		// address retry

	/* data bus arbitration signals */

	input		DBB_;		// data bus busy

	/* data bus transfer termination signals */

	output		TA_;		// transfer ack.
	output		DRTRY_;		// data retry

	input		BG1_,BG2_,DBG1_;

	// TEA_ is omitted here.

        // need to add a random variable for use with Address Status
        wire [1:0] ran_address_status;
   

        reg [1:0] addr_status_fsm;
   
	initial addr_status_fsm <= `AddrStatusIDLE;

	reg hold_ta;

        assign ran_address_status = $ND(`AddrStatusAACK_WAIT,`AddrStatusAACK);
   
	initial hold_ta <= 0;

	// As explained in a comment in define.c, AACK_ may not be asserted until at least
	// 3 cycles after assertion of TS_.  Also TA_ may not be asserted too soon
	// according to the same rule; see page 77, point #1.  So, we introduce a finite
	// state machine addr_status_fsm that monitors the progress of an address tenure.
	// We also introduce a register hold_ta that tells us to wait before asserting
	// TA_, which becomes 1 exactly at the first time that AACK_ *could* be asserted,
	// whether it is actually asserted then or not.

	// There is no need to wait when the operation is a snoop push, indeed whenever
	// GBL_ is negated.  We take advantage of this use of hold_ta as suggested by the
	// scenario in Note 2 below.

	always @(posedge clk)
		case (addr_status_fsm)

		`AddrStatusIDLE:

			if (TS_`asserted0) begin
				addr_status_fsm <= `AddrStatusDELAY;
				if (TT != 5'b00110)	// was XferTypeWRITE_N_KILL J. Denison// not a snoop push
					hold_ta <= 1;
			end

		`AddrStatusDELAY:

			addr_status_fsm <= `AddrStatusAACK_WAIT;

		`AddrStatusAACK_WAIT: begin

			hold_ta <= 0;
		   addr_status_fsm <= ran_address_status;
		   
		end

		`AddrStatusAACK:

			addr_status_fsm <= `AddrStatusIDLE;

		endcase

	/*
	** logic for AACK_
	*/

	assign AACK_ = (addr_status_fsm == `AddrStatusAACK) ? 1'b0 : 1'bz;

	// The Data Bus stuff

	// The protocol requires (page 77, point #1; see also comments.v) that TA_ not be
	// asserted until at least 3 cycles after TS_ is asserted.  However, we support
	// split-bus transactions.  Consider what happens if cpu2 starts an address tenure
	// (by asserting TS_) when cpu1 starts its data tenure.  There need be no delay in
	// that case.  The rule is:  when a data tenure starts, the memory only needs to
	// delay TA_ if the data bus master is the same as the address bus master.
	// Otherwise, the opportunity for ARTRY_ has already passed.

	// NOTE 1:  Suppose that cpu1 is ready to start a data tenure, then cpu2 starts an
	// address tenure, and cpu1 then snoops cpu2's address tenure.  Then there does
	// not need to be any delay in sending TA for the cpu1 (original) data tenure,
	// because the delay in asserting ARTRY_ on cpu2's address tenure is more than
	// enough delay for cpu1's (first) data tenure.

	// NOTE 2:  We allow address bus pipelining when a snoop push needs to take place.
	// A snoop push is never snooped (see the shared_enabled signal in cpu.v; also see
	// the comment below above the assignment of must_delay_ta), and it's a good
	// thing.  For suppose (for example) that cpu1 starts a data tenure (for an
	// earlier address tenure), then cpu2 starts an address tenure, then cpu1 snoops
	// cpu2's address tenure and starts an address tenure for its snoop push (but
	// suppose that cpu1's earlier data tenure is far from complete), and then cpu2
	// snoops cpu1 (we are presuming this can't happen and are about to show why we
	// care).  Since cpu1 currently owns both the data bus and the address bus (even
	// though the data tenure does not correspond to the address tenure), our model
	// would use this ARTRY_ to cancel the current cpu1 data tenure, which would be a
	// mistake.  As it is, since hold_ta is not set when we are doing a snoop push, we
	// will be ready to assert TA_ on the old data tenure.


	/*
	** Address and data bus masters
	*/

	// First, let's figure out which cpu is the address bus master.  The idea is that
	// whenever we see a bus grant, we remember who was granted the bus, and if TS_ is
	// asserted at the next cycle then we know who asserted it.  Here, we define the
	// address bus master as the cpu which last asserted TS_ (and by this we mean to
	// consider a cpu currently asserting TS_ as the address bus master).

	 reg next_address_bus_master;
         reg address_bus_master_fsm;

// LOOK HERE JUSTIN
        initial address_bus_master_fsm <= `CPU1;

	always @(posedge clk) begin
		if (BG1_`asserted0)
			next_address_bus_master <= `CPU1;
		else if (BG2_`asserted0)
			next_address_bus_master <= `CPU2;
	end // always @ (posedge clk)
   
	always @(posedge clk) begin
	   if (TS_`asserted0) begin
	      if (next_address_bus_master == `CPU1) address_bus_master_fsm <= `CPU1;
	      else address_bus_master_fsm <= `CPU2;
	   end // if (TS_`asserted0)
	end // always @ (posedge clk)
   

//	verdict_init address_bus_master_fsm == `CPU1 ||
//		     address_bus_master_fsm == `CPU2;

	 wire address_bus_master =
		(TS_`asserted0) ? next_address_bus_master : address_bus_master_fsm;

	// Next, let's figure out which cpu is the data bus master.  The idea is that
	// whenever we see a data bus grant, we remember who was granted the data bus.
	// Here, we define the data bus master as the cpu that last took the data bus
	// (starting with the cycle where DBB_ is asserted, including that cycle).

	 reg data_bus_master;

	initial data_bus_master <= `CPU1;

	always @(posedge clk)
		if (DBB_`negated1)
			data_bus_master <= (DBG1_`asserted0) ? `CPU1 : `CPU2;

	/*
	** Assignment of TA_
	*/
	
	wire valid_artry = (ARTRY_`asserted0 && data_bus_master == address_bus_master);
		reg ta_reg_;	// the value of TA_ at the next cycle, if TA_ is legal

    	// The wire must_delay_ta is only valid when a data tenure in progress, as defined
	// by assertion of DBB_ or DRTRY_ (cf. page 56, Book IV).  If GBL_ is negated,
	// then we do not have to delay TA_.  (Thanks to Anna Lam for pointing this out;
	// note also that GBL_ is negated during a snoop push, cf. Book IV page 49).

	wire must_delay_ta = (data_bus_master == address_bus_master && hold_ta
							&& GBL_`asserted0);
		
	assign TA_ = (	(DBB_`asserted0 || DRTRY_`asserted0) &&
			!valid_artry &&
			!must_delay_ta ) ? ta_reg_ : 1;
   wire ran_ta_reg_;
   assign ran_ta_reg_ = $ND(0,1);
   

	initial ta_reg_ <= 1;
	always @(posedge clk)
	   ta_reg_ <= ran_ta_reg_;
   



	

	/*
	** Assignment of DRTRY_
	*/
   wire ran_DRTRY_;
   
   assign ran_DRTRY_ = $ND(0,1);
   
	reg DRTRY_;
	initial DRTRY_ <= 1;

	// Note:  page 56, Book IV says that "DRTRY_ is ignored by Typhoon processor on
	// write transactions."  It seems appropriate, then, not to over-constrain our
	// memory model by insisting that it only assert DRTRY_ during read transactions;
	// at least, that's a reasonable rationalization for ignoring the transaction type
	// if doing so will simplify our model.

	always @(posedge clk)
		if (valid_artry)
			DRTRY_ <= 1;
		else if (TA_`asserted0)
		   DRTRY_	<= ran_DRTRY_;
   
		else if (DRTRY_`asserted0)
			// must hold DRTRY_ asserted (Book IV, top of page 83)
			DRTRY_	<= 0;
		else
			DRTRY_	<= 1;

endmodule
//`include define.v

/*	The main idea of this module is to randomly assign the address bus grant, using
	BG1_ and BG2_, to at most one of the cpus.  Originally we used two fairness
	constraints to make the arbitration fair, but that seemed computationally
	expensive.  So, we are trying a simple alternating scheme together with a single
	fairness constraint.

	Note that we need at least one fairness assertion, in order to guarantee
	that address and data tenures eventually terminate.  Once we allow address
	tenures to start while a data tenure is active, we may need to introduce more
	fairness in order to guarantee that data tenures terminate; currently we get that
	for free by requiring that address tenures keep starting, since they wait on data
	tenure completion.  Fortunately, at that point we can probably get by with a
	single fairness constraint asserting that we keep getting to points at which both
	the address and data tenures are idle, for all CPUs.  We'll see.....
*/

module	arb2(	.clk(clk),
		.BR1_(BR1_),
		.BR2_(BR2_),
		.BG1_(BG1_),
		.BG2_(BG2_),
		.TS_(TS_),
		.AACK_(AACK_),
		.ARTRY_(ARTRY_),
		.DBG1_(DBG1_),
		.DBG2_(DBG2_));

	input	clk;


	/* arbitration signals  */

	input		BR1_;		// bus request CPU
	input		BR2_;		// bus request CPU
	output		BG1_;		// bus grant CPU
	output		BG2_;		// bus grant CPU

	/* address start signals */
	
	input		TS_;		// transfer start

	/* address termination signals */

	input		AACK_;		// address ack.
	input		ARTRY_;		// address retry

	/* data bus arbitration signals */

	output		DBG1_;		// data bus grant `CPU1
	output		DBG2_;		// data bus grant `CPU1


	wire	bus_request;

	// Arbiter FSM

	reg [2:0] arbiter_fsm;


	// Arbiter

	// In this model, the arbiter alternates its address bus grant when it has to
	// decide between competing requests.  An advantage of this model is that with
	// just the three bits of arbiter_fsm, we can state a single fairness requirement
	// that not only requires acknowledge signals to come in but also is fair in
	// granting the bus.

	// The timing diagram on page 76 of Book IV illustrates the following sequence.

	// AACK_	ARTRY_		BR_[snooper]	BG_[arbiter]

	// This sequence tempted us to define our arbiter states to assume the following
	// sequence (assuming cpu1 is the master and cpu2 is the snooper, just to be
	// definite).

	// GRANTED1	GRANTED1_AACK	IDLE1		GRANTED2

	// Our plan was to not issue a bus grant during what we now call the GRANTED1_AACK
	// state.  However, when there was no assertion of ARTRY_ at that time, our plan
	// precluded the possibility of bus parking, as shown by failure of the following
	// spec.

	//      AG(EF(BR1_`negated1 && BR2_`negated1 && EX(EX(TS_`asserted0))))

	// The GRANTED1_AACK and GRANTED2_AACK states permit the assignment of bus grants
	// during the ARTRY_ window.  The appropriate cpu can use this bus grant and stay
	// parked on the bus if ARTRY_ is not asserted; see the AddressTenureAWINDOW state
	// of address_tenure_fsm in the cpu module.  Note that our fairness constraint
	// guarantees that we will not park the same cpu on the bus forever.

	// Note that if there is a snoop, our arbiter will return to the idle state in
	// time to make the necessary bus grant.  If there is no snoop, the same timing
	// applies except that anyone can be granted the bus next, in principle.

	initial arbiter_fsm <= `ArbiterStatusIDLE1;
	always @(posedge clk) begin
		case(arbiter_fsm)

		`ArbiterStatusIDLE1, `ArbiterStatusIDLE2:

			// Grant the address bus if there is a bus request, granting it to
			// the cpu who did not own it last if both cpus are requesting the
			// bus.  But first, there are a couple of exceptions.

			if	(ARTRY_`asserted0)

			// Do not grant the bus:  no bus parking opportunity will be lost,
			// and we need to be ready for the bus request of the snooper.

				arbiter_fsm <= arbiter_fsm;

			else if	(TS_`asserted0)

			// The bus must have been granted the previous cycle; this is a
			// bus parking situation.  Move to the appropriate state to
			// reflect that the bus was granted.  At one time we simply stayed
			// in the idle state, which resulted in moving out of an idle
			// state upon AACK_ assertion.  The arbiter_fsm then stayed in the
			// GRANTED1 state (waiting for the next AACK_, even though no
			// address tenure was underway any more!) while the snooping cpu
			// was unable to get the bus.

				arbiter_fsm <= (arbiter_fsm == `ArbiterStatusIDLE1) ?
						`ArbiterStatusGRANTED1 :
						`ArbiterStatusGRANTED2;

			else if	(BR1_`asserted0 && BR2_`negated1)
				arbiter_fsm <= `ArbiterStatusGRANTED1;
			else if (BR2_`asserted0 && BR1_`negated1)
				arbiter_fsm <= `ArbiterStatusGRANTED2;
			else if (BR1_`negated1 && BR2_`negated1)
				arbiter_fsm <= arbiter_fsm;

			// Otherwise both bus requests are asserted, and we should grant
			// the bus to whomever didn't have it last time.

			else
				arbiter_fsm <= (arbiter_fsm == `ArbiterStatusIDLE1) ?
						`ArbiterStatusGRANTED2 :
						`ArbiterStatusGRANTED1;

		`ArbiterStatusGRANTED1:
			if(AACK_`asserted0)
				arbiter_fsm <= `ArbiterStatusGRANTED1_AACK;

		`ArbiterStatusGRANTED1_AACK:
			arbiter_fsm <= `ArbiterStatusIDLE1;

		`ArbiterStatusGRANTED2:
			if(AACK_`asserted0)
				arbiter_fsm <= `ArbiterStatusGRANTED2_AACK;

		`ArbiterStatusGRANTED2_AACK:
			arbiter_fsm <= `ArbiterStatusIDLE2;

		endcase
	end

	assign BG1_ =  !(arbiter_fsm == `ArbiterStatusGRANTED1 ||
			 arbiter_fsm == `ArbiterStatusGRANTED1_AACK);
	assign BG2_ =  !(arbiter_fsm == `ArbiterStatusGRANTED2 ||
			 arbiter_fsm == `ArbiterStatusGRANTED2_AACK);

   wire ran_DBG1_reg_;
   assign ran_DBG1_reg_ = $ND(0,1);
   
	reg DBG1_reg_;
	initial DBG1_reg_ <= 1;
	always @(posedge clk) begin
	   DBG1_reg_ <= ran_DBG1_reg_;
	end

	assign DBG1_ = DBG1_reg_;
	assign DBG2_ = !DBG1_reg_;

endmodule
