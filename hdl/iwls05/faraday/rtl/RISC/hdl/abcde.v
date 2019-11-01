



















































































// == core/jpt.v; version 1.42; LX-4180 release 4.0 ==

// Copyright 1997-2000, Lexra Inc.
// ALL RIGHTS RESERVED

module  jpt

  (
  // Outputs
  JPT_DBM2PCSTSET_P, JPT_PCST_DR, JPT_TPC_DR, JPT_HALT_M_R_C,
  // Inputs
  CLK, TMODE, RESET_D1_R_N, CFG_EJTMLOG2, CFG_EJTBIT0M16, EJT_DREN_R,
  CFG_INSTM16EN, CP0_JCTRLDM_I_R, CP0_JCTRLDM_M_R, EJC_ECRPCAS_R,
  EJC_DCRTM_R, EJC_PCTRON_R, CP0_JPINDJ_E_R, CP0_JPTYPE_M_R,
  CP0_JXCPN_M_R, CP0_JTRIG_M_R, CP0_XCPN_M, CP0_XCPNVEC_M,
  CP0_IVATGT_I_R, CP0_IVATGT_S_R, MMU_IASTGT_I_R, MMU_IASTGT_S_R,
  CP0_INSTM32_I_R_N, CP0_INSTM32_S_R_N, CLMI_JPTHOLD
  );


  // ******************************************************************
  // ******************************************************************
  // LEXRA, INCORPORATED
  // Project:             LX-4180
  // Author:              Sol Katzman
  // Start:               October 30, 1998
  // Module:              JPT -- eJtag Pc Trace
  // ******************************************************************
  // ******************************************************************
  // File name:           jpt.v
  // $Log: jpt.v,v $
  // Revision 1.42  2000/04/04 13:58:36  jonah
  // Various synthesis improvements and command change reversion.
  //
  // Changed add_release_info to preserve references to the MIPS metric
  // and the MIPS-I instruction set.
  //
  // Revision 1.41  2000/04/03 19:19:59  jonah
  // Replaced key work veri_lint with string "veri_lint" to avoid false directives.
  //
  // Revision 1.40  2000/04/03 16:17:00  jonah
  // Added a Synopsys untranslated NC_FOO wire to prevent unused input TMODE
  // veri_lint warning.
  //
  // Revision 1.39  2000/03/08 22:11:56  cotsford
  // fixed some constraint mismatches
  //
  // Revision 1.38  2000/02/17 14:52:44  elliot
  // Generate a signal to be used to turn off PC Trace at the right time; send
  // it up through core.v.
  //
  // Revision 1.37  2000/02/14 22:00:50  cotsford
  // reformatted assertion checkers to conform with the required format.
  //
  // Revision 1.36  2000/01/06 16:48:55  todd
  // ** Copyright notice update for Y2K **
  //
  // I updated the copyright notices in all files that had them
  // to include 2000.
  //
  // Revision 1.35  1999/12/15 18:48:19  sol
  // Add config bit for PCTrace to output PC bit0.
  //
  // Revision 1.34  1999/11/03 17:03:17  lind
  // Change JPTYPE order to STL-JMP for M16 jal-jal2
  // Closes E4180.0142 "EJTAG PCTrace incorrect TPC for M16 Jal(x) with JMP code
  //
  // Revision 1.33  1999/08/18 18:07:27  lind
  // nevermind. removed RTL_MON MONTrace is a floating node again
  //
  // Revision 1.32  1999/08/18 16:10:42  lind
  // removed obsolete code within ifdef VPP_RAW_PCTRACE
  //
  // Revision 1.31  1999/08/17 21:29:00  lind
  // core/jpt.v
  // testbed/testbed.v
  //
  //  Guard definitation of MonTrace wire with `ifdef RTL_MON to
  //  avoid "floating nodes" problem E4180.0101 "Floating Nodes in LX4180
  //  Database"
  //
  // Revision 1.30  1999/08/13 20:50:43  bob
  // fixing
  //   4180.68  lconfig reset options can produce untestable logic
  //   4180.89  global reset distribution does not support reset tree synth
  //   4180.95  non-resetable flops in RTL
  //
  // Revision 1.29  1999/08/13 13:51:39  todd
  // core/c0cont.v			- Global Reset Modification
  // core/c0dpath.v			- Global Reset Modification
  // core/copif.v			- Changed destination port name to RESET_D1_R_N
  // 				  for modules coplogic and pcont_copif.
  // core/coplogic.v			- Changed reset input name to RESET_D1_R_N and
  // 				  internal reset name to RESET_D2_R_N.
  // core/core.v			- Changed destination port name to RESET_D1_R_N
  // 				  for module core_lmi.
  // core/core_lmi.v			- Changed reset input name to RESET_D1_R_N and
  // 				  internal reset name to RESET_D2_R_N.
  // core/daddr.v			- Changed reset input name to RESET_D1_R_N and
  // 				  internal reset name to RESET_D2_R_N.
  // core/dalu.v			- Changed reset input name to RESET_D1_R_N and
  // 				  internal reset name to RESET_D2_R_N.
  // core/dcont.v			- Changed reset input name to RESET_D1_R_N and
  // 				  internal reset name to RESET_D2_R_N.
  // core/dmux.v			- Changed reset input name to RESET_D1_R_N and
  // 				  internal reset name to RESET_D2_R_N.
  // core/jpt.v			- Global Reset Modification
  // core/pcont_cop0.v		- Global Reset Modification
  // core/pcont_copif.v		- Changed reset input name to RESET_D1_R_N and
  // 				  internal reset name to RESET_D2_R_N.
  // core/pcont_ralu.v		- Changed reset input name to RESET_D1_R_N and
  // 				  internal reset name to RESET_D2_R_N.
  // core/ralu.v			- Changed destination port name to RESET_D1_R_N
  // 				  for modules regfile and rf_if.
  // core/regfile.v			- Changed reset input name to RESET_D1_R_N and
  // 				  internal reset name to RESET_D2_R_N.
  // core/rf_if.v			- Changed reset input name to RESET_D1_R_N and
  // 				  internal reset name to RESET_D2_R_N.
  // core/altera_10ke/regfile.v	- Changed reset input name to RESET_D1_R_N and
  // 				  internal reset name to RESET_D2_R_N.
  // core/altera_10ke/rf_if.v	- Changed reset input name to RESET_D1_R_N and
  // 				  internal reset name to RESET_D2_R_N.
  //
  // Revision 1.28  1999/07/20 15:17:09  bob
  // Closing 4180 enhancement request 16, read-enable control support for RAMs.
  // Closing 4180 issue 36, async reset with global distribution is subject
  // to timing hazards.
  //
  // Revision 1.27  1999/07/16 21:11:25  sol
  // Output DBM code on PCST from JCTRLDM I-stage (if not JPT_HALT) until not JCTRLDM M-stage.
  //
  // Revision 1.26  1999/06/15 19:59:34  jonah
  // Changed `ifdef RAW_PCTRACE to VPP_RAW_PCTRACE as is required by lconfig.
  //
  // Revision 1.25  1999/06/09 20:30:31  lind
  // core/pcont_ralu.v
  //
  //   Closes M16 issues lx4180-0070 and lx4180-0071
  //
  // core/jpt.v
  //
  //   Fixed race condition preventing proper value of MONTrace
  //   from being copied to jpt.
  //
  //   Added `RAW_PCTRACE to trace when DCR[0] real-time mode changes
  //
  // Revision 1.24  1999/04/19 13:51:37  sol
  // Fixed the word veri-lint in a commit history comment.
  //
  // Revision 1.23  1999/04/01 22:52:50  bob
  // Veri-lint cleanup.
  //
  // Revision 1.22  1999/03/31 19:28:06  bob
  // core/copif123_bus.v:
  //   - Added dummy wires for unused copif CMEMOPM pins.
  // core/jpt.v:
  //   - Created a local MONTrace variable that is intialized to 0,
  //     and set as needed by the testbed module.  This replaces
  //     the outward reach to testbed.MONTrace that was the subject
  //     of errata 4180.38.
  //
  // Revision 1.21.2.1  1999/03/24 18:35:02  bob
  // core/c0cont.v, c0dpath.v, coplogic.v, core_lmi.v, dalu.v, dcont.v,
  //   dmux.v, jpt.v, pcont_cop0.v, pcont_copif.v, pcont_ralu.v,
  //   regfile.v, rf_if.v,
  //   - Use blocking assign for global reset distribution.
  //
  // Revision 1.21  1999/03/17 20:48:03  sol
  // Eliminate continuous assignments to un-width-specified 0.
  //
  // Revision 1.20  1999/02/11 07:01:27  bob
  //  - Global reset distribution.
  //  - Update copyright notice.
  //
  // Revision 1.19  1999/01/26 22:07:58  sol
  // Made more robust by covering a few bizarre cases, like N=4, M=1.
  // Implemented all possible display cases.
  //
  // Revision 1.18  1999/01/25 14:38:16  sol
  // Merge changes from branch sol_jptx.
  //
  // Revision 1.17.4.1  1999/01/22 22:12:12  sol
  // Added support for multiple TPC bits (parameter M) per DCLK.
  // Added support for multiple PCST codes (parameter N) per DCLK.
  // Updated +trace display for a few combinations of M and N.
  // Use DREN input to determine when to clock TPC and PCST (_DR) registers.
  // Support loading TPC from either PC or XV without immediate to TPC.
  //
  // Revision 1.17  1998/11/19 21:43:32  sol
  // Condition loading of PC and XV Shift Regs with PCTraceON.
  //
  // Revision 1.16  1998/11/17 21:48:35  bob
  //  New HALT line distribution scheme.
  //
  // Revision 1.15  1998/11/16 22:23:17  sol
  // Fixed Montrace display of PC index value.
  //
  // Revision 1.14  1998/11/16 21:50:04  sol
  // Minor signal rename.
  //
  // Revision 1.13  1998/11/16 18:33:03  sol
  // For MonTrace, suppress display of PC index when not PC in progress.
  //
  // Revision 1.12  1998/11/16 15:03:04  sol
  // Temporarily backed out name change of port until upper level name change is done.
  //
  // Revision 1.11  1998/11/16 15:01:05  sol
  // Renamed the HALT signal to indicate M cycle effectivity.
  //
  // Revision 1.10  1998/11/16 14:44:49  sol
  // Added XV string codes for MonTrace display.
  // Added assertion checker for bad exception vector codes.
  //
  // Revision 1.9  1998/11/14 17:36:19  sol
  // Minor tweak to display statement.
  // Rearrange logic to improve synthesis of path from RHOLD.
  //
  // Revision 1.8  1998/11/14 14:17:14  sol
  // Improved montrace logic for display.
  //
  // Revision 1.7  1998/11/13 21:12:41  sol
  // Added MonTrace support for PCTrace bit.
  //
  // Revision 1.6  1998/11/12 22:52:58  sol
  // Added signals for easier waveform viewing.
  //
  // Revision 1.5  1998/11/12 19:17:19  sol
  // Rearranged logic to improve critical path from HOLD to PCShftReg.
  //
  // Revision 1.4  1998/11/12 15:42:13  sol
  // Changed prefix on name of PCTRON signal.
  //
  // Revision 1.3  1998/11/09 20:22:31  sol
  // Added monitor log display statements when PCShReg or XVShReg is loaded.
  //
  // Revision 1.2  1998/11/06 21:15:31  sol
  // Renamed jpt-hold signal based on its source module.
  //
  // Revision 1.1  1998/11/06 20:16:03  sol
  // Initial release of EJTAG PC TRACE module.
  //
  //
  // ******************************************************************
  // ******************************************************************

  // Questions/Notes Re: Implementation of EJTAG 2.0 Spec PC Trace
  //
  // 1)  When an exception is taken in a branch delay slot, this
  //     implementation first puts out the JMP code and then the EXP
  //     code. Is this correct?
  //
  // 2)  When a Debug Trigger is signaled for an instruction that
  //     should put out a JMP code, this implementation first puts
  //     out the JMP code and then the TST/TSQ code.
  //
  //     This agrees with the 2.0 spec in section 6.7.3.
  //
  //     When a Debug Trigger is signaled for an instruction that
  //     takes an exception, this implementation first puts out
  //     the EXP code and then the TST code.
  //
  //     This does not agree with the 2.0 spec in section 6.7.2.
  //     However, it is similar to the JMP/Trig case and seems
  //     to make more sense, since it correctly identifies the
  //     instruction taking the exception. Is this acceptable?
  //
  // 3)  When a Debug Exception occurs for an instruction that
  //     should put out a JMP code, this implementation suppresses
  //     the JMP code. It puts out a STL/TST. Debug Mode is entered
  //     shortly thereafter, so this should not matter. Is this
  //     correct/acceptable?
  //
  // 4)  If the branch delay slot of a JMP/BRT type instruction
  //     contains an Indirect Jump type instruction, this implementation
  //     puts out a SEQ/TSQ for the second instruction, since the latter
  //     jump is not really "taken". Is this correct?
  //
  // 5)  It is possible for a long string of alternating Jump and
  //     non-jump (delay slot) instructions to all have Debug Trigger
  //     hits. That is, the instruction stream can be:
  //
  //       JR(w/Trig), Add(w/Trig), JR(w/Trig), Sub(w/Trig), JR(w/Trig),
  //       and so on.
  //
  //     In real-time trace mode, the output PCST sequence would be:
  //        JMP, TSQ, JMP, TSQ, JMP, ...
  //
  //     But this would "pile up" N "pending" Trigger indications
  //     while outputting N TSQ's in 2N cycles. In other words
  //     there is no limit to the number of "lost" Trigger indications.
  //
  //     This implementation only saves one pending Trigger indication.
  //
  //     Is this sufficient?
  //
  // 6)  Section 6.9 discusses required stalls when a PC Trace output
  //     is in progress at the time a Debug Exception is taken. The
  //     title of these sections says "Real Time Trace mode".
  //
  //     This implementation does the same behavior in this regard
  //     whether in Real-time or not-real-time trace mode (i.e. regardless
  //     of the value of EJTAG Debug Control Register bit-0 (TM bit).
  //
  //     Is this correct? If not, what is the correct behavior in
  //     non-real time trace mode?
  //
  //     It seems unusual that Real Time mode would cause this stall,
  //     since only non-real-time trace mode causes a stall when an
  //     output PC might be truncated.
  //
  //     Aside: I sure wish these had been named:
  //
  //              non-stalling trace mode TM=0
  //                  stalling trace mode TM=1
  //
  //     I find myself continually getting it backwards due to the
  //     double negative. I am sure others will too, leading to errors.
  //
  // 7)  Section 6.3.1 page 82 has the jabberwockian statement: "...PC
  //     Trace interpreting software may not be able to determine the
  //     exact target of a jump/branch/ERET instruction unless the
  //     source is known; this is true even if a complete PC is output
  //     for the target."
  //
  //     In this context what does "source" mean? Source code? Address
  //     of jump/branch/ERET source? What has either of these to do
  //     with the target address?
  //
  //     The explanation that follows involves the possibility of a
  //     nullified branch delay slot. Is the issue then one of determining
  //     precisely which subsequent instruction has a trigger? If not,
  //     what is the issue?
  //

  `include "../include/lxr_symbols.vh"
  `include "../include/core_symbols.vh"

  // the following help auto-sense work:













  // PCST codes defined in EJTAG spec:
