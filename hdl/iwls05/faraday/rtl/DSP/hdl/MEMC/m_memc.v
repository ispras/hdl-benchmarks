






`include "x_def.v"

module MEMC (/* ------------ Inputs : ------------- */
DSPCLK, T_RST, STBY, DMD,
PPclr_h, GO_Ex, GO_Cx,
redoM_h, redoSTI_h, redoLD_h, IDLE_ST,
DMOVL_dsp, PMOVL_dsp,
Pread_R, Pwrite_R, Dread_R, Dwrite_R,
IOcmd_R, IOread_R, IOwrite_R, Dummy_R,
Dummy_E,
DMA_R, PMA_R, DMA,
DMAin, PMAin,
SREQ, STEAL, DMSreqx_wr, PMSreqx_wr,
DMSreqx_rd, PMSreqx_rd,
BOOT, PMOVL, DMOVL,
DSreqx, DRDcyc,
selECM,
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
Pread_E, Pwrite_E, Dread_E, Dwrite_E,
IOcmd_E, IOread_E, IOwrite_E, WSCR_we, WSCR_ext_we,
selWSCR, selWSCR_ext, EXTC_Eg, ECMWAIT, ECMAWAIT,
selCKR, CKR_we,
DWWAIT, DRWAIT, selDCTL, selDOVL,
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
PMo_oe0, PMo_oe1,
PMo_oe2, PMo_oe3,
PMo_oe4, PMo_oe5,
PMo_oe6, PMo_oe7,
DM_cs,
DMo_cs0, DMo_cs1,
DMo_cs2, DMo_cs3,
DMo_cs4, DMo_cs5,
DMo_cs6, DMo_cs7,
DMo_web,
DM_oe,
DMo_oe0, DMo_oe1,
DMo_oe2, DMo_oe3,
DMo_oe4, DMo_oe5,
DMo_oe6, DMo_oe7,
selBIAD, selBEAD, selBCTL, selBCNT, selBOVL,
BCNT_we, BCTL_we, BOVL_we, BIAD_we, BEAD_we,
selIVER
);

input PM_bdry_sel;
input BM_cyc,
ECYC;
input DSreqx,
DRDcyc;
input [3:0] DMOVL_dsp;
input [7:4] PMOVL_dsp;
input [3:0] PMOVL,
DMOVL;
input [15:0] DMD;
input [13:5] DMA_R,
DMAin;
input [13:12] PMA_R,
PMAin;
input [13:0] DMA;
input DSPCLK,
T_RST,
PPclr_h,
GO_Ex,
GO_Cx,
Dummy_R,
Dummy_E,
STBY,
BOOT,
redoSTI_h,
redoLD_h,
IDLE_ST,
redoM_h,

Pread_R,
Pwrite_R,
Dread_R,
Dwrite_R,
IOcmd_R,
IOread_R,
IOwrite_R,
STEAL,
SREQ,
selECM,
PMSreqx_wr,
DMSreqx_wr,

PMSreqx_rd,
DMSreqx_rd;


`ifdef FD_DFT
input SCAN_TEST;
`endif

output [3:0] ECMWAIT;
output [1:0] ECMAWAIT;
output [2:0] DWWAIT,
DRWAIT;

output SP0_EN,
SP1_EN,
TB_EN,
BIASRND,
EXTC_Eg,
Pread_E,
Pwrite_E,
Dread_E,
Dwrite_E,
IOcmd_E,
IOread_E,
IOwrite_E,
accPM_Eg,
accDM_Eg,



MMR_web,
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
selIVER;

output
ldSREG_E,
DwriteI_Eg, PwriteI_Eg, STI_Cg,
LDaST_Eg,
selWSCR, selWSCR_ext, selAUTO0, selAUTO1, selFSDIV0,
selFSDIV1, selSCLKDIV0, selSCLKDIV1,
selSCTL0, selSCTL1, selMWORD0, selMWORD1,
selPFTYPE, selPDATA, selPIMASK, selPINT,
selTPERIOD, selTCOUNT, selTSCALE, selDCTL,
selDOVL, selCKR, selSYSR,


AUTO0_we, AUTO1_we, FSDIV0_we, FSDIV1_we,
SCLKDIV0_we, SCLKDIV1_we, SCTL0_we, SCTL1_we,
MWORD0_we, MWORD1_we, PFTYPE_we, PDATA_we,
PIMASK_we, PINT_we, TPERIOD_we, TCOUNT_we,
TSCALE_we, DCTL_we, DOVL_we, WSCR_we, WSCR_ext_we,
CKR_we;

output selBIAD, selBEAD, selBCTL, selBCNT, selBOVL,
BCNT_we, BCTL_we, BOVL_we, BIAD_we, BEAD_we;

wire [15:0] SYSR;
reg MMR_web;

reg IOcmd_E, IOread_E, IOwrite_E;
reg Dread_E, Dwrite_E, Pread_E,
Pwrite_E, Dwrite_C, Pwrite_C, ldSREG_E,
EXTC_E, EXTC_Eg, accPM_E, accDM_E, selMIO_E,
STI_Cg, LDaST_Eg;

wire RST, PMcyc, DMcyc, SYSR_we, Dread_R,
Dwrite_R, Pwrite_R, IOcmd_R,
DMo_cs0_nx, DMo_cs1_nx, DMo_oe0_nx,
DMo_oe1_nx, DMo_we_h0, DMo_we_h1,
PMo_cs0_nx, PMo_cs1_nx, PMo_oe0_nx,
PMo_oe1_nx, PMo_we_h0, PMo_we_h1,
Dwrite_Eng, EXTC_R, GO_STEAL,
ldSREG_R, EX_en, selMIO_R,
wrMMIOen_R;

wire Dread_Eh, Pread_Eh, Dwrite_Ch, Pwrite_Ch,
reLOAD, reSTORE;
wire MMIO_E, PwriteI_E, DwriteI_E, LDaST_Rg;









assign #`d0 RST = T_RST;

