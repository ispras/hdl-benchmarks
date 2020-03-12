/*
 *
 * Taken from VCEGAR benchmarks -- http://www.cprover.org/hardware/benchmarks/vcegar-benchmarks.tgz
 * Modified by Ahmed Irfan <irfan@fbk.eu>
 *
 */ 
/****************************************************************
 ---------------------------------------------------------------
     Copyright 1999 Sun Microsystems, Inc., 901 San Antonio
     Road, Palo Alto, CA 94303, U.S.A.  All Rights Reserved.
     The contents of this file are subject to the current
     version of the Sun Community Source License, picoJava-II
     Core ("the License").  You may not use this file except
     in compliance with the License.  You may obtain a copy
     of the License by searching for "Sun Community Source
     License" on the World Wide Web at http://www.sun.com.
     See the License for the rights, obligations, and
     limitations governing use of the contents of this file.

     Sun, Sun Microsystems, the Sun logo, and all Sun-based
     trademarks and logos, Java, picoJava, and all Java-based
     trademarks and logos are trademarks or registered trademarks 
     of Sun Microsystems, Inc. in the United States and other
     countries.
 ----------------------------------------------------------------
******************************************************************/




module icctl (
    biu_icu_ack,       // input  (ic_cntl) <= ()
    clk,               // input  (ibuf_ctl,ic_cntl) <= ()
    icu_addr_2_0,      // input  (ibuf_ctl,ic_cntl) <= ()
    icu_hit,           // input  (ic_cntl) <= ()
    iu_brtaken_e,      // input  (ic_cntl) <= ()
    iu_data_e_0,       // input  (ic_cntl) <= ()
    iu_flush_e,        // input  (ic_cntl) <= ()
    iu_ic_diag_e,      // input  (ic_cntl) <= ()
    iu_psr_ice,        // input  (ic_cntl) <= ()
    iu_shift_d,        // input  (ibuf_ctl) <= ()
    reset_l,             // input  (ibuf_ctl,ic_cntl) <= ()
    pcsu_powerdown,    // input  (ic_cntl) <= ()	
    iu_psr_bm8,        // input  (ic_cntl, ibuf_ctl) <= (iu)
    next_fetch_inc,    // output (ic_cntl) => (icu_dpath)
    encod_shift_e,     // output (ibuf_ctl) => ()
    ibuf_pc_sel,       // output (ibuf_ctl) => ()
    icu_addr_sel,       // output (ic_cntl) => ()
    ibuf_enable,
    ic_data_sel,       // output (ic_cntl) => ()
    ic_dout_sel,       // output (ibuf_ctl) => ()
    icu_bypass_q,      // output (ic_cntl) => ()
    icu_drty_d,        // output (ibuf_ctl) => ()
    icu_itag_we,       // output (ic_cntl) => ()
    latch_biu_addr,    // output (ic_cntl) => ()
    icu_ram_we,        // output (ic_cntl) => ()
    icu_req,           // output (ic_cntl) => ()
    icu_size,          // output (ic_cntl) => ()
    icu_tag_sel,       // output (ic_cntl) => ()
    icu_tag_vld,       // output (ic_cntl) => ()
    icu_type,          // output (ic_cntl) => ()
    icu_vld_d,         // output (ibuf_ctl) => ()
    next_addr_sel,     // output (ic_cntl) => ()
    addr_reg_sel,     // output (ic_cntl) => ()
    addr_reg_enable,
    biu_addr_sel,     // output (ic_cntl) => ()
    diag_ld_cache_c,   // output (icctl) => (icu_dpath)
    icu_in_powerdown,  // output (icctl) => (pcsu)
    icram_powerdown,     // output (icctl) => (icu_dpath)	
    icu_hold,           // output (icctl) => (iu)
    valid,
    misc_wrd_sel,
    fill_word_addr,
    ice_line_align,
    bypass_ack
    );

input	[1:0]	biu_icu_ack;     // Acknowledge from biu that data from memory is available
input		clk;
input	[2:0]	icu_addr_2_0;    // bits 2:0 of icu_addr bus;
input		icu_hit;         // Icache Hit
input		iu_brtaken_e;    // branch taken in E stage
input		iu_data_e_0;     // bit 0 of iu data bus used for diagnostic writes
input		iu_flush_e;      // flush instruction in E stage
input	[3:0]	iu_ic_diag_e;    // diagnostic rd/wr to tags/ram
input		iu_psr_ice;      // Icache Enable in the PSR 
input	[7:0]	iu_shift_d;      // This tells how many times data should be	-- From iu
input		reset_l;
input           pcsu_powerdown;  // PCSU request for powerdown
input           iu_psr_bm8;      // 8 bit boot code enable from IU
input		ice_line_align;  //
output  [3:0]   next_fetch_inc;  // next_fetch_inc = 1, if iu_psr_bm8 is asserted,
                                 // otherwise next_fetch_inc = 4, if bypass
				 // next_fetch_inc = 8, if hit
output	[2:0]	encod_shift_e;   // Encoded value of registerd iu_shft_d to be used in ibuffer for
output	[1:0]	ibuf_pc_sel;     // This will select either the seq. pc or br pc -- To Ibuffer
output	[1:0]	icu_addr_sel;     // select addr input to the tags/data
output		ic_data_sel;     // select cache fill data or misc data for instruction ram
output	[11:0]	ic_dout_sel;     // These selcets will select one of the four 	-- To ibuff
output		icu_bypass_q;    // bypass data from the cache
output	[6:0]	icu_drty_d;      // Dirty outputs from the first 5 locations     -- To iu
output		icu_itag_we;     // Write enable to the tags
output		latch_biu_addr;  // cache miss
output  [1:0]	icu_ram_we;      // write enable to the inst ram
output		ibuf_enable;
output		icu_req;         // request memory on a cache miss
output	[1:0]	icu_size;        // size of transaction
output		icu_tag_sel;     // To select input to the tag ram. either mar or misc store.
output		icu_tag_vld;     // valid bit of the tag - to be written into tagram
output	[3:0]	icu_type;        // type of transaction
output	[6:0]	icu_vld_d;       // Valid outputs from the first 5 locations	-- To iu
output	[3:0]	next_addr_sel;   // select the correct next_addr to access cache
output	[1:0]	addr_reg_sel;   // select the correct next_addr to access cache
output		addr_reg_enable;   // select the correct next_addr to access cache
output	[1:0]	biu_addr_sel;
output		diag_ld_cache_c; // Diagnostic rd to ram
output          icu_in_powerdown;// ICU notifies PCSU it is ready for clock shut off.
output          icram_powerdown; // powerdown signal to RAM and TAG
output          icu_hold;        // hold iu pipe for diagnostic access when
                                 // there is outstanding transaction in ICU
output	[15:0]	valid;
input		misc_wrd_sel;
output	[1:0]	fill_word_addr;
output		bypass_ack;

wire		ibuf_full;
wire		ic_drty;
wire		icu_stall;
wire    [3:0]   next_fetch_inc;

ic_cntl ic_cntl (
    .icu_req       (icu_req),            // output (ic_cntl) => ()
    .icu_type      (icu_type[3:0]),      // output (ic_cntl) => ()
    .icu_size      (icu_size[1:0]),      // output (ic_cntl) => ()
    .icu_addr_sel  (icu_addr_sel[1:0]),   // output (ic_cntl) => ()
    .next_addr_sel (next_addr_sel[3:0]), // output (ic_cntl) => ()
    .addr_reg_sel   (addr_reg_sel), // output (ic_cntl) => ()
    .addr_reg_enable(addr_reg_enable), // output (ic_cntl) => ()
    .biu_addr_sel  (biu_addr_sel[1:0]),  // output (ic_cntl) => ()
    .ic_data_sel   (ic_data_sel),        // output (ic_cntl) => ()
    .icu_tag_sel   (icu_tag_sel),        // output (ic_cntl) => ()
    .ic_drty       (ic_drty),            // output (ic_cntl) => (ibuf_ctl)
    .icu_stall     (icu_stall),          // output (ic_cntl) => (ibuf_ctl)
    .icu_tag_vld   (icu_tag_vld),        // output (ic_cntl) => ()
    .icu_itag_we   (icu_itag_we),        // output (ic_cntl) => ()
    .icu_ram_we    (icu_ram_we[1:0]),    // output (ic_cntl) => ()
    .icu_bypass_q  (icu_bypass_q),       // output (ic_cntl) => ()
    .latch_biu_addr (latch_biu_addr),	 // output (ic_cntl) => ()
    .diag_ld_cache_c(diag_ld_cache_c),   // output (ic_cntl) => (icu_dpath)
    .icu_in_powerdown (icu_in_powerdown),// output (ic_cntl) => ()
    .icram_powerdown (icram_powerdown),	 // output (ic_cntl) => ()
    .icu_hold      (icu_hold),           // output (ic_cntl) => ()
    .iu_ic_diag_e  (iu_ic_diag_e[3:0]),  // input  (ic_cntl) <= ()
    .biu_icu_ack   (biu_icu_ack[1:0]),   // input  (ic_cntl) <= ()
    .iu_psr_ice    (iu_psr_ice),         // input  (ic_cntl) <= ()
    .iu_brtaken_e  (iu_brtaken_e),       // input  (ic_cntl) <= ()
    .iu_flush_e    (iu_flush_e),         // input  (ic_cntl) <= ()
    .ibuf_full     (ibuf_full),          // input  (ic_cntl) <= (ibuf_ctl)
    .icu_hit       (icu_hit),            // input  (ic_cntl) <= ()
    .iu_data_e_0   (iu_data_e_0),        // input  (ic_cntl) <= ()
    .pcsu_powerdown(pcsu_powerdown),     // input  (ic_cntl) <= ()
    .next_fetch_inc(next_fetch_inc),     // output (ic_cntl) =>(icu_dpath)
    .iu_psr_bm8	   (iu_psr_bm8),         // input  (ic_cntl,ibuf_ctl) <=(iu)
    .misc_wrd_sel  (misc_wrd_sel),	 // input  
    .fill_word_addr (fill_word_addr),	 // output	
    .ice_line_align(ice_line_align),
    .bypass_ack    (bypass_ack),
    .clk           (clk),                // input  (ibuf_ctl,ic_cntl) <= ()
    .reset_l       (reset_l)             // input  (ibuf_ctl,ic_cntl) <= ()
    );

