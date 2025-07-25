//NOTE: no-implementation module stub

`include "lxr_symbols.vh"

module core_lmi (
    input wire SYSCLK,
    input wire TMODE,
    input wire SEN,
    input wire RESET_D1_R_N,
    input wire ISTALLIF,
    input wire X_HALT_R,
    input wire CLMI_JPTHOLD,
    input wire CLMI_HLREGHOLD,
    input wire CLMI_CE0HOLD,
    input wire CLMI_CE1HOLD,
    input wire CLMI_RHOLD,
    input wire CLMI_RLSHOLD,
    input wire CLMI_DLOAD,
    input wire IC_VAL_S,
    input wire IW_VAL_S,
    input wire IR_VAL_S,
    input wire IC_MISS_S_R,
    input wire IW_MISS_S_R,
    input wire IR_MISS_S_R,
    input wire DC_VAL_W,
    input wire DW_VAL_W,
    input wire DR_VAL_W,
    input wire DC_MISS_W_R,
    input wire DW_MISS_W_R,
    input wire DR_MISS_W_R,
    input wire CLMI_DBUSDIS,
    input wire CLMI_SEL_INSTSF_P
);
endmodule

module ejtag_datain (
    input wire [5:0] EJDI_ADDR,
    input wire [31:0] EJDI_DATA,
    input wire EJDI_RW,
    input wire EJDI_SELDCR,
    input wire EJDI_SELIBS,
    input wire EJDI_SELDBS,
    input wire EJDI_SELPBS,
    input wire EJDI_SELIBRS,
    input wire EJDI_SELDBRS,
    input wire EJDI_SELPBRS,
    input wire EJDI_SELDBG,
    input wire EJDI_SELPROBE,
    input wire [31:0] LBC_MDATA,
    input wire [31:0] LBC_MADDR,
    input wire LBC_MEJDEST,
    input wire LBC_MRW
);
endmodule

module ejtag_dmadata (
    input wire [31:0] EJDD_DATA,
    input wire [31:0] EJDD_ADDR,
    input wire [31:0] EJDD_CAPDATA,
    input wire [31:0] EJSN_DATA,
    input wire [31:0] EJSN_ADDR,
    input wire EJSN_UPDATEDATA,
    input wire EJSN_UPDATEADDR,
    input wire EJSN_UPDATECTL,
    input wire EJC_DMAACC,
    input wire EJC_DMAINC,
    input wire JTAG_CLOCK,
    input wire RESET_D1_JR_N,
    input wire CORE_CLOCK,
    input wire RESET_D1_R_N,
    input wire TMODE,
    input wire [31:0] LBC_EJDATA,
    input wire LBC_EVAL
);
endmodule

module ejtag_scan (
    input wire JTAG_ESCANOUT,
    input wire [31:0] EJSN_DATA,
    input wire [31:0] EJSN_ADDR,
    input wire [31:0] EJSN_CTL,
    input wire EJSN_UPDATEDATA,
    input wire EJSN_UPDATEADDR,
    input wire EJSN_UPDATECTL,
    input wire EJSN_PCTRACEON,
    input wire [4:0] JTAG_IR,
    input wire JTAG_ESCANIN,
    input wire JTAG_CAPTURE,
    input wire JTAG_UPDATE,
    input wire JTAG_SHIFT,
    input wire JTAG_RUNTEST,
    input wire [31:0] LBC_MDATA,
    input wire [31:0] LBC_MADDR,
    input wire [31:0] EJDD_CAPDATA,
    input wire [31:0] EJDD_ADDR,
    input wire [31:0] EJC_CTL,
    input wire EJ_DIS,
    input wire [1:0] CFG_EJTNMINUS1,
    input wire [1:0] CFG_EJTMLOG2,
    input wire CFG_EJTBIT0M16,
    input wire JTAG_CLOCK,
    input wire RESET_D1_JR_N,
    input wire TMODE
);
endmodule

module ejtag_dclk (
    input wire EJT_DREN_R,
    input wire EJT_DCLK,
    input wire CLK,
    input wire CLK_N,
    input wire CLKDELAYED,
    input wire RESET_D1_R_N,
    input wire RESET_DIS,
    input wire [1:0] CFG_EJTNMINUS1
);
endmodule

module ejtag_pmatch (
    input wire [31:0] EJPM_DATA,
    input wire EJPM_TRACEHIT_R,
    input wire EJPM_BREAKHIT_R,
    input wire EJDI_SELPBS,
    input wire EJDI_SELPBRS,
    input wire [31:0] LBC_MADDR,
    input wire [31:0] LBC_MDATA,
    input wire LBC_MRW,
    input wire LBC_MUC,
    input wire LBC_MID,
    input wire LBC_MTOGGLE,
    input wire EJ_STROBE,
    input wire CORE_CLOCK,
    input wire RESET_D1_R_N,
    input wire RESET_DIS
);
endmodule

module lmi_lbc_align (
    output wire [31:0] DO,
    input  wire        SXI,
    input  wire [1:0]  SZI,
    input  wire [3:0]  OFFSETI,
    input  wire [31:0] DI
);

endmodule

module lbc_and (OUT, IN1, IN2);
output OUT;
input IN1, IN2;

assign OUT = IN1 & IN2;
endmodule

module mfa (
    input  wire S,
    input  wire C,
    input  wire P,
    output wire Q,
    output wire R
);

endmodule

module mdiv (
    input  wire CLK,
    input  wire RESET_D2_R_N,
    input  wire CEI_AOPandV_E,
    input  wire CEI_BOPandV_E,
    output wire LO_R,
    input  wire DivDCyc0Go,
    input  wire DivDCyc0_R,
    input  wire DivDCycFirst_R,
    input  wire DivDCycLast_P,
    input  wire DivDCycLast_R,
    input  wire DivDCycZF_R_N,
    input  wire DivDCycFL_R_N,
    input  wire DivIsU_R,
    input  wire DIVxInProg,
    input  wire DDATAHI,
    input  wire DDATALO
);

endmodule

module lmi_icache_tag (
    input  wire CMP,
    input  wire [31:`IC_ADDR_HI+1-`IC_TAG_EXTRA_SIZE + 1] TAG,
    input  wire [31:`IC_ADDR_HI+1-`IC_TAG_EXTRA_SIZE] ADDR
);

endmodule

module lmi_icache_sm (
    input  wire nxtCST,
    input  wire CST,
    input  wire IST,
    input  wire RD_OP_N,
    input  wire missAll,
    input  wire IS_VAL,
    input  wire BurstCounter,
    input  wire otherBusy,
    input  wire anyAck,
    input  wire WasWrite,
    input  wire Kseg1,
    input  wire EXT_ICREQRAM_R,
    input  wire InvalPending
);

endmodule

module copif_bus (
    input  wire SYSCLK,
    input  wire TMODE,
    input  wire RESET1N,
    input  wire INSTM32_S_R_N,
    input  wire SEN,
    input  wire EXCEPTION,
    input  wire [1:0] COPNO,
    input  wire INSTIF,
    input  wire ISTALLIF,
    input  wire [2:0] IMISS,
    input  wire [2:0] DMISS,
    input  wire [2:0] IVAL,
    input  wire [2:0] DVAL,
    input  wire X_HALT_R,
    input  wire CONDINN,
    input  wire CPCONDN,
    input  wire CRDADDR,
    input  wire RHOLD,
    input  wire CRDGEN,
    input  wire CRDCON,
    input  wire CRDDATA,
    input  wire CWRADDR,
    input  wire CWRGEN,
    input  wire CWRCON,
    input  wire CWRDATA,
    input  wire CNTINST,
    input  wire CNTIMISS,
    input  wire CNTISTALL,
    input  wire CNTDMISS,
    input  wire CNTDSTALL,
    input  wire CNTDLOAD,
    input  wire CNTDSTORE,
    input  wire DBUSMUPIN,
    input  wire DBUSMUPOUT,
    input  wire DBUSMDOWNIN,
    input  wire DBUSMDOWNOUT
);

endmodule

module lmi_icache_bus (
    input  wire CLK,
    input  wire TMODE,
    input  wire RESET_D1_R_N,
    input  wire SEN,
    input  wire DISABLEC,
    input  wire INVALIDATE,
    input  wire MEMSEQUENTIAL,
    input  wire MEMZEROFIRST,
    input  wire EXT_ICREQRAM_R,
    input  wire IC_GNTRAM_R,
    input  wire IX_DATAUPI,
    input  wire IC_DATAUPO,
    input  wire IC_LBCOE,
    input  wire NEXTADDR,
    input  wire RDOP_N,
    input  wire [1:0] LACK,
    input  wire IS_VAL,
    input  wire IC_VAL,
    input  wire IC_MISS_P,
    input  wire IC_MISS_R,
    input  wire IC_HALT_S_R,
    input  wire X_HALT_R,
    input  wire IC_TAGINDEX,
    input  wire ICR_TAGRD0,
    input  wire IC_TAGWR0,
    input  wire ICC_TAGMASK,
    input  wire IC_TAG0WE,
    input  wire IC_TAG0WEN,
    input  wire IC_TAG0RE,
    input  wire IC_TAG0REN,
    input  wire IC_TAG0CS,
    input  wire IC_TAG0CSN,
    input  wire IC_DATAINDEX,
    input  wire IC_DATA0WE,
    input  wire IC_DATA0WEN,
    input  wire IC_DATA0RE,
    input  wire IC_DATA0REN,
    input  wire IC_DATA0CS,
    input  wire IC_DATA0CSN,
    input  wire ICR_DATA0RD,
    input  wire IC_DATAWR
);

endmodule

module lmi_iram_bus (
    input  wire CLK,
    input  wire TMODE,
    input  wire RESET_D1_R_N,
    input  wire SEN,
    input  wire INVALIDATE,
    input  wire MEMSEQUENTIAL,
    input  wire MEMZEROFIRST,
    input  wire EXT_IWREQRAM_R,
    input  wire IW_GNTRAM_R,
    input  wire DATAUPI,
    input  wire IW_DATAUPO,
    input  wire IW_LBCOE,
    input  wire NEXTADDR,
    input  wire RDOP_N,
    input  wire IS_VAL,
    input  wire IW_VAL,
    input  wire X_HALT_R,
    input  wire IW_ACK,
    input  wire IW_MISS_P,
    input  wire IW_MISS_R,
    input  wire IW_HALT_S_R,
    input  wire IW_VALINDEX,
    input  wire IWR_VALRD,
    input  wire IW_VALWR,
    input  wire IW_VALWE,
    input  wire IW_VALWEN,
    input  wire IW_VALRE,
    input  wire IW_VALREN,
    input  wire IW_VALCS,
    input  wire IW_VALCSN,
    input  wire IW_DATAINDEX,
    input  wire IW_DATAWE,
    input  wire IW_DATAWEN,
    input  wire IW_DATARE,
    input  wire IW_DATAREN,
    input  wire IW_DATACS,
    input  wire IW_DATACSN,
    input  wire IWR_DATARD,
    input  wire IW_DATAWR,
    input  wire CFG_IRAMISROM,
    input  wire CONFIGBASE,
    input  wire CONFIGTOP
);

endmodule

module lmi_dcache_bus (
    input  wire CLK,
    input  wire TMODE,
    input  wire RESET_D1_R_N,
    input  wire SEN,
    input  wire DISABLEC,
    input  wire INVALIDATE,
    input  wire MEMSEQUENTIAL,
    input  wire MEMZEROFIRST,
    input  wire MEMFULLWORD,
    input  wire EXT_DCREQRAM_R,
    input  wire DC_GNTRAM_R,
    input  wire DATADOWNI,
    input  wire DC_DATADOWNO,
    input  wire DATAUPI,
    input  wire DC_DATAUPO,
    input  wire DC_LBCOE,
    input  wire NEXTADDR,
    input  wire NEXTRDOP,
    input  wire NEXTWROP,
    input  wire NEXTBE,
    input  wire NEXTSX,
    input  wire DWORD_E,
    input  wire EXCP,
    input  wire [1:0] LACK,
    input  wire DS_VAL,
    input  wire DC_VAL,
    input  wire DC_MISS_P,
    input  wire DC_MISS_R,
    input  wire DC_BAREMISS_R,
    input  wire DC_HALT_W_R,
    input  wire DC_HALT_M_R,
    input  wire X_HALT_R,
    input  wire DC_RPALGNIFNBNA,
    input  wire DC_RPALGNIFB,
    input  wire DC_RPQUIETIFNBA,
    input  wire DC_RPQUIETIFB,
    input  wire DC_TAGINDEX,
    input  wire DCR_TAGRD,
    input  wire DC_TAGWR,
    input  wire DC_TAGWE,
    input  wire DC_TAGWEN,
    input  wire DC_TAGRE,
    input  wire DC_TAGREN,
    input  wire DC_TAGCS,
    input  wire DC_TAGCSN,
    input  wire DCC_TAGMASK,
    input  wire DC_DATAINDEX,
    input  wire DCR_DATARD,
    input  wire DC_DATAWR,
    input  wire DC_DATAWE,
    input  wire DC_DATAWEN,
    input  wire DC_DATARE,
    input  wire DC_DATAREN,
    input  wire DC_DATACS,
    input  wire DC_DATACSN,
    input  wire DC_CSTWBUS
);

endmodule

module lmi_dram_bus (
    input  wire CLK,
    input  wire TMODE,
    input  wire RESET_D1_R_N,
    input  wire SEN,
    input  wire DISABLEC,
    input  wire CFG_DWDISW,
    input  wire EXT_DWREQRAM_R,
    input  wire DW_GNTRAM_R,
    input  wire DATADOWNI,
    input  wire DW_DATADOWNO,
    input  wire DATAUPI,
    input  wire DW_DATAUPO,
    input  wire NEXTADDR,
    input  wire NEXTRDOP,
    input  wire NEXTWROP,
    input  wire NEXTBE,
    input  wire NEXTSX,
    input  wire EXCP,
    input  wire DW_ACK,
    input  wire DW_HALT_W_R,
    input  wire DW_VAL,
    input  wire X_HALT_R,
    input  wire DC_RPALGNIFNBNA,
    input  wire DC_RPALGNIFB,
    input  wire DC_RPQUIETIFNBA,
    input  wire DC_RPQUIETIFB,
    input  wire DW_DATAINDEX,
    input  wire DWR_DATARD,
    input  wire DW_DATAWR,
    input  wire DW_DATAWE,
    input  wire DW_DATAWEN,
    input  wire DW_DATARE,
    input  wire DW_DATAREN,
    input  wire DW_DATACS,
    input  wire DW_DATACSN,
    input  wire CONFIGBASE,
    input  wire CONFIGTOP
);

endmodule

module lmi_watch (
    input  wire CLK,
    input  wire TMODE,
    input  wire SEN,
    input  wire RESET_D1_R_N,
    input  wire DATAUPI,
    input  wire DATADOWNI,
    input  wire X_HALT_R,
    input  wire C_IADDR_A,
    input  wire C_IREAD_I_N,
    input  wire [1:0] IX_VAL,
    input  wire [1:0] IX_MISS_S_R,
    input  wire C_DADDR_E,
    input  wire C_DREAD_E,
    input  wire C_DWRITE_E,
    input  wire C_DBYEN_E,
    input  wire DC_VAL,
    input  wire CP0_XCPN_M,
    input  wire DC_MISS_W_R,
    input  wire LW_ISAMPLE_S,
    input  wire LW_IADDR_S_R,
    input  wire LW_DSAMPLE_W,
    input  wire LW_DWRITE_W_R,
    input  wire LW_DBYEN_W_R,
    input  wire LW_DADDR_W_R,
    input  wire LW_DATA_W_R
);

endmodule

module reset_dist (
    input  wire SYSCLKF,
    input  wire SL_SLEEPSYS_C0_R,
    input  wire SL_SLEEPSYS_C1_R,
    input  wire SL_SLEEPSYS_C2_R,
    input  wire SL_SLEEPSYS_C3_R,
    input  wire BUSCLKF,
    input  wire SL_SLEEPBUS_C0_BR,
    input  wire SL_SLEEPBUS_C1_BR,
    input  wire SL_SLEEPBUS_C2_BR,
    input  wire SL_SLEEPBUS_C3_BR,
    input  wire JTAG_RST_N,
    input  wire RESET_N,
    input  wire RESET_PWRON_N,
    input  wire EJC_ECRPRRST_R,
    input  wire RESET_D1_R_N,
    input  wire RESET_D1_BR_N,
    input  wire RESET_D1_C1_R_N,
    input  wire RESET_D1_C1_BR_N,
    input  wire RESET_PWRON_C1_N,
    input  wire RESET_PWRON_D1_LR_N,
    input  wire CFG_SLEEPENABLE,
    input  wire X_HALT_R,
    input  wire CP0_SLEEP_M_R,
    input  wire SYS_WBEMPTY_W_R,
    input  wire EJC_DINT_R,
    input  wire INTREQ_N,
    input  wire CP0_IM_W_R,
    input  wire EXT_SLEEPREQ_R,
    input  wire SL_HALT_W_R,
    input  wire SEN_N,
    input  wire TMODE_N
);

endmodule

module ejtag_imatch_4180 (
    input  wire [31:0] EJIM_DATA,
    input  wire        EJIM_TRACEHIT,
    input  wire        EJIM_BREAKHIT,
    input  wire [31:0] EJDI_DATA,
    input  wire [5:0]  EJDI_ADDR,
    input  wire        EJDI_RW,
    input  wire        EJDI_SELIBS,
    input  wire        EJDI_SELIBRS,
    input  wire        EJ_STROBE,
    input  wire        LW_ISAMPLE_S,
    input  wire [31:0] LW_IADDR_S_R,
    input  wire        CP0_JCTRLDM_I_R,
    output wire        EJDM_BREAKHIT_W,
    input  wire        PBI_EJHOLD,
    input  wire        CP0_JXCPN1STIFDMBH_M_P,
    input  wire        CP0_JXCPN1STIFNOTDMBH_M_P,
    input  wire        CP0_DIBIFNOTDMBH_M_P,
    input  wire        CORE_CLOCK,
    input  wire        TMODE,
    input  wire        SEN,
    input  wire        RESET_D1_R_N
);
endmodule

module ejtag_dmatch_4180 (
    input  wire [31:0] EJDM_DATA,
    input  wire        EJDM_TRACEHIT,
    input  wire        EJDM_BREAKHIT,
    input  wire [31:0] EJDI_DATA,
    input  wire [5:0]  EJDI_ADDR,
    input  wire        EJDI_RW,
    input  wire        EJDI_SELDBS,
    input  wire        EJDI_SELDBRS,
    input  wire        EJ_STROBE,
    input  wire        LW_DSAMPLE_W,
    input  wire [31:2] LW_DADDR_W_R,
    input  wire [31:0] LW_DATA_W_R,
    input  wire        CP0_JXCPN1STIFDMBH_M_P,
    input  wire        CP0_JXCPN1STIFNOTDMBH_M_P,
    input  wire        CP0_DBREAKCLR,
    input  wire        CP0_DBRKSETIFDMBH,
    input  wire        CP0_DDBXIFDMBH_M_P,
    input  wire        CP0_DDBXUNCOND_M_P,
    input  wire        CORE_CLOCK,
    input  wire        RESET_D1_R_N,
    input  wire        TMODE,
    input  wire        SEN
);
endmodule

module mcst50 (
    input wire A5,
    input wire A4,
    input wire A3,
    input wire A2,
    input wire A1,
    input wire A0,
    input wire S,
    output wire C
);
endmodule
