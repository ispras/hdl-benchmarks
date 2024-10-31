






module DSP_CORE 
( 
T_RSTn, 
T_ICE_RSTn, 
T_BMODE, 
T_MMAP, 
T_TMODE, 
T_CLKI_PLL, 
T_CLKI_OSC, 
T_Sel_PLL, 
`ifdef FD_FPGA 
`else 
DSPCLK_insert_buf_i, 
`endif 
T_ED, 
T_EA, 
T_PWDn, 
T_IRQ2n, 
T_IRQ1n, 
T_IRQ0n, 
T_IRQL1n, 
T_IRQE1n, 
T_IRQE0n, 
T_BRn, 
T_RD0, 
T_RD1, 
T_SCLK0, 
T_SCLK1, 
T_RFS0, 
T_TFS0, 
T_RFS1, 
T_TFS1, 
T_IRDn, 
T_IWRn, 
T_ISn, 
T_IAL, 
T_IAD, 
T_PIOin, 
T_ICK, 
T_IMS, 
T_ID, 
T_GOICE, 
PM_bdry_sel, 
PM_rd0, 
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
CM_rdm, 
CM_rd0, 
CM_rd1, 
CM_rd2, 
CM_rd3, 
CM_rd4, 
CM_rd5, 
CM_rd6, 
CM_rd7, 
`ifdef FD_DFT 

SCANIN1, 
SCANIN2, 
SCANIN3, 
SCANIN4, 
SCANIN5, 
SCANIN6, 
SCANIN7, 
SCANIN8, 
SCAN_TEST, 
SCAN_ENABLE, 
`endif 

DSPCLK_cm0, 
DSPCLK_cm1, 
DSPCLK_cm2, 
DSPCLK_pm0, 
DSPCLK_pm1, 
DSPCLK_pm2, 
DSPCLK_dm0, 
DSPCLK_dm1, 
DSPCLK_dm2, 
CLKO, 
PWDACK, 
XTALoffn, 
`ifdef FD_FPGA 
`else 
DSPCLK_insert_buf_o, 
`endif 
BGn, 
EA_oe, 
EA_do, 
PMSn, 
DMSn, 
BMSn, 
IOSn, 
CMSn, 
RDn, 
WRn, 
ED_oe_15, 
ED_oe_14_8, 
ED_oe_7_0, 
ED_do, 
ECMSn, 
ECMA_EN, 
TD0, 
TD1, 
SCLK0, 
ISCLK0, 
SCLK1, 
ISCLK1, 
RFS0, 
IRFS0, 
TFS0, 
ITFS0, 
RFS1, 
IRFS1, 
TFS1, 
ITFS1, 
IACKn, 
IAD_oe, 
IAD_do, 
PIO_oe, 
PIO_out, 
IDo, 
IDoe, 
PMo_cs0, 
PMo_cs1, 
PMo_cs2, 
PMo_cs3, 
PMo_cs4, 
PMo_cs5, 
PMo_cs6, 
PMo_cs7, 
PMo_web, 
PMo_oe0, 
PMo_oe1, 
PMo_oe2, 
PMo_oe3, 
PMo_oe4, 
PMo_oe5, 
PMo_oe6, 
PMo_oe7, 
PM_wd, 
PMAinx, 
DM_cs, 
DMo_cs0, 
DMo_cs1, 
DMo_cs2, 
DMo_cs3, 
DMo_cs4, 
DMo_cs5, 
DMo_cs6, 
DMo_cs7, 
DMo_web, 
DM_oe, 
DMo_oe0, 
DMo_oe1, 
DMo_oe2, 
DMo_oe3, 
DMo_oe4, 
DMo_oe5, 
DMo_oe6, 
DMo_oe7, 
DM_wd, 
DMAinx, 
CM_cs, 
CMo_cs0, 
CMo_cs1, 
CMo_cs2, 
CMo_cs3, 
CMo_cs4, 
CMo_cs5, 
CMo_cs6, 
CMo_cs7, 
CM_web, 
CM_oe, 
CMo_oe0, 
CMo_oe1, 
CMo_oe2, 
CMo_oe3, 
CMo_oe4, 
CMo_oe5, 
CMo_oe6, 
CMo_oe7, 
CM_wd, 
CMAinx 
`ifdef FD_DFT 
, 
SCANOUT1, 
SCANOUT2, 
SCANOUT3, 
SCANOUT4, 
SCANOUT5, 
SCANOUT6, 
SCANOUT7, 
SCANOUT8 
`endif 
); 