ibuf_ctl ibuf_ctl (
    .ic_drty       (ic_drty),            // input  (ibuf_ctl) <= (ic_cntl)
    .ibuf_enable   (ibuf_enable),        // input  (ibuf_ctl) <= (ic_cntl)
    .icu_stall	   (icu_stall),
    .ic_dout_sel   (ic_dout_sel[11:0]),  // output (ibuf_ctl) => ()
    .icu_vld_d     (icu_vld_d[6:0]),     // output (ibuf_ctl) => ()
    .icu_drty_d    (icu_drty_d[6:0]),    // output (ibuf_ctl) => ()
    .ibuf_full     (ibuf_full),          // output (ibuf_ctl) => (ic_cntl)
    .iu_shift_d    (iu_shift_d[7:0]),    // input  (ibuf_ctl) <= ()
    .encod_shift_e (encod_shift_e[2:0]), // output (ibuf_ctl) => ()
    .icu_addr_2_0  (icu_addr_2_0[2:0]),  // input  (ibuf_ctl,ic_cntl) <= ()
    .ibuf_pc_sel   (ibuf_pc_sel[1:0]),   // output (ibuf_ctl) => ()
    .reset_l       (reset_l),            // input  (ibuf_ctl,ic_cntl) <= ()
    .jmp_e         (iu_brtaken_e),       // input  (ibuf_ctl) <= (ic_cntl)
    .valid	   (valid),
    .iu_psr_bm8    (iu_psr_bm8),         // input  (ibuf_ctl,ic_cntl) <= (iu)
    .icu_bypass_q  (icu_bypass_q),       // input  (ibuf_ctl) <= (ic_cntl)
    .clk           (clk)                 // input  (ibuf_ctl,ic_cntl) <= ()
    );


endmodule // icctl


module  ic_cntl(
	icu_addr_sel,
	next_addr_sel,
	addr_reg_sel,
	addr_reg_enable,
	biu_addr_sel,
	icu_tag_sel,
	ic_data_sel,
	icu_req,
	icu_type,
	icu_size,
	ic_drty,
	icu_stall,
	icu_tag_vld,
	icu_itag_we,
	icu_ram_we,
	icu_bypass_q,
	latch_biu_addr,
        diag_ld_cache_c,
  	fill_word_addr,
        icu_in_powerdown,
        icram_powerdown,
        next_fetch_inc, 

	// INPUTS
	iu_psr_bm8,
	iu_psr_ice,
	iu_flush_e,
	iu_ic_diag_e,
	iu_brtaken_e,
	ibuf_full,
	iu_data_e_0,
	icu_hit,
	biu_icu_ack,
        pcsu_powerdown,
	icu_hold,
	misc_wrd_sel,
	ice_line_align,
	bypass_ack,
	clk,
	reset_l
	);
	


output			icu_req;	// request memory on a cache miss
output	[3:0]		icu_type;	// type of transaction
output	[1:0]		icu_size;	// size of transaction
output	[1:0]		icu_addr_sel;	// select addr input to the tags/data
output	[3:0]		next_addr_sel;	// select the correct next_addr to access cache
output	[1:0]		addr_reg_sel;	// select the correct next_addr to access cache
output			addr_reg_enable;// enable to icu_addr_d1 latch
output  [1:0]           biu_addr_sel;
output			ic_data_sel;	// select cache fill data or misc data for instruction ram
output			icu_tag_sel;	// To select input to the tag ram. either mar or misc store.
output			ic_drty;	// Error acknowledge returned by memory
output			icu_stall;	// Stall to iu pipe for diagnostic rd/writes
output			icu_tag_vld;	// valid bit of the tag - to be written into tagram
output			icu_itag_we;	// Write enable to the tags
output	[1:0]		icu_ram_we;	// write enable to the inst ram
output			icu_bypass_q;	// bypass data from the cache
output			latch_biu_addr; // latch the memory addr (in case of cache miss)
output                  diag_ld_cache_c;// diagnostic rd to ram
output	[1:0]		fill_word_addr; //  word addr during fill
output                  icu_in_powerdown;// ICU notifies PCSU it is ready for clock shut off.
output                  icram_powerdown;// powerdown signal to RAM and TAG
output  [3:0]           next_fetch_inc; // next_fetch_inc = 1, if iu_psr_bm8 is asserted,
                                        // otherwise next_fetch_inc = 4, if bypass, 8, if hit
output			icu_hold;       // hold iu pipe for diagnostic access when
					// there is outstanding transaction in ICU 
input           	iu_psr_bm8;     // 8 bit boot code enable from IU
input	[3:0]		iu_ic_diag_e;	// diagnostic rd/wr to tags/ram
input	[1:0]		biu_icu_ack;	// Acknowledge from biu that data from memory is available
input			iu_psr_ice;	// Icache Enable in the PSR 
input			iu_brtaken_e;	// branch taken in E stage
input			iu_flush_e;	// flush instruction in E stage
input			ibuf_full;	// Ibuffer is full. (icache should go idle)
input			icu_hit;	// Icache Hit
input			iu_data_e_0;	// bit 0 of iu data bus used for diagnostic writes
input                   pcsu_powerdown; // PCSU request for powerdown
input			misc_wrd_sel;
input			ice_line_align;
output			bypass_ack;
input			clk;
input			reset_l;

wire			normal_ack;
wire			second_fill_cyc;
wire 			third_fill_cyc;
wire			fourth_fill_cyc;
wire			nc_fill_cyc;
wire			error_ack;
wire	[6:0]		ic_miss_state;
reg	[6:0]		tmp_ic_miss_state;
wire	[6:0]		next_miss_state;
wire			valid_diag_e;
wire			valid_diag_c;
wire			icu_miss;
wire			ic_idle;
wire			diag_st_cache_e;
wire			diag_ld_cache_e;
wire			diag_st_tag_e;
wire			diag_ld_tag_e;
wire			set_stall ;
wire			cache_fill_cyc;
wire			stall_valid;
wire			reset_d1_l ;
wire			jmp_e;
wire			fourth_fill_cyc_d1;
wire			nc_fill_cyc_d1;
wire			ic_idle_d1;
wire                    icram_powerdown;
wire 	[3:0]		next_fetch_inc;
wire 			qual_iu_flush_e; 
wire			icu_hold;
wire			nc_req;
wire			ic_req;
wire 			cacheable;
wire 			qual_iu_psr_ice;
wire 			qual_iu_psr_ice_q;
wire			icu_bypass_q;
wire			standby_d1;
wire			new_psr_ice;

// *****************************************************************************
// 
// iu_psr_ice does not become effective until the subsequent icu_addr_d1 
// becomes aligned on line boundary( ice_line_align=(icu_addr_d1[3:0] == 4'h0) ).
// This simplifies the ibuffer new_valid equations because with ice_line_align  
// used to qualify iu_psr_ice there should be no need to align the cached data 
// to fill the ibuffer in the middle. This corner case occurs in a scenario:
//
// The cache is on while ibuf's PC is on 2nd or 4th word. After the line has been 
// filled to I$, the 2nd or 4th word needs to be aligned and filled to Ibuffer.    
// This kind of alignment complicates the new_valid equations and verification
// work.  
// 
// With qual_iu_psr_ice, if there is any alignment, it must be caused by branch
// or trap and the data always fill from the first byte of the ibuffer. 
//
// ******************************************************************************


// qual_iu_psr_ice changes only when there is a fetch address in cache access
// stage along a cache line boundary.
wire    qual_iu_psr_ice_sel = ic_idle& ice_line_align & !valid_diag_c&!nc_fill_cyc_d1&!fourth_fill_cyc_d1;
assign  qual_iu_psr_ice = qual_iu_psr_ice_sel ? new_psr_ice : qual_iu_psr_ice_q;
 
// Latch the new PSR bit only when in idle.
ff_sre  iu_psr_ice_reg (    		.out(new_psr_ice),
                                        .din(iu_psr_ice),
                                        .clk(clk),
					.enable(ic_idle),
                                        .reset_l(reset_l)
                                        );

