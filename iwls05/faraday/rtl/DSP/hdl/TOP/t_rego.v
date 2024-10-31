






`include "x_def.v"


module REGo (/* -------- Inputs : --------- */
DM_rdm,
DM_rd0, DM_rd1,
DM_rd2, DM_rd3,
DM_rd4, DM_rd5,
DM_rd6, DM_rd7,
PM_rd0, PM_rd1,
PM_rd2, PM_rd3,
PM_rd4, PM_rd5,
PM_rd6, PM_rd7,
CM_rdm,
CM_rd0, CM_rd1,
CM_rd2, CM_rd3,
CM_rd4, CM_rd5,
CM_rd6, CM_rd7,
DSPCLK, GO_Cx, redoSTI_h, Pwrite_Ei,
psqDMD_do, dagDMD_do,
euDMD_do, euPMD_do,
CKR,
SPT0_do, RX0,
SPT1_do, RX1,
PIO_do,
TMR_do,
DCTL, DOVL, idmaPMD_oe,
idmaDMD_oe, idmaPMD_do,
SREQ, spt0DMD_oe, spt1DMD_oe,
autoDMD_do,
WSCR, WSCR_ext, emcDMD_oe, emcDMD_do,
emcPMD_oe, emcPMD_do,
SYSRo, ldSREG_E, selSYSR, selCKR,
selDCTL, selDOVL, selWSCR, selWSCR_ext,
DM_oe,
DMo_oe0, DMo_oe1,
DMo_oe2, DMo_oe3,
DMo_oe4, DMo_oe5,
DMo_oe6, DMo_oe7,
PMo_oe0, PMo_oe1,
PMo_oe2, PMo_oe3,
PMo_oe4, PMo_oe5,
PMo_oe6, PMo_oe7,
CM_oe,
CMo_oe0, CMo_oe1,
CMo_oe2, CMo_oe3,
CMo_oe4, CMo_oe5,
CMo_oe6, CMo_oe7,
BRdataBUF, bdmaDMD_oe,
BDMAmmio, bdmaPMD_oe,


DM_wd, DMDin, PM_wd,
PMDin, CM_rd, SICEmmio);

input [23:0] BRdataBUF;
input [15:0] BDMAmmio;
input bdmaDMD_oe,
bdmaPMD_oe;

input [15:0] SICEmmio;

input [15:0] PM_rd0,
PM_rd1,
PM_rd2,
PM_rd3,
PM_rd4,
PM_rd5,
PM_rd6,
PM_rd7,
DM_rdm,
DM_rd0,
DM_rd1,
DM_rd2,
DM_rd3,
DM_rd4,
DM_rd5,
DM_rd6,
DM_rd7,
psqDMD_do,
dagDMD_do,
euDMD_do,
euPMD_do,
autoDMD_do,
emcDMD_do,
emcPMD_do,
idmaPMD_do;
input [23:0] CM_rdm,
CM_rd0,
CM_rd1,
CM_rd2,
CM_rd3,
CM_rd4,
CM_rd5,
CM_rd6,
CM_rd7;

input [15:0] CKR, SPT0_do, SPT1_do,
PIO_do, TMR_do, RX0, RX1;
input [11:0] DOVL;
input [14:0] DCTL, WSCR;
input [15:0] SYSRo;
input [7:0] WSCR_ext;
input DSPCLK,
GO_Cx,
SREQ,
redoSTI_h,
Pwrite_Ei,
emcDMD_oe, emcPMD_oe,
idmaDMD_oe,
idmaPMD_oe,
ldSREG_E,
selCKR, selSYSR, selDCTL, selDOVL,
selWSCR, selWSCR_ext, spt0DMD_oe, spt1DMD_oe;

input PMo_oe0,
PMo_oe1,
PMo_oe2,
PMo_oe3,
PMo_oe4,
PMo_oe5,
PMo_oe6,
PMo_oe7,
DM_oe,
DMo_oe0,
DMo_oe1,
DMo_oe2,
DMo_oe3,
DMo_oe4,
DMo_oe5,
DMo_oe6,
DMo_oe7,
CM_oe,
CMo_oe0,
CMo_oe1,
CMo_oe2,
CMo_oe3,
CMo_oe4,
CMo_oe5,
CMo_oe6,
CMo_oe7;

output [15:0] DM_wd, PM_wd,
DMDin, PMDin;
output [23:0] CM_rd;

reg [15:0] STD_C;

wire [15:0] SREG_do, DMDsteal, DM_wd0i, DM_wd0,
PM_wd0, mmioDMD_do, redoSTI_do;
wire bdmaDMD_oe, bdmaPMD_oe, DMDsteal_oe;




assign #`da SREG_do[15:0] = {16{selCKR}} & CKR[15:0] |
SPT0_do[15:0] |
SPT1_do[15:0] |
{16{selSYSR}}& SYSRo[15:0] |
PIO_do[15:0] |
TMR_do[15:0] |
{16{selDCTL}} & {1'b0, DCTL[14:0]} |
{16{selDOVL}} & {4'b0, DOVL[11:0]} |
{16{selWSCR}} & {1'b0, WSCR[14:0]} |
{16{selWSCR_ext}} & {8'b0, WSCR_ext[7:0]} |
BDMAmmio[15:0] |
SICEmmio[15:0];

assign #`da mmioDMD_do[15:0] = {16{ldSREG_E}} & SREG_do[15:0];





assign #`da DMDsteal_oe = idmaDMD_oe || spt0DMD_oe || spt1DMD_oe || bdmaDMD_oe;

assign #`da DMDsteal[15:0] = {16{idmaDMD_oe}} & idmaPMD_do[15:0] |
{16{spt0DMD_oe}} & RX0[15:0] |
{16{spt1DMD_oe}} & RX1[15:0] |
{16{bdmaDMD_oe}} & BRdataBUF[15:0];







always @(posedge DSPCLK)
begin
if (SREQ && GO_Cx)
STD_C[15:0] <= #`db Pwrite_Ei ? euPMD_do[15:0] : DM_wd0i[15:0];
end












assign #`da redoSTI_do[15:0] = {16{redoSTI_h}} & STD_C[15:0];

assign #`da PM_wd0[15:0] = euPMD_do[15:0] | redoSTI_do[15:0];

assign #`da PM_wd[15:0] = idmaPMD_oe ? idmaPMD_do[15:0] :
bdmaPMD_oe ? BRdataBUF[23:8] : PM_wd0[15:0];

reg[15:0] PMDin_rd;

wire [7:0] PMo_oe = {PMo_oe0, PMo_oe1, PMo_oe2, PMo_oe3, PMo_oe4, PMo_oe5, PMo_oe6, PMo_oe7};

always @(PM_rd0 or PM_rd1 or PM_rd2 or PM_rd3 or PM_rd4 or PM_rd5 or PM_rd6 or PM_rd7 or
PMo_oe) begin
case(PMo_oe)
8'b10000000 : PMDin_rd[15:0] = PM_rd0[15:0];
8'b01000000 : PMDin_rd[15:0] = PM_rd1[15:0];
8'b00100000 : PMDin_rd[15:0] = PM_rd2[15:0];
8'b00010000 : PMDin_rd[15:0] = PM_rd3[15:0];
8'b00001000 : PMDin_rd[15:0] = PM_rd4[15:0];
8'b00000100 : PMDin_rd[15:0] = PM_rd5[15:0];
8'b00000010 : PMDin_rd[15:0] = PM_rd6[15:0];
8'b00000001 : PMDin_rd[15:0] = PM_rd7[15:0];
default : PMDin_rd[15:0] = PM_rd0[15:0];
endcase
end

assign PMDin[15:0] = |{PMo_oe[7:0]} ? PMDin_rd[15:0] :
emcPMD_oe ? emcPMD_do[15:0] : euPMD_do[15:0];
























assign #`da DM_wd0i[15:0] = autoDMD_do[15:0] |
mmioDMD_do[15:0] |
psqDMD_do[15:0] |
dagDMD_do[15:0] |
euDMD_do[15:0];

assign #`da DM_wd0[15:0] = DM_wd0i[15:0] | redoSTI_do[15:0];

assign #`da DM_wd[15:0] = DMDsteal_oe ? DMDsteal[15:0] : DM_wd0[15:0];

reg[15:0] DMDin_rd;

wire [8:0] DMo_oe = {DM_oe, DMo_oe0, DMo_oe1, DMo_oe2, DMo_oe3, DMo_oe4,
DMo_oe5, DMo_oe6, DMo_oe7};

always @(DM_rdm or DM_rd0 or DM_rd1 or DM_rd2 or DM_rd3 or DM_rd4 or DM_rd5 or DM_rd6 or DM_rd7 or
DMo_oe) begin
case(DMo_oe)
9'b100000000 : DMDin_rd[15:0] = DM_rdm[15:0];
9'b010000000 : DMDin_rd[15:0] = DM_rd0[15:0];
9'b001000000 : DMDin_rd[15:0] = DM_rd1[15:0];
9'b000100000 : DMDin_rd[15:0] = DM_rd2[15:0];
9'b000010000 : DMDin_rd[15:0] = DM_rd3[15:0];
9'b000001000 : DMDin_rd[15:0] = DM_rd4[15:0];
9'b000000100 : DMDin_rd[15:0] = DM_rd5[15:0];
9'b000000010 : DMDin_rd[15:0] = DM_rd6[15:0];
9'b000000001 : DMDin_rd[15:0] = DM_rd7[15:0];
default : DMDin_rd[15:0] = DM_rd0[15:0];
endcase
end

assign #`da DMDin[15:0] = |{DMo_oe[8:0]} ? DMDin_rd[15:0] :
emcDMD_oe ? emcDMD_do[15:0] : DM_wd0[15:0];



















reg[23:0] CM_rd;

wire [8:0] CMo_oe = {CM_oe, CMo_oe0, CMo_oe1, CMo_oe2, CMo_oe3, CMo_oe4,
CMo_oe5, CMo_oe6, CMo_oe7};

always @(CM_rdm or CM_rd0 or CM_rd1 or CM_rd2 or CM_rd3 or CM_rd4 or CM_rd5 or CM_rd6 or CM_rd7 or
CMo_oe) begin
case(CMo_oe)
9'b100000000 : CM_rd[23:0] = CM_rdm[23:0];
9'b010000000 : CM_rd[23:0] = CM_rd0[23:0];
9'b001000000 : CM_rd[23:0] = CM_rd1[23:0];
9'b000100000 : CM_rd[23:0] = CM_rd2[23:0];
9'b000010000 : CM_rd[23:0] = CM_rd3[23:0];
9'b000001000 : CM_rd[23:0] = CM_rd4[23:0];
9'b000000100 : CM_rd[23:0] = CM_rd5[23:0];
9'b000000010 : CM_rd[23:0] = CM_rd6[23:0];
9'b000000001 : CM_rd[23:0] = CM_rd7[23:0];
default : CM_rd[23:0] = CM_rdm[23:0];
endcase
end
endmodule