input T_RSTn, 
T_ICE_RSTn, 
T_BMODE, 
T_MMAP, 
T_CLKI_PLL, 
T_CLKI_OSC, 
T_Sel_PLL, 
T_GOICE; 
`ifdef FD_FPGA 
`else 
input DSPCLK_insert_buf_i; 
`endif 

input [1:0] T_TMODE; 
input [15:0] T_ED; 
input [7:0] T_EA; 
input PM_bdry_sel, 
T_PWDn, 
T_BRn, 
T_IRQ2n, 
T_IRQ1n, 
T_IRQ0n, 
T_IRQL1n, 
T_IRQE1n, 
T_IRQE0n, 
T_RD0, 
T_RD1, 
T_SCLK0, 
T_SCLK1, 
T_RFS0, 
T_TFS0, 
T_RFS1, 
T_TFS1, 
T_IRDn, 
T_IWRn, 
T_ISn, 
T_IAL; 

input [15:0] T_IAD; 
input [11:0] T_PIOin; 
input T_ICK, 
T_IMS, 
T_ID; 

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
DM_rd7; 

input [23:0] CM_rdm, 
CM_rd0, 
CM_rd1, 
CM_rd2, 
CM_rd3, 
CM_rd4, 
CM_rd5, 
CM_rd6, 
CM_rd7; 


`ifdef FD_DFT 
input 
SCANIN1, 
SCANIN2, 
SCANIN3, 
SCANIN4, 
SCANIN5, 
SCANIN6, 
SCANIN7, 
SCANIN8, 
SCAN_TEST, 
SCAN_ENABLE; 
`endif 

output DSPCLK_cm0, 
DSPCLK_cm1, 
DSPCLK_cm2, 
DSPCLK_pm0, 
DSPCLK_pm1, 
DSPCLK_pm2, 
DSPCLK_dm0, 
DSPCLK_dm1, 
DSPCLK_dm2, 
CLKO, 
XTALoffn, 
PWDACK, 
BGn, 
EA_oe, 
PMSn, 
DMSn, 
IOSn, 
CMSn, 
BMSn, 
RDn, 
WRn, 
ED_oe_15, 
ED_oe_14_8, 
ED_oe_7_0, 
ECMSn, 
ECMA_EN; 
output [15:0] ED_do; 
output [14:0] EA_do; 

`ifdef FD_FPGA 
`else 
output DSPCLK_insert_buf_o; 
`endif 

output TD0, 
TD1, 
SCLK0, 
ISCLK0, 
SCLK1, 
ISCLK1, 
RFS0, 
IRFS0, 
TFS0, 
ITFS0, 
RFS1, 
IRFS1, 
TFS1, 
ITFS1; 

output IACKn, 
IAD_oe; 
output [15:0] IAD_do; 
output [11:0] PIO_oe, 
PIO_out; 
output IDo, 
IDoe; 
output 
PMo_cs0, 
PMo_cs1, 
PMo_cs2, 
PMo_cs3, 
PMo_cs4, 
PMo_cs5, 
PMo_cs6, 
PMo_cs7, 
PMo_web, 
PMo_oe0, 
PMo_oe1, 
PMo_oe2, 
PMo_oe3, 
PMo_oe4, 
PMo_oe5, 
PMo_oe6, 
PMo_oe7, 
DM_cs, 
DMo_cs0, 
DMo_cs1, 
DMo_cs2, 
DMo_cs3, 
DMo_cs4, 
DMo_cs5, 
DMo_cs6, 
DMo_cs7, 
DMo_web, 
DM_oe, 
DMo_oe0, 
DMo_oe1, 
DMo_oe2, 
DMo_oe3, 
DMo_oe4, 
DMo_oe5, 
DMo_oe6, 
DMo_oe7, 
CM_cs, 
CMo_cs0, 
CMo_cs1, 
CMo_cs2, 
CMo_cs3, 
CMo_cs4, 
CMo_cs5, 
CMo_cs6, 
CMo_cs7, 
CM_web, 
CM_oe, 
CMo_oe0, 
CMo_oe1, 
CMo_oe2, 
CMo_oe3, 
CMo_oe4, 
CMo_oe5, 
CMo_oe6, 
CMo_oe7; 

output [15:0] PM_wd, 
DM_wd; 
output [13:0] PMAinx, 
DMAinx, 
CMAinx; 
output [23:0] CM_wd; 

