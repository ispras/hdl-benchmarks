






`include "x_def.v"


module EMC (/* ------------ Inputs : ------------- */
/* glob */ DSPCLK, T_RST, PPclr_h, DMD[15:0], selECM,
PM_bdry_sel,
/* psq */ GO_Fx, GO_Ex, GO_EC, ECYC, BGn, PMOVL_dsp[7:0],
DMOVL_dsp[3:0], Dummy_E,
/* dec */ IOaddr[10:0], Double_E, accCM_E, rdCM_E,
/* memc */ DMA[13:0], PMA[13:0], WSCR_we, WSCR_ext_we, EXTC_Eg,
Pread_Ei, Pwrite_Ei, Dread_Ei, Dwrite_Ei,
IOcmd_Ei, IOread_Ei, IOwrite_Ei, MMR_web,
CMAin[13:0], ECMAWAITi[1:0],
/* sice */ IDR[23:0],
/* pins */ T_EA[7:0], T_ED[15:0],
/* glob */ PMDin[15:0],
/* CM */ CM_rd[23:0],
/* bdma */ BDMAmode, BMpage[7:0],
BDIR, BWdataBUF[7:0], BWRn, BEAD[13:0],
BSreq, BSack, BWend,
`ifdef FD_DFT
/* dft */ SCAN_TEST,
`endif

/* ------------ Outputs : ------------ */
/* pin */ EA_oe, EA_do[14:0], ED_oe, ED_do[15:0],
PMSn, DMSn, IOSn, BMSn,
CMSn, RDn, WRn, ECMSn, ECMA_EN,
/* psq */ eRDY,
/* rego */ WSCR[14:0], WSCR_ext[7:0], emcDMD_oe, emcDMD_do[15:0],
emcPMD_oe, emcPMD_do[15:0],
CM_rdata[23:0],
/* bdma */ ENS12, ECS12, ENS13, ECS13, ENS14,
ECS14, ENS0, BMcs
);

input [15:0] PMDin;
input [13:0] BEAD;
input [7:0] BMpage,
BWdataBUF;
input BDMAmode,
BDIR,
BWRn,
BSreq,
BSack,
BWend;


input [7:0] PMOVL_dsp;
input [3:0] DMOVL_dsp;

input [1:0] ECMAWAITi;
input [7:0] T_EA;
input [15:0] T_ED,
DMD;
input [13:0] PMA,
DMA,
CMAin;
input [23:0] IDR,
CM_rd;
input [10:0] IOaddr;
input DSPCLK,
PPclr_h,
PM_bdry_sel,
T_RST,
GO_Fx,
GO_Ex,
GO_EC,
selECM,
ECYC,
BGn,
EXTC_Eg,
Dummy_E,
Pread_Ei,
Pwrite_Ei,
Dread_Ei,
Dwrite_Ei,
IOcmd_Ei,
IOread_Ei,
IOwrite_Ei,
Double_E,
accCM_E,
rdCM_E,
WSCR_we,
WSCR_ext_we,
MMR_web;

`ifdef FD_DFT
input SCAN_TEST;
`endif

output [23:0] CM_rdata;
output [15:0] emcDMD_do,
emcPMD_do;
output [14:0] WSCR;
output [7:0] WSCR_ext;
output [14:0] EA_do;
output [15:0] ED_do;
output ED_oe,
EA_oe,
ECMA_EN,
ECMSn,
PMSn,
DMSn,
IOSn,
CMSn,
RDn,
WRn,
eRDY,
emcPMD_oe,
emcDMD_oe;

output BMSn,
ENS12,
ECS12,
ENS13,
ECS13,
ENS14,
ECS14,
ENS0,
BMcs;



assign emcDMD_do[15:0] = 16'b0;
assign emcPMD_do[15:0] = 16'b0;
assign WSCR[14:0] = 15'b0;
assign WSCR_ext[7:0] = 8'b0;
assign EA_do[14:0] = 15'b0;
assign ED_do[15:0] = 16'b0;
assign ED_oe = 1'b0;
assign EA_oe = 1'b0;
assign ECMA_EN = 1'b0;
assign ECMSn = 1'b1;
assign PMSn = 1'b1;
assign DMSn = 1'b1;
assign IOSn = 1'b1;
assign CMSn = 1'b1;
assign RDn = 1'b1;
assign WRn = 1'b1;
assign eRDY = 1'b1;
assign emcPMD_oe = 1'b0;
assign emcDMD_oe = 1'b0;
assign BMSn = 1'b1;
assign ENS12 = 1'b0;
assign ECS12 = 1'b0;
assign ENS13 = 1'b0;
assign ECS13 = 1'b0;
assign ENS14 = 1'b0;
assign ECS14 = 1'b0;
assign ENS0 = 1'b0;
assign BMcs = 1'b0;

wire [23:0] ECMDreg;
assign ECMDreg[23:0] = 24'b0;



assign CM_rdata[23:0] = selECM ? ECMDreg[23:0] : CM_rd[23:0];

endmodule

