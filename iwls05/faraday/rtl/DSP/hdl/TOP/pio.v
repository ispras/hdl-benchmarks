//NOTE: no-implementation module stub

module PIO (
    `ifdef FD_EVB
    input PERICLK,
    `else
    input DSPCLK,
    `endif
    input GRST,
    input [15:0] DMDin,
    input [11:0] T_PIOin,
    input selPIMASK,
    input selPINT,
    input selPFTYPE,
    input selPDATA,
    input PIMASK_we,
    input PINT_we,
    input PFTYPE_we,
    input PDATA_we,
    input MMR_web,
    `ifdef FD_DFT
    input SCAN_TEST,
    `endif
    input T_IPIOn,
    output [15:0] PIO_do,
    output [11:0] PIO_oe,
    output [11:0] PIO_out
);

endmodule
