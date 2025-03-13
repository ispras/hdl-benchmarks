`include "pin_013_includes.v"






`include "x_def.v"

/* ---------------------------------------------------------------------- */
/* FTC218x top module ( 02-02-2000 BY LCJ) */
/* ---------------------------------------------------------------------- */

module PINs (/* Input pins : (21) : */
/* glb */ X_RSTn, X_BMODE, X_TMODE, X_PLLsel,
X_MMAP,
/* core */ X_PWDn, X_IRQ2n, /*X_IRQ1n, X_IRQ0n,*/
X_IRQL1n, X_IRQE1n, X_IRQE0n, X_BRn,
/* spt */ X_RD0, X_RD1,
/* idma */ X_IRDn, X_IWRn, X_ISn, X_IAL,
/* sice */ X_ICK, X_IMS,

/* -------- Outputs : (27) -------- */
/* glb */ X_CLKO, X_PWDACK,
/* memc */ X_BGn, /*X_BGHn,*/ X_EA, X_PMSn,
X_DMSn, X_IOSn, /*X_CMSn,*/ X_RDn, X_WRn,
X_ECMSn, X_ECMA_EN,
/* spt */ X_TD0, X_TD1,
/* idma */ X_IACKn,
/* bdma */ X_BMSn,

/* -------- Inouts : (51) -------- */
/* xtal */ X_CLKI, XTAL,
/* emem */ X_ED,
/* spt */ X_SCLK0, X_RFS0, X_TFS0,
X_SCLK1, X_RFS1, X_TFS1,
/* idma */ X_IAD,
/* pio */ X_PIO,
/* sice */ X_ID,

/* ------------------------------------ */
/* Internal signals : */
/* ------------------------------------ */
/* outputs : */
/* glb */ T_RSTn, T_CLKI, T_BMODE, T_PLLsel,
T_TMODE, T_ED, T_EA,
T_selECM,
/* core */ T_PWDn, T_IRQ2n, T_IRQ1n, T_IRQ0n,
T_IRQL1n, T_IRQE1n, T_IRQE0n, T_BRn,
/* spt */ T_RD0, T_RD1, T_SCLK0, T_SCLK1, T_RFS0,
T_TFS0, T_RFS1, T_TFS1,
/* idma */ T_IRDn, T_IWRn, T_ISn, T_IAL, T_IAD,
/* pio */ T_PIOin,
/* sice */ T_ICK, T_IMS, T_ID,

/* inputs : */
/* clkc */ CLKO, PWDACK, XTALoffn,
/* emc */ BGn, EA_oe, EA_do, PMSn, DMSn, BMSn,
IOSn, CMSn, RDn, WRn, ED_oe, ED_do,
ECMSn, ECMA_EN,
/* spt */ TD0, TD1, SCLK0, ISCLK0, SCLK1, ISCLK1,
RFS0, IRFS0, TFS0, ITFS0, RFS1, IRFS1,
TFS1, ITFS1,
/* idma */ IACKn, IAD_oe, IAD_do, T_MMAP,
/* pio */ PIO_oe, PIO_out,
/* sice */ IDo, IDoe,
/* bdma */ BMcs, BDIR);

input BMcs, BDIR;
input [3:0] X_PLLsel;
input [1:0] X_TMODE;
input X_RSTn, X_BMODE, X_MMAP, X_PWDn, X_IRQ2n,
/*X_IRQ1n, X_IRQ0n,*/ X_IRQL1n, X_IRQE1n, X_IRQE0n,
X_BRn, X_RD0, X_RD1, X_IRDn,
X_IWRn, X_ISn, X_IAL, X_ICK, X_IMS;

inout [14:0] X_EA;
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
T_RD0, T_RD1, T_IRDn, T_IWRn, T_ISn,
T_IAL, T_ICK, T_IMS, T_SCLK0, T_SCLK1,
T_RFS0, T_TFS0, T_RFS1, T_TFS1, T_ID, T_selECM;

/* reserved pins : */



/* ------ Connecting Crystal (2 (ESD) pads) : ------ */









/* ---------------------------------------------------- */
/* Retarget to 0.18um, by Henry Hu 2001/07/17 */
/* Original(0.35um) Current(0.18um) */
/* XSCIOM5 UROSCAHB */
/* ---------------------------------------------------- */

/* ---------------------------------------------------- */
/* Retarget to 0.13um, by Steven Lin 2001/10/22 */
/* Original(0.18um) Current(0.13um) */
/* UROSCAHB XOSCAHB */
/* ---------------------------------------------------- */

XOSCAHB ckio (.IO(XTAL), .I(X_CLKI), .E(XTALoffn), .O(T_CLKI), .FEB(1'b0), .EB(1'b0), .S0(1'b0), .S1(1'b1));



