`include "dec.v"
`include "psq.v"
`include "btb.v"
`include "btb_mem.v"
`include "rtb_mem.v"
`include "eu.v"
`include "dag.v"






`include "x_def.v"


module CORE (/* ------------ Inputs ----------*/
DSPCLK, X_PWDn, X_IRQ2n, X_IRQL1n,
X_IRQL0n, X_IRQE1n, X_IRQE0n, X_IRQ1n,
X_IRQ0n, T_IST0, T_ISR0, T_IST1, T_ISR1,
T_ITMR, X_BRn, eRDY, EXTC_Eg, LDaST_Eg,
DwriteI_Eg, PwriteI_Eg, STI_Cg,
RSTtext_h, Awake, enTRAP_RL, STBY, PWRDn,
T_RST, GO_Fx, GO_Ex, GO_Cx, HALT_Eg,
IRR, IDR, Upd_IR, SPC,
SBP_EN, GOICE_syn, enTYP3,
TB_EN, SP1_EN, BIASRND,
T0Sreqx, R0Sreqx, T0sack, R0sack,
T1Sreqx, R1Sreqx, T1sack, R1sack,
STEAL, SREQ,
BOOT, DSreqx, DCTL,
T1IREG, T1MREG, R1IREG,
R1MREG, T0IREG, T0MREG,
R0IREG, R0MREG, PDFORCE,
CM_rd,
BIAD, /*BRST*/ BSreqx,
T_BDMA, BPM_cyc, BDM_cyc, BM_cyc,
`ifdef FD_DFT
SCAN_TEST,
`endif


GO_F, GO_E, GO_C, ICE_ST_h, ICE_ST, DRA,
EXA, HALTclr_h, GOICEclr_h,
GOICEdis, PPclr_h, BGn, MSTAT5, redoM_h,
redoSTI_h, redoLD_h, redoIF_h,
IR, Dummy_R, Dummy_E, nNOP_Eg, MTIDR_Eg,
SBP_R, Pread_R, Pwrite_R, Dread_R, Dwrite_R,
IOcmd_R, IOread_R, IOwrite_R, IDLE_R, EX_en,
CMAin,
IREo, GO_EC, ECYC, Double_E, PMOVL,
DMOVL,
MFSPT_E, MFRX0_E, MFTX0_E, MFRX1_E, MFTX1_E,
MTRX0_E, MTTX0_E, MTRX1_E, MTTX1_E,
DMA_R, DMA, DMAin,
PMA_R, PMA, PMAin,
T0wrap, T1wrap, R0wrap, R1wrap,
TRAP_R, TRAP_R_L, IDLE_ST_h, IDLE_ST,
accCM_R, accCM_E, wrCM_R, /*wrCM_E,*/ rdCM_E,


DMDix, DMDid, PMDin,
psqDMD_do, dagDMD_do,
euDMD_do, euPMD_do);

input [13:0] BIAD;
input BSreqx,
BPM_cyc,
BDM_cyc,
BM_cyc,

T_BDMA;

input [15:0] DMDix,
DMDid;

input [14:0] DCTL;
input BOOT,
RSTtext_h,
PWRDn,
STBY,
Awake,
enTRAP_RL,
STEAL,
SREQ,
DSreqx,
T0Sreqx,
R0Sreqx,
T1Sreqx,
R1Sreqx,
PDFORCE,
GOICE_syn,
enTYP3;

input T_RST, DSPCLK, X_PWDn, X_IRQ2n,
X_IRQL1n, X_IRQL0n, X_IRQE1n, X_IRQE0n,
X_IRQ1n, X_IRQ0n, T_IST0, T_ISR0,
T_IST1, T_ISR1, T_ITMR;
input DwriteI_Eg, PwriteI_Eg, STI_Cg,
LDaST_Eg;
input TB_EN, SP1_EN, BIASRND, X_BRn, eRDY, EXTC_Eg;
input GO_Fx, GO_Ex, GO_Cx, HALT_Eg, Upd_IR, SBP_EN;
input T0sack, R0sack, T1sack, R1sack;
input [23:0] CM_rd, SPC;
input [13:0] IRR;
input [15:0] IDR;
input [2:0] T1IREG;
input [1:0] T1MREG;
input [2:0] R1IREG;
input [1:0] R1MREG;
input [2:0] T0IREG;
input [1:0] T0MREG;
input [2:0] R0IREG;
input [1:0] R0MREG;
`ifdef FD_DFT
input SCAN_TEST;
`endif