`ifdef FD_DFT 
output 
SCANOUT1, 
SCANOUT2, 
SCANOUT3, 
SCANOUT4, 
SCANOUT5, 
SCANOUT6, 
SCANOUT7, 
SCANOUT8; 
`endif 


wire [23:0] CM_wd; 
wire [15:0] PM_wd, DM_wd; 

wire [7:0] PMOVL_dsp; 
wire [3:0] DMOVL_dsp, PMOVL, DMOVL; 
wire [23:0] IR; 
wire [13:0] DRA, EXA, CMAin, CMAinx; 
wire [13:0] IRR; 
wire [15:0] RX0, RX1, TX0, TX1; 
wire [13:0] DMA_R, PMA_R; 
wire [13:0] DMA, PMA; 
wire [13:0] DMAin, PMAin, DMAinx, PMAinx; 
wire [14:0] EA_do; 
wire [11:0] DOVL; 
wire [14:0] DCTL, WSCR; 
wire [15:0] CKR, SPT0_do, SPT1_do, PIO_do, TMR_do, 
emcDMD_do, emcPMD_do, idmaPMD_do, SICEmmio, 
autoDMD_do, T_ED, ED_do, T_IAD, IAD_do; 
wire [7:0] T_EA, WSCR_ext; 
wire [23:0] SPC, IDR; 
wire [2:0] T0IREG, R0IREG, T1IREG, R1IREG; 
wire [1:0] T0MREG, R0MREG, T1MREG, R1MREG, ECMAWAIT; 
wire [2:0] DWWAIT, DRWAIT; 
wire [3:0] ECMWAIT; 
wire [11:0] T_PIOin, PIO_out, PIO_oe; 
wire T_IPIOn, DSPCLK, TB_EN, SP0_EN, SP1_EN, 
XTALoffn, BIASRND; 
wire [15:0] psqDMD_do, dagDMD_do, euDMD_do, 
euPMD_do; 
wire [23:0] BRdataBUF; 
wire [15:0] BDMAmmio; 
wire [13:0] BIAD, BEAD; 
wire [7:0] BMpage, BWdataBUF; 
wire [11:0] BOVL; 

wire [23:0] CM_rd, CM_rdata; 
wire [15:0] PM_rd0, PM_rd1, DM_rd0, 
DM_rd1, PMDin, DMDin; 
wire [14:0] IREo; 
wire [10:0] IOaddr = IREo[14:4]; 

wire [15:0] SYSRo = {ECMAWAIT[1:0], TB_EN, SP0_EN, SP1_EN, BIASRND, 
DWWAIT[2:0], DRWAIT[2:0], ECMWAIT[3:0]}; 

wire T_IRQL0n = T_IPIOn; 

wire CM_oe = 1'b1; 
wire CMo_oe0 = 1'b1; 
wire CMo_oe1 = 1'b1; 
wire CMo_oe2 = 1'b1; 
wire CMo_oe3 = 1'b1; 
wire CMo_oe4 = 1'b1; 
wire CMo_oe5 = 1'b1; 
wire CMo_oe6 = 1'b1; 
wire CMo_oe7 = 1'b1; 

wire DM_oe = 1'b1; 
wire DMo_oe0 = 1'b1; 
wire DMo_oe1 = 1'b1; 
wire DMo_oe2 = 1'b1; 
wire DMo_oe3 = 1'b1; 
wire DMo_oe4 = 1'b1; 
wire DMo_oe5 = 1'b1; 
wire DMo_oe6 = 1'b1; 
wire DMo_oe7 = 1'b1; 

wire PMo_oe0 = 1'b1; 
wire PMo_oe1 = 1'b1; 
wire PMo_oe2 = 1'b1; 
wire PMo_oe3 = 1'b1; 
wire PMo_oe4 = 1'b1; 
wire PMo_oe5 = 1'b1; 
wire PMo_oe6 = 1'b1; 
wire PMo_oe7 = 1'b1; 




Glogic glog (/* input */ 
T_RSTn, 
T_ICE_RSTn, 
T_CLKI_PLL, 
T_CLKI_OSC, 
T_Sel_PLL, 
XTALoffn, 
ED_oe, 
BMcs, 
BDIR, 
T_TMODE[1:0], 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 

P_RSTn, 
T_CLKI, 
T_selECM, 
TMODE, 
ED_oe_15, 
ED_oe_14_8, 
ED_oe_7_0); 