mj_s_ff_snr_d  qual_iu_psr_ice_reg (    .out(qual_iu_psr_ice_q),
                                        .in(qual_iu_psr_ice),
                                        .clk(clk),
                                        .reset_l(reset_l)
                                        );
 

wire    valid_diag_window  = valid_diag_e | valid_diag_c;

// **************************************************************
//
// Icu_hold is generated to hold iu pipe for diagnostic access 
// when there is outstanding transaction in ICU.
// 
// **************************************************************

assign  icu_hold = (|iu_ic_diag_e[3:0] | (iu_flush_e & iu_psr_ice ))
                    & !ic_idle;


// **************************************************************
//
// iu_flush_e needs to be qualified by iu_psr_ice
// iu_flush_e is treated as a nop if iu_psr_ice is set to zero
// iu_flush_e also needs to be qualified by ic_idle since the 
// Icache flush can only be carried out when there is no 
// outstanding ICU transaction.
//
// **************************************************************

assign qual_iu_flush_e= iu_flush_e & iu_psr_ice & ic_idle;

// temp connection
// assign pcsu_powerdown = 1'b0;

// **************************************************************
//
// 8 Bit Boot Code Mode: 
//
// To perform boot mode correctly you need to be 
// aware of the following pitfalls:
// 
// 1. The execution of the priv_write_prs instruction 
//    disables the boot mode. So, do NOT use the priv_write_prs 
//    instruction until after the branch to non-boot memory 
//    location occurs.
//
// 2. To execute the priv_write_prs without modifing the 
//    content, you need issue priv_read_prs before 
//    priv_write_prs. So, use these two instructions as a pair   
//    to perform disabling Boot Mode.
//
// 3. The pair MUST start at word boundary.
//
// 4. Four Nops are required to inserted after the priv_write_prs
//    in order to recover from boot mode to word acccess.   
//
// 5. The pj_boot8 pin needs to tied to HIGH.
//    
// To summarize the usage, the boot code should be written in the 
// style shown as below:
//
// (8 bit PROM)
// Boot_Start:  Instruction_1
//              Instruction_2
//              ...
//              goto Application  // Application program must
//                                // begin at word boundary
//
// (Non-boot Memory)
// Application: priv_read_reg_psr  // To avoid modifing psr,the
//                                 // content of psr is pushed
//		sipush 0xBFFF      // Zero the bit 14 (PSR.BM8)
//    		iand		   //
//              priv_write_reg_psr // Then disable boot mode by
//                                 // poping the content to psr
//
//              nop                // 4 nops are inserted to
//              nop                // recover from boot mode to 
//	        nop		   // word acccess
//              nop
//
// **************************************************************

assign next_fetch_inc =  iu_psr_bm8     ? 4'b0001: 
                         !qual_iu_psr_ice ? 4'b0100 : 4'b1000;  

// Decode of Various signals
assign	valid_diag_e = qual_iu_flush_e | iu_ic_diag_e[3] | iu_ic_diag_e[2] | 
                       iu_ic_diag_e[1] | iu_ic_diag_e[0] ;

// **************************************************************
// diag_xx_xxx_e 
//
// The following diag_xx_xxx_e signals need to be qualified by 
// ic_idle because the diagnostic access can only be carried out 
// when there is no outstanding ICU transaction.
// **************************************************************

wire    diag_ld_c;
assign  diag_st_cache_e = iu_ic_diag_e[3]& ic_idle;
assign  diag_ld_cache_e = iu_ic_diag_e[2]& ic_idle;
assign  diag_st_tag_e   = iu_ic_diag_e[1]& ic_idle;
assign  diag_ld_tag_e   = iu_ic_diag_e[0]& ic_idle;

mj_s_ff_snr_d  diag_ld_c_reg (	.out(diag_ld_c),
				.in(diag_ld_cache_e|diag_ld_tag_e),
		                .clk(clk),
                      		.reset_l(reset_l)
				);

// Generate a miss only if in idle state and no diagnostic rd/wr in C stage.
// diagnostics should not generate any misses. but , at the same time they
// should generate a stall for ibuffer, so that it ignores data on the bus to 
// ibuffer.

// *** NOTE ***
// To suppress cache enable during the boot mode qual_iu_psr_ice needs to be
// negated by iu_psr_bm8.

assign  icu_miss =  (!qual_iu_psr_ice |iu_psr_bm8 | (!icu_hit) )
		    & ic_idle & !valid_diag_c&!fourth_fill_cyc_d1&!nc_fill_cyc_d1&!ic_drty;

// we latch on a miss or if there is a diagnostic rd/wr in c stage. we dont
// want to latch that address, as it is not in the instruction code flow.

// Note: latch_biu_addr means close biu_addr register. We use !latch_biu_addr
//       to latch the new icu_addr. So icu_miss is removed.


assign	fill_word_addr[1] = ic_miss_state[4] | ic_miss_state[5];
assign	fill_word_addr[0] = ic_miss_state[3] | ic_miss_state[5];

assign latch_biu_addr =   valid_diag_c | !ic_idle  ;

assign	normal_ack = biu_icu_ack[0] & !biu_icu_ack[1] ;
assign	error_ack  = biu_icu_ack[1] ;
assign  bypass_ack = normal_ack | error_ack;

// Delay ic_drty by one clock, as data

mj_s_ff_s_d  ic_drty_reg (	.out(ic_drty),
				.in(biu_icu_ack[1]),
                      		.clk(clk)
				);

// Delay ic_miss_state[2] by one clock to qualify icu_req 


mj_s_ff_snr_d  diag_ld_cache_c_reg (	.out(diag_ld_cache_c),
                        		.in(diag_ld_cache_e),
                        		.clk(clk),
                        		.reset_l(reset_l)
					);

mj_s_ff_snr_d  valid_diag_c_reg (	.out(valid_diag_c),
					.in(valid_diag_e),
					.clk(clk),
					.reset_l(reset_l)
					);

mj_s_ff_s_d  reset_reg (	.out(reset_d1_l),
	                        .in(reset_l),
	                        .clk(clk)
				);


// Generation of Mux selects
// Decreasing Priority for address buses
// 1. Reset 
// 2. Cache fill
// 3. Valid Diagnostic in E stage
// 4. Stalled branch/Trap pc
// 5. trap/branch 
// 6. ibuffer full
// 7. next sequential pc

// Select br_pc or next_addr. if I$ miss handling in progress, branch gets
// lower priority.
assign	icu_addr_sel[1]	=  jmp_e&(ic_idle&reset_d1_l);
assign	icu_addr_sel[0]	= ~icu_addr_sel[1];

// Mux used to latch the next sequential addr or branch addr.
assign	addr_reg_sel[1]	=  jmp_e;
assign	addr_reg_sel[0]	=  ~jmp_e;	

// used to latch branch addr or next sequential addr.
// latch contents if standby,ibuffer is full or diagnostic ld/st or I$ miss when I$ is On.
// we reissue the addr after fill is done. For noncacheable, the data is directly given to
// ibuffer.
assign	addr_reg_enable =  jmp_e | !( standby_d1|ibuf_full|valid_diag_window | !ic_idle |icu_miss |
				stall_valid | fourth_fill_cyc_d1);

// select cache fill address for reset or when not in idle mode
// select iu_addr_e for diagnostic rd/wr
// reissue addr for branch pending,ibuffer full, for cycle after cache misses,or valid diagnostic.
// else next addr.
// note: diagnostics in E and C freeze the fetch pipe.once the diagnostic rd/wr is done,we continue
// with the same fetch in C

assign	next_addr_sel[3] = ~reset_d1_l | !ic_idle ;
assign	next_addr_sel[2] = valid_diag_e&ic_idle&reset_d1_l;
assign	next_addr_sel[1] = (stall_valid|ibuf_full| fourth_fill_cyc_d1|valid_diag_c)&reset_d1_l&ic_idle&~valid_diag_e;
assign	next_addr_sel[0] = ~stall_valid&~ibuf_full&reset_d1_l&ic_idle&~valid_diag_e&~fourth_fill_cyc_d1;


assign  biu_addr_sel[1]  = ic_miss_state[2]|(ic_idle&cacheable);
assign  biu_addr_sel[0]  = !(ic_miss_state[2]|(ic_idle&cacheable));


// Generation of Stall valid 
// When a branch is taken or trap occurs and icache is busy doing a cache fill,
// we stall the branch till the fill is done and then the branch is taken.
// to keep track of the jump, we use signal stall_valid

// Generation of standby_d1:
// If Powerdown occurs at idle state, after powerdown ends 
// the state machine enters idle state again, The assertion of !icu_stall 
// should be inhibited by asserting set_stall because no valid data is available.   
// 
// However if powerdown occurs on executing goto within a line , then
// after powerdown ends the state machine enters idle state and generates 
// !icu_stall because the pending goto has a hit. 
// The assertion of !icu_stall should NOT be inhibited for this case.   


mj_s_ff_s_d  standby_d1_reg (	.out(standby_d1),
                                .in(icu_in_powerdown),
                                .clk(clk)
				);

