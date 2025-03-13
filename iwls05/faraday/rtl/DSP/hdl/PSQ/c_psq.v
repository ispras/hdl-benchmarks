



`include "x_lib.v"

`include "c_lpstk.v"
`include "c_pcstk.v"
`include "c_cntstk.v"
`include "c_ststk.v"
`include "x_def.v"





module PSQ (/* ------------ Inputs : ------------- */
T_RST, DSPCLK, X_PWDn, X_IRQ2n, X_IRQL1n,
X_IRQL0n, X_IRQE1n, X_IRQE0n, X_IRQ1n, X_IRQ0n,
T_IST0, T_ISR0, T_IST1, T_ISR1, T_ITMR, IR,
DMDin,
RSTtext_h, Awake, enTRAP_RL, STBY,
IRE, EX_en, Dummy_R, dBR_R, idBR_R, RET_R,
DU_Eg, Call_Ed, RTI_Ed, BR_Ed, EXIT_E, RET_Ed,
Nseq_Ed, IDLE_Eg, MACdep_Eg, LDaST_Eg, MTCNTR_Eg,
MTOWRCNTR_Eg, MTtoppcs_Eg, MTIMASK_Eg, MTICNTL_Eg,
MTIFC_Eg, MTMSTAT_Eg, MFPSQ_E, MFtoppcs_Eg,
MFIMASK_E, MFICNTL_E, MFSSTAT_E, MFMSTAT_E,
MFCNTR_E, Stkctl_Eg, Modctl_Eg, MpopLP_Eg, imm16_E,
imm14_E, MFIDR_E, Long_Eg, Nrti_Ed, MTPMOVL_E,
MTDMOVL_E, MFPMOVL_E, MFDMOVL_E, accCM_R, accCM_E,
Bt_I, BTaken_I, RTaken_I, PTaken_R, PTaken_E,
DAG2A_D,
Ctrue, Ttrue, ASTAT,
SP1_EN, BRn, eRDY, EXTC_Eg, STI_Cg,
BOOT, STEAL, SREQ, IDMA_A, DSreqx,
GO_Fx, GO_Ex, GO_Cx, IRR, IDR, HALT_Eg,
GOICE_syn,
PDFORCE,
BIAD, T_BDMA, BSreqx,
`ifdef FD_DFT
SCAN_TEST,
`endif

GO_F, GO_D, GO_E, GO_C, PPclr_h, MSTAT,
ICE_ST_h, ICE_ST, IDLE_ST_h, IDLE_ST, TRAP_Eg,
redoM_h, redoSTI_h, redoLD_h, redoEX_h, TRAP_R,
TRAP_R_L, Prderr_Eg,
Bterr_E, Taddr_E, IFA_nxo,
CE, VpopST_Eg, popASTATo, Term, GO_MAC,
BGn, IFA,
PMOVL, DMOVL, redoIF_h,
GO_EC, ECYC,
CMAin,
HALTclr_h, GOICEclr_h, GOICEdis,
DRA, EXA,



psqDMD_do);

input [13:0] BIAD;
input
T_BDMA,
DSreqx,
BSreqx;

input [15:0] DMDin;
input [7:0] ASTAT;
input [13:0] DAG2A_D,
IRR,
Bt_I,
IDMA_A;
input [15:0] IDR;
input [17:4] IR;
input [19:0] IRE;


input T_RST,
DSPCLK,
Dummy_R,

Long_Eg,
accCM_R, accCM_E,
GO_Fx,
GO_Ex,
GO_Cx,
EX_en,

Ctrue,
Ttrue,
RSTtext_h,
PDFORCE,
STBY,
Awake,
enTRAP_RL,

BTaken_I,
RTaken_I,
PTaken_E,
PTaken_R,

BRn,
eRDY,
STI_Cg,
EXTC_Eg,

BOOT,
STEAL,
SREQ,
IDLE_Eg,
GOICE_syn,
HALT_Eg,
EXIT_E,
MACdep_Eg,
LDaST_Eg,
SP1_EN,
X_PWDn,
X_IRQ2n,
X_IRQL1n,
X_IRQL0n,
X_IRQE1n,
X_IRQE0n,
X_IRQ1n,
X_IRQ0n,
T_IST0,
T_ISR0,
T_IST1,
T_ISR1,
T_ITMR,

DU_Eg,
RTI_Ed,

RET_Ed,
RET_R,
dBR_R,
idBR_R,
BR_Ed,
Call_Ed,
Nseq_Ed,
Nrti_Ed,
MTCNTR_Eg,
MTOWRCNTR_Eg,
MTIMASK_Eg,
MTICNTL_Eg,
MTIFC_Eg,
MTMSTAT_Eg,
MTtoppcs_Eg,
MTPMOVL_E,
MTDMOVL_E,
MFPSQ_E,
MFtoppcs_Eg,
MFIMASK_E,
MFICNTL_E,
MFSSTAT_E,
MFMSTAT_E,
MFCNTR_E,
MFPMOVL_E,
MFDMOVL_E,
imm16_E,
imm14_E,
MFIDR_E,
Stkctl_Eg,
Modctl_Eg,

MpopLP_Eg;



`ifdef FD_DFT
input SCAN_TEST;
`endif

output [7:0] PMOVL;
output [3:0] DMOVL;

output [6:0] MSTAT;
output [7:0] popASTATo;
output [3:0] Term;
output [4:0] IFA_nxo;
output [13:0] IFA,
CMAin,
DRA,
EXA,
Taddr_E;
output PPclr_h,
HALTclr_h,
GOICEclr_h,
GOICEdis,
GO_F,
GO_D,
GO_E,
GO_C,
redoIF_h,
Prderr_Eg,
Bterr_E,
GO_EC,
ECYC,
ICE_ST_h,
ICE_ST,
IDLE_ST_h,
IDLE_ST,
TRAP_R,
TRAP_R_L,
TRAP_Eg,
GO_MAC,
CE,
VpopST_Eg,
BGn,

redoSTI_h,
redoLD_h,
redoEX_h,
redoM_h;

output [15:0] psqDMD_do;



reg [15:0] PCS;
reg [9:0] IMASK;
reg [7:0] SSTAT;
reg [15:0] IFC;
reg [13:0] IFA,

DRA,
EXA,
Taddr_Eb;
reg [12:0] Iflag;
reg [10:0] Iact_E;
reg CNTRval,
TRAP_R_L,

CE, Eqend_D, Eqend_Ed, MREQ, MGNT, PCS2or3;
reg T_PWRDN, T_IRQ2p, T_IRQL1p, T_IRQL0p, T_IRQE1,
T_IRQE0, T_IRQ1p, T_IRQ0p, T_PWRDN_s1,
T_IRQ2_s1, T_IRQE1_s1, T_IRQE0_s1, T_IRQ1_s1,
T_IRQ0_s1, ECYC;
reg TRAP_Eg, INT_en;

wire T_IRQ2, T_IRQL1, T_IRQL0, T_IRQ1, T_IRQ0;