CLKC clkc (/* -------- Inputs : --------- */ 
P_RSTn, GRST, T_CLKI, T_PWDn, TMODE, 
DMDin[15:0], 
IDLE_ST_h, IDLE_ST, IREo[3:0], GOICE, 
ICE_wakeup, TRAP_R, TRAP_R_L, 
CKR_we, MMR_web, TB_EN, 
XTALDIS, XTALDELAY, PUCR, 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 


RSTtext_h, 
`ifdef FD_EVB 
CORECLK, PERICLK, 
`else 
DSPCLK, 
`endif 
DSPCLK_cm0, DSPCLK_cm1, DSPCLK_cm2, 
DSPCLK_pm0, DSPCLK_pm1, DSPCLK_pm2, 
DSPCLK_dm0, DSPCLK_dm1, DSPCLK_dm2, 
PWDACK, CLKO, 
Awake_h, Awake, enTRAP_RL, STBY, PWRDn, 
XTALoffn, 
CKR[15:0]); 


CORE core (/* ------------ Inputs ----------*/ 

`ifdef FD_EVB 
CORECLK, 
`else 
DSPCLK, 
`endif 

T_PWDn, T_IRQ2n, T_IRQL1n, 
T_IRQL0n, T_IRQE1n, T_IRQE0n, T_IRQ1n, 
T_IRQ0n, T_IST0, T_ISR0, T_IST1, T_ISR1, 
T_ITMR, T_BRn, eRDY, EXTC_Eg, LDaST_Eg, 
DwriteI_Eg, PwriteI_Eg, STI_Cg, 
RSTtext_h, Awake, enTRAP_RL, STBY, PWRDn, 
GRST, GO_Fx, GO_Ex, GO_Cx, HALT_Eg, 
IRR[13:0], IDR[15:0], Upd_IR, SPC[23:0], 
SBP_EN, GOICE_syn, enTYP3, 
TB_EN, SP1_EN, BIASRND, 
T0Sreqx, R0Sreqx, T0Sack, R0Sack, 
T1Sreqx, R1Sreqx, T1Sack, R1Sack, 
STEAL, SREQ, 
BOOT, DSreqx, DCTL[14:0], 
T1IREG[2:0], T1MREG[1:0], R1IREG[2:0], 
R1MREG[1:0], T0IREG[2:0], T0MREG[1:0], 
R0IREG[2:0], R0MREG[1:0], PDFORCE, 
CM_rdata[23:0], 
BIAD[13:0], /*BRST,*/ BSreqx, 
T_BDMA, BPM_cyc, BDM_cyc, BM_cyc, 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 


GO_F, GO_E, GO_C, ICE_ST_h, ICE_ST, DRA[13:0], 
EXA[13:0], HALTclr_h, GOICEclr_h, 
GOICEdis, PPclr_h, BGn, MSTAT5, redoM_h, 
redoSTI_h, redoLD_h, redoIF_h, 
IR[23:0], Dummy_R, Dummy_E, nNOP_Eg, MTIDR_Eg, 
SBP_R, Pread_R, Pwrite_R, Dread_R, Dwrite_R, 
IOcmd_R, IOread_R, IOwrite_R, IDLE_R, EX_en, 
CMAin[13:0], 
IREo[14:0], GO_EC, ECYC, Double_E, PMOVL_dsp[7:0], 
DMOVL_dsp[3:0], 
MFSPT_E, MFRX0_E, MFTX0_E, MFRX1_E, MFTX1_E, 
MTRX0_E, MTTX0_E, MTRX1_E, MTTX1_E, 
DMA_R[13:0], DMA[13:0], DMAin[13:0], 
PMA_R[13:0], PMA[13:0], PMAin[13:0], 
T0wrap, T1wrap, R0wrap, R1wrap, 
TRAP_R, TRAP_R_L, IDLE_ST_h, IDLE_ST, 
accCM_R, accCM_E, wrCM_R, /*wrCM_E,*/ rdCM_E, 


DMDin[15:0], DMDin[15:0], PMDin[15:0], 
psqDMD_do[15:0], dagDMD_do[15:0], 
euDMD_do[15:0], euPMD_do[15:0]); 