output [15:0] psqDMD_do,
dagDMD_do,
euDMD_do,
euPMD_do;
output [7:0] PMOVL;
output [3:0] DMOVL;
output [14:0] IREo;
output TRAP_R,
TRAP_R_L,
IDLE_ST_h,
IDLE_ST,
GO_EC,
ECYC,
rdCM_E,
wrCM_R, /*wrCM_E,*/
accCM_R, accCM_E,
IOcmd_R,
IOread_R,
IOwrite_R,
Double_E,

redoIF_h,
redoSTI_h,
redoLD_h,
redoM_h;

output MFSPT_E, MFRX0_E, MFTX0_E, MFRX1_E,
MFTX1_E, MTRX0_E, MTTX0_E, MTRX1_E,
MTTX1_E;
output GO_F, GO_E, GO_C, ICE_ST_h, ICE_ST;
output HALTclr_h, GOICEclr_h;
output GOICEdis, PPclr_h, BGn;
output Dummy_R, Dummy_E, nNOP_Eg, MTIDR_Eg,
SBP_R;
output Pread_R, Pwrite_R, Dread_R, Dwrite_R;
output IDLE_R, EX_en;
output T0wrap, T1wrap, R0wrap, R1wrap;
output [13:0] CMAin, DRA, EXA;
output [23:0] IR;
output [13:0] DMA_R, PMA_R;
output [13:0] DMA, PMA;
output [13:0] DMAin, PMAin;
output MSTAT5;

input [15:0] PMDin;

/*-------------------------------------------*/





wire PPclr_h, GO_E, GO_C, Prderr_Eg, TRAP_Eg;
wire EXIT_E, MFIDR_E, HALT_Eg;
wire Ctrue, EX_en, EX_enc, Dummy_E, DU_R, dBR_R;
wire idBR_R, RET_R;


wire MACdep_Eg;
wire MFPSQ_E, MFIMASK_E;
wire MFICNTL_E, MFSSTAT_E, MFCNTR_E;
wire Ttrue, GO_F, GO_D;
wire CE, VpopST_Eg, cdAM_E, DIVQ_E, MFMSTAT;
wire DIVS_E, MTAR_E, MTAX0_E, MTAX1_E, MTAY0_E;
wire MTAY1_E, Rbyp_Rg, Xbyp_Rg, MFAR_E, MFAX0_E;
wire MFAX1_E, MFAY0_E, MFAY1_E, MFASTAT_E;
wire MFMX0_E, MFMX1_E, MFMY0_E, MFMY1_E, MFMR0_E, MFMR1_E;

wire MFMR2_E, MTASTAT_E, MTSI_E, MTSB_E;
wire MTSE_E, MTSR0_E, MTSR1_E, MFSI_E, MFSB_E, MFSE_E;
wire MFSR1_E, MFSR0_E, imSHT_E, MFDAG1_E, Post1_E;

wire accPM_E, Post2_E, MFDAG2_E;
wire Double_R, DAG1D_R, DAG2D_R, imAddr_R;
wire [7:0] MTIreg_E, MTLreg_E, MTMreg_E;
wire [7:0] MFIreg_E, MFLreg_E, MFMreg_E;
wire [19:0] IRE;
wire [7:0] ASTAT;
wire [6:0] MSTAT;
wire [13:0] IFA, Taddr_E;

wire [7:0] popASTATo;
wire [3:0] Term;



wire Squ_Rx, GO_MAC;
wire imm16_E, imm14_E;
wire [4:0] BTB_wa;
wire [25:0] BTB_wd, BTB_rd;
wire [11:0] RTB_wd, RTB_rd;
wire [13:0] Bt_I;
wire DAG1_EN, DAG2_EN;
wire [4:0] IFA_nx, BTB_ra;
wire [13:0] DMA, DMAin;
wire [13:0] PMA, PMAin;


