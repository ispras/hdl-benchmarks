






`include "x_def.v"


module SICE (/* ------------ Inputs : ------------- */
 T_PWRONn, ICK, IMS, DSPCLK, CM_rd,
DMD, T_GOICE, PM_bdry_sel,
 enTRAP_RL,
 GO_F, GO_E, GO_C, ICE_ST, DRA,
EXA, HALTclr_h,
GOICEclr_h, GOICEdis,
PMOVL_dsp, DMOVL_dsp,
 IR, Dummy_R, nNOP_Eg, MTIDR_Eg,
SBP_R, readCM_E,
 BGn, PMA, DMA, EXTC_Eg,
accPM_Eg, accDM_Eg,
 eRDY,
 BRST, IACKn,
`ifdef FD_DFT
 SCAN_TEST,
`endif

 GRST, GO_Fx, GO_Ex, GO_Cx, HALT_E,
 IRR, IDR, GOICE, GOICE_syn,
ICE_wakeup,
 Upd_IR, SPC, SBP_EN, enTYP3,


 T_ID, IDo, IDoe,

EX_en, selIVER,
SICEmmio );


input [15:0] DMD;

input [13:0] DRA,
EXA,
PMA,
DMA;
input [23:0] IR,
CM_rd;

input [7:0] PMOVL_dsp;
input [3:0] DMOVL_dsp;

input T_ID,
T_GOICE,
T_PWRONn,
PM_bdry_sel,
DSPCLK,
ICK,
IMS,
GO_F,
GO_E,
GO_C,
Dummy_R,
HALTclr_h,
GOICEclr_h,
GOICEdis,
ICE_ST,
nNOP_Eg,
SBP_R,
readCM_E,
MTIDR_Eg,
BGn,
EXTC_Eg,
eRDY,
accPM_Eg,
accDM_Eg,
enTRAP_RL;


input BRST, IACKn;

`ifdef FD_DFT
input SCAN_TEST;
`endif

input EX_en, selIVER;
output [15:0] SICEmmio;


output [23:0] SPC;
output [13:0] IRR;
output [23:0] IDR;
output IDo,
IDoe,
GRST,
GO_Fx,
GO_Ex,
GO_Cx,
HALT_E,
GOICE,
GOICE_syn,
SBP_EN,
Upd_IR,
enTYP3,
ICE_wakeup;

reg [2:0] ICS,
INS;

wire [23:0] IDR;

reg [3:0] IAR;
reg [2:0] ITR;
reg [13:0] IRR;
reg [18:0] DBR1, DBR2;
reg [17:0] IBR1, IBR2, IMR1, IMR2,
DMR1, DMR2;

reg [23:0] SPC;

reg [23:0] SPC_do;
reg IDo, OE, IRST, GOICE_1, GOICE_2, GO_NXi, UpdDR_si, CMRW;
reg IDONE, GO_NX, UpdDR_sd1, UpdDR_sd2, GOICE_syn,
HALT_E, IDLE_d1, IDLE_d2;
wire GOICE;
wire [3:0] IAR_di;
wire [5:0] ICR;
wire [5:0] ISR;

wire [13:0] IRR_di;
wire [23:0] IDR_di;
wire [23:0] SPC_di;
wire ICKg;
wire IAR_we, equICR, equIDR, equIR, equITR, equIRR,
equIBR1, equIBR2, equIMR1, equIMR2, equDBR1,
equDBR2, equDMR1, equDMR2, SPC_we, Upd_DR, ICR_we,
IDR_we, SBP_EN, ITR_we, IDR_enb,
DSPwe, IRR_we, IBR1_we, IBR2_we, IMR1_we, IMR2_we,
DBR1_we, DBR2_we, DMR1_we, DMR2_we, IBP1_R,
IBP2_R, IBP_R, DBP1_R, DBP2_R, DBP3_R, DBP4_R,
DBP_R, HALT_R, T_PWRON, MGNT, PRST;

wire [17:0] COVL_DRA, POVL_PMA, DOVL_DMA;


reg [23:0] ICYC, IIRC;
reg ICYC_en, ICYC_clr;
wire [14:0] IVER;
wire ICYCclk, ICYC_cn, ICYC_full,
IIRC_cn, ICYC_we,
IIRC_we, equICYC, equIIRC;

`ifdef FD_DFT
wire CLR_I, CLR_M, GOclr;
`else
reg CLR_I, CLR_M, GOclr;
`endif