MEMC memc (/* ------------ Inputs : ------------- */ 

`ifdef FD_EVB 
PERICLK, 
`else 
DSPCLK, 
`endif 
GRST, STBY, DMDin[15:0], 
PPclr_h, GO_Ex, GO_Cx, 
redoM_h, redoSTI_h, redoLD_h, IDLE_ST, 
DMOVL_dsp[3:0], PMOVL_dsp[7:4], 
Pread_R, Pwrite_R, Dread_R, Dwrite_R, 
IOcmd_R, IOread_R, IOwrite_R, Dummy_R, 
Dummy_E, 
DMA_R[13:5], PMA_R[13:12], DMA[13:0], 
DMAin[13:5], PMAin[13:12], 
SREQ, STEAL, DMSreqx_wr, PMSreqx_wr, 
DMSreqx_rd, PMSreqx_rd, 
BOOT, PMOVL[3:0], DMOVL[3:0], 
DSreqx, DRDcyc, 
T_selECM, 
BM_cyc, ECYC, 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 
PM_bdry_sel, 


SP0_EN, selAUTO0, selFSDIV0, selSCLKDIV0, 
selSCTL0, selMWORD0, AUTO0_we, FSDIV0_we, 
SCLKDIV0_we, SCTL0_we, MWORD0_we, 
SP1_EN, selAUTO1, selFSDIV1, selSCLKDIV1, 
selSCTL1, selMWORD1, AUTO1_we, FSDIV1_we, 
SCLKDIV1_we, SCTL1_we, MWORD1_we, 
selPFTYPE, selPDATA, selPIMASK, selPINT, 
PFTYPE_we, PDATA_we, PIMASK_we, PINT_we, 
selTPERIOD, selTCOUNT, selTSCALE, 
TPERIOD_we, TCOUNT_we, TSCALE_we, 
Pread_Ei, Pwrite_Ei, Dread_Ei, Dwrite_Ei, 
IOcmd_Ei, IOread_Ei, IOwrite_Ei, WSCR_we, WSCR_ext_we, 
selWSCR, selWSCR_ext, EXTC_Eg, ECMWAIT[3:0], ECMAWAIT[1:0], 
selCKR, CKR_we, 
DWWAIT[2:0], DRWAIT[2:0], selDCTL, selDOVL, 
DCTL_we, DOVL_we, 
selSYSR, ldSREG_E, MMR_web, 
TB_EN, 
DwriteI_Eg, PwriteI_Eg, STI_Cg, LDaST_Eg, 
BIASRND, 
accPM_Eg, accDM_Eg, 
PMo_cs0, PMo_cs1, 
PMo_cs2, PMo_cs3, 
PMo_cs4, PMo_cs5, 
PMo_cs6, PMo_cs7, 
PMo_web, 
PMo_oe0_K, PMo_oe1_K, 
PMo_oe2_K, PMo_oe3_K, 
PMo_oe4_K, PMo_oe5_K, 
PMo_oe6_K, PMo_oe7_K, 
DM_cs, 
DMo_cs0, DMo_cs1, 
DMo_cs2, DMo_cs3, 
DMo_cs4, DMo_cs5, 
DMo_cs6, DMo_cs7, 
DMo_web, 
DM_oe_K, 
DMo_oe0_K, DMo_oe1_K, 
DMo_oe2_K, DMo_oe3_K, 
DMo_oe4_K, DMo_oe5_K, 
DMo_oe6_K, DMo_oe7_K, 
selBIAD, selBEAD, selBCTL, selBCNT, selBOVL, 
BCNT_we, BCTL_we, BOVL_we, BIAD_we, BEAD_we, 
selIVER 
); 



EMC emc (/* ------------ Inputs : ------------- */ 

`ifdef FD_EVB 
PERICLK, 
`else 
DSPCLK, 
`endif 

GRST, PPclr_h, DMDin[15:0], T_selECM, 
PM_bdry_sel, 
GO_Fx, GO_Ex, GO_EC, ECYC, BGn, PMOVL_dsp[7:0], 
DMOVL_dsp[3:0], Dummy_E, 
IOaddr[10:0], Double_E, accCM_E, rdCM_E, 
DMA[13:0], PMA[13:0], WSCR_we, WSCR_ext_we, EXTC_Eg, 
Pread_Ei, Pwrite_Ei, Dread_Ei, Dwrite_Ei, 
IOcmd_Ei, IOread_Ei, IOwrite_Ei, MMR_web, 
CMAin[13:0], ECMAWAIT[1:0], 
IDR[23:0], 
T_EA[7:0], T_ED[15:0], 
PMDin[15:0], 
CM_rd[23:0], 
BDMAmode, BMpage[7:0], 
BDIR, BWdataBUF[7:0], BWRn, BEAD[13:0], 
BSreq, BSack, BWend, 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 


EA_oe, EA_do[14:0], ED_oe, ED_do[15:0], 
PMSn, DMSn, IOSn, BMSn, 
CMSn, RDn, WRn, ECMSn, ECMA_EN, 
eRDY, 
WSCR[14:0], WSCR_ext[7:0], emcDMD_oe, emcDMD_do[15:0], 
emcPMD_oe, emcPMD_do[15:0], 
CM_rdata[23:0], 
ENS12, ECS12, ENS13, ECS13, ENS14, 
ECS14, ENS0, BMcs 
); 



