






`include "../../include/x_def.v"

/* ---------------------------------------------------------------------- */
/* FTC218x top module ( 02-02-2000 BY LCJ) */
/* ---------------------------------------------------------------------- */

module PINs (/* Input pins : (21) : */
/* glb */ X_RSTn, X_ICE_RSTn, X_BMODE, X_TMODE[1:0],
X_PLLsel[3:0], X_MMAP, X_GOICE,
/* core */ X_PWDn, X_IRQ2n, /*X_IRQ1n, X_IRQ0n,*/
X_IRQL1n, X_IRQE1n, X_IRQE0n, X_BRn,
/* spt */ X_RD0, X_RD1,
/* idma */ X_IRDn, X_IWRn, X_ISn, X_IAL,
/* sice */ X_ICK, X_IMS,

/* -------- Outputs : (27) -------- */
/* glb */ X_CLKO, X_PWDACK,
/* memc */ X_BGn, /*X_BGHn, X_EA[14:0],*/
X_EA_U[14:8], X_EA[7:0], X_PMSn,
X_DMSn, X_IOSn, /*X_CMSn,*/ X_RDn, X_WRn,
X_ECMSn, X_ECMA_EN,
/* spt */ X_TD0, X_TD1,
/* idma */ X_IACKn,
/* bdma */ X_BMSn,

/* -------- Inouts : (51) -------- */
/* xtal */ X_CLKI, XTAL,
/* emem */ X_ED[15:0],
/* spt */ X_SCLK0, X_RFS0, X_TFS0,
X_SCLK1, X_RFS1, X_TFS1,
/* idma */ X_IAD[15:0],
/* pio */ X_PIO[7:0],
/* sice */ X_ID,

/* ------------------------------------ */
/* Internal signals : */
/* ------------------------------------ */
/* outputs : */
/* glb */ T_RSTn, T_CLKI, T_BMODE, T_PLLsel[3:0],
T_TMODE, T_ED[15:0], T_EA[7:0],
T_selECM, T_GOICE,
/* core */ T_PWDn, T_IRQ2n, T_IRQ1n, T_IRQ0n,
T_IRQL1n, T_IRQE1n, T_IRQE0n, T_BRn,
/* spt */ T_RD0, T_RD1, T_SCLK0, T_SCLK1, T_RFS0,
T_TFS0, T_RFS1, T_TFS1,
/* idma */ T_IRDn, T_IWRn, T_ISn, T_IAL, T_IAD[15:0],
/* pio */ T_PIOin[11:0],
/* sice */ T_ICK, T_IMS, T_ID,

/* inputs : */
/* clkc */ CLKO, PWDACK, XTALoffn,
/* emc */ BGn, EA_oe, EA_do[14:0], PMSn, DMSn, BMSn,
IOSn, CMSn, RDn, WRn, ED_oe, ED_do[15:0],
ECMSn, ECMA_EN,
/* spt */ TD0, TD1, SCLK0, ISCLK0, SCLK1, ISCLK1,
RFS0, IRFS0, TFS0, ITFS0, RFS1, IRFS1,
TFS1, ITFS1,
/* idma */ IACKn, IAD_oe, IAD_do[15:0], T_MMAP,
/* pio */ PIO_oe[11:0], PIO_out[11:0],
/* sice */ IDo, IDoe,
/* bdma */ BMcs, BDIR);

input BMcs, BDIR;
input [3:0] X_PLLsel;
input [1:0] X_TMODE;
input X_RSTn, X_ICE_RSTn, X_BMODE, X_MMAP, X_PWDn, X_IRQ2n,
/*X_IRQ1n, X_IRQ0n,*/ X_IRQL1n, X_IRQE1n, X_IRQE0n,
X_BRn, X_RD0, X_RD1, X_IRDn, X_GOICE,
X_IWRn, X_ISn, X_IAL, X_ICK, X_IMS;


output [14:8] X_EA_U;
inout [7:0] X_EA;
output X_CLKO, X_PWDACK,
X_BGn, X_PMSn, X_DMSn, X_IOSn, /*X_CMSn,*/ X_ECMSn, X_ECMA_EN,
X_RDn, X_WRn, X_TD0, X_TD1, X_IACKn, X_BMSn;

input X_CLKI;
inout XTAL;
inout [15:0] X_ED, X_IAD;
inout [7:0] X_PIO;
inout X_SCLK0, X_SCLK1, X_RFS0, X_TFS0, X_RFS1, X_TFS1,
X_ID;


input [14:0] EA_do;
input [11:0] PIO_oe, PIO_out;
input [15:0] ED_do, IAD_do;
input CLKO, PWDACK, BGn, EA_oe, PMSn, DMSn, BMSn, IOSn,
CMSn, RDn, WRn, TD0, TD1, IACKn, ED_oe, ECMSn, ECMA_EN,
IAD_oe, SCLK0, ISCLK0, SCLK1, ISCLK1, RFS0,
IRFS0, TFS0, ITFS0, RFS1, IRFS1, TFS1, ITFS1,
IDo, IDoe, XTALoffn;

output [15:0] T_ED, T_IAD;
output [7:0] T_EA;
output [11:0] T_PIOin;
output [3:0] T_PLLsel;
output T_RSTn, T_CLKI, T_BMODE, T_MMAP, T_TMODE,
T_PWDn, T_IRQ2n, T_IRQ1n, T_IRQ0n,
T_IRQL1n, T_IRQE1n, T_IRQE0n, T_BRn,
T_RD0, T_RD1, T_IRDn, T_IWRn, T_ISn, T_GOICE,
T_IAL, T_ICK, T_IMS, T_SCLK0, T_SCLK1,
T_RFS0, T_TFS0, T_RFS1, T_TFS1, T_ID, T_selECM;

/* reserved pins : */



/* ------ Connecting Crystal (2 (ESD) pads) : ------ */





XSCIOM5 ckio (.IO(XTAL), .I(X_CLKI), .E(XTALoffn), .O(T_CLKI), .FEB(1'b0));


/* ---------------- inputs : ---------------- */


XC in1 (.O(T_PLLsel[3]), .I(X_PLLsel[3]));
XC in2 (.O(T_PLLsel[2]), .I(X_PLLsel[2]));
XC in3 (.O(T_PLLsel[1]), .I(X_PLLsel[1]));
XC in4 (.O(T_PLLsel[0]), .I(X_PLLsel[0]));

XCU8 in5 (.O(T_RSTn_1), .I(X_RSTn));
XCU8 in5_ (.O(T_RSTn_2), .I(X_ICE_RSTn));

XC in6 (.O(T_ICK), .I(X_ICK));
XC in7 (.O(T_IMS), .I(X_IMS));

XC in8 (.O(T_BMODE), .I(X_BMODE));
XC in9 (.O(T_TMODE), .I(X_TMODE[0]));
XC in12 (.O(T_selECM), .I(X_TMODE[1]));
XC in10 (.O(T_PWDn), .I(X_PWDn));

XCU8 in11 (.O(T_IRQ2n), .I(X_IRQ2n));


XCU8 in14 (.O(T_IRQL1n), .I(X_IRQL1n));
XCU8 in15 (.O(T_IRQE1n), .I(X_IRQE1n));
XCU8 in16 (.O(T_IRQE0n), .I(X_IRQE0n));

XCU8 in17 (.O(T_BRn), .I(X_BRn));
XC in18 (.O(T_RD0), .I(X_RD0));
XC in19 (.O(T_RD1), .I(X_RD1));
XCU8 in20 (.O(T_ISn), .I(X_ISn));
XCU8 in21 (.O(T_IRDn), .I(X_IRDn));
XCU8 in22 (.O(T_IWRn), .I(X_IWRn));
XCD8 in23 (.O(T_IAL), .I(X_IAL));
XC in24 (.O(T_MMAP), .I(X_MMAP));
XCD8 in25 (.O(T_GOICE), .I(X_GOICE));

INV1 uu12 (.O(T_IRQ1n), .I(1'b0));
INV1 uu13 (.O(T_IRQ0n), .I(1'b0));
AN2P uu14 (.O(T_RSTn), .I1(T_RSTn_1), .I2(T_RSTn_2));




/* ---------------- outputs : ---------------- */


BUF4 uu0 (.O(BGnx), .I(BGn));

YC04T out1 (.O(X_CLKO), .I(CLKO), .E(1'b1));
YC04A out2 (.O(X_PWDACK), .I(PWDACK), .E(1'b1));
YC04A out3 (.O(X_BGn), .I(BGn), .E(1'b1));

YC04A out4 (.O(X_EA_U[14]), .I(EA_do[14]), .E(BGnx));
YC04A out5 (.O(X_EA_U[13]), .I(EA_do[13]), .E(BGnx));
YC04A out6 (.O(X_EA_U[12]), .I(EA_do[12]), .E(BGnx));
YC04A out7 (.O(X_EA_U[11]), .I(EA_do[11]), .E(BGnx));
YC04A out8 (.O(X_EA_U[10]), .I(EA_do[10]), .E(BGnx));
YC04A out9 (.O(X_EA_U[9]), .I(EA_do[9]), .E(BGnx));
YC04A out10 (.O(X_EA_U[8]), .I(EA_do[8]), .E(BGnx));


YC04A out19 (.O(X_PMSn), .I(PMSn), .E(BGnx));
YC04A out20 (.O(X_DMSn), .I(DMSn), .E(BGnx));

YC04A out30 (.O(X_BMSn), .I(BMSn), .E(BGnx));

YC04A out21 (.O(X_IOSn), .I(IOSn), .E(BGnx));

YC04A out23 (.O(X_RDn), .I(RDn), .E(BGnx));
YC04A out24 (.O(X_WRn), .I(WRn), .E(BGnx));

YC04T out25 (.O(X_TD0), .I(TD0), .E(1'b1));
YC04T out26 (.O(X_TD1), .I(TD1), .E(1'b1));
YC04T out27 (.O(X_IACKn), .I(IACKn), .E(1'b1));
YC04A out28 (.O(X_ECMSn), .I(ECMSn), .E(BGnx));
YC04A out29 (.O(X_ECMA_EN), .I(ECMA_EN), .E(BGnx));




/* ---------------- inouts : ---------------- */



BUF4 uu2 (.O(IAD_oex), .I(IAD_oe));
BUF4 uu3 (.O(EA_oex), .I(EA_oe));

OR2P xeds1 (.O(XED_S1), .I1(ED_oe), .I2(BMcs));

AO12P xeds2 (.O(XED_S2), .A1(ED_oe), .B1(BMcs), .B2(BDIR));

ZCC04A io1 (.IO(X_ED[15]), .O(T_ED[15]), .I(ED_do[15]), .E(ED_oe));

ZCC04A io2 (.IO(X_ED[14]), .O(T_ED[14]), .I(ED_do[14]), .E(XED_S1));

ZCC04A io3 (.IO(X_ED[13]), .O(T_ED[13]), .I(ED_do[13]), .E(XED_S1));

ZCC04A io4 (.IO(X_ED[12]), .O(T_ED[12]), .I(ED_do[12]), .E(XED_S1));

ZCC04A io5 (.IO(X_ED[11]), .O(T_ED[11]), .I(ED_do[11]), .E(XED_S1));

ZCC04A io6 (.IO(X_ED[10]), .O(T_ED[10]), .I(ED_do[10]), .E(XED_S1));

ZCC04A io7 (.IO(X_ED[9]), .O(T_ED[9]), .I(ED_do[9]), .E(XED_S1));

ZCC04A io8 (.IO(X_ED[8]), .O(T_ED[8]), .I(ED_do[8]), .E(XED_S1));

ZCC04A io9 (.IO(X_ED[7]), .O(T_ED[7]), .I(ED_do[7]), .E(XED_S2));

ZCC04A io10 (.IO(X_ED[6]), .O(T_ED[6]), .I(ED_do[6]), .E(XED_S2));

ZCC04A io11 (.IO(X_ED[5]), .O(T_ED[5]), .I(ED_do[5]), .E(XED_S2));

ZCC04A io12 (.IO(X_ED[4]), .O(T_ED[4]), .I(ED_do[4]), .E(XED_S2));

ZCC04A io13 (.IO(X_ED[3]), .O(T_ED[3]), .I(ED_do[3]), .E(XED_S2));

ZCC04A io14 (.IO(X_ED[2]), .O(T_ED[2]), .I(ED_do[2]), .E(XED_S2));

ZCC04A io15 (.IO(X_ED[1]), .O(T_ED[1]), .I(ED_do[1]), .E(XED_S2));

ZCC04A io16 (.IO(X_ED[0]), .O(T_ED[0]), .I(ED_do[0]), .E(XED_S2));


ZCC04A io17 (.IO(X_SCLK0), .O(T_SCLK0), .I(SCLK0), .E(ISCLK0));

ZCC04A io18 (.IO(X_RFS0), .O(T_RFS0), .I(RFS0), .E(IRFS0));

ZCC04A io19 (.IO(X_TFS0), .O(T_TFS0), .I(TFS0), .E(ITFS0));

ZCC04A io20 (.IO(X_SCLK1), .O(T_SCLK1), .I(SCLK1), .E(ISCLK1));

ZCC04A io21 (.IO(X_RFS1), .O(T_RFS1), .I(RFS1), .E(IRFS1));

ZCC04A io22 (.IO(X_TFS1), .O(T_TFS1), .I(TFS1), .E(ITFS1));


ZCC04A io23 (.IO(X_IAD[15]), .O(T_IAD[15]), .I(IAD_do[15]), .E(IAD_oex));

ZCC04A io24 (.IO(X_IAD[14]), .O(T_IAD[14]), .I(IAD_do[14]), .E(IAD_oex));

ZCC04A io25 (.IO(X_IAD[13]), .O(T_IAD[13]), .I(IAD_do[13]), .E(IAD_oex));

ZCC04A io26 (.IO(X_IAD[12]), .O(T_IAD[12]), .I(IAD_do[12]), .E(IAD_oex));

ZCC04A io27 (.IO(X_IAD[11]), .O(T_IAD[11]), .I(IAD_do[11]), .E(IAD_oex));

ZCC04A io28 (.IO(X_IAD[10]), .O(T_IAD[10]), .I(IAD_do[10]), .E(IAD_oex));

ZCC04A io29 (.IO(X_IAD[9]), .O(T_IAD[9]), .I(IAD_do[9]), .E(IAD_oex));

ZCC04A io30 (.IO(X_IAD[8]), .O(T_IAD[8]), .I(IAD_do[8]), .E(IAD_oex));

ZCC04A io31 (.IO(X_IAD[7]), .O(T_IAD[7]), .I(IAD_do[7]), .E(IAD_oex));

ZCC04A io32 (.IO(X_IAD[6]), .O(T_IAD[6]), .I(IAD_do[6]), .E(IAD_oex));

ZCC04A io33 (.IO(X_IAD[5]), .O(T_IAD[5]), .I(IAD_do[5]), .E(IAD_oex));

ZCC04A io34 (.IO(X_IAD[4]), .O(T_IAD[4]), .I(IAD_do[4]), .E(IAD_oex));

ZCC04A io35 (.IO(X_IAD[3]), .O(T_IAD[3]), .I(IAD_do[3]), .E(IAD_oex));

ZCC04A io36 (.IO(X_IAD[2]), .O(T_IAD[2]), .I(IAD_do[2]), .E(IAD_oex));

ZCC04A io37 (.IO(X_IAD[1]), .O(T_IAD[1]), .I(IAD_do[1]), .E(IAD_oex));

ZCC04A io38 (.IO(X_IAD[0]), .O(T_IAD[0]), .I(IAD_do[0]), .E(IAD_oex));

ZCC04A io39 (.IO(X_ID), .O(T_ID), .I(IDo), .E(IDoe));


/*
ZCC04A io40 (.IO(X_PIO[11]), .O(T_PIOin[11]), .I(PIO_out[11]), .E(PIO_oe[11]));

ZCC04A io41 (.IO(X_PIO[10]), .O(T_PIOin[10]), .I(PIO_out[10]), .E(PIO_oe[10]));

ZCC04A io42 (.IO(X_PIO[9]), .O(T_PIOin[9]), .I(PIO_out[9]), .E(PIO_oe[9]));

ZCC04A io43 (.IO(X_PIO[8]), .O(T_PIOin[8]), .I(PIO_out[8]), .E(PIO_oe[8]));
*/
INV2 uu40 (.O(T_PIOin[11]), .I(1'b1));
INV2 uu41 (.O(T_PIOin[10]), .I(1'b1));
INV2 uu42 (.O(T_PIOin[9]), .I(1'b1));
INV2 uu43 (.O(T_PIOin[8]), .I(1'b1));

ZCC04A io44 (.IO(X_PIO[7]), .O(T_PIOin[7]), .I(PIO_out[7]), .E(PIO_oe[7]));

ZCC04A io45 (.IO(X_PIO[6]), .O(T_PIOin[6]), .I(PIO_out[6]), .E(PIO_oe[6]));

ZCC04A io46 (.IO(X_PIO[5]), .O(T_PIOin[5]), .I(PIO_out[5]), .E(PIO_oe[5]));

ZCC04A io47 (.IO(X_PIO[4]), .O(T_PIOin[4]), .I(PIO_out[4]), .E(PIO_oe[4]));

ZCC04A io48 (.IO(X_PIO[3]), .O(T_PIOin[3]), .I(PIO_out[3]), .E(PIO_oe[3]));

ZCC04A io49 (.IO(X_PIO[2]), .O(T_PIOin[2]), .I(PIO_out[2]), .E(PIO_oe[2]));

ZCC04A io50 (.IO(X_PIO[1]), .O(T_PIOin[1]), .I(PIO_out[1]), .E(PIO_oe[1]));

ZCC04A io51 (.IO(X_PIO[0]), .O(T_PIOin[0]), .I(PIO_out[0]), .E(PIO_oe[0]));



ZCC04A io52 (.IO(X_EA[7]), .O(T_EA[7]), .I(EA_do[7]), .E(EA_oex));

ZCC04A io53 (.IO(X_EA[6]), .O(T_EA[6]), .I(EA_do[6]), .E(EA_oex));

ZCC04A io54 (.IO(X_EA[5]), .O(T_EA[5]), .I(EA_do[5]), .E(EA_oex));

ZCC04A io55 (.IO(X_EA[4]), .O(T_EA[4]), .I(EA_do[4]), .E(EA_oex));

ZCC04A io56 (.IO(X_EA[3]), .O(T_EA[3]), .I(EA_do[3]), .E(EA_oex));

ZCC04A io57 (.IO(X_EA[2]), .O(T_EA[2]), .I(EA_do[2]), .E(EA_oex));

ZCC04A io58 (.IO(X_EA[1]), .O(T_EA[1]), .I(EA_do[1]), .E(EA_oex));

ZCC04A io59 (.IO(X_EA[0]), .O(T_EA[0]), .I(EA_do[0]), .E(EA_oex));



endmodule