wire MDONE = eRDY;
wire EMC = EXTC_Eg;

assign #`da T_PWRON = !T_PWRONn;
assign #`da PRST = T_PWRON;





reg [1:0] RCS, RNS;
reg IRST_syn, PRST_syn;
reg RST_req;
wire RST_gnt,
GRST;


parameter R_IDLE = 2'b00,
R_WAIT_GNT = 2'b01,
R_RST_1 = 2'b10,
R_RST_2 = 2'b11;


always @(posedge DSPCLK) begin
IRST_syn <= #`db IRST;
PRST_syn <= #`db PRST;
end

always @(posedge DSPCLK or posedge GRST)
if(GRST) RST_req <= #`db 1'b0;
else RST_req <= #`db BRST || IRST_syn;

assign RST_gnt = !IACKn;

always @(RCS or RST_req or RST_gnt) begin
case(RCS)
R_IDLE : if(RST_req)
RNS = R_WAIT_GNT;
else
RNS = R_IDLE;
R_WAIT_GNT : if(RST_gnt)
RNS = R_RST_1;
else
RNS = R_WAIT_GNT;
R_RST_1 : RNS = R_RST_2;
R_RST_2 : RNS = R_IDLE;
default : RNS = R_IDLE;
endcase
end

always @(posedge DSPCLK or posedge PRST)
if(PRST) RCS <= #`db 2'b0;
else RCS <= #`db RNS;
`ifdef FD_GTCLK
`ifdef FD_DFT
wire GRST_h = (RCS==R_RST_1) || (RCS==R_RST_2) || PRST_syn;
GTECH_MUXI2 grsti(.A(GRST_h), .B(PRST), .S(SCAN_TEST), .Z(GRST_));
GtCLK_NOT grst (.Z(GRST), .A(GRST_));
`else
wire GRST_h = (RCS==R_RST_1) || (RCS==R_RST_2) || PRST_syn;
GtCLK_NOT grsti(.Z(GRST_), .A(GRST_h));
GtCLK_NOT grst (.Z(GRST), .A(GRST_));
`endif
`else
assign GRST = (RCS[1] == R_RST_1[1] && RCS[0] == R_RST_1[0]) || (RCS[1] == R_RST_2[1] && RCS[0] == R_RST_2[0]) || PRST_syn;
//wire GRST = (RCS==R_RST_1) || (RCS==R_RST_2) || PRST_syn;
`endif

assign #`da GO_Fx = GO_F || GO_NX;
assign #`da GO_Ex = GO_E || GO_NX;
assign #`da GO_Cx = GO_C || GO_NX;

assign #`da MGNT = !BGn;












parameter Idle = 3'h0,
Sel_D = 3'h1,
Sel_A = 3'h2,
Shift_Ai = 3'h3,
WriteD = 3'h4,
Shift_Di = 3'h5,
ReadD = 3'h6,
Shift_Do = 3'h7;

always @(ICS or IMS) begin

INS[2:0] <= #`da Idle;

case (ICS)
Idle : INS <= #`da IMS ? Idle : Sel_D;
Sel_D : INS <= #`da IMS ? Sel_A : WriteD;
Sel_A : INS <= #`da IMS ? Idle : Shift_Ai;
Shift_Ai : INS <= #`da IMS ? WriteD : Shift_Ai;
WriteD : INS <= #`da IMS ? ReadD : Shift_Di;
Shift_Di : INS <= #`da IMS ? Idle : Shift_Di;
ReadD : INS <= #`da IMS ? Idle : Shift_Do;
Shift_Do : INS <= #`da IMS ? ReadD : Shift_Do;
endcase
end

always @(posedge ICK) begin
if (T_PWRON) ICS[2:0] <= #`da Idle;
else ICS[2:0] <= #`da INS[2:0];
end




always @(posedge ICK) begin
IDLE_d1 <= #`db (ICS == Idle);
IDLE_d2 <= #`db IDLE_d1;
end