IDMA idma (/* -------- Inputs : --------- */ 
T_IRDn, T_IWRn, T_ISn, T_IAL, T_BMODE, T_MMAP, 
T_selECM, PM_bdry_sel, 
STBY, Awake_h, 
P_RSTn, GRST, 
`ifdef FD_EVB 
PERICLK, 
`else 
DSPCLK, 
`endif 

GO_Fx, GO_Ex, IDLE_ST_h, 
ICE_ST_h, ICE_ST, DMDin[15:0], PMOVL_dsp[7:0], 
DMOVL_dsp[3:0], CMAin[13:12], redoIF_h, 
DWWAIT[2:0], DRWAIT[2:0], DCTL_we, DOVL_we, 
MMR_web, 
STEAL, DSack, DSreqx, 
IDR[23:0], accCM_R, accCM_E, wrCM_R, 
BDMA_end, BDMA_boot, BCMRD_cyc, 
BOVL[11:0], BRdataBUF[23:0], BCM_cyc, 
BSreqx, BM_cyc, ECYC, 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 


IACKn, 
BOOT, DCTL[14:0], DOVL[11:0], 
PMOVL[3:0], DMOVL[3:0], 
idmaDMD_oe, idmaPMD_oe, idmaPMD_do[15:0], 
DSreq, DWRcyc, PWRcyc, DRDcyc, PRDcyc, 
CM_cs, CM_web, CM_oe_K, 
CMo_cs0, CMo_cs1, CMo_cs2, CMo_cs3, CMo_cs4, 
CMo_cs5, CMo_cs6, CMo_cs7, 
CMo_oe0_K, CMo_oe1_K, CMo_oe2_K, CMo_oe3_K, 
CMo_oe4_K, CMo_oe5_K, CMo_oe6_K, CMo_oe7_K, 


T_IAD[15:0], IAD_do[15:0], IAD_oe, 
PMDin[15:0], CM_rd[23:0], CM_wd[23:0], 
GO_STEAL); 



SPORT0 sport0 (/* -------- Inputs : --------- */ 
T_RD0, 
GRST, 
`ifdef FD_EVB 
PERICLK, 
`else 
DSPCLK, 
`endif 
GO_Cx, EX_en, MTTX0_E, 
MTRX0_E, T0wrap, R0wrap, DMDin[15:0], 
SP0_EN, selAUTO0, selFSDIV0, selSCLKDIV0, 
selSCTL0, selMWORD0, AUTO0_we, FSDIV0_we, 
SCLKDIV0_we, SCTL0_we, MWORD0_we, MMR_web, 
T0Sack, R0Sack, 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 


TD0, 
T_ISR0, T_IST0, T0IREG[2:0], T0MREG[1:0], 
R0IREG[2:0], R0MREG[1:0], PDFORCE, 
XTALDIS, XTALDELAY, PUCR, 
T0Sreq, R0Sreq, RX0[15:0], TX0[15:0], 
SPT0_do[15:0], 


SCLK0, T_SCLK0, ISCLK0, 
RFS0, T_RFS0, IRFS0, 
TFS0, T_TFS0, ITFS0); 



