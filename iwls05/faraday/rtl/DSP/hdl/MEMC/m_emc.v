`include "x_def.v"

module EMC (/* ------------ Inputs : ------------- */
DSPCLK, T_RST, PPclr_h, DMD, selECM,
PM_bdry_sel,
GO_Fx, GO_Ex, GO_EC, ECYC, BGn, PMOVL_dsp,
DMOVL_dsp, Dummy_E,
IOaddr, Double_E, accCM_E, rdCM_E,
DMA, PMA, WSCR_we, WSCR_ext_we, EXTC_Eg,
Pread_Ei, Pwrite_Ei, Dread_Ei, Dwrite_Ei,
IOcmd_Ei, IOread_Ei, IOwrite_Ei, MMR_web,
CMAin, ECMAWAITi,
IDR,
T_EA, T_ED,
PMDin,
CM_rd,
BDMAmode, BMpage,
BDIR, BWdataBUF, BWRn, BEAD,
BSreq, BSack, BWend,
`ifdef FD_DFT
SCAN_TEST,
`endif


EA_oe, EA_do, ED_oe, ED_do,
PMSn, DMSn, IOSn, BMSn,
CMSn, RDn, WRn, ECMSn, ECMA_EN,
eRDY,
WSCR, WSCR_ext, emcDMD_oe, emcDMD_do,
emcPMD_oe, emcPMD_do,
CM_rdata,
ENS12, ECS12, ENS13, ECS13, ENS14,
ECS14, ENS0, BMcs
);

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



input [15:0] PMDin;

wire [14:0] WSCR;


reg [3:0] ECS, ENS;
reg [15:0] ED_do_h;
reg [13:0] ECMA;
reg [23:0] ECMDreg;
reg [15:0] PMDreg, DMDreg;
reg [5:0] RWcnt;
reg IOcst, PMcst, DMcst, ED_oei,
selPMDi, selDMDi, RDn, WRn_h, eRDY, PMDoe,
DMDoe, EXTC_Eg_syn, ECMcs, ECMA_EN;
wire IOcs, PMcs, DMcs, selPMD, selDMD;
wire [15:0] ED_do;

wire [5:0] RWcnt_ref;
wire [5:0] DMWAIT, PMWAIT, IOWAIT;
wire [3:0] ECMAWAIT;
wire [7:0] WSCR_ext;

wire selEDM, selEDMg,
GO_EDM;
wire RWend, RWcnt_en, RWcnt_clr, selEPM, IOext,
IOcs_nx, IOcs_clr, PMcs_nx, PMcs_clr,
PMDoe_clr, DMDoe_clr, DMcs_nx, DMcs_clr,
selPMD_h, selDMD_h, selECMD_h, ED_oe_h, RD_h,
WR_h, PMDlat, DMDlat, eRDY_h, CMcs, CMDlat, WRn;

wire ENS0, ENS1, ENS2, ENS3, ENS4, ENS5, ENS6, ENS8, ENS9, ENS10, ENS11, ENS12,
ENS13, ENS14;

wire ECS0, ECS1, ECS2, ECS3, ECS5, ECS6, ECS8, ECS9, ECS10, ECS11, ECS12, ECS13,
ECS14;

wire BMSn;
reg BMcs;


wire EMCLK1, EMCLK2, ECMCLK1, ECMCLK2;








`ifdef FD_DFT
reg RST_o, PPclr_o;
wire RST, PPclr;
always @(posedge DSPCLK) begin
RST_o <= #`db T_RST;
PPclr_o <= #`db T_RST || PPclr_h && !BDMAmode;
end
assign RST = SCAN_TEST ? T_RST : RST_o;
assign PPclr = SCAN_TEST ? T_RST : PPclr_o;
`else
reg RST, PPclr;

always @(posedge DSPCLK) begin
RST <= #`db T_RST;
PPclr <= #`db T_RST || PPclr_h && !BDMAmode;
end
`endif



always @(posedge DSPCLK) EXTC_Eg_syn <= #`db EXTC_Eg;