`ifdef FD_DFT
reg PPclr_o;
wire PPclr;
always @(posedge DSPCLK) begin
PPclr_o <= #`db T_RST || PPclr_h;
end
assign PPclr = SCAN_TEST ? T_RST : PPclr_o;
`else
reg PPclr;
always @(posedge DSPCLK) begin
PPclr <= #`db T_RST || PPclr_h;
end
`endif
assign #`da EX_en = !Dummy_E;






wire PM_rgn,
DM_rgn,
DM_main,
PM_page0,
PM_page1,
PM_page2,
PM_page3,
PM_page4,
PM_page5,
PM_page6,
PM_page7,
DM_page0,
DM_page1,
DM_page2,
DM_page3,
DM_page4,
DM_page5,
DM_page6,
DM_page7;



assign PM_rgn = PM_bdry_sel ? PMAin[13] :
(PMAin[13:12] == 2'b11);


assign #`da PM_page0 = PM_rgn && (PMOVL[3:0] == 4'h0);

assign #`da PM_page1 = PM_rgn && (PMOVL[3:0] == 4'h1);

assign #`da PM_page2 = PM_rgn && (PMOVL[3:0] == 4'h2);

assign #`da PM_page3 = PM_rgn && (PMOVL[3:0] == 4'h3);

assign #`da PM_page4 = PM_rgn && (PMOVL[3:0] == 4'h4);

assign #`da PM_page5 = PM_rgn && (PMOVL[3:0] == 4'h5);

assign #`da PM_page6 = PM_rgn && (PMOVL[3:0] == 4'h6);

assign #`da PM_page7 = PM_rgn && (PMOVL[3:0] == 4'h7);

assign #`da PMcyc = PM_page0 || PM_page1 || PM_page2 || PM_page3 ||
PM_page4 || PM_page5 || PM_page6 || PM_page7;



assign #`da DM_rgn = !DMAin[13];

assign #`da DM_main = DMAin[13] && !(DMAin[13:5] == 9'h1ff);

assign #`da DM_page0 = DM_rgn && (DMOVL[3:0] == 4'h0);

assign #`da DM_page1 = DM_rgn && (DMOVL[3:0] == 4'h1);

assign #`da DM_page2 = DM_rgn && (DMOVL[3:0] == 4'h2);

assign #`da DM_page3 = DM_rgn && (DMOVL[3:0] == 4'h3);

assign #`da DM_page4 = DM_rgn && (DMOVL[3:0] == 4'h4);

assign #`da DM_page5 = DM_rgn && (DMOVL[3:0] == 4'h5);

assign #`da DM_page6 = DM_rgn && (DMOVL[3:0] == 4'h6);

assign #`da DM_page7 = DM_rgn && (DMOVL[3:0] == 4'h7);

assign #`da DMcyc = DM_main || DM_page0 || DM_page1 || DM_page2 || DM_page3 ||
DM_page4 || DM_page5 || DM_page6 || DM_page7;




wire PM_brdy_R,
DM_brdy_R;

assign #`da PM_brdy_R = (PM_bdry_sel == 2'b00) ? (PMA_R[13:12] == 2'b11) :
(PM_bdry_sel == 2'b01) ? (PMA_R[13] == 1'b1) :
1'b1;
assign #`da DM_brdy_R = !DMA_R[13];

assign #`da EXTC_R = PM_brdy_R && PMOVL_dsp[7] && (Pread_R || Pwrite_R) ||
DM_brdy_R && DMOVL_dsp[3] && (Dread_R || Dwrite_R) ||
IOcmd_R;

always @(posedge DSPCLK or posedge PPclr) begin
if (PPclr) begin
EXTC_E <= #`db 0;
EXTC_Eg <= #`db selECM;
end
else if (GO_Ex) begin
EXTC_E <= #`db EXTC_R;
EXTC_Eg <= #`db EXTC_R && !Dummy_R || selECM;
end
end























assign #`d0 ECMAWAIT[1:0] = SYSR[15:14];
assign #`d0 {TB_EN, SP0_EN, SP1_EN, BIASRND} = SYSR[13:10];
assign #`d0 DWWAIT[2:0] = SYSR[9:7];
assign #`d0 DRWAIT[2:0] = SYSR[6:4];
assign #`d0 ECMWAIT[3:0] = SYSR[3:0];


`ifdef FD_DFT
MREG16MC usysr (DSPCLK, MMR_web, SYSR_we, DMD[15:0], SYSR[15:0], RST, SCAN_TEST);
`else
MREG16MC usysr (DSPCLK, MMR_web, SYSR_we, DMD[15:0], SYSR[15:0], RST);
`endif





























































assign #`da GO_STEAL = GO_Ex || STEAL || BOOT || STBY || BM_cyc && ECYC;

















always @(posedge DSPCLK or posedge PPclr) begin
if (PPclr) begin
Dread_E <= #`db 1'b0;
Dwrite_E <= #`db 1'b0;
Pread_E <= #`db 1'b0;
Pwrite_E <= #`db 1'b0;
IOcmd_E <= #`db 1'b0;
IOread_E <= #`db 1'b0;
IOwrite_E <= #`db 1'b0;
end
else if (GO_Ex) begin
Dread_E <= #`db Dread_R && !Dummy_R;
Dwrite_E <= #`db Dwrite_R && !Dummy_R;
Pread_E <= #`db Pread_R && !Dummy_R;
Pwrite_E <= #`db Pwrite_R && !Dummy_R;
IOcmd_E <= #`db IOcmd_R && !Dummy_R;
IOread_E <= #`db IOread_R && !Dummy_R;
IOwrite_E <= #`db IOwrite_R && !Dummy_R;
end
end




assign #`da wrMMIOen_R = Dwrite_R && (DMA_R[13:5] == 9'h1ff);

always @(posedge DSPCLK or posedge PPclr)
if (PPclr) MMR_web <= #`db 1'b1;
else if (GO_Ex) MMR_web <= #`db !wrMMIOen_R;


always @(posedge DSPCLK or posedge PPclr) begin
if (PPclr) begin
Dwrite_C <= #`db 1'b0;
Pwrite_C <= #`db 1'b0;
end
else if (GO_Cx) begin
Dwrite_C <= #`db Dwrite_E;
Pwrite_C <= #`db Pwrite_E;
end
else if (IDLE_ST) begin
Dwrite_C <= #`db 1'b0;
Pwrite_C <= #`db 1'b0;
end
end

assign #`da reLOAD = redoLD_h || redoM_h;
assign #`da reSTORE = redoSTI_h;


assign #`da Pread_Eh = GO_Ex ? (Pread_R && !Dummy_R && !PwriteI_Eg && !SREQ) : Pread_E;
assign #`da Dread_Eh = GO_Ex ? (Dread_R && !Dummy_R && !DwriteI_Eg && !SREQ) : Dread_E;

assign #`da Pwrite_Ch = GO_Cx ? (PwriteI_E && !SREQ) : Pwrite_C;
assign #`da Dwrite_Ch = GO_Cx ? (DwriteI_E && !SREQ) : Dwrite_C;

always @(posedge DSPCLK or posedge PPclr) begin
if (PPclr) begin
accDM_E <= #`db 1'b0;
accPM_E <= #`db 1'b0;
end
else if (GO_Ex) begin
accDM_E <= #`db Dread_R || Dwrite_R;
accPM_E <= #`db Pread_R || Pwrite_R;
end
end

assign accDM_Eg = accDM_E && !Dummy_E;
assign accPM_Eg = accPM_E && !Dummy_E;




assign #`da Dwrite_Eng = Dwrite_E && EX_en && GO_Cx;



assign #`da SYSR_we = Dwrite_Eng && (DMA[13:0] == `pSYSR);



assign #`da CKR_we = Dwrite_Eng && (DMA[13:0] == `pCKR);



assign #`da WSCR_we = Dwrite_Eng && (DMA[13:0] == `pWSCR);
assign #`da WSCR_ext_we = Dwrite_Eng && (DMA[13:0] == `pWSCR_ext);



assign #`da DCTL_we = Dwrite_Eng && (DMA[13:0] == `pDCTL);
assign #`da DOVL_we = Dwrite_Eng && (DMA[13:0] == `pDOVL);



assign #`da AUTO0_we = Dwrite_Eng && (DMA == `pAUTO0);
assign #`da FSDIV0_we = Dwrite_Eng && (DMA == `pFSDIV0);
assign #`da SCLKDIV0_we = Dwrite_Eng && (DMA == `pSCLKDIV0);
assign #`da SCTL0_we = Dwrite_Eng && (DMA == `pSCTL0);
assign #`da MWORD0_we = Dwrite_Eng && (DMA == `pMWORD0);



assign #`da AUTO1_we = Dwrite_Eng && (DMA == `pAUTO1);
assign #`da FSDIV1_we = Dwrite_Eng && (DMA == `pFSDIV1);
assign #`da SCLKDIV1_we = Dwrite_Eng && (DMA == `pSCLKDIV1);
assign #`da SCTL1_we = Dwrite_Eng && (DMA == `pSCTL1);
assign #`da MWORD1_we = Dwrite_Eng && (DMA == `pMWORD1);



assign #`da PFTYPE_we = Dwrite_Eng && (DMA == `pPFTYPE);
assign #`da PDATA_we = Dwrite_Eng && (DMA == `pPDATA);
assign #`da PIMASK_we = Dwrite_Eng && (DMA == `pPIMASK);
assign #`da PINT_we = Dwrite_Eng && (DMA == `pPINT);



assign #`da TPERIOD_we = Dwrite_Eng && (DMA == `pTPERIOD);
assign #`da TCOUNT_we = Dwrite_Eng && (DMA == `pTCOUNT);
assign #`da TSCALE_we = Dwrite_Eng && (DMA == `pTSCALE);



assign #`da BCNT_we = Dwrite_Eng && (DMA == `pBCNT);
assign #`da BIAD_we = Dwrite_Eng && (DMA == `pBIAD);
assign #`da BEAD_we = Dwrite_Eng && (DMA == `pBEAD);
assign #`da BCTL_we = Dwrite_Eng && (DMA == `pBCTL);
assign #`da BOVL_we = Dwrite_Eng && (DMA == `pBOVL);



assign #`da selIVER = selMIO_E && (DMA[4:0] == 5'h0a);









assign #`da ldSREG_R = (Dread_Eh || DSreqx && DRDcyc) && (DMAin[13:5] == 9'h1ff);

assign #`da selMIO_R = (DMAin[13:5] == 9'h1ff);



assign #`da selSYSR = selMIO_E && (DMA[4:0] == 5'h1f);



assign #`da selCKR = selMIO_E && (DMA[4:0] == 5'h1a);



assign #`da selWSCR = selMIO_E && (DMA[4:0] == 5'h1e);
assign #`da selWSCR_ext = selMIO_E && (DMA[4:0] == 5'h0b);




assign #`da selDCTL = selMIO_E && (DMA[4:0] == 5'h0);
assign #`da selDOVL = selMIO_E && (DMA[4:0] == 5'h19);



assign #`da selAUTO0 = selMIO_E && (DMA[4:0] == 5'h13);
assign #`da selFSDIV0 = selMIO_E && (DMA[4:0] == 5'h14);
assign #`da selSCLKDIV0 = selMIO_E && (DMA[4:0] == 5'h15);
assign #`da selSCTL0 = selMIO_E && (DMA[4:0] == 5'h16);
assign #`da selMWORD0 = selMIO_E && (DMA[4:0] == 5'h17);



assign #`da selAUTO1 = selMIO_E && (DMA[4:0] == 5'h0f);
assign #`da selFSDIV1 = selMIO_E && (DMA[4:0] == 5'h10);
assign #`da selSCLKDIV1 = selMIO_E && (DMA[4:0] == 5'h11);
assign #`da selSCTL1 = selMIO_E && (DMA[4:0] == 5'h12);
assign #`da selMWORD1 = selMIO_E && (DMA[4:0] == 5'h18);



assign #`da selPFTYPE = selMIO_E && (DMA[4:0] == 5'h06);
assign #`da selPDATA = selMIO_E && (DMA[4:0] == 5'h05);
assign #`da selPIMASK = selMIO_E && (DMA[4:0] == 5'h07);
assign #`da selPINT = selMIO_E && (DMA[4:0] == 5'h08);



assign #`da selTPERIOD = selMIO_E && (DMA[4:0] == 5'h1d);
assign #`da selTCOUNT = selMIO_E && (DMA[4:0] == 5'h1c);
assign #`da selTSCALE = selMIO_E && (DMA[4:0] == 5'h1b);



assign #`da selBIAD = selMIO_E && (DMA == `pBIAD);
assign #`da selBEAD = selMIO_E && (DMA == `pBEAD);
assign #`da selBCTL = selMIO_E && (DMA == `pBCTL);
assign #`da selBCNT = selMIO_E && (DMA == `pBCNT);
assign #`da selBOVL = selMIO_E && (DMA == `pBOVL);




always @(posedge DSPCLK or posedge PPclr)
begin
if (PPclr) begin
ldSREG_E <= #`db 1'b0;

end
else if (GO_Ex || reLOAD) begin
ldSREG_E <= #`db ldSREG_R;

end
end

always @(posedge DSPCLK)
if (GO_Ex || reLOAD) selMIO_E <= #`db selMIO_R;






































wire DMcs_en,
DMoe_en;
`ifdef FD_DFT
assign #`da DMcs_en = !SCAN_TEST &&
((Dread_Eh || Dwrite_Ch) ||
(DMSreqx_rd || DMSreqx_wr) && GO_STEAL);
`else
assign #`da DMcs_en = (Dread_Eh || Dwrite_Ch) ||
(DMSreqx_rd || DMSreqx_wr) && GO_STEAL;
`endif

assign #`da DM_cs = DM_main && DMcs_en;

assign #`da DMo_cs0 = DM_page0 && DMcs_en;

assign #`da DMo_cs1 = DM_page1 && DMcs_en;

assign #`da DMo_cs2 = DM_page2 && DMcs_en;

assign #`da DMo_cs3 = DM_page3 && DMcs_en;

assign #`da DMo_cs4 = DM_page4 && DMcs_en;

assign #`da DMo_cs5 = DM_page5 && DMcs_en;

assign #`da DMo_cs6 = DM_page6 && DMcs_en;

assign #`da DMo_cs7 = DM_page7 && DMcs_en;


























assign #`da DMoe_en = (Dread_Eh || DMSreqx_rd && GO_STEAL);

`ifdef FD_DFT

reg DM_oe_h, DMo_oe0_h, DMo_oe1_h, DMo_oe2_h, DMo_oe3_h,
DMo_oe4_h, DMo_oe5_h, DMo_oe6_h, DMo_oe7_h;
wire DM_oe, DMo_oe0, DMo_oe1, DMo_oe2, DMo_oe3,
DMo_oe4, DMo_oe5, DMo_oe6, DMo_oe7;

always @(posedge DSPCLK)
begin
DM_oe_h <= #`db DM_main && DMoe_en;
DMo_oe0_h <= #`db DM_page0 && DMoe_en ;
DMo_oe1_h <= #`db DM_page1 && DMoe_en ;
DMo_oe2_h <= #`db DM_page2 && DMoe_en ;
DMo_oe3_h <= #`db DM_page3 && DMoe_en ;
DMo_oe4_h <= #`db DM_page4 && DMoe_en ;
DMo_oe5_h <= #`db DM_page5 && DMoe_en ;
DMo_oe6_h <= #`db DM_page6 && DMoe_en ;
DMo_oe7_h <= #`db DM_page7 && DMoe_en ;
end

assign DM_oe = DM_oe_h && !SCAN_TEST;
assign DMo_oe0 = DMo_oe0_h && !SCAN_TEST;
assign DMo_oe1 = DMo_oe1_h && !SCAN_TEST;
assign DMo_oe2 = DMo_oe2_h && !SCAN_TEST;
assign DMo_oe3 = DMo_oe3_h && !SCAN_TEST;
assign DMo_oe4 = DMo_oe4_h && !SCAN_TEST;
assign DMo_oe5 = DMo_oe5_h && !SCAN_TEST;
assign DMo_oe6 = DMo_oe6_h && !SCAN_TEST;
assign DMo_oe7 = DMo_oe7_h && !SCAN_TEST;

`else

reg DM_oe, DMo_oe0, DMo_oe1, DMo_oe2, DMo_oe3,
DMo_oe4, DMo_oe5, DMo_oe6, DMo_oe7;

always @(posedge DSPCLK)
begin
DM_oe <= #`db DM_main && DMoe_en ;
DMo_oe0 <= #`db DM_page0 && DMoe_en ;
DMo_oe1 <= #`db DM_page1 && DMoe_en ;
DMo_oe2 <= #`db DM_page2 && DMoe_en ;
DMo_oe3 <= #`db DM_page3 && DMoe_en ;
DMo_oe4 <= #`db DM_page4 && DMoe_en ;
DMo_oe5 <= #`db DM_page5 && DMoe_en ;
DMo_oe6 <= #`db DM_page6 && DMoe_en ;
DMo_oe7 <= #`db DM_page7 && DMoe_en ;
end

`endif




assign #`da DMo_we_h0 = DMcyc && Dwrite_Ch &&
(GO_Cx && !Dummy_E || redoSTI_h);

assign #`da DMo_we_h1 = DMcyc && DMSreqx_wr && GO_STEAL;

assign #`da DMo_web = !(DMo_we_h0 || DMo_we_h1);
















wire PMcs_en,
PMoe_en;

`ifdef FD_DFT
assign #`da PMcs_en = !SCAN_TEST &&
((Pread_Eh || Pwrite_Ch) ||
(PMSreqx_rd || PMSreqx_wr) && GO_STEAL);
`else
assign #`da PMcs_en = (Pread_Eh || Pwrite_Ch) ||
(PMSreqx_rd || PMSreqx_wr) && GO_STEAL;
`endif
assign #`da PMo_cs0 = PM_page0 && PMcs_en;

assign #`da PMo_cs1 = PM_page1 && PMcs_en;

assign #`da PMo_cs2 = PM_page2 && PMcs_en;

assign #`da PMo_cs3 = PM_page3 && PMcs_en;

assign #`da PMo_cs4 = PM_page4 && PMcs_en;

assign #`da PMo_cs5 = PM_page5 && PMcs_en;

assign #`da PMo_cs6 = PM_page6 && PMcs_en;

assign #`da PMo_cs7 = PM_page7 && PMcs_en;


























assign #`da PMoe_en = (Pread_Eh || PMSreqx_rd && GO_STEAL);

`ifdef FD_DFT

reg PMo_oe0_h, PMo_oe1_h, PMo_oe2_h, PMo_oe3_h,
PMo_oe4_h, PMo_oe5_h, PMo_oe6_h, PMo_oe7_h;
wire PMo_oe0, PMo_oe1, PMo_oe2, PMo_oe3,
PMo_oe4, PMo_oe5, PMo_oe6, PMo_oe7;

always @(posedge DSPCLK)
begin
PMo_oe0_h <= #`db PM_page0 && PMoe_en ;
PMo_oe1_h <= #`db PM_page1 && PMoe_en ;
PMo_oe2_h <= #`db PM_page2 && PMoe_en ;
PMo_oe3_h <= #`db PM_page3 && PMoe_en ;
PMo_oe4_h <= #`db PM_page4 && PMoe_en ;
PMo_oe5_h <= #`db PM_page5 && PMoe_en ;
PMo_oe6_h <= #`db PM_page6 && PMoe_en ;
PMo_oe7_h <= #`db PM_page7 && PMoe_en ;
end

assign PMo_oe0 = PMo_oe0_h && !SCAN_TEST;
assign PMo_oe1 = PMo_oe1_h && !SCAN_TEST;
assign PMo_oe2 = PMo_oe2_h && !SCAN_TEST;
assign PMo_oe3 = PMo_oe3_h && !SCAN_TEST;
assign PMo_oe4 = PMo_oe4_h && !SCAN_TEST;
assign PMo_oe5 = PMo_oe5_h && !SCAN_TEST;
assign PMo_oe6 = PMo_oe6_h && !SCAN_TEST;
assign PMo_oe7 = PMo_oe7_h && !SCAN_TEST;

`else

reg PMo_oe0, PMo_oe1, PMo_oe2, PMo_oe3,
PMo_oe4, PMo_oe5, PMo_oe6, PMo_oe7;

always @(posedge DSPCLK)
begin
PMo_oe0 <= #`db PM_page0 && PMoe_en ;
PMo_oe1 <= #`db PM_page1 && PMoe_en ;
PMo_oe2 <= #`db PM_page2 && PMoe_en ;
PMo_oe3 <= #`db PM_page3 && PMoe_en ;
PMo_oe4 <= #`db PM_page4 && PMoe_en ;
PMo_oe5 <= #`db PM_page5 && PMoe_en ;
PMo_oe6 <= #`db PM_page6 && PMoe_en ;
PMo_oe7 <= #`db PM_page7 && PMoe_en ;
end

`endif

assign #`da PMo_we_h0 = PMcyc && Pwrite_Ch &&
(GO_Ex && !Dummy_E || redoSTI_h);

assign #`da PMo_we_h1 = PMcyc && PMSreqx_wr && GO_STEAL ;

assign #`da PMo_web = !(PMo_we_h0 || PMo_we_h1);

















assign #`da MMIO_E = (DMA[13:5] == 9'h1ff);

assign #`da PwriteI_E = Pwrite_E && !EXTC_E ;

assign #`da DwriteI_E = Dwrite_E && !EXTC_E && !MMIO_E;

assign #`da PwriteI_Eg = Pwrite_E && !EXTC_E && !Dummy_E;

assign #`da DwriteI_Eg = Dwrite_E && !EXTC_E && !MMIO_E && !Dummy_E;



assign #`da LDaST_Rg = !(Dummy_E || Dummy_R) &&
((PwriteI_E && Pread_R) || (DwriteI_E && Dread_R));






always @(posedge DSPCLK or posedge PPclr) begin
if (PPclr) LDaST_Eg <= #`db 1'b0;
else if (GO_Ex) LDaST_Eg <= #`db LDaST_Rg;
end



always @(posedge DSPCLK or posedge PPclr) begin
if (PPclr) STI_Cg <= #`db 1'b0;
else if (GO_Cx) STI_Cg <= #`db DwriteI_Eg || PwriteI_Eg;
end


endmodule