assign #`d0 MSTAT5 = MSTAT[5];
assign #`d0 IREo[14:0] = IRE[14:0];
assign #`d0 Bt_I[13:0] = BTB_rd[15:2];
assign #`d0 RTB_wd[11:0] = {BTB_wd[25:16], BTB_wd[1:0]};

DEC c_dec (/* ---------- Inputs ---------- */
T_RST, DSPCLK, CM_rd[23:0],
`ifdef FD_DFT
SCAN_TEST,
`endif
PPclr_h, GO_D, GO_Ex, GO_Cx, Prderr_Eg,
/*TRAP_Eg,*/ ICE_ST, redoSTI_h,
ASTAT, Ctrue,
Upd_IR, SPC[23:0], SBP_EN, /*HALT_Eg,*/ enTYP3,


IR[23:0], IRE[19:0], EX_en, EX_enc, Dummy_E,
Dummy_R, DU_R, dBR_R, idBR_R, RET_R, RTS_R,
EXIT_E, DU_Eg, Call_Ed, RTI_Ed, RTS_Ed, BR_Ed,
RET_Ed, Nseq_Ed, IDLE_Eg, MACdep_Eg, MTCNTR_Eg,
MTOWRCNTR_Eg, MTtoppcs_Eg, MTIMASK_Eg, MTICNTL_Eg,
MTIFC_Eg, MTMSTAT_Eg, MFPSQ_E, MFtoppcs_Eg,
MFIMASK_E, MFICNTL_E, MFSSTAT_E, MFMSTAT_E,
MFCNTR_E, Stkctl_Eg, Modctl_Eg, MpopLP_Eg,
imm16_E,imm14_E, Long_Eg, Nrti_Ed,
ALUop_E, cdAM_E, MTAX0_E, MTAX1_E, MTAY0_E,
MTAY1_E, MTAR_E, MTASTAT_E, MFAX0_E, MFAX1_E,
MFAY0_E, MFAY1_E, MFAR_E, MFASTAT_E, MFALU_E,
pMFALU_E, DIVQ_E, DIVS_E, updAR_E, updAF_E,
ALUop_R, type9, DIVQ_R, DIVS_R,
MACop_E, satMR_Eg, Rbyp_Rg, Xbyp_Rg, Ybyp_Rg,
MTMX0_Eg, MTMX1_Eg, MTMY0_Eg, MTMY1_Eg, MTMR0_Eg,
MTMR1_Eg, MTMR2_Eg, MFMX0_E, MFMX1_E, MFMY0_E,
MFMY1_E, MFMR0_E, MFMR1_E, MFMR2_E, MFMAC_E,
pMFMAC_E, updMR_E, updMF_E, Squ_Rx,
MACop_R,
SHTop_E, imSHT_E, MTSI_E, MTSE_E, MTSR0_E,
MTSR1_E, MTSB_E, MFSI_E, MFSE_E, MFSR0_E, MFSR1_E,
MFSB_E, MFSHT_E, pMFSHT_E, updSR0_Eg, updSR1_Eg,
updSR_E,
MTIreg_E[7:0], MTLreg_E[7:0], MTMreg_E[7:0],
MFIreg_E[7:0], MFLreg_E[7:0], MFMreg_E[7:0],
MFDAG1_E, MFDAG2_E, accPM_E, Double_R, Double_E,
Post1_E, Post2_E, DAG1D_R, DAG2D_R, imAddr_R,
DAG1_EN, DAG2_EN, DAG2P_R, DMAen_R,
Pread_R, Pwrite_R, Dread_R, Dwrite_R, IOcmd_R,
IOread_R, IOwrite_R, IDLE_R, MTPMOVL_E, MTDMOVL_E,
MFPMOVL_E, MFDMOVL_E,
MFSPT_E, MFRX0_E, MFTX0_E, MFRX1_E, MFTX1_E, MTRX0_E,
MTTX0_E, MTRX1_E, MTTX1_E,
SBP_R, MFIDR_E, MTIDR_Eg, nNOP_Eg, accCM_R, accCM_E,
wrCM_R, /*wrCM_E,*/ rdCM_E
);


