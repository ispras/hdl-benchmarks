






`include "x_def.v"


module SPORT1 (/* -------- Inputs : --------- */
/* pin */ RDx,
/* core */ T_RST, DSPCLK, GO_Cx, EX_en, MTTX_E,
MTRX_E, Twrap, Rwrap, DMD[15:0],
/* memc */ SP_EN, selAUTO, selFSDIV, selSCLKDIV,
selSCTL, selMWORD, AUTO_we, FSDIV_we,
SCLKDIV_we, SCTL_we, MWORD_we, MMR_web,
/* auto */ TSack, RSack,
`ifdef DFT
/* dft */ SCAN_TEST,
`endif


/* -------- Outputs : -------- */
/* pin */ TDx,
/* core */ ISR, IST, TIREG[2:0], TMREG[1:0],
RIREG[2:0], RMREG[1:0],
/* auto */ TSreq, RSreq, RX[15:0], TX[15:0],
/* rego */ DMD_do[15:0],

/* -------- Inouts : -------- */
/* pin */ SCLKo, T_SCLK, ISCLK,
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
`ifdef DFT
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

assign RX=0;
assign TX=0;
assign DMD_do=0;
assign TIREG=0;
assign RIREG=0;
assign TMREG=0;
assign RMREG=0;

assign TDx=0;
assign ISR=0;
assign IST=0;
assign TSreq=0;
assign RSreq=0;
assign ISCLK=0;
assign SCLKo=0;
assign IRFS=0;
assign RFSi=0;
assign ITFS=0;
assign TFSi=0;


endmodule