wire [15:0] PNS;
wire [13:0] IFA_nx,
Naddr_I,
Naddr_E,
CNTR_m1,
CNTR,
CNTR_nx,
CNTin,
PCin, nTopPC, TopPC, TopCNT,
Taddr_Rb;
wire [4:0] ICNTL;
wire [6:0] MSTAT;
wire [15:0] DMD_do;
wire [21:0] LPin, TopLP;
wire [24:0] STin, TopST;
wire [3:0] IVA;
wire [12:0] Irqx, Irqi;
wire [10:0] Iact_R, Iact_Ri;
wire [9:0] IMASK_nx1, IMASK_nx2;
wire [6:0] MC_nx, MSTAT_nx;
wire Sel_IF, Sel_IVA, Sel_EXA, Sel_nTP, Sel_TPC,
Sel_PTA, Sel_RTA, PushPC_EN, PopPC_Eg, PopPC_EN,
PushLP_EN, PopLP_Eg, PopLP_EN, PushST_EN, PopST_Eg,
PopST_EN, PushCNT_Eg, PopCNT_Eg, PushCNT_EN,
PopCNT_EN, VpopST_Eg, LP_empty, Eqend_I, Eqend_Eg,
LPend_Eg, LTaken_Eg, Inest, IRQ0edge, IRQ1edge,
IRQ2edge, condCE, termCE, LPonCE, BRonCE,
testCE, LdCNTR_Eg, IMASK_we1, IMASK_we2, CNTR_we,
PMOVL_weh, PMOVL_wel, DMOVL_we, ICNTL_we, IFC_we,
MSTAT_we, GP2_Eg, GP4_Eg, exitIDLE;
wire sIflag12, sIflag11, sIflag10, sIflag9, sIflag6,
sIflag5, sIflag4, sIflag3, sIflag2, sIflag1, sIflag0;
wire rIflag12, rIflag11, rIflag10, rIflag9, rIflag6,
rIflag5, rIflag4, rIflag3, rIflag2, rIflag1, rIflag0;
wire updCNT_EN, updLP_EN, updST_EN, updPC_EN, accCM;

wire [13:0] Taddr_E0, Taddr_E1, accCM_Ain;
wire Sel_IFA, Bterr_E0, Bterr_E1;
wire Prderr00, Prderr01, Prderr10, Prderr11;

wire PCSpush_CKenb, PCSpop_CKenb, LPSpush_CKenb, LPSpop_CKenb,
STSpush_CKenb, STSpop_CKenb, CNSpush_CKenb, CNSpop_CKenb,
PCS_CKenb, LPS_CKenb, STS_CKenb, CNS_CKenb, CNTR_CKenb,
ICNTL_CKenb, MSTAT_CKenb, PMOVL_CKenb, DMOVL_CKenb;





function [13:0] Incr14;


input [13:0] A;
begin
Incr14 = A + 1;
end
endfunction

function [13:0] Decr14;


input [13:0] A;
begin
Decr14 = A - 1;
end
endfunction













`ifdef FD_DFT
reg RST_o, PPclr_o, SRST_o;
wire RST, PPclr, SRST;

always @(posedge DSPCLK) begin
RST_o <= #`db T_RST;
PPclr_o <= #`db T_RST || PPclr_h;
SRST_o <= #`db T_RST || RSTtext_h;
end

assign RST = SCAN_TEST ? T_RST : RST_o;
assign PPclr = SCAN_TEST ? T_RST : PPclr_o;
assign SRST = SCAN_TEST ? T_RST : SRST_o;

`else
reg RST, PPclr, SRST;
always @(posedge DSPCLK) begin
RST <= #`db T_RST;
PPclr <= #`db T_RST || PPclr_h;
SRST <= #`db T_RST || RSTtext_h;
end

`endif

















wire MTPMOVL_Eg = MTPMOVL_E && EX_en;
wire MTDMOVL_Eg = MTDMOVL_E && EX_en;



wire Call_Eg = Call_Ed && Ctrue;
wire RTI_Eg = RTI_Ed && Ctrue;

wire BR_Eg = BR_Ed && Ctrue;
wire RET_Eg = RET_Ed && Ctrue;
wire Nseq_Eg = Nseq_Ed && Ctrue;
wire Taken_Eg = Nseq_Eg;

















`ifdef FD_RTL_SIM
assign #`da Bterr_E = (DRA[13:0] != Taddr_E[13:0]);
`else
assign #`da Bterr_E0 = (DRA[13:0] != Taddr_E0[13:0]);
assign #`da Bterr_E1 = (DRA[13:0] != Taddr_E1[13:0]);


GTECH_MUX2 uu0 (.Z(Bterr_E), .S(Ctrue), .A(Bterr_E0), .B(Bterr_E1));
`endif


`ifdef FD_RTL_SIM
assign #`da Prderr_Eg = ((Nrti_Ed && Ctrue) != (PTaken_E && EX_en)) ||
Nrti_Ed && Ctrue && Bterr_E ||
RTI_Ed && Ctrue ||
Eqend_Eg && Ttrue ||
Eqend_Eg && !Ttrue && Bterr_E;

`else
assign #`da Prderr00 = PTaken_E && EX_en ||
Eqend_Ed && !IDLE_Eg && Bterr_E0;

assign #`da Prderr01 = PTaken_E && EX_en ||
Eqend_Ed && !IDLE_Eg;

assign #`da Prderr10 = (Nrti_Ed != (PTaken_E && EX_en)) ||
Nrti_Ed && Bterr_E1 ||
RTI_Ed ||
Eqend_Ed && !IDLE_Eg && !Nseq_Ed && Bterr_E1;

assign #`da Prderr11 = (Nrti_Ed != (PTaken_E && EX_en)) ||
Nrti_Ed && Bterr_E1 ||
RTI_Ed ||
Eqend_Ed && !IDLE_Eg && !Nseq_Ed;



GTECH_MUX4 uu1 (.Z(Prderr_Eg), .B(Ctrue), .A(Ttrue),
.D0(Prderr00), .D1(Prderr01), .D2(Prderr10), .D3(Prderr11));

`endif


















always @(posedge DSPCLK or posedge RST) begin
if (RST) MREQ <= #`db 0;
else if (GO_E || PCS[10]) MREQ <= #`db !BRn;
else if (PNS[0]|PNS[6]) MREQ <= #`db 0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) MGNT <= #`db 0;
else MGNT <= #`db MREQ & !(PNS[10]|PNS[6]);
end

assign #`da BGn = !MGNT;













































assign #`da GP2_Eg = STEAL || TRAP_Eg || HALT_Eg || IDLE_Eg;
assign #`da GP4_Eg = MACdep_Eg || LDaST_Eg || EXTC_Eg;



assign #`da PNS[0] = PCS[1] && (SRST || BOOT) ||
PCS2or3 && !STEAL && TRAP_Eg ||
PCS[2] && EXIT_E ||
PCS[12] && TRAP_Eg;

assign #`da PNS[1] = PCS[1] && !(SRST || BOOT) && !EXTC_Eg ||
PCS[14] && eRDY;


