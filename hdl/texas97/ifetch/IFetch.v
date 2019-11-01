// +----------------------------------------------------------------+
// |            Copyright (c) 1994 Stanford University.             |
// |                      All Rights Reserved.                      |
// |                                                                |
// |   This software is distributed with *ABSOLUTELY NO SUPPORT*    |
// |   and *NO WARRANTY*.   Use or reproduction of this code for    |
// |   commerical gains is strictly prohibited.   Otherwise, you    |
// |   are given permission to use or modify this code as long      |
// |   as you do not remove this notice.                            |
// +----------------------------------------------------------------+
//
//  Title: 	Instruction Fetch & PC Unit
//  Created:	Fri Apr  1 14:24:33 1994
//  Author: 	Ricardo E. Gonzalez
//		<ricardog@chroma>
//
//
//  instrFetch.v,v 7.22 1995/01/28 00:48:06 ricardog Exp
//
//  TORCH Research Group.
//  Stanford University.
//	1993.
//
//	Description: 
// Contains the Instruction Fetcher/Instruction Cache unit and the PC unit.
// This is the top level and only contains wire connectivities
//
//	Hierarchy: 
//
//  Revision History:
//	Modified: Sun Aug  7 22:17:50 1994	<ricardog@chroma.Stanford.EDU>
//	* Moved ICACHE outside of IFetchDatapath.
//	Modified: Mon Jun 27 15:20:16 1994	<ricardog@chroma.Stanford.EDU>
//	* Renamed Reset to Reset_s1.
//	Modified:	Sun May 22 16:35:25 1994	<ricardog@chroma>
//	* Changed MemStall_s2 to MemStall_s1.
//	Modified:	Tue Apr 12 12:27:05 1994	<ricardog@chroma>
//	* Changed timing of HoldPC_v2r to be _s2r.
//	Modified:	Sat Apr  9 16:37:57 1994	<ricardog@chroma>
//	* Fixed verilint errors.
//	Modified:	Fri Apr  1 16:32:30 1994	<ricardog@chroma>
//	* Better implementation of jump mux.
//	Modified:	Fri Apr  1 16:32:21 1994	<ricardog@chroma>
//	* Moved branch logic to IFetchControl.
//

module instrFetch(
//    Phi1,
//    Phi2,
    ASBus_s1e, 
    BEQnext_s1e,
    BNEnext_s1e,
    BLEZnext_s1e,
    BGTZnext_s1e,
    BLTZnext_s1e,
    BGEZnext_s1e,
    RegPC_s1e,
    ImmPC_s1e,
    SEqualsT_v1e,
    SIsNegative_v1e,
    TakenBranch_s2e,
    PCDrvResult_s2e,
    MipsMode_s2e,
    MemStall_s1,
    Stall_s2,
    Reset_s1,
    ExceptVector_s1i, 
    Except_s1w,
    PCPID_v2r,
    SystemBit_s2e, 
    EPCSel_s1m,
    EPCNSel_s1m,
    ItlbMiss_v2e,
    NonCacheable_s1,
//SharedMemAddr_s1,
//ReqNextBlock_s2,
    SharedMemData_s2,
 //ExtDataValid_s2, 
    L2Miss_s2,
    AResultBus_v2e,
    MemBus_v2m,
   InstrAddr_s2i, 
    AInstr_s2r,
    BInstr_s2r,
    ICacheMiss_v2r, 
    AKill_s1e,
    BKill_s1e,
    KillOne_s1e, 
    IStall_s1,
    IFetchStall_s1,
    IAddrError_v2i,
//L1Hit_s1,
    Stall_s1
    );

//
// Clocks & Stalls
//
//input   	Phi1;
//input   	Phi2;
output  	IStall_s1;
output		IFetchStall_s1;
input   	MemStall_s1;
input		Stall_s1;
input		Stall_s2;
input   	Reset_s1;

input   [31:0]	ASBus_s1e;

//
// PC control signals
//
input		BEQnext_s1e;		  // Decoded branch signals from the
input		BNEnext_s1e;		  // instruction decoder
input		BLEZnext_s1e;		  // the branch condition is evaluated
input		BGTZnext_s1e;		  // in the IFetchControl module
input		BLTZnext_s1e;
input		BGEZnext_s1e;
input		ImmPC_s1e;		  // Jump instruction
input		RegPC_s1e;		  // Jump register
input		SEqualsT_v1e;		  // Condition codes from RF
input		SIsNegative_v1e;
output		TakenBranch_s2e;	  // Set if Br/J taken prev phase
input   	PCDrvResult_s2e;

//
// Control signals
//
input   	MipsMode_s2e;
input   [2:0]	ExceptVector_s1i;
input   	Except_s1w;
input   [5:0]	PCPID_v2r;
input   	SystemBit_s2e;
input   	EPCSel_s1m;
input   	EPCNSel_s1m;
input   [63:0]	SharedMemData_s2;
//input   	ExtDataValid_s2;
input   	L2Miss_s2;
//input   	ReqNextBlock_s2;	// not implemented yet
input   	ItlbMiss_v2e;
//input   [31:0]	SharedMemAddr_s1;	// not implemented yet
input   	NonCacheable_s1;

output  [31:0]	AResultBus_v2e ; 
output  [31:0]	MemBus_v2m;

output  [29:0]	InstrAddr_s2i;		// this is same as PC_s2i

output  [39:0]	AInstr_s2r;
output  [39:0]	BInstr_s2r;
output  	ICacheMiss_v2r;
output  	AKill_s1e;
output  	BKill_s1e;
output  	KillOne_s1e;
output  	IAddrError_v2i;
//output  	L1Hit_s1 ;		// not implemented yet


//
// between PCUnit and IFetch
//
wire		HoldPC_s2r;
wire		RestoreIStallPC_s1;
wire		IStall_s1;
wire		IFetchStall_s1;
wire	[1:0]	WritePack_s2;
wire		BDynamicBit_v1r ;

//
// Wire between IFetchDatapath and IFetchControl
//

//---------------------------------------------------------------------------
//		      ---- Wires Betwen Units ----
//---------------------------------------------------------------------------
wire		MipsMode_b_s2e ;
wire		NonCacheableHeld_s1 ;
wire		ExtDataValid_s2 = 1;
wire		LatchShiftReg_s1;
wire		LatchDataReg_s1 ;
wire		ExtMuxSelect_s1 ;
wire		WriteData_s2 ;
wire		WriteTag_s2 ;
wire		DataEnable_s2;
wire		TagEnable_s2 ;
wire		LatchNonCachePkt_s2 ;
wire		ADrvB_s2r ;
wire		BDrvA_s2r ;
wire		LatchInstrs_s1r ;
wire		LatchTags_s1r ;
wire		ADynamicBit_v1r ;
wire		Match_v2r;
wire		ICacheLineValid_s2r;
wire		PCUnitPsi2_s2 ;
wire		HoldPC_s2e ;
wire		EPCBufEnable_s2m ;
wire		EPCMuxSel_s2m ;
wire		Jump0_s1e ;
wire		Jump1_s1e ;
wire		Jump2_s1e ;
wire		Jump3_s1e ;
wire		Jump4_s1e ;
wire		Jump5_v1e ;

wire	[79:0]	ICacheInData_s2 ;
wire	[23:0]	ICacheInTag_s2 ;
wire	[79:0]	ICacheOutData_v1r; // = 80'b0;
wire	[23:0]	ICacheOutTag_v1r;  //= 24'b0;

wire		Gamma1_s1 ;
wire		latchEPC_s1w ;
//wire Stall_s1;
//assign AResultBus_v2e = 32'b0;
//assign MemBus_v2m= 32'b0;
//assign InstrAddr_s2i= 30'b0;            
//assign L1Hit_s1 = 1;

wire Phi1, Phi2;

//reg Clock, Phi1, Phi2;
//initial Clock=0;
//initial Phi1=0;
//initial Phi2=1;
//always begin
//Clock = ~Clock;
//Phi1 = Clock;
//Phi2 = ~Clock;
//end

//assign Stall_s1 = IStall_s1 | MemStall_s1;


IFetchControl IFetchControl(
	Phi1,
	Phi2,
	Gamma1_s1,
	MemStall_s1,
	Stall_s1,
	Reset_s1,
	MipsMode_s2e,
	MipsMode_b_s2e,
	ItlbMiss_v2e,
	ExtDataValid_s2,
	L2Miss_s2,
	IStall_s1,
	IFetchStall_s1,
	AKill_s1e,
	BKill_s1e,
	KillOne_s1e,
	LatchShiftReg_s1,
	WriteData_s2,
	WriteTag_s2,
	DataEnable_s2,
	TagEnable_s2,
	LatchDataReg_s1,
	ExtMuxSelect_s1,
	WritePack_s2,
	ADynamicBit_v1r,
	BDynamicBit_v1r,
	ADrvB_s2r,
	BDrvA_s2r,
	LatchInstrs_s1r,
	LatchTags_s1r,
	InstrAddr_s2i[0],
	Match_v2r,
	ICacheLineValid_s2r,
	ICacheMiss_v2r,
	NonCacheable_s1,
	LatchNonCachePkt_s2,
	NonCacheableHeld_s1,
	Except_s1w,
	BEQnext_s1e,
	BNEnext_s1e,
	BLEZnext_s1e,
	BGTZnext_s1e,
	BLTZnext_s1e,
	BGEZnext_s1e,
	ImmPC_s1e,
	RegPC_s1e,
	SEqualsT_v1e,
	SIsNegative_v1e,
	TakenBranch_s2e,
	EPCSel_s1m,
	EPCNSel_s1m,
	SystemBit_s2e,
	InstrAddr_s2i[29],
	InstrAddr_s2i[2:1],
	IAddrError_v2i,
       	PCUnitPsi2_s2,
	latchEPC_s1w,
	RestoreIStallPC_s1,
	HoldPC_s2r,
	HoldPC_s2e,
	EPCBufEnable_s2m,
	EPCMuxSel_s2m,
	Jump0_s1e,
	Jump1_s1e,
	Jump2_s1e,
	Jump3_s1e,
	Jump4_s1e,
	Jump5_v1e
    );


