//NOTE: no-implementation module stub

module SICE (
    input P_RSTn,
    `ifdef FD_EVB
    input T_ICKi,
    `else
    input T_ICK,
    `endif
    input T_IMS,
    `ifdef FD_EVB
    input CORECLK,
    `else
    input DSPCLK,
    `endif
    input [23:0] CM_rdata,
    input [15:0] DMDin,
    input T_GOICE,
    input PM_bdry_sel,
    input enTRAP_RL,
    input GO_F,
    input GO_E,
    input GO_C,
    input ICE_ST,
    input [13:0] DRA,
    input [13:0] EXA,
    input HALTclr_h,
    input GOICEclr_h,
    input GOICEdis,
    input [7:0] PMOVL_dsp,
    input [3:0] DMOVL_dsp,
    input [23:0] IR,
    input Dummy_R,
    input nNOP_Eg,
    input MTIDR_Eg,
    input SBP_R,
    input rdCM_E,
    input BGn,
    input [13:0] PMA,
    input [13:0] DMA,
    input EXTC_Eg,
    input accPM_Eg,
    input accDM_Eg,
    input eRDY,
    input BRST,
    input IACKn,
    `ifdef FD_DFT
    input SCAN_TEST,
    `endif
    input GRST,
    input GO_Fx,
    input GO_Ex,
    input GO_Cx,
    input HALT_Eg,
    input [13:0] IRR,
    input [23:0] IDR,
    input GOICE,
    input GOICE_syn,
    input ICE_wakeup,
    input Upd_IR,
    input [23:0] SPC,
    input SBP_EN,
    input enTYP3,
    input T_ID,
    input IDo,
    input IDoe,
    input EX_en,
    input selIVER,
    input [15:0] SICEmmio
);

endmodule