assign	set_stall =  (iu_brtaken_e) & !ic_idle | 
                     (stall_valid & !ic_idle);

// Generation of miss due to branch or trap

mj_s_ff_snr_d  set_stall_reg (	.out(stall_valid),
			        .in(set_stall),
			        .clk(clk),
			        .reset_l(reset_l)
				);

assign	jmp_e	= iu_brtaken_e;

// Select input to tag ram
// when there is data coming back from memory, select MAR for tag input
assign	icu_tag_sel = normal_ack | (ic_idle & !valid_diag_e) ;

// select input to inst ram
// when there is data coming back from memory, select biu data from data input
assign	ic_data_sel = normal_ack | error_ack ;


// Generation of Write Enables for RAMs/TAGs
// write to tags during the last cycle of cache fill or during diagnostic writes to tags
// we write to the tags in both the cycles. in the first cycle, we invalidate the
// tag. In the second cycle , we validate the tag. This way  we avoid wierd
// corner cases when part of new data has been written into and the transaction
// is cancelled due to diagnostic wr/rd or error acks.

assign	icu_itag_we	=  cache_fill_cyc |  diag_st_tag_e | qual_iu_flush_e;
assign	icu_ram_we[1]	=  ((ic_miss_state[2]|ic_miss_state[4]) & normal_ack) |
                           (diag_st_cache_e & !misc_wrd_sel);
assign	icu_ram_we[0]	=  ((ic_miss_state[3]|ic_miss_state[5]) & normal_ack) |
			   (diag_st_cache_e & misc_wrd_sel);
wire    icu_bypass      =  ic_miss_state[1] | error_ack;

mj_s_ff_s_d  icu_bypass_reg (	.out(icu_bypass_q),
                                .in(icu_bypass),
                                .clk(clk)
				);


// Generation of Valid bit for Tags
// valid bit set whenever cache fill is done or during a diagnostic write .
assign	icu_tag_vld 	=  ((ic_miss_state[5] & normal_ack) | diag_st_tag_e & iu_data_e_0)& !qual_iu_flush_e ;

// Generation of icu_stall signal
// icu_stall becomes high if
//   . or if there's an i$ miss 
//   . or if i$ is not idle and the first fill data is not back yet
// * or if there is an outstanding branch/trap and
// 	or if there is a valid diagnostic in C stage and 1 clock after reset.(no valid data)


wire           valid_diag_window_d1;

mj_s_ff_s_d  valid_diag_window_flop (	.out(valid_diag_window_d1),
		                        .in(valid_diag_window),
		                        .clk(clk)
					);

// no valid data on cache miss or during cache miss transaction. but,during nc accesses, when data
// is back, we accept it even if cache miss is indicated. Also, for cache misses when the Icache is
// ON, when the data is written into the I$, the last cycle is ignored(fourth_fill_cyc_d1).bcos,
// the addr is issued again and the correct data is available a cycle later.

assign icu_stall = (icu_miss )| (!ic_idle| valid_diag_window | stall_valid | ibuf_full | standby_d1 
			|!reset_d1_l | fourth_fill_cyc_d1);
			


// For generation of icu_stall (signal which informs ibuffer that data on bus to ibuffer is invalid)
// we need to generate a signal fourth_fill_cyc_d1 which indicates that the  fourth word being 
// written into the icache in this cycle. Thus, any hit obtained due to this 
// new write is nullified and thus icu_stall remains valid.

mj_s_ff_snr_d  nc_fill_cyc_flop (	.out(nc_fill_cyc_d1),
					.in(nc_fill_cyc&~stall_valid),
					.clk(clk),
					.reset_l(reset_l)
					);

mj_s_ff_snr_d  fourth_fill_cyc_flop (	.out(fourth_fill_cyc_d1),
					.in(fourth_fill_cyc&~stall_valid),
					.clk(clk),
					.reset_l(reset_l)
					);

/************** ICACHE  MISS STATE MACHINE ******************/

assign          ic_idle         = ic_miss_state[0];
assign          nc_req          = ic_miss_state[1];
assign          icu_req         = ic_miss_state[1] | ic_miss_state[2];
assign          ic_req          = ic_miss_state[2]|ic_miss_state[3]|ic_miss_state[4]|
				  ic_miss_state[5];


assign		second_fill_cyc	= (ic_miss_state[3] & (normal_ack | error_ack));

assign		third_fill_cyc	= (ic_miss_state[4] & (normal_ack | error_ack));

assign		fourth_fill_cyc	= (ic_miss_state[5] & (normal_ack | error_ack));

assign		nc_fill_cyc	= ic_miss_state[1] & (normal_ack | error_ack) ;

assign		cache_fill_cyc  = (ic_miss_state[2]|ic_miss_state[3]|ic_miss_state[4]|
                                   ic_miss_state[5]) & (normal_ack | error_ack);

assign		icu_type[0]	= 1'b0;	// always a load
assign		icu_type[1]	= ic_miss_state[1];// noncacheable if icache turned off
assign		icu_type[2]	= 1'b0;		// for icache req - 0
assign		icu_type[3]     = 1'b0;		// for icache req = 0

assign		icu_size[0]     = 1'b0;
assign		icu_size[1]     = !iu_psr_bm8;

assign 		cacheable       = qual_iu_psr_ice & !iu_psr_bm8;

   
//assign  next_miss_state[6:0]    =       miss_state( ic_miss_state[6:0],
//					valid_diag_window,
 //                                       icu_miss,
  //                                      normal_ack,
//                                        cacheable,
//                                        error_ack,
//					pcsu_powerdown,
//					jmp_e,
//                                        ibuf_full);

miss_state miss_state(clk,	valid_diag_window,
                                          icu_miss,
                                          normal_ack,
                                          cacheable,
                                          error_ack,
  					pcsu_powerdown,
  					jmp_e,
                                          ibuf_full, reset_l, ic_miss_state); 


// triquest state_vector {ic_miss_state[6:1] ic_miss_state[0]} ICU_MISS_STATE enum ICU_MISS_STATE_ENUM
//always @(posedge clk)
//  if (~reset_l)
//    ic_miss_state = 7'b0000001;
//  else
//    ic_miss_state = next_miss_state;
always @ (posedge clk)
	tmp_ic_miss_state <= ic_miss_state;

initial tmp_ic_miss_state = 7'b0000001;

//HIMANSHU
//tmp_ic_miss_state  is like current state 
//ic_miss_state is next state

mj_s_ff_s_d  ic_idle_d1_reg (	.out(ic_idle_d1),
			        .in(ic_idle),
			        .clk(clk)
				);

// **************************************************************
//
// Power Down Feature for ICU: 
//
// Most RAM cells have a pin to disable all functions
// except for the retaining of data in order to reduce
// power consumption.
//
// Normal Power Down Mode:
//
// ICU enters the normal power down state
// when ICU is waiting for NC data or the missed data.
// A signal, icram_powerdown is asserted in this state and
// the state remains unchanged until normal_ack returns or
// valid_diag_e occurs.
//
// As an option, the signal, icram_powerdown can be
// connected to a powerdown pin of the RAM megacell.
//
// Standby Power Down Mode:
//
// State machine enters the standby power down state
// after PCSU asserts pcsu_powerdown signals and ICU
// completes the pending access.
// In this state,  a signal, icu_in_powerdown will be
// asserted to PCSU. Then PCSU shuts off the clock to ICU.
//
// Notes:
//
//   1. The powerdown pin is a registered input to RAM cell.
//
//   2. The powerdown signal should be set up before the 
//      rising edge of the clock.
//          
//   3. All inputs except powerdown signal are ignored during
//      the powerdown mode.
// Diagram:
//                    ______        ______        ______
//   clk       ______/      \______/      \______/      \_
//                                             
//                                        Tsetup | Thold
//                  _________________________    | 
//   powerdown ____/                         \____________
//				                 |
//   inputs    _____________________________  _____  ____
//                     Ignored              \/valid\/
//             _____________________________/\_____/\____
//
// **************************************************************

assign icram_powerdown = !ic_idle & !normal_ack & !valid_diag_window;
assign icu_in_powerdown = ic_miss_state[6] & !jmp_e;


//   assert property (tmp_ic_miss_state==7'b0000001 | tmp_ic_miss_state==7'b0000010 | tmp_ic_miss_state==7'b0000100 | tmp_ic_miss_state==7'b0001000 | tmp_ic_miss_state==7'b0010000 | tmp_ic_miss_state==7'b0100000 | tmp_ic_miss_state==7'b1000000 |  tmp_ic_miss_state==7'b0000000 );
//   assert property (tmp_ic_miss_state==7'b0000001 | tmp_ic_miss_state==7'b0000010 | (tmp_ic_miss_state==7'b0000100  && (ic_miss_state==7'b0001000 | ic_miss_state==7'b0000001 | ic_miss_state==7'b0000000 | ic_miss_state==7'b0000100))| tmp_ic_miss_state==7'b0001000 | tmp_ic_miss_state==7'b0010000 | tmp_ic_miss_state==7'b0100000 | tmp_ic_miss_state==7'b1000000 |  tmp_ic_miss_state==7'b0000000 );
always @(posedge clk) begin
   assert((tmp_ic_miss_state==7'b0000100  && (ic_miss_state==7'b0001000 | ic_miss_state==7'b0000001 | ic_miss_state==7'b0000000 | ic_miss_state==7'b0000100)) | ~(tmp_ic_miss_state==7'b0000100));