`ifdef FD_GTCLK
GTECH_NOR3 uck0 (.Z(IDLE_d0), .A(ICS[0]), .B(ICS[1]), .C(ICS[2]));
GtCLK_AND3 uck1 (.Z(ICK_dis), .A(IDLE_d0), .B(IDLE_d1), .C(IDLE_d2));
`ifdef FD_DFT
GTECH_AND_NOT utm0 (.Z(ICK_dis_dft), .A(ICK_dis), .B(SCAN_TEST));
GTECH_NOR2 uck2 (.Z(ICKg_), .A(ICK), .B(ICK_dis_dft));
GtCLK_NOT ckICKg (.Z(ICKg), .A(ICKg_));
`else
GTECH_NOR2 uck2 (.Z(ICKg_), .A(ICK), .B(ICK_dis));
GtCLK_NOT ckICKg (.Z(ICKg), .A(ICKg_));
`endif

`else
wire ICKg_en=!((ICS == Idle) && IDLE_d1 && IDLE_d2);
assign #`da ICKg = ICK;
`endif





















assign #`da IAR_we = (INS == Shift_Ai);
assign #`da IAR_di[3:0] = {T_ID,IAR[3:1]};



always @(posedge ICKg or posedge PRST) begin
if (PRST) IAR[3:0] <= #`db 4'b0;
`ifdef FD_FPGA
else if (IAR_we & ICKg_en) IAR[3:0] <= #`db IAR_di[3:0];
`else
else if (IAR_we) IAR[3:0] <= #`db IAR_di[3:0];
`endif
end





assign #`da equICR = IAR == 4'h1;
assign #`da equIDR = IAR == 4'h2;
assign #`da equIR = IAR == 4'h3;
assign #`da equITR = IAR == 4'h4;
assign #`da equIRR = IAR == 4'h5;
assign #`da equICYC = IAR == 4'h6;
assign #`da equIIRC = IAR == 4'h7;
assign #`da equIBR1 = IAR == 4'h8;
assign #`da equIBR2 = IAR == 4'h9;
assign #`da equIMR1 = IAR == 4'ha;
assign #`da equIMR2 = IAR == 4'hb;
assign #`da equDBR1 = IAR == 4'hc;
assign #`da equDBR2 = IAR == 4'hd;
assign #`da equDMR1 = IAR == 4'he;
assign #`da equDMR2 = IAR == 4'hf;



















assign #`da SPC_we = (INS == Shift_Di) ||
(INS == ReadD) ||
(INS == Shift_Do);

always @(IAR or ISR or ICR or IDR or
IR or ITR or IRR or IBR1 or
IBR2 or IMR1 or IMR2 or
DBR1 or DBR2 or DMR1 or
DMR2 or ICYC or IIRC or IVER) begin
case (IAR)
4'h0 : SPC_do[23:0] <= #`da {ISR[5:0], IVER[7:0], 10'b0};
4'h1 : SPC_do[23:0] <= #`da {ICR[5:0], 18'b0};
4'h2 : SPC_do[23:0] <= #`da IDR[23:0];
4'h3 : SPC_do[23:0] <= #`da IR[23:0];
4'h4 : SPC_do[23:0] <= #`da {11'h7ff, ITR[2:0], 10'b0};
4'h5 : SPC_do[23:0] <= #`da {IRR[13:0], 10'b0};
4'h6 : SPC_do[23:0] <= #`da ICYC[23:0];
4'h7 : SPC_do[23:0] <= #`da IIRC[23:0];
4'h8 : SPC_do[23:0] <= #`da {IBR1[17:0], 6'b0};
4'h9 : SPC_do[23:0] <= #`da {IBR2[17:0], 6'b0};
4'ha : SPC_do[23:0] <= #`da {IMR1[17:0], 6'b0};
4'hb : SPC_do[23:0] <= #`da {IMR2[17:0], 6'b0};
4'hc : SPC_do[23:0] <= #`da {DBR1[18:0], 5'b0};
4'hd : SPC_do[23:0] <= #`da {DBR2[18:0], 5'b0};
4'he : SPC_do[23:0] <= #`da {DMR1[17:0], 6'b0};
4'hf : SPC_do[23:0] <= #`da {DMR2[17:0], 6'b0};
default :
SPC_do[23:0] <= #`da {ISR[5:0], 18'b0};
endcase
end

