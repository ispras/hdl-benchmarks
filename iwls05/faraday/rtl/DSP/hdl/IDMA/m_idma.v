






`include "x_def.v"
`include "delaya.v"















































module IDMA (/* -------- Inputs : --------- */
 X_IRDn, X_IWRn, X_ISn, X_IAL, X_BMODE, X_MMAP,
selECM, PM_bdry_sel,
 STBY, Awake_h,
 T_RSTn, GRST, DSPCLK, GO_Fx, GO_Ex, IDLE_ST_h,
ICE_ST_h, ICE_ST, DMDin,PMOVL_dsp,
DMOVL_dsp, CMAin, redoIF_h,
 DWWAIT, DRWAIT, DCTL_wei, DOVL_wei,
MMR_web,
 STEAL, DSack, DSreqx,
 IDR, accCM_R, accCM_E, wrCM_R,
 BDMA_end, BDMA_boot, BCMRD_cyc,
BOVL, BRdataBUF, BCM_cyc,
BSreqx, BM_cyc, ECYC,
`ifdef FD_DFT
 SCAN_TEST,
`endif

 IACKn,
 BOOT, DCTL, DOVL,
 PMOVL, DMOVL,
 idmaDMD_oe, idmaPMD_oe, idmaPMD_do,
 DSreq, DWRcyc, PWRcyc, DRDcyc, PRDcyc,
 CM_cs, CM_web, CM_oe,
CMo_cs0, CMo_cs1, CMo_cs2, CMo_cs3, CMo_cs4,
CMo_cs5, CMo_cs6, CMo_cs7,
CMo_oe0, CMo_oe1, CMo_oe2, CMo_oe3,
CMo_oe4, CMo_oe5, CMo_oe6, CMo_oe7,


 T_IAD, IAD_do, IAD_oe,
 PMDin, CM_rd, CM_wd,
 GO_STEAL);

input [23:0] BRdataBUF;
input [11:0] BOVL;
input BDMA_end,
BDMA_boot,
BCMRD_cyc,
BCM_cyc,
BSreqx,
BM_cyc,
ECYC,
PM_bdry_sel;

input [13:12] CMAin;
input [15:0] DMDin,
T_IAD;
input [7:0] PMOVL_dsp;
input [3:0] DMOVL_dsp;
input [2:0] DWWAIT,
DRWAIT;
input [23:0] IDR;
input T_RSTn,
GRST,
DSPCLK,
selECM,
STBY,
Awake_h,
X_BMODE,
X_MMAP,
X_IRDn,
X_IWRn,
X_ISn,
X_IAL,
redoIF_h,
GO_Fx,
GO_Ex,
IDLE_ST_h,
ICE_ST_h,
ICE_ST,
DCTL_wei,
DOVL_wei,
STEAL,
DSack,
DSreqx,
accCM_R, accCM_E,
wrCM_R,
MMR_web;

`ifdef FD_DFT
input SCAN_TEST;
`endif


output [15:0] idmaPMD_do,
IAD_do;
output [14:0] DCTL;
output [11:0] DOVL;
output [3:0] PMOVL,
DMOVL;
output BOOT,
IACKn,
DSreq,
DWRcyc,
PWRcyc,

DRDcyc,
PRDcyc,

CM_web,
CM_oe,
CMo_oe0, CMo_oe1,
CMo_oe2, CMo_oe3,
CMo_oe4, CMo_oe5,
CMo_oe6, CMo_oe7,
CM_cs,
CMo_cs0, CMo_cs1,
CMo_cs2, CMo_cs3,
CMo_cs4, CMo_cs5,
CMo_cs6, CMo_cs7,
idmaDMD_oe,
idmaPMD_oe,
IAD_oe,
GO_STEAL;


input [23:0] CM_rd;
output [23:0] CM_wd;

input [15:0] PMDin;


reg [2:0] RDcnt, WRcnt;
reg [7:0] DTMP_L;
reg [14:0] DCTL;
reg [11:0] DOVL;
reg [15:0] IADi, DTMP_H;
reg ISn, IAL, IRDn, IWRn, IACKn, PM_1st,
PCrd_1st, RDcyc, WRcyc, DSreq, WRtrue,

RDCMD, WRCMD, RDCMD_d1, WRCMD_d1, IDMA_boot;