/* ---------------- inputs : ---------------- */


/* ---------------------------------------------------- */
/* Retarget to 0.18um, by Henry Hu 2001/07/17 */
/* Original(0.35um) Current(0.18um) */
/* XC XFAB */
/* ---------------------------------------------------- */

/* ---------------------------------------------------- */
/* Retarget to 0.13um, by Steven Lin 2001/10/22 */
/* Original(0.18um) Current(0.13um) */
/* XFAB XFMB */
/* ---------------------------------------------------- */

XFMB in1 (.O(T_PLLsel[3]), .I(X_PLLsel[3]), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in2 (.O(T_PLLsel[2]), .I(X_PLLsel[2]), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in3 (.O(T_PLLsel[1]), .I(X_PLLsel[1]), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in4 (.O(T_PLLsel[0]), .I(X_PLLsel[0]), .PU(1'b0), .PD(1'b0), .SMT(1'b0));

XFMB in5 (.O(T_RSTn), .I(X_RSTn), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in6 (.O(T_ICK), .I(X_ICK), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in7 (.O(T_IMS), .I(X_IMS), .PU(1'b0), .PD(1'b0), .SMT(1'b0));

XFMB in8 (.O(T_BMODE), .I(X_BMODE), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in9 (.O(T_TMODE), .I(X_TMODE[0]), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in12 (.O(T_selECM), .I(X_TMODE[1]), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in10 (.O(T_PWDn), .I(X_PWDn), .PU(1'b0), .PD(1'b0), .SMT(1'b0));

XFMB in11 (.O(T_IRQ2n), .I(X_IRQ2n), .PU(1'b0), .PD(1'b0), .SMT(1'b0));


XFMB in14 (.O(T_IRQL1n), .I(X_IRQL1n), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in15 (.O(T_IRQE1n), .I(X_IRQE1n), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in16 (.O(T_IRQE0n), .I(X_IRQE0n), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in17 (.O(T_BRn), .I(X_BRn), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in18 (.O(T_RD0), .I(X_RD0), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in19 (.O(T_RD1), .I(X_RD1), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in20 (.O(T_ISn), .I(X_ISn), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in21 (.O(T_IRDn), .I(X_IRDn), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in22 (.O(T_IWRn), .I(X_IWRn), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in23 (.O(T_IAL), .I(X_IAL), .PU(1'b0), .PD(1'b0), .SMT(1'b0));
XFMB in24 (.O(T_MMAP), .I(X_MMAP), .PU(1'b0), .PD(1'b0), .SMT(1'b0));


INVGSS uu12 (.O(T_IRQ1n), .I(1'b0));

INVGSS uu13 (.O(T_IRQ0n), .I(1'b0));



/* ---------------- outputs : ---------------- */



BUFJSS uu0 (.O(BGnx), .I(BGn));

/* ---------------------------------------------------- */
/* Retarget to 0.18um, by Henry Hu 2001/07/17 */
/* Original(0.35um) Current(0.18um) */
/* YC04T YFA2GSB */
/* YC04A YFA2GSB */
/* ---------------------------------------------------- */

/* ---------------------------------------------------- */
/* Retarget to 0.13um, by Steven Lin 2001/10/22 */
/* Original(0.18um) Current(0.13um) */
/* YFA2GSB YFA28SB */
/* ---------------------------------------------------- */

YFA28SB out1 (.O(X_CLKO), .I(CLKO), .E(1'b1), .E2(1'b1), .E4(1'b0), .SR(1'b0));
YFA28SB out2 (.O(X_PWDACK), .I(PWDACK), .E(1'b1), .E2(1'b1), .E4(1'b0), .SR(1'b0));
YFA28SB out3 (.O(X_BGn), .I(BGn), .E(1'b1), .E2(1'b1), .E4(1'b0), .SR(1'b0));

YFA28SB out4 (.O(X_EA[14]), .I(EA_do[14]), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));
YFA28SB out5 (.O(X_EA[13]), .I(EA_do[13]), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));
YFA28SB out6 (.O(X_EA[12]), .I(EA_do[12]), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));
YFA28SB out7 (.O(X_EA[11]), .I(EA_do[11]), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));
YFA28SB out8 (.O(X_EA[10]), .I(EA_do[10]), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));
YFA28SB out9 (.O(X_EA[9]), .I(EA_do[9]), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));
YFA28SB out10 (.O(X_EA[8]), .I(EA_do[8]), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));

YFA28SB out19 (.O(X_PMSn), .I(PMSn), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));
YFA28SB out20 (.O(X_DMSn), .I(DMSn), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));

YFA28SB out30 (.O(X_BMSn), .I(BMSn), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));

YFA28SB out21 (.O(X_IOSn), .I(IOSn), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));

YFA28SB out23 (.O(X_RDn), .I(RDn), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));
YFA28SB out24 (.O(X_WRn), .I(WRn), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));

YFA28SB out25 (.O(X_TD0), .I(TD0), .E(1'b1), .E2(1'b1), .E4(1'b0), .SR(1'b0));
YFA28SB out26 (.O(X_TD1), .I(TD1), .E(1'b1), .E2(1'b1), .E4(1'b0), .SR(1'b0));
YFA28SB out27 (.O(X_IACKn), .I(IACKn), .E(1'b1), .E2(1'b1), .E4(1'b0), .SR(1'b0));
YFA28SB out28 (.O(X_ECMSn), .I(ECMSn), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));
YFA28SB out29 (.O(X_ECMA_EN), .I(ECMA_EN), .E(BGnx), .E2(1'b1), .E4(1'b0), .SR(1'b0));




/* ---------------- inouts : ---------------- */




BUFJSS uu2 (.O(IAD_oex), .I(IAD_oe));

BUFJSS uu3 (.O(EA_oex), .I(EA_oe));


OR2HSS xeds1 (.O(XED_S1), .I1(ED_oe), .I2(BMcs));


AO12JSS xeds2 (.O(XED_S2), .A1(ED_oe), .B1(BMcs), .B2(BDIR));

/* ---------------------------------------------------- */
/* Retarget to 0.18um, by Henry Hu 2001/07/17 */
/* Original(0.35um) Current(0.18um) */
/* ZCC04A ZFA2GSB */
/* ---------------------------------------------------- */

/* ---------------------------------------------------- */
/* Retarget to 0.13um, by Steven Lin 2001/10/22 */
/* Original(0.18um) Current(0.13um) */
/* ZFA2GSB ZFMA28SB */
/* ---------------------------------------------------- */

ZFMA28SB io1 (.IO(X_ED[15]), .O(T_ED[15]), .I(ED_do[15]), .E(ED_oe), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io2 (.IO(X_ED[14]), .O(T_ED[14]), .I(ED_do[14]), .E(XED_S1), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io3 (.IO(X_ED[13]), .O(T_ED[13]), .I(ED_do[13]), .E(XED_S1), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io4 (.IO(X_ED[12]), .O(T_ED[12]), .I(ED_do[12]), .E(XED_S1), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io5 (.IO(X_ED[11]), .O(T_ED[11]), .I(ED_do[11]), .E(XED_S1), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io6 (.IO(X_ED[10]), .O(T_ED[10]), .I(ED_do[10]), .E(XED_S1), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io7 (.IO(X_ED[9]), .O(T_ED[9]), .I(ED_do[9]), .E(XED_S1), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io8 (.IO(X_ED[8]), .O(T_ED[8]), .I(ED_do[8]), .E(XED_S1), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io9 (.IO(X_ED[7]), .O(T_ED[7]), .I(ED_do[7]), .E(XED_S2), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io10 (.IO(X_ED[6]), .O(T_ED[6]), .I(ED_do[6]), .E(XED_S2), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io11 (.IO(X_ED[5]), .O(T_ED[5]), .I(ED_do[5]), .E(XED_S2), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io12 (.IO(X_ED[4]), .O(T_ED[4]), .I(ED_do[4]), .E(XED_S2), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io13 (.IO(X_ED[3]), .O(T_ED[3]), .I(ED_do[3]), .E(XED_S2), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io14 (.IO(X_ED[2]), .O(T_ED[2]), .I(ED_do[2]), .E(XED_S2), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io15 (.IO(X_ED[1]), .O(T_ED[1]), .I(ED_do[1]), .E(XED_S2), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io16 (.IO(X_ED[0]), .O(T_ED[0]), .I(ED_do[0]), .E(XED_S2), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io17 (.IO(X_SCLK0), .O(T_SCLK0), .I(SCLK0), .E(ISCLK0), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io18 (.IO(X_RFS0), .O(T_RFS0), .I(RFS0), .E(IRFS0), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io19 (.IO(X_TFS0), .O(T_TFS0), .I(TFS0), .E(ITFS0), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io20 (.IO(X_SCLK1), .O(T_SCLK1), .I(SCLK1), .E(ISCLK1), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io21 (.IO(X_RFS1), .O(T_RFS1), .I(RFS1), .E(IRFS1), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io22 (.IO(X_TFS1), .O(T_TFS1), .I(TFS1), .E(ITFS1), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));


ZFMA28SB io23 (.IO(X_IAD[15]), .O(T_IAD[15]), .I(IAD_do[15]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io24 (.IO(X_IAD[14]), .O(T_IAD[14]), .I(IAD_do[14]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io25 (.IO(X_IAD[13]), .O(T_IAD[13]), .I(IAD_do[13]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io26 (.IO(X_IAD[12]), .O(T_IAD[12]), .I(IAD_do[12]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io27 (.IO(X_IAD[11]), .O(T_IAD[11]), .I(IAD_do[11]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io28 (.IO(X_IAD[10]), .O(T_IAD[10]), .I(IAD_do[10]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io29 (.IO(X_IAD[9]), .O(T_IAD[9]), .I(IAD_do[9]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io30 (.IO(X_IAD[8]), .O(T_IAD[8]), .I(IAD_do[8]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io31 (.IO(X_IAD[7]), .O(T_IAD[7]), .I(IAD_do[7]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io32 (.IO(X_IAD[6]), .O(T_IAD[6]), .I(IAD_do[6]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io33 (.IO(X_IAD[5]), .O(T_IAD[5]), .I(IAD_do[5]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io34 (.IO(X_IAD[4]), .O(T_IAD[4]), .I(IAD_do[4]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io35 (.IO(X_IAD[3]), .O(T_IAD[3]), .I(IAD_do[3]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io36 (.IO(X_IAD[2]), .O(T_IAD[2]), .I(IAD_do[2]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io37 (.IO(X_IAD[1]), .O(T_IAD[1]), .I(IAD_do[1]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io38 (.IO(X_IAD[0]), .O(T_IAD[0]), .I(IAD_do[0]), .E(IAD_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io39 (.IO(X_ID), .O(T_ID), .I(IDo), .E(IDoe), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

/*
ZFMA28SB io40 (.IO(X_PIO[11]), .O(T_PIOin[11]), .I(PIO_out[11]), .E(PIO_oe[11]), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io41 (.IO(X_PIO[10]), .O(T_PIOin[10]), .I(PIO_out[10]), .E(PIO_oe[10]), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io42 (.IO(X_PIO[9]), .O(T_PIOin[9]), .I(PIO_out[9]), .E(PIO_oe[9]), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io43 (.IO(X_PIO[8]), .O(T_PIOin[8]), .I(PIO_out[8]), .E(PIO_oe[8]), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));
*/

INVHSS uu40 (.O(T_PIOin[11]), .I(1'b1));

INVHSS uu41 (.O(T_PIOin[10]), .I(1'b1));

INVHSS uu42 (.O(T_PIOin[9]), .I(1'b1));

INVHSS uu43 (.O(T_PIOin[8]), .I(1'b1));

ZFMA28SB io44 (.IO(X_PIO[7]), .O(T_PIOin[7]), .I(PIO_out[7]), .E(PIO_oe[7]), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io45 (.IO(X_PIO[6]), .O(T_PIOin[6]), .I(PIO_out[6]), .E(PIO_oe[6]), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io46 (.IO(X_PIO[5]), .O(T_PIOin[5]), .I(PIO_out[5]), .E(PIO_oe[5]), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io47 (.IO(X_PIO[4]), .O(T_PIOin[4]), .I(PIO_out[4]), .E(PIO_oe[4]), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io48 (.IO(X_PIO[3]), .O(T_PIOin[3]), .I(PIO_out[3]), .E(PIO_oe[3]), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io49 (.IO(X_PIO[2]), .O(T_PIOin[2]), .I(PIO_out[2]), .E(PIO_oe[2]), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io50 (.IO(X_PIO[1]), .O(T_PIOin[1]), .I(PIO_out[1]), .E(PIO_oe[1]), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io51 (.IO(X_PIO[0]), .O(T_PIOin[0]), .I(PIO_out[0]), .E(PIO_oe[0]), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io52 (.IO(X_EA[7]), .O(T_EA[7]), .I(EA_do[7]), .E(EA_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io53 (.IO(X_EA[6]), .O(T_EA[6]), .I(EA_do[6]), .E(EA_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io54 (.IO(X_EA[5]), .O(T_EA[5]), .I(EA_do[5]), .E(EA_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io55 (.IO(X_EA[4]), .O(T_EA[4]), .I(EA_do[4]), .E(EA_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io56 (.IO(X_EA[3]), .O(T_EA[3]), .I(EA_do[3]), .E(EA_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io57 (.IO(X_EA[2]), .O(T_EA[2]), .I(EA_do[2]), .E(EA_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io58 (.IO(X_EA[1]), .O(T_EA[1]), .I(EA_do[1]), .E(EA_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));

ZFMA28SB io59 (.IO(X_EA[0]), .O(T_EA[0]), .I(EA_do[0]), .E(EA_oex), .E4(1'b0), .E2(1'b1), .SMT(1'b0), .PU(1'b0), .PD(1'b0), .SR(1'b0));


endmodule