`ifdef FD_GTCLK

GtCLK_NOR2 uu0 (.Z(CKenb), .A(EXTC_Eg), .B(EXTC_Eg_syn));
`ifdef FD_DFT
GTECH_AND_NOT utm0 (.Z(CKenb_dft), .A(CKenb), .B(SCAN_TEST));
GTECH_NOR2 uu1 (.Z(EMCLKb), .A(DSPCLK), .B(CKenb_dft));

GTECH_NOR2 utm1 (.Z(selECMb), .A(selECM), .B(SCAN_TEST));
GTECH_NOR2 uu5 (.Z(ECMCLKb), .A(DSPCLK), .B(selECMb));
`else
GTECH_NOR2 uu1 (.Z(EMCLKb), .A(DSPCLK), .B(CKenb));

GTECH_NOT uu4 (.Z(selECMb), .A(selECM));
GTECH_NOR2 uu5 (.Z(ECMCLKb), .A(DSPCLK), .B(selECMb));
`endif

GtCLK_NOT ckEMCLK1 (.Z(EMCLK1), .A(EMCLKb));
GtCLK_NOT ckEMCLK2 (.Z(EMCLK2), .A(EMCLKb));

GtCLK_NOT ckECMCLK1 (.Z(ECMCLK1), .A(ECMCLKb));
GtCLK_NOT ckECMCLK2 (.Z(ECMCLK2), .A(ECMCLKb));

`else
wire EMCLK_en=EXTC_Eg || EXTC_Eg_syn;
assign EMCLK1 = DSPCLK ;
assign EMCLK2 = DSPCLK ;
assign ECMCLK1 = DSPCLK ;
assign ECMCLK2 = DSPCLK ;

`endif




















`ifdef FD_DFT
EREG15LC WSCRreg (DSPCLK, MMR_web, WSCR_we, DMD[14:0], WSCR[14:0], RST, SCAN_TEST);
`else
EREG15LC WSCRreg (DSPCLK, MMR_web, WSCR_we, DMD[14:0], WSCR[14:0], RST);
`endif

`ifdef FD_DFT
REG8LCI WSCRext_reg (DSPCLK, MMR_web, WSCR_ext_we, DMD[7:0], WSCR_ext[7:0], RST, SCAN_TEST);
`else
REG8LCI WSCRext_reg (DSPCLK, MMR_web, WSCR_ext_we, DMD[7:0], WSCR_ext[7:0], RST);
`endif

assign #`d0 DMWAIT[5:0] = {WSCR_ext[7:6], WSCR[11:8]};
assign #`d0 PMWAIT[5:0] = {WSCR_ext[5:4], WSCR[7:4]};
assign #`d0 IOWAIT[5:0] = {WSCR_ext[3:2], WSCR[3:0]};
assign #`d0 ECMAWAIT[3:0] = {WSCR_ext[1:0], ECMAWAITi[1:0]};

































assign #`da selEDMg = Double_E && selEDM;