end
//   assert property ((tmp_ic_miss_state==7'b0000001  && (ic_miss_state==7'b0000000 | ic_miss_state==7'b0000001 | ic_miss_state==7'b0000010   | ic_miss_state==7'b0000100 | ic_miss_state==7'b1000000)) | ~(tmp_ic_miss_state==7'b00000001));
   

//always begin
//assert property3 (tmp_ic_miss_state==7'b0000001 | tmp_ic_miss_state==7'b0000010 | (tmp_ic_miss_state==7'b0000100  && (ic_miss_state==7'b0001000 | ic_miss_state==7'b0000001 | ic_miss_state==7'b0000000))| tmp_ic_miss_state==7'b0001000 | tmp_ic_miss_state==7'b0010000 | tmp_ic_miss_state==7'b0100000 | tmp_ic_miss_state==7'b1000000|  tmp_ic_miss_state==7'b0000000);
//end

endmodule // ic_cntl




//function [6:0] 	miss_state ;

module miss_state (clk, valid_diag_window, icu_miss, normal_ack, cacheable, error_ack, pcsu_powerdown, jmp_e, ibuf_full, reset_l, miss_state_output);
//input   [6:0]  	cur_state ;
input		valid_diag_window;
input          	icu_miss ;
input          	normal_ack;
input          	cacheable ;
input          	error_ack ;
input          	pcsu_powerdown;
input           jmp_e;
input           ibuf_full;

input clk;
//reg     [6:0]  	miss_state_output;
input reset_l;

output [6:0]  miss_state_output;
reg [6:0]  miss_state_output;
initial miss_state_output =  7'b0000001;

// State Encoding
parameter // triquest enum ICU_MISS_STATE_ENUM
        IDLE            = 7'b0000001,
	NC_REQ_STATE	= 7'b0000010,
        REQ_STATE       = 7'b0000100,
        FILL_2ND_WD     = 7'b0001000,
        REQ_STATE2      = 7'b0010000,
        FILL_4TH_WD     = 7'b0100000,
        STANDBY_PWR_DN  = 7'b1000000; 


always @ (posedge clk)
 if (~reset_l)
    miss_state_output = 7'b0000001;
  else	
	case    (miss_state_output)     // synopsys parallel_case
        IDLE:   begin
                if (pcsu_powerdown & !jmp_e & !valid_diag_window) begin
                miss_state_output = STANDBY_PWR_DN;
                end
                else if (valid_diag_window | ibuf_full | jmp_e) begin
                miss_state_output = miss_state_output;
                end
                else if(icu_miss&!cacheable) begin
                miss_state_output = NC_REQ_STATE ;
                end
		else if (icu_miss&cacheable) begin
		miss_state_output = REQ_STATE;
		end
                else    miss_state_output = miss_state_output ;
        end

	NC_REQ_STATE: begin
                if(normal_ack| error_ack) begin
                miss_state_output = IDLE ;
                end
                else    miss_state_output = miss_state_output ;
        end

        REQ_STATE: begin
                if (normal_ack) begin
                miss_state_output = FILL_2ND_WD;
                end
                else if (error_ack) begin
                miss_state_output = IDLE ;
                end
                else miss_state_output = miss_state_output ;
 	end
 
        FILL_2ND_WD: begin
                if(normal_ack) begin
                miss_state_output = REQ_STATE2;
                end
                else if (error_ack) begin
                miss_state_output = IDLE ;
                end
                else miss_state_output = miss_state_output ;
        end

        REQ_STATE2: begin
                if(normal_ack) begin
                miss_state_output = FILL_4TH_WD;
                end
                else if (error_ack) begin
                miss_state_output = IDLE ;
                end
                else miss_state_output = miss_state_output ;
        end

        FILL_4TH_WD: begin
                if(normal_ack| error_ack) begin
                miss_state_output = IDLE;
                end
                else miss_state_output = miss_state_output ;
        end

        STANDBY_PWR_DN: begin
                if(!pcsu_powerdown | jmp_e ) begin
                miss_state_output = IDLE;
                end
                else miss_state_output = STANDBY_PWR_DN;
        end

        default:        miss_state_output = 7'b0;

endcase
//miss_state = miss_state_output ;
//end
endmodule
//endfunction // miss_state






module ibuf_ctl (

	ic_drty,
	icu_stall,
	ibuf_enable,
	ic_dout_sel,
	icu_vld_d,
	icu_drty_d,
	ibuf_full,
	iu_shift_d,
	encod_shift_e,
	icu_addr_2_0,
	ibuf_pc_sel,
	reset_l,
	jmp_e,
	valid,
	iu_psr_bm8,
	icu_bypass_q,
	clk
);

input		ic_drty;		// This bit tells that data from Icache is 	-- From iu
					// dirty
input		icu_stall;		// Ecache miss signal				-- From iu
output	[11:0]	ic_dout_sel;		// These selects will select one of the eight 	-- To ibuff
					// bytes from bypass/icache to ibuffer
					// Icache or following buffers in ibuffer
output	[6:0]	icu_vld_d;		// Valid outputs from the first 5 locations	-- To iu
output	[6:0]	icu_drty_d;		// Dirty outputs from the first 5 locations     -- To iu
output		ibuf_full;		// This tells that Ibuffer is full		-- To iu
input	[7:0]	iu_shift_d;		// This tells how many times data should be	-- From iu
					// shifted
output	[2:0]	encod_shift_e;		// Encoded value of iu_shft_e to be used in ibuffer for
					// calculating the value of the address of the first
					// datum in the ibuffer
input	[2:0]	icu_addr_2_0;		// The lower 3 bits of the PC			-- From iu
output	[1:0]	ibuf_pc_sel;		// This will select either the seq. pc or br pc -- To Ibuffer
output		ibuf_enable;
output	[15:0]	valid;			// Valid bits of ibuffer entries
input		reset_l;
input		jmp_e;
input		iu_psr_bm8;             // 8 bit boot code enable from IU               -- From iu
input		icu_bypass_q;
input		clk;

wire	[3:0]	ic_dout_sel_ext;
wire	[15:0]	dirty;
wire	[15:0]	new_valid;
wire	[15:0]	new_dirty;
wire	[15:0]	buf_ic_valid;
wire	[15:0]	buf_ic_drty;
wire		ibuf_en;
wire		squash_vld;
wire	[15:0]	ic_fill_sel;

assign	ibuf_enable =  !icu_stall |!iu_shift_d[0];
assign	ibuf_en	    =  !icu_stall | !iu_shift_d[0] | jmp_e;




ibuf_ctl_slice	ibuf_ctl_0 (.valid_bits(buf_ic_valid[7:1]),
			.dirty_bits(buf_ic_drty[7:1]),
			.shft_dsel(iu_shift_d[7:0]),
			.valid_out(valid[0]),
			.dirty_out(dirty[0]),
			.buf_ic_drty(buf_ic_drty[0]),
			.buf_ic_valid(buf_ic_valid[0]),
			.jmp_e	(jmp_e),
			.ibuf_en(ibuf_en),
			.icu_stall(icu_stall),
			.fill_sel(ic_fill_sel[0]),
			.new_valid(new_valid[0]),
			.new_dirty(new_dirty[0]),
			.reset_l(reset_l),
			.clk(clk));
			
ibuf_ctl_slice	ibuf_ctl_1 (.valid_bits(buf_ic_valid[8:2]),
			.dirty_bits(buf_ic_drty[8:2]),
			.shft_dsel(iu_shift_d[7:0]),
			.valid_out(valid[1]),
			.dirty_out(dirty[1]),
			.buf_ic_drty(buf_ic_drty[1]),
			.buf_ic_valid(buf_ic_valid[1]),
			.icu_stall(icu_stall),
			.jmp_e	(jmp_e),
			.ibuf_en(ibuf_en),
			.fill_sel(ic_fill_sel[1]),
			.new_valid(new_valid[1]),
			.new_dirty(new_dirty[1]),
			.reset_l(reset_l),
			.clk(clk));

ibuf_ctl_slice  ibuf_ctl_2 (.valid_bits(buf_ic_valid[9:3]),
                        .dirty_bits(buf_ic_drty[9:3]),
                        .shft_dsel(iu_shift_d[7:0]),
			.ibuf_en(ibuf_en),
                        .valid_out(valid[2]),
			.icu_stall(icu_stall),
                        .dirty_out(dirty[2]),
			.buf_ic_drty(buf_ic_drty[2]),
			.buf_ic_valid(buf_ic_valid[2]),
			.fill_sel(ic_fill_sel[2]),
			.jmp_e	(jmp_e),
                        .new_valid(new_valid[2]),
                        .new_dirty(new_dirty[2]),
                        .reset_l(reset_l),
                        .clk(clk));