assign #`da PNS[2] = PCS[2] && !EXTC_Eg ||
PCS[15] && eRDY;

assign #`da PNS[3] = PCS2or3 && !GP2_Eg && !MREQ && !GP4_Eg ||
PCS[4] && exitIDLE ||
PCS[5] && !EXTC_Eg ||
PCS[6] && !EXTC_Eg ||
PCS[10] && eRDY ||
PCS[11] && !MGNT && !MACdep_Eg && !EXTC_Eg ||
PCS[12] && !GP2_Eg && !MREQ && !MACdep_Eg && !EXTC_Eg;

assign #`da PNS[4] = PCS2or3 && !STEAL && !TRAP_Eg && HALT_Eg ||
PCS[11] && !TRAP_Eg && HALT_Eg;

assign #`da PNS[5] = PCS[5] ||
PCS[6] && !EXIT_E;

assign #`da PNS[6] = PCS2or3 && !STEAL && !TRAP_Eg && !HALT_Eg
&& IDLE_Eg ||
PCS[6] && !exitIDLE ||
PCS[2] && !TRAP_Eg && !HALT_Eg && IDLE_Eg;

assign #`da PNS[7] = PCS2or3 && STEAL ||
PCS[4] && STEAL ;

assign #`da PNS[8] = PCS2or3 && !GP2_Eg && !MREQ && MACdep_Eg ||
PCS[10] && !MGNT && MACdep_Eg ||
PCS[11] && !GP2_Eg && !MREQ && MACdep_Eg;

assign #`da PNS[9] = PCS2or3 && !GP2_Eg && !MREQ && LDaST_Eg;

assign #`da PNS[10] = PCS2or3 && !GP2_Eg && !MREQ && !MACdep_Eg
&& !LDaST_Eg && EXTC_Eg ||
PCS[7] && EXTC_Eg ||
PCS[8] && EXTC_Eg ||
PCS[1] && !eRDY ||
PCS[11] && !MGNT && !MACdep_Eg && EXTC_Eg ||
PCS[12] && !GP2_Eg && !MREQ && !MACdep_Eg && EXTC_Eg;

assign #`da PNS[11] = PCS[0] && !(SRST || BOOT) && MREQ ||
PCS[1] && MREQ ||
PCS2or3 && !GP2_Eg && MREQ ||
PCS[10] && MGNT ||
PCS[13] && !GP2_Eg && MREQ;

assign #`da PNS[12] = PCS[5] && !STEAL && !STI_Cg ||
PCS[11];

assign #`da PNS[13] = PCS[7] && !STEAL && STI_Cg;

assign #`da PNS[14] = PCS[10] && !(SRST || BOOT) && EXTC_Eg ||
PCS[1] && !eRDY;

assign #`da PNS[15] = PCS[1] && EXTC_Eg ||
PCS[12] && !eRDY;




always @(posedge DSPCLK or posedge SRST) begin
if (SRST) begin
PCS[15:0] <= #`db 16'h1;
PCS2or3 <= #`db 1'b0;
end
else begin
PCS[15:0] <= #`db PNS[15:0];
PCS2or3 <= #`db PNS[2] || PNS[3];
end
end















assign #`da GO_F = PNS[0] || PNS[4] || PNS[2] || PNS[3] ;
assign #`da GO_D = PNS[1] || PNS[2] || PNS[3] ;
assign #`da GO_E = PNS[2] || PNS[3] ;
assign #`da GO_C = PNS[3] ;

`ifdef FD_DFT
wire PPclr_h_h = (PNS[0] || PNS[4]);
assign PPclr_h = SCAN_TEST ? T_RST : PPclr_h_h;

`else
assign #`da PPclr_h = PNS[0] || PNS[4];
`endif
assign #`da HALTclr_h = PNS[3];
assign #`da GOICEclr_h = PNS[0] || PNS[2] || PNS[5];
assign #`da GOICEdis = PCS[0] || PCS[1] || PCS[15];
assign #`d0 GO_MAC = PNS[8];
assign #`d0 redoM_h = PNS[12];
assign #`d0 redoSTI_h = PNS[13];
assign #`d0 redoLD_h = PNS[8] || PNS[9] ;
assign #`da redoIF_h = |{PNS[12:8], PNS[14]};

assign #`da redoEX_h = PNS[5] || redoIF_h;


assign #`da IDLE_ST_h = PNS[4];
assign #`da ICE_ST_h = PNS[6];
assign #`d0 IDLE_ST = PCS[7];
assign #`d0 ICE_ST = PCS[3];




always @(posedge DSPCLK) begin
if (PPclr_h || GO_Ex) ECYC <= #`db 1'b0;
else ECYC <= #`db ICE_ST ? EXTC_Eg : (PNS[10] || PNS[14]|| PNS[15]);

end

assign #`d0 GO_EC = !ECYC && (ICE_ST ? EXTC_Eg : PNS[10]);





























assign #`da Sel_IF = !(TRAP_Eg || IDLE_ST || EXIT_E ||
Long_Eg || Prderr_Eg);

assign #`da Sel_IVA = SRST || BOOT || TRAP_Eg;

assign #`da Sel_EXA = IDLE_ST ||
Long_Eg && !Eqend_Eg ||
Prderr_Eg && !(Nseq_Ed && Ctrue) &&
(!Eqend_Eg || Ttrue);

assign #`da Sel_TPC = Long_Eg && Eqend_Eg && !Ttrue ||
Prderr_Eg && !(Nseq_Ed && Ctrue) &&
(Eqend_Eg && !Ttrue) ||
Sel_IF && RTaken_I ||
Sel_IF && Eqend_I && (!RET_R || !PTaken_R);

assign #`da Sel_nTP = Sel_IF && Eqend_I && (RET_R && PTaken_R);

assign #`da Sel_RTA = Prderr_Eg && Ctrue && Nseq_Ed;

assign #`da Sel_PTA = Sel_IF && BTaken_I;




assign #`da Naddr_I[13:0] = Incr14(IFA[13:0]);
assign #`da Naddr_E[13:0] = Incr14(EXA[13:0]);

assign IFA_nxo[4:0]=IFA_nx[4:0];

`ifdef FD_RTL_SIM
assign #`da IFA_nx[13:0] = Sel_IVA ? {8'b0, IVA[3:0], 2'b0} :
EXIT_E ? IRR[13:0] :
Sel_EXA ? Naddr_E[13:0] :
Sel_TPC ? TopPC[13:0] :
Sel_nTP ? nTopPC[13:0] :
Sel_RTA ? Taddr_E[13:0] :
Sel_PTA ? Bt_I[13:0] : Naddr_I;
`else

assign #`da Sel_IFA = !(TRAP_Eg || SRST || BOOT ||
IDLE_ST || EXIT_E || Prderr_Eg ||
Eqend_I || BTaken_I || RTaken_I) &&
!(Long_Eg && !(Eqend_Eg && Ttrue));