always @(ECS or eRDY or ECYC or RWend or PMcst or DMcst or IOcst or
selEDMg or selECM or BDMAmode or BSreq or BSack or BWend) begin
ENS <= #`da 4'h0;
case (ECS)
4'h0 : casex ({eRDY, ECYC, PMcst, DMcst|IOcst, selECM, BDMAmode})
6'b1xxxxx : ENS <= #`da 4'h0;
6'b011xxx : ENS <= #`da 4'h1;
6'b0101xx : ENS <= #`da 4'h5;
6'b01001x : ENS <= #`da 4'h8;
6'b000001 : ENS <= #`da 4'hc;
6'b000000 : ENS <= #`da 4'h0;
default : ENS <= #`da 4'h0;
endcase
4'h1 : casex ({RWend, selEDMg})
2'b0x : ENS <= #`da 4'h1;
2'b10 : ENS <= #`da 4'h2;
2'b11 : ENS <= #`da 4'h3;
default : ENS <= #`da 4'h1;
endcase
4'h2 : ENS <= #`da selECM ? 4'h8: 4'h0;
4'h3 : ENS <= #`da 4'h4;
4'h4 : ENS <= #`da 4'h5;
4'h5 : ENS <= #`da RWend ? 4'h6 : 4'h5;
4'h6 : ENS <= #`da selECM ? 4'h8: 4'h0;
4'h8 : ENS <= #`da RWend ? 4'h9: 4'h8;
4'h9 : ENS <= #`da RWend ? 4'ha: 4'h9;
4'ha : ENS <= #`da RWend ? 4'hb: 4'ha;
4'hb : ENS <= #`da 4'h0;
4'hc : ENS <= #`da BWend ? 4'hd : 4'hc;
4'hd : ENS <= #`da BSreq ? 4'he : 4'h0;
4'he : ENS <= #`da BSack ? 4'h0 : 4'he;
default : ENS <= #`da 4'h0;
endcase
end




always @(posedge DSPCLK or posedge PPclr) begin
if (PPclr) ECS <= #`db 4'h0;
else ECS <= #`db ENS;
end

assign ENS0 = ENS==4'h0;
assign ENS1 = ENS==4'h1;
assign ENS2 = ENS==4'h2;
assign ENS3 = ENS==4'h3;
assign ENS4 = ENS==4'h4;
assign ENS5 = ENS==4'h5;
assign ENS6 = ENS==4'h6;
assign ENS8 = ENS==4'h8;
assign ENS9 = ENS==4'h9;
assign ENS10 = ENS==4'ha;
assign ENS11 = ENS==4'hb;
assign ENS12 = ENS==4'hc;
assign ENS13 = ENS==4'hd;
assign ENS14 = ENS==4'he;

assign ECS0 = ECS==4'h0;
assign ECS1 = ECS==4'h1;
assign ECS2 = ECS==4'h2;
assign ECS3 = ECS==4'h3;
assign ECS5 = ECS==4'h5;
assign ECS6 = ECS==4'h6;
assign ECS8 = ECS==4'h8;
assign ECS9 = ECS==4'h9;
assign ECS10 = ECS==4'ha;
assign ECS11 = ECS==4'hb;
assign ECS12 = ECS==4'hc;
assign ECS13 = ECS==4'hd;
assign ECS14 = ECS==4'he;



















assign #`da RWend = (RWcnt[5:0] == RWcnt_ref[5:0]);