PSQ c_psq (/* ------------ Inputs : ------------- */
T_RST, DSPCLK, X_PWDn, X_IRQ2n, X_IRQL1n,
X_IRQL0n, X_IRQE1n, X_IRQE0n, X_IRQ1n, X_IRQ0n,
T_IST0, T_ISR0, T_IST1, T_ISR1, T_ITMR, IR[17:4],
DMDix[15:0],
RSTtext_h, Awake, enTRAP_RL, STBY,
IRE[19:0], EX_en, Dummy_R, dBR_R, idBR_R, RET_R,
DU_Eg, Call_Ed, RTI_Ed, BR_Ed, EXIT_E, RET_Ed,
Nseq_Ed, IDLE_Eg, MACdep_Eg, LDaST_Eg, MTCNTR_Eg,
MTOWRCNTR_Eg, MTtoppcs_Eg, MTIMASK_Eg, MTICNTL_Eg,
MTIFC_Eg, MTMSTAT_Eg, MFPSQ_E, MFtoppcs_Eg,
MFIMASK_E, MFICNTL_E, MFSSTAT_E, MFMSTAT_E,
MFCNTR_E, Stkctl_Eg, Modctl_Eg, MpopLP_Eg, imm16_E,
imm14_E, MFIDR_E, Long_Eg, Nrti_Ed, MTPMOVL_E,
MTDMOVL_E, MFPMOVL_E, MFDMOVL_E, accCM_R, accCM_E,
Bt_I[13:0], BTaken_I, RTaken_I, PTaken_R, PTaken_E,
PMA_R[13:0],
Ctrue, Ttrue, ASTAT[7:0],
SP1_EN, X_BRn, eRDY, EXTC_Eg, STI_Cg,
BOOT, STEAL, SREQ, DCTL[13:0], DSreqx,
GO_Fx, GO_Ex, GO_Cx, IRR[13:0], IDR[15:0], HALT_Eg,
GOICE_syn,
PDFORCE,
BIAD[13:0], /*BRST,*/ T_BDMA, BSreqx,
`ifdef FD_DFT
SCAN_TEST,
`endif


GO_F, GO_D, GO_E, GO_C, PPclr_h, MSTAT[6:0],
ICE_ST_h, ICE_ST, IDLE_ST_h, IDLE_ST, TRAP_Eg,
redoM_h, redoSTI_h, redoLD_h, redoEX_h, TRAP_R,
TRAP_R_L, Prderr_Eg,
Bterr_E, Taddr_E[13:0], IFA_nx[4:0],
CE, VpopST_Eg, popASTATo[7:0], Term[3:0], GO_MAC,
BGn, IFA[13:0],
PMOVL[7:0], DMOVL[3:0], redoIF_h,
GO_EC, ECYC,
CMAin[13:0],
HALTclr_h, GOICEclr_h, GOICEdis,
DRA[13:0], EXA[13:0],



psqDMD_do[15:0]);


BTB c_btb (/* ------------ Inputs : ------------- */
/*T_RST,*/ DSPCLK,
PPclr_h, GO_F, GO_D, GO_Ex, GO_Cx, IFA_nx[4:0],
IFA[13:0], EXA[13:0], Bterr_E, Taddr_E[13:0],
RTS_R, RTS_Ed, BR_Ed,
Ctrue,
TB_EN,
BTB_rd[25:0],
RTB_rd[11:0],
`ifdef FD_DFT
SCAN_TEST,
`endif


BTB_ra[4:0], BTB_wa[4:0], BTB_wd[25:0], BTB_web,
/*RTB_wd[11:0],*/ RTB_web,
BTaken_I, RTaken_I, PTaken_R, PTaken_E);