ibuf_ctl_slice  ibuf_ctl_3 (.valid_bits(buf_ic_valid[10:4]),
                        .dirty_bits(buf_ic_drty[10:4]),
                        .shft_dsel(iu_shift_d[7:0]),
                        .valid_out(valid[3]),
                        .dirty_out(dirty[3]),
			.buf_ic_drty(buf_ic_drty[3]),
			.buf_ic_valid(buf_ic_valid[3]),
			.ibuf_en(ibuf_en),
			.fill_sel(ic_fill_sel[3]),
			.icu_stall(icu_stall),
			.jmp_e	(jmp_e),
                        .new_valid(new_valid[3]),
                        .new_dirty(new_dirty[3]),
                        .reset_l(reset_l),
                        .clk(clk));

ibuf_ctl_slice  ibuf_ctl_4 (.valid_bits(buf_ic_valid[11:5]),
                        .dirty_bits(buf_ic_drty[11:5]),
                        .shft_dsel(iu_shift_d[7:0]),
                        .valid_out(valid[4]),
                        .dirty_out(dirty[4]),
			.buf_ic_drty(buf_ic_drty[4]),
			.buf_ic_valid(buf_ic_valid[4]),
			.jmp_e	(jmp_e),
			.fill_sel(ic_fill_sel[4]),
			.icu_stall(icu_stall),
			.ibuf_en(ibuf_en),
                        .new_valid(new_valid[4]),
                        .new_dirty(new_dirty[4]),
                        .reset_l(reset_l),
                        .clk(clk));

ibuf_ctl_slice  ibuf_ctl_5 (.valid_bits(buf_ic_valid[12:6]),
                        .dirty_bits(buf_ic_drty[12:6]),
                        .shft_dsel(iu_shift_d[7:0]),
                        .valid_out(valid[5]),
                        .dirty_out(dirty[5]),
			.buf_ic_drty(buf_ic_drty[5]),
			.buf_ic_valid(buf_ic_valid[5]),
			.jmp_e	(jmp_e),
			.icu_stall(icu_stall),
			.fill_sel(ic_fill_sel[5]),
                        .new_valid(new_valid[5]),
			.ibuf_en(ibuf_en),
                        .new_dirty(new_dirty[5]),
                        .reset_l(reset_l),
                        .clk(clk));

ibuf_ctl_slice  ibuf_ctl_6 (.valid_bits(buf_ic_valid[13:7]),
                        .dirty_bits(buf_ic_drty[13:7]),
                        .shft_dsel(iu_shift_d[7:0]),
                        .valid_out(valid[6]),
                        .dirty_out(dirty[6]),
			.buf_ic_drty(buf_ic_drty[6]),
			.buf_ic_valid(buf_ic_valid[6]),
                        .new_valid(new_valid[6]),
			.jmp_e	(jmp_e),
			.icu_stall(icu_stall),
			.ibuf_en(ibuf_en),
			.fill_sel(ic_fill_sel[6]),
                        .new_dirty(new_dirty[6]),
                        .reset_l(reset_l),
                        .clk(clk));

ibuf_ctl_slice  ibuf_ctl_7 (.valid_bits(buf_ic_valid[14:8]),
                        .dirty_bits(buf_ic_drty[14:8]),
                        .shft_dsel(iu_shift_d[7:0]),
                        .valid_out(valid[7]),
                        .dirty_out(dirty[7]),
			.buf_ic_drty(buf_ic_drty[7]),
			.buf_ic_valid(buf_ic_valid[7]),
			.jmp_e	(jmp_e),
			.ibuf_en(ibuf_en),
			.icu_stall(icu_stall),
			.fill_sel(ic_fill_sel[7]),
                        .new_valid(new_valid[7]),
                        .new_dirty(new_dirty[7]),
                        .reset_l(reset_l),
                        .clk(clk));

ibuf_ctl_slice  ibuf_ctl_8 (.valid_bits(buf_ic_valid[15:9]),
                        .dirty_bits(buf_ic_drty[15:9]),
                        .shft_dsel(iu_shift_d[7:0]),
                        .valid_out(valid[8]),
                        .dirty_out(dirty[8]),
			.buf_ic_drty(buf_ic_drty[8]),
			.buf_ic_valid(buf_ic_valid[8]),
			.jmp_e	(jmp_e),
			.ibuf_en(ibuf_en),
			.icu_stall(icu_stall),
			.fill_sel(ic_fill_sel[8]),
                        .new_valid(new_valid[8]),
                        .new_dirty(new_dirty[8]),
                        .reset_l(reset_l),
                        .clk(clk));