IFetchDatapath	 IFetchDatapath(
	Phi1,
	Phi2,
	Stall_s2,
	InstrAddr_s2i[29:13],
	MipsMode_s2e, 
	SharedMemData_s2,
//	SharedMemAddr_s1,
	NonCacheableHeld_s1,
	ExtDataValid_s2,
	LatchShiftReg_s1,
	LatchDataReg_s1,
	ExtMuxSelect_s1,
	ICacheOutData_v1r,
	ICacheOutTag_v1r,
	PCPID_v2r,
	LatchNonCachePkt_s2,
	LatchTags_s1r,
	ADrvB_s2r,
	BDrvA_s2r,
	LatchInstrs_s1r,
	ADynamicBit_v1r,
	BDynamicBit_v1r,
	AInstr_s2r,
	BInstr_s2r,
	Match_v2r,
	ICacheLineValid_s2r,
	ICacheInData_s2, 
	ICacheInTag_s2
    );
//L1Hit_s1


PCUnitDatapath PCUnitDatapath(
	Phi1,
	Phi2,
	Stall_s1,
	Stall_s2,
	Gamma1_s1,
    	PCUnitPsi2_s2,
	InstrAddr_s2i[29:0],
	ASBus_s1e[31:2],
	AInstr_s2r[25:0],
	HoldPC_s2r,
	HoldPC_s2e,
	MipsMode_s2e,
	MipsMode_b_s2e,
	AResultBus_v2e,
	PCDrvResult_s2e,
	RestoreIStallPC_s1,
	MemBus_v2m,
	EPCBufEnable_s2m,
	EPCMuxSel_s2m,
	latchEPC_s1w,
	ExceptVector_s1i,
	Jump0_s1e,
	Jump1_s1e,
	Jump2_s1e,
	Jump3_s1e,
	Jump4_s1e,
	Jump5_v1e
    );


clock_gen clock_gen(Phi1, Phi2);


endmodule				  // instrFetch

module clock_gen(Phi1, Phi2);
output Phi1, Phi2;
reg lock, Phi1, Phi2;
initial lock=1;
initial Phi1=1;
initial Phi2=0;

always begin
lock = ~lock;
Phi1 = lock;
Phi2 = ~lock;
end
endmodule


// +----------------------------------------------------------------+
// |            Copyright (c) 1994 Stanford University.             |
// |                      All Rights Reserved.                      |
// |                                                                |
// |   This software is distributed with *ABSOLUTELY NO SUPPORT*    |
// |   and *NO WARRANTY*.   Use or reproduction of this code for    |
// |   commerical gains is strictly prohibited.   Otherwise, you    |
// |   are given permission to use or modify this code as long      |
// |   as you do not remove this notice.                            |
// +----------------------------------------------------------------+
//
//  Title: 	Instruction Fetch Control module
//  Created:	Sat Mar 26 21:34:11 1994
//  Author: 	Ricardo E. Gonzalez
//		<ricardog@chroma>
//
//
//  IFetchControl.v,v 7.38 1995/01/28 00:47:54 ricardog Exp
//
//  TORCH Research Group.
//  Stanford University.
//	1993.
//
//	Description: 
//
// This Section contains all the control signals that goes to IFetchDatapath.v
// It also includes control signal latches and combinational logics.
//
//
// Main Sections
//	- signals that are either global in IFetch world or hard to be
//		placed in anywhere else
//	- Controls signals that goes to the outside world
//	- Controls for ICache Refill, including the state machine
//	- Controls for ICache Instruction Fetch
//	- Controls for Tag/PID Comparator
//	- Controls for non-Cacheable Instr
//	- Controls for PCUnit
//
//	Hierarchy: processor.instrFetch
//
//  Revision History:
//	Modified: Wed Nov 30 22:42:15 1994	<ricardog@chroma.Stanford.EDU>
//	* -- Added code to qualify ICACHE access.
//	Modified: Wed Nov 30 14:47:44 1994	<ricardog@chroma.Stanford.EDU>
//	* Removed local clock qualification.
//	Modified: Sun Aug  7 22:16:51 1994	<ricardog@chroma.Stanford.EDU>
//	* Moved ICACHE outside of IFetchDatapath.
//	Modified: Mon Jun 27 15:19:44 1994	<ricardog@chroma.Stanford.EDU>
//	* Renamed Reset to Reset_s1 and qualfied state latches with MemStall
//	Modified:	Sun May 22 16:32:11 1994	<ricardog@chroma>
//	* Changed MemStall_s2 to MemStall_s1.
//	Modified:	Tue Apr 12 12:27:15 1994	<ricardog@chroma>
//	* Changed timing of HoldPC_v2r to be _s2r.
//	Modified:	Sat Apr  9 16:41:19 1994	<ricardog@chroma>
//	* Fixed verilint errors.
//	Modified:	Fri Apr  1 16:32:59 1994	<ricardog@chroma>
//	* Better implementation of jump mux.
//	Modified:	Fri Apr  1 16:32:45 1994	<ricardog@chroma>
//	* Moved branch logic.

//module clock_gen(Phi1, Phi2);
//output Phi1, Phi2;
//reg Clock, Phi1, Phi2;
//initial Clock=1;
//initial Phi1=1;
//initial Phi2=0;
//always begin
//Clock = ~Clock;
//Phi1 = Clock;
//Phi2 = ~Clock;
//end
//endmodule

module IFetchControl(
//    Clock,
    Phi1,
    Phi2,
    Gamma1_s1,
    MemStall_s1,
    Stall_s1,
    Reset_s1,
    MipsMode_s2e,
    MipsMode_b_s2e,
    ExtDataValid_s2,
    ItlbMiss_v2e,
    L2Miss_s2,
    IStall_s1,
    IFetchStall_s1,
    AKill_s1e,
    BKill_s1e,
    KillOne_s1e,
    LatchShiftReg_s1,
    WriteData_s2,
    WriteTag_s2,
    DataEnable_s2,
    TagEnable_s2,
    LatchDataReg_s1,
    ExtMuxSelect_s1,
    WritePack_s2,
    ADynamicBit_v1r,
    BDynamicBit_v1r,
    ADrvB_s2r,
    BDrvA_s2r,
    LatchInstrs_s1r,
    LatchTags_s1r,
    PCOffset_s2i,
    Match_v2r,
    ICacheLineValid_s2r,
    ICacheMiss_v2r,
    NonCacheable_s1,
    LatchNonCachePkt_s2,
    NonCacheableHeld_s1,
    Except_s1w,
    BEQnext_s1e,
    BNEnext_s1e,
    BLEZnext_s1e,
    BGTZnext_s1e,
    BLTZnext_s1e,
    BGEZnext_s1e,
    ImmPC_s1e,
    RegPC_s1e,
    SEqualsT_v1e,
    SIsNegative_v1e,
    TakenBranch_s2e,
    EPCSel_s1m,
    EPCNSel_s1m,
    SystemBit_s2e,
    PC_bit31_s2i,
    PCPacketNum_s2i,
    IAddrError_v2i,
    PCUnitPsi2_s2,
    latchEPC_s1w,
    RestoreIStallPC_s1,
    HoldPC_s2r,
    HoldPC_s2e,
    EPCBufEnable_s2m,
    EPCMuxSel_s2m,
    Jump0_s1e,
    Jump1_s1e,
    Jump2_s1e,
    Jump3_s1e,
    Jump4_s1e,
    Jump5_v1e
    );
//----------------------------------------------------------------------------

//-------------Declarations for IFetch global signals------------------------
output		Gamma1_s1;	        // Gamma1 = Phi1 & ~MemStall
wire		Gamma1_s1;
output		IFetchStall_s1;		// De-asserted one cycle early
reg		IFetchStall_s1;		// for IFetch logic
reg		IFetchStall_s2;		// delayed version
wire		IFetchStall_v2;		// Stall instruction fetch logic
wire		SecondIssue_s2r;	// whether will do 2nd cycle of
reg		SecondIssue_s1e;	// dnop'ed packet
reg		SecondIssue_s2e;
wire		SecondIssueCond_s2r;
reg		SecondIssueCond_s1e;


//-------------Declarations for Outside world signals------------------------

//input		Clock;	        // Clocks
input		Phi1;
input		Phi2;
input		MemStall_s1;		// Memory stall signal
input Stall_s1;
input		Reset_s1;		// Pin reset signal
input		MipsMode_s2e;		// MIPS mode bit from coprocessor
output		MipsMode_b_s2e;		// 
input		ItlbMiss_v2e;		// TLB miss; empty pipeline
input		ExtDataValid_s2;	// data bus valid
input		L2Miss_s2;		// Level 2 miss; must restart refill
output		IStall_s1;		// Global I-Stall signal
output		AKill_s1e, BKill_s1e;	// to outside world
output		KillOne_s1e;	
reg		Reset_s2;               // latched reset
reg		MipsMode_s1;            // latched for when needed
reg		IStall_s1;              // latched global IStall signal
wire		IStall_v2;		// generated by IFetchFSM
reg		ItlbMiss_s1, ItlbMiss_s2;	// latched & delayed versions
reg		AKill_s1e, BKill_s1e;	// to outside world
wire		AKill_v2r, BKill_v2r;
wire		KillOne_s1e;

//-------------Declarations for Refill Section------------------------

output		LatchShiftReg_s1;
reg		LatchShiftReg_s1;
wire		LatchShiftReg_v2;
output		WriteData_s2;
wire		WriteData_s2;
output		WriteTag_s2;		// write tag, valid, PID bits
wire		WriteTag_s2;		// write tag, valid, PID bits
output		DataEnable_s2;		// 
wire		DataEnable_s2;		// 
wire		SecondIssueMips_s2r;
reg		SecondIssueMips_s1e;
output		TagEnable_s2;		// 
wire		TagEnable_s2;		// 
output		LatchDataReg_s1;
reg		LatchDataReg_s1;
wire		LatchDataReg_v2;
output		ExtMuxSelect_s1;	// control signals & latches
reg		ExtMuxSelect_s1;	//   from IFetchFSM
wire		ExtMuxSelect_v2;
wire		WriteCache_v1;
reg		WriteCache_s2;

//-------------Declarations for IFetchFSM-----------------------------------
output	[1:0]	WritePack_s2;
wire	[1:0]	WritePack_s2;
reg 	[3:0]	PrevState_s2;		// Previous state of fsm
reg 	[3:0]	PresState_s1;		// latched present state for phi 2
wire 	[3:0]	PresState_v2;		// Present state of fsm
reg  	[3:0]	TempState_v2;		// temporary variable