`define PCST_STL 3'b111
`define PCST_JMP 3'b110
`define PCST_BRT 3'b101
`define PCST_EXP 3'b100
`define PCST_SEQ 3'b011
`define PCST_TST 3'b010
`define PCST_TSQ 3'b001
`define PCST_DBM 3'b000

  // INPUTS and OUTPUTS ***************************************

  input           CLK;                  // syn ignore;  clock
  input           TMODE;                // syn set_false_path; // test mode
  input           RESET_D1_R_N;         // syn 3.0;     reset

  input [1:0]     CFG_EJTMLOG2;         // syn set_false_path; config ejtag M (0-3=1,2,4,8)
  input           CFG_EJTBIT0M16;       // syn set_false_path; output PC bit0 for TPC if M16 capable
  input           EJT_DREN_R;           // syn 3.0;     enable DCLK registers

  input           CFG_INSTM16EN;        // syn 3.0; M16 capable core

  input           CP0_JCTRLDM_I_R;      // syn 3.0; Debug Mode  cp0_dbg_reg[30]
  input           CP0_JCTRLDM_M_R;      // syn 3.0; Debug Mode  cp0_dbg_reg[30]
  input           EJC_ECRPCAS_R;        // syn 3.0; ASID output mode ejt_ctrl_reg[26]
  input           EJC_DCRTM_R;          // syn 3.0; Trace Mode (1=not-real-time) dsu_dcr[0]
  input           EJC_PCTRON_R;         // syn 3.0; PC Trace ON (PC-Trace in JInst Reg)
  input           CP0_JPINDJ_E_R;       // syn 3.0; Pipeflow is unsquashed indirect jump
  input [1:0]     CP0_JPTYPE_M_R;       // syn 3.0; Pipeflow type -- code:
                                        //  00 -- none of the following
                                        //  01 -- direct jump or taken branch
                                        //  10 -- indirect jump (JR,JALR,ERET)
                                        //  11 -- inserted NOP,                or
                                        //        nullified branch delay slot, or
                                        //        2nd half of M16 32-bit op,   or
                                        //        op squashed by prior xcpn.

  input           CP0_JXCPN_M_R;        // syn 3.0; Debug Exception (OR of enabled breaks)
  input           CP0_JTRIG_M_R;        // syn 3.0; Debug Trigger   (OR of enabled triggers)
  input           CP0_XCPN_M;           // syn 4.0; Any exception, includes JXCPN
  input [2:0]     CP0_XCPNVEC_M;        // syn 5.0; exception vector A29,A8,A7

  input [31:1]    CP0_IVATGT_I_R;       // syn 3.0; Instr Virtual Addr of target of JR_M
  input [31:1]    CP0_IVATGT_S_R;       // syn 3.0; Instr Virtual Addr of target of J/B_M
  input [7:0]     MMU_IASTGT_I_R;       // syn 3.0; Instruction ASID   of target of JR_M
  input [7:0]     MMU_IASTGT_S_R;       // syn 3.0; Instruction ASID   of target of J/B_M
  input           CP0_INSTM32_I_R_N;    // syn 3.0; ISA mode           of target of JR_M
  input           CP0_INSTM32_S_R_N;    // syn 3.0; ISA mode           of target of J/B_M

  input           CLMI_JPTHOLD;         // syn 5.0; pipeline stall, excluding my HALT

  output          JPT_DBM2PCSTSET_P;    // syn 5.0; set DBM output to PCST on next DCLK
  output [11:0]   JPT_PCST_DR;          // syn 7.0; EJTAG PCST output (worst case N=4)
  output [8:1]    JPT_TPC_DR;           // syn 7.0; EJTAG PC trace output (worst case M=8)

  // range of copies of CE_HALT
  output [`HALT_DRV_RANGE] JPT_HALT_M_R_C; // syn 8.0;    stall pipe to finish output

  // synopsys translate_off
  // verilint 528 OFF // Variable set but not used masking unused input
  wire                  NC_FOO = TMODE;
  // verilint 528 ON  // Variable set but not used masking unused input
  // synopsys translate_on

  // REGISTERS

  // Regs for Outputs


  // Beginning of automatic regs (for this module's undeclared outputs)
  reg [11:0]            JPT_PCST_DR;
  reg [8:1]             JPT_TPC_DR;
  // End of automatics

  // Internal Registers ************************************

  wire            RESET_D2_R_N;         // reset

  wire [1:0]      CFG_EJTMLOG2_C1;      // CONSTANT config ejtag M (0-3=1,2,4,8)
  reg [2:0]       JPT_PCST_R;           // EJTAG PCST code for one cycle
  reg [2:0]       JPT_PCST_D1_R;        // EJTAG PCST code for one cycle
  reg [2:0]       JPT_PCST_D2_R;        // EJTAG PCST code for one cycle
  reg             JPT_HALT_M_R;         // stall pipe to finish output
  reg             DBM2PCST_R;           // Force DBM code on PCST.
  reg             JXCPN_M_D1_R;         // ejtag exception
  reg [1:0]       XVCount_R;            // Down-Counter for output of Excpn Vector
  reg [5:0]       PCCount_R;            // Down-Counter for output of target PC
  reg [2:0]       XVShReg_R;            // Shift Register for output of Excpn Vector
  reg [39:0]      PCShReg_R;            // Shift Register for output of target PC (incl ASID)
  reg             JXCPN_W_R;            // Debug Exception (OR of enabled breaks)
  reg             TrigPend_R;           // PCST Trig indication pending (deferred)

  reg             XCPN_W_R;             // Any Exception, staged past M-cycle to W
  reg             XCPN_W1_R;            // Any Exception, staged past M-cycle to W+1

  reg             XVUseRnotP_R;         // When shifting, output from ShiftReg_R, not _P
  reg             PCUseRnotP_R;         // When shifting, output from ShiftReg_R, not _P

  // Intermediate variables ************************************

  reg  [2:0]      JPT_PCST_P;           // EJTAG PCST output
  reg  [8:1]      JPT_TPC_P;            // EJTAG PC trace

  wire            JPT_HALT_M_P;         // stall pipe to finish output
  reg  [1:0]      XVCount_P;            // Down-Counter for output of Excpn Vector
  wire [5:0]      PCCount_P;            // Down-Counter for output of target PC
  reg  [2:0]      XVShReg_P;            // Shift Register for output of Excpn Vector
  wire [39:0]     PCShReg_P;            // Shift Register for output of target PC (incl ASID)
  wire            JXCPN_W_P;            // Debug Exception (OR of enabled breaks)
  reg             TrigPend_P;           // PCST Trig indication pending (deferred)
  wire            XVUseRnotP_P;         // When shifting, output from ShiftReg_R, not _P
  wire            PCUseRnotP_P;         // When shifting, output from ShiftReg_R, not _P

  wire            XCPN_W_P;             // Any Exception, staged past M-cycle to W
  wire            XCPN_W1_P;            // Any Exception, staged past M-cycle to W+1

  wire            myRHOLD;              // pipe stall including my HALT
  wire            XVInProg;             // ExcVec   output in progress
  wire            PCInProg;             // Trace PC output in progress
  wire            XVShRegLoad;          // Load XV Shift Register
  wire            PCShRegLoad;          // Load PC Shift Register
  wire            XVShRegShft;          // Shift XV Shift Register (if no load)
  reg             PCShRegShft;          // Shift PC Shift Register (if no load)

  //re            XVShRegLoadIfXH00;    // Load XV Shift Register if XCPN,Rhold=00
  wire            PCShRegLoadIfXH00;    // Load PC Shift Register if XCPN,Rhold=00
  //re            XVShRegShftIfXH00;    // Shift XV Shift Register (if no load) if XCPN,Rhold=00
  wire            PCShRegShftIfXH00;    // Shift PC Shift Register (if no load) if XCPN,Rhold=00

  wire            XVShRegLoadIfXH10;    // Load XV Shift Register if XCPN,Rhold=10
  //re            PCShRegLoadIfXH10;    // Load PC Shift Register if XCPN,Rhold=10
  //re            XVShRegShftIfXH10;    // Shift XV Shift Register (if no load) if XCPN,Rhold=10
  wire            PCShRegShftIfXH10;    // Shift PC Shift Register (if no load) if XCPN,Rhold=10

  //re            XVShRegLoadIfHold;    // Load XV Shift Register if XCPN,Rhold=x1
  //re            PCShRegLoadIfHold;    // Load PC Shift Register if XCPN,Rhold=x1
  //re            XVShRegShftIfHold;    // Shift XV Shift Register (if no load) if XCPN,Rhold=x1
  wire            PCShRegShftIfHold;    // Shift PC Shift Register (if no load) if XCPN,Rhold=x1

  reg             PCShRegLoadIfMGo;     // Load PC Shift Register if Mcyc Go

  reg             JPTypeIsIndJ_M;       // pipeline type is Indirect Jump
  reg [5:0]       PCCountMinusM;        // Down-Counter minus M
  reg  [1:0]      XVCountIfLoad_P;      // selected start count
  reg  [1:0]      XVCountIfShft_P;      // decremented count
  reg  [5:0]      PCCountIfLoad_P;      // selected start count
  reg  [5:0]      PCCountIfShft_P;      // decremented count
  wire [2:0]      XVShRegIfLoad_P;      // New exception vector bits
  reg  [2:0]      XVShRegIfShft_P;      // Shifted XV Shift Register
  reg  [39:0]     PCShRegIfLoad_P;      // Selected IVA and IASID
  reg  [39:0]     PCShRegIfShft_P;      // Shifted PC Shift Register

  reg  [39:0]     PCShRegIfXH00_P;      // Selected IVA and IASID if XCPN,Rhold=00
  reg  [5:0]      PCCountIfXH00_P;      // selected start count   if XCPN,Rhold=00
  reg  [39:0]     PCShRegIfXH10_P;      // Selected IVA and IASID if XCPN,Rhold=10
  reg  [5:0]      PCCountIfXH10_P;      // selected start count   if XCPN,Rhold=10
  reg  [39:0]     PCShRegIfHold_P;      // Selected IVA and IASID if XCPN,Rhold=x1
  reg  [5:0]      PCCountIfHold_P;      // selected start count   if XCPN,Rhold=x1
  reg  [39:0]     PCShRegIfNotH_P;      // Selected IVA and IASID if XCPN,Rhold=x0
  reg  [5:0]      PCCountIfNotH_P;      // selected start count   if XCPN,Rhold=x0

  wire            PCbusyIfXH00_M_P;     // PC busy if XCPN,Rhold=00
  wire            PCbusyIfXH10_M_P;     // PC busy if XCPN,Rhold=10
  wire            PCbusyIfHold_M_P;     // PC busy if XCPN,Rhold=x1
  wire            HaltPCEnIfXH00_M_P;   // Enable PC busy Halt if XCPN,Rhold=00
  wire            HaltPCEnIfXH10_M_P;   // Enable PC busy Halt if XCPN,Rhold=10
  wire            HaltPCEnIfHold_M_P;   // Enable PC busy Halt if XCPN,Rhold=x1
  reg             HaltPC_M_P;           // Halt predicted due to PC busy

  wire            XVbusyIfXH00_M_P;     // XV busy if XCPN,Rhold=00
  wire            XVbusyIfXH10_M_P;     // XV busy if XCPN,Rhold=10
  wire            XVbusyIfHold_M_P;     // XV busy if XCPN,Rhold=x1
  wire            HaltXVEnIfXH00_M_P;   // Enable XV busy Halt if XCPN,Rhold=00
  wire            HaltXVEnIfXH10_M_P;   // Enable XV busy Halt if XCPN,Rhold=10
  wire            HaltXVEnIfHold_M_P;   // Enable XV busy Halt if XCPN,Rhold=x1
  reg             HaltXV_M_P;           // Halt predicted due to XV busy

  wire            DBM2PCST_P;           // Force DBM code on PCST.
  wire            DBM2PCSTSET_P;        // Force DBM code on PCST, set
  wire            DBM2PCSTCLR_P;        // Force DBM code on PCST, clear

  reg [2:0]       PCSTIfXH00_P;         // PCST output if XCPN,Rhold=00
  reg [2:0]       PCSTIfXH10_P;         // PCST output if XCPN,Rhold=10
  reg [2:0]       PCSTIfHold_P;         // PCST output if XCPN,Rhold=x1
  reg             TrigPendIfXH00_P;     // PCST TrigPend if XCPN,Rhold=00
  reg             TrigPendIfXH10_P;     // PCST TrigPend if XCPN,Rhold=10
  reg             TrigPendIfHold_P;     // PCST TrigPend if XCPN,Rhold=x1

  wire            XcpnPossible_M_P;     // Xcpn is possible in M-cycle
  wire            MCycGo;               // M-cycle operation go

  // Combinatorial Logic begin *********************************

  // copies of register for output:
  assign JPT_HALT_M_R_C = {`HALT_DRV_COUNT{JPT_HALT_M_R}};

  // total pipe hold includes our halt
  assign myRHOLD = CLMI_JPTHOLD | JPT_HALT_M_R;

  // Go if not Hold and not xcpn
  assign MCycGo = ~myRHOLD & ~CP0_XCPN_M;

  assign XVInProg = | XVCount_R;        // count non-zero
  assign PCInProg = | PCCount_R;        // count non-zero

  // hold or pipe W-stage Debug XCPN,
  // for use in stalling pipe before changing to Debug Mode
  assign JXCPN_W_P = myRHOLD ? JXCPN_W_R : CP0_JXCPN_M_R;

  // hold or pipe M-stage XCPN,
  // for use in stalling pipe in case XVinProg
  assign XCPN_W_P  = myRHOLD ? XCPN_W_R  : CP0_XCPN_M;
  assign XCPN_W1_P = myRHOLD ? XCPN_W1_R :     XCPN_W_R;

  always @(CP0_JPTYPE_M_R) begin

    casex (CP0_JPTYPE_M_R)
      `PTYP_PSEQ: JPTypeIsIndJ_M = 0;
      `PTYP_DIRJ: JPTypeIsIndJ_M = 0;
      `PTYP_INDJ: JPTypeIsIndJ_M = 1;
      `PTYP_PNUL: JPTypeIsIndJ_M = 0;
    endcase
  end

  // Load new exception vector for non-debug excpn
  //      if not RHOLD and not Debug Mode and
  //      if real-time or not busy and
  //      if PC Trace is ON
  //

  //sign XVShRegLoadIfXH00 = 0;
  //sign XVShRegLoadIfHold = 0;
  assign XVShRegLoadIfXH10 = EJC_PCTRON_R     & // PC Trace ON
                             ~CP0_JXCPN_M_R   & // non-debug xcpn
                             ~CP0_JCTRLDM_M_R & // not DebugMode
                     (~EJC_DCRTM_R | ~XVInProg); // XVInProg only possible if M=1,N=4?

  assign XVShRegLoad = XVShRegLoadIfXH10 & CP0_XCPN_M & ~myRHOLD;

  // output XV on DCLK cycles. never blocked by PC.
  assign XVShRegShft = EJT_DREN_R & XVInProg;

  // Load new target PC depending on pipeflow type.
  // On direct jump/branch, load if not busy.
  // On indirect jump, load if real-time or not busy.
  // Never load while in Debug Mode.
  // Only load if PC Trace ON
  always @(CP0_JCTRLDM_M_R or CP0_JPTYPE_M_R
           or EJC_DCRTM_R or EJC_PCTRON_R or PCInProg) begin

    casex (CP0_JPTYPE_M_R)
      `PTYP_PSEQ: PCShRegLoadIfMGo = 0;
      `PTYP_DIRJ: PCShRegLoadIfMGo = EJC_PCTRON_R & ~CP0_JCTRLDM_M_R &  ~PCInProg;
      `PTYP_INDJ: PCShRegLoadIfMGo = EJC_PCTRON_R & ~CP0_JCTRLDM_M_R & (~PCInProg | ~EJC_DCRTM_R);
      `PTYP_PNUL: PCShRegLoadIfMGo = 0;
    endcase
  end

  assign PCShRegLoadIfXH00 = PCShRegLoadIfMGo;
  //sign PCShRegLoadIfXH10 = 0;
  //sign PCShRegLoadIfHold = 0;

  // Potentially shift InProg PC Reg on DCLK cycles (DREN)

  assign PCShRegShftIfXH10 =
                   EJT_DREN_R  &
                   PCInProg    &
                  ~XVInProg    &        // InProg XV blocks PC
                  ~XVShRegLoadIfXH10 ;  //    new XV blocks PC

  // if no excpn, cannot have XVLoad
  assign PCShRegShftIfXH00 =
                   EJT_DREN_R  &
                   PCInProg    &
                  ~XVInProg    ;        // InProg XV blocks PC

  // if hold, cannot have XVLoad
  assign PCShRegShftIfHold =
                   EJT_DREN_R  &
                   PCInProg    &
                  ~XVInProg    ;        // InProg XV blocks PC

  // select potential new PC output, depending on jump type.
  // skip Iaddr bit 1 if not M16 capable.
  //
  // Case1: direct jump/branch taken
  // -------------------------------
  // b-tkn       I  S  E  M  W
  // delayslot      I  S  E  M  W
  // target            I  S  E  M  W
  //
  // when b-tkn is in M, target address is in S, because PC
  // relative target is calculated in b-tkn S.
  //
  // Case2 indirect jump
  // -------------------------------
  // jr          I  S  E  M  W
  // delayslot      I  S  E  M  W
  // inserted nop      I  S  E  M  W
  // target               I  S  E  M  W
  //
  // when b-tkn is in M, target address is in I, because
  // target is calculated in jr E.
  //
  // Case3 M16 jal (direct jump)
  // -------------------------------
  // jal         I  S  E  M  W
  // jal2           I  S  E  M  W
  // delayslot         I  S  E  M  W
  // target               I  S  E  M  W
  //
  // when jal2 is in M, target address is in S, because
  // target is calculated in jr E.
  //
  always @(CFG_EJTBIT0M16 or CFG_INSTM16EN
           or CP0_INSTM32_I_R_N or CP0_INSTM32_S_R_N or CP0_IVATGT_I_R
           or CP0_IVATGT_S_R or JPTypeIsIndJ_M or MMU_IASTGT_I_R
           or MMU_IASTGT_S_R) begin

    casex ({JPTypeIsIndJ_M, CFG_INSTM16EN, CFG_EJTBIT0M16})
      3'b00x: PCShRegIfLoad_P = {2'b00,MMU_IASTGT_S_R, CP0_IVATGT_S_R[31:2]};
      3'b010: PCShRegIfLoad_P = {1'b0 ,MMU_IASTGT_S_R, CP0_IVATGT_S_R[31:1]};
      3'b011: PCShRegIfLoad_P = {      MMU_IASTGT_S_R, CP0_IVATGT_S_R[31:1],CP0_INSTM32_S_R_N};
      3'b10x: PCShRegIfLoad_P = {2'b00,MMU_IASTGT_I_R, CP0_IVATGT_I_R[31:2]};
      3'b110: PCShRegIfLoad_P = {1'b0 ,MMU_IASTGT_I_R, CP0_IVATGT_I_R[31:1]};
      3'b111: PCShRegIfLoad_P = {      MMU_IASTGT_I_R, CP0_IVATGT_I_R[31:1],CP0_INSTM32_I_R_N};
    endcase
  end

  // If shifting, shift M bits towards lsb, filling with zeroes:
  always @(CFG_EJTMLOG2_C1 or PCShReg_R) begin

    casex (CFG_EJTMLOG2_C1)
      2'b00: PCShRegIfShft_P = {1'b0 ,PCShReg_R[39:1]}; // M=1
      2'b01: PCShRegIfShft_P = {2'b00,PCShReg_R[39:2]}; // M=2
      2'b10: PCShRegIfShft_P = {4'h0 ,PCShReg_R[39:4]}; // M=4
      2'b11: PCShRegIfShft_P = {8'h00,PCShReg_R[39:8]}; // M=8
    endcase
  end


  // load/update/hold PC output, case XCPN,RHOLD = 00
  always @(PCShRegIfLoad_P or PCShRegIfShft_P
           or PCShRegLoadIfXH00 or PCShRegShftIfXH00 or PCShReg_R) begin

    casex ({PCShRegLoadIfXH00, PCShRegShftIfXH00})
      2'b1x: PCShRegIfXH00_P = PCShRegIfLoad_P;        // load overrides shift
      2'b01: PCShRegIfXH00_P = PCShRegIfShft_P;
      2'b00: PCShRegIfXH00_P = PCShReg_R;
    endcase
  end

  // load/update/hold PC output, case XCPN,RHOLD = 10
  always @(PCShRegIfShft_P or PCShRegShftIfXH10
           or PCShReg_R) begin

    // never load PC if xcpn
    casex (PCShRegShftIfXH10)
      1'b1: PCShRegIfXH10_P = PCShRegIfShft_P;
      1'b0: PCShRegIfXH10_P = PCShReg_R;
    endcase
  end

  // load/update/hold PC output, case XCPN,RHOLD = x0
  always @(CP0_XCPN_M or PCShRegIfXH00_P
           or PCShRegIfXH10_P) begin

    casex (CP0_XCPN_M)
      1'b0: PCShRegIfNotH_P = PCShRegIfXH00_P;
      1'b1: PCShRegIfNotH_P = PCShRegIfXH10_P;
    endcase
  end

  // load/update/hold PC output, case XCPN,RHOLD = x1
  always @(PCShRegIfShft_P or PCShRegShftIfHold
           or PCShReg_R) begin

    // never load PC if hold
    casex (PCShRegShftIfHold)
      1'b1: PCShRegIfHold_P = PCShRegIfShft_P;
      1'b0: PCShRegIfHold_P = PCShReg_R;
    endcase
  end

  // load/update/hold PC output
  assign PCShReg_P = myRHOLD ? PCShRegIfHold_P : PCShRegIfNotH_P;

  // Start-count for output of target PC as a function of modes:
  // If Load on DCLK cycle (DREN) and Not XVInProg, output M PC bits.
  // Otherwise, output nothing.
  // So start-count is total bits or total bits - M.
  //

  always @(CFG_EJTBIT0M16 or CFG_EJTMLOG2_C1
           or CFG_INSTM16EN or EJC_ECRPCAS_R or EJT_DREN_R or XVInProg) begin

    casex ({(EJT_DREN_R & ~XVInProg), CFG_EJTMLOG2_C1,CFG_INSTM16EN, CFG_EJTBIT0M16, EJC_ECRPCAS_R})
      6'b0_xx_0x0: PCCountIfLoad_P = 6'd30; // 31:2
      6'b0_xx_0x1: PCCountIfLoad_P = 6'd38; // 39:2
      6'b0_xx_100: PCCountIfLoad_P = 6'd31; // 31:1
      6'b0_xx_110: PCCountIfLoad_P = 6'd32; // 31:0
      6'b0_xx_101: PCCountIfLoad_P = 6'd39; // 39:1
      6'b0_xx_111: PCCountIfLoad_P = 6'd40; // 39:0

      6'b1_00_0x0: PCCountIfLoad_P = 6'd29; // 31:2 -M(1)
      6'b1_00_0x1: PCCountIfLoad_P = 6'd37; // 39:2 -M(1)
      6'b1_00_100: PCCountIfLoad_P = 6'd30; // 31:1 -M(1)
      6'b1_00_110: PCCountIfLoad_P = 6'd31; // 31:0 -M(1)
      6'b1_00_101: PCCountIfLoad_P = 6'd38; // 39:1 -M(1)
      6'b1_00_111: PCCountIfLoad_P = 6'd39; // 39:0 -M(1)

      6'b1_01_0x0: PCCountIfLoad_P = 6'd28; // 31:2 -M(2)
      6'b1_01_0x1: PCCountIfLoad_P = 6'd36; // 39:2 -M(2)
      6'b1_01_100: PCCountIfLoad_P = 6'd29; // 31:1 -M(2)
      6'b1_01_110: PCCountIfLoad_P = 6'd30; // 31:0 -M(2)
      6'b1_01_101: PCCountIfLoad_P = 6'd37; // 39:1 -M(2)
      6'b1_01_111: PCCountIfLoad_P = 6'd38; // 39:0 -M(2)

      6'b1_10_0x0: PCCountIfLoad_P = 6'd26; // 31:2 -M(4)
      6'b1_10_0x1: PCCountIfLoad_P = 6'd34; // 39:2 -M(4)
      6'b1_10_100: PCCountIfLoad_P = 6'd27; // 31:1 -M(4)
      6'b1_10_110: PCCountIfLoad_P = 6'd28; // 31:0 -M(4)
      6'b1_10_101: PCCountIfLoad_P = 6'd35; // 39:1 -M(4)
      6'b1_10_111: PCCountIfLoad_P = 6'd36; // 39:0 -M(4)

      6'b1_11_0x0: PCCountIfLoad_P = 6'd22; // 31:2 -M(8)
      6'b1_11_0x1: PCCountIfLoad_P = 6'd30; // 39:2 -M(8)
      6'b1_11_100: PCCountIfLoad_P = 6'd23; // 31:1 -M(8)
      6'b1_11_110: PCCountIfLoad_P = 6'd24; // 31:0 -M(8)
      6'b1_11_101: PCCountIfLoad_P = 6'd31; // 39:1 -M(8)
      6'b1_11_111: PCCountIfLoad_P = 6'd32; // 39:0 -M(8)
    endcase
  end

  //verilint 484 OFF     // Possible loss of carry/borrow in addition/subtraction
  // decrement count by M
  always @(CFG_EJTMLOG2_C1 or PCCount_R) begin

    casex (CFG_EJTMLOG2_C1)
      2'b00: PCCountMinusM = PCCount_R - 1; // M=1
      2'b01: PCCountMinusM = PCCount_R - 2; // M=2
      2'b10: PCCountMinusM = PCCount_R - 4; // M=4
      2'b11: PCCountMinusM = PCCount_R - 8; // M=8
    endcase
  end
  //verilint 484 ON      // Possible loss of carry/borrow in addition/subtraction

  // decrement count by M, or force 0. Shift control is off after reaching 0
  always @(CFG_EJTMLOG2_C1 or PCCountMinusM or PCCount_R) begin

    casex ({(|PCCount_R[5:3]), PCCount_R[2:0], CFG_EJTMLOG2_C1})
      6'b1xxx_xx: PCCountIfShft_P = PCCountMinusM; // count 8+         --> dec by M
      6'b01xx_0x: PCCountIfShft_P = PCCountMinusM; // count 4-7, M=1,2 --> dec by M
      6'b01xx_10: PCCountIfShft_P = PCCountMinusM; // count 4-7, M=4   --> dec by M
      6'b01xx_11: PCCountIfShft_P = 6'b000000;     // count 4-7, M=8   --> 0
      6'b001x_0x: PCCountIfShft_P = PCCountMinusM; // count 2-3, M=1,2 --> dec by M
      6'b001x_1x: PCCountIfShft_P = 6'b000000;     // count 2-3, M=4,8 --> 0
      6'b000x_xx: PCCountIfShft_P = 6'b000000;     // count 0-1,       --> 0
    endcase
  end

  // load/update/hold PC count, case XCPN,RHOLD = 00
  always @(PCCountIfLoad_P or PCCountIfShft_P
           or PCCount_R or PCShRegLoadIfXH00 or PCShRegShftIfXH00) begin

    casex ({PCShRegLoadIfXH00, PCShRegShftIfXH00})
      2'b1x: PCCountIfXH00_P = PCCountIfLoad_P;        // load overrides shift
      2'b01: PCCountIfXH00_P = PCCountIfShft_P;
      2'b00: PCCountIfXH00_P = PCCount_R;
    endcase
  end

  // load/update/hold PC count, case XCPN,RHOLD = 10
  always @(PCCountIfShft_P or PCCount_R
           or PCShRegShftIfXH10) begin

    // never load PC if xcpn
    casex (PCShRegShftIfXH10)
      1'b1: PCCountIfXH10_P = PCCountIfShft_P;
      1'b0: PCCountIfXH10_P = PCCount_R;
    endcase
  end

  // load/update/hold PC count casee XCPN,RHOLD = x0
  always @(CP0_XCPN_M or PCCountIfXH00_P
           or PCCountIfXH10_P) begin

    casex (CP0_XCPN_M)
      1'b0: PCCountIfNotH_P = PCCountIfXH00_P;
      1'b1: PCCountIfNotH_P = PCCountIfXH10_P;
    endcase
  end

  // load/update/hold PC count, case XCPN,RHOLD = x1
  always @(PCCountIfShft_P or PCCount_R
           or PCShRegShftIfHold) begin

    // never load PC if hold
    casex (PCShRegShftIfHold)
      1'b1: PCCountIfHold_P = PCCountIfShft_P;
      1'b0: PCCountIfHold_P = PCCount_R;
    endcase
  end

  // load/update/hold PC count
  assign PCCount_P = myRHOLD ? PCCountIfHold_P : PCCountIfNotH_P;

  // If loading XV shift reg, use latest xcpn vector
  assign XVShRegIfLoad_P = CP0_XCPNVEC_M;

  // If shifting, shift M bits towards lsb, filling with zeroes:
  always @(CFG_EJTMLOG2_C1 or XVShReg_R) begin

    casex (CFG_EJTMLOG2_C1)
      2'b00: XVShRegIfShft_P = {1'b0 ,XVShReg_R[2:1]}; // M=1
      2'b01: XVShRegIfShft_P = {2'b00,XVShReg_R[2]};   // M=2
      2'b1x: XVShRegIfShft_P =  3'b000;                // M=4, M=8
    endcase
  end

  // load/update/hold XV output
  always @(XVShRegIfLoad_P or XVShRegIfShft_P
           or XVShRegLoad or XVShRegShft or XVShReg_R) begin

    casex ({XVShRegLoad, XVShRegShft})
      2'b1x: XVShReg_P = XVShRegIfLoad_P;        // load overrides shift
      2'b01: XVShReg_P = XVShRegIfShft_P;
      2'b00: XVShReg_P = XVShReg_R;
    endcase
  end

  // start count for output of 3-bit Excpn Vector:
  // Since XV output has priority over PC output,
  // output on load if DCLK cycle (DREN), so init count is 3-M
  // otherwise init count is 3.

  always @(CFG_EJTMLOG2_C1 or EJT_DREN_R) begin

    casex ({EJT_DREN_R, CFG_EJTMLOG2_C1})
      3'b0_xx: XVCountIfLoad_P = 2'b11;      // not DREN
      3'b1_00: XVCountIfLoad_P = 2'b10;      // M=1
      3'b1_01: XVCountIfLoad_P = 2'b01;      // M=2
      3'b1_1x: XVCountIfLoad_P = 2'b00;      // M=4,8
    endcase
  end

  // decrement count by M. shift control is off after reaching 0
  always @(CFG_EJTMLOG2_C1 or XVCount_R) begin

    casex ({XVCount_R, CFG_EJTMLOG2_C1})
      4'b0x_xx: XVCountIfShft_P = 2'b00; // count 0 or 1   --> 0
      4'b10_00: XVCountIfShft_P = 2'b01; // count 2, M=1   --> 1
      4'b10_01: XVCountIfShft_P = 2'b00; // count 2, M=2   --> 0
      4'b10_1x: XVCountIfShft_P = 2'b00; // count 2, M=4,8 --> 0
      4'b11_00: XVCountIfShft_P = 2'b10; // count 3, M=1   --> 2
      4'b11_01: XVCountIfShft_P = 2'b01; // count 3, M=2   --> 1
      4'b11_1x: XVCountIfShft_P = 2'b00; // count 3, M=4,8 --> 0
    endcase
  end

  // load/update/hold XV count
  always @(XVCountIfLoad_P or XVCountIfShft_P
           or XVCount_R or XVShRegLoad or XVShRegShft) begin

    casex ({XVShRegLoad, XVShRegShft})
      2'b1x: XVCount_P = XVCountIfLoad_P;        // load overrides shift
      2'b01: XVCount_P = XVCountIfShft_P;
      2'b00: XVCount_P = XVCount_R;
    endcase
  end

  // Predict PC Busy if XCPN,RHOLD = 00:
  // already in prog, or M-cycle can set in prog
  assign PCbusyIfXH00_M_P = PCInProg | (CP0_JPTYPE_M_R==`PTYP_DIRJ) |
                                       (CP0_JPTYPE_M_R==`PTYP_INDJ) ;

  // If XCPN,RHOLD = 10, M-cycle will be killed, (no MGo)
  // so just consider already in prog for predicted PC Busy
  assign PCbusyIfXH10_M_P = PCInProg;

  // If XCPN,RHOLD = x1, M-cycle will hold, (no MGo)
  // so just consider already in prog for predicted PC Busy
  assign PCbusyIfHold_M_P = PCInProg;

  // Predict enabled PC Busy Halt if Indirect Jump will be in M
  // Only halt for Indirect Jump if not-real-time mode
  // E-stage will be in M-stage next cycle, if XCPN,RHOLD=00
  //    Note: Ind Jump may be nullified, so stall may be erroneous
  //          but this will be corrected in following cycle
  //          by the accurate M stage, which will turn off stall.
  assign HaltPCEnIfXH00_M_P = (EJC_DCRTM_R & CP0_JPINDJ_E_R);

  // Predict enabled PC Busy Halt if Debug XCPN will be in W
  // E-stage and M-stage jumps will be killed, if XCPN,RHOLD=10
  assign HaltPCEnIfXH10_M_P = CP0_JXCPN_M_R;

  // Predict enabled PC Busy Halt if Debug XCPN will be "held" in W or M
  // Predict enabled PC Busy Halt if Indirect Jump will be in M
  // Only halt for Indirect Jump if not-real-time mode
  // M-stage will be in M-stage next cycle, if RHOLD
  assign HaltPCEnIfHold_M_P = CP0_JXCPN_M_R |
                              JXCPN_W_R     |
                              (EJC_DCRTM_R & (CP0_JPTYPE_M_R==`PTYP_INDJ));

  // Predict HALT term due to PC busy as a function of XCPN,RHOLD.
  always @(CP0_XCPN_M or HaltPCEnIfHold_M_P
           or HaltPCEnIfXH00_M_P or HaltPCEnIfXH10_M_P
           or PCbusyIfHold_M_P or PCbusyIfXH00_M_P or PCbusyIfXH10_M_P
           or myRHOLD) begin

    casex ({CP0_XCPN_M, myRHOLD})
      2'b00: HaltPC_M_P = HaltPCEnIfXH00_M_P & PCbusyIfXH00_M_P;
      2'b10: HaltPC_M_P = HaltPCEnIfXH10_M_P & PCbusyIfXH10_M_P;
      2'bx1: HaltPC_M_P = HaltPCEnIfHold_M_P & PCbusyIfHold_M_P;
    endcase
  end

  // Predict XV Busy if XCPN,RHOLD = 00:
  // M-cycle cannot set in prog, so just predict XVCount non-zero.
  assign XVbusyIfXH00_M_P = XVShRegShft ? (|XVCountIfShft_P) : (|XVCount_R);

  // If XCPN,RHOLD = 10,
  // already in prog or M-cycle non-debug xcpn can set in prog.
  assign XVbusyIfXH10_M_P = XVInProg | ~CP0_JXCPN_M_R;

  // If XCPN,RHOLD = x1, M-cycle will hold
  // M-cycle cannot set in prog, so just predict XVCount non-zero.
  assign XVbusyIfHold_M_P = XVShRegShft ? (|XVCountIfShft_P) : (|XVCount_R);

  // Enable XVHalt (to be ANDed with XVBusy) for two reasons:
  // 1) new XV to load and not-real-time mode
  // 2) debug exception

  // Predict Enable XV Busy Halt if XCPN,RHOLD = 00:
  // E-stage will be in M-stage next cycle, if XCPN,RHOLD=00
  // Since XCPN_M cannot be predicted, assume the worst if
  // not-real-time mode and an XCPN is possible.
  assign HaltXVEnIfXH00_M_P = (EJC_DCRTM_R & XcpnPossible_M_P);

  // Predict enabled XV Busy Halt if XCPN,RHOLD = 10:
  // Predict enabled XV Busy Halt if Debug XCPN will be in W
  // Cannot have non-debug xcpn if not-real-time mode
  // because we would have predicted and caused hold.
  assign HaltXVEnIfXH10_M_P = CP0_JXCPN_M_R;

  // Predict enabled XV Busy Halt if Debug XCPN will be "held" in W or M
  // Since XCPN_M cannot be predicted, assume the worst if
  // not-real-time mode and an XCPN is possible.
  assign HaltXVEnIfHold_M_P = CP0_JXCPN_M_R |
                              JXCPN_W_R     |
                              (EJC_DCRTM_R & XcpnPossible_M_P);

  // Predict HALT term due to XV busy as a function of XCPN,RHOLD.
  always @(CP0_XCPN_M or HaltXVEnIfHold_M_P
           or HaltXVEnIfXH00_M_P or HaltXVEnIfXH10_M_P
           or XVbusyIfHold_M_P or XVbusyIfXH00_M_P or XVbusyIfXH10_M_P
           or myRHOLD) begin

    casex ({CP0_XCPN_M, myRHOLD})
      2'b00: HaltXV_M_P = HaltXVEnIfXH00_M_P & XVbusyIfXH00_M_P;
      2'b10: HaltXV_M_P = HaltXVEnIfXH10_M_P & XVbusyIfXH10_M_P;
      2'bx1: HaltXV_M_P = HaltXVEnIfHold_M_P & XVbusyIfHold_M_P;
    endcase
  end

  // PC trace can cause a HALT.
  //
  // XV trace can only cause a HALT if it fails to unload
  //    the XVShReg before another XCPN arrives. This is
  //    probably only possible if M=1, and N=3 or 4.
  //
  // To allow for this rare occurrence, without introducing
  // unnecessary stalls, predict if an Xcpn is possible in
  // the next M cycle, given that the 3 flows after an xcpn
  // are all squashed.
  //
  // xcpn-op  I  S  E *M  W  W1 W2
  // squash      I  S  E  M  W
  // squash         I  S  E  M  W
  // squash            I  S  E  M  W
  // possible xcpn        I  S  E *M  W
  //
  // XcpnPossible_M X  X  -  -  -  X  X
  //

  assign XcpnPossible_M_P = ~CP0_XCPN_M & ~XCPN_W_R & ~XCPN_W1_R;

  // Only use HALT if PC Trace is ON.
  assign JPT_HALT_M_P = (HaltPC_M_P | HaltXV_M_P) & EJC_PCTRON_R;

  // need to know if load or shift is happening,
  // in order to select output
  assign PCShRegLoad = PCShRegLoadIfMGo & MCycGo;

  always @(CP0_XCPN_M or PCShRegShftIfHold
           or PCShRegShftIfXH00 or PCShRegShftIfXH10 or myRHOLD) begin
    casex ({CP0_XCPN_M, myRHOLD})
      2'b00: PCShRegShft = PCShRegShftIfXH00;
      2'b10: PCShRegShft = PCShRegShftIfXH10;
      2'bx1: PCShRegShft = PCShRegShftIfHold;
    endcase
  end

  // if load is happening, remember if we are able to do immediate output.
  // if not, will have to output from _R, not from _P at each shift time.

  // Cannot output incoming PC if not DREN or if XV output is in progress
  assign PCUseRnotP_P = PCShRegLoad ? (~EJT_DREN_R | XVInProg) : PCUseRnotP_R;

  // Cannot output incoming XV if not DREN
  assign XVUseRnotP_P = XVShRegLoad ? (~EJT_DREN_R) : XVUseRnotP_R;

  // Select trace output bit between XV and PC Shift Regs.
  // If XV will have valid data, it has priority over PC.
  // If nothing was output at the time the Shift Reg was loaded,
  // then output from current ShiftReg, not next ShiftReg.

  always @(PCShRegLoad or PCShReg_P or PCShReg_R
           or PCUseRnotP_R or XVShRegLoad or XVShRegShft or XVShReg_P
           or XVShReg_R or XVUseRnotP_R) begin

    casex ({XVShRegLoad, XVShRegShft, XVUseRnotP_R,
            PCShRegLoad,              PCUseRnotP_R })
      5'b1xxxx: JPT_TPC_P = {5'b00000,XVShReg_P[2:0]} ;    // XV_P lsb
      5'b010xx: JPT_TPC_P = {5'b00000,XVShReg_P[2:0]} ;    // XV_P lsb
      5'b011xx: JPT_TPC_P = {5'b00000,XVShReg_R[2:0]} ;    // XV_R lsb
      5'b00x1x: JPT_TPC_P = {PCShReg_P[7:0]} ;             // PC_P lsb
      5'b00x00: JPT_TPC_P = {PCShReg_P[7:0]} ;             // PC_P lsb if PCShift
      5'b00x01: JPT_TPC_P = {PCShReg_R[7:0]} ;             // PC_R lsb if PCShift
    endcase
  end

  // The DBM code must be output as soon as JPT is not stalling
  // (finished output of TPC) and an attempt is being made to
  // Ifetch the debug handler. Otherwise, the probe (waiting for
  // DBM code so it can use TPC) stalls the Ifetch and the system hangs.
  //
  // When leaving debug mode, keep putting out DBM code until there
  // is a non-debug instruction in the M-stage.

  assign DBM2PCSTSET_P = (CP0_JCTRLDM_I_R & ~JXCPN_M_D1_R & ~JPT_HALT_M_R);
  assign DBM2PCSTCLR_P = ~CP0_JCTRLDM_M_R;

  // The ejtag module needs to know when to set the TPC/TDO mux.
  assign JPT_DBM2PCSTSET_P = DBM2PCSTSET_P;

  assign DBM2PCST_P = (DBM2PCST_R & ~DBM2PCSTCLR_P) | DBM2PCSTSET_P;

  // select output PCST code and pending trigger indication
  //     for case of Xcpn,RHOLD = 00 (McycGo):
  //
  // Notes: If not PC Trace ON, still output PCST (but will never have PCInProg)
  //
  //        In DebugMode, force DBM output.
  //
  //        If JPTYPE is INDJ, RHOLD will be asserted if not-real-time
  //                      and PCBusy. For this (RHOLD=0) case, can therefore
  //                      assume either real-time or not PCBusy => JMP
  //
  //        If JPTYPE is DIRJ, PCShftRegLoadIfMGo if and only if ~PCInProg
  //                      This case is MGo, so
  //                      PCInProg => BRT, ~PCInProg => JMP.

  always @(CP0_JPTYPE_M_R or CP0_JTRIG_M_R or DBM2PCST_P
           or PCInProg or TrigPend_R) begin

    casex ({DBM2PCST_P, TrigPend_R, CP0_JTRIG_M_R, CP0_JPTYPE_M_R, PCInProg})
      {3'b1xx,   2'bxx  ,1'bx}: begin PCSTIfXH00_P=`PCST_DBM; TrigPendIfXH00_P=0; end

      {3'b000,`PTYP_PSEQ,1'bx}: begin PCSTIfXH00_P=`PCST_SEQ; TrigPendIfXH00_P=0; end
      {3'b000,`PTYP_DIRJ,1'b0}: begin PCSTIfXH00_P=`PCST_JMP; TrigPendIfXH00_P=0; end
      {3'b000,`PTYP_DIRJ,1'b1}: begin PCSTIfXH00_P=`PCST_BRT; TrigPendIfXH00_P=0; end
      {3'b000,`PTYP_INDJ,1'bx}: begin PCSTIfXH00_P=`PCST_JMP; TrigPendIfXH00_P=0; end
      {3'b000,`PTYP_PNUL,1'bx}: begin PCSTIfXH00_P=`PCST_STL; TrigPendIfXH00_P=0; end

      {3'b001,`PTYP_PSEQ,1'bx}: begin PCSTIfXH00_P=`PCST_TSQ; TrigPendIfXH00_P=0; end
      {3'b001,`PTYP_DIRJ,1'b0}: begin PCSTIfXH00_P=`PCST_JMP; TrigPendIfXH00_P=1; end
      {3'b001,`PTYP_DIRJ,1'b1}: begin PCSTIfXH00_P=`PCST_BRT; TrigPendIfXH00_P=1; end
      {3'b001,`PTYP_INDJ,1'bx}: begin PCSTIfXH00_P=`PCST_JMP; TrigPendIfXH00_P=1; end
      {3'b001,`PTYP_PNUL,1'bx}: begin PCSTIfXH00_P=`PCST_TST; TrigPendIfXH00_P=0; end

      {3'b010,`PTYP_PSEQ,1'bx}: begin PCSTIfXH00_P=`PCST_TSQ; TrigPendIfXH00_P=0; end
      {3'b010,`PTYP_DIRJ,1'b0}: begin PCSTIfXH00_P=`PCST_JMP; TrigPendIfXH00_P=1; end
      {3'b010,`PTYP_DIRJ,1'b1}: begin PCSTIfXH00_P=`PCST_BRT; TrigPendIfXH00_P=1; end
      {3'b010,`PTYP_INDJ,1'bx}: begin PCSTIfXH00_P=`PCST_JMP; TrigPendIfXH00_P=1; end
      {3'b010,`PTYP_PNUL,1'bx}: begin PCSTIfXH00_P=`PCST_TST; TrigPendIfXH00_P=0; end

      {3'b011,`PTYP_PSEQ,1'bx}: begin PCSTIfXH00_P=`PCST_TSQ; TrigPendIfXH00_P=1; end
      {3'b011,`PTYP_DIRJ,1'b0}: begin PCSTIfXH00_P=`PCST_JMP; TrigPendIfXH00_P=1; end // impossible?
      {3'b011,`PTYP_DIRJ,1'b1}: begin PCSTIfXH00_P=`PCST_BRT; TrigPendIfXH00_P=1; end // impossible?
      {3'b011,`PTYP_INDJ,1'bx}: begin PCSTIfXH00_P=`PCST_JMP; TrigPendIfXH00_P=1; end // impossible?
      {3'b011,`PTYP_PNUL,1'bx}: begin PCSTIfXH00_P=`PCST_TST; TrigPendIfXH00_P=1; end
    endcase
  end

  // select output PCST code and pending trigger indication
  //     for case of Xcpn,RHOLD = 10:
  //
  // Notes: If not PC Trace ON, still output PCST (but will never have PCInProg)
  //
  //        In DebugMode, force DBM output.
  //
  //        If DbgXcpn,   will not load PCShftReg (no MGo),
  //                      and will not load XVShftReg (not GeneralXcpn),
  //                      so just force STL or TST.
  //
  //        If GeneralXcpn, RHOLD will be asserted if not-real-time
  //                      and XVBusy. For this (RHOLD=0) case, can therefore
  //                      assume either real-time or not XVBusy => EXP
  //

  always @(CP0_JTRIG_M_R or CP0_JXCPN_M_R or DBM2PCST_P
           or TrigPend_R) begin

    casex ({DBM2PCST_P, CP0_JXCPN_M_R, TrigPend_R, CP0_JTRIG_M_R})
      4'b1xxx: begin PCSTIfXH10_P=`PCST_DBM; TrigPendIfXH10_P=0; end

      4'b0100: begin PCSTIfXH10_P=`PCST_STL; TrigPendIfXH10_P=0; end
      4'b0101: begin PCSTIfXH10_P=`PCST_TST; TrigPendIfXH10_P=0; end
      4'b011x: begin PCSTIfXH10_P=`PCST_TST; TrigPendIfXH10_P=0; end

      4'b0000: begin PCSTIfXH10_P=`PCST_EXP; TrigPendIfXH10_P=0; end
      4'b0001: begin PCSTIfXH10_P=`PCST_EXP; TrigPendIfXH10_P=1; end
      4'b001x: begin PCSTIfXH10_P=`PCST_EXP; TrigPendIfXH10_P=1; end
    endcase
  end

  // select output PCST code and pending trigger indication
  //     for case of RHOLD = 1:
  //
  // Notes: In DebugMode, force DBM output.
  //
  //        For all other cases RHold => STL or TST.

  always @(DBM2PCST_P or TrigPend_R) begin

    casex ({DBM2PCST_P, TrigPend_R})
      2'b1x: begin PCSTIfHold_P=`PCST_DBM; TrigPendIfHold_P=0; end

      2'b00: begin PCSTIfHold_P=`PCST_STL; TrigPendIfHold_P=0; end
      2'b01: begin PCSTIfHold_P=`PCST_TST; TrigPendIfHold_P=0; end
    endcase
  end

  // select output PCST code and pending trigger indication
  //     from pre-computed cases as a function of Non-Debug-Xcpn,RHOLD:
  always @(CP0_XCPN_M or PCSTIfHold_P or PCSTIfXH00_P
           or PCSTIfXH10_P or TrigPendIfHold_P or TrigPendIfXH00_P
           or TrigPendIfXH10_P or myRHOLD) begin

    casex ({CP0_XCPN_M, myRHOLD})
      2'b00: begin JPT_PCST_P = PCSTIfXH00_P; TrigPend_P = TrigPendIfXH00_P; end
      2'b10: begin JPT_PCST_P = PCSTIfXH10_P; TrigPend_P = TrigPendIfXH10_P; end
      2'bx1: begin JPT_PCST_P = PCSTIfHold_P; TrigPend_P = TrigPendIfHold_P; end
    endcase
  end

  //verilint 396 OFF   // A flipflop without an asynchronous reset
  //verilint 530 OFF   // A flipflop is inferred




  reg RESET_X_R_N;
  always @ (posedge CLK)
    RESET_X_R_N <= RESET_D1_R_N;
  assign RESET_D2_R_N = RESET_X_R_N | TMODE;




  assign CFG_EJTMLOG2_C1 = CFG_EJTMLOG2;

  always @(posedge CLK `negedge_RESET_D2_R_N_) begin

    if (~`RESET_D2_R_N_) begin

      JPT_HALT_M_R <= 0;

      JPT_PCST_R   <= 3'b000;
      JPT_PCST_D1_R<= 3'b000;
      JPT_PCST_D2_R<= 3'b000;

      JPT_PCST_DR  <= 12'b000_000_000_000;
      JPT_TPC_DR   <= 8'b0000_0000;

      DBM2PCST_R   <= 0;
      JXCPN_M_D1_R <= 0;
      XVCount_R    <= 2'b00;
      PCCount_R    <= 6'b00_0000;
      XVShReg_R    <= 3'b000;
      PCShReg_R    <= 40'h00_0000_0000;
      JXCPN_W_R    <= 0;
      TrigPend_R   <= 0;
      XVUseRnotP_R <= 0;
      PCUseRnotP_R <= 0;
      XCPN_W_R     <= 0;
      XCPN_W1_R    <= 0;

    end

    else begin

      JPT_HALT_M_R <= JPT_HALT_M_P;

      JPT_PCST_R   <= JPT_PCST_P;
      JPT_PCST_D1_R<= JPT_PCST_R;
      JPT_PCST_D2_R<= JPT_PCST_D1_R;

      // These go out synchronous with DCLK:
      if (EJT_DREN_R) JPT_PCST_DR  <= {JPT_PCST_D2_R,JPT_PCST_D1_R,JPT_PCST_R,JPT_PCST_P};
      if (EJT_DREN_R) JPT_TPC_DR   <= JPT_TPC_P;

      JXCPN_M_D1_R <= CP0_JXCPN_M_R;
      DBM2PCST_R   <= DBM2PCST_P;
      XVCount_R    <= XVCount_P;
      PCCount_R    <= PCCount_P;
      XVShReg_R    <= XVShReg_P;
      PCShReg_R    <= PCShReg_P;
      JXCPN_W_R    <= JXCPN_W_P;
      TrigPend_R   <= TrigPend_P;
      XVUseRnotP_R <= XVUseRnotP_P;
      PCUseRnotP_R <= PCUseRnotP_P;
      XCPN_W_R     <= XCPN_W_P;
      XCPN_W1_R    <= XCPN_W1_P;

    end
  end
  //verilint 396 ON    // A flipflop without an asynchronous reset
  //verilint 530 ON    // A flipflop is inferred

  // ****** Assertion Checkers ****************
  //synopsys translate_off

  // for debug only (display waveforms, or assertion checkers)
  reg JPINDJ_M_R;                       // Pipeflow is unsquashed indirect jump

  // verilint 182 OFF Illegal statement for synthesis
  // verilint 396 OFF A flipflop without an asynchronous reset
  // verilint 404 OFF Reset is used as data: RESET_D2_R_N
  always @(posedge CLK) begin
    if (~`RESET_D2_R_N_) begin

      JPINDJ_M_R <= 0;

    end

    else begin

      // pipe or kill JPINDJ from E to M, for debug use:
      if (~myRHOLD) JPINDJ_M_R <= CP0_JPINDJ_E_R & ~CP0_XCPN_M;

      if (JPINDJ_M_R & (CP0_JPTYPE_M_R==`PTYP_PSEQ)) begin
        $display ("ERROR %t %m: Indirect jump piped from E to M, but JPTYPE_M is PSEQ (2'b00)?", $time);
        $stop;
      end

      if (JPINDJ_M_R & (CP0_JPTYPE_M_R==`PTYP_DIRJ)) begin
        $display ("ERROR %t %m: Indirect jump piped from E to M, but JPTYPE_M is Direct jump?", $time);
        $stop;
      end

      if (CP0_JCTRLDM_M_R & JPT_HALT_M_R) begin
        $display ("ERROR %t %m: Debug Mode entered while still asserting Halt or vice versa.", $time);
        $stop;
      end

      if (CP0_JCTRLDM_M_R & XVInProg ) begin
        $display ("ERROR %t %m: Debug Mode and shifting out exception vector.", $time);
        $stop;
      end

      if (CP0_JCTRLDM_M_R & PCInProg ) begin
        $display ("ERROR %t %m: Debug Mode and shifting out target PC.", $time);
        $stop;
      end

      if (CP0_XCPN_M & ~myRHOLD & XVInProg & EJC_DCRTM_R) begin
        $display ("ERROR %t %m: Got new M-exception while outputting previous exception vector in Non-real-time mode.", $time);
        $stop;
      end

      if (CP0_JXCPN_M_R & ~CP0_XCPN_M) begin
        $display ("ERROR %t %m: M-cycle Debug Exception reported but XCPN_M is off.", $time);
        $stop;
      end

      if (XVShRegLoad & PCShRegLoad) begin
        $display ("ERROR %t %m: Loading both PC and XV Shift Regs in same cycle?", $time);
        $stop;
      end

      if (XVShRegShft & PCShRegShft) begin
        $display ("ERROR %t %m: Shifting both PC and XV Shift Regs in same cycle?", $time);
        $stop;
      end

      if (XVShRegLoad & PCShRegShft) begin
        $display ("ERROR %t %m: Shifting PC Shift Reg and Loading XV Shift Reg in same cycle?", $time);
        $stop;
      end

      if (XVShRegLoad) begin
        casex (XVShReg_P)
          //3'b000:  "UTLB BEV0";
          3'b001:  ; // "othr BEV0";
          3'b100:  ; // "RST / NMI";
          //3'b110:  "UTLB BEV1";
          3'b111:  ; // "othr BEV1";
          default: begin
            $display ("ERROR %t %m: Loading PC Trace Exception Vector with bad value. A29,8,7=%b", $time, XVShReg_P);
            $stop;
          end

        endcase
      end

    end
  end
  // verilint 182 ON Illegal statement for synthesis
  // verilint 396 ON  A flipflop without an asynchronous reset
  // verilint 404 ON  Reset is used as data: RESET_D2_R_N
  //synopsys translate_on

  //synopsys translate_off
  //verilint translate off
  // for debug only (waveform display or trace outputs):

  // copy of MONTrace variable, assigned by testbed module
  wire [`MonTraceHi:0] MONTrace;

  // create justified full 32-bit versions of IVATgt's:
  wire [31:0] CP0_IVATGT3100_I_R = {CP0_IVATGT_I_R,1'b0};
  wire [31:0] CP0_IVATGT3100_S_R = {CP0_IVATGT_S_R,1'b0};

  // create left-justified full 40-bit version of PCShReg_P for display at load time.
  wire [39:0] PCShReg3900LeftJust_P = CFG_INSTM16EN  ?
                                     (CFG_EJTBIT0M16 ? {PCShReg_P[39:0]} :
                                                       {PCShReg_P[38:0],1'b0}) :
                                                       {PCShReg_P[37:0],2'b00};

  // which shift reg goes to TPC? XV or PC
  wire        XV2TPC = XVShRegLoad | XVShRegShft;

  // to get index value, will need to subtract count from max index +1
  wire [1:0]  XVIndexTop = 2'd3;        // max index +1
  wire [1:0]  XVIndex1st = 2'd0;        // index if load and DREN

  // to get index value, will need to subtract count from max index +1
  wire [5:0]  PCIndexTop = EJC_ECRPCAS_R ? 6'd40 : 6'd32; // max index +1
  wire [5:0]  PCIndex1st = CFG_INSTM16EN ? (CFG_EJTBIT0M16 ? 6'd0 : 6'd1) : 6'd2;  // min index

  // calculate index of next output.
  // if loading, use 1st index,
  // otherwise can subtract current count from maximum index +1
  wire [1:0]  XVIndex_P = XVShRegLoad ? XVIndex1st : (XVIndexTop - XVCount_R);
  wire [5:0]  PCIndex_P = PCShRegLoad ? PCIndex1st : (PCIndexTop - PCCount_R);

  // calculate worst case upperindex of next output
  reg [3:0]   XVIndexTest; // add a couple of bits to avoid overflow in test
  reg [5:0]   PCIndexTest;

  always @(CFG_EJTMLOG2_C1 or XVIndex_P) begin
    casex (CFG_EJTMLOG2_C1)
      2'b00: XVIndexTest = XVIndex_P;      // M=1
      2'b01: XVIndexTest = XVIndex_P + 1;  // M=2
      2'b10: XVIndexTest = XVIndex_P + 2;  // M=4
      2'b11: XVIndexTest = XVIndex_P + 2;  // M=8
    endcase
  end

  always @(CFG_EJTMLOG2_C1 or PCIndex_P) begin
    casex (CFG_EJTMLOG2_C1)
      2'b00: PCIndexTest = PCIndex_P;      // M=1
      2'b01: PCIndexTest = PCIndex_P + 1;  // M=2
      2'b10: PCIndexTest = PCIndex_P + 3;  // M=4
      2'b11: PCIndexTest = PCIndex_P + 7;  // M=8
    endcase
  end

  // correct worst case upperindex of next output to max possible index
  reg  [1:0] XVIndexPlusM_P;
  reg  [5:0] PCIndexPlusM_P;
  always @(PCIndexTest or PCIndexTop or XVIndexTest
           or XVIndexTop) begin
    XVIndexPlusM_P = (XVIndexTest < XVIndexTop) ? XVIndexTest : (XVIndexTop -1);
    PCIndexPlusM_P = (PCIndexTest < PCIndexTop) ? PCIndexTest : (PCIndexTop -1);
  end

  reg [8*3:1] PCSTString_P;             // three character string
  reg [8*3:1] PCSTString_R;             // three character string
  reg [8*3:1] PCSTString_D1_R;          // three character string
  reg [8*3:1] PCSTString_D2_R;          // three character string
  reg [8*9:1] XVShRegString_P;          // nine  character string

  reg         DREN_D1_R, DREN_D2_R, DREN_D3_R; // delayed DREN's
  reg  [1:0]       NcountMinus1;              // cycles between DREN's Minus1

  always @(posedge CLK) begin

    // calculate number of cycles between DREN's
    DREN_D1_R <= EJT_DREN_R;
    DREN_D2_R <= DREN_D1_R;
    DREN_D3_R <= DREN_D2_R;

    casex ({EJT_DREN_R, DREN_D1_R, DREN_D2_R, DREN_D3_R })
      4'b0xxx: NcountMinus1 = NcountMinus1; // hold until next DREN
      4'b11xx: NcountMinus1 = 2'd0;
      4'b101x: NcountMinus1 = 2'd1;
      4'b1001: NcountMinus1 = 2'd2;
      4'b1000: NcountMinus1 = 2'd3;
    endcase


    if (MONTrace[`MonTraceRegWrite]) begin

      // convert code to string for display
      casex (XVShReg_P)
        3'b000:  XVShRegString_P = "UTLB BEV0";
        3'b001:  XVShRegString_P = "othr BEV0";
        3'b100:  XVShRegString_P = "RST / NMI";
        3'b110:  XVShRegString_P = "UTLB BEV1";
        3'b111:  XVShRegString_P = "othr BEV1";
        default: XVShRegString_P = "?????????";
      endcase

      if (PCShRegLoad)
        $display ("0 EJTAG Write  JmpTgtASID_PC 0x0_0", 0, PCShReg3900LeftJust_P[39:32],
                                                              PCShReg3900LeftJust_P[31:00]);

      if (XVShRegLoad)
        $display ("0 EJTAG Write  ExcpnVec  A29,8,7=%b()", 0, XVShReg_P, XVShRegString_P);

    end

    if (MONTrace[`MonTracePCTrace]) begin

      if (EJT_DREN_R) begin

        // convert code to string for display
        casex (JPT_PCST_P)
          `PCST_STL: PCSTString_P = "STL";
          `PCST_JMP: PCSTString_P = "JMP";
          `PCST_BRT: PCSTString_P = "BRT";
          `PCST_EXP: PCSTString_P = "EXP";
          `PCST_SEQ: PCSTString_P = "SEQ";
          `PCST_TST: PCSTString_P = "TST";
          `PCST_TSQ: PCSTString_P = "TSQ";
          `PCST_DBM: PCSTString_P = "DBM";
        endcase
        casex (JPT_PCST_R)
          `PCST_STL: PCSTString_R = "STL";
          `PCST_JMP: PCSTString_R = "JMP";
          `PCST_BRT: PCSTString_R = "BRT";
          `PCST_EXP: PCSTString_R = "EXP";
          `PCST_SEQ: PCSTString_R = "SEQ";
          `PCST_TST: PCSTString_R = "TST";
          `PCST_TSQ: PCSTString_R = "TSQ";
          `PCST_DBM: PCSTString_R = "DBM";
        endcase
        casex (JPT_PCST_D1_R)
          `PCST_STL: PCSTString_D1_R = "STL";
          `PCST_JMP: PCSTString_D1_R = "JMP";
          `PCST_BRT: PCSTString_D1_R = "BRT";
          `PCST_EXP: PCSTString_D1_R = "EXP";
          `PCST_SEQ: PCSTString_D1_R = "SEQ";
          `PCST_TST: PCSTString_D1_R = "TST";
          `PCST_TSQ: PCSTString_D1_R = "TSQ";
          `PCST_DBM: PCSTString_D1_R = "DBM";
        endcase
        casex (JPT_PCST_D2_R)
          `PCST_STL: PCSTString_D2_R = "STL";
          `PCST_JMP: PCSTString_D2_R = "JMP";
          `PCST_BRT: PCSTString_D2_R = "BRT";
          `PCST_EXP: PCSTString_D2_R = "EXP";
          `PCST_SEQ: PCSTString_D2_R = "SEQ";
          `PCST_TST: PCSTString_D2_R = "TST";
          `PCST_TSQ: PCSTString_D2_R = "TSQ";
          `PCST_DBM: PCSTString_D2_R = "DBM";
        endcase

        // display PC with index if output is valid PC bits.
        // display XV with index if output is valid XV bits.
        casex ({CFG_EJTMLOG2_C1, NcountMinus1, XV2TPC, (PCInProg | PCShRegLoad)})
          // M=1,        N=1
          6'b00_00_00:$display ("0 EJTAG PCtrace:        TPC=%b PCST=0()",
                          0,            JPT_TPC_P[1], JPT_PCST_P, PCSTString_P);
          6'b00_00_01:$display ("0 EJTAG PCtrace: PC[0] TPC=%b PCST=0()",
                          0, PCIndex_P, JPT_TPC_P[1], JPT_PCST_P, PCSTString_P);
          6'b00_00_1x:$display ("0 EJTAG PCtrace: XV[ 0] TPC=%b PCST=0()",
                          0, XVIndex_P, JPT_TPC_P[1], JPT_PCST_P, PCSTString_P);
          // M=1,        N=2
          6'b00_01_00:$display ("0 EJTAG PCtrace:        TPC=%b PCST[2:1]=0() 0()",
                          0,            JPT_TPC_P[1],
                                                        JPT_PCST_R, PCSTString_R,
                                                        JPT_PCST_P, PCSTString_P);
          6'b00_01_01:$display ("0 EJTAG PCtrace: PC[0] TPC=%b PCST[2:1]=0() 0()",
                          0,                 PCIndex_P, JPT_TPC_P[1],
                                                        JPT_PCST_R, PCSTString_R,
                                                        JPT_PCST_P, PCSTString_P);
          6'b00_01_1x:$display ("0 EJTAG PCtrace: XV[ 0] TPC=%b PCST[2:1]=0() 0()",
                          0,                 XVIndex_P, JPT_TPC_P[1],
                                                        JPT_PCST_R, PCSTString_R,
                                                        JPT_PCST_P, PCSTString_P);
          // M=1,        N=3
          6'b00_10_00:$display ("0 EJTAG PCtrace:        TPC=%b PCST[3:1]=0() 0() 0()",
                          0,            JPT_TPC_P[1],
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b00_10_01:$display ("0 EJTAG PCtrace: PC[0] TPC=%b PCST[3:1]=0() 0() 0()",
                          0,                 PCIndex_P, JPT_TPC_P[1],
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b00_10_1x:$display ("0 EJTAG PCtrace: XV[ 0] TPC=%b PCST[3:1]=0() 0() 0()",
                          0,                 XVIndex_P, JPT_TPC_P[1],
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          // M=1,        N=4
          6'b00_11_00:$display ("0 EJTAG PCtrace:        TPC=%b PCST[4:1]=0() 0() 0() 0()",
                          0,            JPT_TPC_P[1],
                                                        JPT_PCST_D2_R, PCSTString_D2_R,
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b00_11_01:$display ("0 EJTAG PCtrace: PC[0] TPC=%b PCST[4:1]=0() 0() 0() 0()",
                          0,                 PCIndex_P, JPT_TPC_P[1],
                                                        JPT_PCST_D2_R, PCSTString_D2_R,
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b00_11_1x:$display ("0 EJTAG PCtrace: XV[ 0] TPC=%b PCST[4:1]=0() 0() 0() 0()",
                          0,                 XVIndex_P, JPT_TPC_P[1],
                                                        JPT_PCST_D2_R, PCSTString_D2_R,
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          // M=2,        N=1
          6'b01_00_00:$display ("0 EJTAG PCtrace:           TPC=%b PCST=0()",
                          0,            JPT_TPC_P[2:1], JPT_PCST_P, PCSTString_P);
          6'b01_00_01:$display ("0 EJTAG PCtrace: PC[0:0] TPC=%b PCST=0()",
                          0, PCIndexPlusM_P, PCIndex_P, JPT_TPC_P[2:1],
                                                        JPT_PCST_P, PCSTString_P);
          6'b01_00_1x:$display ("0 EJTAG PCtrace: XV[ 0: 0] TPC=%b PCST=0()",
                          0, XVIndexPlusM_P, XVIndex_P, JPT_TPC_P[2:1],
                                                        JPT_PCST_P, PCSTString_P);
          // M=2,        N=2
          6'b01_01_00:$display ("0 EJTAG PCtrace:           TPC=%b PCST[2:1]=0() 0()",
                          0,            JPT_TPC_P[2:1],
                                                        JPT_PCST_R, PCSTString_R,
                                                        JPT_PCST_P, PCSTString_P);
          6'b01_01_01:$display ("0 EJTAG PCtrace: PC[0:0] TPC=%b PCST[2:1]=0() 0()",
                          0, PCIndexPlusM_P, PCIndex_P, JPT_TPC_P[2:1],
                                                        JPT_PCST_R, PCSTString_R,
                                                        JPT_PCST_P, PCSTString_P);
          6'b01_01_1x:$display ("0 EJTAG PCtrace: XV[ 0: 0] TPC=%b PCST[2:1]=0() 0()",
                          0, XVIndexPlusM_P, XVIndex_P, JPT_TPC_P[2:1],
                                                        JPT_PCST_R, PCSTString_R,
                                                        JPT_PCST_P, PCSTString_P);
          // M=2,        N=3
          6'b01_10_00:$display ("0 EJTAG PCtrace:           TPC=%b PCST[3:1]=0() 0() 0()",
                          0,            JPT_TPC_P[2:1],
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b01_10_01:$display ("0 EJTAG PCtrace: PC[0:0] TPC=%b PCST[3:1]=0() 0() 0()",
                          0, PCIndexPlusM_P, PCIndex_P, JPT_TPC_P[2:1],
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b01_10_1x:$display ("0 EJTAG PCtrace: XV[ 0: 0] TPC=%b PCST[3:1]=0() 0() 0()",
                          0, XVIndexPlusM_P, XVIndex_P, JPT_TPC_P[2:1],
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          // M=2,        N=4
          6'b01_11_00:$display ("0 EJTAG PCtrace:           TPC=%b PCST[4:1]=0() 0() 0() 0()",
                          0,            JPT_TPC_P[2:1],
                                                        JPT_PCST_D2_R, PCSTString_D2_R,
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b01_11_01:$display ("0 EJTAG PCtrace: PC[0:0] TPC=%b PCST[4:1]=0() 0() 0() 0()",
                          0, PCIndexPlusM_P, PCIndex_P, JPT_TPC_P[2:1],
                                                        JPT_PCST_D2_R, PCSTString_D2_R,
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b01_11_1x:$display ("0 EJTAG PCtrace: XV[ 0: 0] TPC=%b PCST[4:1]=0() 0() 0() 0()",
                          0, XVIndexPlusM_P, XVIndex_P, JPT_TPC_P[2:1],
                                                        JPT_PCST_D2_R, PCSTString_D2_R,
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          // M=4,        N=1
          6'b10_00_00:$display ("0 EJTAG PCtrace:           TPC=%b PCST=0()",
                          0,            JPT_TPC_P[4:1], JPT_PCST_P, PCSTString_P);
          6'b10_00_01:$display ("0 EJTAG PCtrace: PC[0:0] TPC=%b PCST=0()",
                          0, PCIndexPlusM_P, PCIndex_P, JPT_TPC_P[4:1],
                                                        JPT_PCST_P, PCSTString_P);
          6'b10_00_1x:$display ("0 EJTAG PCtrace: XV[ 0: 0] TPC=%b PCST=0()",
                          0, XVIndexPlusM_P, XVIndex_P, JPT_TPC_P[4:1],
                                                        JPT_PCST_P, PCSTString_P);
          // M=4,        N=2
          6'b10_01_00:$display ("0 EJTAG PCtrace:           TPC=%b PCST[2:1]=0() 0()",
                          0,            JPT_TPC_P[4:1],
                                                        JPT_PCST_R, PCSTString_R,
                                                        JPT_PCST_P, PCSTString_P);
          6'b10_01_01:$display ("0 EJTAG PCtrace: PC[0:0] TPC=%b PCST[2:1]=0() 0()",
                          0, PCIndexPlusM_P, PCIndex_P, JPT_TPC_P[4:1],
                                                        JPT_PCST_R, PCSTString_R,
                                                        JPT_PCST_P, PCSTString_P);
          6'b10_01_1x:$display ("0 EJTAG PCtrace: XV[ 0: 0] TPC=%b PCST[2:1]=0() 0()",
                          0, XVIndexPlusM_P, XVIndex_P, JPT_TPC_P[4:1],
                                                        JPT_PCST_R, PCSTString_R,
                                                        JPT_PCST_P, PCSTString_P);
          // M=4,        N=3
          6'b10_10_00:$display ("0 EJTAG PCtrace:           TPC=%b PCST[3:1]=0() 0() 0()",
                          0,            JPT_TPC_P[4:1],
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b10_10_01:$display ("0 EJTAG PCtrace: PC[0:0] TPC=%b PCST[3:1]=0() 0() 0()",
                          0, PCIndexPlusM_P, PCIndex_P, JPT_TPC_P[4:1],
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b10_10_1x:$display ("0 EJTAG PCtrace: XV[ 0: 0] TPC=%b PCST[3:1]=0() 0() 0()",
                          0, XVIndexPlusM_P, XVIndex_P, JPT_TPC_P[4:1],
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          // M=4,        N=4
          6'b10_11_00:$display ("0 EJTAG PCtrace:           TPC=%b PCST[4:1]=0() 0() 0() 0()",
                          0,            JPT_TPC_P[4:1],
                                                        JPT_PCST_D2_R, PCSTString_D2_R,
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b10_11_01:$display ("0 EJTAG PCtrace: PC[0:0] TPC=%b PCST[4:1]=0() 0() 0() 0()",
                          0, PCIndexPlusM_P, PCIndex_P, JPT_TPC_P[4:1],
                                                        JPT_PCST_D2_R, PCSTString_D2_R,
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b10_11_1x:$display ("0 EJTAG PCtrace: XV[ 0: 0] TPC=%b PCST[4:1]=0() 0() 0() 0()",
                          0, XVIndexPlusM_P, XVIndex_P, JPT_TPC_P[4:1],
                                                        JPT_PCST_D2_R, PCSTString_D2_R,
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          // M=8,        N=1
          6'b11_00_00:$display ("0 EJTAG PCtrace:           TPC=%b PCST=0()",
                          0,            JPT_TPC_P[8:1], JPT_PCST_P, PCSTString_P);
          6'b11_00_01:$display ("0 EJTAG PCtrace: PC[0:0] TPC=%b PCST=0()",
                          0, PCIndexPlusM_P, PCIndex_P, JPT_TPC_P[8:1],
                                                        JPT_PCST_P, PCSTString_P);
          6'b11_00_1x:$display ("0 EJTAG PCtrace: XV[ 0: 0] TPC=%b PCST=0()",
                          0, XVIndexPlusM_P, XVIndex_P, JPT_TPC_P[8:1],
                                                        JPT_PCST_P, PCSTString_P);
          // M=8,        N=2
          6'b11_01_00:$display ("0 EJTAG PCtrace:           TPC=%b PCST[2:1]=0() 0()",
                          0,            JPT_TPC_P[8:1],
                                                        JPT_PCST_R, PCSTString_R,
                                                        JPT_PCST_P, PCSTString_P);
          6'b11_01_01:$display ("0 EJTAG PCtrace: PC[0:0] TPC=%b PCST[2:1]=0() 0()",
                          0, PCIndexPlusM_P, PCIndex_P, JPT_TPC_P[8:1],
                                                        JPT_PCST_R, PCSTString_R,
                                                        JPT_PCST_P, PCSTString_P);
          6'b11_01_1x:$display ("0 EJTAG PCtrace: XV[ 0: 0] TPC=%b PCST[2:1]=0() 0()",
                          0, XVIndexPlusM_P, XVIndex_P, JPT_TPC_P[8:1],
                                                        JPT_PCST_R, PCSTString_R,
                                                        JPT_PCST_P, PCSTString_P);
          // M=8,        N=3
          6'b11_10_00:$display ("0 EJTAG PCtrace:           TPC=%b PCST[3:1]=0() 0() 0()",
                          0,            JPT_TPC_P[8:1],
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b11_10_01:$display ("0 EJTAG PCtrace: PC[0:0] TPC=%b PCST[3:1]=0() 0() 0()",
                          0, PCIndexPlusM_P, PCIndex_P, JPT_TPC_P[8:1],
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b11_10_1x:$display ("0 EJTAG PCtrace: XV[ 0: 0] TPC=%b PCST[3:1]=0() 0() 0()",
                          0, XVIndexPlusM_P, XVIndex_P, JPT_TPC_P[8:1],
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          // M=8,        N=4
          6'b11_11_00:$display ("0 EJTAG PCtrace:           TPC=%b PCST[4:1]=0() 0() 0() 0()",
                          0,            JPT_TPC_P[8:1],
                                                        JPT_PCST_D2_R, PCSTString_D2_R,
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b11_11_01:$display ("0 EJTAG PCtrace: PC[0:0] TPC=%b PCST[4:1]=0() 0() 0() 0()",
                          0, PCIndexPlusM_P, PCIndex_P, JPT_TPC_P[8:1],
                                                        JPT_PCST_D2_R, PCSTString_D2_R,
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
          6'b11_11_1x:$display ("0 EJTAG PCtrace: XV[ 0: 0] TPC=%b PCST[4:1]=0() 0() 0() 0()",
                          0, XVIndexPlusM_P, XVIndex_P, JPT_TPC_P[8:1],
                                                        JPT_PCST_D2_R, PCSTString_D2_R,
                                                        JPT_PCST_D1_R, PCSTString_D1_R,
                                                        JPT_PCST_R,    PCSTString_R,
                                                        JPT_PCST_P,    PCSTString_P);
        endcase
      end                               // if EJT_DREN_R
    end                                 // if TRACE
  end

  //synopsys translate_on
  //verilint translate on

endmodule