SPORT1 sport1 (/* -------- Inputs : --------- */ 
T_RD1, 
GRST, 
`ifdef FD_EVB 
PERICLK, 
`else 
DSPCLK, 
`endif 
GO_Cx, EX_en, MTTX1_E, 
MTRX1_E, T1wrap, R1wrap, DMDin[15:0], 
SP1_EN, selAUTO1, selFSDIV1, selSCLKDIV1, 
selSCTL1, selMWORD1, AUTO1_we, FSDIV1_we, 
SCLKDIV1_we, SCTL1_we, MWORD1_we, MMR_web, 
T1Sack, R1Sack, 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 


TD1, 
T_ISR1, T_IST1, T1IREG[2:0], T1MREG[1:0], 
R1IREG[2:0], R1MREG[1:0], 
T1Sreq, R1Sreq, RX1[15:0], TX1[15:0], 
SPT1_do[15:0], 


SCLK1, T_SCLK1, ISCLK1, 
RFS1, T_RFS1, IRFS1, 
TFS1, T_TFS1, ITFS1); 



AUTOctl auctl (/* -------- Inputs : --------- */ 
GRST, 
`ifdef FD_EVB 
PERICLK, 
`else 
DSPCLK, 
`endif 
GO_E, MFRX0_E, 
MFTX0_E, MFRX1_E, MFTX1_E, MFSPT_E, 
ICE_ST, 
STBY, 

DSreq, DWRcyc, PWRcyc, /*CWRcyc,*/ 
DRDcyc, PRDcyc, /*CRDcyc,*/ BOOT, 
T0Sreq, R0Sreq, RX0[15:0], TX0[15:0], 
T1Sreq, R1Sreq, RX1[15:0], TX1[15:0], 
BSreq, BDMRD_cyc, BDMWR_cyc, BPMRD_cyc, 
BPMWR_cyc, BM_cyc, ECYC, 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 


STEAL, SREQ, 
DMSreqx_wr, PMSreqx_wr, /*CMSreqx_wr,*/ 
DMSreqx_rd, PMSreqx_rd, /*CMSreqx_rd,*/ 
DSack, DSreqx, 
T0Sreqx, R0Sreqx, T0Sack, R0Sack, 
T1Sreqx, R1Sreqx, T1Sack, R1Sack, 
spt0DMD_oe, spt1DMD_oe, 
BSack, BSreqx, 


autoDMD_do[15:0]); 

`ifdef FD_EVB 
BUFG ick(.O(T_ICKi), .I(T_ICK)); 
`endif 

SICE sice (/* ------------ Inputs : ------------- */ 
P_RSTn, 
`ifdef FD_EVB 
T_ICKi, 
`else 
T_ICK, 
`endif 
T_IMS, 
`ifdef FD_EVB 
CORECLK, 
`else 
DSPCLK, 
`endif 
CM_rdata[23:0], 
DMDin[15:0], T_GOICE, PM_bdry_sel, 
enTRAP_RL, 
GO_F, GO_E, GO_C, ICE_ST, DRA[13:0], 
EXA[13:0], HALTclr_h, 
GOICEclr_h, GOICEdis, 
PMOVL_dsp[7:0], DMOVL_dsp[3:0], 
IR[23:0], Dummy_R, nNOP_Eg, MTIDR_Eg, 
SBP_R, rdCM_E, 
BGn, PMA[13:0], DMA[13:0], EXTC_Eg, 
accPM_Eg, accDM_Eg, 
eRDY, 
BRST, IACKn, 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 


GRST, GO_Fx, GO_Ex, GO_Cx, HALT_Eg, 
IRR[13:0], IDR[23:0], GOICE, GOICE_syn, 
ICE_wakeup, 
Upd_IR, SPC[23:0], SBP_EN, enTYP3, 


T_ID, IDo, IDoe, 

EX_en, selIVER, 
SICEmmio[15:0] 
); 



PIO pio (/*------------- Input from IO Pads ------------*/ 
`ifdef FD_EVB 
PERICLK, 
`else 
DSPCLK, 
`endif 
GRST, DMDin[15:0], T_PIOin[11:0], 


selPIMASK, selPINT, selPFTYPE, selPDATA, 
PIMASK_we, PINT_we, PFTYPE_we, PDATA_we, 
MMR_web, 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 


T_IPIOn, PIO_do[15:0], PIO_oe[11:0], PIO_out[11:0]); 



TM tm(/*----------------- Inputs -------------------*/ 
T_CLKI, 
`ifdef FD_EVB 
PERICLK, 
`else 
DSPCLK, 
`endif 
GRST, TMODE, DMDin[15:0], 
selTSCALE, selTCOUNT, selTPERIOD, 
TSCALE_we, TCOUNT_we, TPERIOD_we, MSTAT5, 
TMR_do[15:0], MMR_web, 
ICE_ST, 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 


T_ITMR); 