assign #`da IFA_nx[13:0] = {14{ Sel_IFA}} & Naddr_I[13:0] |
{14{ Sel_IVA}} & {8'b0, IVA[3:0], 2'b0} |
{14{!Sel_IVA && EXIT_E}} & IRR[13:0] |
{14{!Sel_IVA && Sel_EXA}} & Naddr_E[13:0] |
{14{!Sel_IVA && Sel_TPC}} & TopPC[13:0] |
{14{!Sel_IVA && Sel_nTP}} & nTopPC[13:0] |
{14{!Sel_IVA && Sel_RTA}} & Taddr_E[13:0] |
{14{!Sel_IVA && Sel_PTA}} & Bt_I[13:0];

`endif




always @(posedge DSPCLK) if (GO_F) IFA[13:0] <= #`db IFA_nx[13:0];
always @(posedge DSPCLK) if (GO_D) DRA[13:0] <= #`db IFA[13:0];
always @(posedge DSPCLK) if (GO_E) EXA[13:0] <= #`db DRA[13:0];



















assign #`da accCM = accCM_R || accCM_E;

assign #`da accCM_Ain[13:0] = GO_Ex ? IR[17:4] : IRE[17:4];








`ifdef FD_RTL_SIM
assign #`da CMAin[13:0] = SREQ ? ( DSreqx ? IDMA_A[13:0] :
{14{BSreqx}} & BIAD[13:0] ) :
accCM ? accCM_Ain[13:0] :
GO_Fx ? IFA_nx[13:0] : IFA[13:0];
`else

wire [13:0] CMAin1 = SREQ ? ( DSreqx ? IDMA_A[13:0] :
{14{BSreqx}} & BIAD[13:0] ) :
accCM ? accCM_Ain[13:0] : IFA[13:0];

wire selIFA_nx = GO_Fx & !(SREQ|accCM);


GTECH_MUX2 cmx0 ( .Z(CMAin[0]), .S(selIFA_nx), .A(CMAin1[0]), .B(IFA_nx[0]) );
GTECH_MUX2 cmx1 ( .Z(CMAin[1]), .S(selIFA_nx), .A(CMAin1[1]), .B(IFA_nx[1]) );
GTECH_MUX2 cmx2 ( .Z(CMAin[2]), .S(selIFA_nx), .A(CMAin1[2]), .B(IFA_nx[2]) );
GTECH_MUX2 cmx3 ( .Z(CMAin[3]), .S(selIFA_nx), .A(CMAin1[3]), .B(IFA_nx[3]) );
GTECH_MUX2 cmx4 ( .Z(CMAin[4]), .S(selIFA_nx), .A(CMAin1[4]), .B(IFA_nx[4]) );
GTECH_MUX2 cmx5 ( .Z(CMAin[5]), .S(selIFA_nx), .A(CMAin1[5]), .B(IFA_nx[5]) );
GTECH_MUX2 cmx6 ( .Z(CMAin[6]), .S(selIFA_nx), .A(CMAin1[6]), .B(IFA_nx[6]) );
GTECH_MUX2 cmx7 ( .Z(CMAin[7]), .S(selIFA_nx), .A(CMAin1[7]), .B(IFA_nx[7]) );
GTECH_MUX2 cmx8 ( .Z(CMAin[8]), .S(selIFA_nx), .A(CMAin1[8]), .B(IFA_nx[8]) );
GTECH_MUX2 cmx9 ( .Z(CMAin[9]), .S(selIFA_nx), .A(CMAin1[9]), .B(IFA_nx[9]) );
GTECH_MUX2 cmx10( .Z(CMAin[10]), .S(selIFA_nx), .A(CMAin1[10]), .B(IFA_nx[10]));
GTECH_MUX2 cmx11( .Z(CMAin[11]), .S(selIFA_nx), .A(CMAin1[11]), .B(IFA_nx[11]));
GTECH_MUX2 cmx12( .Z(CMAin[12]), .S(selIFA_nx), .A(CMAin1[12]), .B(IFA_nx[12]));
GTECH_MUXI2 cmx13( .Z(CMAin13_), .S(selIFA_nx), .A(CMAin1[13]), .B(IFA_nx[13]));
GTECH_NOT inv13( .Z(CMAin[13]), .A(CMAin13_));


`endif
















assign #`da Taddr_Rb[13:0] = {14{dBR_R}} & IR[17:4] |
{14{idBR_R}} & DAG2A_D[13:0];




assign #`da Taddr_E[13:0] = BR_Eg ? Taddr_Eb[13:0] : TopPC[13:0];

`ifdef FD_RTL_SIM
`else
assign #`da Taddr_E0[13:0] = TopPC[13:0];
assign #`da Taddr_E1[13:0] = BR_Ed ? Taddr_Eb[13:0] : TopPC[13:0];
`endif



always @(posedge DSPCLK)
if (GO_E) Taddr_Eb[13:0] <= #`db Taddr_Rb[13:0];






























assign #`da Eqend_I = ({PMOVL[3:0], IFA[13:0]} == TopLP[21:4]) & !LP_empty;

always @(posedge DSPCLK) begin
if (PPclr_h) Eqend_D <= #`db 1'b0;
else if (GO_D) Eqend_D <= #`db Eqend_I;
end

always @(posedge DSPCLK) begin
if (PPclr_h) Eqend_Ed <= #`db 1'b0;
else if (GO_E) Eqend_Ed <= #`db Eqend_D && !Dummy_R;
end




assign #`da Eqend_Eg = Eqend_Ed && !IDLE_Eg && !(Nseq_Ed && Ctrue);

assign #`da LPend_Eg = Eqend_Eg && Ttrue;
assign #`da LTaken_Eg = Eqend_Eg && !Ttrue;



























assign #`da updPC_EN = PushPC_EN || PopPC_EN;

assign #`da PushPC_EN = TRAP_Eg && PNS[0] ||
(Call_Eg || DU_Eg || MTtoppcs_Eg) && GO_Cx;

assign #`da PopPC_Eg = RET_Eg || LPend_Eg || MFtoppcs_Eg ||
(Stkctl_Eg && IRE[4]);

assign #`da PopPC_EN = PopPC_Eg && GO_Cx;

assign #`da PCin[13:0] = TRAP_Eg ? EXA[13:0] :
MTtoppcs_Eg ? DMDin[13:0] : Naddr_E[13:0];





assign #`da PCSpush_CKenb = !(TRAP_Eg || Call_Ed || DU_Eg || MTtoppcs_Eg);

assign #`da PCSpop_CKenb = !(RET_Ed || Eqend_Ed || MFtoppcs_Eg ||
Stkctl_Eg && IRE[4]);

assign #`da PCS_CKenb = PCSpush_CKenb && PCSpop_CKenb;



PCstk pcstk (/* in */ SRST, DSPCLK, PCin[13:0], PushPC_EN, PopPC_EN,
PCS_CKenb,
`ifdef FD_DFT
SCAN_TEST,
`endif
TopPC[13:0], nTopPC[13:0], PC_full, PC_empty,
PC_has1);

















assign #`da updLP_EN = (DU_Eg || LPend_Eg || MpopLP_Eg) && GO_Cx;

assign #`da PushLP_EN = DU_Eg && GO_Cx;