assign #`da RWcnt_ref[5:0] = PMcst ? PMWAIT[5:0] :
DMcst ? DMWAIT[5:0] :
IOcst ? IOWAIT[5:0] :
{2'b0, ECMAWAIT[3:0]};

assign #`da RWcnt_en = ECS1 || ECS5 || ECS8 || ECS9 || ECS10;
assign #`da RWcnt_clr = ENS0 || ENS3 || ENS8 & !ECS8 || ENS9 & !ECS9 ||
ENS10 &! ECS10 ;

always @(posedge DSPCLK) begin

if (RWcnt_clr) RWcnt[5:0] <= #`db 6'h0;
else if (RWcnt_en) RWcnt[5:0] <= #`db RWcnt + 1;

end




























wire PM_rgn;

assign #`da PM_rgn = PM_bdry_sel ? PMA[13] : &{PMA[13:12]};

assign #`da selEPM = PM_rgn && PMOVL_dsp[7];
assign #`da selEDM = !DMA[13] && DMOVL_dsp[3];


assign #`da IOext = IOcmd_Ei;




assign #`da IOcs_nx = IOext && EXTC_Eg;

assign #`da IOcs_clr = ECS6;

always @(posedge EMCLK1 or posedge PPclr) begin
if (PPclr) IOcst <= #`db 0;
`ifdef FD_GTCLK
else if (GO_EC) IOcst <= #`db IOcs_nx;
else if (IOcs_clr) IOcst <= #`db 0;
`else
else if (GO_EC & EMCLK_en) IOcst <= #`db IOcs_nx;
else if (IOcs_clr & EMCLK_en) IOcst <= #`db 0;
`endif

end

assign #`da IOcs = IOcst && (ENS5 || ECS5 || ECS6);




assign #`da PMcs_nx = selEPM && EXTC_Eg && (Pread_Ei || Pwrite_Ei);

assign #`da PMcs_clr = ECS2 || ECS3;

always @(posedge EMCLK1 or posedge PPclr) begin
if (PPclr) PMcst <= #`db 0;
`ifdef FD_GTCLK
else if (GO_EC) PMcst <= #`db PMcs_nx;
else if (PMcs_clr) PMcst <= #`db 0;
`else
else if (GO_EC & EMCLK_en) PMcst <= #`db PMcs_nx;
else if (PMcs_clr & EMCLK_en) PMcst <= #`db 0;
`endif

end

assign #`da PMcs = ENS1 | ECS1 | ECS2;




assign #`da DMcs_nx = selEDM && EXTC_Eg && (Dread_Ei || Dwrite_Ei);

assign #`da GO_EDM = (Double_E && selEPM) ? ENS4 : GO_EC;

assign #`da DMcs_clr = ECS6;

always @(posedge EMCLK1 or posedge PPclr) begin
if (PPclr) DMcst <= #`db 0;
`ifdef FD_GTCLK
else if (GO_EDM) DMcst <= #`db DMcs_nx;
else if (DMcs_clr) DMcst <= #`db 0;
`else
else if (GO_EDM & EMCLK_en) DMcst <= #`db DMcs_nx;
else if (DMcs_clr & EMCLK_en) DMcst <= #`db 0;
`endif

end

assign #`da DMcs = DMcst && (ENS5 || ECS5 || ECS6);



always @(posedge ECMCLK1 or posedge PPclr)
if (PPclr) ECMcs <= #`db 0;
`ifdef FD_GTCLK
else if(ENS8) ECMcs <= #`db 1;
else if(ECS11) ECMcs <= #`db 0;
`else
else if(ENS8 & selECM) ECMcs <= #`db 1;
else if(ECS11 & selECM) ECMcs <= #`db 0;
`endif


always @(posedge ECMCLK1)
`ifdef FD_GTCLK
if(ENS8) ECMA[13:0] <= #`db CMAin[13:0];
`else
if(ENS8 & selECM) ECMA[13:0] <= #`db CMAin[13:0];
`endif







always @(posedge DSPCLK) BMcs <= #`db ENS12 || ENS13 || ENS14;








































assign #`da selPMD_h = Pwrite_Ei && (ECS1 || ENS1);

assign #`da selDMD_h = Dwrite_Ei && (ECS5 || ENS5) ||
IOwrite_Ei && (ECS5 || ENS5);

assign #`da selECMD_h = !rdCM_E && accCM_E && (ECS10 || ENS10);

assign #`da ED_oe_h = selPMD_h || selDMD_h || selECMD_h;

always @(posedge DSPCLK)
begin
ED_oei <= #`db ED_oe_h;
selPMDi <= #`db selPMD_h;
selDMDi <= #`db selDMD_h;
end

assign #`da selPMD = selPMDi && PMcs;
assign #`da selDMD = selDMDi && (DMcs || IOcs);

assign #`da ED_oe = ED_oei && BGn;

wire [15:0] IDR_L = IDR[15:0];
always @(selPMD or selDMD or PMDin or DMD
or IDR_L)
case({selPMD,selDMD})
2'b10: ED_do_h[15:0] = PMDin[15:0];
2'b01: ED_do_h[15:0] = DMD[15:0];
default: ED_do_h[15:0] = IDR_L;
endcase

assign #`da ED_do[15] = ED_do_h[15];
assign #`da ED_do[14:8] = {7{ED_oe}} & ED_do_h[14:8] | {7{BMcs}} & BMpage[7:1];
assign #`da ED_do[7:0] = {8{ED_oe}} & ED_do_h[7:0] | {8{BMcs & BDIR}} & BWdataBUF[7:0];




assign #`da EA_oe = (PMcs || DMcs || IOcs || BMcs || ECS8 || ECS9 ||
(ECS10|ECS11) && !rdCM_E && accCM_E) && BGn ;