//-------------Declarations for ICACHE control------------------------------
wire		ReadCache_v1i;
reg		ReadCache_s2i;
//wire		ReadCache_s1r;
reg		ReadCache_s1r;
reg		ReadCache_s2r;

//-------------Declarations for Instr Fetch---------------------------------
input		ADynamicBit_v1r;	// dynamic NOOP bit out of cache
input		BDynamicBit_v1r;	// dynamic NOOP bit out of cache
output		ADrvB_s2r, BDrvA_s2r;	// routing muxes
output		LatchInstrs_s1r;	// to IFetchDatapath.v
output		LatchTags_s1r;		// to IFetchDatapath.v
wire		ADrvB_v1r, BDrvA_v1r;	// control signals for instruction
reg		ADrvB_s2r, BDrvA_s2r;	//   routing muxes
reg		ADrvB_s1e, BDrvA_s1e;
reg		ADynamicBit_s2r;	// dynamic NOOP bit out of InstrReg
reg		BDynamicBit_s2r;	// dynamic NOOP bit out of InstrReg
reg		ADynamicBit_s1e;	// dynamic NOOP bit staged
reg		BDynamicBit_s1e;	// dynamic NOOP bit staged
reg		Hold_s1e, Hold_s2e;	// delayed Hold_v2r signal

//-------------Declarations for Comparator Section------------------------
input		PCOffset_s2i;		// Bit 0 of PC. from IFetchDatapath.v
input		Match_v2r;		// from Comparator
input		ICacheLineValid_s2r;	// from Comparator
output		ICacheMiss_v2r;		// to outside world
reg		PCOffset_s1r, PCOffset_s2r;
wire		ICacheMiss_v2r;

//-------------Declarations for NonCacheable Section------------------------
input		NonCacheable_s1;	// instruction access is non-cachable
					// from outside world
output		LatchNonCachePkt_s2;
output		NonCacheableHeld_s1;	// delayed version to IFetchDatapath.v
wire		LatchNonCachePkt_v1;
reg		LatchNonCachePkt_s2;
reg		NonCacheable_s2;	// latched & held version of signal
reg		NonCacheableHeld_s1;	// delayed version

//-------------Declarations for PC Unit Section------------------------------
input		Except_s1w;		// Global exception signal
					// from outside world
input		BEQnext_s1e;		// Decoded branch signals from the
input		BNEnext_s1e;		// instruction decoder
input		BLEZnext_s1e;		// the branch condition is evaluated
input		BGTZnext_s1e;		// here
input		BLTZnext_s1e;
input		BGEZnext_s1e;
input		ImmPC_s1e;		// Jump instruction
input		RegPC_s1e;		// Jump register
input		SEqualsT_v1e;		// Condition codes from RF
input		SIsNegative_v1e;
wire		takenBranch_v1e;	// Set if a br/J was taken prev phase
output		TakenBranch_s2e;
reg		TakenBranch_s2e;
input		EPCSel_s1m, EPCNSel_s1m; // from cop0, for MFC0 (from EPC/EPCN)
input		SystemBit_s2e;		// Checked against MSB of PC
input		PC_bit31_s2i;
input	[1:0]	PCPacketNum_s2i;	// bit [2:1] of the PC#
reg	[1:0]	PCPacketNum_s1r;
output		IAddrError_v2i;		// Asserted if MSB of PC is high
					// (kernel space) while in user mode
output		RestoreIStallPC_s1;	// Tells PC Unit IStall is finished--
					//   continue fetching where left off
output		PCUnitPsi2_s2;		// Phi2 & ~MemStall & ~IStall_s2
output		latchEPC_s1w;		// Phi1 & Except_s1w
output		HoldPC_s2r;		// to PC Unit
output		HoldPC_s2e;		// this is the same as Hold_s2e
output		EPCBufEnable_s2m;
output		EPCMuxSel_s2m;
output		Jump0_s1e;		// PC select signals
output		Jump1_s1e;
output		Jump2_s1e;
output		Jump3_s1e;
output		Jump4_s1e;
output		Jump5_v1e;
reg		IStall_s2;		// deleayed version of IStall
reg		Except_s2w;		// Delayed version of Except_s1w
reg		IncPC_s2e;		// delayed version of PC incr. signal
wire		HoldPC_s2r;
wire		Hold_s2r;		// hold for 2nd cycle of dnop packet
wire		IAddrError_v2i;
wire		HoldPC_s2e;
wire		EPCBufEnable_s2m;
wire		EPCMuxSel_s2m;
reg		EPCSel_s2m, EPCNSel_s2m;  
wire		Jump0_s1e;
wire		Jump1_s1e;
wire		Jump2_s1e;
wire		Jump3_s1e;
wire		Jump4_s1e;
wire		Jump5_v1e;


//wire Stall_s1, Phi1, Phi2;

//----------------------------------------------------------------------------
//		 ---- Define States for Refill FSM ----
//----------------------------------------------------------------------------
`define CACHEHIT    4'b0010
`define WAITExtByte 4'b0011
`define EXTBYTE     4'b0111
`define WAITXfer0   4'b0000
`define XFER0       4'b0001
`define WAITXfer1   4'b0100
`define XFER1       4'b0101
`define WAITXfer2   4'b1000
`define XFER2       4'b1001
`define WAITXfer3   4'b1100
`define XFER3       4'b1101
`define REFETCH     4'b1111

//------------------------------------------------------------------------
//------------------------------------------------------------------------
//------------------------------------------------------------------------
//------------------------------------------------------------------------
 
 
 
// assign Stall_s1 = IStall_s1 | MemStall_s1;
initial begin
     NonCacheable_s2 =0 ;
     BKill_s1e=0;
     BDrvA_s1e=0;
     SecondIssueCond_s1e=0;
     ReadCache_s2r=0;
     PCOffset_s1r=0;
     Hold_s2e=0;
SecondIssue_s1e=0;
TempState_v2 = 4'b0010;
SecondIssueMips_s1e=0;
NonCacheableHeld_s1=0;
AKill_s1e=0;
ReadCache_s2i=0;
PrevState_s2 = 4'b0010;
LatchNonCachePkt_s2=0;
ExtMuxSelect_s1=0;
ADynamicBit_s2r=0;
EPCNSel_s2m=0;
TakenBranch_s2e=0;
ItlbMiss_s2=0;
Except_s2w=0;
Hold_s1e=0;
ReadCache_s1r=0;
BDynamicBit_s1e=0;
ItlbMiss_s1=0;
ADrvB_s1e=0;
MipsMode_s1=0;
ADynamicBit_s1e=0;
LatchDataReg_s1=0;
Reset_s2=0;
ADrvB_s2r=0;
IFetchStall_s2=0;
IncPC_s2e=0;
BDynamicBit_s2r=0;
PCOffset_s2r=0;
IFetchStall_s1=0;
SecondIssue_s2e=0;
PCPacketNum_s1r='b00;
IStall_s1=0;
LatchShiftReg_s1=0;
WriteCache_s2=0;
PresState_s1= 4'b0010;
IStall_s2=0;
BDrvA_s2r=0;
EPCSel_s2m=0;
//ExtDataValid_s2 = 1'b1;

end 

// reg Clock, Phi1, Phi2;
//initial Clock=0;
//initial Phi1=0;
//initial Phi2=1;
//always begin
// Clock = ~Clock;
//Phi1 = Clock;
//Phi2 = ~Clock;
//end

//------------------------------------------------------------------------
//                       ---- Clock Buffer -----
//------------------------------------------------------------------------
// This is the equivalent of the clock generator and distribution
// network. I should really instantiate something called byClock.
//assign Phi1 = Clock;
//assign Phi2 = ~Clock;

//----------------------------------------------------------------------------
//		       ---- Global Controls ----
//---------------------------------------------------------------------------
assign Gamma1_s1 = ~MemStall_s1 | IStall_s1;

// Stage Reset signal
always @(Phi1 or Reset_s1) begin
    if (Phi1) Reset_s2 = Reset_s1;
end

always @(Phi2 or MipsMode_s2e) begin
    if (Phi2) MipsMode_s1 = MipsMode_s2e;
end

//---------------------------------------------------------------------------
//			   --- Inversion ---
//---------------------------------------------------------------------------
assign MipsMode_b_s2e = ~MipsMode_s2e;

