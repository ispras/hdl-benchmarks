//NOTE: no-implementation module stub

module SPORT0 (
    input T_RD0,
    input GRST,
    `ifdef FD_EVB
    input PERICLK,
    `else
    input DSPCLK,
    `endif
    input GO_Cx,
    input EX_en,
    input MTTX0_E,
    input MTRX0_E,
    input T0wrap,
    input R0wrap,
    input [15:0] DMDin,
    input SP0_EN,
    input selAUTO0,
    input selFSDIV0,
    input selSCLKDIV0,
    input selSCTL0,
    input selMWORD0,
    input AUTO0_we,
    input FSDIV0_we,
    input SCLKDIV0_we,
    input SCTL0_we,
    input MWORD0_we,
    input MMR_web,
    input T0Sack,
    input R0Sack,
    `ifdef FD_DFT
    input SCAN_TEST,
    `endif
    input TD0,
    input T_ISR0,
    input T_IST0,
    input [2:0] T0IREG,
    input [1:0] T0MREG,
    input [2:0] R0IREG,
    input [1:0] R0MREG,
    input PDFORCE,
    input XTALDIS,
    input XTALDELAY,
    input PUCR,
    input T0Sreq,
    input R0Sreq,
    input [15:0] RX0,
    input [15:0] TX0,
    input [15:0] SPT0_do,
    input SCLK0,
    input T_SCLK0,
    input ISCLK0,
    input RFS0,
    input T_RFS0,
    input IRFS0,
    input TFS0,
    input T_TFS0,
    input ITFS0
);

endmodule
