//NOTE: no-implementation module stub

module BTB (
    input DSPCLK,
    input PPclr_h,
    input GO_F,
    input GO_D,
    input GO_Ex,
    input GO_Cx,
    input [4:0] IFA_nx,
    input [13:0] IFA,
    input [13:0] EXA,
    input Bterr_E,
    input [13:0] Taddr_E,
    input RTS_R,
    input RTS_Ed,
    input BR_Ed,
    input Ctrue,
    input TB_EN,
    input [25:0] BTB_rd,
    input [11:0] RTB_rd,
    `ifdef FD_DFT
    input SCAN_TEST,
    `endif
    input [4:0] BTB_ra,
    input [4:0] BTB_wa,
    input [25:0] BTB_wd,
    input BTB_web,
    input RTB_web,
    input BTaken_I,
    input RTaken_I,
    input PTaken_R,
    input PTaken_E
);

endmodule