BTBmem ds32x26 (DSPCLK, BTB_wa[4:0], BTB_web, PWRDn, BTB_wd[25:0],
BTB_ra[4:0], BTB_rd[25:0]
`ifdef FD_DFT
,SCAN_TEST);
`else
);
`endif

RTBmem ds32x12 (DSPCLK, BTB_wa[4:0], RTB_web, PWRDn, RTB_wd[11:0],
BTB_ra[4:0], RTB_rd[11:0]
`ifdef FD_DFT
, SCAN_TEST);
`else
);
`endif

EU eu(/*--------------- Inputs ---------------*/
DSPCLK, T_RST, GO_Ex, GO_Cx, EX_en, EX_enc,
cdAM_E, DIVQ_E, DIVS_E, Double_E,
MTAR_E, MTAX0_E, MTAX1_E, MTAY0_E, MTAY1_E, Rbyp_Rg,
MFAR_E, MFAX0_E, MFAX1_E, MFAY0_E, MFAY1_E, MFASTAT_E,
MTMX0_Eg, MTMX1_Eg, MTMY0_Eg, MTMY1_Eg, MTMR0_Eg,
MTMR1_Eg, MTMR2_Eg, MFMX0_E, MFMX1_E, MFMY0_E, MFMY1_E,
MFMR0_E, MFMR1_E, MFMR2_E, Ybyp_Rg, MTASTAT_E,
MTSI_E, MTSB_E, MTSE_E,
MTSR0_E, MTSR1_E, MFSI_E, MFSB_E, MFSE_E, MFSR1_E,
MFSR0_E, imSHT_E, Xbyp_Rg, MFALU_E, MFMAC_E, MFSHT_E,
pMFALU_E, pMFMAC_E, pMFSHT_E, accPM_E, Squ_Rx, GO_MAC,
updSR0_Eg, updSR1_Eg, SHTop_E, satMR_Eg, MACop_E, updMF_E,
updMR_E, ALUop_E, updAR_E, updAF_E, ALUop_R, type9,
updSR_E, MACop_R, DIVQ_R, DIVS_R,

IR[17:0], IRE[14:0],






Term[3:0],
MSTAT, CE,
VpopST_Eg, popASTATo[7:0], RSTtext_h,
BIASRND,
`ifdef FD_DFT
SCAN_TEST,
`endif



ASTAT[7:0], Ctrue, Ttrue,


DMDid[15:0], euDMD_do[15:0], PMDin[15:0], euPMD_do[15:0]);

DAG dag(/* ----------------- Inputs ------------------*/
DSPCLK, T_RST, GO_Ex, GO_Cx, EX_en, STBY,
MTIreg_E[7:0], MTLreg_E[7:0], MTMreg_E[7:0],
MFIreg_E[7:0], MFLreg_E[7:0], MFMreg_E[7:0],
MFDAG1_E, Post1_E, imAddr_R, DAG1D_R, DAG2D_R,
DAG1_EN, Double_R, idBR_R, Post2_E, MFDAG2_E,
DAG2_EN, DAG2P_R, DMAen_R,
IRE[3:0], IR[17:0],
MSTAT, redoSTI_h, redoEX_h, PwriteI_Eg, DwriteI_Eg,
accPM_E, redoM_h,
STEAL, T0Sreqx, T1Sreqx, R0Sreqx, R1Sreqx,
SREQ, T0sack, T1sack, R0sack, R1sack,
R0IREG[2:0], R1IREG[2:0], T0IREG[2:0], T1IREG[2:0],
R0MREG[1:0], R1MREG[1:0], T0MREG[1:0], T1MREG[1:0],
DSreqx, BOOT, DCTL[14:0],
DMDid[15:0],
BSreqx, BPM_cyc, BDM_cyc, BIAD[13:0], BM_cyc,
ECYC,
`ifdef FD_DFT
SCAN_TEST,
`endif


T0wrap, T1wrap, R0wrap, R1wrap,
DMA_R[13:0], DMA[13:0], PMA_R[13:0], PMA[13:0],
DMAin[13:0], PMAin[13:0], dagDMD_do[15:0]);

endmodule
