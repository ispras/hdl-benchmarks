//NOTE: no-implementation module stub

module SPORT1 (
    input T_RD1,
    input GRST,
    `ifdef FD_EVB
    input PERICLK,
    `else
    input DSPCLK,
    `endif
    input GO_Cx,
    input EX_en,
    input MTTX1_E,
    input MTRX1_E,
    input T1wrap,
    input R1wrap,
    input [15:0] DMDin,
    input SP1_EN,
    input selAUTO1,
    input selFSDIV1,
    input selSCLKDIV1,
    input selSCTL1,
    input selMWORD1,
    input AUTO1_we,
    input FSDIV1_we,
    input SCLKDIV1_we,
    input SCTL1_we,
    input MWORD1_we,
    input MMR_web,
    input T1Sack,
    input R1Sack,
    `ifdef FD_DFT
    input SCAN_TEST,
    `endif
    input TD1,
    input T_ISR1,
    input T_IST1,
    input [2:0] T1IREG,
    input [1:0] T1MREG,
    input [2:0] R1IREG,
    input [1:0] R1MREG,
    input T1Sreq,
    input R1Sreq,
    input [15:0] RX1,
    input [15:0] TX1,
    input [15:0] SPT1_do,
    input SCLK1,
    input T_SCLK1,
    input ISCLK1,
    input RFS1,
    input T_RFS1,
    input IRFS1,
    input TFS1,
    input T_TFS1,
    input ITFS1
);

endmodule
