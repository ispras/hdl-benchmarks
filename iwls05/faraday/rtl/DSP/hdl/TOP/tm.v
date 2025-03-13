//NOTE: no-implementation module stub

module TM (
    input T_CLKI,
    `ifdef FD_EVB
    input PERICLK,
    `else
    input DSPCLK,
    `endif
    input GRST,
    input TMODE,
    input [15:0] DMDin,
    input selTSCALE,
    input selTCOUNT,
    input selTPERIOD,
    input TSCALE_we,
    input TCOUNT_we,
    input TPERIOD_we,
    input MSTAT5,
    output [15:0] TMR_do,
    input MMR_web,
    input ICE_ST,
    `ifdef FD_DFT
    input SCAN_TEST,
    `endif
    input T_ITMR
);

endmodule