wire [3:0] CMOVL;
wire [7:0] DTMP_Ldi;
wire [14:0] DCTL_di;
wire [11:0] DOVL_di;
wire [15:0] DTMP_Hdi;
wire [13:0] IDMAA;
wire GO_CMA;
wire RDendi, WRendi, RDend, WRend, PCRDcyc, PRDcyc,
CWRcyc, CRDcyc, DRDcyc, PCWRcyc, DWRcyc, sPM_1st,
tPM_1st, tPCrd_1st, RDcnteq0, WRcnteq0, DCTL_we,
DOVL_we, ldDCTL_ext, ldDOVL_ext, IDMcyc,
sDSreq, ldRDcnt, dnRDcnt, ldWRcnt, dnWRcnt,
ldDTMP_ext, upDCTL, ldDTMP_H, ldDTMP_L, selPM,
selCM, CM_we_h, RDbeg, WRbeg, GO_STEAL, GO_DSreq,
PCrd_end, IDMA_end;

wire CMcs_en, CMcs_nx, CMcs0_nx, CMcs1_nx, CMcs2_nx,
CMcs3_nx, CMcs4_nx, CMcs5_nx, CMcs6_nx, CMcs7_nx, GO_CMcs, REGCLK,
DMACLK;
























`ifdef FD_GTCLK

GTECH_NOT uck0 (.Z(MMR_we), .A(MMR_web));
GtCLK_NOR3 uck1 (.Z(REGCLK_enb), .A(IAL), .B(IACKn), .C(MMR_we));
GTECH_NOT uck3 (.Z(IACKn_), .A(IACKn));
GtCLK_AND3 uck4 (.Z(DMACLK_enb), .A(IRDn), .B(IWRn), .C(IACKn_));

`ifdef FD_DFT
GTECH_AND_NOT utm0 (.Z(REGCLK_enb_dft), .A(REGCLK_enb), .B(SCAN_TEST));
GTECH_NOR2 uck2 (.Z(REGCLK_), .A(DSPCLK), .B(REGCLK_enb_dft));
GTECH_AND_NOT utm1 (.Z(DMACLK_enb_dft), .A(DMACLK_enb), .B(SCAN_TEST));
GTECH_NOR2 uck5 (.Z(DMACLK_), .A(DSPCLK), .B(DMACLK_enb_dft));
`else
GTECH_NOR2 uck2 (.Z(REGCLK_), .A(DSPCLK), .B(REGCLK_enb));
GTECH_NOR2 uck5 (.Z(DMACLK_), .A(DSPCLK), .B(DMACLK_enb));
`endif

GtCLK_NOT ckREGCLK (.Z(REGCLK), .A(REGCLK_));
GtCLK_NOT ckDMACLK (.Z(DMACLK), .A(DMACLK_));

`else

wire REGCLK_en = !(!IAL && !IACKn && MMR_web);
wire DMACLK_en = !(IRDn && IWRn && !IACKn);
assign #`da REGCLK = DSPCLK ;
assign #`da DMACLK = DSPCLK ;

`endif

always @(posedge DSPCLK)
if (!X_ISn) IADi[15:0] <= #`db T_IAD[15:0];




`ifdef FD_DFT
reg RST_pin_h, RST_h;
wire RST_pin, RST;
always @(posedge DSPCLK) RST_pin_h <= #`db !T_RSTn;
always @(posedge DSPCLK) RST_h <= #`db GRST;

assign RST_pin = SCAN_TEST ? !T_RSTn : RST_pin_h;
assign RST = SCAN_TEST ? GRST : RST_h;

`else
reg RST_pin, RST;
always @(posedge DSPCLK) RST_pin <= #`db !T_RSTn;
always @(posedge DSPCLK) RST <= #`db GRST;
`endif


always @(posedge DSPCLK) begin
ISn <= #`db X_ISn;
IAL <= #`db X_IAL;
IRDn <= #`db X_IRDn;
IWRn <= #`db X_IWRn;
end




always @(posedge DSPCLK) begin
RDCMD <= #`db !(X_ISn || X_IRDn);
WRCMD <= #`db !(X_ISn || X_IWRn);
RDCMD_d1 <= #`db RDCMD;
WRCMD_d1 <= #`db WRCMD;
end

assign #`da RDbeg = RDCMD && !RDCMD_d1;
assign #`da WRbeg = WRCMD && !WRCMD_d1;




assign #`da PCrd_end = !RDCMD && RDCMD_d1;




always @(posedge DSPCLK or posedge RST) begin
if (RST) IACKn <= #`db 1'b0;
else begin
if (RDbeg || WRbeg) IACKn <= #`db 1'b1;
if (RDend || WRend) IACKn <= #`db 1'b0;
end
end






assign #`da IAD_do[15:0]
= ICE_ST ? 16'ha4a4 : (IDMcyc || PCrd_1st) ? DTMP_H[15:0] : {8'b0, DTMP_L[7:0]};

