






`include "../../include/x_def.v"
















module SPORT1 (/* -------- Inputs : --------- */
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
RIREG, RMREG,
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
ISCLK,
SCLKo,
IRFS,
RFSi,
ITFS,
TFSi;



wire [15:0] FSDIV, SCLKDIV, DMDin;
wire [15:0] MWORD;

wire [4:0] SLEN;
wire [1:0] FSD, DTYPE;
wire [3:2] SLOT1_EXT;
wire [3:0] SLOT_NUM;





SPGLUE1 glue (/* in */ T_RST, DSPCLK, LOOP, TD, RDx,
`ifdef FD_DFT
SCAN_TEST,
`endif
RST, RD, TDx);


SCreg1 regs (/* in */ RST, DSPCLK, selAUTO, selFSDIV, selSCLKDIV,
selSCTL, selMWORD, AUTO_we, FSDIV_we, SCLKDIV_we,
SCTL_we, MWORD_we, DMDin[15:0], MMR_web,
SLOT1_EXT[3:2], SLOT_NUM[3:0],
`ifdef FD_DFT
SCAN_TEST,
`endif
TIREG[2:0], TMREG[1:0], RIREG[2:0], RMREG[1:0],
TBUF, RBUF, FSDIV[15:0], SCLKDIV[15:0], LOOP,
ISCLK, FSD[1:0], FSW, ITFS, IRFS, INVTFS, INVRFS,
DTYPE[1:0], SLEN[4:0], MWORD[15:0], DMD_do[15:0],
SLEN_ex, INVxSCLK);


SCFG1 cfg (/* in */ RST, DSPCLK, SP_EN, FSDIV[15:0], SCLKDIV[15:0],
ISCLK, FSD[1:0], FSW, ITFS, IRFS, INVTFS, INVRFS,
SLEN[4:0], INVxSCLK, MWORD[14], MWORD[13],
`ifdef FD_DFT
SCAN_TEST,
`endif
SP_ENg, RFSsm, TFSsm, SCLKg3_, SCLKg4, SCLKg5,
SCLKg6, FSi_set,
SCLKo, T_SCLK, RFSi, T_RFS, TFSi, T_TFS);


TXctl1 txctl (/* in */ RST, DSPCLK, GO_Cx, EX_en, SCLKg5, SCLKg6,
SP_EN ,SP_ENg, TFSsm, TSack, Twrap, SLEN[4:0],
MWORD[15:0], TBUF, SLEN_ex, FSi_set,
/*logTX[7:0],*/ MTTX_E, DMDin[15:0],
`ifdef FD_DFT
SCAN_TEST,
`endif
TD, TSreq, IST, TX[15:0], SLOT_NUM[3:0]);


RXctl1 rxctl (/* in */ RST, DSPCLK, GO_Cx, EX_en, SCLKg3_, SCLKg4,
SP_ENg, RFSsm, RD, RSack, Rwrap, SLEN[4:0],
MWORD[15:0], RBUF, FSi_set,
/*expRX[15:0],*/ MTRX_E, DTYPE[1:0], DMDin[15:0],
`ifdef FD_DFT
SCAN_TEST,
`endif
RSreq, ISR, RX[15:0], SLOT1_EXT[3:2]);






`ifdef FD_synthesis
GTECH_BUF uu0 (.Z(DMDin[0]), .A(DMD[0]));
GTECH_BUF uu1 (.Z(DMDin[1]), .A(DMD[1]));
GTECH_BUF uu2 (.Z(DMDin[2]), .A(DMD[2]));
GTECH_BUF uu3 (.Z(DMDin[3]), .A(DMD[3]));
GTECH_BUF uu4 (.Z(DMDin[4]), .A(DMD[4]));
GTECH_BUF uu5 (.Z(DMDin[5]), .A(DMD[5]));
GTECH_BUF uu6 (.Z(DMDin[6]), .A(DMD[6]));
GTECH_BUF uu7 (.Z(DMDin[7]), .A(DMD[7]));
GTECH_BUF uu8 (.Z(DMDin[8]), .A(DMD[8]));
GTECH_BUF uu9 (.Z(DMDin[9]), .A(DMD[9]));
GTECH_BUF uu10 (.Z(DMDin[10]), .A(DMD[10]));
GTECH_BUF uu11 (.Z(DMDin[11]), .A(DMD[11]));
GTECH_BUF uu12 (.Z(DMDin[12]), .A(DMD[12]));
GTECH_BUF uu13 (.Z(DMDin[13]), .A(DMD[13]));
GTECH_BUF uu14 (.Z(DMDin[14]), .A(DMD[14]));
GTECH_BUF uu15 (.Z(DMDin[15]), .A(DMD[15]));
`else
assign DMDin[15:0] = DMD[15:0];
`endif


endmodule







module SPGLUE1 (/* in */ T_RST, DSPCLK, LOOP, TD, RDx,
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