assign #`da SPC_di[23:0] = (INS == ReadD) ? SPC_do[23:0] :
(INS == Shift_Do) ? {SPC[22:0], 1'b0}
: {T_ID,SPC[23:1]};



always @(posedge ICKg)
`ifdef FD_FPGA
if (SPC_we & ICKg_en) SPC[23:0] <= #`db SPC_di[23:0];
`else
if (SPC_we) SPC[23:0] <= #`db SPC_di[23:0];
`endif




always @(negedge ICKg)
`ifdef FD_FPGA
if(ICKg_en) IDo <= #`db SPC[23];
`else
IDo <= #`db SPC[23];
`endif

always @(posedge ICKg)
`ifdef FD_FPGA
if(ICKg_en) OE <= #`db (INS == ReadD) || (INS == Shift_Do);
`else
OE <= #`db (INS == ReadD) || (INS == Shift_Do);
`endif

assign #`da IDoe = OE && !IMS;

































assign #`d0 ISR[5:0] = {MDONE, IDONE, 1'b0, EMC, MGNT, ICE_ST};



always @(posedge DSPCLK or posedge CLR_I) begin
if (CLR_I) IDONE <= #`db 1'b0;
else if (GO_Cx) IDONE <= #`db nNOP_Eg;
end



assign #`da ICYC_we = Upd_DR && equICYC;
assign #`da IIRC_we = Upd_DR && equIIRC;

always @(posedge ICKg or posedge PRST) begin
if (PRST) ICYC_en <= #`db 1'b0;
else if (ICYC_we) ICYC_en <= #`db SPC[23];
end
reg ICYC_en_syn;
always @(posedge DSPCLK) ICYC_en_syn <= #`db ICYC_en;

always @(posedge ICKg or posedge PRST) begin
if (PRST) ICYC_clr <= #`db 1'b0;
else if (ICYC_clr) ICYC_clr <= #`db 1'b0;
else if (IIRC_we) ICYC_clr <= #`db SPC[23];
end
`ifdef FD_GTCLK
`ifdef FD_DFT
GTECH_NOR2 ui0 (.Z(ICYC_en_syn_dft), .A(ICYC_en_syn), .B(SCAN_TEST));
GtCLK_OR2 ckICYC (.Z(ICYCclk), .A(DSPCLK), .B(ICYC_en_syn_dft));
`else
GtCLK_OR_NOT ckICYC (.Z(ICYCclk), .A(DSPCLK), .B(ICYC_en_syn));
`endif
`else
assign ICYCclk = DSPCLK | ~ICYC_en_syn;
`endif
assign #`da ICYC_full = &{ICYC[23:0]};
assign #`da ICYC_cn = !(ICE_ST || ICYC_full);

`ifdef FD_DFT
wire ICYC_rst_h = ICYC_clr || GRST;
wire ICYC_rst = SCAN_TEST ? GRST : ICYC_rst_h;
`else
wire ICYC_rst = ICYC_clr || GRST;
`endif
always @(posedge ICYCclk or posedge ICYC_rst) begin
if(ICYC_rst) ICYC[23:0] <= #`db 24'b0;
else if(ICYC_cn) ICYC[23:0] <= #`db ICYC + 1'b1;
end



assign #`da IIRC_cn = ICYC_cn && EX_en && GO_C;

always @(posedge ICYCclk or posedge ICYC_rst) begin
if(ICYC_rst) IIRC[23:0] <= #`db 24'b0;
else if(IIRC_cn) IIRC[23:0] <= #`db IIRC + 1'b1;
end














assign IVER[14:0] = {PM_bdry_sel, 1'b0, 1'b0,
1'b1, 1'b0, 1'b1, 1'b1,
1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1};

assign SICEmmio = {16{selIVER}} & {ICYC_en, IVER[14:0]};


















assign #`d0 ICR[5:0] = {CMRW, CLR_M, CLR_I, GO_NX, GOICE, IRST};

assign #`da Upd_DR = (ICS == Shift_Di) && (INS == Idle);

assign #`da ICR_we = Upd_DR && equICR;

assign #`da enTYP3 = !(ICE_ST && CMRW);



always @(posedge ICKg or posedge PRST) begin
if (PRST) IRST <= #`db 0;
`ifdef FD_FPGA
else if (IRST & ICKg_en) IRST <= #`db 0;
else if (ICR_we & ICKg_en) IRST <= #`db SPC[18];
`else
else if (IRST) IRST <= #`db 0;
else if (ICR_we) IRST <= #`db SPC[18];
`endif
end



always @(posedge ICKg or posedge PRST) begin
if (PRST) GOICE_1 <= #`db 0;
`ifdef FD_FPGA
else if (ICR_we & ICKg_en) GOICE_1 <= #`db SPC[19];
`else
else if (ICR_we) GOICE_1 <= #`db SPC[19];
`endif
end

always @(posedge ICK or posedge PRST) begin
if (PRST) GOICE_2 <= #`db 0;
else GOICE_2 <= #`db T_GOICE;
end

assign #`da GOICE = GOICE_1 || GOICE_2;

reg GOICE_s1;
always @(posedge ICKg or posedge PRST)
if (PRST) GOICE_s1 <= #`db 0;
else GOICE_s1 <= #`db GOICE;

assign #`da ICE_wakeup = GOICE && !GOICE_s1;



always @(posedge ICKg or posedge GOclr) begin
if (GOclr) GO_NXi <= #`db 0;
`ifdef FD_FPGA
else if (ICR_we & ICKg_en) GO_NXi <= #`db SPC[20];
`else
else if (ICR_we) GO_NXi <= #`db SPC[20];
`endif
end

always @(posedge DSPCLK or posedge PRST)
if(PRST) GO_NX <= #`db 1'b0;
else GO_NX <= #`db GO_NXi;

`ifdef FD_DFT
reg GOclr_h;

always @(negedge DSPCLK or posedge PRST)
if(PRST) GOclr_h <= #`db 1'b1;
else GOclr_h <= #`db GO_NX;
assign GOclr = SCAN_TEST ? PRST : GOclr_h;

`else

always @(negedge DSPCLK or posedge PRST)
if(PRST) GOclr <= #`db 1'b1;
else GOclr <= #`db GO_NX;

`endif

`ifdef FD_DFT
reg CLR_I_h;

always @(posedge ICKg or posedge PRST) begin
if (PRST) CLR_I_h <= #`db 0;
else if (CLR_I_h) CLR_I_h <= #`db 0;
else if (ICR_we) CLR_I_h <= #`db SPC[21];
end

assign CLR_I = SCAN_TEST ? PRST : CLR_I_h;

`else

always @(posedge ICKg or posedge PRST) begin
if (PRST) CLR_I <= #`db 0;
`ifdef FD_FPGA
else if (CLR_I & ICKg_en) CLR_I <= #`db 0;
else if (ICR_we & ICKg_en) CLR_I <= #`db SPC[21];
`else
else if (CLR_I) CLR_I <= #`db 0;
else if (ICR_we) CLR_I <= #`db SPC[21];
`endif
end

`endif


`ifdef FD_DFT
reg CLR_M_h;


always @(posedge ICKg or posedge PRST) begin
if (PRST) CLR_M_h <= #`db 0;
else if (CLR_M_h) CLR_M_h <= #`db 0;
else if (ICR_we) CLR_M_h <= #`db SPC[22];
end

assign CLR_M = SCAN_TEST ? PRST : CLR_M_h;

`else

always @(posedge ICKg or posedge PRST) begin
if (PRST) CLR_M <= #`db 0;
`ifdef FD_FPGA
else if (CLR_M & ICKg_en) CLR_M <= #`db 0;
else if (ICR_we & ICKg_en) CLR_M <= #`db SPC[22];
`else
else if (CLR_M) CLR_M <= #`db 0;
else if (ICR_we) CLR_M <= #`db SPC[22];
`endif
end
`endif


always @(posedge ICKg or posedge PRST) begin
if (PRST) CMRW <= #`db 0;
`ifdef FD_FPGA
else if (ICR_we & ICKg_en) CMRW <= #`db SPC[23];
`else
else if (ICR_we) CMRW <= #`db SPC[23];
`endif
end


















assign #`da IDR_we = equIDR && DSPwe ||
readCM_E && GO_Cx ||
MTIDR_Eg && GO_Cx;

assign #`da IDR_di[23:0] = {24{equIDR && DSPwe}} & SPC[23:0] |
{24{readCM_E}} & CM_rd[23:0] |
{24{MTIDR_Eg}} & {8'b0, DMD[15:0]};

`ifdef FD_GTCLK

GTECH_NOT uck4 (.Z(UpdDR_sd2_), .A(UpdDR_sd2));
GTECH_AND2 uck5_1 (.Z(IDR_enbi_1), .A(UpdDR_sd1), .B(UpdDR_sd2_));
GTECH_NOR3 uck5 (.Z(IDR_enbi), .A(readCM_E), .B(MTIDR_Eg), .C(IDR_enbi_1));
GtCLK_BUF uck6 (.Z(IDR_enb), .A(IDR_enbi));

`else

assign IDR_enb = !(MTIDR_Eg || readCM_E || !(UpdDR_sd1 && UpdDR_sd2));

`endif

`ifdef FD_DFT
REG12L idr0_reg (DSPCLK, IDR_enb, IDR_we, IDR_di[11:0], IDR[11:0], SCAN_TEST);
REG12L idr1_reg (DSPCLK, IDR_enb, IDR_we, IDR_di[23:12], IDR[23:12], SCAN_TEST);
`else
REG12L idr0_reg (DSPCLK, IDR_enb, IDR_we, IDR_di[11:0], IDR[11:0]);
REG12L idr1_reg (DSPCLK, IDR_enb, IDR_we, IDR_di[23:12], IDR[23:12]);
`endif

















assign #`da Upd_IR = equIR && DSPwe;




































assign #`d0 SBP_EN = ITR[0];

assign #`da ITR_we = Upd_DR && equITR;



always @(posedge ICKg or posedge PRST) begin
if (PRST) ITR[2:0] <= #`db 3'b0;
`ifdef FD_FPGA
else if (ITR_we & ICKg_en) ITR[2:0] <= #`db SPC[12:10];
`else
else if (ITR_we) ITR[2:0] <= #`db SPC[12:10];
`endif
end




















always @(posedge ICKg)
`ifdef FD_FPGA
if(ICKg_en) UpdDR_si <= #`db Upd_DR;
`else
UpdDR_si <= #`db Upd_DR;
`endif



always @(posedge DSPCLK) begin
UpdDR_sd1 <= #`db UpdDR_si;
UpdDR_sd2 <= #`db UpdDR_sd1;
end

assign #`da DSPwe = UpdDR_sd1 && !UpdDR_sd2;





assign #`da IRR_we = equIRR && DSPwe ||
HALTclr_h;

assign IRR_di[13:0] = HALTclr_h ? EXA[13:0] : SPC[23:10];

always @(posedge DSPCLK)
if (IRR_we) IRR[13:0] <= #`db IRR_di[13:0];


















assign #`da IBR1_we = Upd_DR && equIBR1;
assign #`da IBR2_we = Upd_DR && equIBR2;
assign #`da IMR1_we = Upd_DR && equIMR1;
assign #`da IMR2_we = Upd_DR && equIMR2;



`ifdef FD_FPGA
always @(posedge ICKg) if (IBR1_we & ICKg_en) IBR1[17:0] <= #`db SPC[23:6];
always @(posedge ICKg) if (IBR2_we & ICKg_en) IBR2[17:0] <= #`db SPC[23:6];
`else
always @(posedge ICKg) if (IBR1_we) IBR1[17:0] <= #`db SPC[23:6];

always @(posedge ICKg) if (IBR2_we) IBR2[17:0] <= #`db SPC[23:6];
`endif

always @(posedge ICKg or posedge PRST) begin
if (PRST) IMR1[17:0] <= #`db 18'h0;
`ifdef FD_FPGA
else if (IMR1_we & ICKg_en) IMR1[17:0] <= #`db SPC[23:6];
`else
else if (IMR1_we) IMR1[17:0] <= #`db SPC[23:6];
`endif
end

always @(posedge ICKg or posedge PRST) begin
if (PRST) IMR2[17:0] <= #`db 18'h0;
`ifdef FD_FPGA
else if (IMR2_we & ICKg_en) IMR2[17:0] <= #`db SPC[23:6];
`else
else if (IMR2_we) IMR2[17:0] <= #`db SPC[23:6];
`endif
end



assign #`da COVL_DRA[17:0] = {PMOVL_dsp[3:0], DRA[13:0]};

assign #`da IBP1_R = IMR1[17] && !(COVL_DRA[17] ^ IBR1[17]) &&
((COVL_DRA[16:0] | IMR1[16:0]) ==
(IBR1[16:0] | IMR1[16:0]));

assign #`da IBP2_R = IMR2[17] && !(COVL_DRA[17] ^ IBR2[17]) &&
((COVL_DRA[16:0] | IMR2[16:0]) ==
(IBR2[16:0] | IMR2[16:0]));

assign #`da IBP_R = IBP1_R || IBP2_R;


















assign #`da DBR1_we = Upd_DR && equDBR1;
assign #`da DBR2_we = Upd_DR && equDBR2;
assign #`da DMR1_we = Upd_DR && equDMR1;
assign #`da DMR2_we = Upd_DR && equDMR2;



`ifdef FD_FPGA
always @(posedge ICKg) if (DBR1_we & ICKg_en) DBR1[18:0] <= #`db SPC[23:5];

always @(posedge ICKg) if (DBR2_we & ICKg_en) DBR2[18:0] <= #`db SPC[23:5];
`else
always @(posedge ICKg) if (DBR1_we) DBR1[18:0] <= #`db SPC[23:5];

always @(posedge ICKg) if (DBR2_we) DBR2[18:0] <= #`db SPC[23:5];
`endif

always @(posedge ICKg or posedge PRST) begin
if (PRST) DMR1[17:0] <= #`db 18'h0;
`ifdef FD_FPGA
else if (DMR1_we & ICKg_en) DMR1[17:0] <= #`db SPC[23:6];
`else
else if (DMR1_we) DMR1[17:0] <= #`db SPC[23:6];
`endif
end

always @(posedge ICKg or posedge PRST) begin
if (PRST) DMR2[17:0] <= #`db 18'h0;
`ifdef FD_FPGA
else if (DMR2_we & ICKg_en) DMR2[17:0] <= #`db SPC[23:6];
`else
else if (DMR2_we) DMR2[17:0] <= #`db SPC[23:6];
`endif
end





assign #`da POVL_PMA[17:0] = {PMOVL_dsp[7:4], PMA[13:0]};

assign #`da DBP1_R = accPM_Eg && DMR1[17] && !DBR1[18] &&
!(POVL_PMA[17] ^ DBR1[17]) &&
((POVL_PMA[16:0] | DMR1[16:0]) ==
(DBR1[16:0] | DMR1[16:0]));

assign #`da DBP2_R = accPM_Eg && DMR2[17] && !DBR2[18] &&
!(POVL_PMA[17] ^ DBR2[17]) &&
((POVL_PMA[16:0] | DMR2[16:0]) ==
(DBR2[16:0] | DMR2[16:0]));



assign #`da DOVL_DMA[17:0] = {DMOVL_dsp[3:0], DMA[13:0]};

assign #`da DBP3_R = accDM_Eg && DMR1[17] && DBR1[18] &&
!(DOVL_DMA[17] ^ DBR1[17]) &&
((DOVL_DMA[16:0] | DMR1[16:0]) ==
(DBR1[16:0] | DMR1[16:0]));

assign #`da DBP4_R = accDM_Eg && DMR2[17] && DBR2[18] &&
!(DOVL_DMA[17] ^ DBR2[17]) &&
((DOVL_DMA[16:0] | DMR2[16:0]) ==
(DBR2[16:0] | DMR2[16:0]));

assign #`da DBP_R = DBP1_R || DBP2_R || DBP3_R || DBP4_R;































always @(posedge DSPCLK) begin
if (GOICEclr_h) GOICE_syn <= #`db 1'b0;
else GOICE_syn <= #`db GOICE && enTRAP_RL;
end

assign #`da HALT_R = SBP_R ||
IBP_R && ITR[1] ||
DBP_R && ITR[2] ||
GOICE_syn && !GOICEdis;

always @(posedge DSPCLK) begin
if (GOICEclr_h || T_PWRON) HALT_E <= #`db 1'b0;
else if (!HALT_E && GO_E ) HALT_E <= #`db HALT_R & !Dummy_R;
end





endmodule