ibuf_ctl_slice  ibuf_ctl_9 (.valid_bits({1'b0,buf_ic_valid[15:10]}),
                        .dirty_bits({1'b0,buf_ic_drty[15:10]}),
                        .shft_dsel(iu_shift_d[7:0]),
                        .valid_out(valid[9]),
			.jmp_e	(jmp_e),
			.fill_sel(ic_fill_sel[9]),
			.ibuf_en(ibuf_en),
			.icu_stall(icu_stall),
                        .dirty_out(dirty[9]),
			.buf_ic_drty(buf_ic_drty[9]),
			.buf_ic_valid(buf_ic_valid[9]),
                        .new_valid(new_valid[9]),
                        .new_dirty(new_dirty[9]),
                        .reset_l(reset_l),
                        .clk(clk));

ibuf_ctl_slice  ibuf_ctl_10 (.valid_bits({2'b0,buf_ic_valid[15:11]}),
                        .dirty_bits({2'b0,buf_ic_drty[15:11]}),
                        .shft_dsel(iu_shift_d[7:0]),
                        .valid_out(valid[10]),
                        .dirty_out(dirty[10]),
			.buf_ic_drty(buf_ic_drty[10]),
			.buf_ic_valid(buf_ic_valid[10]),
			.fill_sel(ic_fill_sel[10]),
			.jmp_e	(jmp_e),
			.icu_stall(icu_stall),
                        .new_valid(new_valid[10]),
			.ibuf_en(ibuf_en),
                        .new_dirty(new_dirty[10]),
                        .reset_l(reset_l),
                        .clk(clk));

ibuf_ctl_slice  ibuf_ctl_11 (.valid_bits({3'b0,buf_ic_valid[15:12]}),
                        .dirty_bits({3'b0,buf_ic_drty[15:12]}),
                        .shft_dsel(iu_shift_d[7:0]),
                        .valid_out(valid[11]),
                        .dirty_out(dirty[11]),
			.buf_ic_drty(buf_ic_drty[11]),
			.buf_ic_valid(buf_ic_valid[11]),
			.jmp_e	(jmp_e),
			.fill_sel(ic_fill_sel[11]),
			.icu_stall(icu_stall),
			.ibuf_en(ibuf_en),
                        .new_valid(new_valid[11]),
                        .new_dirty(new_dirty[11]),
                        .reset_l(reset_l),
                        .clk(clk));

ibuf_ctl_slice  ibuf_ctl_12 (.valid_bits({4'b0,buf_ic_valid[15:13]}),
                        .dirty_bits({4'b0,buf_ic_drty[15:13]}),
                        .shft_dsel(iu_shift_d[7:0]),
                        .valid_out(valid[12]),
                        .dirty_out(dirty[12]),
			.buf_ic_drty(buf_ic_drty[12]),
			.buf_ic_valid(buf_ic_valid[12]),
			.jmp_e	(jmp_e),
			.fill_sel(ic_fill_sel[12]),
			.icu_stall(icu_stall),
			.ibuf_en(ibuf_en),
                        .new_valid(new_valid[12]),
                        .new_dirty(new_dirty[12]),
                        .reset_l(reset_l),
                        .clk(clk));

ibuf_ctl_slice  ibuf_ctl_13 (.valid_bits({5'b0,buf_ic_valid[15:14]}),
                        .dirty_bits({5'b0,buf_ic_drty[15:14]}),
                        .shft_dsel(iu_shift_d[7:0]),
                        .valid_out(valid[13]),
                        .dirty_out(dirty[13]),
			.buf_ic_drty(buf_ic_drty[13]),
			.buf_ic_valid(buf_ic_valid[13]),
			.jmp_e	(jmp_e),
			.fill_sel(ic_fill_sel[13]),
			.icu_stall(icu_stall),
			.ibuf_en(ibuf_en),
                        .new_valid(new_valid[13]),
                        .new_dirty(new_dirty[13]),
                        .reset_l(reset_l),
                        .clk(clk));

ibuf_ctl_slice  ibuf_ctl_14 (.valid_bits({6'b0,buf_ic_valid[15]}),
                        .dirty_bits({6'b0,buf_ic_drty[15]}),
                        .shft_dsel(iu_shift_d[7:0]),
                        .valid_out(valid[14]),
                        .dirty_out(dirty[14]),
			.buf_ic_drty(buf_ic_drty[14]),
			.buf_ic_valid(buf_ic_valid[14]),
			.jmp_e	(jmp_e),
			.fill_sel(ic_fill_sel[14]),
			.icu_stall(icu_stall),
			.ibuf_en(ibuf_en),
                        .new_valid(new_valid[14]),
                        .new_dirty(new_dirty[14]),
                        .reset_l(reset_l),
                        .clk(clk));

ibuf_ctl_slice  ibuf_ctl_15 (.valid_bits(7'b0),
                        .dirty_bits(7'b0),
                        .shft_dsel(iu_shift_d[7:0]),
                        .valid_out(valid[15]),
                        .dirty_out(dirty[15]),
			.buf_ic_drty(buf_ic_drty[15]),
			.buf_ic_valid(buf_ic_valid[15]),
			.jmp_e	(jmp_e),
			.fill_sel(ic_fill_sel[15]),
			.icu_stall(icu_stall),
			.ibuf_en(ibuf_en),
                        .new_valid(new_valid[15]),
                        .new_dirty(new_dirty[15]),
                        .reset_l(reset_l),
                        .clk(clk));

// New Valid bits generated due to a cache fill

// Use dword_align to avoid filling a word to ibuf when
// the word is not double-word aligned at cache mode.


wire    dword_align  =  (icu_addr_2_0 == 3'b000);

assign	new_valid[0] =  1'b1;

assign	new_valid[1] =  ((!icu_bypass_q & !icu_addr_2_0[2]) | !(icu_addr_2_0[1] & icu_addr_2_0[0])
			 & !iu_psr_bm8)| (ic_fill_sel[0] & iu_psr_bm8);

assign	new_valid[2] =  (((!icu_bypass_q & !icu_addr_2_0[2]) | !icu_addr_2_0[1])
			 & !iu_psr_bm8)| (ic_fill_sel[1] & iu_psr_bm8);

assign	new_valid[3] =  (((!icu_bypass_q & !icu_addr_2_0[2])|(!icu_addr_2_0[1] & !icu_addr_2_0[0]))
                         & !iu_psr_bm8)| (ic_fill_sel[2] & iu_psr_bm8);

assign	new_valid[4] =  ((!icu_bypass_q & !icu_addr_2_0[2]) | 
                         (icu_bypass_q & ic_fill_sel[0] ) 
                         & !iu_psr_bm8) | ic_fill_sel[3];

assign	new_valid[5] =  ((!icu_bypass_q & (!icu_addr_2_0[2] & !(icu_addr_2_0[1] & icu_addr_2_0[0]))) |
                         (icu_bypass_q & ic_fill_sel[1] ) 
                         & !iu_psr_bm8) | ic_fill_sel[4];

assign	new_valid[6] =  ((!icu_bypass_q & !icu_addr_2_0[2] & !icu_addr_2_0[1]) |
                         (icu_bypass_q & ic_fill_sel[2] )
                         & !iu_psr_bm8) | ic_fill_sel[5];

assign	new_valid[7] =  (!icu_bypass_q & !icu_addr_2_0[2] & !icu_addr_2_0[1] & !icu_addr_2_0[0] |
                         icu_bypass_q & ic_fill_sel[3])
                         & !iu_psr_bm8 | ic_fill_sel[6];

assign	new_valid[8] =   !iu_psr_bm8 & (!icu_bypass_q & dword_align &ic_fill_sel[0]  |  
                          icu_bypass_q & ic_fill_sel[4] ) | ic_fill_sel[7]; 

assign	new_valid[9] =   !iu_psr_bm8 & (!icu_bypass_q & dword_align & ic_fill_sel[1] | 
                          icu_bypass_q & ic_fill_sel[5] );

assign	new_valid[10] =  !iu_psr_bm8 & (!icu_bypass_q & dword_align & ic_fill_sel[2] | 
                          icu_bypass_q & ic_fill_sel[6]); 

assign	new_valid[11] =  !iu_psr_bm8 & (!icu_bypass_q & dword_align & ic_fill_sel[3] | 
                          icu_bypass_q & ic_fill_sel[7]); 

assign	new_valid[12] =  !iu_psr_bm8 & (!icu_bypass_q & dword_align & ic_fill_sel[4] | 
                          icu_bypass_q & ic_fill_sel[8]); 

assign	new_valid[13] =  !iu_psr_bm8 & (!icu_bypass_q & dword_align & ic_fill_sel[5] | 
                          icu_bypass_q & ic_fill_sel[9]);

assign	new_valid[14] =  !iu_psr_bm8 & (!icu_bypass_q & dword_align & ic_fill_sel[6] | 
                          icu_bypass_q & ic_fill_sel[10]); 

assign	new_valid[15] =  !iu_psr_bm8 & (!icu_bypass_q & dword_align & ic_fill_sel[7] | 
                          icu_bypass_q & ic_fill_sel[11]); 

// new_dirty[x] will be one if:
//	. ic_dout_sel[x-1] is 1 and iu_psr_bm8 is 1 or
//	. ic_dout_sel[x:x-3] is 1 and !iu_psr_bm8

assign	new_dirty[0] = icu_bypass_q & ic_drty & ic_dout_sel[0];

assign	new_dirty[1] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel[0]) |
						(!iu_psr_bm8 & (|ic_dout_sel[1:0])) );

assign	new_dirty[2] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel[1]) |
						(!iu_psr_bm8 & (|ic_dout_sel[2:0])) );

assign	new_dirty[3] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel[2]) |
						(!iu_psr_bm8 & (|ic_dout_sel[3:0])) );

assign	new_dirty[4] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel[3]) |
						(!iu_psr_bm8 & (|ic_dout_sel[4:1])) );

assign	new_dirty[5] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel[4]) |
						(!iu_psr_bm8 & (|ic_dout_sel[5:2])) );

assign	new_dirty[6] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel[5]) |
						(!iu_psr_bm8 & (|ic_dout_sel[6:3])) );

assign	new_dirty[7] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel[6]) |
						(!iu_psr_bm8 & (|ic_dout_sel[7:4])) );

assign	new_dirty[8] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel[7]) |
						(!iu_psr_bm8 & (|ic_dout_sel[8:5])) );

assign	new_dirty[9] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel[8]) |
						(!iu_psr_bm8 & (|ic_dout_sel[9:6])) );

assign	new_dirty[10] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel[9]) |
						(!iu_psr_bm8 & (|ic_dout_sel[10:7])) );

assign	new_dirty[11] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel[10]) |
						(!iu_psr_bm8 & (|ic_dout_sel[11:8])) );

assign	new_dirty[12] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel[11]) |
						(!iu_psr_bm8 & (|ic_dout_sel[11:9] |
								ic_dout_sel_ext[0]) ));

assign	new_dirty[13] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel_ext[0]) |
						(!iu_psr_bm8 & (|ic_dout_sel[11:10] | 
								(|ic_dout_sel_ext[1:0]))) );

assign	new_dirty[14] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel_ext[1]) |
						(!iu_psr_bm8 & (ic_dout_sel[11] | 
								(|ic_dout_sel_ext[2:0]))) );

assign	new_dirty[15] = icu_bypass_q & ic_drty & ( (iu_psr_bm8 & ic_dout_sel_ext[2]) |
						(!iu_psr_bm8 & (|ic_dout_sel_ext[3:0])) );

// To locate the first location of cache fill.
// ex: ic_dout_sel[x] indicates the first byte of data from cache will be written into x location
// of ibuffer.
assign ic_dout_sel[0]  = !valid[0];
assign ic_dout_sel[1]  = valid[0]&!valid[1] ;
assign ic_dout_sel[2]  = valid[1]&!valid[2] ;
assign ic_dout_sel[3]  = valid[2]&!valid[3] ;
assign ic_dout_sel[4]  = valid[3]&!valid[4] ;
assign ic_dout_sel[5]  = valid[4]&!valid[5] ;
assign ic_dout_sel[6]  = valid[5]&!valid[6] ;
assign ic_dout_sel[7]  = valid[6]&!valid[7] ;
assign ic_dout_sel[8]  = valid[7]&!valid[8] ;
assign ic_dout_sel[9]  = valid[8]&!valid[9] ;
assign ic_dout_sel[10] = valid[9]&!valid[10] ;
assign ic_dout_sel[11] = valid[10]&!valid[11] ;
assign ic_dout_sel_ext[0] = valid[11]&!valid[12] ;
assign ic_dout_sel_ext[1] = valid[12]&!valid[13] ;
assign ic_dout_sel_ext[2] = valid[13]&!valid[14] ;
assign ic_dout_sel_ext[3] = valid[14]&!valid[15] ;

// Generate ibuf_full signal:
//

// mj_h_mux8  ibuf_full_mux1 (	.mx_out(curr_valid_bit),
//				.in0(valid[8]),
//				.in1(valid[9]),
//				.in2(valid[10]),
//				.in3(valid[11]),
//				.in4(valid[12]),
//				.in5(valid[13]),
//				.in6(valid[14]),
//				.in7(valid[15]),
//				.sel(iu_shift_d[7:0]),
//				.sel_l(~iu_shift_d[7:0])
//				);
//
// wire    curr_valid_bit_bypass;
//
// mj_h_mux8  ibuf_full_mux2 (	.mx_out(curr_valid_bit_bypass),
//				.in0(valid[12]),
//				.in1(valid[13]),
//				.in2(valid[14]),
//				.in3(valid[15]),
//				.in4(1'b0),
//				.in5(1'b0),
//				.in6(1'b0),
//				.in7(1'b0),
//				.sel(iu_shift_d[7:0]),
//				.sel_l(~iu_shift_d[7:0])
//				);