//------------------------------------------------------------------------
//			---- FSM for IStall ----
//------------------------------------------------------------------------
// Assert IStall and IFetchStall when there is an ICache miss
// and leave them asserted until the cache is back in the right state
// (usually once the line has been fetched).
//
// IFetchStall_v2 goes low a cycle earlier than IStall_v2 so that
// instruction fetch logic (to generate mux & Kill signals, in
// IFetchControl.v) will be generated for the refetched instruction.
//
assign IStall_v2 = ~Reset_s2 & (ICacheMiss_v2r |
		    IStall_s2 & ~(PrevState_s2 == `CACHEHIT));
assign IFetchStall_v2 = ((ICacheMiss_v2r & PrevState_s2 == `CACHEHIT) |
		    (IFetchStall_s2 & PrevState_s2 != `REFETCH)) &
		    ~Reset_s2;

always @(Phi2 or IStall_v2 or IStall_s2 or IFetchStall_v2) begin
    if (Phi2) begin
	
	IStall_s1 = IStall_v2;
	IFetchStall_s1 = IFetchStall_v2;
    end
end

always @(Phi1 or IStall_s1 or IFetchStall_s1 or Except_s1w) begin
    if (Phi1) begin
	
	IStall_s2 = IStall_s1;
	IFetchStall_s2 = IFetchStall_s1;
    end
end

//------------------------------------------------------------------------
//			 ---- TLB Signals ----
//------------------------------------------------------------------------
// Latch signal ItlbMiss_v2e and hold until exception is raised
always @(Phi2 or ItlbMiss_v2e or ItlbMiss_s2 or Except_s2w or Reset_s2) begin
    if (Phi2)
	
	ItlbMiss_s1 = (ItlbMiss_v2e | ItlbMiss_s2) & ~Except_s2w &
			~Reset_s2;
end

always @(Phi1 or ItlbMiss_s1) begin
    if (Phi1) ItlbMiss_s2 = ItlbMiss_s1;
end    

//---------------------------------------------------------------------------
//			 ---- Second Issue ----
//---------------------------------------------------------------------------
// NOTE: SecondIssue used to be dependent on ICacheMiss_v2r but I
// have removed it from the equation to prevent a critical path. It run
// on boosttest and bubble with icache empty.
//
// As long as no exceptional conditions exist (ICache miss, stall, or
// exception), a second issue of a packet can occur iff:
//    (1) packet is not odd target of a branch (already into "second" issue)
//    (2) not about to branch (i.e. not a dynamically nop'ed delay slot)
//    (3) not already doing second issue.
assign SecondIssueCond_s2r = ~PCOffset_s2r & IncPC_s2e & ~SecondIssue_s2e &
			    ~IFetchStall_s2 & ~Except_s2w;
//
// If the above conditions are met, a second cycle occurs if at least
// one dynamic nop bit is set in the instruction packet.
assign SecondIssue_s2r = (ADynamicBit_s2r | BDynamicBit_s2r) &
			    SecondIssueCond_s2r;

//----------------------------------------------------------------------------
//		Control Signals To the Outside World
//			-- not all of them ---
//---------------------------------------------------------------------------
//
// Assert Kill signals if exception occurs or reset is asserted.
//
// If neither reset or exception occurs, only assert them if in Torch mode
// and are not servicing an ICache miss.
// 
// Then, kill A side instruction if:
//     (1) doing first issue of a packet in which the A side instruction
//         is dyn. nop'ed
//     (2) packet is target of an odd target branch and neither A nor B
//         is dyn. nop'ed (so should only execute B side)
assign AKill_v2r = ~MipsMode_s2e & ~IFetchStall_s2 &
		    (ADynamicBit_s2r & ~PCOffset_s2r & ~SecondIssue_s2e |
		    PCOffset_s2r & ~ADynamicBit_s2r & ~BDynamicBit_s2r) |
		    Except_s2w | Reset_s2;
                                      
// Kill B side instruction if:
//      doing first issue of a packet in which the B side instruction
//      is dyn. nop'ed
assign BKill_v2r = ~MipsMode_s2e & ~IFetchStall_s2 &
		    BDynamicBit_s2r & ~PCOffset_s2r & ~SecondIssue_s2e |
		    Except_s2w | Reset_s2;

//
// Instruction sent to both sides if either ADrvB_s1e or BDrvA_s1e is asserted.
assign KillOne_s1e = ADrvB_s1e | BDrvA_s1e;
                                      
always @(Phi2 or AKill_v2r or BKill_v2r) begin
    if (Phi2) begin
    	    
	AKill_s1e = AKill_v2r;
	BKill_s1e = BKill_v2r;
    end
end


//----------------------------------------------------------------------------
//			---- Refill Section ----
//---------------------------------------------------------------------------

always @(Phi2 or ExtMuxSelect_v2 or LatchShiftReg_v2 or LatchDataReg_v2) begin
    if (Phi2) begin
	
	    ExtMuxSelect_s1  = ExtMuxSelect_v2;
	    LatchShiftReg_s1 = LatchShiftReg_v2;
	    LatchDataReg_s1  = LatchDataReg_v2;
    end
end

//------------------------------------------------------------------------
//                  Latches for State Machine
//		that controls the Refill Operation
//------------------------------------------------------------------------
// Determines state and generates controls for ICache refilling and stalling.
// Combinational logic to determine next state
// What should the FSM do in case of an Exception????
always @(PrevState_s2 or ICacheMiss_v2r or MipsMode_s2e or ExtDataValid_s2
	or Reset_s2 or ItlbMiss_s2 or L2Miss_s2 or Except_s2w) begin
    if      (Reset_s2)	  TempState_v2 = `CACHEHIT;
    else if (ItlbMiss_s2 &
             (PrevState_s2 != `REFETCH) & (PrevState_s2 != `CACHEHIT))
			  TempState_v2 = `REFETCH;
    else if (L2Miss_s2)   TempState_v2 = `WAITExtByte;
    else begin
      case (PrevState_s2)		  // synopsys parallel_case full_case
	`CACHEHIT:
	    TempState_v2 = (ICacheMiss_v2r == 1'b0) ? `CACHEHIT :
		       (MipsMode_s2e == 1'b0) ? `WAITExtByte : `WAITXfer0;
	`WAITExtByte:
	    TempState_v2 = (ExtDataValid_s2 == 1'b1) ? `EXTBYTE : `WAITExtByte;
	`EXTBYTE:
	    TempState_v2 = (ExtDataValid_s2 == 1'b1) ? `XFER0 : `WAITXfer0;
	`WAITXfer0:
	    TempState_v2 = (ExtDataValid_s2 == 1'b1) ? `XFER0 : `WAITXfer0;
	`XFER0:
	    TempState_v2 = (ExtDataValid_s2 == 1'b1) ? `XFER1 : `WAITXfer1;
	`WAITXfer1:
	    TempState_v2 = (ExtDataValid_s2 == 1'b1) ? `XFER1 : `WAITXfer1;
	`XFER1:
	    TempState_v2 = (ExtDataValid_s2 == 1'b1) ? `XFER2 : `WAITXfer2;
	`WAITXfer2:
	    TempState_v2 = (ExtDataValid_s2 == 1'b1) ? `XFER2 : `WAITXfer2;
	`XFER2:
	    TempState_v2 = (ExtDataValid_s2 == 1'b1) ? `XFER3 : `WAITXfer3;
	`WAITXfer3:
	    TempState_v2 = (ExtDataValid_s2 == 1'b1) ? `XFER3 : `WAITXfer3;
	`XFER3:
	    TempState_v2 = `REFETCH;
	`REFETCH:
	    TempState_v2 = `CACHEHIT;
	default:
	    TempState_v2 = `CACHEHIT;
      endcase
    end
end

assign PresState_v2 = TempState_v2;

//
// Calculate Output Control Signals
//
assign ExtMuxSelect_v2 = (PresState_v2 == `EXTBYTE) ;
assign LatchShiftReg_v2 = ((PresState_v2 == `EXTBYTE) |
	    (PresState_v2 == `XFER1) |
	    (PresState_v2 == `XFER2) | (PresState_v2 == `XFER3));
assign LatchDataReg_v2 =
	    ((PresState_v2 == `XFER0) | (PresState_v2 == `XFER1) |
	     (PresState_v2 == `XFER2) | (PresState_v2 == `XFER3));

assign LatchNonCachePkt_v1 = LatchDataReg_s1 &
				(PCPacketNum_s1r == PresState_s1[3:2]);

assign WriteCache_v1 =
	    ((PresState_s1 == `XFER0) | (PresState_s1 == `XFER1) |
	     (PresState_s1 == `XFER2) | (PresState_s1 == `XFER3)) &
	    ~NonCacheableHeld_s1;

assign ReadCache_v1i = (PresState_s1 == `CACHEHIT | PresState_s1 == `REFETCH) & ~NonCacheableHeld_s1;

assign WriteTag_s2 = (PrevState_s2 == `XFER3);

assign WritePack_s2[1] = (PrevState_s2 == `XFER2) | (PrevState_s2 == `XFER3);
assign WritePack_s2[0] = (PrevState_s2 == `XFER1) | (PrevState_s2 == `XFER3);

always @(Phi1 or PresState_s1 or MemStall_s1) begin
    if (Phi1 & ~MemStall_s1) PrevState_s2 = PresState_s1;
end

always @(Phi2 or PresState_v2) begin
    if (Phi2) PresState_s1 = PresState_v2;
end
//------------------------------------------------------------------------

//----------------------------------------------------------------------------
//		   ---- ICache Instruction Fetch ----
//----------------------------------------------------------------------------
//
// In Mips mode, drive A-side instruction onto B-side bus if at even address.
//
// In Torch mode, drive A onto B-side bus if:
//     (1) doing second issue and only A was dynamically nop'ed
//     (2) packet is target of an odd-target branch and only A is dyn. nop'ed
assign ADrvB_v1r = MipsMode_s1 & ~PCOffset_s1r |
		    ~MipsMode_s1 & (ADynamicBit_s1e & ~BDynamicBit_s1e &
				    SecondIssueCond_s1e |
				    ADynamicBit_v1r & ~BDynamicBit_v1r &
				    PCOffset_s1r);
//
// In Mips mode, drive B side instruction onto A side bus if at odd address.
//
// In Torch mode, drive B onto A-side bus if:
//     (1) doing second issue and only B was dynamically nop'ed
//     (2) packet is target of an odd-target branch and only B is dyn. nop'ed
assign BDrvA_v1r = MipsMode_s1 & PCOffset_s1r |
		    ~MipsMode_s1 & (BDynamicBit_s1e & ~ADynamicBit_s1e &
				    SecondIssueCond_s1e |
				    BDynamicBit_v1r & ~ADynamicBit_v1r &
				    PCOffset_s1r);

always @(Phi1 or ADrvB_v1r or BDrvA_v1r or ADynamicBit_v1r or
	BDynamicBit_v1r or MemStall_s1) begin
    if (Phi1 & ~MemStall_s1) begin
	
	ADrvB_s2r = ADrvB_v1r;
	BDrvA_s2r = BDrvA_v1r;
	ADynamicBit_s2r = ADynamicBit_v1r;
	BDynamicBit_s2r = BDynamicBit_v1r;
    end
end

always @(Phi1 or SecondIssue_s1e or Hold_s1e or MemStall_s1) begin
    if (Phi1 & ~MemStall_s1) begin
	
	Hold_s2e = Hold_s1e;
	SecondIssue_s2e = SecondIssue_s1e;
    end
end

always @(Phi2 or ADrvB_s2r or BDrvA_s2r
         or SecondIssue_s2r or SecondIssueCond_s2r
         or ADynamicBit_s2r or BDynamicBit_s2r
         or Hold_s2r) begin
    if (Phi2) begin
	
	ADrvB_s1e = ADrvB_s2r;
	BDrvA_s1e = BDrvA_s2r;
	SecondIssue_s1e = SecondIssue_s2r;
	SecondIssueCond_s1e = SecondIssueCond_s2r;
	ADynamicBit_s1e = ADynamicBit_s2r;
	BDynamicBit_s1e = BDynamicBit_s2r;
	Hold_s1e = Hold_s2r;
    end
end

always @(Phi2 or PCPacketNum_s2i) begin
    if (Phi2) PCPacketNum_s1r = PCPacketNum_s2i;
end

//  these are simply renaming.  Can get rid of these if we want.
assign HoldPC_s2r = Hold_s2r;
assign LatchInstrs_s1r = (~Hold_s1e & ~SecondIssueMips_s1e) & ~IFetchStall_s1 & ~MemStall_s1;
assign LatchTags_s1r = ~MemStall_s1 & ReadCache_s1r;

//---------------------------------------------------------------------------
//			 --- ICACHE Control ---
//---------------------------------------------------------------------------
always @(Phi1 or ReadCache_v1i or ReadCache_s1r) begin
    if (Phi1) begin
	
	ReadCache_s2i = ReadCache_v1i;
	ReadCache_s2r = ReadCache_s1r;
    end
end

always @(Phi1 or WriteCache_v1) begin
    if (Phi1) WriteCache_s2 = WriteCache_v1;
end

always @(Phi2 or ReadCache_s2i or SecondIssueMips_s2r or SecondIssue_s2e or
	IncPC_s2e) begin
    if (Phi2) begin
	
	ReadCache_s1r = ReadCache_s2i;
	SecondIssueMips_s1e = SecondIssueMips_s2r & IncPC_s2e;
    end
end

// WriteTag is generated in FSM section.
assign WriteData_s2 = (WriteCache_s2 & ~L2Miss_s2);
//
// Enable reading or writing of the ICACHE
//
assign SecondIssueMips_s2r = PCOffset_s2i & MipsMode_s2e &
			PrevState_s2 == `CACHEHIT;
assign DataEnable_s2 = WriteData_s2 | (ReadCache_s2i & (~SecondIssue_s2e & ~SecondIssueMips_s2r | ~IncPC_s2e));
assign TagEnable_s2 = WriteTag_s2 | (ReadCache_s2i & (~SecondIssue_s2e & ~SecondIssueMips_s2r | ~IncPC_s2e));

//----------------------------------------------------------------------------
//		      ---- Comparator Section ----
//----------------------------------------------------------------------------

always @(Phi1 or PCOffset_s1r or MemStall_s1) begin
    if (Phi1 & ~MemStall_s1) PCOffset_s2r = PCOffset_s1r;
end

always @(Phi2 or PCOffset_s2i) begin
    if (Phi2) PCOffset_s1r = PCOffset_s2i;
end

assign ICacheMiss_v2r = ~(ICacheLineValid_s2r & Match_v2r) &
			    ~Hold_s2e & ~NonCacheable_s2 & ~ItlbMiss_s2 &
			    ~Except_s2w & PrevState_s2 != `REFETCH;

//----------------------------------------------------------------------------
//		    ---- Non-Cacheable Section ----
//----------------------------------------------------------------------------

always @(Phi1 or LatchNonCachePkt_v1) begin
    if (Phi1 == 1'b1) LatchNonCachePkt_s2 = LatchNonCachePkt_v1;
end

always @(Phi2 or NonCacheable_s2) begin
    if (Phi2 == 1'b1) NonCacheableHeld_s1 = NonCacheable_s2;
end


// Hold NonCachable until phi2 of RF of fetched packet (to keep ICacheMiss
// from being asserted again for this packet)

always @(Phi1 or NonCacheable_s1 or NonCacheableHeld_s1 or IStall_s1 or
         Reset_s1) begin
    if (Phi1 == 1'b1) begin
	
	NonCacheable_s2 = NonCacheable_s1 | 
			    (NonCacheableHeld_s1 & IStall_s1 & ~Reset_s1);
    end
end

//----------------------------------------------------------------------------
//		   ---- PC Unit Control Signals ----
//----------------------------------------------------------------------------
// Stage exception signal
always @(Phi1 or Stall_s1 or Except_s1w) begin
    if (Phi1 & ~Stall_s1) Except_s2w = Except_s1w;
end

//
// If takenBranch_s1e is late can generate this signal on following
// phase (just need to delay all the signals).
//
always @(Phi1 or Stall_s1 or ImmPC_s1e or RegPC_s1e or takenBranch_v1e) begin
    if (Phi1 & ~Stall_s1) begin
	
	IncPC_s2e = ~ImmPC_s1e & ~RegPC_s1e & ~takenBranch_v1e;
    end
end

assign RestoreIStallPC_s1 = IStall_s1 & ~IFetchStall_s1;

//
// Controls the latch for the first latch in the PC chain. Qualify with
// IStall to prevent overwriting the next PC during a stall
//
assign PCUnitPsi2_s2 = Phi2 & ~IStall_s2;

//
// Controls the PEC and EPCN latches. Should only open during an
// exception
//
assign latchEPC_s1w = Phi1 & Except_s1w;

//
// Hold instructions and PC if in Torch mode and will do second issue
// of a dynamically nop'ed packet.  Goes PCunit eventually.
// NOTE: The following signal used to be gated with ~MipsMode_s2e but I
// don't think that is necessary since there is no way that SecondIssue_s2r 
// could ever be asserted when in MipsMode. SecondIssue_s2r depends on the
// dynamic bits which should only be set in Torch mode.
//
assign Hold_s2r = SecondIssue_s2r;


//----------------------------------------------------------------------------
//		   ---- Branch Condition ----
//----------------------------------------------------------------------------
// Combine the decoded branch types with the appropriate condition from 
// the register file to determine whether the branch should be taken or not.
assign takenBranch_v1e =
	(BEQnext_s1e & SEqualsT_v1e) |
	(BNEnext_s1e & ~SEqualsT_v1e) |
	(BLEZnext_s1e & (SEqualsT_v1e | SIsNegative_v1e)) |
	(BGTZnext_s1e & ~SEqualsT_v1e & ~SIsNegative_v1e) |
	(BLTZnext_s1e & SIsNegative_v1e) |
	(BGEZnext_s1e & (SEqualsT_v1e | ~SIsNegative_v1e));

//
// The PC select is done with a two-level MUX structure. The first four
// signals control a large 4-1 MUX for the early PC's and the last
// controls a 2-1 MUX for the branch PC.
//
assign Jump0_s1e = ~Except_s1w & ~IStall_s1 & ~ImmPC_s1e & ~RegPC_s1e;
assign Jump1_s1e = ~Except_s1w & ~IStall_s1 & ImmPC_s1e;
assign Jump2_s1e = ~Except_s1w & ~IStall_s1 & RegPC_s1e;
assign Jump3_s1e =  Except_s1w & ~IStall_s1;
assign Jump4_s1e =  IStall_s1;
assign Jump5_v1e = (~Except_s1w & ~IStall_s1) & takenBranch_v1e;

//
// Keep branch information to generate commit on following cycle (done in
// instruction decoder)
//
always @(Phi1 or Stall_s1 or takenBranch_v1e or ImmPC_s1e or RegPC_s1e) begin
    if (Phi1 & ~Stall_s1)
	TakenBranch_s2e = takenBranch_v1e;
end

//
// Check for Address Violations ----
// SystemBit_s2e is the Kernel/User bit (and is 0 if in kernel mode)
assign IAddrError_v2i = PC_bit31_s2i & SystemBit_s2e;

// rename these signals
assign HoldPC_s2e = Hold_s2e;

// PC Chain
always @(Phi1 or EPCSel_s1m or EPCNSel_s1m) begin
    if (Phi1) begin
	
	EPCSel_s2m = EPCSel_s1m;
	EPCNSel_s2m = EPCNSel_s1m;
    end
end
assign EPCBufEnable_s2m = Phi2 & (EPCSel_s2m | EPCNSel_s2m);
assign EPCMuxSel_s2m = EPCSel_s2m;



endmodule				  // IFetchControl





///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

// +----------------------------------------------------------------+
// |            Copyright (c) 1994 Stanford University.             |
// |                      All Rights Reserved.                      |
// |                                                                |
// |   This software is distributed with *ABSOLUTELY NO SUPPORT*    |
// |   and *NO WARRANTY*.   Use or reproduction of this code for    |
// |   commerical gains is strictly prohibited.   Otherwise, you    |
// |   are given permission to use or modify this code as long      |
// |   as you do not remove this notice.                            |
// +----------------------------------------------------------------+
//
//  Title: 	Instruction Fetch Datapath
//  Created:	Thu Mar 24 15:50:57 1994
//  Author: 	Ricardo E. Gonzalez
//		<ricardog@chroma>
//
//
//  IFetchDatapath.v,v 7.25 1995/01/28 00:47:59 ricardog Exp
//
//  TORCH Research Group.
//  Stanford University.
//	1993.
//
//	Description: 
//	    Instruction Fetcher/Instruction Cache unit.  This Section
//	    contains all the Datapath Modules and Components All it's
//	    control signals will come from IFetchControl.v Three main
//	    Sections
//		1) ICache Refill
//		2) ICache Instruction Fetch
//		3) Tag/PID Comparator
//
//	Hierarchy:  Torch.instrFetch
//
//  Revision History:
//	Modified: Thu Dec  1 21:48:31 1994	<ricardog@chroma.Stanford.EDU>
//	* Changed MUX2 implementation.
//	Modified: Wed Nov 30 14:49:05 1994	<ricardog@chroma.Stanford.EDU>
//	* Changed to explicit latch qualification.
//	Modified: Wed Nov 30 13:16:00 1994	<ricardog@chroma.Stanford.EDU>
//	* Changed the disasm code.
//	Modified: Sun Aug  7 22:17:35 1994	<ricardog@chroma.Stanford.EDU>
//	* Moved ICACHE outside of IFetchDatapath.
//	Modified:	Sun May 22 16:33:21 1994	<ricardog@chroma>
//	* Changed Psi2_q2 to Phi2.
//	Modified:	Sat Apr  9 16:48:48 1994	<ricardog@chroma>
//	* Fixed verilint errors.
//

module IFetchDatapath(
    Phi1,
    Phi2,
    Stall_s2,
    InstrAddr_s2i,
    MipsMode_s2e,
    SharedMemData_s2,
    //SharedMemAddr_s1,
    NonCacheableHeld_s1,
    ExtDataValid_s2,
    LatchShiftReg_s1,
    LatchDataReg_s1,
    ExtMuxSelect_s1,
    ICacheOutData_v1r,
    ICacheOutTag_v1r,
    PCPID_v2r,
    LatchNonCachePkt_s2,
    LatchTags_s1r,
    ADrvB_s2r,
    BDrvA_s2r,
    LatchInstrs_s1r,
    ADynamicBit_v1r,
    BDynamicBit_v1r,
    AInstr_s2r,
    BInstr_s2r,
    Match_v2r,
    ICacheLineValid_s2r,
    ICacheInData_s2,
    ICacheInTag_s2
    );
    //L1Hit_s1

//----------------------------------------------------------------------------
input		Phi1;			// clocks
input		Phi2;			// 
input		Stall_s2;
input	[29:13]	InstrAddr_s2i;		// PC from PC Unit
input		MipsMode_s2e;		// MIPS mode bit from coprocessor
// SharedMemData_s2 must be bidirectional (inout) for cache testing
input	[63:0]	SharedMemData_s2;	// 64 bit data bus from external mem
//input	[31:0]	SharedMemAddr_s1;	// for external requests/tests
input		NonCacheableHeld_s1;	// instruction access is non-cachabl
input		ExtDataValid_s2;	// phi2 & ExtDataVaild_s2
input		LatchShiftReg_s1;	// qualified with phi1
input		LatchDataReg_s1;
input		ExtMuxSelect_s1;        // from IFetchFSM
input	[5:0]	PCPID_v2r;		// PID from coprocessor
input		LatchNonCachePkt_s2;	// latch in nonCacheable
input		ADrvB_s2r, BDrvA_s2r;	// routing muxes
input		LatchInstrs_s1r;			
input		LatchTags_s1r;		// 
output		ADynamicBit_v1r, BDynamicBit_v1r;
output	[39:0]	AInstr_s2r, BInstr_s2r; // A,B Instruction Registers
output		Match_v2r;		// output of the comparator
output		ICacheLineValid_s2r;
//output		L1Hit_s1;		// For cache testing (NOT IMPLEMENTED)

wire	[23:0]	ITagPid_s2r;		// combine tag and pid and valid bit
wire	[22:0]	PCTagPid_v2r;		//combine tag and pid
wire		Match_v2r;		//output of comparator
wire	[63:0]	SharedMemData_s1;	// latched of s2
wire	[63:0]	DataReg_s2;		// 64 bit register for incoming instr
wire	[63:0]  ExtMuxOut_s1;		// mux going into shift register
wire	[63:0]  ShiftReg_s2;		// shift register containing ext bytes
input	[79:0]	ICacheOutData_v1r;	// Internal MUX which spits out 2 pkts
output	[79:0]	ICacheInData_s2;	// 80 bit wide path write to cache
output	[23:0]	ICacheInTag_s2;
input	[23:0]	ICacheOutTag_v1r;	
wire	[63:16]	ShiftReg_s1;		// phase later for shifting purposes
wire	[79:0]	NonCacheablePacket_s1;	// contains non-cacheable instr
wire	[39:0]	AInstr_v1r, BInstr_v1r;	// instructions out of ICache
wire		ADynamicBit_v1r;	// dynamic NOOP bit out of cache
wire		BDynamicBit_v1r;	// dynamic NOOP bit out of cache
wire	[39:0]	AInstrLatch_s2r, BInstrLatch_s2r; // instruction latches
wire	[39:0]	AInstr_s2r, BInstr_s2r;	// instruction buses
wire	[16:0]	PCTag_s1r;		// latched PC Tag (MSB 17 bits of PC)
wire	[16:0]	PCTag_s2r;		// delayed PC Tag (MSB 17 bits of PC)
//wire		L1Hit_s1;		// For cache testing (NOT IMPLEMENTED)


//---------------------------------------------------------------------------
//			Initialization
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
//			Refill Section
//---------------------------------------------------------------------------
// Latch SharedMemData_s2 bus; delay one phase; data actually written
// Phi2 of next cycle.

PHI2_LATCH_EN_64 LATCH_64_SharedMem(SharedMemData_s1, SharedMemData_s2,
			Phi2, ExtDataValid_s2);

// THIS LATCH THE DATA PART FROM SharedMemData_s1

PHI1_LATCH_EN_64 LATCH_64_DATA (DataReg_s2, SharedMemData_s1,
			Phi1, LatchDataReg_s1);

// This section breaks up the extension bytes and shift Ext Bytes to the
// right
//
// Three set of 2-1 mux's. WHen we get the ext bytes load the contents
// of SharedMemData_s1. Otherwise shift left the contesnts of ShiftReg_s2
MUX2_16	MUX2_16_ExtMuxOut1 (ExtMuxOut_s1[15:0],
			SharedMemData_s1[15:0], ShiftReg_s1[31:16],
			ExtMuxSelect_s1);
MUX2_16	MUX2_16_ExtMuxOut2 (ExtMuxOut_s1[31:16],
			SharedMemData_s1[31:16], ShiftReg_s1[47:32],
			ExtMuxSelect_s1);
MUX2_16	MUX2_16_ExtMuxOut3 (ExtMuxOut_s1[47:32],
			SharedMemData_s1[47:32], ShiftReg_s1[63:48],
			ExtMuxSelect_s1);

// Four latches 16-bits wide each for ShiftReg_s2
PHI1_LATCH_EN_64 LATCH_SHFTREG_S2 (ShiftReg_s2,
			{SharedMemData_s1[63:48], ExtMuxOut_s1[47:0]},
			Phi1, LatchShiftReg_s1);

// Three latches for ShiftReg_s1. The low order bits are lost
PHI2_LATCH_EN_48	LATCH_SHFTREG_S1 (ShiftReg_s1[63:16],
			ShiftReg_s2[63:16], Phi2, Stall_s2);

//  the following gets the ext bytes and data into icache
//  If it's Mipsmode then the ext bytes are all zeros
MUX2_8	MUX2_8_MipsMode2 (ICacheInData_s2[79:72], 8'b0, ShiftReg_s2[15:8],
			MipsMode_s2e);

MUX2_8	MUX2_8_MipsMode1 (ICacheInData_s2[39:32], 8'b0, ShiftReg_s2[7:0],
			MipsMode_s2e);

assign ICacheInData_s2[31:0]  = DataReg_s2[31:0];
assign ICacheInData_s2[71:40]  = DataReg_s2[63:32];

//  should have PCTag_s2r, PCPID_v2r, 1 (for Valid bit) as inputs for this
//  file from PCunitDatapath.v so that these data can be written into
//  ICache
assign ICacheInTag_s2 = {PCTagPid_v2r,1'b1};

// ICache Module
// It should consist of:
//		1) 10 bits of index address -- WordLineDecode_s1r
//		2) 2 bits of address to select which 80bits of ICache to write
//		   into -- WritePack_s2
//		3) 2 bits of address to select which 80 bits of ICache to read
//			-- PCPacketNum_s1r
//		4) 80 bit write bus -- ICacheInData_s2
//		5) 80 bit read bus  -- ICacheOutData_v1r
//		6) 24 bit write bus for Tag, PID, and Valid bit 
//			-- PCTag_s2r, PCPID_v2r, 1 (for Valid bit)
//			-- it's combined as ICacheInTag
//		6) 24 bit read bus for Tag, PID, and Valid bit
//		  -- ICacheLineTag_v1r, ICacheLinePID_v1r, ICacheLineValid_v1r
//		  -- it's combined as ICacheOutTag
//		7) Control signal input WriteDataValid_q2 for writing data into
//			cache
//		8) Control signal input WriteTagValid_q2 for writing tag and
//			PID and Valid bit into cache (necessary?)

// ICacheInData_s2 also will write into nonCacheablePacket latch

PHI2_LATCH_EN_80 LATCH_80_NonCacheable (NonCacheablePacket_s1, ICacheInData_s2,
			Phi2, LatchNonCachePkt_s2);

//----------------------------------------------------------------------------
//			ICache Instruction Fetch
//----------------------------------------------------------------------------

MUX2_40		MUX2_40_NonCacheA	(AInstr_v1r, NonCacheablePacket_s1[39:00],
			ICacheOutData_v1r[39:0], NonCacheableHeld_s1);

MUX2_40		MUX2_40_NonCacheB	(BInstr_v1r, NonCacheablePacket_s1[79:40],
			ICacheOutData_v1r[79:40], NonCacheableHeld_s1);


assign ADynamicBit_v1r = AInstr_v1r[38];
assign BDynamicBit_v1r = BInstr_v1r[38];


PHI1_LATCH_EN_40 LATCH_40_InstrA (AInstrLatch_s2r, AInstr_v1r, Phi1,
			LatchInstrs_s1r);
PHI1_LATCH_EN_40 LATCH_40_InstrB (BInstrLatch_s2r, BInstr_v1r, Phi1,
			LatchInstrs_s1r);

MUX2_40		MUX2_40_BDrvA	(AInstr_s2r, BInstrLatch_s2r, AInstrLatch_s2r,
			  BDrvA_s2r);
MUX2_40		MUX2_40_ADrvB	 (BInstr_s2r, AInstrLatch_s2r, BInstrLatch_s2r,
			  ADrvB_s2r);

//----------------------------------------------------------------------------
//			Comparator Section
//----------------------------------------------------------------------------

// It's possible to put these in one 29 bit wide latch
//	Phi1 latches
PHI2_LATCH_EN_17	LATCH_17_Tag_s1 (PCTag_s1r, InstrAddr_s2i[29:13],
			Phi2, ~Stall_s2);

PHI1_LATCH_EN_24 LATCH_24_OutTag (ITagPid_s2r, ICacheOutTag_v1r,
			Phi1, LatchTags_s1r);
PHI1_LATCH_EN_17 LATCH_17_Tag_s2 (PCTag_s2r, PCTag_s1r,
			Phi1, LatchTags_s1r);
//
//	output the valid bit as control signal to IFetchControl.v
assign ICacheLineValid_s2r = ITagPid_s2r[0];

//	Combine tag with pid and input into the 23 bits comparator

assign PCTagPid_v2r = {PCTag_s2r, PCPID_v2r};

COMP_23		COMP_23_CacheMiss(Match_v2r, ITagPid_s2r[23:1], PCTagPid_v2r);



endmodule				  // IFetchDatapath



////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////



// +----------------------------------------------------------------+
// |            Copyright (c) 1994 Stanford University.             |
// |                      All Rights Reserved.                      |
// |   commerical gains is strictly prohibited.   Otherwise, you    |
// |   are given permission to use or modify this code as long      |
// |   as you do not remove this notice.                            |
// +----------------------------------------------------------------+
//
//  Title: 	PC Unit Datapath
//  Created:	Sat Mar 26 22:08:03 1994
//  Author: 	Ricardo E. Gonzalez
//		<ricardog@chroma>
//
//
//  PCUnitDatapath.v,v 7.17 1995/01/28 00:48:03 ricardog Exp
//
//  TORCH Research Group.
//  Stanford University.
//	1993.
//
//	Description: 
//		main sections:
//		    - Jump Mux
//		    - PC incrementer
//		    - PC Chain
//
//	Hierarchy: Torch.instrFetch.
//
//  Revision History:
//	Modified: Thu Dec  1 21:50:37 1994	<ricardog@chroma.Stanford.EDU>
//	* Changed MUX2 implementation.
//	Modified: Wed Nov 30 14:50:32 1994	<ricardog@chroma.Stanford.EDU>
//	* Changed to explicit latch qualification.
//	Modified:	Sun May 22 16:34:11 1994	<ricardog@chroma>
//	* Changed Psi2_q2 to Phi2.
//	Modified:	Tue Apr 12 12:26:42 1994	<ricardog@chroma>
//	* Changed timing of HoldPC_v2r to be _s2r.
//	Modified:	Sat Apr  9 16:49:52 1994	<ricardog@chroma>
//	* Fixed verilint errors.
//	Modified:	Fri Apr  1 16:31:53 1994	<ricardog@chroma>
//	* Better implementation of jump mux.
//



module PCUnitDatapath(
    Phi1,
    Phi2,
    Stall_s1,
    Stall_s2,
    Gamma1_s1,
    PCUnitPsi2_s2,
    InstrAddr_s2i, 
    ASBus_s1e,
    PCImmedBus_s2r,
    HoldPC_s2r,
    HoldPC_s2e,
    MipsMode_s2e,
    MipsMode_b_s2e,
    AResultBus_v2e,
    PCDrvResult_s2e,
    RestoreIStallPC_s1,
    MemBus_v2m,
    EPCBufEnable_s2m,
    EPCMuxSel_s2m,
    latchEPC_s1w,
    ExceptVector_s1i,
    Jump0_s1e,
    Jump1_s1e,
    Jump2_s1e,
    Jump3_s1e,
    Jump4_s1e,
    Jump5_v1e
    );
//-----------------------------------------------------------------------------

input		Phi1;			// 
input		Phi2;
input		Stall_s1;
input		Stall_s2;
input		Gamma1_s1;		// Dont move on MemStall
input		PCUnitPsi2_s2;		// Delayed IStall
output	[29:0]	InstrAddr_s2i;		// Instruction Number from PC
					// used on a miss. 30 bits!!!
					// Bit 31 also goes to IFetchControl

// from Register File
input	[31:2]	ASBus_s1e;		// for jump-register

// from IFetch unit
input	[25:0]	PCImmedBus_s2r;		// for jump-immediate & branch offset
input		HoldPC_s2r;		// hold PC if dnop'ed packet
input		HoldPC_s2e;
input		MipsMode_s2e;		// MIPS mode bit from coprocessor
input		MipsMode_b_s2e;

output	[31:0]	AResultBus_v2e;		// for JAL/JALR
input		PCDrvResult_s2e;	// for JAL/JALR -- drive PC onto bus

input		RestoreIStallPC_s1;	// Restart from ICache stall

// Exceptions & Coprocessor 0 operations
output	[31:0]	MemBus_v2m;		// for MFCOP0 (from EPC/EPCN)
input		EPCBufEnable_s2m;	// from cop0, for MFC0 (from EPC/EPCN)
input		EPCMuxSel_s2m;	// originally


input		latchEPC_s1w;
input	[2:0]	ExceptVector_s1i;

input		Jump0_s1e;		// PC Select signals (mutually
input		Jump1_s1e;		// exclusive).
input		Jump2_s1e;
input		Jump3_s1e;
input		Jump4_s1e;
input		Jump5_v1e;

//
// Output type declarations
//
wire	[31:0]	AResultBus_v2e;
wire	[29:0]	EPC_s2, EPCN_s2;


//
// Local Declarations
//
wire	[29:0]	PCChain_s1r;
wire	[29:0]	PCChain_s2r;
wire	[29:0]	PCChain_s1e;
wire	[29:0]	PCChain_s2e;
wire	[29:0]	PCChain_s1m;
wire	[29:0]	PCChain_s2m;
wire	[29:0]	PCChain_s1w;
wire	[29:0]	PCPlus_s1r;
wire	[29:0]	PCPlus_s2r;
wire	[29:0]	PCPlus_v2r;
wire	[29:0]	BranchTarget_s1e;
wire	[29:0]	NewEarlyPC_s1r;
wire	[29:0]	NextPC_v1r;
wire	[25:0]	PCImmedBus_s1e;


wire	[29:0]	ExceptionPC_s1;
wire	[29:0]	IStallPC_s1;




//----------------------------------------------------------------------------
//		New Variables Created due to Partitioning
//----------------------------------------------------------------------------
wire	[29:0] PCImmBusSignExt_s2r;		// sign extended PCImmBus
wire	[29:0] SumBrhTar_v2r;			// output of ADD_30
wire	[29:0] PC_Original_s2i;			// contains PC #
wire	[29:0] Add_1_or_2_s2e;			// either 1 or 2 depending on
						//  mode
wire	[29:0] SumPC_v2i;			// output of the pc adder
wire	[29:0] OutMuxChain_s2r;
wire	[31:0] OutMuxMemBus_v2m;

//---------------------------------------------------------------------------
//			  --- Dummy Wires ---
//---------------------------------------------------------------------------
wire		cOut_v2r;
wire		incCout_v2i;

//----------------------------------------------------------------------------
//  	    	    	  Control Signals
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
//                        JUMP MUX Section
//----------------------------------------------------------------------------
// Increment PC -- JumpSelect = 0 -- default (see PC increment section)

// Jump to the Immediate Instr -- JumpSelect = 1
PHI2_LATCH_EN_26	LATCH_26_PCImmBus (PCImmedBus_s1e,
			PCImmedBus_s2r, Phi2, ~Stall_s2);

// Register PC -- JumpSelect = 2 (Use ASBus_s1e)

// Mux to Resore PC due to IStall -- JumpSelect = 3
MUX2_30		MUX2_30_RISPC (IStallPC_s1, PCChain_s1r, PCChain_s1e,
			RestoreIStallPC_s1);

// Calculate Exception PC -- JumpSelect = 4
assign ExceptionPC_s1[29:0] =
    { ExceptVector_s1i[2], ~ExceptVector_s1i[2], ~ExceptVector_s1i[2],
      1'b1, 18'b0, ExceptVector_s1i[1], ExceptVector_s1i[0], 6'b0 };

// Branch to the target instr -- JumpSelect = 5
assign PCImmBusSignExt_s2r = { {14{PCImmedBus_s2r[15]}},
				PCImmedBus_s2r[15:0] };
ADD_30	ADD_30_BrhTrg (SumBrhTar_v2r, cOut_v2r, PCImmBusSignExt_s2r,
			PCPlus_s2r, 1'b0);	// Ignore carry_out
PHI2_LATCH_EN_30    LATCH_30_BrhTrg (BranchTarget_s1e, SumBrhTar_v2r,
			Phi2, ~Stall_s2);

// 
// The PC select is done with a two-level MUX to speedup the branch path.
// I have made the assumtion that aside from the branch control signals
// all the other select signals will be available early, so we can use a
// large 5-1 MUX. If any of the other inputs is also late need to consider
// a 3-level MUX.
//
//	Jump0_s1e  if ~Except_s1w & ~IStall_s1 & ~ImmPC_s1e & ~RegPC_s1e
//	Jump1_s1e  if ~Except_s1w & ~IStall_s1 & ImmPC_s1e
//	Jump2_s1e  if ~Except_s1w & ~IStall_s1 & RegPC_s1e
//	Jump3_s1e  if  Except_s1w
//	Jump4_s1e  if ~Except_s1w & IStall_s1
//	Jump5_v1e  if (~Except_s1w & ~IStall_s1) & takenBranch_v1e 
//

MUX5_30	MUX5_30_EarlyPC (
	NewEarlyPC_s1r,
	PCPlus_s1r, {PCChain_s1e[29:26], PCImmedBus_s1e},
	ASBus_s1e[31:2], ExceptionPC_s1[29:0], IStallPC_s1,
	Jump0_s1e, Jump1_s1e, Jump2_s1e, Jump3_s1e, Jump4_s1e);

//--------------------------------------------------------------------------
//			---- Slect Next PC ----
//--------------------------------------------------------------------------
MUX2_30		NextPCMux(NextPC_v1r, BranchTarget_s1e, NewEarlyPC_s1r,
			Jump5_v1e);
PHI1_LATCH_EN_30 LATCH_30_PC (InstrAddr_s2i, NextPC_v1r, Phi1, Gamma1_s1);


//--------------------------------------------------------------------------
//		    ---- PC Incrementer Section ----
//--------------------------------------------------------------------------
assign PC_Original_s2i = {InstrAddr_s2i[29:1], InstrAddr_s2i[0] & MipsMode_s2e};
assign Add_1_or_2_s2e  = {28'b0, MipsMode_b_s2e, MipsMode_s2e };
ADD_30		ADD_30_PC (SumPC_v2i, incCout_v2i, PC_Original_s2i,
			Add_1_or_2_s2e, 1'b0);	// Ignore carry_out
MUX2_30		MUX2_30_HoldPC (PCPlus_v2r, PCPlus_s2r, SumPC_v2i,
			HoldPC_s2r);
PHI2_LATCH_30	LATCH_30_PCPlus_s1r (PCPlus_s1r, PCPlus_v2r,
			Phi2);
PHI1_LATCH_EN_30 LATCH_30_PCPlus_s2r (PCPlus_s2r, PCPlus_s1r, Phi1, Gamma1_s1);

//
// For JAL/JALR/BLTZAL/BGEZAL
//
//TRIBUF_32 TRIBUF_32_PC(AResultBus_v2e, { PCPlus_s2r[29:0], 2'b0}, PCDrvResult_s2e);


//--------------------------------------------------------------------------
//			   ---- PC CHAIN ----
//--------------------------------------------------------------------------
//
// Phi2 latches stall (stay closed) on MemStall_s2
// Phi1 latches stall (stay closed) on IStall_s1, and Phi2 latch for IF2
//    also stays closed.
//

//----------------------------------- IF2-----------------------------------
PHI2_LATCH_EN_30 LATCH_30_ChainS1r (PCChain_s1r, InstrAddr_s2i, Phi2, PCUnitPsi2_s2);

//----------------------------------- RF1-----------------------------------
PHI1_LATCH_EN_30 LATCH_30_ChainS2r (PCChain_s2r, PCChain_s1r, Phi1, ~Stall_s1);

//----------------------------------- RF2-----------------------------------

// Here account for the "odd" address of an instruction issued on 2nd cycle
// of a dynamically nop'ed packet.
MUX2_30		MUX2_30_ODD (OutMuxChain_s2r,
			{ PCChain_s2e[29:1], 1'b1 }, PCChain_s2r,
			HoldPC_s2e);
PHI2_LATCH_EN_30	LATCH_30_ChainS1e (PCChain_s1e, OutMuxChain_s2r,
			Phi2, ~Stall_s2);

//----------------------------------- EX1-----------------------------------
PHI1_LATCH_EN_30	LATCH_30_ChainS2e (PCChain_s2e, PCChain_s1e,
			Phi1, ~Stall_s1);

//----------------------------------- EX2-----------------------------------
PHI2_LATCH_EN_30	LATCH_30_ChainS1m (PCChain_s1m, PCChain_s2e,
			Phi2, ~Stall_s2);

//----------------------------------- MEM1-----------------------------------
PHI1_LATCH_EN_30	LATCH_30_ChainS2m (PCChain_s2m, PCChain_s1m,
			Phi1, ~Stall_s1);

//----------------------------------- MEM2-----------------------------------
PHI2_LATCH_EN_30	LATCH_30_ChainS1w (PCChain_s1w, PCChain_s2m,
			Phi2, ~Stall_s2);

//------------------------------ EPC and EPCN---------------------------------
PHI1_LATCH_EN_30	LATCH_30_EPC (EPC_s2, PCChain_s1w, Phi1, latchEPC_s1w);
PHI1_LATCH_EN_30	LATCH_30_EPCN (EPCN_s2, PCChain_s1m, Phi1, latchEPC_s1w);

//
// For a Move-From-Cop0 instruction specifying EPC or EPCN
// I am assuming that either EPCSel or EPCNSel comes on and not both
//
MUX2_32		MUX2_32_EPC (OutMuxMemBus_v2m,
			{ EPC_s2[29:0],  2'b0 }, { EPCN_s2[29:0], 2'b0 },
			EPCMuxSel_s2m);
//TRIBUF_32	TRIBUF_32_EPC (MemBus_v2m, OutMuxMemBus_v2m, EPCBufEnable_s2m);


endmodule				  // PCUnitDatapath


//`include "/home/ecelrc/students/sen/project/1-ver/Data/parts2.v"


module PHI2_LATCH_EN_26 (out, in, inpclk, en);
    output      [25:0]  out;
    input       [25:0]  in;
    input               inpclk;
    input               en;
    wire saat;
    reg         [25:0]  state;
    initial state=26'b0;
    assign saat = inpclk & en;
    always @(saat or in) if (saat) state = in;
    assign out = state;
endmodule

module MUX2_30 (out, in1, in2, sel);
    output      [29:0]  out;
    input       [29:0]  in1;
    input       [29:0]  in2;
    input               sel;
    wire        [29:0]  out_b;
    assign
        out_b = (sel == 1'b1) ? ~in1 : 30'b0,
        out_b = (sel == 1'b0) ? ~in2 : 30'b0;
    assign out = ~out_b;
endmodule

module MUX2_16 (out, in1, in2, sel);
    output      [15:0]  out;
    input       [15:0]  in1;
    input       [15:0]  in2;
    input               sel;
    wire        [15:0]  out_b;
    assign
        out_b = (sel == 1'b1) ? ~in1 : 16'b0,
        out_b = (sel == 1'b0) ? ~in2 : 16'b0;
    assign out = ~out_b;
endmodule


module ADD_30 (sum, carry_out, in1, in2, carry_in);
    output      [29:0]  sum;
    output              carry_out;
    input       [29:0]  in1;
    input       [29:0]  in2;
    input               carry_in;
    assign {carry_out, sum} = in1 + in2 + carry_in;
endmodule


module PHI2_LATCH_EN_30 (out, in, inpclk, en);
    output      [29:0]  out;
    input       [29:0]  in;
    input               inpclk;
    input               en;
    wire saat;
    reg         [29:0]  state;
    initial state=29'b0;
    assign saat = inpclk & en;
    always @(saat or in) if (saat)  state = in;
    assign out = state;
endmodule


module MUX5_30 (out, in1, in2, in3, in4, in5, sel1, sel2, sel3, sel4, sel5);
    output      [29:0]  out;
    input       [29:0]  in1;
    input       [29:0]  in2;
    input       [29:0]  in3;
    input       [29:0]  in4;
    input       [29:0]  in5;
    input               sel1;
    input               sel2;
    input               sel3;
    input               sel4;
    input               sel5;
    wire        [29:0]  out_b;
    assign
        out_b = (sel5 == 1'b1) ? ~in5 : 30'b0,
        out_b = (sel4 == 1'b1) ? ~in4 : 30'b0,
        out_b = (sel3 == 1'b1) ? ~in3 : 30'b0,
        out_b = (sel2 == 1'b1) ? ~in2 : 30'b0,
        out_b = (sel1 == 1'b1) ? ~in1 : 30'b0;
    assign out = ~out_b;
endmodule


module PHI1_LATCH_EN_30 (out, in, inpclk, en);
    output      [29:0]  out;
    input       [29:0]  in;
    input               inpclk;
    input               en;
    wire saat;
    reg         [29:0]  state;
    initial state=30'b0;
    assign saat = inpclk & en;
    always @(saat or in) if (saat)  state = in;
    assign out = state;
endmodule


module PHI2_LATCH_30 (out, in, inpclk);
    output      [29:0]  out;
    input       [29:0]  in;
    input               inpclk;
    wire clk_b;
    reg         [29:0]  state;
    initial state=30'b0;
    assign clk_b = ~inpclk;
    always @(inpclk or in) if (inpclk)  state = in;
    assign out = state;
endmodule


module MUX2_32 (out, in1, in2, sel);
    output      [31:0]  out;
    input       [31:0]  in1;
    input       [31:0]  in2;
    input               sel;
    wire        [31:0]  out_b;
    assign
        out_b = (sel == 1'b1) ? ~in1 : 32'b0,
        out_b = (sel == 1'b0) ? ~in2 : 32'b0;
    assign out = ~out_b;
endmodule

/*
module TRIBUF_32 (out, in, enable);
    output      [31:0]  out;
    input       [31:0]  in;
    input               enable;
    wire        [31:0]  pre_out;
    assign pre_out = in;
    assign out = (enable) ? pre_out : 32'b0;
endmodule
*/

module PHI2_LATCH_EN_64 (out, in, inpclk, en);
    output      [63:0]  out;
    input       [63:0]  in;
    input               inpclk;
    input               en;
    wire saat;
    reg         [63:0]  state;
    initial state=64'b0;
    assign saat = inpclk & en;
    always @(saat or in) if (saat) state = in;
    assign out = state;
endmodule

module PHI1_LATCH_EN_64 (out, in, inpclk, en);
    output      [63:0]  out;
    input       [63:0]  in;
    input               inpclk;
    input               en;
    wire saat;
    reg         [63:0]  state;
    initial state=64'b0;
    assign saat = inpclk & en;
    always @(saat or in) if (saat) state = in;
    assign out = state;
endmodule

module PHI2_LATCH_EN_48 (out, in, inpclk, en);
    output      [47:0]  out;
    input       [47:0]  in;
    input               inpclk;
    input               en;
    wire saat;
    reg         [47:0]  state;
    initial state=48'b0;
    assign saat = inpclk & en;
    always @(saat or in) if (saat) state = in;
    assign out = state;
endmodule



module MUX2_8 (out, in1, in2, sel);
    output      [7:0]   out;
    input       [7:0]   in1;
    input       [7:0]   in2;
    input               sel;
    wire        [7:0]   out_b;
    assign
        out_b = (sel == 1'b1) ? ~in1 : 8'b0,
        out_b = (sel == 1'b0) ? ~in2 : 8'b0;
    assign out = ~out_b;
endmodule


module PHI2_LATCH_EN_80 (out, in, inpclk, en);
    output      [79:0]  out;
    input       [79:0]  in;
    input               inpclk;
    input               en;
    wire saat;
    reg         [79:0]  state;
    initial state=80'b0;
    assign saat = inpclk & en;
    always @(saat or in) if (saat) state = in;
    assign out = state;
endmodule


module MUX2_40 (out, in1, in2, sel);
    output      [39:0]  out;
    input       [39:0]  in1;
    input       [39:0]  in2;
    input               sel;
    wire        [39:0]  out_b;
    assign
        out_b = (sel == 1'b1) ? ~in1 : 40'b0,
        out_b = (sel == 1'b0) ? ~in2 : 40'b0;
    assign out = ~out_b;
endmodule


module PHI1_LATCH_EN_40 (out, in, inpclk, en);
    output      [39:0]  out;
    input       [39:0]  in;
    input               inpclk;
    input               en;
    wire saat;
    reg         [39:0]  state;
    initial state=40'b0;
    assign saat = inpclk & en;
    always @(saat or in) if (saat) state = in;
    assign out = state;
endmodule


module PHI2_LATCH_EN_17 (out, in, inpclk, en);
    output      [16:0]  out;
    input       [16:0]  in;
    input               inpclk;
    input               en;
    wire saat;
    reg         [16:0]  state;
    initial state=17'b0;
    assign saat = inpclk & en;
    always @(saat or in) if (saat) state = in;
    assign out = state;
endmodule


module PHI1_LATCH_EN_24 (out, in, inpclk, en);
    output      [23:0]  out;
    input       [23:0]  in;
    input               inpclk;
    input               en;
    wire saat;
    reg         [23:0]  state;
    initial state=24'b0;
    assign saat = inpclk & en;
    always @(saat or in) if (saat) state = in;
    assign out = state;
endmodule

module PHI1_LATCH_EN_17 (out, in, inpclk, en);
    output      [16:0]  out;
    input       [16:0]  in;
    input               inpclk;
    input               en;
    wire saat;
    reg         [16:0]  state;
    initial state=17'b0;
    assign saat = inpclk & en;
    always @(saat or in) if (saat) state = in;
    assign out = state;
endmodule

module COMP_23 (match, in1, in2);
    output              match;
    input       [22:0]  in1;
    input       [22:0]  in2;
    assign match = (in1 == in2);
endmodule