wire [14:0] PMEA = PM_bdry_sel ? {PMOVL_dsp[5:4], PMA[12:0]} :
{PMOVL_dsp[6:4], PMA[11:0]};



reg [14:12] ECMAo_PM8K, ECMAo_PM4K;

always @(PMOVL_dsp or CMAin or ECMA)
casex({PMOVL_dsp[3:0], CMAin[13:12]})
6'bxxxx00 : ECMAo_PM8K[14:12] = 3'b000;
6'b000001 : ECMAo_PM8K[14:12] = {2'b00, ECMA[12]};
6'b000101 : ECMAo_PM8K[14:12] = 3'b010;
6'b001001 : ECMAo_PM8K[14:12] = 3'b011;
6'b001101 : ECMAo_PM8K[14:12] = 3'b100;
6'b010001 : ECMAo_PM8K[14:12] = 3'b101;
6'b010101 : ECMAo_PM8K[14:12] = 3'b110;
6'b011001 : ECMAo_PM8K[14:12] = 3'b111;
default : ECMAo_PM8K[14:12] = 3'b000;
endcase


always @(PMOVL_dsp or CMAin or ECMA)
casex({PMOVL_dsp[3:0], CMAin[13:12]})
6'bxxxx0x : ECMAo_PM4K[14:12] = {2'b00, ECMA[12]};
6'b000010 : ECMAo_PM4K[14:12] = 3'b010;
6'b000110 : ECMAo_PM4K[14:12] = 3'b011;
6'b001010 : ECMAo_PM4K[14:12] = 3'b100;
6'b001110 : ECMAo_PM4K[14:12] = 3'b101;
6'b010010 : ECMAo_PM4K[14:12] = 3'b110;
6'b010110 : ECMAo_PM4K[14:12] = 3'b111;
default : ECMAo_PM4K[14:12] = {2'b00, ECMA[12]};
endcase

wire [14:12] ECMAo = PM_bdry_sel ? ECMAo_PM8K[14:12] : ECMAo_PM4K[14:12];




assign #`da EA_do[14:0]
= BMcs ? {BMpage[0], BEAD[13:0]} :
{15{PMcs}} & PMEA[14:0] |
{15{DMcs}} & {DMOVL_dsp[1], DMOVL_dsp[0], DMA[12:0]} |
{15{IOcs}} & {4'b0, IOaddr[10:0]} |
{15{ECMcs & !(ECS10|ECS11)}} & {ECMAo[14:12], ECMA[11:0]} |
{15{ECMcs & (ECS10|ECS11)}} & {ECMAo[14:12], ECMA[11:8],
IDR[23:16]};






assign #`da CMcs = PMcs && WSCR[12] ||
DMcs && WSCR[13] ||
IOcs && WSCR[14];

assign #`da PMSn = !PMcs;
assign #`da DMSn = !DMcs;
assign #`da IOSn = !IOcs;
assign #`da ECMSn = !ECMcs;
assign #`da CMSn = !CMcs;
assign #`da BMSn = !BMcs;




assign #`da RD_h = ENS12 && !BDIR || !ENS12 && (
Pread_Ei && ENS1 ||
Dread_Ei && ENS5 ||
IOread_Ei && ENS5 ||
ENS10 && !(!rdCM_E && accCM_E));


assign #`da WR_h = Pwrite_Ei && ENS1 ||
Dwrite_Ei && ENS5 ||
IOwrite_Ei && ENS5 ||
ENS10 && !rdCM_E && accCM_E;

always @(posedge DSPCLK)
begin
RDn <= #`db !RD_h;
WRn_h <= #`db !WR_h;
end

assign #`da WRn = BMcs ? BWRn : WRn_h;



always @(posedge ECMCLK1)
`ifdef FD_GTCLK
if(ENS8) ECMA_EN <= #`db 1'b0;
`else
if(ENS8 & selECM) ECMA_EN <= #`db 1'b0;
`endif
else ECMA_EN <= #`db 1'b1;























assign #`da PMDlat = Pread_Ei && PMcs && ECS1 && RWend;

always @(posedge EMCLK1)
`ifdef FD_GTCLK
if (PMDlat) PMDreg[15:0] <= #`db T_ED[15:0];
`else
if (PMDlat & EMCLK_en) PMDreg[15:0] <= #`db T_ED[15:0];
`endif


assign #`da PMDoe_clr = GO_Ex && PMDoe;

always @(posedge EMCLK2 or posedge PPclr) begin
if (PPclr) PMDoe <= #`db 0;
`ifdef FD_GTCLK
else if (GO_EC) PMDoe <= #`db selEPM && EXTC_Eg && Pread_Ei;
else if (PMDoe_clr) PMDoe <= #`db 0;
`else
else if (GO_EC & EMCLK_en) PMDoe <= #`db selEPM && EXTC_Eg && Pread_Ei;
else if (PMDoe_clr & EMCLK_en) PMDoe <= #`db 0;
`endif

end



assign #`d0 emcPMD_oe = PMDoe;

assign #`d0 emcPMD_do[15:0] = PMDreg[15:0];




assign #`da DMDlat = (Dread_Ei || IOread_Ei) && (DMcs || IOcs) &&
ECS5 && RWend;

always @(posedge EMCLK2)
`ifdef FD_GTCLK
if (DMDlat) DMDreg[15:0] <= #`db T_ED[15:0];
`else
if (DMDlat & EMCLK_en) DMDreg[15:0] <= #`db T_ED[15:0];
`endif

assign #`da DMDoe_clr = GO_Ex && DMDoe;

always @(posedge EMCLK2 or posedge PPclr)
if (PPclr) DMDoe <= #`db 1'b0;
`ifdef FD_GTCLK
else if (GO_EDM) DMDoe <= #`db (Dread_Ei && selEDM) || IOread_Ei;
else if (DMDoe_clr) DMDoe <= #`db 0;
`else
else if (GO_EDM & EMCLK_en) DMDoe <= #`db (Dread_Ei && selEDM) || IOread_Ei;
else if (DMDoe_clr & EMCLK_en) DMDoe <= #`db 0;
`endif



assign #`d0 emcDMD_oe = DMDoe;

assign #`d0 emcDMD_do[15:0] = DMDreg[15:0];




assign CMDlat = ECS10 & RWend;

always @(posedge ECMCLK2)
`ifdef FD_GTCLK
if(CMDlat) ECMDreg[23:0] <= #`db {T_EA[7:0], T_ED[15:0]};
`else
if(CMDlat & selECM) ECMDreg[23:0] <= #`db {T_EA[7:0], T_ED[15:0]};
`endif



assign CM_rdata[23:0] = selECM ? ECMDreg[23:0] : CM_rd[23:0];










assign #`da eRDY_h = selECM ? ENS11 : (ENS2 || ENS6) ;




always @(posedge DSPCLK or posedge PPclr) begin
if(PPclr) eRDY <= 0;
else if (~eRDY) eRDY <= #`db eRDY_h;
else if (GO_Fx) eRDY <= #`db 0;
end


endmodule