// Single byte mode is not optimized for performance
// To simplify the design, ibuf_full is asserted when
// when ibuffer is half full at boot mode.

// assign ibuf_full  = (curr_valid_bit_bypass | 
//                     (!icu_bypass_q & curr_valid_bit & icu_hit) |
//                     (iu_psr_bm8 & curr_valid_bit) ) & !squash_vld;

ff_sr	squash_vld_reg(.out(squash_vld),
			.din(jmp_e),
			.clk(clk),
			.reset_l(reset_l));

 assign ibuf_full  = (valid[12]|(!icu_bypass_q|iu_psr_bm8) & valid[8]) & !squash_vld;

// Generate  icu_vld_d and icu_drty_d outputs

assign icu_vld_d[6:0] = valid[6:0] ; 
assign icu_drty_d[6:0] = dirty[6:0];


// Generate encod_shift_e, instead of encod_shift_d
// to improve timing for the path shift 

wire [7:0] iu_shift_e;

mj_s_ff_snr_d_8 iu_shift_e_reg (	.out(iu_shift_e[7:0]),
				        .din(iu_shift_d[7:0]),
				        .clk(clk),
			        	.reset_l(reset_l)
					);

wire [2:0] encod_shift_e;

encode_shift_module i_encode_shift_module
                    (.iu_shift_e(iu_shift_e),
		     .encod_shift_e(encod_shift_e)
                    );

// Generate ibuf_pc_sel

assign ibuf_pc_sel[1]	=  squash_vld;
assign ibuf_pc_sel[0]	= !squash_vld;



endmodule // ibuf_ctl


module encode_shift_module( iu_shift_e, encod_shift_e); 

input [7:0] iu_shift_e;
output [2:0] encod_shift_e;

assign encod_shift_e =
 (iu_shift_e == 8'b00000000 | iu_shift_e == 8'b00000001) ? 3'b000 :
    (iu_shift_e == 8'b00000010) ? 3'b001 :
    (iu_shift_e == 8'b00000100) ? 3'b010 :
    (iu_shift_e == 8'b00001000) ? 3'b011 :
    (iu_shift_e == 8'b00010000) ? 3'b100 :
   ( iu_shift_e == 8'b00100000) ? 3'b101 :
   ( iu_shift_e == 8'b01000000) ? 3'b110 :
  (  iu_shift_e == 8'b10000000) ? 3'b111 : 3'b000;


endmodule // encode_shift_module
		

/****************************************************************
***     This module defines one slice ibuffer control which will
***     be instantiated in the ibuffer control.
****************************************************************/

module ibuf_ctl_slice (

	valid_bits,
	dirty_bits,
	shft_dsel,
	valid_out,
	dirty_out,
	new_valid,
	icu_stall,
	fill_sel,
	ibuf_en,
	new_dirty,
	buf_ic_drty,
	buf_ic_valid,
	jmp_e,
	reset_l,
	clk
);

input	[6:0]	valid_bits;		// Valid bits from the following 7 buffers	-- From ibuf_ctl
input	[6:0]	dirty_bits;		// Dirty bits from the following 7 buffers	-- From ibuf_ctl
					// until Icache is accessed succesfully
input	[7:0]	shft_dsel;		// These selects will determine which of the    -- From ibuf_ctl
                                        // following 7 valid bits will be selected
					// The last bit indicates that it's a stall
input		jmp_e;
input		ibuf_en;
input		icu_stall;
output		fill_sel;
output		valid_out;		// Valid bit o/p
output		dirty_out;		// Dirty bit o/p
input		new_valid;		// Internal control signal
					// icache or follwoing 5 buffers
input		new_dirty;			// This indicates that Icache data is dirty	-- From iu
output		buf_ic_drty;
output		buf_ic_valid;
input		reset_l;
input		clk;

	
wire	valid_in;
wire	dirty_in;

// buf_ic_valid is one if either teh current ibuffer entry is valid
// or the icache entry into the current one is valid

assign buf_ic_valid = (valid_out | new_valid&!icu_stall);
assign buf_ic_drty = (dirty_out | new_dirty&!icu_stall);

mux8  valid_mux (	.out(valid_in),
			.in0(buf_ic_valid),
			.in1(valid_bits[0]),
			.in2(valid_bits[1]),
			.in3(valid_bits[2]),
			.in4(valid_bits[3]),
			.in5(valid_bits[4]),
			.in6(valid_bits[5]),
			.in7(valid_bits[6]),
			.sel(shft_dsel)
			);

mux8  dirty_mux (	.out(dirty_in),
			.in0(buf_ic_drty),	
			.in1(dirty_bits[0]),	
			.in2(dirty_bits[1]),	
			.in3(dirty_bits[2]),	
			.in4(dirty_bits[3]),	
			.in5(dirty_bits[4]),	
			.in6(dirty_bits[5]),	
			.in7(dirty_bits[6]),	
			.sel(shft_dsel)
			);

// If shifted bit is not 1
assign	fill_sel  =  valid_out ;

mj_s_ff_snre_d  valid_flop (	.out(valid_out),
				.in(valid_in&!jmp_e),
				.clk(clk),
				.reset_l(reset_l),
				.lenable(ibuf_en)
				);

mj_s_ff_snre_d  dirty_flop (	.out(dirty_out),
				.in(dirty_in&!jmp_e),
				.clk(clk),
				.reset_l(reset_l),
				.lenable(ibuf_en)
				);

endmodule // ibuf_ctl_slice


module ff_sr(out, din, reset_l, clk) ;
    output   out;
    input    din;
    input    clk;
    input    reset_l;
 
mj_s_ff_snr_d  mj_s_ff_snr_d_0 (        .out(out),
                                        .in(din),
                                        .reset_l(reset_l),
                                        .clk(clk)
                                        );
endmodule // ff_sr


module mj_s_ff_snre_d(out,in, lenable,reset_l, clk);
output out;
input clk;
input lenable;
input reset_l;
input in;

reg out;

initial out = 0;

always @(posedge clk)
        if (~reset_l) 
	out = 1'b0;
	else
    	if (lenable)
            out = in;
        else
            out = out;

endmodule // mj_s_ff_snre_d


module mj_s_ff_snr_d(out,in, reset_l, clk);
output out;
input clk;
input reset_l;
input in;

reg out;

initial out = 0;

always @(posedge clk)
        if (~reset_l)
            out = 1'b0;
        else
            out = in;

endmodule // mj_s_ff_snr_d


module mj_s_ff_s_d(out,in, clk);
output out;
input clk;
input in;

reg out;

initial out = 0;

always @(posedge clk)
            out = in;

endmodule // mj_s_ff_s_d


module mj_s_ff_snr_d_8 (out, din, reset_l,clk);
    output  [7:0]  out;
    input   [7:0]  din;
    input           clk;
    input           reset_l;

    mj_s_ff_snr_d    mj_s_ff_snr_d_0(.out(out[0]), .in(din[0]), .reset_l(reset_l),.clk(clk));
    mj_s_ff_snr_d    mj_s_ff_snr_d_1(.out(out[1]), .in(din[1]), .reset_l(reset_l),.clk(clk));
    mj_s_ff_snr_d    mj_s_ff_snr_d_2(.out(out[2]), .in(din[2]), .reset_l(reset_l),.clk(clk));
    mj_s_ff_snr_d    mj_s_ff_snr_d_3(.out(out[3]), .in(din[3]), .reset_l(reset_l),.clk(clk));
    mj_s_ff_snr_d    mj_s_ff_snr_d_4(.out(out[4]), .in(din[4]), .reset_l(reset_l),.clk(clk));
    mj_s_ff_snr_d    mj_s_ff_snr_d_5(.out(out[5]), .in(din[5]), .reset_l(reset_l),.clk(clk));
    mj_s_ff_snr_d    mj_s_ff_snr_d_6(.out(out[6]), .in(din[6]), .reset_l(reset_l),.clk(clk));
    mj_s_ff_snr_d    mj_s_ff_snr_d_7(.out(out[7]), .in(din[7]), .reset_l(reset_l),.clk(clk));

endmodule // mj_s_ff_snr_d_8


module mux8 (
    out,
    in7,
    in6,
    in5,
    in4,
    in3,
    in2,
    in1,
    in0,
    sel
    );

    output out;
    input in7;
    input in6;
    input in5;
    input in4;
    input in3;
    input in2;
    input in1;
    input in0;
    input [7:0] sel;

assign out =
    sel[7] ? in7 :
    sel[6] ? in6 :
    sel[5] ? in5 :
    sel[4] ? in4 :
    sel[3] ? in3 :
    sel[2] ? in2 :
    sel[1] ? in1 :
    sel[0] ? in0 : 1'b0;

endmodule // mux8


module ff_sre(out, din, enable, reset_l, clk) ;
    output   out;
    input    din;
    input    clk;
    input    reset_l;
    input    enable;
 
mj_s_ff_snre_d  mj_s_ff_snre_d_0 (      .out(out),
                                        .in(din), 
                                        .lenable(enable),
                                        .reset_l(reset_l),
                                        .clk(clk)
                                        );
endmodule // ff_sre