REGo regout (/* -------- Inputs : --------- */ 
DM_rdm[15:0], 
DM_rd0[15:0], DM_rd1[15:0], 
DM_rd2[15:0], DM_rd3[15:0], 
DM_rd4[15:0], DM_rd5[15:0], 
DM_rd6[15:0], DM_rd7[15:0], 
PM_rd0[15:0], PM_rd1[15:0], 
PM_rd2[15:0], PM_rd3[15:0], 
PM_rd4[15:0], PM_rd5[15:0], 
PM_rd6[15:0], PM_rd7[15:0], 
CM_rdm[23:0], 
CM_rd0[23:0], CM_rd1[23:0], 
CM_rd2[23:0], CM_rd3[23:0], 
CM_rd4[23:0], CM_rd5[23:0], 
CM_rd6[23:0], CM_rd7[23:0], 

`ifdef FD_EVB 
PERICLK, 
`else 
DSPCLK, 
`endif 
GO_Cx, redoSTI_h, Pwrite_Ei, 
psqDMD_do[15:0], dagDMD_do[15:0], 
euDMD_do[15:0], euPMD_do[15:0], 
CKR[15:0], 
SPT0_do[15:0], RX0[15:0], 
SPT1_do[15:0], RX1[15:0], 
PIO_do[15:0], 
TMR_do[15:0], 
DCTL[14:0], DOVL[11:0], idmaPMD_oe, 
idmaDMD_oe, idmaPMD_do[15:0], 
SREQ, spt0DMD_oe, spt1DMD_oe, 
autoDMD_do[15:0], 

WSCR[14:0], WSCR_ext[7:0], emcDMD_oe, emcDMD_do[15:0], 
emcPMD_oe, emcPMD_do[15:0], 
SYSRo[15:0], ldSREG_E, selSYSR, selCKR, 
selDCTL, selDOVL, selWSCR, selWSCR_ext, 
DM_oe_K, 
DMo_oe0_K, DMo_oe1_K, 
DMo_oe2_K, DMo_oe3_K, 
DMo_oe4_K, DMo_oe5_K, 
DMo_oe6_K, DMo_oe7_K, 
PMo_oe0_K, PMo_oe1_K, 
PMo_oe2_K, PMo_oe3_K, 
PMo_oe4_K, PMo_oe5_K, 
PMo_oe6_K, PMo_oe7_K, 
CM_oe_K, 
CMo_oe0_K, CMo_oe1_K, 
CMo_oe2_K, CMo_oe3_K, 
CMo_oe4_K, CMo_oe5_K, 
CMo_oe6_K, CMo_oe7_K, 
BRdataBUF[23:0], bdmaDMD_oe, 
BDMAmmio[15:0], bdmaPMD_oe, 


DM_wd[15:0], DMDin[15:0], PM_wd[15:0], 
PMDin[15:0], CM_rd[23:0], SICEmmio[15:0]); 


BDMA bdma (/* ---------- Inputs : ---------- */ 
BSreqx, BSack, 
T_MMAP, T_BMODE, T_ED[7:0], P_RSTn, 
GRST, PM_bdry_sel, 
ENS12, ECS12, ENS13, ECS13, 
ENS14, ECS14, ENS0, 

`ifdef FD_EVB 
PERICLK, 
`else 
DSPCLK, 
`endif 
CM_rd[23:0], PMDin[15:0], 
DMDin[15:0], 
BOOT, GO_STEAL, 
BCNT_we, BCTL_we, BOVL_we, BIAD_we, 
BEAD_we, selBCNT, selBCTL, selBOVL, 
selBIAD, selBEAD, 
`ifdef FD_DFT 
SCAN_TEST, 
`endif 



BDMWR_cyc, BPMWR_cyc, BDMRD_cyc, 
BPMRD_cyc, BSreq, 
BDMAmode, BMpage[7:0], BEAD[13:0], 
BWdataBUF[7:0], BDIR, BWRn, 
BWend, 
BDMA_end, BDMA_boot, BCM_cyc, BCMRD_cyc, 
BRdataBUF[23:0], BOVL[11:0], BM_cyc, 
T_BDMA, BPM_cyc, BDM_cyc, 
BIAD[13:0], BRST, 
BDMAmmio[15:0], bdmaDMD_oe, bdmaPMD_oe 
); 


`ifdef FD_EVB 
assign #`db CMAinx[13:0] = CMAin[13:0]; 
assign #`db DMAinx[13:0] = DMAin[13:0]; 
assign #`db PMAinx[13:0] = PMAin[13:0]; 
`else 
MAbufx bufc (CMAin[13:0], CMAinx[13:0]); 
MAbufx bufd (DMAin[13:0], DMAinx[13:0]); 
MAbufx bufp (PMAin[13:0], PMAinx[13:0]); 
`endif 


endmodule 