assign #`da IAD_oe = RDCMD || RDcyc;






































assign #`da ldDCTL_ext = IAL && !ISn && !IADi[15];
assign #`da ldDOVL_ext = IAL && !ISn && IADi[15];

assign #`da DCTL_we = ldDCTL_ext || DCTL_wei;
assign #`da DOVL_we = ldDOVL_ext || DOVL_wei;

assign #`da upDCTL = (RDend || WRend) && (IDMcyc || !PM_1st);

assign #`da DCTL_di[14:0] = IAL ? IADi[14:0] : DMDin[14:0];
assign #`da DOVL_di[11:0] = IAL ? IADi[11:0] : DMDin[11:0];




always @(posedge REGCLK or posedge RST) begin
if (RST) DCTL[14] <= #`db 1'b0;
`ifdef FD_GTCLK
else if (DCTL_we) DCTL[14] <= #`db DCTL_di[14];
`else
else if (DCTL_we & REGCLK_en) DCTL[14] <= #`db DCTL_di[14];
`endif

end

always @(posedge REGCLK or posedge RST) begin
if (RST) DCTL[13:0] <= #`db 14'b0;
`ifdef FD_GTCLK
else if (DCTL_we) DCTL[13:0] <= #`db DCTL_di[13:0];
else if (upDCTL) DCTL[13:0] <= #`db DCTL[13:0] + 1;
`else
else if (DCTL_we & REGCLK_en) DCTL[13:0] <= #`db DCTL_di[13:0];
else if (upDCTL & REGCLK_en) DCTL[13:0] <= #`db DCTL[13:0] + 1;
`endif

end

assign #`d0 IDMcyc = DCTL[14];
assign #`d0 IDMAA[13:0] = DCTL[13:0];




always @(posedge REGCLK or posedge RST) begin
if (RST) DOVL[11:0] <= #`db 12'b0;
`ifdef FD_GTCLK
else if (DOVL_we) DOVL[11:0] <= #`db DOVL_di[11:0];
`else
else if (DOVL_we & REGCLK_en) DOVL[11:0] <= #`db DOVL_di[11:0];
`endif

end


















assign #`da RDendi = !(IDMcyc || PM_1st) ? RDcnteq0
: DSack;
assign #`da RDend = RDendi && RDcyc;

always @(posedge DSPCLK or posedge RST) begin
if (RST) RDcyc <= #`db 1'b0;
else if (RDbeg) RDcyc <= #`db 1'b1;
else if (RDendi) RDcyc <= #`db 1'b0;
end

assign #`da DRDcyc = RDcyc && IDMcyc;
assign #`da PCRDcyc = RDcyc && !IDMcyc;

assign #`da PRDcyc = PCRDcyc && selPM;
assign #`da CRDcyc = PCRDcyc && selCM;




assign #`da ldRDcnt = RDbeg && !IDMcyc && !PM_1st;
assign #`da dnRDcnt = PCRDcyc && !PM_1st;

