`include "x_def.v"

module SPORT0 (/* -------- Inputs : --------- */
RDx,
T_RST, DSPCLK, GO_Cx, EX_en, MTTX_E,
MTRX_E, Twrap, Rwrap, DMD,
SP_EN, selAUTO, selFSDIV, selSCLKDIV,
selSCTL, selMWORD, AUTO_we, FSDIV_we,
SCLKDIV_we, SCTL_we, MWORD_we, MMR_web,
TSack, RSack,
`ifdef FD_DFT
SCAN_TEST,
`endif



TDx,
ISR, IST, TIREG, TMREG,
RIREG, RMREG, PDFORCE,
XTALDIS, XTALDELAY, PUCR,
TSreq, RSreq, RX, TX,
DMD_do,


SCLKo, T_SCLK, ISCLK,
RFSi, T_RFS, IRFS,
TFSi, T_TFS, ITFS);


input [15:0] DMD;
input RDx,
T_RST,
DSPCLK,
GO_Cx,
EX_en,
SP_EN,
selAUTO,
selFSDIV,
selSCLKDIV,
selSCTL,
selMWORD,
AUTO_we,
FSDIV_we,
SCLKDIV_we,
SCTL_we,
MWORD_we,
MTTX_E,
MTRX_E,
Twrap,
Rwrap,
TSack,
RSack,
T_SCLK,
T_RFS,
T_TFS,
MMR_web;

`ifdef FD_DFT
input SCAN_TEST;
`endif


output [15:0] RX, TX,
DMD_do;
output [2:0] TIREG,
RIREG;
output [1:0] TMREG,
RMREG;
output TDx,
ISR,
IST,
TSreq,
RSreq,
XTALDIS,
XTALDELAY,
PDFORCE,
PUCR,
ISCLK,
SCLKo,
IRFS,
RFSi,
ITFS,
TFSi;


wire [15:0] expRX, FSDIV, SCLKDIV, DMDin;
wire [15:0] MWORD;
wire [7:0] logTX;
wire [4:0] SLEN;
wire [1:0] FSD, DTYPE;
wire [3:2] SLOT1_EXT;
wire [3:0] SLOT_NUM;






SPGLUE0 glue (/* in */ T_RST, DSPCLK, LOOP, TD, RDx,
`ifdef FD_DFT
SCAN_TEST,
`endif
RST, RD, TDx);


SCreg0 regs (/* in */ RST, DSPCLK, selAUTO, selFSDIV, selSCLKDIV,
selSCTL, selMWORD, AUTO_we, FSDIV_we, SCLKDIV_we,
SCTL_we, MWORD_we, DMDin[15:0], MMR_web,
SLOT1_EXT[3:2], SLOT_NUM[3:0],
`ifdef FD_DFT
SCAN_TEST,
`endif
TIREG[2:0], TMREG[1:0], RIREG[2:0], RMREG[1:0],
TBUF, RBUF, FSDIV[15:0], SCLKDIV[15:0], LOOP,
ISCLK, FSD[1:0], FSW, ITFS, IRFS, INVTFS, INVRFS,
DTYPE[1:0], SLEN[4:0], MWORD[15:0], XTALDIS,
XTALDELAY, PDFORCE, PUCR, DMD_do[15:0], SLEN_ex,
INVxSCLK);


SCFG0 cfg (/* in */ RST, DSPCLK, SP_EN, FSDIV[15:0], SCLKDIV[15:0],
ISCLK, FSD[1:0], FSW, ITFS, IRFS, INVTFS, INVRFS,
SLEN[4:0], INVxSCLK, MWORD[14], MWORD[13],
`ifdef FD_DFT
SCAN_TEST,
`endif

SP_ENg, RFSsm, TFSsm, SCLKg3_, SCLKg4, SCLKg5,
SCLKg6, FSi_set,
SCLKo, T_SCLK, RFSi, T_RFS, TFSi, T_TFS);


TXctl0 txctl (/* in */ RST, DSPCLK, GO_Cx, EX_en, SCLKg5, SCLKg6,
SP_EN, SP_ENg, TFSsm, TSack, Twrap, SLEN[4:0],
MWORD[15:0], TBUF, logTX[7:0], MTTX_E,
DMDin[15:0], DTYPE[1], SLEN_ex, FSi_set,
`ifdef FD_DFT
SCAN_TEST,
`endif
TD, TSreq, IST, TX[15:0], SLOT_NUM[3:0]);


RXctl0 rxctl (/* in */ RST, DSPCLK, GO_Cx, EX_en, SCLKg3_, SCLKg4,
SP_ENg, RFSsm, RD, RSack, Rwrap, SLEN[4:0],
MWORD[15:0], RBUF, expRX[15:0], MTRX_E,
DTYPE[1:0], DMDin[15:0], FSi_set,
`ifdef FD_DFT
SCAN_TEST,
`endif
RSreq, ISR, RX[15:0], SLOT1_EXT[3:2]);


COMPAND cmpd (/* in */ DTYPE[1:0], RX[15:0], TX[15:0],
expRX[15:0], logTX[7:0]);



DMDbuf DMDIN_BUF(DMD[15:0], DMDin[15:0]);

endmodule







module SPGLUE0 (/* in */ T_RST, DSPCLK, LOOP, TD, RDx,
`ifdef FD_DFT
SCAN_TEST,
`endif
RST, RD, TDx);

`ifdef FD_DFT
input SCAN_TEST;
`endif
input T_RST, DSPCLK, LOOP, TD, RDx;
output RST, RD, TDx;

`ifdef FD_DFT
reg RST_h;
wire RST;
always @(posedge DSPCLK) RST_h <= #`db T_RST;
assign RST = SCAN_TEST ? T_RST : RST_h;
`else
reg RST;
always @(posedge DSPCLK) RST <= #`db T_RST;
`endif

assign #`da RD = LOOP ? TD : RDx;
assign #`da TDx = LOOP ? 1'b0 : TD;

endmodule