assign #`da PopLP_Eg = LPend_Eg || MpopLP_Eg;
assign #`da PopLP_EN = PopLP_Eg && GO_Cx;


assign #`d0 LPin[21:0] = {IRE[17:0], PMOVL[3:0]};





assign #`da LPSpush_CKenb = !DU_Eg;

assign #`da LPSpop_CKenb = !(Eqend_Ed || MpopLP_Eg);

assign #`da LPS_CKenb = LPSpush_CKenb && LPSpop_CKenb;



LPstk lpstk (/* in */ SRST, DSPCLK, LPin[21:0], PushLP_EN, PopLP_EN,
LPS_CKenb,
`ifdef FD_DFT
SCAN_TEST,
`endif
TopLP[21:0], LP_full, LP_empty, LP_has1);




















assign #`da updST_EN = TRAP_Eg && PNS[0] ||
RTI_Eg && GO_Cx ||
(Stkctl_Eg && IRE[1]) && GO_Cx;

assign #`da PushST_EN = (TRAP_Eg && PNS[0]) ||
(Stkctl_Eg && IRE[1] && !IRE[0] && GO_Cx);

assign #`da PopST_Eg = RTI_Eg || (Stkctl_Eg && IRE[1] && IRE[0]);
assign #`da PopST_EN = PopST_Eg && GO_Cx;

assign #`d0 STin[24:0] = {IMASK[9:0], MSTAT[6:0], ASTAT[7:0]};

assign #`d0 popASTATo[7:0] = TopST[7:0];





assign #`da STSpush_CKenb = !(TRAP_Eg || Stkctl_Eg && IRE[1] && !IRE[0]);

assign #`da STSpop_CKenb = !(RTI_Ed || Stkctl_Eg && IRE[1] && IRE[0]);

assign #`da STS_CKenb = STSpush_CKenb && STSpop_CKenb;



STstk ststk (/* in */ SRST, DSPCLK, STin[24:0], PushST_EN, PopST_EN,
STS_CKenb,
`ifdef FD_DFT
SCAN_TEST,
`endif
TopST[24:0], ST_full, ST_empty, ST_has1);























assign #`d0 Term[3:0] = TopLP[3:0];
assign #`da condCE = (IRE[3:0] == 4'he);
assign #`da termCE = (Term[3:0] == 4'he);
assign #`da LPonCE = Eqend_Eg && termCE;
assign #`da BRonCE = BR_Ed && condCE;
assign #`da testCE = BRonCE || LPonCE;

assign #`da PushCNT_Eg = MTCNTR_Eg && CNTRval;

assign #`da PopCNT_Eg = LPend_Eg && termCE ||
BR_Ed && CE && condCE ||
Stkctl_Eg && IRE[2];

assign #`da PushCNT_EN = PushCNT_Eg && GO_Cx;
assign #`da PopCNT_EN = PopCNT_Eg && GO_Cx;

assign #`da updCNT_EN = PushCNT_EN || PopCNT_EN;

assign #`da CNTin[13:0] = CNTR[13:0];





assign #`da CNSpush_CKenb = !PushCNT_Eg;

assign #`da CNSpop_CKenb = !(Eqend_Ed ||
BR_Ed && condCE ||
Stkctl_Eg && IRE[2]);

assign #`da CNS_CKenb = CNSpush_CKenb && CNSpop_CKenb;



CNTstk cntstk (/* in */ SRST, DSPCLK, CNTin[13:0], PushCNT_EN,
PopCNT_EN, CNS_CKenb,
`ifdef FD_DFT
SCAN_TEST,
`endif
TopCNT[13:0], CNT_full, CNT_empty, CNT_has1);
































always @(posedge DSPCLK or posedge SRST) begin
if (SRST) CNTRval <= #`db 1'b0;
else if (LdCNTR_Eg && GO_Cx) CNTRval <= #`db 1'b1;
else if (PopCNT_EN && CNT_empty) CNTRval <= #`db 1'b0;
end



assign #`da LdCNTR_Eg = MTCNTR_Eg || MTOWRCNTR_Eg;

assign #`da CNTR_we = (LdCNTR_Eg ||
testCE ||
Stkctl_Eg && IRE[2]) && GO_Cx;

assign #`da CNTR_m1[13:0] = Decr14(CNTR[13:0]);



assign #`da CNTR_nx[13:0] = LdCNTR_Eg ? DMDin[13:0] :
(PopCNT_Eg & !CNT_empty) ? TopCNT[13:0] :
CNTR_m1[13:0];








assign #`da CNTR_CKenb = !(LdCNTR_Eg || BRonCE || Eqend_Ed ||
Stkctl_Eg && IRE[2]);

always @(posedge DSPCLK or posedge SRST) begin
if (SRST) begin
CE <= #`db 1'b0;

end
else if (CNTR_we) begin
CE <= #`db CNTR_nx[13:0] == 14'h1;

end
end

`ifdef FD_DFT
REG14LC CNTR_reg (DSPCLK, CNTR_CKenb, CNTR_we,
CNTR_nx[13:0], CNTR[13:0], SRST, SCAN_TEST);
`else
REG14LC CNTR_reg (DSPCLK, CNTR_CKenb, CNTR_we,
CNTR_nx[13:0], CNTR[13:0], SRST);
`endif






























assign #`da VpopST_Eg = PopST_Eg && !ST_empty;

assign #`da IMASK_we1 = PNS[0] && !ICE_ST;
assign #`da IMASK_we2 = (MTIMASK_Eg || VpopST_Eg) && GO_Cx;

always @(posedge DSPCLK or posedge SRST) begin
if (SRST) IMASK[9:0] <= #`db 10'b0;
else if (IMASK_we1) IMASK[9:0] <= #`db IMASK_nx1[9:0];
else if (IMASK_we2) IMASK[9:0] <= #`db IMASK_nx2[9:0];
end

