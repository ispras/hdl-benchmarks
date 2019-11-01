






`include "../../include/x_def.v"

module SPORT0 (/* -------- Inputs : --------- */
/* pin */ RDx,
/* core */ T_RST, DSPCLK, GO_Cx, EX_en, MTTX_E,
MTRX_E, Twrap, Rwrap, DMD[15:0],
/* memc */ SP_EN, selAUTO, selFSDIV, selSCLKDIV,
selSCTL, selMWORD, AUTO_we, FSDIV_we,
SCLKDIV_we, SCTL_we, MWORD_we, MMR_web,
/* auto */ TSack, RSack,
`ifdef FD_DFT
/* dft */ SCAN_TEST,
`endif


/* pin */ TDx,
/* core */ ISR, IST, TIREG[2:0], TMREG[1:0],
RIREG[2:0], RMREG[1:0], PDFORCE,
/* clkc */ XTALDIS, XTALDELAY, PUCR,
/* auto */ TSreq, RSreq, RX[15:0], TX[15:0],
/* rego */ DMD_do[15:0],

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


assign RX=0;
assign TX=0;
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





reg RST;
reg [15:12] AUTO_a;
wire [15:0] AUTO;

always @(posedge DSPCLK) RST <= #`db T_RST;

assign #`da AUTO[15:0] = {AUTO_a[15:12], 12'b0};

always @(posedge DSPCLK or posedge RST)
begin
if (RST)
begin
AUTO_a[15:14] <= #`db 2'b0;
AUTO_a[12] <= #`db 1'b0;
end
else if (AUTO_we)
begin
AUTO_a[15:14] <= #`db DMD[15:14];
AUTO_a[12] <= #`db DMD[12];
end
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) AUTO_a[13] <= #`db 1'b0;
else if (AUTO_we) AUTO_a[13] <= #`db DMD[13];
else if (AUTO_a[13]) AUTO_a[13] <= #`db 1'b0;
end

assign #`d0 XTALDIS = AUTO[15];
assign #`d0 XTALDELAY = AUTO[14];
assign #`d0 PDFORCE = AUTO[13];
assign #`d0 PUCR = AUTO[12];

assign #`da DMD_do[15:0] = {16{selAUTO}} & AUTO[15:0];


endmodule