always @(posedge DMACLK or posedge RST) begin
if (RST) RDcnt[2:0] <= #`db 3'h7;
`ifdef FD_GTCLK
else if (ldRDcnt) RDcnt[2:0] <= #`db DRWAIT[2:0];
else if (dnRDcnt) RDcnt[2:0] <= #`db RDcnt - 1;
`else
else if (ldRDcnt & DMACLK_en) RDcnt[2:0] <= #`db DRWAIT[2:0];
else if (dnRDcnt & DMACLK_en) RDcnt[2:0] <= #`db RDcnt - 1;
`endif

end

assign #`da RDcnteq0 = (RDcnt[2:0] == 3'b0);
















assign #`da WRendi = !IDMcyc && PM_1st ? WRcnteq0
: DSack;
assign #`da WRend = WRendi && WRcyc;

always @(posedge DSPCLK or posedge RST) begin
if (RST) WRcyc <= #`db 1'b0;
else if (WRbeg) WRcyc <= #`db 1'b1;
else if (WRendi) WRcyc <= #`db 1'b0;
end

assign #`da DWRcyc = WRcyc && IDMcyc;
assign #`da PCWRcyc = WRcyc && !IDMcyc;

assign #`da PWRcyc = PCWRcyc && selPM;
assign #`da CWRcyc = PCWRcyc && selCM;










assign #`da ldDTMP_ext = WRtrue && !ISn && !IWRn;

always @(posedge DSPCLK or posedge RST) begin
if (RST) WRtrue <= #`db 1'b0;
else if (WRbeg) WRtrue <= #`db 1'b1;
else if (WRcnteq0) WRtrue <= #`db 1'b0;
end

assign #`da ldWRcnt = WRbeg;
assign #`da dnWRcnt = WRtrue;

always @(posedge DMACLK or posedge RST) begin
if (RST) WRcnt[2:0] <= #`db 3'h7;
`ifdef FD_GTCLK
else if (ldWRcnt) WRcnt[2:0] <= #`db DWWAIT[2:0];
else if (dnWRcnt) WRcnt[2:0] <= #`db WRcnt - 1;
`else
else if (ldWRcnt & DMACLK_en) WRcnt[2:0] <= #`db DWWAIT[2:0];
else if (dnWRcnt & DMACLK_en) WRcnt[2:0] <= #`db WRcnt - 1;
`endif

end

assign #`da WRcnteq0 = (WRcnt[2:0] == 3'b0);


















assign #`da ldDTMP_H = (RDend || ldDTMP_ext) && (IDMcyc || PM_1st);

assign #`da DTMP_Hdi[15:0]
= DRDcyc ? DMDin[15:0] :
PRDcyc ? PMDin[15:0] :
CRDcyc ? CM_rd[23:8]
: IADi[15:0];

always @(posedge DSPCLK)

if (ldDTMP_H) DTMP_H[15:0] <= #`db DTMP_Hdi[15:0];




assign #`da ldDTMP_L = !IDMcyc && (PM_1st ? RDend : ldDTMP_ext);

assign #`da DTMP_Ldi[7:0]
= PRDcyc ? 8'b0 :
CRDcyc ? CM_rd[7:0]
: IADi[7:0];

always @(posedge DMACLK)
`ifdef FD_GTCLK
if (ldDTMP_L) DTMP_L[7:0] <= #`db DTMP_Ldi[7:0];
`else
if (ldDTMP_L & DMACLK_en) DTMP_L[7:0] <= #`db DTMP_Ldi[7:0];
`endif














assign #`da IDMA_end = (IDMAA == 14'b0) && WRend && !(IDMcyc || PM_1st);

always @(posedge DSPCLK or posedge RST_pin) begin
if (RST_pin) IDMA_boot <= #`db !X_MMAP && X_BMODE;
else if (IDMA_end) IDMA_boot <= #`db 1'b0;
end

assign #`da BOOT = BDMA_boot || IDMA_boot;





































assign #`da sPM_1st = DCTL_we || DOVL_we;

assign #`da tPM_1st = (WRend || RDend) && !IDMcyc;

always @(posedge DSPCLK or posedge RST) begin
if (RST) PM_1st <= #`db 1'b1;
else if (sPM_1st) PM_1st <= #`db 1'b1;
else if (tPM_1st) PM_1st <= #`db !PM_1st;
end




assign #`da tPCrd_1st = PCrd_end && !IDMcyc;

always @(posedge DSPCLK or posedge RST) begin
if (RST) PCrd_1st <= #`db 1'b1;
else if (sPM_1st) PCrd_1st <= #`db 1'b1;
else if (tPCrd_1st) PCrd_1st <= #`db !PCrd_1st;
end




Delaya d1 (DSack, delDSack);

assign #`da sDSreq = RDbeg && IDMcyc ||
RDbeg && !IDMcyc && PM_1st ||
WRcnteq0 && DWRcyc ||
WRcnteq0 && PCWRcyc && !PM_1st;
`ifdef FD_DFT
wire rDSreq_h = (RST || delDSack);
wire rDSreq = SCAN_TEST ? RST : rDSreq_h;
`else
wire rDSreq = RST || delDSack;
`endif

always @(posedge DSPCLK or posedge rDSreq) begin
if (rDSreq) DSreq <= #`db 1'b0;
else if (sDSreq) DSreq <= #`db 1'b1;
end


























assign #`da GO_DSreq = DSreqx & GO_STEAL;

assign #`da CMOVL[3:0] = GO_DSreq ? DOVL[3:0] :
BSreqx ? BOVL[3:0] : PMOVL_dsp[3:0];

assign #`da PMOVL[3:0] = GO_DSreq ? DOVL[11:8] :
BSreqx ? BOVL[11:8] : PMOVL_dsp[7:4];

assign #`da DMOVL[3:0] = GO_DSreq ? DOVL[7:4] :
BSreqx ? BOVL[7:4] : DMOVL_dsp[3:0];









assign #`da GO_STEAL = GO_Ex || STEAL || BOOT || STBY || BM_cyc && ECYC;










assign #`da idmaDMD_oe = DSreqx && DWRcyc && GO_STEAL;




























assign #`da idmaPMD_oe = DSreqx && PWRcyc && GO_STEAL;

assign #`d0 idmaPMD_do[15:0] = DTMP_H[15:0];



























`ifdef FD_DFT
assign #`da CMcs_en = !(IDLE_ST_h && !Awake_h && !(DSreqx || BSreqx) ||
ICE_ST_h && !(accCM_R || accCM_E))
&& !selECM && !SCAN_TEST;
`else
assign #`da CMcs_en = !(IDLE_ST_h && !Awake_h && !(DSreqx || BSreqx) ||
ICE_ST_h && !(accCM_R || accCM_E))
&& !selECM ;
`endif
assign #`da GO_CMA = GO_Fx || STEAL || STBY || BOOT || redoIF_h || BM_cyc && ECYC;


assign #`da GO_CMcs = GO_CMA || IDLE_ST_h || ICE_ST_h;

wire CM_rgn, CMo_rgn;


assign #`da CM_rgn = PM_bdry_sel ? (CMAin[13:12] == 2'b00) :
(CMAin[13] == 1'b0);

assign #`da CMo_rgn = PM_bdry_sel ? (CMAin[13:12] == 2'b01) :
(CMAin[13:12] == 2'b10);

assign #`da CMcs_nx = CM_rgn && CMcs_en;
assign #`da CMcs0_nx = (CMo_rgn && (CMOVL[3:0] == 4'h0)) && CMcs_en;
assign #`da CMcs1_nx = (CMo_rgn && (CMOVL[3:0] == 4'h1)) && CMcs_en;
assign #`da CMcs2_nx = (CMo_rgn && (CMOVL[3:0] == 4'h2)) && CMcs_en;
assign #`da CMcs3_nx = (CMo_rgn && (CMOVL[3:0] == 4'h3)) && CMcs_en;
assign #`da CMcs4_nx = (CMo_rgn && (CMOVL[3:0] == 4'h4)) && CMcs_en;
assign #`da CMcs5_nx = (CMo_rgn && (CMOVL[3:0] == 4'h5)) && CMcs_en;
assign #`da CMcs6_nx = (CMo_rgn && (CMOVL[3:0] == 4'h6)) && CMcs_en;
assign #`da CMcs7_nx = (CMo_rgn && (CMOVL[3:0] == 4'h7)) && CMcs_en;


assign #`da CM_cs = CMcs_nx && GO_CMcs ;
assign #`da CMo_cs0 = CMcs0_nx && GO_CMcs ;
assign #`da CMo_cs1 = CMcs1_nx && GO_CMcs ;
assign #`da CMo_cs2 = CMcs2_nx && GO_CMcs ;
assign #`da CMo_cs3 = CMcs3_nx && GO_CMcs ;
assign #`da CMo_cs4 = CMcs4_nx && GO_CMcs ;
assign #`da CMo_cs5 = CMcs5_nx && GO_CMcs ;
assign #`da CMo_cs6 = CMcs6_nx && GO_CMcs ;
assign #`da CMo_cs7 = CMcs7_nx && GO_CMcs ;




reg CM_oe, CMo_oe0, CMo_oe1, CMo_oe2, CMo_oe3,
CMo_oe4, CMo_oe5, CMo_oe6, CMo_oe7;

always @(posedge DSPCLK)
begin
CM_oe <=#`db CMcs_nx && GO_CMcs;
CMo_oe0 <=#`db CMcs0_nx && GO_CMcs;
CMo_oe1 <=#`db CMcs1_nx && GO_CMcs;
CMo_oe2 <=#`db CMcs2_nx && GO_CMcs;
CMo_oe3 <=#`db CMcs3_nx && GO_CMcs;
CMo_oe4 <=#`db CMcs4_nx && GO_CMcs;
CMo_oe5 <=#`db CMcs5_nx && GO_CMcs;
CMo_oe6 <=#`db CMcs6_nx && GO_CMcs;
CMo_oe7 <=#`db CMcs7_nx && GO_CMcs;
end



assign #`da CM_wd[23:0] = DSreqx ? {DTMP_H[15:0], DTMP_L[7:0]} :
BSreqx && BCMRD_cyc ? BRdataBUF[23:0] : IDR[23:0];




assign #`da CM_we_h = ICE_ST_h ? wrCM_R && GO_Ex
: GO_STEAL && (selCM && DSreqx && CWRcyc ||
BCMRD_cyc && BSreqx );

assign #`d0 CM_web = !CM_we_h;



assign #`da selCM = PM_bdry_sel ? (IDMAA[13] == 1'b0) :
!(IDMAA[13:12] == 2'b11);

assign #`da selPM = PM_bdry_sel ? (IDMAA[13] == 1'b1) :
(IDMAA[13:12] == 2'b11);

endmodule