assign #`da IMASK_nx1[9:0]
= {10{!Inest || Iact_E[10] || Iact_E[9]}} & 10'b0 |
{10{ Inest && Iact_E[8]}} & {IMASK[9], 9'b0} |
{10{ Inest && Iact_E[7]}} & {IMASK[9:8], 8'b0} |
{10{ Inest && Iact_E[6]}} & {IMASK[9:7], 7'b0} |
{10{ Inest && Iact_E[5]}} & {IMASK[9:6], 6'b0} |
{10{ Inest && Iact_E[4]}} & {IMASK[9:5], 5'b0} |
{10{ Inest && Iact_E[3]}} & {IMASK[9:4], 4'b0} |
{10{ Inest && Iact_E[2]}} & {IMASK[9:3], 3'b0} |
{10{ Inest && Iact_E[1]}} & {IMASK[9:2], 2'b0} |
{10{ Inest && Iact_E[0]}} & {IMASK[9:1], 1'b0};

assign #`da IMASK_nx2[9:0] = MTIMASK_Eg ? DMDin[9:0] : TopST[24:15];



































assign #`da ICNTL_we = MTICNTL_Eg && GO_Cx;

assign #`da ICNTL_CKenb = !MTICNTL_Eg;








`ifdef FD_DFT
REG5LC ICNTL_reg (DSPCLK, ICNTL_CKenb, ICNTL_we,
{DMDin[4], 1'b0, DMDin[2:0]}, ICNTL[4:0], RST, SCAN_TEST);
`else
REG5LC ICNTL_reg (DSPCLK, ICNTL_CKenb, ICNTL_we,
{DMDin[4], 1'b0, DMDin[2:0]}, ICNTL[4:0], RST);
`endif






























assign #`da IFC_we = MTIFC_Eg && GO_Cx;

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[1] <= #`db 1'b0;
else if (IFC_we) IFC[1] <= #`db DMDin[0];
else if (IFC[0]) IFC[1] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[0] <= #`db 1'b0;
else if (IFC_we) IFC[0] <= #`db DMDin[1];
else if (IFC[1]) IFC[0] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[3] <= #`db 1'b0;
else if (IFC_we) IFC[3] <= #`db DMDin[2];
else if (IFC[2]) IFC[3] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[2] <= #`db 1'b0;
else if (IFC_we) IFC[2] <= #`db DMDin[3];
else if (IFC[3]) IFC[2] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[5] <= #`db 1'b0;
else if (IFC_we) IFC[5] <= #`db DMDin[4];
else if (IFC[4]) IFC[5] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[4] <= #`db 1'b0;
else if (IFC_we) IFC[4] <= #`db DMDin[5];
else if (IFC[5]) IFC[4] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[7] <= #`db 1'b0;
else if (IFC_we) IFC[7] <= #`db DMDin[6];
else if (IFC[6]) IFC[7] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[6] <= #`db 1'b0;
else if (IFC_we) IFC[6] <= #`db DMDin[7];
else if (IFC[7]) IFC[6] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[9] <= #`db 1'b0;
else if (IFC_we) IFC[9] <= #`db DMDin[8];
else if (IFC[8]) IFC[9] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[8] <= #`db 1'b0;
else if (IFC_we) IFC[8] <= #`db DMDin[9];
else if (IFC[9]) IFC[8] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[11] <= #`db 1'b0;
else if (IFC_we) IFC[11] <= #`db DMDin[10];
else if (IFC[10]) IFC[11] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[10] <= #`db 1'b0;
else if (IFC_we) IFC[10] <= #`db DMDin[11];
else if (IFC[11]) IFC[10] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[12] <= #`db 1'b0;
else if (IFC_we) IFC[12] <= #`db DMDin[12];
else if (IFC[12]) IFC[12] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[13] <= #`db 1'b0;
else if (IFC_we) IFC[13] <= #`db DMDin[13];
else if (IFC[13]) IFC[13] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[14] <= #`db 1'b0;
else if (IFC_we) IFC[14] <= #`db DMDin[14];
else if (IFC[14]) IFC[14] <= #`db 1'b0;
end

always @(posedge DSPCLK or posedge RST) begin
if (RST) IFC[15] <= #`db 1'b0;
else if (IFC_we) IFC[15] <= #`db DMDin[15];
else if (IFC[15]) IFC[15] <= #`db 1'b0;
end



























assign #`da MSTAT_we = (MTMSTAT_Eg || VpopST_Eg || Modctl_Eg) && GO_Cx;

assign #`da MSTAT_CKenb = !(MTMSTAT_Eg || Modctl_Eg || RTI_Ed ||
Stkctl_Eg && IRE[1] && IRE[0]);



assign #`da MC_nx[0] = IRE[7] ? IRE[4] : MSTAT[0];
assign #`da MC_nx[1] = IRE[5] ? IRE[6] : MSTAT[1];
assign #`da MC_nx[2] = IRE[9] ? IRE[8] : MSTAT[2];
assign #`da MC_nx[3] = IRE[13] ? IRE[10] : MSTAT[3];
assign #`da MC_nx[4] = IRE[11] ? IRE[12] : MSTAT[4];
assign #`da MC_nx[5] = IRE[15] ? IRE[14] : MSTAT[5];
assign #`da MC_nx[6] = IRE[3] ? IRE[2] : MSTAT[6];



assign #`da MSTAT_nx[6:0] = MTMSTAT_Eg ? DMDin[6:0] :
Modctl_Eg ? MC_nx[6:0] : TopST[14:8];










`ifdef FD_DFT
REG7LC MSTAT_reg (DSPCLK, MSTAT_CKenb, MSTAT_we,
MSTAT_nx[6:0], MSTAT[6:0], RST, SCAN_TEST);
`else
REG7LC MSTAT_reg (DSPCLK, MSTAT_CKenb, MSTAT_we,
MSTAT_nx[6:0], MSTAT[6:0], RST);
`endif























always @(posedge DSPCLK or posedge SRST) begin
if (SRST) SSTAT[0] <= #`db 1'b1;
else if (updPC_EN) SSTAT[0] <= #`db PopPC_EN && (PC_has1|PC_empty);
end

always @(posedge DSPCLK or posedge SRST) begin
if (SRST) SSTAT[1] <= #`db 1'b0;
else if (PushPC_EN & !SSTAT[1]) SSTAT[1] <= #`db PC_full;

end

always @(posedge DSPCLK or posedge SRST) begin
if (SRST) SSTAT[2] <= #`db 1'b1;
else if (updCNT_EN) SSTAT[2] <= #`db PopCNT_EN && (CNT_has1|CNT_empty);
end

always @(posedge DSPCLK or posedge SRST) begin
if (SRST) SSTAT[3] <= #`db 1'b0;
else if (PushCNT_EN & !SSTAT[3]) SSTAT[3] <= #`db CNT_full;

end

always @(posedge DSPCLK or posedge SRST) begin
if (SRST) SSTAT[4] <= #`db 1'b1;
else if (updST_EN) SSTAT[4] <= #`db PopST_EN && (ST_has1|ST_empty);
end

always @(posedge DSPCLK or posedge SRST) begin
if (SRST) SSTAT[5] <= #`db 1'b0;
else if (PushST_EN & !SSTAT[5]) SSTAT[5] <= #`db ST_full;

end

always @(posedge DSPCLK or posedge SRST) begin
if (SRST) SSTAT[6] <= #`db 1'b1;
else if (updLP_EN) SSTAT[6] <= #`db PopLP_EN && (LP_has1|LP_empty);
end

always @(posedge DSPCLK or posedge SRST) begin
if (SRST) SSTAT[7] <= #`db 1'b0;
else if (PushLP_EN & !SSTAT[7]) SSTAT[7] <= #`db LP_full;

end















assign #`da PMOVL_weh = MTPMOVL_Eg && GO_Cx && !(&{DMDin[7:4]});
assign #`da PMOVL_wel = MTPMOVL_Eg && GO_Cx && !(&{DMDin[3:0]});

assign #`da DMOVL_we = MTDMOVL_Eg && GO_Cx;

assign #`d0 PMOVL_CKenb = !MTPMOVL_E;
assign #`da DMOVL_CKenb = !MTDMOVL_E;

















`ifdef FD_DFT
REG4LC PMOVL_regh (DSPCLK, PMOVL_CKenb, PMOVL_weh,
DMDin[7:4], PMOVL[7:4], RST, SCAN_TEST);
REG4LC PMOVL_regl (DSPCLK, PMOVL_CKenb, PMOVL_wel,
DMDin[3:0], PMOVL[3:0], RST, SCAN_TEST);
REG4LC DMOVL_reg (DSPCLK, DMOVL_CKenb, DMOVL_we,
DMDin[3:0], DMOVL[3:0], RST, SCAN_TEST);
`else
REG4LC PMOVL_regh (DSPCLK, PMOVL_CKenb, PMOVL_weh,
DMDin[7:4], PMOVL[7:4], RST);
REG4LC PMOVL_regl (DSPCLK, PMOVL_CKenb, PMOVL_wel,
DMDin[3:0], PMOVL[3:0], RST);
REG4LC DMOVL_reg (DSPCLK, DMOVL_CKenb, DMOVL_we,
DMDin[3:0], DMOVL[3:0], RST);
`endif















assign #`da DMD_do[15:0] = {16{MFIMASK_E}} & {6'b0, IMASK[9:0]} |
{16{MFSSTAT_E}} & {8'b0, SSTAT[7:0]} |
{16{MFMSTAT_E}} & {9'b0, MSTAT[6:0]} |
{16{MFICNTL_E}} & {11'b0, ICNTL[4:0]} |
{16{MFCNTR_E}} & {2'b0, CNTR[13:0]} |
{16{MFtoppcs_Eg}} & {2'b0, TopPC[13:0]} |
{16{MFPMOVL_E}} & {8'b0, PMOVL[7:0]} |
{16{MFDMOVL_E}} & {12'b0, DMOVL[3:0]} |
{16{MFIDR_E}} & IDR[15:0] |
{16{imm16_E}} & IRE[19:4] |
{16{imm14_E}} & {{2{IRE[17]}}, IRE[17:4]};



assign #`da psqDMD_do[15:0] = {16{MFPSQ_E}} & DMD_do[15:0];



































































assign #`d0 Inest = ICNTL[4];
assign #`d0 {IRQ2edge, IRQ1edge, IRQ0edge} = ICNTL[2:0];









always @(posedge DSPCLK) begin
T_PWRDN <= #`db !X_PWDn;
T_IRQ2p <= #`db !X_IRQ2n;
T_IRQL1p <= #`db !X_IRQL1n;
T_IRQL0p <= #`db !X_IRQL0n;
T_IRQE1 <= #`db !X_IRQE1n;
T_IRQE0 <= #`db !X_IRQE0n;
T_IRQ1p <= #`db !X_IRQ1n;
T_IRQ0p <= #`db !X_IRQ0n;
end



IDEBN irq2_de (DSPCLK, T_IRQ2p, T_IRQ2);
IDEBN irq1_de (DSPCLK, T_IRQ1p, T_IRQ1);
IDEBN irq0_de (DSPCLK, T_IRQ0p, T_IRQ0);
IDEBN irql1_de (DSPCLK, T_IRQL1p, T_IRQL1);
IDEBN irql0_de (DSPCLK, T_IRQL0p, T_IRQL0);

assign #`d0 Irqx[12:0] = {T_IRQ1, T_IRQ0,
T_PWRDN, T_IRQ2, T_IRQL1, T_IRQL0, T_IST0,
T_ISR0, T_IRQE1, T_BDMA, T_IST1, T_ISR1,
T_ITMR};















always @(posedge DSPCLK) begin
T_PWRDN_s1 <= #`db T_PWRDN;
T_IRQ2_s1 <= #`db T_IRQ2;
T_IRQE1_s1 <= #`db T_IRQE1;
T_IRQ1_s1 <= #`db T_IRQ1;
T_IRQ0_s1 <= #`db T_IRQ0;
T_IRQE0_s1 <= #`db T_IRQE0;
end

assign #`da Irqi[12] = T_IRQ1 && (!T_IRQ1_s1 || !IRQ1edge);
assign #`da Irqi[11] = T_IRQ0 && (!T_IRQ0_s1 || !IRQ0edge);
assign #`da Irqi[10] = T_PWRDN && !T_PWRDN_s1;
assign #`da Irqi[9] = T_IRQ2 && (!T_IRQ2_s1 || !IRQ2edge);
assign #`da Irqi[4] = T_IRQE1 && !T_IRQE1_s1;
assign #`da Irqi[3] = Irqx[3] || !Irqx[3] && (T_IRQE0 && !T_IRQE0_s1);
assign #`da Irqi[8:5] = Irqx[8:5];
assign #`da Irqi[2:0] = Irqx[2:0];


















assign #`da sIflag12 = (Irqi[12] || IFC[10] && IRQ1edge) && !SP1_EN;

assign #`da rIflag12 = PPclr_h && Iact_E[2] ||
IFC[2] && IRQ1edge;

always @(posedge DSPCLK or posedge SRST) begin
if(SRST) Iflag[12] <= #`db 1'b0;
else if(!IRQ1edge) Iflag[12] <= #`db Irqi[12];
else if(rIflag12) Iflag[12] <= #`db 1'b0;
else if(sIflag12) Iflag[12] <= #`db 1'b1;
end




assign #`da sIflag11 = (Irqi[11] || IFC[9] && IRQ0edge) && !SP1_EN;

assign #`da rIflag11 = PPclr_h && Iact_E[1] ||
IFC[1] && IRQ0edge;

always @(posedge DSPCLK or posedge SRST) begin
if(SRST) Iflag[11] <= #`db 1'b0;
else if(!IRQ0edge) Iflag[11] <= #`db Irqi[11];
else if(rIflag11) Iflag[11] <= #`db 1'b0;
else if(sIflag11) Iflag[11] <= #`db 1'b1;
end




assign #`da sIflag10 = Irqi[10] || PDFORCE;
assign #`da rIflag10 = PPclr_h && Iact_E[10];

always @(posedge DSPCLK or posedge SRST) begin
if(SRST) Iflag[10] <= #`db 1'b0;
else if(rIflag10) Iflag[10] <= #`db 1'b0;
else if(sIflag10) Iflag[10] <= #`db 1'b1;
end




assign #`da sIflag9 = Irqi[9] || IFC[15] && IRQ2edge;

assign #`da rIflag9 = PPclr_h && Iact_E[9] ||
IFC[7] && IRQ2edge;

always @(posedge DSPCLK or posedge SRST) begin
if(SRST) Iflag[9] <= #`db 1'b0;
else if(!IRQ2edge) Iflag[9] <= #`db Irqi[9];
else if(rIflag9) Iflag[9] <= #`db 1'b0;
else if(sIflag9) Iflag[9] <= #`db 1'b1;
end




always @(posedge DSPCLK or posedge SRST) begin
if(SRST) Iflag[8:7] <= #`db 2'b0;
else Iflag[8:7] <= #`db Irqi[8:7];
end




assign #`da sIflag6 = Irqi[6] || IFC[14];

assign #`da rIflag6 = PPclr_h && Iact_E[6] || IFC[6];

always @(posedge DSPCLK or posedge SRST) begin
if(SRST) Iflag[6] <= #`db 1'b0;
else if(rIflag6) Iflag[6] <= #`db 1'b0;
else if(sIflag6) Iflag[6] <= #`db 1'b1;
end




assign #`da sIflag5 = Irqi[5] || IFC[13];

assign #`da rIflag5 = PPclr_h && Iact_E[5] || IFC[5];

always @(posedge DSPCLK or posedge SRST) begin
if(SRST) Iflag[5] <= #`db 1'b0;
else if(rIflag5) Iflag[5] <= #`db 1'b0;
else if(sIflag5) Iflag[5] <= #`db 1'b1;
end




assign #`da sIflag4 = Irqi[4] || IFC[12];

assign #`da rIflag4 = PPclr_h && Iact_E[4] || IFC[4];

always @(posedge DSPCLK or posedge SRST) begin
if(SRST) Iflag[4] <= #`db 1'b0;
else if(rIflag4) Iflag[4] <= #`db 1'b0;
else if(sIflag4) Iflag[4] <= #`db 1'b1;
end




assign #`da sIflag3 = Irqi[3] || IFC[11];

assign #`da rIflag3 = PPclr_h && Iact_E[3] || IFC[3];

always @(posedge DSPCLK or posedge SRST) begin
if(SRST) Iflag[3] <= #`db 1'b0;
else if(rIflag3) Iflag[3] <= #`db 1'b0;
else if(sIflag3) Iflag[3] <= #`db 1'b1;
end




assign #`da sIflag2 = (Irqi[2] || IFC[10]) && SP1_EN;

assign #`da rIflag2 = PPclr_h && Iact_E[2] || IFC[2];

always @(posedge DSPCLK or posedge SRST) begin
if(SRST) Iflag[2] <= #`db 1'b0;
else if(rIflag2) Iflag[2] <= #`db 1'b0;
else if(sIflag2) Iflag[2] <= #`db 1'b1;
end




assign #`da sIflag1 = (Irqi[1] || IFC[9]) && SP1_EN;

assign #`da rIflag1 = PPclr_h && Iact_E[1] || IFC[1];

always @(posedge DSPCLK or posedge SRST) begin
if(SRST) Iflag[1] <= #`db 1'b0;
else if(rIflag1) Iflag[1] <= #`db 1'b0;
else if(sIflag1) Iflag[1] <= #`db 1'b1;
end




assign #`da sIflag0 = Irqi[0] || IFC[8];

assign #`da rIflag0 = PPclr_h && Iact_E[0] || IFC[0];

always @(posedge DSPCLK or posedge SRST) begin
if(SRST) Iflag[0] <= #`db 1'b0;
else if(rIflag0) Iflag[0] <= #`db 1'b0;
else if(sIflag0) Iflag[0] <= #`db 1'b1;
end



always @(posedge DSPCLK or posedge SRST) begin
if(SRST) INT_en <= #`db 1'b1;
else if(GO_Cx & Stkctl_Eg & IRE[6]) INT_en <= #`db IRE[5];
end









assign #`da Iact_Ri[1] = (SP1_EN ? Iflag[1] : Iflag[11]) &&
(IMASK[1] && !ICE_ST);

assign #`da Iact_Ri[2] = (SP1_EN ? Iflag[2] : Iflag[12]) &&
(IMASK[2] && !ICE_ST);

assign #`da Iact_Ri[0] = Iflag[3] && (IMASK[0] && !ICE_ST);
assign #`da Iact_Ri[3] = Iflag[0] && (IMASK[3] && !ICE_ST);
assign #`da Iact_Ri[4] = Iflag[5] && (IMASK[4] && !ICE_ST);
assign #`da Iact_Ri[5] = Iflag[4] && (IMASK[5] && !ICE_ST);
assign #`da Iact_Ri[6] = Iflag[7] && (IMASK[6] && !ICE_ST);
assign #`da Iact_Ri[7] = Iflag[6] && (IMASK[7] && !ICE_ST);
assign #`da Iact_Ri[8] = Iflag[9] && (IMASK[8] && !ICE_ST);
assign #`da Iact_Ri[9] = Iflag[8] && (IMASK[9] && !ICE_ST);
assign #`da Iact_Ri[10] = Iflag[10] && !ICE_ST;

assign #`da TRAP_R = |{Iact_Ri[10:0]};




assign #`da Iact_R[0] = Iact_Ri[0] && !(|{Iact_Ri[10:1]});
assign #`da Iact_R[1] = Iact_Ri[1] && !(|{Iact_Ri[10:2]});
assign #`da Iact_R[2] = Iact_Ri[2] && !(|{Iact_Ri[10:3]});
assign #`da Iact_R[3] = Iact_Ri[3] && !(|{Iact_Ri[10:4]});
assign #`da Iact_R[4] = Iact_Ri[4] && !(|{Iact_Ri[10:5]});
assign #`da Iact_R[5] = Iact_Ri[5] && !(|{Iact_Ri[10:6]});
assign #`da Iact_R[6] = Iact_Ri[6] && !(|{Iact_Ri[10:7]});
assign #`da Iact_R[7] = Iact_Ri[7] && !(|{Iact_Ri[10:8]});
assign #`da Iact_R[8] = Iact_Ri[8] && !(|{Iact_Ri[10:9]});
assign #`da Iact_R[9] = Iact_Ri[9] && !(|{Iact_Ri[10]});
assign #`da Iact_R[10] = Iact_Ri[10];





always @(posedge DSPCLK or posedge PPclr) begin
if(PPclr) TRAP_R_L <= #`db 1'b0;
else TRAP_R_L <= #`db TRAP_R && enTRAP_RL;
end

always @(posedge DSPCLK or posedge PPclr) begin
if(PPclr) begin
Iact_E[10:0] <= #`db 11'b0;
TRAP_Eg <= #`db 1'b0;
end
else if(GO_E & INT_en) begin
Iact_E[10:0] <= #`db Iact_R[10:0];
TRAP_Eg <= #`db (IDLE_ST ? TRAP_R_L : TRAP_R) && !Dummy_R;
end
end






assign #`da exitIDLE = STBY ? (TRAP_R_L || GOICE_syn) : Awake;




assign #`da IVA[3:0] = (SRST || BOOT) ? 4'b0000 :
({4{Iact_E[10]}} & 4'b1011 |
{4{Iact_E[8]}} & 4'b0001 |
{4{Iact_E[9]}} & 4'b0010 |
{4{Iact_E[6]}} & 4'b0011 |
{4{Iact_E[7]}} & 4'b0100 |
{4{Iact_E[4]}} & 4'b0101 |
{4{Iact_E[5]}} & 4'b0110 |
{4{Iact_E[2]}} & 4'b0111 |
{4{Iact_E[3]}} & 4'b1000 |
{4{Iact_E[0]}} & 4'b1001 |
{4{Iact_E[1]}} & 4'b1010);

endmodule
