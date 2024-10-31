
module DSP_CORE_top (
    CMAinx, CM_rd0, CM_rd1, CM_rd2, CM_rd3, CM_rd4, CM_rd5, CM_rd6, 
    CM_rd7, CM_rdm, CM_wd, DMAinx, DM_rd0, DM_rd1, DM_rd2, DM_rd3, 
    DM_rd4, DM_rd5, DM_rd6, DM_rd7, DM_rdm, DM_wd, EA_do, ED_do, IAD_do, 
    PIO_oe, PIO_out, PMAinx, PM_rd0, PM_rd1, PM_rd2, PM_rd3, PM_rd4, 
    PM_rd5, PM_rd6, PM_rd7, PM_wd, T_EA, T_ED, T_IAD, T_PIOin, T_TMODE, 
    VC_SI, VC_SO, BGn, BMSn, CLKO, CMSn, CM_cs, CM_oe, CM_web, CMo_cs0, 
    CMo_cs1, CMo_cs2, CMo_cs3, CMo_cs4, CMo_cs5, CMo_cs6, CMo_cs7, 
    CMo_oe0, CMo_oe1, CMo_oe2, CMo_oe3, CMo_oe4, CMo_oe5, CMo_oe6, 
    CMo_oe7, DMSn, DM_cs, DM_oe, DMo_cs0, DMo_cs1, DMo_cs2, DMo_cs3, 
    DMo_cs4, DMo_cs5, DMo_cs6, DMo_cs7, DMo_oe0, DMo_oe1, DMo_oe2, 
    DMo_oe3, DMo_oe4, DMo_oe5, DMo_oe6, DMo_oe7, DMo_web, DSPCLK_cm0, 
    DSPCLK_cm1, DSPCLK_cm2, DSPCLK_dm0, DSPCLK_dm1, DSPCLK_dm2, 
    DSPCLK_pm0, DSPCLK_pm1, DSPCLK_pm2, EA_oe, ECMA_EN, ECMSn, 
    ED_oe_14_8, ED_oe_15, ED_oe_7_0, IACKn, IAD_oe, IDo, IDoe, IOSn, 
    IRFS0, IRFS1, ISCLK0, ISCLK1, ITFS0, ITFS1, PMSn, PM_bdry_sel, 
    PMo_cs0, PMo_cs1, PMo_cs2, PMo_cs3, PMo_cs4, PMo_cs5, PMo_cs6, 
    PMo_cs7, PMo_oe0, PMo_oe1, PMo_oe2, PMo_oe3, PMo_oe4, PMo_oe5, 
    PMo_oe6, PMo_oe7, PMo_web, PWDACK, RDn, RFS0, RFS1, SCLK0, SCLK1, 
    TCLK, TC_RESET, TC_SHIFT, TC_SI, TC_SO, TC_UPDATE, TD0, TD1, 
    TEST_CLK, TEST_RST, TFS0, TFS1, T_BMODE, T_BRn, T_CLKI_OSC, 
    T_CLKI_PLL, T_GOICE, T_IAL, T_ICE_RSTn, T_ICK, T_ID, T_IMS, T_IRDn, 
    T_IRQ0n, T_IRQ1n, T_IRQ2n, T_IRQE0n, T_IRQE1n, T_IRQL1n, T_ISn, 
    T_IWRn, T_MMAP, T_PWDn, T_RD0, T_RD1, T_RFS0, T_RFS1, T_RSTn, 
    T_SCLK0, T_SCLK1, T_Sel_PLL, T_TFS0, T_TFS1, VC_SHIFT, WP_CLK, 
    WP_SI, WP_SO, WRn, XTALoffn, DSPCLK_insert_buf_i, DSPCLK_insert_buf_o
);

input   DSPCLK_insert_buf_i;
output  DSPCLK_insert_buf_o;
input	[23:0]	CM_rd0;
input	[23:0]	CM_rd1;
input	[23:0]	CM_rd2;
input	[23:0]	CM_rd3;
input	[23:0]	CM_rd4;
input	[23:0]	CM_rd5;
input	[23:0]	CM_rd6;
input	[23:0]	CM_rd7;
input	[23:0]	CM_rdm;
input	[15:0]	DM_rd0;
input	[15:0]	DM_rd1;
input	[15:0]	DM_rd2;
input	[15:0]	DM_rd3;
input	[15:0]	DM_rd4;
input	[15:0]	DM_rd5;
input	[15:0]	DM_rd6;
input	[15:0]	DM_rd7;
input	[15:0]	DM_rdm;
input	[15:0]	PM_rd0;
input	[15:0]	PM_rd1;
input	[15:0]	PM_rd2;
input	[15:0]	PM_rd3;
input	[15:0]	PM_rd4;
input	[15:0]	PM_rd5;
input	[15:0]	PM_rd6;
input	[15:0]	PM_rd7;
input	[7:0]	T_EA;
input	[15:0]	T_ED;
input	[15:0]	T_IAD;
input	[11:0]	T_PIOin;
input	[1:0]	T_TMODE;
input	[7:0]	VC_SI;
input	PM_bdry_sel;
input	TCLK;
input	TC_RESET;
input	TC_SHIFT;
input	TC_SI;
input	TC_UPDATE;
input	TEST_CLK;
input	TEST_RST;
input	T_BMODE;
input	T_BRn;
input	T_CLKI_OSC;
input	T_CLKI_PLL;
input	T_GOICE;
input	T_IAL;
input	T_ICE_RSTn;
input	T_ICK;
input	T_ID;
input	T_IMS;
input	T_IRDn;
input	T_IRQ0n;
input	T_IRQ1n;
input	T_IRQ2n;
input	T_IRQE0n;
input	T_IRQE1n;
input	T_IRQL1n;
input	T_ISn;
input	T_IWRn;
input	T_MMAP;
input	T_PWDn;
input	T_RD0;
input	T_RD1;
input	T_RFS0;
input	T_RFS1;
input	T_RSTn;
input	T_SCLK0;
input	T_SCLK1;
input	T_Sel_PLL;
input	T_TFS0;
input	T_TFS1;
input	VC_SHIFT;
input	WP_CLK;
input	WP_SI;
output	[13:0]	CMAinx;
output	[23:0]	CM_wd;
output	[13:0]	DMAinx;
output	[15:0]	DM_wd;
output	[14:0]	EA_do;
output	[15:0]	ED_do;
output	[15:0]	IAD_do;
output	[11:0]	PIO_oe;
output	[11:0]	PIO_out;
output	[13:0]	PMAinx;
output	[15:0]	PM_wd;
output	[7:0]	VC_SO;
output	BGn;
output	BMSn;
output	CLKO;
output	CMSn;
output	CM_cs;
output	CM_oe;
output	CM_web;
output	CMo_cs0;
output	CMo_cs1;
output	CMo_cs2;
output	CMo_cs3;
output	CMo_cs4;
output	CMo_cs5;
output	CMo_cs6;
output	CMo_cs7;
output	CMo_oe0;
output	CMo_oe1;
output	CMo_oe2;
output	CMo_oe3;
output	CMo_oe4;
output	CMo_oe5;
output	CMo_oe6;
output	CMo_oe7;
output	DMSn;
output	DM_cs;
output	DM_oe;
output	DMo_cs0;
output	DMo_cs1;
output	DMo_cs2;
output	DMo_cs3;
output	DMo_cs4;
output	DMo_cs5;
output	DMo_cs6;
output	DMo_cs7;
output	DMo_oe0;
output	DMo_oe1;
output	DMo_oe2;
output	DMo_oe3;
output	DMo_oe4;
output	DMo_oe5;
output	DMo_oe6;
output	DMo_oe7;
output	DMo_web;
output	DSPCLK_cm0;
output	DSPCLK_cm1;
output	DSPCLK_cm2;
output	DSPCLK_dm0;
output	DSPCLK_dm1;
output	DSPCLK_dm2;
output	DSPCLK_pm0;
output	DSPCLK_pm1;
output	DSPCLK_pm2;
output	EA_oe;
output	ECMA_EN;
output	ECMSn;
output	ED_oe_14_8;
output	ED_oe_15;
output	ED_oe_7_0;
output	IACKn;
output	IAD_oe;
output	IDo;
output	IDoe;
output	IOSn;
output	IRFS0;
output	IRFS1;
output	ISCLK0;
output	ISCLK1;
output	ITFS0;
output	ITFS1;
output	PMSn;
output	PMo_cs0;
output	PMo_cs1;
output	PMo_cs2;
output	PMo_cs3;
output	PMo_cs4;
output	PMo_cs5;
output	PMo_cs6;
output	PMo_cs7;
output	PMo_oe0;
output	PMo_oe1;
output	PMo_oe2;
output	PMo_oe3;
output	PMo_oe4;
output	PMo_oe5;
output	PMo_oe6;
output	PMo_oe7;
output	PMo_web;
output	PWDACK;
output	RDn;
output	RFS0;
output	RFS1;
output	SCLK0;
output	SCLK1;
output	TC_SO;
output	TD0;
output	TD1;
output	TFS0;
output	TFS1;
output	WP_SO;
output	WRn;
output	XTALoffn;

wire	[13:0]	core_CMAinx;
wire	[23:0]	core_CM_rd0;
wire	[23:0]	core_CM_rd1;
wire	[23:0]	core_CM_rd2;
wire	[23:0]	core_CM_rd3;
wire	[23:0]	core_CM_rd4;
wire	[23:0]	core_CM_rd5;
wire	[23:0]	core_CM_rd6;
wire	[23:0]	core_CM_rd7;
wire	[23:0]	core_CM_rdm;
wire	[23:0]	core_CM_wd;
wire	[13:0]	core_DMAinx;
wire	[15:0]	core_DM_rd0;
wire	[15:0]	core_DM_rd1;
wire	[15:0]	core_DM_rd2;
wire	[15:0]	core_DM_rd3;
wire	[15:0]	core_DM_rd4;
wire	[15:0]	core_DM_rd5;
wire	[15:0]	core_DM_rd6;
wire	[15:0]	core_DM_rd7;
wire	[15:0]	core_DM_rdm;
wire	[15:0]	core_DM_wd;
wire	[14:0]	core_EA_do;
wire	[15:0]	core_ED_do;
wire	[15:0]	core_IAD_do;
wire	[11:0]	core_PIO_oe;
wire	[11:0]	core_PIO_out;
wire	[13:0]	core_PMAinx;
wire	[15:0]	core_PM_rd0;
wire	[15:0]	core_PM_rd1;
wire	[15:0]	core_PM_rd2;
wire	[15:0]	core_PM_rd3;
wire	[15:0]	core_PM_rd4;
wire	[15:0]	core_PM_rd5;
wire	[15:0]	core_PM_rd6;
wire	[15:0]	core_PM_rd7;
wire	[15:0]	core_PM_wd;
wire	[7:0]	core_T_EA;
wire	[15:0]	core_T_ED;
wire	[15:0]	core_T_IAD;
wire	[11:0]	core_T_PIOin;
wire	[1:0]	core_T_TMODE;
wire	SCANIN1, SCANIN2, SCANIN3, SCANIN4, SCANIN5, SCANIN6, SCANIN7, 
    SCANIN8, SCANOUT1, SCANOUT2, SCANOUT3, SCANOUT4, SCANOUT5, SCANOUT6,
     SCANOUT7, SCANOUT8, SCAN_ENABLE, SCAN_SHIFT, SCAN_TEST, 
    VC_SCANMODE, core_BGn, core_BMSn, core_CLKO, core_CMSn, core_CM_cs, 
    core_CM_oe, core_CM_web, core_CMo_cs0, core_CMo_cs1, core_CMo_cs2, 
    core_CMo_cs3, core_CMo_cs4, core_CMo_cs5, core_CMo_cs6, 
    core_CMo_cs7, core_CMo_oe0, core_CMo_oe1, core_CMo_oe2, 
    core_CMo_oe3, core_CMo_oe4, core_CMo_oe5, core_CMo_oe6, 
    core_CMo_oe7, core_DMSn, core_DM_cs, core_DM_oe, core_DMo_cs0, 
    core_DMo_cs1, core_DMo_cs2, core_DMo_cs3, core_DMo_cs4, 
    core_DMo_cs5, core_DMo_cs6, core_DMo_cs7, core_DMo_oe0, 
    core_DMo_oe1, core_DMo_oe2, core_DMo_oe3, core_DMo_oe4, 
    core_DMo_oe5, core_DMo_oe6, core_DMo_oe7, core_DMo_web, 
    core_DSPCLK_cm0, core_DSPCLK_cm1, core_DSPCLK_cm2, core_DSPCLK_dm0, 
    core_DSPCLK_dm1, core_DSPCLK_dm2, core_DSPCLK_pm0, core_DSPCLK_pm1, 
    core_DSPCLK_pm2, core_EA_oe, core_ECMA_EN, core_ECMSn, 
    core_ED_oe_14_8, core_ED_oe_15, core_ED_oe_7_0, core_IACKn, 
    core_IAD_oe, core_IDo, core_IDoe, core_IOSn, core_IRFS0, core_IRFS1,
     core_ISCLK0, core_ISCLK1, core_ITFS0, core_ITFS1, core_PMSn, 
    core_PM_bdry_sel, core_PMo_cs0, core_PMo_cs1, core_PMo_cs2, 
    core_PMo_cs3, core_PMo_cs4, core_PMo_cs5, core_PMo_cs6, 
    core_PMo_cs7, core_PMo_oe0, core_PMo_oe1, core_PMo_oe2, 
    core_PMo_oe3, core_PMo_oe4, core_PMo_oe5, core_PMo_oe6, 
    core_PMo_oe7, core_PMo_web, core_PWDACK, core_RDn, core_RFS0, 
    core_RFS1, core_SCLK0, core_SCLK1, core_TD0, core_TD1, core_TFS0, 
    core_TFS1, core_T_BMODE, core_T_BRn, core_T_CLKI_OSC, 
    core_T_CLKI_PLL, core_T_GOICE, core_T_IAL, core_T_ICE_RSTn, 
    core_T_ICK, core_T_ID, core_T_IMS, core_T_IRDn, core_T_IRQ0n, 
    core_T_IRQ1n, core_T_IRQ2n, core_T_IRQE0n, core_T_IRQE1n, 
    core_T_IRQL1n, core_T_ISn, core_T_IWRn, core_T_MMAP, core_T_PWDn, 
    core_T_RD0, core_T_RD1, core_T_RFS0, core_T_RFS1, core_T_RSTn, 
    core_T_SCLK0, core_T_SCLK1, core_T_Sel_PLL, core_T_TFS0, 
    core_T_TFS1, core_WRn, core_XTALoffn;

//DSP_CORE CORE (
DSP_CORE dsp_core (
    .BGn(core_BGn), .BMSn(core_BMSn), .CLKO(core_CLKO), .CMAinx(core_CMAinx), 
    .CMSn(core_CMSn), .CM_cs(core_CM_cs), .CM_oe(core_CM_oe), 
    .CM_rd0(core_CM_rd0), .CM_rd1(core_CM_rd1), .CM_rd2(core_CM_rd2), 
    .CM_rd3(core_CM_rd3), .CM_rd4(core_CM_rd4), .CM_rd5(core_CM_rd5), 
    .CM_rd6(core_CM_rd6), .CM_rd7(core_CM_rd7), .CM_rdm(core_CM_rdm), 
    .CM_wd(core_CM_wd), .CM_web(core_CM_web), .CMo_cs0(core_CMo_cs0), 
    .CMo_cs1(core_CMo_cs1), .CMo_cs2(core_CMo_cs2), .CMo_cs3(core_CMo_cs3), 
    .CMo_cs4(core_CMo_cs4), .CMo_cs5(core_CMo_cs5), .CMo_cs6(core_CMo_cs6), 
    .CMo_cs7(core_CMo_cs7), .CMo_oe0(core_CMo_oe0), .CMo_oe1(core_CMo_oe1), 
    .CMo_oe2(core_CMo_oe2), .CMo_oe3(core_CMo_oe3), .CMo_oe4(core_CMo_oe4), 
    .CMo_oe5(core_CMo_oe5), .CMo_oe6(core_CMo_oe6), .CMo_oe7(core_CMo_oe7), 
    .DMAinx(core_DMAinx), .DMSn(core_DMSn), .DM_cs(core_DM_cs), 
    .DM_oe(core_DM_oe), .DM_rd0(core_DM_rd0), .DM_rd1(core_DM_rd1), 
    .DM_rd2(core_DM_rd2), .DM_rd3(core_DM_rd3), .DM_rd4(core_DM_rd4), 
    .DM_rd5(core_DM_rd5), .DM_rd6(core_DM_rd6), .DM_rd7(core_DM_rd7), 
    .DM_rdm(core_DM_rdm), .DM_wd(core_DM_wd), .DMo_cs0(core_DMo_cs0), 
    .DMo_cs1(core_DMo_cs1), .DMo_cs2(core_DMo_cs2), .DMo_cs3(core_DMo_cs3), 
    .DMo_cs4(core_DMo_cs4), .DMo_cs5(core_DMo_cs5), .DMo_cs6(core_DMo_cs6), 
    .DMo_cs7(core_DMo_cs7), .DMo_oe0(core_DMo_oe0), .DMo_oe1(core_DMo_oe1), 
    .DMo_oe2(core_DMo_oe2), .DMo_oe3(core_DMo_oe3), .DMo_oe4(core_DMo_oe4), 
    .DMo_oe5(core_DMo_oe5), .DMo_oe6(core_DMo_oe6), .DMo_oe7(core_DMo_oe7), 
    .DMo_web(core_DMo_web), .DSPCLK_cm0(core_DSPCLK_cm0), 
    .DSPCLK_cm1(core_DSPCLK_cm1), .DSPCLK_cm2(core_DSPCLK_cm2), 
    .DSPCLK_dm0(core_DSPCLK_dm0), .DSPCLK_dm1(core_DSPCLK_dm1), 
    .DSPCLK_dm2(core_DSPCLK_dm2), .DSPCLK_pm0(core_DSPCLK_pm0), 
    .DSPCLK_pm1(core_DSPCLK_pm1), .DSPCLK_pm2(core_DSPCLK_pm2), 
    .EA_do(core_EA_do), .EA_oe(core_EA_oe), .ECMA_EN(core_ECMA_EN), 
    .ECMSn(core_ECMSn), .ED_do(core_ED_do), .ED_oe_14_8(core_ED_oe_14_8), 
    .ED_oe_15(core_ED_oe_15), .ED_oe_7_0(core_ED_oe_7_0), .IACKn(core_IACKn), 
    .IAD_do(core_IAD_do), .IAD_oe(core_IAD_oe), .IDo(core_IDo), 
    .IDoe(core_IDoe), .IOSn(core_IOSn), .IRFS0(core_IRFS0), .IRFS1(core_IRFS1), 
    .ISCLK0(core_ISCLK0), .ISCLK1(core_ISCLK1), .ITFS0(core_ITFS0), 
    .ITFS1(core_ITFS1), .PIO_oe(core_PIO_oe), .PIO_out(core_PIO_out), 
    .PMAinx(core_PMAinx), .PMSn(core_PMSn), .PM_bdry_sel(core_PM_bdry_sel), 
    .PM_rd0(core_PM_rd0), .PM_rd1(core_PM_rd1), .PM_rd2(core_PM_rd2), 
    .PM_rd3(core_PM_rd3), .PM_rd4(core_PM_rd4), .PM_rd5(core_PM_rd5), 
    .PM_rd6(core_PM_rd6), .PM_rd7(core_PM_rd7), .PM_wd(core_PM_wd), 
    .PMo_cs0(core_PMo_cs0), .PMo_cs1(core_PMo_cs1), .PMo_cs2(core_PMo_cs2), 
    .PMo_cs3(core_PMo_cs3), .PMo_cs4(core_PMo_cs4), .PMo_cs5(core_PMo_cs5), 
    .PMo_cs6(core_PMo_cs6), .PMo_cs7(core_PMo_cs7), .PMo_oe0(core_PMo_oe0), 
    .PMo_oe1(core_PMo_oe1), .PMo_oe2(core_PMo_oe2), .PMo_oe3(core_PMo_oe3), 
    .PMo_oe4(core_PMo_oe4), .PMo_oe5(core_PMo_oe5), .PMo_oe6(core_PMo_oe6), 
    .PMo_oe7(core_PMo_oe7), .PMo_web(core_PMo_web), .PWDACK(core_PWDACK), 
    .RDn(core_RDn), .RFS0(core_RFS0), .RFS1(core_RFS1), .SCANIN1(SCANIN1), 
    .SCANIN2(SCANIN2), .SCANIN3(SCANIN3), .SCANIN4(SCANIN4), .SCANIN5(SCANIN5), 
    .SCANIN6(SCANIN6), .SCANIN7(SCANIN7), .SCANIN8(SCANIN8), 
    .SCANOUT1(SCANOUT1), .SCANOUT2(SCANOUT2), .SCANOUT3(SCANOUT3), 
    .SCANOUT4(SCANOUT4), .SCANOUT5(SCANOUT5), .SCANOUT6(SCANOUT6), 
    .SCANOUT7(SCANOUT7), .SCANOUT8(SCANOUT8), .SCAN_ENABLE(SCAN_ENABLE), 
    .SCAN_TEST(SCAN_TEST), .SCLK0(core_SCLK0), .SCLK1(core_SCLK1), 
    .TD0(core_TD0), .TD1(core_TD1), .TFS0(core_TFS0), .TFS1(core_TFS1), 
    .T_BMODE(core_T_BMODE), .T_BRn(core_T_BRn), .T_CLKI_OSC(core_T_CLKI_OSC), 
    .T_CLKI_PLL(core_T_CLKI_PLL), .T_EA(core_T_EA), .T_ED(core_T_ED), 
    .T_GOICE(core_T_GOICE), .T_IAD(core_T_IAD), .T_IAL(core_T_IAL), 
    .T_ICE_RSTn(core_T_ICE_RSTn), .T_ICK(core_T_ICK), .T_ID(core_T_ID), 
    .T_IMS(core_T_IMS), .T_IRDn(core_T_IRDn), .T_IRQ0n(core_T_IRQ0n), 
    .T_IRQ1n(core_T_IRQ1n), .T_IRQ2n(core_T_IRQ2n), .T_IRQE0n(core_T_IRQE0n), 
    .T_IRQE1n(core_T_IRQE1n), .T_IRQL1n(core_T_IRQL1n), .T_ISn(core_T_ISn), 
    .T_IWRn(core_T_IWRn), .T_MMAP(core_T_MMAP), .T_PIOin(core_T_PIOin), 
    .T_PWDn(core_T_PWDn), .T_RD0(core_T_RD0), .T_RD1(core_T_RD1), 
    .T_RFS0(core_T_RFS0), .T_RFS1(core_T_RFS1), .T_RSTn(core_T_RSTn), 
    .T_SCLK0(core_T_SCLK0), .T_SCLK1(core_T_SCLK1), .T_Sel_PLL(core_T_Sel_PLL), 
    .T_TFS0(core_T_TFS0), .T_TFS1(core_T_TFS1), .T_TMODE(core_T_TMODE), 
    .WRn(core_WRn), .XTALoffn(core_XTALoffn), 
    .DSPCLK_insert_buf_i(DSPCLK_insert_buf_i),
    .DSPCLK_insert_buf_o(DSPCLK_insert_buf_o)
);
DSP_CORE_wrapper WRAPPER (
    .BGn(BGn), .BMSn(BMSn), .CLKO(CLKO), .CMAinx(CMAinx), .CMSn(CMSn), 
    .CM_cs(CM_cs), .CM_oe(CM_oe), .CM_rd0(CM_rd0), .CM_rd1(CM_rd1), 
    .CM_rd2(CM_rd2), .CM_rd3(CM_rd3), .CM_rd4(CM_rd4), .CM_rd5(CM_rd5), 
    .CM_rd6(CM_rd6), .CM_rd7(CM_rd7), .CM_rdm(CM_rdm), .CM_wd(CM_wd), 
    .CM_web(CM_web), .CMo_cs0(CMo_cs0), .CMo_cs1(CMo_cs1), .CMo_cs2(CMo_cs2), 
    .CMo_cs3(CMo_cs3), .CMo_cs4(CMo_cs4), .CMo_cs5(CMo_cs5), .CMo_cs6(CMo_cs6), 
    .CMo_cs7(CMo_cs7), .CMo_oe0(CMo_oe0), .CMo_oe1(CMo_oe1), .CMo_oe2(CMo_oe2), 
    .CMo_oe3(CMo_oe3), .CMo_oe4(CMo_oe4), .CMo_oe5(CMo_oe5), .CMo_oe6(CMo_oe6), 
    .CMo_oe7(CMo_oe7), .DMAinx(DMAinx), .DMSn(DMSn), .DM_cs(DM_cs), 
    .DM_oe(DM_oe), .DM_rd0(DM_rd0), .DM_rd1(DM_rd1), .DM_rd2(DM_rd2), 
    .DM_rd3(DM_rd3), .DM_rd4(DM_rd4), .DM_rd5(DM_rd5), .DM_rd6(DM_rd6), 
    .DM_rd7(DM_rd7), .DM_rdm(DM_rdm), .DM_wd(DM_wd), .DMo_cs0(DMo_cs0), 
    .DMo_cs1(DMo_cs1), .DMo_cs2(DMo_cs2), .DMo_cs3(DMo_cs3), .DMo_cs4(DMo_cs4), 
    .DMo_cs5(DMo_cs5), .DMo_cs6(DMo_cs6), .DMo_cs7(DMo_cs7), .DMo_oe0(DMo_oe0), 
    .DMo_oe1(DMo_oe1), .DMo_oe2(DMo_oe2), .DMo_oe3(DMo_oe3), .DMo_oe4(DMo_oe4), 
    .DMo_oe5(DMo_oe5), .DMo_oe6(DMo_oe6), .DMo_oe7(DMo_oe7), .DMo_web(DMo_web), 
    .DSPCLK_cm0(DSPCLK_cm0), .DSPCLK_cm1(DSPCLK_cm1), .DSPCLK_cm2(DSPCLK_cm2), 
    .DSPCLK_dm0(DSPCLK_dm0), .DSPCLK_dm1(DSPCLK_dm1), .DSPCLK_dm2(DSPCLK_dm2), 
    .DSPCLK_pm0(DSPCLK_pm0), .DSPCLK_pm1(DSPCLK_pm1), .DSPCLK_pm2(DSPCLK_pm2), 
    .EA_do(EA_do), .EA_oe(EA_oe), .ECMA_EN(ECMA_EN), .ECMSn(ECMSn), 
    .ED_do(ED_do), .ED_oe_14_8(ED_oe_14_8), .ED_oe_15(ED_oe_15), 
    .ED_oe_7_0(ED_oe_7_0), .IACKn(IACKn), .IAD_do(IAD_do), .IAD_oe(IAD_oe), 
    .IDo(IDo), .IDoe(IDoe), .IOSn(IOSn), .IRFS0(IRFS0), .IRFS1(IRFS1), 
    .ISCLK0(ISCLK0), .ISCLK1(ISCLK1), .ITFS0(ITFS0), .ITFS1(ITFS1), 
    .PIO_oe(PIO_oe), .PIO_out(PIO_out), .PMAinx(PMAinx), .PMSn(PMSn), 
    .PM_bdry_sel(PM_bdry_sel), .PM_rd0(PM_rd0), .PM_rd1(PM_rd1), 
    .PM_rd2(PM_rd2), .PM_rd3(PM_rd3), .PM_rd4(PM_rd4), .PM_rd5(PM_rd5), 
    .PM_rd6(PM_rd6), .PM_rd7(PM_rd7), .PM_wd(PM_wd), .PMo_cs0(PMo_cs0), 
    .PMo_cs1(PMo_cs1), .PMo_cs2(PMo_cs2), .PMo_cs3(PMo_cs3), .PMo_cs4(PMo_cs4), 
    .PMo_cs5(PMo_cs5), .PMo_cs6(PMo_cs6), .PMo_cs7(PMo_cs7), .PMo_oe0(PMo_oe0), 
    .PMo_oe1(PMo_oe1), .PMo_oe2(PMo_oe2), .PMo_oe3(PMo_oe3), .PMo_oe4(PMo_oe4), 
    .PMo_oe5(PMo_oe5), .PMo_oe6(PMo_oe6), .PMo_oe7(PMo_oe7), .PMo_web(PMo_web), 
    .PWDACK(PWDACK), .RDn(RDn), .RFS0(RFS0), .RFS1(RFS1), .SCANOUT1(SCANOUT1), 
    .SCANOUT2(SCANOUT2), .SCANOUT3(SCANOUT3), .SCANOUT4(SCANOUT4), 
    .SCANOUT5(SCANOUT5), .SCANOUT6(SCANOUT6), .SCANOUT7(SCANOUT7), 
    .SCANOUT8(SCANOUT8), .SCAN_SHIFT(SCAN_SHIFT), .SCLK0(SCLK0), .SCLK1(SCLK1), 
    .TCLK(TCLK), .TC_RESET(TC_RESET), .TC_SHIFT(TC_SHIFT), .TC_SI(TC_SI), 
    .TC_SO(TC_SO), .TC_UPDATE(TC_UPDATE), .TD0(TD0), .TD1(TD1), 
    .TEST_CLK(TEST_CLK), .TFS0(TFS0), .TFS1(TFS1), .T_BMODE(T_BMODE), 
    .T_BRn(T_BRn), .T_CLKI_PLL(T_CLKI_PLL), .T_EA(T_EA), .T_ED(T_ED), 
    .T_GOICE(T_GOICE), .T_IAD(T_IAD), .T_IAL(T_IAL), .T_ICE_RSTn(T_ICE_RSTn), 
    .T_ID(T_ID), .T_IMS(T_IMS), .T_IRDn(T_IRDn), .T_IRQ0n(T_IRQ0n), 
    .T_IRQ1n(T_IRQ1n), .T_IRQ2n(T_IRQ2n), .T_IRQE0n(T_IRQE0n), 
    .T_IRQE1n(T_IRQE1n), .T_IRQL1n(T_IRQL1n), .T_ISn(T_ISn), .T_IWRn(T_IWRn), 
    .T_MMAP(T_MMAP), .T_PIOin(T_PIOin), .T_PWDn(T_PWDn), .T_RD0(T_RD0), 
    .T_RD1(T_RD1), .T_RFS0(T_RFS0), .T_RFS1(T_RFS1), .T_Sel_PLL(T_Sel_PLL), 
    .T_TFS0(T_TFS0), .T_TFS1(T_TFS1), .T_TMODE(T_TMODE), 
    .VC_SCANMODE(VC_SCANMODE), .VC_SHIFT(VC_SHIFT), .VC_SI(VC_SI), 
    .VC_SO(VC_SO), .WP_CLK(WP_CLK), .WP_SI(WP_SI), .WP_SO(WP_SO), .WRn(WRn), 
    .XTALoffn(XTALoffn), .core_BGn(core_BGn), .core_BMSn(core_BMSn), 
    .core_CLKO(core_CLKO), .core_CMAinx(core_CMAinx), .core_CMSn(core_CMSn), 
    .core_CM_cs(core_CM_cs), .core_CM_oe(core_CM_oe), .core_CM_rd0(core_CM_rd0),
     .core_CM_rd1(core_CM_rd1), .core_CM_rd2(core_CM_rd2), 
    .core_CM_rd3(core_CM_rd3), .core_CM_rd4(core_CM_rd4), 
    .core_CM_rd5(core_CM_rd5), .core_CM_rd6(core_CM_rd6), 
    .core_CM_rd7(core_CM_rd7), .core_CM_rdm(core_CM_rdm), 
    .core_CM_wd(core_CM_wd), .core_CM_web(core_CM_web), 
    .core_CMo_cs0(core_CMo_cs0), .core_CMo_cs1(core_CMo_cs1), 
    .core_CMo_cs2(core_CMo_cs2), .core_CMo_cs3(core_CMo_cs3), 
    .core_CMo_cs4(core_CMo_cs4), .core_CMo_cs5(core_CMo_cs5), 
    .core_CMo_cs6(core_CMo_cs6), .core_CMo_cs7(core_CMo_cs7), 
    .core_CMo_oe0(core_CMo_oe0), .core_CMo_oe1(core_CMo_oe1), 
    .core_CMo_oe2(core_CMo_oe2), .core_CMo_oe3(core_CMo_oe3), 
    .core_CMo_oe4(core_CMo_oe4), .core_CMo_oe5(core_CMo_oe5), 
    .core_CMo_oe6(core_CMo_oe6), .core_CMo_oe7(core_CMo_oe7), 
    .core_DMAinx(core_DMAinx), .core_DMSn(core_DMSn), .core_DM_cs(core_DM_cs), 
    .core_DM_oe(core_DM_oe), .core_DM_rd0(core_DM_rd0), 
    .core_DM_rd1(core_DM_rd1), .core_DM_rd2(core_DM_rd2), 
    .core_DM_rd3(core_DM_rd3), .core_DM_rd4(core_DM_rd4), 
    .core_DM_rd5(core_DM_rd5), .core_DM_rd6(core_DM_rd6), 
    .core_DM_rd7(core_DM_rd7), .core_DM_rdm(core_DM_rdm), 
    .core_DM_wd(core_DM_wd), .core_DMo_cs0(core_DMo_cs0), 
    .core_DMo_cs1(core_DMo_cs1), .core_DMo_cs2(core_DMo_cs2), 
    .core_DMo_cs3(core_DMo_cs3), .core_DMo_cs4(core_DMo_cs4), 
    .core_DMo_cs5(core_DMo_cs5), .core_DMo_cs6(core_DMo_cs6), 
    .core_DMo_cs7(core_DMo_cs7), .core_DMo_oe0(core_DMo_oe0), 
    .core_DMo_oe1(core_DMo_oe1), .core_DMo_oe2(core_DMo_oe2), 
    .core_DMo_oe3(core_DMo_oe3), .core_DMo_oe4(core_DMo_oe4), 
    .core_DMo_oe5(core_DMo_oe5), .core_DMo_oe6(core_DMo_oe6), 
    .core_DMo_oe7(core_DMo_oe7), .core_DMo_web(core_DMo_web), 
    .core_DSPCLK_cm0(core_DSPCLK_cm0), .core_DSPCLK_cm1(core_DSPCLK_cm1), 
    .core_DSPCLK_cm2(core_DSPCLK_cm2), .core_DSPCLK_dm0(core_DSPCLK_dm0), 
    .core_DSPCLK_dm1(core_DSPCLK_dm1), .core_DSPCLK_dm2(core_DSPCLK_dm2), 
    .core_DSPCLK_pm0(core_DSPCLK_pm0), .core_DSPCLK_pm1(core_DSPCLK_pm1), 
    .core_DSPCLK_pm2(core_DSPCLK_pm2), .core_EA_do(core_EA_do), 
    .core_EA_oe(core_EA_oe), .core_ECMA_EN(core_ECMA_EN), 
    .core_ECMSn(core_ECMSn), .core_ED_do(core_ED_do), 
    .core_ED_oe_14_8(core_ED_oe_14_8), .core_ED_oe_15(core_ED_oe_15), 
    .core_ED_oe_7_0(core_ED_oe_7_0), .core_IACKn(core_IACKn), 
    .core_IAD_do(core_IAD_do), .core_IAD_oe(core_IAD_oe), .core_IDo(core_IDo), 
    .core_IDoe(core_IDoe), .core_IOSn(core_IOSn), .core_IRFS0(core_IRFS0), 
    .core_IRFS1(core_IRFS1), .core_ISCLK0(core_ISCLK0), 
    .core_ISCLK1(core_ISCLK1), .core_ITFS0(core_ITFS0), .core_ITFS1(core_ITFS1),
     .core_PIO_oe(core_PIO_oe), .core_PIO_out(core_PIO_out), 
    .core_PMAinx(core_PMAinx), .core_PMSn(core_PMSn), 
    .core_PM_bdry_sel(core_PM_bdry_sel), .core_PM_rd0(core_PM_rd0), 
    .core_PM_rd1(core_PM_rd1), .core_PM_rd2(core_PM_rd2), 
    .core_PM_rd3(core_PM_rd3), .core_PM_rd4(core_PM_rd4), 
    .core_PM_rd5(core_PM_rd5), .core_PM_rd6(core_PM_rd6), 
    .core_PM_rd7(core_PM_rd7), .core_PM_wd(core_PM_wd), 
    .core_PMo_cs0(core_PMo_cs0), .core_PMo_cs1(core_PMo_cs1), 
    .core_PMo_cs2(core_PMo_cs2), .core_PMo_cs3(core_PMo_cs3), 
    .core_PMo_cs4(core_PMo_cs4), .core_PMo_cs5(core_PMo_cs5), 
    .core_PMo_cs6(core_PMo_cs6), .core_PMo_cs7(core_PMo_cs7), 
    .core_PMo_oe0(core_PMo_oe0), .core_PMo_oe1(core_PMo_oe1), 
    .core_PMo_oe2(core_PMo_oe2), .core_PMo_oe3(core_PMo_oe3), 
    .core_PMo_oe4(core_PMo_oe4), .core_PMo_oe5(core_PMo_oe5), 
    .core_PMo_oe6(core_PMo_oe6), .core_PMo_oe7(core_PMo_oe7), 
    .core_PMo_web(core_PMo_web), .core_PWDACK(core_PWDACK), .core_RDn(core_RDn),
     .core_RFS0(core_RFS0), .core_RFS1(core_RFS1), .core_SCLK0(core_SCLK0), 
    .core_SCLK1(core_SCLK1), .core_TD0(core_TD0), .core_TD1(core_TD1), 
    .core_TFS0(core_TFS0), .core_TFS1(core_TFS1), .core_T_BMODE(core_T_BMODE), 
    .core_T_BRn(core_T_BRn), .core_T_CLKI_PLL(core_T_CLKI_PLL), 
    .core_T_EA(core_T_EA), .core_T_ED(core_T_ED), .core_T_GOICE(core_T_GOICE), 
    .core_T_IAD(core_T_IAD), .core_T_IAL(core_T_IAL), 
    .core_T_ICE_RSTn(core_T_ICE_RSTn), .core_T_ID(core_T_ID), 
    .core_T_IMS(core_T_IMS), .core_T_IRDn(core_T_IRDn), 
    .core_T_IRQ0n(core_T_IRQ0n), .core_T_IRQ1n(core_T_IRQ1n), 
    .core_T_IRQ2n(core_T_IRQ2n), .core_T_IRQE0n(core_T_IRQE0n), 
    .core_T_IRQE1n(core_T_IRQE1n), .core_T_IRQL1n(core_T_IRQL1n), 
    .core_T_ISn(core_T_ISn), .core_T_IWRn(core_T_IWRn), 
    .core_T_MMAP(core_T_MMAP), .core_T_PIOin(core_T_PIOin), 
    .core_T_PWDn(core_T_PWDn), .core_T_RD0(core_T_RD0), .core_T_RD1(core_T_RD1),
     .core_T_RFS0(core_T_RFS0), .core_T_RFS1(core_T_RFS1), 
    .core_T_Sel_PLL(core_T_Sel_PLL), .core_T_TFS0(core_T_TFS0), 
    .core_T_TFS1(core_T_TFS1), .core_T_TMODE(core_T_TMODE), .core_WRn(core_WRn),
     .core_XTALoffn(core_XTALoffn)
);

assign	SCANIN1 = VC_SI[0];
assign	SCANIN2 = VC_SI[1];
assign	SCANIN3 = VC_SI[2];
assign	SCANIN4 = VC_SI[3];
assign	SCANIN5 = VC_SI[4];
assign	SCANIN6 = VC_SI[5];
assign	SCANIN7 = VC_SI[6];
assign	SCANIN8 = VC_SI[7];
assign	SCAN_ENABLE = SCAN_SHIFT;
assign	SCAN_TEST = VC_SCANMODE;
assign	core_T_CLKI_OSC = (VC_SCANMODE) ? TEST_CLK : T_CLKI_OSC;
assign	core_T_ICK = (VC_SCANMODE) ? TEST_CLK : T_ICK;
assign	core_T_RSTn = (VC_SCANMODE) ? ~TEST_RST : T_RSTn;
assign	core_T_SCLK0 = (VC_SCANMODE) ? TEST_CLK : T_SCLK0;
assign	core_T_SCLK1 = (VC_SCANMODE) ? TEST_CLK : T_SCLK1;
endmodule


module DSP_CORE_wrapper (
    CMAinx, CM_rd0, CM_rd1, CM_rd2, CM_rd3, CM_rd4, CM_rd5, CM_rd6, 
    CM_rd7, CM_rdm, CM_wd, DMAinx, DM_rd0, DM_rd1, DM_rd2, DM_rd3, 
    DM_rd4, DM_rd5, DM_rd6, DM_rd7, DM_rdm, DM_wd, EA_do, ED_do, IAD_do, 
    PIO_oe, PIO_out, PMAinx, PM_rd0, PM_rd1, PM_rd2, PM_rd3, PM_rd4, 
    PM_rd5, PM_rd6, PM_rd7, PM_wd, T_EA, T_ED, T_IAD, T_PIOin, T_TMODE, 
    VC_SI, VC_SO, core_CMAinx, core_CM_rd0, core_CM_rd1, core_CM_rd2, 
    core_CM_rd3, core_CM_rd4, core_CM_rd5, core_CM_rd6, core_CM_rd7, 
    core_CM_rdm, core_CM_wd, core_DMAinx, core_DM_rd0, core_DM_rd1, 
    core_DM_rd2, core_DM_rd3, core_DM_rd4, core_DM_rd5, core_DM_rd6, 
    core_DM_rd7, core_DM_rdm, core_DM_wd, core_EA_do, core_ED_do, 
    core_IAD_do, core_PIO_oe, core_PIO_out, core_PMAinx, core_PM_rd0, 
    core_PM_rd1, core_PM_rd2, core_PM_rd3, core_PM_rd4, core_PM_rd5, 
    core_PM_rd6, core_PM_rd7, core_PM_wd, core_T_EA, core_T_ED, 
    core_T_IAD, core_T_PIOin, core_T_TMODE, BGn, BMSn, CLKO, CMSn, 
    CM_cs, CM_oe, CM_web, CMo_cs0, CMo_cs1, CMo_cs2, CMo_cs3, CMo_cs4, 
    CMo_cs5, CMo_cs6, CMo_cs7, CMo_oe0, CMo_oe1, CMo_oe2, CMo_oe3, 
    CMo_oe4, CMo_oe5, CMo_oe6, CMo_oe7, DMSn, DM_cs, DM_oe, DMo_cs0, 
    DMo_cs1, DMo_cs2, DMo_cs3, DMo_cs4, DMo_cs5, DMo_cs6, DMo_cs7, 
    DMo_oe0, DMo_oe1, DMo_oe2, DMo_oe3, DMo_oe4, DMo_oe5, DMo_oe6, 
    DMo_oe7, DMo_web, DSPCLK_cm0, DSPCLK_cm1, DSPCLK_cm2, DSPCLK_dm0, 
    DSPCLK_dm1, DSPCLK_dm2, DSPCLK_pm0, DSPCLK_pm1, DSPCLK_pm2, EA_oe, 
    ECMA_EN, ECMSn, ED_oe_14_8, ED_oe_15, ED_oe_7_0, IACKn, IAD_oe, IDo, 
    IDoe, IOSn, IRFS0, IRFS1, ISCLK0, ISCLK1, ITFS0, ITFS1, PMSn, 
    PM_bdry_sel, PMo_cs0, PMo_cs1, PMo_cs2, PMo_cs3, PMo_cs4, PMo_cs5, 
    PMo_cs6, PMo_cs7, PMo_oe0, PMo_oe1, PMo_oe2, PMo_oe3, PMo_oe4, 
    PMo_oe5, PMo_oe6, PMo_oe7, PMo_web, PWDACK, RDn, RFS0, RFS1, 
    SCANOUT1, SCANOUT2, SCANOUT3, SCANOUT4, SCANOUT5, SCANOUT6, 
    SCANOUT7, SCANOUT8, SCAN_SHIFT, SCLK0, SCLK1, TCLK, TC_RESET, 
    TC_SHIFT, TC_SI, TC_SO, TC_UPDATE, TD0, TD1, TEST_CLK, TFS0, TFS1, 
    T_BMODE, T_BRn, T_CLKI_PLL, T_GOICE, T_IAL, T_ICE_RSTn, T_ID, T_IMS, 
    T_IRDn, T_IRQ0n, T_IRQ1n, T_IRQ2n, T_IRQE0n, T_IRQE1n, T_IRQL1n, 
    T_ISn, T_IWRn, T_MMAP, T_PWDn, T_RD0, T_RD1, T_RFS0, T_RFS1, 
    T_Sel_PLL, T_TFS0, T_TFS1, VC_SCANMODE, VC_SHIFT, WP_CLK, WP_SI, 
    WP_SO, WRn, XTALoffn, core_BGn, core_BMSn, core_CLKO, core_CMSn, 
    core_CM_cs, core_CM_oe, core_CM_web, core_CMo_cs0, core_CMo_cs1, 
    core_CMo_cs2, core_CMo_cs3, core_CMo_cs4, core_CMo_cs5, 
    core_CMo_cs6, core_CMo_cs7, core_CMo_oe0, core_CMo_oe1, 
    core_CMo_oe2, core_CMo_oe3, core_CMo_oe4, core_CMo_oe5, 
    core_CMo_oe6, core_CMo_oe7, core_DMSn, core_DM_cs, core_DM_oe, 
    core_DMo_cs0, core_DMo_cs1, core_DMo_cs2, core_DMo_cs3, 
    core_DMo_cs4, core_DMo_cs5, core_DMo_cs6, core_DMo_cs7, 
    core_DMo_oe0, core_DMo_oe1, core_DMo_oe2, core_DMo_oe3, 
    core_DMo_oe4, core_DMo_oe5, core_DMo_oe6, core_DMo_oe7, 
    core_DMo_web, core_DSPCLK_cm0, core_DSPCLK_cm1, core_DSPCLK_cm2, 
    core_DSPCLK_dm0, core_DSPCLK_dm1, core_DSPCLK_dm2, core_DSPCLK_pm0, 
    core_DSPCLK_pm1, core_DSPCLK_pm2, core_EA_oe, core_ECMA_EN, 
    core_ECMSn, core_ED_oe_14_8, core_ED_oe_15, core_ED_oe_7_0, 
    core_IACKn, core_IAD_oe, core_IDo, core_IDoe, core_IOSn, core_IRFS0, 
    core_IRFS1, core_ISCLK0, core_ISCLK1, core_ITFS0, core_ITFS1, 
    core_PMSn, core_PM_bdry_sel, core_PMo_cs0, core_PMo_cs1, 
    core_PMo_cs2, core_PMo_cs3, core_PMo_cs4, core_PMo_cs5, 
    core_PMo_cs6, core_PMo_cs7, core_PMo_oe0, core_PMo_oe1, 
    core_PMo_oe2, core_PMo_oe3, core_PMo_oe4, core_PMo_oe5, 
    core_PMo_oe6, core_PMo_oe7, core_PMo_web, core_PWDACK, core_RDn, 
    core_RFS0, core_RFS1, core_SCLK0, core_SCLK1, core_TD0, core_TD1, 
    core_TFS0, core_TFS1, core_T_BMODE, core_T_BRn, core_T_CLKI_PLL, 
    core_T_GOICE, core_T_IAL, core_T_ICE_RSTn, core_T_ID, core_T_IMS, 
    core_T_IRDn, core_T_IRQ0n, core_T_IRQ1n, core_T_IRQ2n, 
    core_T_IRQE0n, core_T_IRQE1n, core_T_IRQL1n, core_T_ISn, 
    core_T_IWRn, core_T_MMAP, core_T_PWDn, core_T_RD0, core_T_RD1, 
    core_T_RFS0, core_T_RFS1, core_T_Sel_PLL, core_T_TFS0, core_T_TFS1, 
    core_WRn, core_XTALoffn
);

input	[23:0]	CM_rd0;
input	[23:0]	CM_rd1;
input	[23:0]	CM_rd2;
input	[23:0]	CM_rd3;
input	[23:0]	CM_rd4;
input	[23:0]	CM_rd5;
input	[23:0]	CM_rd6;
input	[23:0]	CM_rd7;
input	[23:0]	CM_rdm;
input	[15:0]	DM_rd0;
input	[15:0]	DM_rd1;
input	[15:0]	DM_rd2;
input	[15:0]	DM_rd3;
input	[15:0]	DM_rd4;
input	[15:0]	DM_rd5;
input	[15:0]	DM_rd6;
input	[15:0]	DM_rd7;
input	[15:0]	DM_rdm;
input	[15:0]	PM_rd0;
input	[15:0]	PM_rd1;
input	[15:0]	PM_rd2;
input	[15:0]	PM_rd3;
input	[15:0]	PM_rd4;
input	[15:0]	PM_rd5;
input	[15:0]	PM_rd6;
input	[15:0]	PM_rd7;
input	[7:0]	T_EA;
input	[15:0]	T_ED;
input	[15:0]	T_IAD;
input	[11:0]	T_PIOin;
input	[1:0]	T_TMODE;
input	[7:0]	VC_SI;
input	[13:0]	core_CMAinx;
input	[23:0]	core_CM_wd;
input	[13:0]	core_DMAinx;
input	[15:0]	core_DM_wd;
input	[14:0]	core_EA_do;
input	[15:0]	core_ED_do;
input	[15:0]	core_IAD_do;
input	[11:0]	core_PIO_oe;
input	[11:0]	core_PIO_out;
input	[13:0]	core_PMAinx;
input	[15:0]	core_PM_wd;
input	PM_bdry_sel;
input	SCANOUT1;
input	SCANOUT2;
input	SCANOUT3;
input	SCANOUT4;
input	SCANOUT5;
input	SCANOUT6;
input	SCANOUT7;
input	SCANOUT8;
input	TCLK;
input	TC_RESET;
input	TC_SHIFT;
input	TC_SI;
input	TC_UPDATE;
input	TEST_CLK;
input	T_BMODE;
input	T_BRn;
input	T_CLKI_PLL;
input	T_GOICE;
input	T_IAL;
input	T_ICE_RSTn;
input	T_ID;
input	T_IMS;
input	T_IRDn;
input	T_IRQ0n;
input	T_IRQ1n;
input	T_IRQ2n;
input	T_IRQE0n;
input	T_IRQE1n;
input	T_IRQL1n;
input	T_ISn;
input	T_IWRn;
input	T_MMAP;
input	T_PWDn;
input	T_RD0;
input	T_RD1;
input	T_RFS0;
input	T_RFS1;
input	T_Sel_PLL;
input	T_TFS0;
input	T_TFS1;
input	VC_SHIFT;
input	WP_CLK;
input	WP_SI;
input	core_BGn;
input	core_BMSn;
input	core_CLKO;
input	core_CMSn;
input	core_CM_cs;
input	core_CM_oe;
input	core_CM_web;
input	core_CMo_cs0;
input	core_CMo_cs1;
input	core_CMo_cs2;
input	core_CMo_cs3;
input	core_CMo_cs4;
input	core_CMo_cs5;
input	core_CMo_cs6;
input	core_CMo_cs7;
input	core_CMo_oe0;
input	core_CMo_oe1;
input	core_CMo_oe2;
input	core_CMo_oe3;
input	core_CMo_oe4;
input	core_CMo_oe5;
input	core_CMo_oe6;
input	core_CMo_oe7;
input	core_DMSn;
input	core_DM_cs;
input	core_DM_oe;
input	core_DMo_cs0;
input	core_DMo_cs1;
input	core_DMo_cs2;
input	core_DMo_cs3;
input	core_DMo_cs4;
input	core_DMo_cs5;
input	core_DMo_cs6;
input	core_DMo_cs7;
input	core_DMo_oe0;
input	core_DMo_oe1;
input	core_DMo_oe2;
input	core_DMo_oe3;
input	core_DMo_oe4;
input	core_DMo_oe5;
input	core_DMo_oe6;
input	core_DMo_oe7;
input	core_DMo_web;
input	core_DSPCLK_cm0;
input	core_DSPCLK_cm1;
input	core_DSPCLK_cm2;
input	core_DSPCLK_dm0;
input	core_DSPCLK_dm1;
input	core_DSPCLK_dm2;
input	core_DSPCLK_pm0;
input	core_DSPCLK_pm1;
input	core_DSPCLK_pm2;
input	core_EA_oe;
input	core_ECMA_EN;
input	core_ECMSn;
input	core_ED_oe_14_8;
input	core_ED_oe_15;
input	core_ED_oe_7_0;
input	core_IACKn;
input	core_IAD_oe;
input	core_IDo;
input	core_IDoe;
input	core_IOSn;
input	core_IRFS0;
input	core_IRFS1;
input	core_ISCLK0;
input	core_ISCLK1;
input	core_ITFS0;
input	core_ITFS1;
input	core_PMSn;
input	core_PMo_cs0;
input	core_PMo_cs1;
input	core_PMo_cs2;
input	core_PMo_cs3;
input	core_PMo_cs4;
input	core_PMo_cs5;
input	core_PMo_cs6;
input	core_PMo_cs7;
input	core_PMo_oe0;
input	core_PMo_oe1;
input	core_PMo_oe2;
input	core_PMo_oe3;
input	core_PMo_oe4;
input	core_PMo_oe5;
input	core_PMo_oe6;
input	core_PMo_oe7;
input	core_PMo_web;
input	core_PWDACK;
input	core_RDn;
input	core_RFS0;
input	core_RFS1;
input	core_SCLK0;
input	core_SCLK1;
input	core_TD0;
input	core_TD1;
input	core_TFS0;
input	core_TFS1;
input	core_WRn;
input	core_XTALoffn;
output	[13:0]	CMAinx;
output	[23:0]	CM_wd;
output	[13:0]	DMAinx;
output	[15:0]	DM_wd;
output	[14:0]	EA_do;
output	[15:0]	ED_do;
output	[15:0]	IAD_do;
output	[11:0]	PIO_oe;
output	[11:0]	PIO_out;
output	[13:0]	PMAinx;
output	[15:0]	PM_wd;
output	[7:0]	VC_SO;
output	[23:0]	core_CM_rd0;
output	[23:0]	core_CM_rd1;
output	[23:0]	core_CM_rd2;
output	[23:0]	core_CM_rd3;
output	[23:0]	core_CM_rd4;
output	[23:0]	core_CM_rd5;
output	[23:0]	core_CM_rd6;
output	[23:0]	core_CM_rd7;
output	[23:0]	core_CM_rdm;
output	[15:0]	core_DM_rd0;
output	[15:0]	core_DM_rd1;
output	[15:0]	core_DM_rd2;
output	[15:0]	core_DM_rd3;
output	[15:0]	core_DM_rd4;
output	[15:0]	core_DM_rd5;
output	[15:0]	core_DM_rd6;
output	[15:0]	core_DM_rd7;
output	[15:0]	core_DM_rdm;
output	[15:0]	core_PM_rd0;
output	[15:0]	core_PM_rd1;
output	[15:0]	core_PM_rd2;
output	[15:0]	core_PM_rd3;
output	[15:0]	core_PM_rd4;
output	[15:0]	core_PM_rd5;
output	[15:0]	core_PM_rd6;
output	[15:0]	core_PM_rd7;
output	[7:0]	core_T_EA;
output	[15:0]	core_T_ED;
output	[15:0]	core_T_IAD;
output	[11:0]	core_T_PIOin;
output	[1:0]	core_T_TMODE;
output	BGn;
output	BMSn;
output	CLKO;
output	CMSn;
output	CM_cs;
output	CM_oe;
output	CM_web;
output	CMo_cs0;
output	CMo_cs1;
output	CMo_cs2;
output	CMo_cs3;
output	CMo_cs4;
output	CMo_cs5;
output	CMo_cs6;
output	CMo_cs7;
output	CMo_oe0;
output	CMo_oe1;
output	CMo_oe2;
output	CMo_oe3;
output	CMo_oe4;
output	CMo_oe5;
output	CMo_oe6;
output	CMo_oe7;
output	DMSn;
output	DM_cs;
output	DM_oe;
output	DMo_cs0;
output	DMo_cs1;
output	DMo_cs2;
output	DMo_cs3;
output	DMo_cs4;
output	DMo_cs5;
output	DMo_cs6;
output	DMo_cs7;
output	DMo_oe0;
output	DMo_oe1;
output	DMo_oe2;
output	DMo_oe3;
output	DMo_oe4;
output	DMo_oe5;
output	DMo_oe6;
output	DMo_oe7;
output	DMo_web;
output	DSPCLK_cm0;
output	DSPCLK_cm1;
output	DSPCLK_cm2;
output	DSPCLK_dm0;
output	DSPCLK_dm1;
output	DSPCLK_dm2;
output	DSPCLK_pm0;
output	DSPCLK_pm1;
output	DSPCLK_pm2;
output	EA_oe;
output	ECMA_EN;
output	ECMSn;
output	ED_oe_14_8;
output	ED_oe_15;
output	ED_oe_7_0;
output	IACKn;
output	IAD_oe;
output	IDo;
output	IDoe;
output	IOSn;
output	IRFS0;
output	IRFS1;
output	ISCLK0;
output	ISCLK1;
output	ITFS0;
output	ITFS1;
output	PMSn;
output	PMo_cs0;
output	PMo_cs1;
output	PMo_cs2;
output	PMo_cs3;
output	PMo_cs4;
output	PMo_cs5;
output	PMo_cs6;
output	PMo_cs7;
output	PMo_oe0;
output	PMo_oe1;
output	PMo_oe2;
output	PMo_oe3;
output	PMo_oe4;
output	PMo_oe5;
output	PMo_oe6;
output	PMo_oe7;
output	PMo_web;
output	PWDACK;
output	RDn;
output	RFS0;
output	RFS1;
output	SCAN_SHIFT;
output	SCLK0;
output	SCLK1;
output	TC_SO;
output	TD0;
output	TD1;
output	TFS0;
output	TFS1;
output	VC_SCANMODE;
output	WP_SO;
output	WRn;
output	XTALoffn;
output	core_PM_bdry_sel;
output	core_T_BMODE;
output	core_T_BRn;
output	core_T_CLKI_PLL;
output	core_T_GOICE;
output	core_T_IAL;
output	core_T_ICE_RSTn;
output	core_T_ID;
output	core_T_IMS;
output	core_T_IRDn;
output	core_T_IRQ0n;
output	core_T_IRQ1n;
output	core_T_IRQ2n;
output	core_T_IRQE0n;
output	core_T_IRQE1n;
output	core_T_IRQL1n;
output	core_T_ISn;
output	core_T_IWRn;
output	core_T_MMAP;
output	core_T_PWDn;
output	core_T_RD0;
output	core_T_RD1;
output	core_T_RFS0;
output	core_T_RFS1;
output	core_T_Sel_PLL;
output	core_T_TFS0;
output	core_T_TFS1;

wire	VC_SO_BYPASS_0, VC_SO_BYPASS_1, VC_SO_BYPASS_2, VC_SO_BYPASS_3, 
    VC_SO_BYPASS_4, VC_SO_BYPASS_5, VC_SO_BYPASS_6, VC_SO_BYPASS_7, 
    VC_SO_MAS_IN_0, WP_BP, WP_HOLD_IN, WP_HOLD_OUT, WP_SHIFT, 
    WP_SO_BYPASS, WP_SO_beforeskew;

DSP_CORE_tcb TCB (
    .SCAN_SHIFT(SCAN_SHIFT), .TCLK(TCLK), .TC_RESET(TC_RESET), 
    .TC_SHIFT(TC_SHIFT), .TC_SI(TC_SI), .TC_SO(TC_SO), .TC_UPDATE(TC_UPDATE), 
    .VC_SCANMODE(VC_SCANMODE), .VC_SHIFT(VC_SHIFT), .WP_BP(WP_BP), 
    .WP_HOLD_IN(WP_HOLD_IN), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_bypass_reg VC_SI_BYPASS_0 (
    .SI(VC_SI[0]), .SO_BYPASS(VC_SO_BYPASS_0), .TCLK(TEST_CLK)
);
DSP_CORE_vsia_tst_bypass_reg VC_SI_BYPASS_1 (
    .SI(VC_SI[1]), .SO_BYPASS(VC_SO_BYPASS_1), .TCLK(TEST_CLK)
);
DSP_CORE_vsia_tst_bypass_reg VC_SI_BYPASS_2 (
    .SI(VC_SI[2]), .SO_BYPASS(VC_SO_BYPASS_2), .TCLK(TEST_CLK)
);
DSP_CORE_vsia_tst_bypass_reg VC_SI_BYPASS_3 (
    .SI(VC_SI[3]), .SO_BYPASS(VC_SO_BYPASS_3), .TCLK(TEST_CLK)
);
DSP_CORE_vsia_tst_bypass_reg VC_SI_BYPASS_4 (
    .SI(VC_SI[4]), .SO_BYPASS(VC_SO_BYPASS_4), .TCLK(TEST_CLK)
);
DSP_CORE_vsia_tst_bypass_reg VC_SI_BYPASS_5 (
    .SI(VC_SI[5]), .SO_BYPASS(VC_SO_BYPASS_5), .TCLK(TEST_CLK)
);
DSP_CORE_vsia_tst_bypass_reg VC_SI_BYPASS_6 (
    .SI(VC_SI[6]), .SO_BYPASS(VC_SO_BYPASS_6), .TCLK(TEST_CLK)
);
DSP_CORE_vsia_tst_bypass_reg VC_SI_BYPASS_7 (
    .SI(VC_SI[7]), .SO_BYPASS(VC_SO_BYPASS_7), .TCLK(TEST_CLK)
);
DSP_CORE_vsia_tst_mas VC_SO_MAS_0 (
    .SO(VC_SO[0]), .SO_BYPASS(VC_SO_BYPASS_0), .SO_beforeskew(VC_SO_MAS_IN_0), 
    .TCLK(TEST_CLK), .WP_BP(WP_BP)
);
DSP_CORE_vsia_tst_mas VC_SO_MAS_1 (
    .SO(VC_SO[1]), .SO_BYPASS(VC_SO_BYPASS_1), .SO_beforeskew(SCANOUT2), 
    .TCLK(TEST_CLK), .WP_BP(WP_BP)
);
DSP_CORE_vsia_tst_mas VC_SO_MAS_2 (
    .SO(VC_SO[2]), .SO_BYPASS(VC_SO_BYPASS_2), .SO_beforeskew(SCANOUT3), 
    .TCLK(TEST_CLK), .WP_BP(WP_BP)
);
DSP_CORE_vsia_tst_mas VC_SO_MAS_3 (
    .SO(VC_SO[3]), .SO_BYPASS(VC_SO_BYPASS_3), .SO_beforeskew(SCANOUT4), 
    .TCLK(TEST_CLK), .WP_BP(WP_BP)
);
DSP_CORE_vsia_tst_mas VC_SO_MAS_4 (
    .SO(VC_SO[4]), .SO_BYPASS(VC_SO_BYPASS_4), .SO_beforeskew(SCANOUT5), 
    .TCLK(TEST_CLK), .WP_BP(WP_BP)
);
DSP_CORE_vsia_tst_mas VC_SO_MAS_5 (
    .SO(VC_SO[5]), .SO_BYPASS(VC_SO_BYPASS_5), .SO_beforeskew(SCANOUT6), 
    .TCLK(TEST_CLK), .WP_BP(WP_BP)
);
DSP_CORE_vsia_tst_mas VC_SO_MAS_6 (
    .SO(VC_SO[6]), .SO_BYPASS(VC_SO_BYPASS_6), .SO_beforeskew(SCANOUT7), 
    .TCLK(TEST_CLK), .WP_BP(WP_BP)
);
DSP_CORE_vsia_tst_mas VC_SO_MAS_7 (
    .SO(VC_SO[7]), .SO_BYPASS(VC_SO_BYPASS_7), .SO_beforeskew(SCANOUT8), 
    .TCLK(TEST_CLK), .WP_BP(WP_BP)
);
DSP_CORE_wpreg WPREG (
    .BGn(BGn), .BMSn(BMSn), .CLKO(CLKO), .CMAinx(CMAinx), .CMSn(CMSn), 
    .CM_cs(CM_cs), .CM_oe(CM_oe), .CM_rd0(CM_rd0), .CM_rd1(CM_rd1), 
    .CM_rd2(CM_rd2), .CM_rd3(CM_rd3), .CM_rd4(CM_rd4), .CM_rd5(CM_rd5), 
    .CM_rd6(CM_rd6), .CM_rd7(CM_rd7), .CM_rdm(CM_rdm), .CM_wd(CM_wd), 
    .CM_web(CM_web), .CMo_cs0(CMo_cs0), .CMo_cs1(CMo_cs1), .CMo_cs2(CMo_cs2), 
    .CMo_cs3(CMo_cs3), .CMo_cs4(CMo_cs4), .CMo_cs5(CMo_cs5), .CMo_cs6(CMo_cs6), 
    .CMo_cs7(CMo_cs7), .CMo_oe0(CMo_oe0), .CMo_oe1(CMo_oe1), .CMo_oe2(CMo_oe2), 
    .CMo_oe3(CMo_oe3), .CMo_oe4(CMo_oe4), .CMo_oe5(CMo_oe5), .CMo_oe6(CMo_oe6), 
    .CMo_oe7(CMo_oe7), .DMAinx(DMAinx), .DMSn(DMSn), .DM_cs(DM_cs), 
    .DM_oe(DM_oe), .DM_rd0(DM_rd0), .DM_rd1(DM_rd1), .DM_rd2(DM_rd2), 
    .DM_rd3(DM_rd3), .DM_rd4(DM_rd4), .DM_rd5(DM_rd5), .DM_rd6(DM_rd6), 
    .DM_rd7(DM_rd7), .DM_rdm(DM_rdm), .DM_wd(DM_wd), .DMo_cs0(DMo_cs0), 
    .DMo_cs1(DMo_cs1), .DMo_cs2(DMo_cs2), .DMo_cs3(DMo_cs3), .DMo_cs4(DMo_cs4), 
    .DMo_cs5(DMo_cs5), .DMo_cs6(DMo_cs6), .DMo_cs7(DMo_cs7), .DMo_oe0(DMo_oe0), 
    .DMo_oe1(DMo_oe1), .DMo_oe2(DMo_oe2), .DMo_oe3(DMo_oe3), .DMo_oe4(DMo_oe4), 
    .DMo_oe5(DMo_oe5), .DMo_oe6(DMo_oe6), .DMo_oe7(DMo_oe7), .DMo_web(DMo_web), 
    .DSPCLK_cm0(DSPCLK_cm0), .DSPCLK_cm1(DSPCLK_cm1), .DSPCLK_cm2(DSPCLK_cm2), 
    .DSPCLK_dm0(DSPCLK_dm0), .DSPCLK_dm1(DSPCLK_dm1), .DSPCLK_dm2(DSPCLK_dm2), 
    .DSPCLK_pm0(DSPCLK_pm0), .DSPCLK_pm1(DSPCLK_pm1), .DSPCLK_pm2(DSPCLK_pm2), 
    .EA_do(EA_do), .EA_oe(EA_oe), .ECMA_EN(ECMA_EN), .ECMSn(ECMSn), 
    .ED_do(ED_do), .ED_oe_14_8(ED_oe_14_8), .ED_oe_15(ED_oe_15), 
    .ED_oe_7_0(ED_oe_7_0), .IACKn(IACKn), .IAD_do(IAD_do), .IAD_oe(IAD_oe), 
    .IDo(IDo), .IDoe(IDoe), .IOSn(IOSn), .IRFS0(IRFS0), .IRFS1(IRFS1), 
    .ISCLK0(ISCLK0), .ISCLK1(ISCLK1), .ITFS0(ITFS0), .ITFS1(ITFS1), 
    .PIO_oe(PIO_oe), .PIO_out(PIO_out), .PMAinx(PMAinx), .PMSn(PMSn), 
    .PM_bdry_sel(PM_bdry_sel), .PM_rd0(PM_rd0), .PM_rd1(PM_rd1), 
    .PM_rd2(PM_rd2), .PM_rd3(PM_rd3), .PM_rd4(PM_rd4), .PM_rd5(PM_rd5), 
    .PM_rd6(PM_rd6), .PM_rd7(PM_rd7), .PM_wd(PM_wd), .PMo_cs0(PMo_cs0), 
    .PMo_cs1(PMo_cs1), .PMo_cs2(PMo_cs2), .PMo_cs3(PMo_cs3), .PMo_cs4(PMo_cs4), 
    .PMo_cs5(PMo_cs5), .PMo_cs6(PMo_cs6), .PMo_cs7(PMo_cs7), .PMo_oe0(PMo_oe0), 
    .PMo_oe1(PMo_oe1), .PMo_oe2(PMo_oe2), .PMo_oe3(PMo_oe3), .PMo_oe4(PMo_oe4), 
    .PMo_oe5(PMo_oe5), .PMo_oe6(PMo_oe6), .PMo_oe7(PMo_oe7), .PMo_web(PMo_web), 
    .PWDACK(PWDACK), .RDn(RDn), .RFS0(RFS0), .RFS1(RFS1), .SCLK0(SCLK0), 
    .SCLK1(SCLK1), .TD0(TD0), .TD1(TD1), .TFS0(TFS0), .TFS1(TFS1), 
    .T_BMODE(T_BMODE), .T_BRn(T_BRn), .T_CLKI_PLL(T_CLKI_PLL), .T_EA(T_EA), 
    .T_ED(T_ED), .T_GOICE(T_GOICE), .T_IAD(T_IAD), .T_IAL(T_IAL), 
    .T_ICE_RSTn(T_ICE_RSTn), .T_ID(T_ID), .T_IMS(T_IMS), .T_IRDn(T_IRDn), 
    .T_IRQ0n(T_IRQ0n), .T_IRQ1n(T_IRQ1n), .T_IRQ2n(T_IRQ2n), 
    .T_IRQE0n(T_IRQE0n), .T_IRQE1n(T_IRQE1n), .T_IRQL1n(T_IRQL1n), 
    .T_ISn(T_ISn), .T_IWRn(T_IWRn), .T_MMAP(T_MMAP), .T_PIOin(T_PIOin), 
    .T_PWDn(T_PWDn), .T_RD0(T_RD0), .T_RD1(T_RD1), .T_RFS0(T_RFS0), 
    .T_RFS1(T_RFS1), .T_Sel_PLL(T_Sel_PLL), .T_TFS0(T_TFS0), .T_TFS1(T_TFS1), 
    .T_TMODE(T_TMODE), .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), 
    .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT), .WP_SI(WP_SI), 
    .WP_SO_beforeskew(WP_SO_beforeskew), .WRn(WRn), .XTALoffn(XTALoffn), 
    .core_BGn(core_BGn), .core_BMSn(core_BMSn), .core_CLKO(core_CLKO), 
    .core_CMAinx(core_CMAinx), .core_CMSn(core_CMSn), .core_CM_cs(core_CM_cs), 
    .core_CM_oe(core_CM_oe), .core_CM_rd0(core_CM_rd0), 
    .core_CM_rd1(core_CM_rd1), .core_CM_rd2(core_CM_rd2), 
    .core_CM_rd3(core_CM_rd3), .core_CM_rd4(core_CM_rd4), 
    .core_CM_rd5(core_CM_rd5), .core_CM_rd6(core_CM_rd6), 
    .core_CM_rd7(core_CM_rd7), .core_CM_rdm(core_CM_rdm), 
    .core_CM_wd(core_CM_wd), .core_CM_web(core_CM_web), 
    .core_CMo_cs0(core_CMo_cs0), .core_CMo_cs1(core_CMo_cs1), 
    .core_CMo_cs2(core_CMo_cs2), .core_CMo_cs3(core_CMo_cs3), 
    .core_CMo_cs4(core_CMo_cs4), .core_CMo_cs5(core_CMo_cs5), 
    .core_CMo_cs6(core_CMo_cs6), .core_CMo_cs7(core_CMo_cs7), 
    .core_CMo_oe0(core_CMo_oe0), .core_CMo_oe1(core_CMo_oe1), 
    .core_CMo_oe2(core_CMo_oe2), .core_CMo_oe3(core_CMo_oe3), 
    .core_CMo_oe4(core_CMo_oe4), .core_CMo_oe5(core_CMo_oe5), 
    .core_CMo_oe6(core_CMo_oe6), .core_CMo_oe7(core_CMo_oe7), 
    .core_DMAinx(core_DMAinx), .core_DMSn(core_DMSn), .core_DM_cs(core_DM_cs), 
    .core_DM_oe(core_DM_oe), .core_DM_rd0(core_DM_rd0), 
    .core_DM_rd1(core_DM_rd1), .core_DM_rd2(core_DM_rd2), 
    .core_DM_rd3(core_DM_rd3), .core_DM_rd4(core_DM_rd4), 
    .core_DM_rd5(core_DM_rd5), .core_DM_rd6(core_DM_rd6), 
    .core_DM_rd7(core_DM_rd7), .core_DM_rdm(core_DM_rdm), 
    .core_DM_wd(core_DM_wd), .core_DMo_cs0(core_DMo_cs0), 
    .core_DMo_cs1(core_DMo_cs1), .core_DMo_cs2(core_DMo_cs2), 
    .core_DMo_cs3(core_DMo_cs3), .core_DMo_cs4(core_DMo_cs4), 
    .core_DMo_cs5(core_DMo_cs5), .core_DMo_cs6(core_DMo_cs6), 
    .core_DMo_cs7(core_DMo_cs7), .core_DMo_oe0(core_DMo_oe0), 
    .core_DMo_oe1(core_DMo_oe1), .core_DMo_oe2(core_DMo_oe2), 
    .core_DMo_oe3(core_DMo_oe3), .core_DMo_oe4(core_DMo_oe4), 
    .core_DMo_oe5(core_DMo_oe5), .core_DMo_oe6(core_DMo_oe6), 
    .core_DMo_oe7(core_DMo_oe7), .core_DMo_web(core_DMo_web), 
    .core_DSPCLK_cm0(core_DSPCLK_cm0), .core_DSPCLK_cm1(core_DSPCLK_cm1), 
    .core_DSPCLK_cm2(core_DSPCLK_cm2), .core_DSPCLK_dm0(core_DSPCLK_dm0), 
    .core_DSPCLK_dm1(core_DSPCLK_dm1), .core_DSPCLK_dm2(core_DSPCLK_dm2), 
    .core_DSPCLK_pm0(core_DSPCLK_pm0), .core_DSPCLK_pm1(core_DSPCLK_pm1), 
    .core_DSPCLK_pm2(core_DSPCLK_pm2), .core_EA_do(core_EA_do), 
    .core_EA_oe(core_EA_oe), .core_ECMA_EN(core_ECMA_EN), 
    .core_ECMSn(core_ECMSn), .core_ED_do(core_ED_do), 
    .core_ED_oe_14_8(core_ED_oe_14_8), .core_ED_oe_15(core_ED_oe_15), 
    .core_ED_oe_7_0(core_ED_oe_7_0), .core_IACKn(core_IACKn), 
    .core_IAD_do(core_IAD_do), .core_IAD_oe(core_IAD_oe), .core_IDo(core_IDo), 
    .core_IDoe(core_IDoe), .core_IOSn(core_IOSn), .core_IRFS0(core_IRFS0), 
    .core_IRFS1(core_IRFS1), .core_ISCLK0(core_ISCLK0), 
    .core_ISCLK1(core_ISCLK1), .core_ITFS0(core_ITFS0), .core_ITFS1(core_ITFS1),
     .core_PIO_oe(core_PIO_oe), .core_PIO_out(core_PIO_out), 
    .core_PMAinx(core_PMAinx), .core_PMSn(core_PMSn), 
    .core_PM_bdry_sel(core_PM_bdry_sel), .core_PM_rd0(core_PM_rd0), 
    .core_PM_rd1(core_PM_rd1), .core_PM_rd2(core_PM_rd2), 
    .core_PM_rd3(core_PM_rd3), .core_PM_rd4(core_PM_rd4), 
    .core_PM_rd5(core_PM_rd5), .core_PM_rd6(core_PM_rd6), 
    .core_PM_rd7(core_PM_rd7), .core_PM_wd(core_PM_wd), 
    .core_PMo_cs0(core_PMo_cs0), .core_PMo_cs1(core_PMo_cs1), 
    .core_PMo_cs2(core_PMo_cs2), .core_PMo_cs3(core_PMo_cs3), 
    .core_PMo_cs4(core_PMo_cs4), .core_PMo_cs5(core_PMo_cs5), 
    .core_PMo_cs6(core_PMo_cs6), .core_PMo_cs7(core_PMo_cs7), 
    .core_PMo_oe0(core_PMo_oe0), .core_PMo_oe1(core_PMo_oe1), 
    .core_PMo_oe2(core_PMo_oe2), .core_PMo_oe3(core_PMo_oe3), 
    .core_PMo_oe4(core_PMo_oe4), .core_PMo_oe5(core_PMo_oe5), 
    .core_PMo_oe6(core_PMo_oe6), .core_PMo_oe7(core_PMo_oe7), 
    .core_PMo_web(core_PMo_web), .core_PWDACK(core_PWDACK), .core_RDn(core_RDn),
     .core_RFS0(core_RFS0), .core_RFS1(core_RFS1), .core_SCLK0(core_SCLK0), 
    .core_SCLK1(core_SCLK1), .core_TD0(core_TD0), .core_TD1(core_TD1), 
    .core_TFS0(core_TFS0), .core_TFS1(core_TFS1), .core_T_BMODE(core_T_BMODE), 
    .core_T_BRn(core_T_BRn), .core_T_CLKI_PLL(core_T_CLKI_PLL), 
    .core_T_EA(core_T_EA), .core_T_ED(core_T_ED), .core_T_GOICE(core_T_GOICE), 
    .core_T_IAD(core_T_IAD), .core_T_IAL(core_T_IAL), 
    .core_T_ICE_RSTn(core_T_ICE_RSTn), .core_T_ID(core_T_ID), 
    .core_T_IMS(core_T_IMS), .core_T_IRDn(core_T_IRDn), 
    .core_T_IRQ0n(core_T_IRQ0n), .core_T_IRQ1n(core_T_IRQ1n), 
    .core_T_IRQ2n(core_T_IRQ2n), .core_T_IRQE0n(core_T_IRQE0n), 
    .core_T_IRQE1n(core_T_IRQE1n), .core_T_IRQL1n(core_T_IRQL1n), 
    .core_T_ISn(core_T_ISn), .core_T_IWRn(core_T_IWRn), 
    .core_T_MMAP(core_T_MMAP), .core_T_PIOin(core_T_PIOin), 
    .core_T_PWDn(core_T_PWDn), .core_T_RD0(core_T_RD0), .core_T_RD1(core_T_RD1),
     .core_T_RFS0(core_T_RFS0), .core_T_RFS1(core_T_RFS1), 
    .core_T_Sel_PLL(core_T_Sel_PLL), .core_T_TFS0(core_T_TFS0), 
    .core_T_TFS1(core_T_TFS1), .core_T_TMODE(core_T_TMODE), .core_WRn(core_WRn),
     .core_XTALoffn(core_XTALoffn)
);
DSP_CORE_vsia_tst_bypass_reg WP_SI_BYPASS (
    .SI(WP_SI), .SO_BYPASS(WP_SO_BYPASS), .TCLK(WP_CLK)
);
DSP_CORE_vsia_tst_mas WP_SO_MAS (
    .SO(WP_SO), .SO_BYPASS(WP_SO_BYPASS), .SO_beforeskew(WP_SO_beforeskew), 
    .TCLK(WP_CLK), .WP_BP(WP_BP)
);

assign	VC_SO_MAS_IN_0 = SCANOUT1;
endmodule


module DSP_CORE_tcb (
    SCAN_SHIFT, TCLK, TC_RESET, TC_SHIFT, TC_SI, TC_SO, TC_UPDATE, 
    VC_SCANMODE, VC_SHIFT, WP_BP, WP_HOLD_IN, WP_HOLD_OUT, WP_SHIFT
);

input	TCLK;
input	TC_RESET;
input	TC_SHIFT;
input	TC_SI;
input	TC_UPDATE;
input	VC_SHIFT;
output	SCAN_SHIFT;
output	TC_SO;
output	VC_SCANMODE;
output	WP_BP;
output	WP_HOLD_IN;
output	WP_HOLD_OUT;
output	WP_SHIFT;

wire	WP_SHIFTMODE, tcb_s_0, tcb_s_1, tcb_s_2, tcb_s_3, tcb_s_4, tcb_s_5;

DSP_CORE_vsia_tst_antiskew TC_SO_antiskew (
    .SI(tcb_s_5), .SO(TC_SO), .TCLK(TCLK)
);
DSP_CORE_vsia_tst_tcb_cell tcb_TCB_VC_SCANMODE (
    .DO(VC_SCANMODE), .SI(tcb_s_4), .SO(tcb_s_5), .TCLK(TCLK), 
    .TC_RESET(TC_RESET), .TC_SHIFT(TC_SHIFT), .TC_UPDATE(TC_UPDATE)
);
DSP_CORE_vsia_tst_tcb_cell tcb_TCB_WP_BP (
    .DO(WP_BP), .SI(tcb_s_2), .SO(tcb_s_3), .TCLK(TCLK), .TC_RESET(TC_RESET), 
    .TC_SHIFT(TC_SHIFT), .TC_UPDATE(TC_UPDATE)
);
DSP_CORE_vsia_tst_tcb_cell tcb_TCB_WP_HOLD_IN (
    .DO(WP_HOLD_IN), .SI(tcb_s_0), .SO(tcb_s_1), .TCLK(TCLK), 
    .TC_RESET(TC_RESET), .TC_SHIFT(TC_SHIFT), .TC_UPDATE(TC_UPDATE)
);
DSP_CORE_vsia_tst_tcb_cell tcb_TCB_WP_HOLD_OUT (
    .DO(WP_HOLD_OUT), .SI(tcb_s_1), .SO(tcb_s_2), .TCLK(TCLK), 
    .TC_RESET(TC_RESET), .TC_SHIFT(TC_SHIFT), .TC_UPDATE(TC_UPDATE)
);
DSP_CORE_vsia_tst_tcb_cell tcb_TCB_WP_SHIFTMODE (
    .DO(WP_SHIFTMODE), .SI(tcb_s_3), .SO(tcb_s_4), .TCLK(TCLK), 
    .TC_RESET(TC_RESET), .TC_SHIFT(TC_SHIFT), .TC_UPDATE(TC_UPDATE)
);

assign	SCAN_SHIFT = VC_SCANMODE & VC_SHIFT;
assign	WP_SHIFT = WP_SHIFTMODE & VC_SHIFT;
assign	tcb_s_0 = TC_SI;
endmodule


module DSP_CORE_wpreg (
    CMAinx, CM_rd0, CM_rd1, CM_rd2, CM_rd3, CM_rd4, CM_rd5, CM_rd6, 
    CM_rd7, CM_rdm, CM_wd, DMAinx, DM_rd0, DM_rd1, DM_rd2, DM_rd3, 
    DM_rd4, DM_rd5, DM_rd6, DM_rd7, DM_rdm, DM_wd, EA_do, ED_do, IAD_do, 
    PIO_oe, PIO_out, PMAinx, PM_rd0, PM_rd1, PM_rd2, PM_rd3, PM_rd4, 
    PM_rd5, PM_rd6, PM_rd7, PM_wd, T_EA, T_ED, T_IAD, T_PIOin, T_TMODE, 
    core_CMAinx, core_CM_rd0, core_CM_rd1, core_CM_rd2, core_CM_rd3, 
    core_CM_rd4, core_CM_rd5, core_CM_rd6, core_CM_rd7, core_CM_rdm, 
    core_CM_wd, core_DMAinx, core_DM_rd0, core_DM_rd1, core_DM_rd2, 
    core_DM_rd3, core_DM_rd4, core_DM_rd5, core_DM_rd6, core_DM_rd7, 
    core_DM_rdm, core_DM_wd, core_EA_do, core_ED_do, core_IAD_do, 
    core_PIO_oe, core_PIO_out, core_PMAinx, core_PM_rd0, core_PM_rd1, 
    core_PM_rd2, core_PM_rd3, core_PM_rd4, core_PM_rd5, core_PM_rd6, 
    core_PM_rd7, core_PM_wd, core_T_EA, core_T_ED, core_T_IAD, 
    core_T_PIOin, core_T_TMODE, BGn, BMSn, CLKO, CMSn, CM_cs, CM_oe, 
    CM_web, CMo_cs0, CMo_cs1, CMo_cs2, CMo_cs3, CMo_cs4, CMo_cs5, 
    CMo_cs6, CMo_cs7, CMo_oe0, CMo_oe1, CMo_oe2, CMo_oe3, CMo_oe4, 
    CMo_oe5, CMo_oe6, CMo_oe7, DMSn, DM_cs, DM_oe, DMo_cs0, DMo_cs1, 
    DMo_cs2, DMo_cs3, DMo_cs4, DMo_cs5, DMo_cs6, DMo_cs7, DMo_oe0, 
    DMo_oe1, DMo_oe2, DMo_oe3, DMo_oe4, DMo_oe5, DMo_oe6, DMo_oe7, 
    DMo_web, DSPCLK_cm0, DSPCLK_cm1, DSPCLK_cm2, DSPCLK_dm0, DSPCLK_dm1, 
    DSPCLK_dm2, DSPCLK_pm0, DSPCLK_pm1, DSPCLK_pm2, EA_oe, ECMA_EN, 
    ECMSn, ED_oe_14_8, ED_oe_15, ED_oe_7_0, IACKn, IAD_oe, IDo, IDoe, 
    IOSn, IRFS0, IRFS1, ISCLK0, ISCLK1, ITFS0, ITFS1, PMSn, PM_bdry_sel, 
    PMo_cs0, PMo_cs1, PMo_cs2, PMo_cs3, PMo_cs4, PMo_cs5, PMo_cs6, 
    PMo_cs7, PMo_oe0, PMo_oe1, PMo_oe2, PMo_oe3, PMo_oe4, PMo_oe5, 
    PMo_oe6, PMo_oe7, PMo_web, PWDACK, RDn, RFS0, RFS1, SCLK0, SCLK1, 
    TD0, TD1, TFS0, TFS1, T_BMODE, T_BRn, T_CLKI_PLL, T_GOICE, T_IAL, 
    T_ICE_RSTn, T_ID, T_IMS, T_IRDn, T_IRQ0n, T_IRQ1n, T_IRQ2n, 
    T_IRQE0n, T_IRQE1n, T_IRQL1n, T_ISn, T_IWRn, T_MMAP, T_PWDn, T_RD0, 
    T_RD1, T_RFS0, T_RFS1, T_Sel_PLL, T_TFS0, T_TFS1, WP_CLK, 
    WP_HOLD_IN, WP_HOLD_OUT, WP_SHIFT, WP_SI, WP_SO_beforeskew, WRn, 
    XTALoffn, core_BGn, core_BMSn, core_CLKO, core_CMSn, core_CM_cs, 
    core_CM_oe, core_CM_web, core_CMo_cs0, core_CMo_cs1, core_CMo_cs2, 
    core_CMo_cs3, core_CMo_cs4, core_CMo_cs5, core_CMo_cs6, 
    core_CMo_cs7, core_CMo_oe0, core_CMo_oe1, core_CMo_oe2, 
    core_CMo_oe3, core_CMo_oe4, core_CMo_oe5, core_CMo_oe6, 
    core_CMo_oe7, core_DMSn, core_DM_cs, core_DM_oe, core_DMo_cs0, 
    core_DMo_cs1, core_DMo_cs2, core_DMo_cs3, core_DMo_cs4, 
    core_DMo_cs5, core_DMo_cs6, core_DMo_cs7, core_DMo_oe0, 
    core_DMo_oe1, core_DMo_oe2, core_DMo_oe3, core_DMo_oe4, 
    core_DMo_oe5, core_DMo_oe6, core_DMo_oe7, core_DMo_web, 
    core_DSPCLK_cm0, core_DSPCLK_cm1, core_DSPCLK_cm2, core_DSPCLK_dm0, 
    core_DSPCLK_dm1, core_DSPCLK_dm2, core_DSPCLK_pm0, core_DSPCLK_pm1, 
    core_DSPCLK_pm2, core_EA_oe, core_ECMA_EN, core_ECMSn, 
    core_ED_oe_14_8, core_ED_oe_15, core_ED_oe_7_0, core_IACKn, 
    core_IAD_oe, core_IDo, core_IDoe, core_IOSn, core_IRFS0, core_IRFS1, 
    core_ISCLK0, core_ISCLK1, core_ITFS0, core_ITFS1, core_PMSn, 
    core_PM_bdry_sel, core_PMo_cs0, core_PMo_cs1, core_PMo_cs2, 
    core_PMo_cs3, core_PMo_cs4, core_PMo_cs5, core_PMo_cs6, 
    core_PMo_cs7, core_PMo_oe0, core_PMo_oe1, core_PMo_oe2, 
    core_PMo_oe3, core_PMo_oe4, core_PMo_oe5, core_PMo_oe6, 
    core_PMo_oe7, core_PMo_web, core_PWDACK, core_RDn, core_RFS0, 
    core_RFS1, core_SCLK0, core_SCLK1, core_TD0, core_TD1, core_TFS0, 
    core_TFS1, core_T_BMODE, core_T_BRn, core_T_CLKI_PLL, core_T_GOICE, 
    core_T_IAL, core_T_ICE_RSTn, core_T_ID, core_T_IMS, core_T_IRDn, 
    core_T_IRQ0n, core_T_IRQ1n, core_T_IRQ2n, core_T_IRQE0n, 
    core_T_IRQE1n, core_T_IRQL1n, core_T_ISn, core_T_IWRn, core_T_MMAP, 
    core_T_PWDn, core_T_RD0, core_T_RD1, core_T_RFS0, core_T_RFS1, 
    core_T_Sel_PLL, core_T_TFS0, core_T_TFS1, core_WRn, core_XTALoffn
);

input	[23:0]	CM_rd0;
input	[23:0]	CM_rd1;
input	[23:0]	CM_rd2;
input	[23:0]	CM_rd3;
input	[23:0]	CM_rd4;
input	[23:0]	CM_rd5;
input	[23:0]	CM_rd6;
input	[23:0]	CM_rd7;
input	[23:0]	CM_rdm;
input	[15:0]	DM_rd0;
input	[15:0]	DM_rd1;
input	[15:0]	DM_rd2;
input	[15:0]	DM_rd3;
input	[15:0]	DM_rd4;
input	[15:0]	DM_rd5;
input	[15:0]	DM_rd6;
input	[15:0]	DM_rd7;
input	[15:0]	DM_rdm;
input	[15:0]	PM_rd0;
input	[15:0]	PM_rd1;
input	[15:0]	PM_rd2;
input	[15:0]	PM_rd3;
input	[15:0]	PM_rd4;
input	[15:0]	PM_rd5;
input	[15:0]	PM_rd6;
input	[15:0]	PM_rd7;
input	[7:0]	T_EA;
input	[15:0]	T_ED;
input	[15:0]	T_IAD;
input	[11:0]	T_PIOin;
input	[1:0]	T_TMODE;
input	[13:0]	core_CMAinx;
input	[23:0]	core_CM_wd;
input	[13:0]	core_DMAinx;
input	[15:0]	core_DM_wd;
input	[14:0]	core_EA_do;
input	[15:0]	core_ED_do;
input	[15:0]	core_IAD_do;
input	[11:0]	core_PIO_oe;
input	[11:0]	core_PIO_out;
input	[13:0]	core_PMAinx;
input	[15:0]	core_PM_wd;
input	PM_bdry_sel;
input	T_BMODE;
input	T_BRn;
input	T_CLKI_PLL;
input	T_GOICE;
input	T_IAL;
input	T_ICE_RSTn;
input	T_ID;
input	T_IMS;
input	T_IRDn;
input	T_IRQ0n;
input	T_IRQ1n;
input	T_IRQ2n;
input	T_IRQE0n;
input	T_IRQE1n;
input	T_IRQL1n;
input	T_ISn;
input	T_IWRn;
input	T_MMAP;
input	T_PWDn;
input	T_RD0;
input	T_RD1;
input	T_RFS0;
input	T_RFS1;
input	T_Sel_PLL;
input	T_TFS0;
input	T_TFS1;
input	WP_CLK;
input	WP_HOLD_IN;
input	WP_HOLD_OUT;
input	WP_SHIFT;
input	WP_SI;
input	core_BGn;
input	core_BMSn;
input	core_CLKO;
input	core_CMSn;
input	core_CM_cs;
input	core_CM_oe;
input	core_CM_web;
input	core_CMo_cs0;
input	core_CMo_cs1;
input	core_CMo_cs2;
input	core_CMo_cs3;
input	core_CMo_cs4;
input	core_CMo_cs5;
input	core_CMo_cs6;
input	core_CMo_cs7;
input	core_CMo_oe0;
input	core_CMo_oe1;
input	core_CMo_oe2;
input	core_CMo_oe3;
input	core_CMo_oe4;
input	core_CMo_oe5;
input	core_CMo_oe6;
input	core_CMo_oe7;
input	core_DMSn;
input	core_DM_cs;
input	core_DM_oe;
input	core_DMo_cs0;
input	core_DMo_cs1;
input	core_DMo_cs2;
input	core_DMo_cs3;
input	core_DMo_cs4;
input	core_DMo_cs5;
input	core_DMo_cs6;
input	core_DMo_cs7;
input	core_DMo_oe0;
input	core_DMo_oe1;
input	core_DMo_oe2;
input	core_DMo_oe3;
input	core_DMo_oe4;
input	core_DMo_oe5;
input	core_DMo_oe6;
input	core_DMo_oe7;
input	core_DMo_web;
input	core_DSPCLK_cm0;
input	core_DSPCLK_cm1;
input	core_DSPCLK_cm2;
input	core_DSPCLK_dm0;
input	core_DSPCLK_dm1;
input	core_DSPCLK_dm2;
input	core_DSPCLK_pm0;
input	core_DSPCLK_pm1;
input	core_DSPCLK_pm2;
input	core_EA_oe;
input	core_ECMA_EN;
input	core_ECMSn;
input	core_ED_oe_14_8;
input	core_ED_oe_15;
input	core_ED_oe_7_0;
input	core_IACKn;
input	core_IAD_oe;
input	core_IDo;
input	core_IDoe;
input	core_IOSn;
input	core_IRFS0;
input	core_IRFS1;
input	core_ISCLK0;
input	core_ISCLK1;
input	core_ITFS0;
input	core_ITFS1;
input	core_PMSn;
input	core_PMo_cs0;
input	core_PMo_cs1;
input	core_PMo_cs2;
input	core_PMo_cs3;
input	core_PMo_cs4;
input	core_PMo_cs5;
input	core_PMo_cs6;
input	core_PMo_cs7;
input	core_PMo_oe0;
input	core_PMo_oe1;
input	core_PMo_oe2;
input	core_PMo_oe3;
input	core_PMo_oe4;
input	core_PMo_oe5;
input	core_PMo_oe6;
input	core_PMo_oe7;
input	core_PMo_web;
input	core_PWDACK;
input	core_RDn;
input	core_RFS0;
input	core_RFS1;
input	core_SCLK0;
input	core_SCLK1;
input	core_TD0;
input	core_TD1;
input	core_TFS0;
input	core_TFS1;
input	core_WRn;
input	core_XTALoffn;
output	[13:0]	CMAinx;
output	[23:0]	CM_wd;
output	[13:0]	DMAinx;
output	[15:0]	DM_wd;
output	[14:0]	EA_do;
output	[15:0]	ED_do;
output	[15:0]	IAD_do;
output	[11:0]	PIO_oe;
output	[11:0]	PIO_out;
output	[13:0]	PMAinx;
output	[15:0]	PM_wd;
output	[23:0]	core_CM_rd0;
output	[23:0]	core_CM_rd1;
output	[23:0]	core_CM_rd2;
output	[23:0]	core_CM_rd3;
output	[23:0]	core_CM_rd4;
output	[23:0]	core_CM_rd5;
output	[23:0]	core_CM_rd6;
output	[23:0]	core_CM_rd7;
output	[23:0]	core_CM_rdm;
output	[15:0]	core_DM_rd0;
output	[15:0]	core_DM_rd1;
output	[15:0]	core_DM_rd2;
output	[15:0]	core_DM_rd3;
output	[15:0]	core_DM_rd4;
output	[15:0]	core_DM_rd5;
output	[15:0]	core_DM_rd6;
output	[15:0]	core_DM_rd7;
output	[15:0]	core_DM_rdm;
output	[15:0]	core_PM_rd0;
output	[15:0]	core_PM_rd1;
output	[15:0]	core_PM_rd2;
output	[15:0]	core_PM_rd3;
output	[15:0]	core_PM_rd4;
output	[15:0]	core_PM_rd5;
output	[15:0]	core_PM_rd6;
output	[15:0]	core_PM_rd7;
output	[7:0]	core_T_EA;
output	[15:0]	core_T_ED;
output	[15:0]	core_T_IAD;
output	[11:0]	core_T_PIOin;
output	[1:0]	core_T_TMODE;
output	BGn;
output	BMSn;
output	CLKO;
output	CMSn;
output	CM_cs;
output	CM_oe;
output	CM_web;
output	CMo_cs0;
output	CMo_cs1;
output	CMo_cs2;
output	CMo_cs3;
output	CMo_cs4;
output	CMo_cs5;
output	CMo_cs6;
output	CMo_cs7;
output	CMo_oe0;
output	CMo_oe1;
output	CMo_oe2;
output	CMo_oe3;
output	CMo_oe4;
output	CMo_oe5;
output	CMo_oe6;
output	CMo_oe7;
output	DMSn;
output	DM_cs;
output	DM_oe;
output	DMo_cs0;
output	DMo_cs1;
output	DMo_cs2;
output	DMo_cs3;
output	DMo_cs4;
output	DMo_cs5;
output	DMo_cs6;
output	DMo_cs7;
output	DMo_oe0;
output	DMo_oe1;
output	DMo_oe2;
output	DMo_oe3;
output	DMo_oe4;
output	DMo_oe5;
output	DMo_oe6;
output	DMo_oe7;
output	DMo_web;
output	DSPCLK_cm0;
output	DSPCLK_cm1;
output	DSPCLK_cm2;
output	DSPCLK_dm0;
output	DSPCLK_dm1;
output	DSPCLK_dm2;
output	DSPCLK_pm0;
output	DSPCLK_pm1;
output	DSPCLK_pm2;
output	EA_oe;
output	ECMA_EN;
output	ECMSn;
output	ED_oe_14_8;
output	ED_oe_15;
output	ED_oe_7_0;
output	IACKn;
output	IAD_oe;
output	IDo;
output	IDoe;
output	IOSn;
output	IRFS0;
output	IRFS1;
output	ISCLK0;
output	ISCLK1;
output	ITFS0;
output	ITFS1;
output	PMSn;
output	PMo_cs0;
output	PMo_cs1;
output	PMo_cs2;
output	PMo_cs3;
output	PMo_cs4;
output	PMo_cs5;
output	PMo_cs6;
output	PMo_cs7;
output	PMo_oe0;
output	PMo_oe1;
output	PMo_oe2;
output	PMo_oe3;
output	PMo_oe4;
output	PMo_oe5;
output	PMo_oe6;
output	PMo_oe7;
output	PMo_web;
output	PWDACK;
output	RDn;
output	RFS0;
output	RFS1;
output	SCLK0;
output	SCLK1;
output	TD0;
output	TD1;
output	TFS0;
output	TFS1;
output	WP_SO_beforeskew;
output	WRn;
output	XTALoffn;
output	core_PM_bdry_sel;
output	core_T_BMODE;
output	core_T_BRn;
output	core_T_CLKI_PLL;
output	core_T_GOICE;
output	core_T_IAL;
output	core_T_ICE_RSTn;
output	core_T_ID;
output	core_T_IMS;
output	core_T_IRDn;
output	core_T_IRQ0n;
output	core_T_IRQ1n;
output	core_T_IRQ2n;
output	core_T_IRQE0n;
output	core_T_IRQE1n;
output	core_T_IRQL1n;
output	core_T_ISn;
output	core_T_IWRn;
output	core_T_MMAP;
output	core_T_PWDn;
output	core_T_RD0;
output	core_T_RD1;
output	core_T_RFS0;
output	core_T_RFS1;
output	core_T_Sel_PLL;
output	core_T_TFS0;
output	core_T_TFS1;

wire	wp_s_0, wp_s_1, wp_s_10, wp_s_100, wp_s_101, wp_s_102, wp_s_103, 
    wp_s_104, wp_s_105, wp_s_106, wp_s_107, wp_s_108, wp_s_109, wp_s_11,
     wp_s_110, wp_s_111, wp_s_112, wp_s_113, wp_s_114, wp_s_115, 
    wp_s_116, wp_s_117, wp_s_118, wp_s_119, wp_s_12, wp_s_120, wp_s_121,
     wp_s_122, wp_s_123, wp_s_124, wp_s_125, wp_s_126, wp_s_127, 
    wp_s_128, wp_s_129, wp_s_13, wp_s_130, wp_s_131, wp_s_132, wp_s_133,
     wp_s_134, wp_s_135, wp_s_136, wp_s_137, wp_s_138, wp_s_139, 
    wp_s_14, wp_s_140, wp_s_141, wp_s_142, wp_s_143, wp_s_144, wp_s_145,
     wp_s_146, wp_s_147, wp_s_148, wp_s_149, wp_s_15, wp_s_150, 
    wp_s_151, wp_s_152, wp_s_153, wp_s_154, wp_s_155, wp_s_156, 
    wp_s_157, wp_s_158, wp_s_159, wp_s_16, wp_s_160, wp_s_161, wp_s_162,
     wp_s_163, wp_s_164, wp_s_165, wp_s_166, wp_s_167, wp_s_168, 
    wp_s_169, wp_s_17, wp_s_170, wp_s_171, wp_s_172, wp_s_173, wp_s_174,
     wp_s_175, wp_s_176, wp_s_177, wp_s_178, wp_s_179, wp_s_18, 
    wp_s_180, wp_s_181, wp_s_182, wp_s_183, wp_s_184, wp_s_185, 
    wp_s_186, wp_s_187, wp_s_188, wp_s_189, wp_s_19, wp_s_190, wp_s_191,
     wp_s_192, wp_s_193, wp_s_194, wp_s_195, wp_s_196, wp_s_197, 
    wp_s_198, wp_s_199, wp_s_2, wp_s_20, wp_s_200, wp_s_201, wp_s_202, 
    wp_s_203, wp_s_204, wp_s_205, wp_s_206, wp_s_207, wp_s_208, 
    wp_s_209, wp_s_21, wp_s_210, wp_s_211, wp_s_212, wp_s_213, wp_s_214,
     wp_s_215, wp_s_216, wp_s_217, wp_s_218, wp_s_219, wp_s_22, 
    wp_s_220, wp_s_221, wp_s_222, wp_s_223, wp_s_224, wp_s_225, 
    wp_s_226, wp_s_227, wp_s_228, wp_s_229, wp_s_23, wp_s_230, wp_s_231,
     wp_s_232, wp_s_233, wp_s_234, wp_s_235, wp_s_236, wp_s_237, 
    wp_s_238, wp_s_239, wp_s_24, wp_s_240, wp_s_241, wp_s_242, wp_s_243,
     wp_s_244, wp_s_245, wp_s_246, wp_s_247, wp_s_248, wp_s_249, 
    wp_s_25, wp_s_250, wp_s_251, wp_s_252, wp_s_253, wp_s_254, wp_s_255,
     wp_s_256, wp_s_257, wp_s_258, wp_s_259, wp_s_26, wp_s_260, 
    wp_s_261, wp_s_262, wp_s_263, wp_s_264, wp_s_265, wp_s_266, 
    wp_s_267, wp_s_268, wp_s_269, wp_s_27, wp_s_270, wp_s_271, wp_s_272,
     wp_s_273, wp_s_274, wp_s_275, wp_s_276, wp_s_277, wp_s_278, 
    wp_s_279, wp_s_28, wp_s_280, wp_s_281, wp_s_282, wp_s_283, wp_s_284,
     wp_s_285, wp_s_286, wp_s_287, wp_s_288, wp_s_289, wp_s_29, 
    wp_s_290, wp_s_291, wp_s_292, wp_s_293, wp_s_294, wp_s_295, 
    wp_s_296, wp_s_297, wp_s_298, wp_s_299, wp_s_3, wp_s_30, wp_s_300, 
    wp_s_301, wp_s_302, wp_s_303, wp_s_304, wp_s_305, wp_s_306, 
    wp_s_307, wp_s_308, wp_s_309, wp_s_31, wp_s_310, wp_s_311, wp_s_312,
     wp_s_313, wp_s_314, wp_s_315, wp_s_316, wp_s_317, wp_s_318, 
    wp_s_319, wp_s_32, wp_s_320, wp_s_321, wp_s_322, wp_s_323, wp_s_324,
     wp_s_325, wp_s_326, wp_s_327, wp_s_328, wp_s_329, wp_s_33, 
    wp_s_330, wp_s_331, wp_s_332, wp_s_333, wp_s_334, wp_s_335, 
    wp_s_336, wp_s_337, wp_s_338, wp_s_339, wp_s_34, wp_s_340, wp_s_341,
     wp_s_342, wp_s_343, wp_s_344, wp_s_345, wp_s_346, wp_s_347, 
    wp_s_348, wp_s_349, wp_s_35, wp_s_350, wp_s_351, wp_s_352, wp_s_353,
     wp_s_354, wp_s_355, wp_s_356, wp_s_357, wp_s_358, wp_s_359, 
    wp_s_36, wp_s_360, wp_s_361, wp_s_362, wp_s_363, wp_s_364, wp_s_365,
     wp_s_366, wp_s_367, wp_s_368, wp_s_369, wp_s_37, wp_s_370, 
    wp_s_371, wp_s_372, wp_s_373, wp_s_374, wp_s_375, wp_s_376, 
    wp_s_377, wp_s_378, wp_s_379, wp_s_38, wp_s_380, wp_s_381, wp_s_382,
     wp_s_383, wp_s_384, wp_s_385, wp_s_386, wp_s_387, wp_s_388, 
    wp_s_389, wp_s_39, wp_s_390, wp_s_391, wp_s_392, wp_s_393, wp_s_394,
     wp_s_395, wp_s_396, wp_s_397, wp_s_398, wp_s_399, wp_s_4, wp_s_40, 
    wp_s_400, wp_s_401, wp_s_402, wp_s_403, wp_s_404, wp_s_405, 
    wp_s_406, wp_s_407, wp_s_408, wp_s_409, wp_s_41, wp_s_410, wp_s_411,
     wp_s_412, wp_s_413, wp_s_414, wp_s_415, wp_s_416, wp_s_417, 
    wp_s_418, wp_s_419, wp_s_42, wp_s_420, wp_s_421, wp_s_422, wp_s_423,
     wp_s_424, wp_s_425, wp_s_426, wp_s_427, wp_s_428, wp_s_429, 
    wp_s_43, wp_s_430, wp_s_431, wp_s_432, wp_s_433, wp_s_434, wp_s_435,
     wp_s_436, wp_s_437, wp_s_438, wp_s_439, wp_s_44, wp_s_440, 
    wp_s_441, wp_s_442, wp_s_443, wp_s_444, wp_s_445, wp_s_446, 
    wp_s_447, wp_s_448, wp_s_449, wp_s_45, wp_s_450, wp_s_451, wp_s_452,
     wp_s_453, wp_s_454, wp_s_455, wp_s_456, wp_s_457, wp_s_458, 
    wp_s_459, wp_s_46, wp_s_460, wp_s_461, wp_s_462, wp_s_463, wp_s_464,
     wp_s_465, wp_s_466, wp_s_467, wp_s_468, wp_s_469, wp_s_47, 
    wp_s_470, wp_s_471, wp_s_472, wp_s_473, wp_s_474, wp_s_475, 
    wp_s_476, wp_s_477, wp_s_478, wp_s_479, wp_s_48, wp_s_480, wp_s_481,
     wp_s_482, wp_s_483, wp_s_484, wp_s_485, wp_s_486, wp_s_487, 
    wp_s_488, wp_s_489, wp_s_49, wp_s_490, wp_s_491, wp_s_492, wp_s_493,
     wp_s_494, wp_s_495, wp_s_496, wp_s_497, wp_s_498, wp_s_499, wp_s_5,
     wp_s_50, wp_s_500, wp_s_501, wp_s_502, wp_s_503, wp_s_504, 
    wp_s_505, wp_s_506, wp_s_507, wp_s_508, wp_s_509, wp_s_51, wp_s_510,
     wp_s_511, wp_s_512, wp_s_513, wp_s_514, wp_s_515, wp_s_516, 
    wp_s_517, wp_s_518, wp_s_519, wp_s_52, wp_s_520, wp_s_521, wp_s_522,
     wp_s_523, wp_s_524, wp_s_525, wp_s_526, wp_s_527, wp_s_528, 
    wp_s_529, wp_s_53, wp_s_530, wp_s_531, wp_s_532, wp_s_533, wp_s_534,
     wp_s_535, wp_s_536, wp_s_537, wp_s_538, wp_s_539, wp_s_54, 
    wp_s_540, wp_s_541, wp_s_542, wp_s_543, wp_s_544, wp_s_545, 
    wp_s_546, wp_s_547, wp_s_548, wp_s_549, wp_s_55, wp_s_550, wp_s_551,
     wp_s_552, wp_s_553, wp_s_554, wp_s_555, wp_s_556, wp_s_557, 
    wp_s_558, wp_s_559, wp_s_56, wp_s_560, wp_s_561, wp_s_562, wp_s_563,
     wp_s_564, wp_s_565, wp_s_566, wp_s_567, wp_s_568, wp_s_569, 
    wp_s_57, wp_s_570, wp_s_571, wp_s_572, wp_s_573, wp_s_574, wp_s_575,
     wp_s_576, wp_s_577, wp_s_578, wp_s_579, wp_s_58, wp_s_580, 
    wp_s_581, wp_s_582, wp_s_583, wp_s_584, wp_s_585, wp_s_586, 
    wp_s_587, wp_s_588, wp_s_589, wp_s_59, wp_s_590, wp_s_591, wp_s_592,
     wp_s_593, wp_s_594, wp_s_595, wp_s_596, wp_s_597, wp_s_598, 
    wp_s_599, wp_s_6, wp_s_60, wp_s_600, wp_s_601, wp_s_602, wp_s_603, 
    wp_s_604, wp_s_605, wp_s_606, wp_s_607, wp_s_608, wp_s_609, wp_s_61,
     wp_s_610, wp_s_611, wp_s_612, wp_s_613, wp_s_614, wp_s_615, 
    wp_s_616, wp_s_617, wp_s_618, wp_s_619, wp_s_62, wp_s_620, wp_s_621,
     wp_s_622, wp_s_623, wp_s_624, wp_s_625, wp_s_626, wp_s_627, 
    wp_s_628, wp_s_629, wp_s_63, wp_s_630, wp_s_631, wp_s_632, wp_s_633,
     wp_s_634, wp_s_635, wp_s_636, wp_s_637, wp_s_638, wp_s_639, 
    wp_s_64, wp_s_640, wp_s_641, wp_s_642, wp_s_643, wp_s_644, wp_s_645,
     wp_s_646, wp_s_647, wp_s_648, wp_s_649, wp_s_65, wp_s_650, 
    wp_s_651, wp_s_652, wp_s_653, wp_s_654, wp_s_655, wp_s_656, 
    wp_s_657, wp_s_658, wp_s_659, wp_s_66, wp_s_660, wp_s_661, wp_s_662,
     wp_s_663, wp_s_664, wp_s_665, wp_s_666, wp_s_667, wp_s_668, 
    wp_s_669, wp_s_67, wp_s_670, wp_s_671, wp_s_672, wp_s_673, wp_s_674,
     wp_s_675, wp_s_676, wp_s_677, wp_s_678, wp_s_679, wp_s_68, 
    wp_s_680, wp_s_681, wp_s_682, wp_s_683, wp_s_684, wp_s_685, 
    wp_s_686, wp_s_687, wp_s_688, wp_s_689, wp_s_69, wp_s_690, wp_s_691,
     wp_s_692, wp_s_693, wp_s_694, wp_s_695, wp_s_696, wp_s_697, 
    wp_s_698, wp_s_699, wp_s_7, wp_s_70, wp_s_700, wp_s_701, wp_s_702, 
    wp_s_703, wp_s_704, wp_s_705, wp_s_706, wp_s_707, wp_s_708, 
    wp_s_709, wp_s_71, wp_s_710, wp_s_711, wp_s_712, wp_s_713, wp_s_714,
     wp_s_715, wp_s_716, wp_s_717, wp_s_718, wp_s_719, wp_s_72, 
    wp_s_720, wp_s_721, wp_s_722, wp_s_723, wp_s_724, wp_s_725, 
    wp_s_726, wp_s_727, wp_s_728, wp_s_729, wp_s_73, wp_s_730, wp_s_731,
     wp_s_732, wp_s_733, wp_s_734, wp_s_735, wp_s_736, wp_s_737, 
    wp_s_738, wp_s_739, wp_s_74, wp_s_740, wp_s_741, wp_s_742, wp_s_743,
     wp_s_744, wp_s_745, wp_s_746, wp_s_747, wp_s_748, wp_s_749, 
    wp_s_75, wp_s_750, wp_s_751, wp_s_752, wp_s_753, wp_s_754, wp_s_755,
     wp_s_756, wp_s_757, wp_s_758, wp_s_759, wp_s_76, wp_s_760, 
    wp_s_761, wp_s_762, wp_s_763, wp_s_764, wp_s_765, wp_s_766, 
    wp_s_767, wp_s_768, wp_s_769, wp_s_77, wp_s_770, wp_s_771, wp_s_772,
     wp_s_773, wp_s_774, wp_s_775, wp_s_776, wp_s_777, wp_s_778, 
    wp_s_779, wp_s_78, wp_s_780, wp_s_781, wp_s_782, wp_s_783, wp_s_784,
     wp_s_785, wp_s_786, wp_s_787, wp_s_788, wp_s_789, wp_s_79, 
    wp_s_790, wp_s_791, wp_s_792, wp_s_793, wp_s_794, wp_s_795, 
    wp_s_796, wp_s_797, wp_s_798, wp_s_799, wp_s_8, wp_s_80, wp_s_800, 
    wp_s_801, wp_s_802, wp_s_803, wp_s_804, wp_s_805, wp_s_806, 
    wp_s_807, wp_s_808, wp_s_809, wp_s_81, wp_s_810, wp_s_811, wp_s_812,
     wp_s_813, wp_s_814, wp_s_815, wp_s_816, wp_s_817, wp_s_818, 
    wp_s_819, wp_s_82, wp_s_820, wp_s_821, wp_s_822, wp_s_823, wp_s_824,
     wp_s_825, wp_s_826, wp_s_827, wp_s_828, wp_s_829, wp_s_83, 
    wp_s_830, wp_s_831, wp_s_832, wp_s_833, wp_s_834, wp_s_835, 
    wp_s_836, wp_s_837, wp_s_84, wp_s_85, wp_s_86, wp_s_87, wp_s_88, 
    wp_s_89, wp_s_9, wp_s_90, wp_s_91, wp_s_92, wp_s_93, wp_s_94, 
    wp_s_95, wp_s_96, wp_s_97, wp_s_98, wp_s_99;

DSP_CORE_vsia_tst_wp_cell_out WC_BGn (
    .Func_out(BGn), .SI(wp_s_581), .SO(wp_s_582), .VCO(core_BGn), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_BMSn (
    .Func_out(BMSn), .SI(wp_s_587), .SO(wp_s_588), .VCO(core_BMSn), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CLKO (
    .Func_out(CLKO), .SI(wp_s_578), .SO(wp_s_579), .VCO(core_CLKO), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMAinx_0_ (
    .Func_out(CMAinx[0]), .SI(wp_s_812), .SO(wp_s_813), .VCO(core_CMAinx[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMAinx_10_ (
    .Func_out(CMAinx[10]), .SI(wp_s_802), .SO(wp_s_803), .VCO(core_CMAinx[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMAinx_11_ (
    .Func_out(CMAinx[11]), .SI(wp_s_801), .SO(wp_s_802), .VCO(core_CMAinx[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMAinx_12_ (
    .Func_out(CMAinx[12]), .SI(wp_s_800), .SO(wp_s_801), .VCO(core_CMAinx[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMAinx_13_ (
    .Func_out(CMAinx[13]), .SI(wp_s_799), .SO(wp_s_800), .VCO(core_CMAinx[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMAinx_1_ (
    .Func_out(CMAinx[1]), .SI(wp_s_811), .SO(wp_s_812), .VCO(core_CMAinx[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMAinx_2_ (
    .Func_out(CMAinx[2]), .SI(wp_s_810), .SO(wp_s_811), .VCO(core_CMAinx[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMAinx_3_ (
    .Func_out(CMAinx[3]), .SI(wp_s_809), .SO(wp_s_810), .VCO(core_CMAinx[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMAinx_4_ (
    .Func_out(CMAinx[4]), .SI(wp_s_808), .SO(wp_s_809), .VCO(core_CMAinx[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMAinx_5_ (
    .Func_out(CMAinx[5]), .SI(wp_s_807), .SO(wp_s_808), .VCO(core_CMAinx[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMAinx_6_ (
    .Func_out(CMAinx[6]), .SI(wp_s_806), .SO(wp_s_807), .VCO(core_CMAinx[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMAinx_7_ (
    .Func_out(CMAinx[7]), .SI(wp_s_805), .SO(wp_s_806), .VCO(core_CMAinx[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMAinx_8_ (
    .Func_out(CMAinx[8]), .SI(wp_s_804), .SO(wp_s_805), .VCO(core_CMAinx[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMAinx_9_ (
    .Func_out(CMAinx[9]), .SI(wp_s_803), .SO(wp_s_804), .VCO(core_CMAinx[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMSn (
    .Func_out(CMSn), .SI(wp_s_586), .SO(wp_s_587), .VCO(core_CMSn), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_cs (
    .Func_out(CM_cs), .SI(wp_s_720), .SO(wp_s_721), .VCO(core_CM_cs), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_oe (
    .Func_out(CM_oe), .SI(wp_s_730), .SO(wp_s_731), .VCO(core_CM_oe), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_0_ (
    .Func_in(CM_rd0[0]), .SI(wp_s_400), .SO(wp_s_401), .VCI(core_CM_rd0[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_10_ (
    .Func_in(CM_rd0[10]), .SI(wp_s_390), .SO(wp_s_391), .VCI(core_CM_rd0[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_11_ (
    .Func_in(CM_rd0[11]), .SI(wp_s_389), .SO(wp_s_390), .VCI(core_CM_rd0[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_12_ (
    .Func_in(CM_rd0[12]), .SI(wp_s_388), .SO(wp_s_389), .VCI(core_CM_rd0[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_13_ (
    .Func_in(CM_rd0[13]), .SI(wp_s_387), .SO(wp_s_388), .VCI(core_CM_rd0[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_14_ (
    .Func_in(CM_rd0[14]), .SI(wp_s_386), .SO(wp_s_387), .VCI(core_CM_rd0[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_15_ (
    .Func_in(CM_rd0[15]), .SI(wp_s_385), .SO(wp_s_386), .VCI(core_CM_rd0[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_16_ (
    .Func_in(CM_rd0[16]), .SI(wp_s_384), .SO(wp_s_385), .VCI(core_CM_rd0[16]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_17_ (
    .Func_in(CM_rd0[17]), .SI(wp_s_383), .SO(wp_s_384), .VCI(core_CM_rd0[17]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_18_ (
    .Func_in(CM_rd0[18]), .SI(wp_s_382), .SO(wp_s_383), .VCI(core_CM_rd0[18]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_19_ (
    .Func_in(CM_rd0[19]), .SI(wp_s_381), .SO(wp_s_382), .VCI(core_CM_rd0[19]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_1_ (
    .Func_in(CM_rd0[1]), .SI(wp_s_399), .SO(wp_s_400), .VCI(core_CM_rd0[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_20_ (
    .Func_in(CM_rd0[20]), .SI(wp_s_380), .SO(wp_s_381), .VCI(core_CM_rd0[20]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_21_ (
    .Func_in(CM_rd0[21]), .SI(wp_s_379), .SO(wp_s_380), .VCI(core_CM_rd0[21]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_22_ (
    .Func_in(CM_rd0[22]), .SI(wp_s_378), .SO(wp_s_379), .VCI(core_CM_rd0[22]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_23_ (
    .Func_in(CM_rd0[23]), .SI(wp_s_377), .SO(wp_s_378), .VCI(core_CM_rd0[23]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_2_ (
    .Func_in(CM_rd0[2]), .SI(wp_s_398), .SO(wp_s_399), .VCI(core_CM_rd0[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_3_ (
    .Func_in(CM_rd0[3]), .SI(wp_s_397), .SO(wp_s_398), .VCI(core_CM_rd0[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_4_ (
    .Func_in(CM_rd0[4]), .SI(wp_s_396), .SO(wp_s_397), .VCI(core_CM_rd0[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_5_ (
    .Func_in(CM_rd0[5]), .SI(wp_s_395), .SO(wp_s_396), .VCI(core_CM_rd0[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_6_ (
    .Func_in(CM_rd0[6]), .SI(wp_s_394), .SO(wp_s_395), .VCI(core_CM_rd0[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_7_ (
    .Func_in(CM_rd0[7]), .SI(wp_s_393), .SO(wp_s_394), .VCI(core_CM_rd0[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_8_ (
    .Func_in(CM_rd0[8]), .SI(wp_s_392), .SO(wp_s_393), .VCI(core_CM_rd0[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd0_9_ (
    .Func_in(CM_rd0[9]), .SI(wp_s_391), .SO(wp_s_392), .VCI(core_CM_rd0[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_0_ (
    .Func_in(CM_rd1[0]), .SI(wp_s_424), .SO(wp_s_425), .VCI(core_CM_rd1[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_10_ (
    .Func_in(CM_rd1[10]), .SI(wp_s_414), .SO(wp_s_415), .VCI(core_CM_rd1[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_11_ (
    .Func_in(CM_rd1[11]), .SI(wp_s_413), .SO(wp_s_414), .VCI(core_CM_rd1[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_12_ (
    .Func_in(CM_rd1[12]), .SI(wp_s_412), .SO(wp_s_413), .VCI(core_CM_rd1[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_13_ (
    .Func_in(CM_rd1[13]), .SI(wp_s_411), .SO(wp_s_412), .VCI(core_CM_rd1[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_14_ (
    .Func_in(CM_rd1[14]), .SI(wp_s_410), .SO(wp_s_411), .VCI(core_CM_rd1[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_15_ (
    .Func_in(CM_rd1[15]), .SI(wp_s_409), .SO(wp_s_410), .VCI(core_CM_rd1[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_16_ (
    .Func_in(CM_rd1[16]), .SI(wp_s_408), .SO(wp_s_409), .VCI(core_CM_rd1[16]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_17_ (
    .Func_in(CM_rd1[17]), .SI(wp_s_407), .SO(wp_s_408), .VCI(core_CM_rd1[17]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_18_ (
    .Func_in(CM_rd1[18]), .SI(wp_s_406), .SO(wp_s_407), .VCI(core_CM_rd1[18]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_19_ (
    .Func_in(CM_rd1[19]), .SI(wp_s_405), .SO(wp_s_406), .VCI(core_CM_rd1[19]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_1_ (
    .Func_in(CM_rd1[1]), .SI(wp_s_423), .SO(wp_s_424), .VCI(core_CM_rd1[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_20_ (
    .Func_in(CM_rd1[20]), .SI(wp_s_404), .SO(wp_s_405), .VCI(core_CM_rd1[20]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_21_ (
    .Func_in(CM_rd1[21]), .SI(wp_s_403), .SO(wp_s_404), .VCI(core_CM_rd1[21]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_22_ (
    .Func_in(CM_rd1[22]), .SI(wp_s_402), .SO(wp_s_403), .VCI(core_CM_rd1[22]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_23_ (
    .Func_in(CM_rd1[23]), .SI(wp_s_401), .SO(wp_s_402), .VCI(core_CM_rd1[23]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_2_ (
    .Func_in(CM_rd1[2]), .SI(wp_s_422), .SO(wp_s_423), .VCI(core_CM_rd1[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_3_ (
    .Func_in(CM_rd1[3]), .SI(wp_s_421), .SO(wp_s_422), .VCI(core_CM_rd1[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_4_ (
    .Func_in(CM_rd1[4]), .SI(wp_s_420), .SO(wp_s_421), .VCI(core_CM_rd1[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_5_ (
    .Func_in(CM_rd1[5]), .SI(wp_s_419), .SO(wp_s_420), .VCI(core_CM_rd1[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_6_ (
    .Func_in(CM_rd1[6]), .SI(wp_s_418), .SO(wp_s_419), .VCI(core_CM_rd1[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_7_ (
    .Func_in(CM_rd1[7]), .SI(wp_s_417), .SO(wp_s_418), .VCI(core_CM_rd1[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_8_ (
    .Func_in(CM_rd1[8]), .SI(wp_s_416), .SO(wp_s_417), .VCI(core_CM_rd1[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd1_9_ (
    .Func_in(CM_rd1[9]), .SI(wp_s_415), .SO(wp_s_416), .VCI(core_CM_rd1[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_0_ (
    .Func_in(CM_rd2[0]), .SI(wp_s_448), .SO(wp_s_449), .VCI(core_CM_rd2[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_10_ (
    .Func_in(CM_rd2[10]), .SI(wp_s_438), .SO(wp_s_439), .VCI(core_CM_rd2[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_11_ (
    .Func_in(CM_rd2[11]), .SI(wp_s_437), .SO(wp_s_438), .VCI(core_CM_rd2[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_12_ (
    .Func_in(CM_rd2[12]), .SI(wp_s_436), .SO(wp_s_437), .VCI(core_CM_rd2[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_13_ (
    .Func_in(CM_rd2[13]), .SI(wp_s_435), .SO(wp_s_436), .VCI(core_CM_rd2[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_14_ (
    .Func_in(CM_rd2[14]), .SI(wp_s_434), .SO(wp_s_435), .VCI(core_CM_rd2[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_15_ (
    .Func_in(CM_rd2[15]), .SI(wp_s_433), .SO(wp_s_434), .VCI(core_CM_rd2[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_16_ (
    .Func_in(CM_rd2[16]), .SI(wp_s_432), .SO(wp_s_433), .VCI(core_CM_rd2[16]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_17_ (
    .Func_in(CM_rd2[17]), .SI(wp_s_431), .SO(wp_s_432), .VCI(core_CM_rd2[17]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_18_ (
    .Func_in(CM_rd2[18]), .SI(wp_s_430), .SO(wp_s_431), .VCI(core_CM_rd2[18]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_19_ (
    .Func_in(CM_rd2[19]), .SI(wp_s_429), .SO(wp_s_430), .VCI(core_CM_rd2[19]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_1_ (
    .Func_in(CM_rd2[1]), .SI(wp_s_447), .SO(wp_s_448), .VCI(core_CM_rd2[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_20_ (
    .Func_in(CM_rd2[20]), .SI(wp_s_428), .SO(wp_s_429), .VCI(core_CM_rd2[20]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_21_ (
    .Func_in(CM_rd2[21]), .SI(wp_s_427), .SO(wp_s_428), .VCI(core_CM_rd2[21]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_22_ (
    .Func_in(CM_rd2[22]), .SI(wp_s_426), .SO(wp_s_427), .VCI(core_CM_rd2[22]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_23_ (
    .Func_in(CM_rd2[23]), .SI(wp_s_425), .SO(wp_s_426), .VCI(core_CM_rd2[23]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_2_ (
    .Func_in(CM_rd2[2]), .SI(wp_s_446), .SO(wp_s_447), .VCI(core_CM_rd2[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_3_ (
    .Func_in(CM_rd2[3]), .SI(wp_s_445), .SO(wp_s_446), .VCI(core_CM_rd2[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_4_ (
    .Func_in(CM_rd2[4]), .SI(wp_s_444), .SO(wp_s_445), .VCI(core_CM_rd2[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_5_ (
    .Func_in(CM_rd2[5]), .SI(wp_s_443), .SO(wp_s_444), .VCI(core_CM_rd2[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_6_ (
    .Func_in(CM_rd2[6]), .SI(wp_s_442), .SO(wp_s_443), .VCI(core_CM_rd2[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_7_ (
    .Func_in(CM_rd2[7]), .SI(wp_s_441), .SO(wp_s_442), .VCI(core_CM_rd2[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_8_ (
    .Func_in(CM_rd2[8]), .SI(wp_s_440), .SO(wp_s_441), .VCI(core_CM_rd2[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd2_9_ (
    .Func_in(CM_rd2[9]), .SI(wp_s_439), .SO(wp_s_440), .VCI(core_CM_rd2[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_0_ (
    .Func_in(CM_rd3[0]), .SI(wp_s_472), .SO(wp_s_473), .VCI(core_CM_rd3[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_10_ (
    .Func_in(CM_rd3[10]), .SI(wp_s_462), .SO(wp_s_463), .VCI(core_CM_rd3[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_11_ (
    .Func_in(CM_rd3[11]), .SI(wp_s_461), .SO(wp_s_462), .VCI(core_CM_rd3[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_12_ (
    .Func_in(CM_rd3[12]), .SI(wp_s_460), .SO(wp_s_461), .VCI(core_CM_rd3[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_13_ (
    .Func_in(CM_rd3[13]), .SI(wp_s_459), .SO(wp_s_460), .VCI(core_CM_rd3[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_14_ (
    .Func_in(CM_rd3[14]), .SI(wp_s_458), .SO(wp_s_459), .VCI(core_CM_rd3[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_15_ (
    .Func_in(CM_rd3[15]), .SI(wp_s_457), .SO(wp_s_458), .VCI(core_CM_rd3[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_16_ (
    .Func_in(CM_rd3[16]), .SI(wp_s_456), .SO(wp_s_457), .VCI(core_CM_rd3[16]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_17_ (
    .Func_in(CM_rd3[17]), .SI(wp_s_455), .SO(wp_s_456), .VCI(core_CM_rd3[17]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_18_ (
    .Func_in(CM_rd3[18]), .SI(wp_s_454), .SO(wp_s_455), .VCI(core_CM_rd3[18]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_19_ (
    .Func_in(CM_rd3[19]), .SI(wp_s_453), .SO(wp_s_454), .VCI(core_CM_rd3[19]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_1_ (
    .Func_in(CM_rd3[1]), .SI(wp_s_471), .SO(wp_s_472), .VCI(core_CM_rd3[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_20_ (
    .Func_in(CM_rd3[20]), .SI(wp_s_452), .SO(wp_s_453), .VCI(core_CM_rd3[20]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_21_ (
    .Func_in(CM_rd3[21]), .SI(wp_s_451), .SO(wp_s_452), .VCI(core_CM_rd3[21]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_22_ (
    .Func_in(CM_rd3[22]), .SI(wp_s_450), .SO(wp_s_451), .VCI(core_CM_rd3[22]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_23_ (
    .Func_in(CM_rd3[23]), .SI(wp_s_449), .SO(wp_s_450), .VCI(core_CM_rd3[23]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_2_ (
    .Func_in(CM_rd3[2]), .SI(wp_s_470), .SO(wp_s_471), .VCI(core_CM_rd3[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_3_ (
    .Func_in(CM_rd3[3]), .SI(wp_s_469), .SO(wp_s_470), .VCI(core_CM_rd3[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_4_ (
    .Func_in(CM_rd3[4]), .SI(wp_s_468), .SO(wp_s_469), .VCI(core_CM_rd3[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_5_ (
    .Func_in(CM_rd3[5]), .SI(wp_s_467), .SO(wp_s_468), .VCI(core_CM_rd3[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_6_ (
    .Func_in(CM_rd3[6]), .SI(wp_s_466), .SO(wp_s_467), .VCI(core_CM_rd3[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_7_ (
    .Func_in(CM_rd3[7]), .SI(wp_s_465), .SO(wp_s_466), .VCI(core_CM_rd3[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_8_ (
    .Func_in(CM_rd3[8]), .SI(wp_s_464), .SO(wp_s_465), .VCI(core_CM_rd3[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd3_9_ (
    .Func_in(CM_rd3[9]), .SI(wp_s_463), .SO(wp_s_464), .VCI(core_CM_rd3[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_0_ (
    .Func_in(CM_rd4[0]), .SI(wp_s_496), .SO(wp_s_497), .VCI(core_CM_rd4[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_10_ (
    .Func_in(CM_rd4[10]), .SI(wp_s_486), .SO(wp_s_487), .VCI(core_CM_rd4[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_11_ (
    .Func_in(CM_rd4[11]), .SI(wp_s_485), .SO(wp_s_486), .VCI(core_CM_rd4[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_12_ (
    .Func_in(CM_rd4[12]), .SI(wp_s_484), .SO(wp_s_485), .VCI(core_CM_rd4[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_13_ (
    .Func_in(CM_rd4[13]), .SI(wp_s_483), .SO(wp_s_484), .VCI(core_CM_rd4[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_14_ (
    .Func_in(CM_rd4[14]), .SI(wp_s_482), .SO(wp_s_483), .VCI(core_CM_rd4[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_15_ (
    .Func_in(CM_rd4[15]), .SI(wp_s_481), .SO(wp_s_482), .VCI(core_CM_rd4[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_16_ (
    .Func_in(CM_rd4[16]), .SI(wp_s_480), .SO(wp_s_481), .VCI(core_CM_rd4[16]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_17_ (
    .Func_in(CM_rd4[17]), .SI(wp_s_479), .SO(wp_s_480), .VCI(core_CM_rd4[17]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_18_ (
    .Func_in(CM_rd4[18]), .SI(wp_s_478), .SO(wp_s_479), .VCI(core_CM_rd4[18]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_19_ (
    .Func_in(CM_rd4[19]), .SI(wp_s_477), .SO(wp_s_478), .VCI(core_CM_rd4[19]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_1_ (
    .Func_in(CM_rd4[1]), .SI(wp_s_495), .SO(wp_s_496), .VCI(core_CM_rd4[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_20_ (
    .Func_in(CM_rd4[20]), .SI(wp_s_476), .SO(wp_s_477), .VCI(core_CM_rd4[20]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_21_ (
    .Func_in(CM_rd4[21]), .SI(wp_s_475), .SO(wp_s_476), .VCI(core_CM_rd4[21]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_22_ (
    .Func_in(CM_rd4[22]), .SI(wp_s_474), .SO(wp_s_475), .VCI(core_CM_rd4[22]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_23_ (
    .Func_in(CM_rd4[23]), .SI(wp_s_473), .SO(wp_s_474), .VCI(core_CM_rd4[23]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_2_ (
    .Func_in(CM_rd4[2]), .SI(wp_s_494), .SO(wp_s_495), .VCI(core_CM_rd4[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_3_ (
    .Func_in(CM_rd4[3]), .SI(wp_s_493), .SO(wp_s_494), .VCI(core_CM_rd4[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_4_ (
    .Func_in(CM_rd4[4]), .SI(wp_s_492), .SO(wp_s_493), .VCI(core_CM_rd4[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_5_ (
    .Func_in(CM_rd4[5]), .SI(wp_s_491), .SO(wp_s_492), .VCI(core_CM_rd4[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_6_ (
    .Func_in(CM_rd4[6]), .SI(wp_s_490), .SO(wp_s_491), .VCI(core_CM_rd4[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_7_ (
    .Func_in(CM_rd4[7]), .SI(wp_s_489), .SO(wp_s_490), .VCI(core_CM_rd4[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_8_ (
    .Func_in(CM_rd4[8]), .SI(wp_s_488), .SO(wp_s_489), .VCI(core_CM_rd4[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd4_9_ (
    .Func_in(CM_rd4[9]), .SI(wp_s_487), .SO(wp_s_488), .VCI(core_CM_rd4[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_0_ (
    .Func_in(CM_rd5[0]), .SI(wp_s_520), .SO(wp_s_521), .VCI(core_CM_rd5[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_10_ (
    .Func_in(CM_rd5[10]), .SI(wp_s_510), .SO(wp_s_511), .VCI(core_CM_rd5[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_11_ (
    .Func_in(CM_rd5[11]), .SI(wp_s_509), .SO(wp_s_510), .VCI(core_CM_rd5[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_12_ (
    .Func_in(CM_rd5[12]), .SI(wp_s_508), .SO(wp_s_509), .VCI(core_CM_rd5[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_13_ (
    .Func_in(CM_rd5[13]), .SI(wp_s_507), .SO(wp_s_508), .VCI(core_CM_rd5[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_14_ (
    .Func_in(CM_rd5[14]), .SI(wp_s_506), .SO(wp_s_507), .VCI(core_CM_rd5[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_15_ (
    .Func_in(CM_rd5[15]), .SI(wp_s_505), .SO(wp_s_506), .VCI(core_CM_rd5[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_16_ (
    .Func_in(CM_rd5[16]), .SI(wp_s_504), .SO(wp_s_505), .VCI(core_CM_rd5[16]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_17_ (
    .Func_in(CM_rd5[17]), .SI(wp_s_503), .SO(wp_s_504), .VCI(core_CM_rd5[17]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_18_ (
    .Func_in(CM_rd5[18]), .SI(wp_s_502), .SO(wp_s_503), .VCI(core_CM_rd5[18]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_19_ (
    .Func_in(CM_rd5[19]), .SI(wp_s_501), .SO(wp_s_502), .VCI(core_CM_rd5[19]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_1_ (
    .Func_in(CM_rd5[1]), .SI(wp_s_519), .SO(wp_s_520), .VCI(core_CM_rd5[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_20_ (
    .Func_in(CM_rd5[20]), .SI(wp_s_500), .SO(wp_s_501), .VCI(core_CM_rd5[20]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_21_ (
    .Func_in(CM_rd5[21]), .SI(wp_s_499), .SO(wp_s_500), .VCI(core_CM_rd5[21]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_22_ (
    .Func_in(CM_rd5[22]), .SI(wp_s_498), .SO(wp_s_499), .VCI(core_CM_rd5[22]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_23_ (
    .Func_in(CM_rd5[23]), .SI(wp_s_497), .SO(wp_s_498), .VCI(core_CM_rd5[23]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_2_ (
    .Func_in(CM_rd5[2]), .SI(wp_s_518), .SO(wp_s_519), .VCI(core_CM_rd5[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_3_ (
    .Func_in(CM_rd5[3]), .SI(wp_s_517), .SO(wp_s_518), .VCI(core_CM_rd5[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_4_ (
    .Func_in(CM_rd5[4]), .SI(wp_s_516), .SO(wp_s_517), .VCI(core_CM_rd5[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_5_ (
    .Func_in(CM_rd5[5]), .SI(wp_s_515), .SO(wp_s_516), .VCI(core_CM_rd5[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_6_ (
    .Func_in(CM_rd5[6]), .SI(wp_s_514), .SO(wp_s_515), .VCI(core_CM_rd5[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_7_ (
    .Func_in(CM_rd5[7]), .SI(wp_s_513), .SO(wp_s_514), .VCI(core_CM_rd5[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_8_ (
    .Func_in(CM_rd5[8]), .SI(wp_s_512), .SO(wp_s_513), .VCI(core_CM_rd5[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd5_9_ (
    .Func_in(CM_rd5[9]), .SI(wp_s_511), .SO(wp_s_512), .VCI(core_CM_rd5[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_0_ (
    .Func_in(CM_rd6[0]), .SI(wp_s_544), .SO(wp_s_545), .VCI(core_CM_rd6[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_10_ (
    .Func_in(CM_rd6[10]), .SI(wp_s_534), .SO(wp_s_535), .VCI(core_CM_rd6[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_11_ (
    .Func_in(CM_rd6[11]), .SI(wp_s_533), .SO(wp_s_534), .VCI(core_CM_rd6[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_12_ (
    .Func_in(CM_rd6[12]), .SI(wp_s_532), .SO(wp_s_533), .VCI(core_CM_rd6[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_13_ (
    .Func_in(CM_rd6[13]), .SI(wp_s_531), .SO(wp_s_532), .VCI(core_CM_rd6[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_14_ (
    .Func_in(CM_rd6[14]), .SI(wp_s_530), .SO(wp_s_531), .VCI(core_CM_rd6[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_15_ (
    .Func_in(CM_rd6[15]), .SI(wp_s_529), .SO(wp_s_530), .VCI(core_CM_rd6[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_16_ (
    .Func_in(CM_rd6[16]), .SI(wp_s_528), .SO(wp_s_529), .VCI(core_CM_rd6[16]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_17_ (
    .Func_in(CM_rd6[17]), .SI(wp_s_527), .SO(wp_s_528), .VCI(core_CM_rd6[17]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_18_ (
    .Func_in(CM_rd6[18]), .SI(wp_s_526), .SO(wp_s_527), .VCI(core_CM_rd6[18]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_19_ (
    .Func_in(CM_rd6[19]), .SI(wp_s_525), .SO(wp_s_526), .VCI(core_CM_rd6[19]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_1_ (
    .Func_in(CM_rd6[1]), .SI(wp_s_543), .SO(wp_s_544), .VCI(core_CM_rd6[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_20_ (
    .Func_in(CM_rd6[20]), .SI(wp_s_524), .SO(wp_s_525), .VCI(core_CM_rd6[20]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_21_ (
    .Func_in(CM_rd6[21]), .SI(wp_s_523), .SO(wp_s_524), .VCI(core_CM_rd6[21]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_22_ (
    .Func_in(CM_rd6[22]), .SI(wp_s_522), .SO(wp_s_523), .VCI(core_CM_rd6[22]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_23_ (
    .Func_in(CM_rd6[23]), .SI(wp_s_521), .SO(wp_s_522), .VCI(core_CM_rd6[23]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_2_ (
    .Func_in(CM_rd6[2]), .SI(wp_s_542), .SO(wp_s_543), .VCI(core_CM_rd6[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_3_ (
    .Func_in(CM_rd6[3]), .SI(wp_s_541), .SO(wp_s_542), .VCI(core_CM_rd6[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_4_ (
    .Func_in(CM_rd6[4]), .SI(wp_s_540), .SO(wp_s_541), .VCI(core_CM_rd6[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_5_ (
    .Func_in(CM_rd6[5]), .SI(wp_s_539), .SO(wp_s_540), .VCI(core_CM_rd6[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_6_ (
    .Func_in(CM_rd6[6]), .SI(wp_s_538), .SO(wp_s_539), .VCI(core_CM_rd6[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_7_ (
    .Func_in(CM_rd6[7]), .SI(wp_s_537), .SO(wp_s_538), .VCI(core_CM_rd6[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_8_ (
    .Func_in(CM_rd6[8]), .SI(wp_s_536), .SO(wp_s_537), .VCI(core_CM_rd6[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd6_9_ (
    .Func_in(CM_rd6[9]), .SI(wp_s_535), .SO(wp_s_536), .VCI(core_CM_rd6[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_0_ (
    .Func_in(CM_rd7[0]), .SI(wp_s_568), .SO(wp_s_569), .VCI(core_CM_rd7[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_10_ (
    .Func_in(CM_rd7[10]), .SI(wp_s_558), .SO(wp_s_559), .VCI(core_CM_rd7[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_11_ (
    .Func_in(CM_rd7[11]), .SI(wp_s_557), .SO(wp_s_558), .VCI(core_CM_rd7[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_12_ (
    .Func_in(CM_rd7[12]), .SI(wp_s_556), .SO(wp_s_557), .VCI(core_CM_rd7[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_13_ (
    .Func_in(CM_rd7[13]), .SI(wp_s_555), .SO(wp_s_556), .VCI(core_CM_rd7[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_14_ (
    .Func_in(CM_rd7[14]), .SI(wp_s_554), .SO(wp_s_555), .VCI(core_CM_rd7[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_15_ (
    .Func_in(CM_rd7[15]), .SI(wp_s_553), .SO(wp_s_554), .VCI(core_CM_rd7[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_16_ (
    .Func_in(CM_rd7[16]), .SI(wp_s_552), .SO(wp_s_553), .VCI(core_CM_rd7[16]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_17_ (
    .Func_in(CM_rd7[17]), .SI(wp_s_551), .SO(wp_s_552), .VCI(core_CM_rd7[17]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_18_ (
    .Func_in(CM_rd7[18]), .SI(wp_s_550), .SO(wp_s_551), .VCI(core_CM_rd7[18]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_19_ (
    .Func_in(CM_rd7[19]), .SI(wp_s_549), .SO(wp_s_550), .VCI(core_CM_rd7[19]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_1_ (
    .Func_in(CM_rd7[1]), .SI(wp_s_567), .SO(wp_s_568), .VCI(core_CM_rd7[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_20_ (
    .Func_in(CM_rd7[20]), .SI(wp_s_548), .SO(wp_s_549), .VCI(core_CM_rd7[20]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_21_ (
    .Func_in(CM_rd7[21]), .SI(wp_s_547), .SO(wp_s_548), .VCI(core_CM_rd7[21]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_22_ (
    .Func_in(CM_rd7[22]), .SI(wp_s_546), .SO(wp_s_547), .VCI(core_CM_rd7[22]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_23_ (
    .Func_in(CM_rd7[23]), .SI(wp_s_545), .SO(wp_s_546), .VCI(core_CM_rd7[23]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_2_ (
    .Func_in(CM_rd7[2]), .SI(wp_s_566), .SO(wp_s_567), .VCI(core_CM_rd7[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_3_ (
    .Func_in(CM_rd7[3]), .SI(wp_s_565), .SO(wp_s_566), .VCI(core_CM_rd7[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_4_ (
    .Func_in(CM_rd7[4]), .SI(wp_s_564), .SO(wp_s_565), .VCI(core_CM_rd7[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_5_ (
    .Func_in(CM_rd7[5]), .SI(wp_s_563), .SO(wp_s_564), .VCI(core_CM_rd7[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_6_ (
    .Func_in(CM_rd7[6]), .SI(wp_s_562), .SO(wp_s_563), .VCI(core_CM_rd7[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_7_ (
    .Func_in(CM_rd7[7]), .SI(wp_s_561), .SO(wp_s_562), .VCI(core_CM_rd7[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_8_ (
    .Func_in(CM_rd7[8]), .SI(wp_s_560), .SO(wp_s_561), .VCI(core_CM_rd7[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rd7_9_ (
    .Func_in(CM_rd7[9]), .SI(wp_s_559), .SO(wp_s_560), .VCI(core_CM_rd7[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_0_ (
    .Func_in(CM_rdm[0]), .SI(wp_s_376), .SO(wp_s_377), .VCI(core_CM_rdm[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_10_ (
    .Func_in(CM_rdm[10]), .SI(wp_s_366), .SO(wp_s_367), .VCI(core_CM_rdm[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_11_ (
    .Func_in(CM_rdm[11]), .SI(wp_s_365), .SO(wp_s_366), .VCI(core_CM_rdm[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_12_ (
    .Func_in(CM_rdm[12]), .SI(wp_s_364), .SO(wp_s_365), .VCI(core_CM_rdm[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_13_ (
    .Func_in(CM_rdm[13]), .SI(wp_s_363), .SO(wp_s_364), .VCI(core_CM_rdm[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_14_ (
    .Func_in(CM_rdm[14]), .SI(wp_s_362), .SO(wp_s_363), .VCI(core_CM_rdm[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_15_ (
    .Func_in(CM_rdm[15]), .SI(wp_s_361), .SO(wp_s_362), .VCI(core_CM_rdm[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_16_ (
    .Func_in(CM_rdm[16]), .SI(wp_s_360), .SO(wp_s_361), .VCI(core_CM_rdm[16]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_17_ (
    .Func_in(CM_rdm[17]), .SI(wp_s_359), .SO(wp_s_360), .VCI(core_CM_rdm[17]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_18_ (
    .Func_in(CM_rdm[18]), .SI(wp_s_358), .SO(wp_s_359), .VCI(core_CM_rdm[18]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_19_ (
    .Func_in(CM_rdm[19]), .SI(wp_s_357), .SO(wp_s_358), .VCI(core_CM_rdm[19]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_1_ (
    .Func_in(CM_rdm[1]), .SI(wp_s_375), .SO(wp_s_376), .VCI(core_CM_rdm[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_20_ (
    .Func_in(CM_rdm[20]), .SI(wp_s_356), .SO(wp_s_357), .VCI(core_CM_rdm[20]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_21_ (
    .Func_in(CM_rdm[21]), .SI(wp_s_355), .SO(wp_s_356), .VCI(core_CM_rdm[21]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_22_ (
    .Func_in(CM_rdm[22]), .SI(wp_s_354), .SO(wp_s_355), .VCI(core_CM_rdm[22]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_23_ (
    .Func_in(CM_rdm[23]), .SI(wp_s_353), .SO(wp_s_354), .VCI(core_CM_rdm[23]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_2_ (
    .Func_in(CM_rdm[2]), .SI(wp_s_374), .SO(wp_s_375), .VCI(core_CM_rdm[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_3_ (
    .Func_in(CM_rdm[3]), .SI(wp_s_373), .SO(wp_s_374), .VCI(core_CM_rdm[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_4_ (
    .Func_in(CM_rdm[4]), .SI(wp_s_372), .SO(wp_s_373), .VCI(core_CM_rdm[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_5_ (
    .Func_in(CM_rdm[5]), .SI(wp_s_371), .SO(wp_s_372), .VCI(core_CM_rdm[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_6_ (
    .Func_in(CM_rdm[6]), .SI(wp_s_370), .SO(wp_s_371), .VCI(core_CM_rdm[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_7_ (
    .Func_in(CM_rdm[7]), .SI(wp_s_369), .SO(wp_s_370), .VCI(core_CM_rdm[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_8_ (
    .Func_in(CM_rdm[8]), .SI(wp_s_368), .SO(wp_s_369), .VCI(core_CM_rdm[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_CM_rdm_9_ (
    .Func_in(CM_rdm[9]), .SI(wp_s_367), .SO(wp_s_368), .VCI(core_CM_rdm[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_0_ (
    .Func_out(CM_wd[0]), .SI(wp_s_836), .SO(wp_s_837), .VCO(core_CM_wd[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_10_ (
    .Func_out(CM_wd[10]), .SI(wp_s_826), .SO(wp_s_827), .VCO(core_CM_wd[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_11_ (
    .Func_out(CM_wd[11]), .SI(wp_s_825), .SO(wp_s_826), .VCO(core_CM_wd[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_12_ (
    .Func_out(CM_wd[12]), .SI(wp_s_824), .SO(wp_s_825), .VCO(core_CM_wd[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_13_ (
    .Func_out(CM_wd[13]), .SI(wp_s_823), .SO(wp_s_824), .VCO(core_CM_wd[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_14_ (
    .Func_out(CM_wd[14]), .SI(wp_s_822), .SO(wp_s_823), .VCO(core_CM_wd[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_15_ (
    .Func_out(CM_wd[15]), .SI(wp_s_821), .SO(wp_s_822), .VCO(core_CM_wd[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_16_ (
    .Func_out(CM_wd[16]), .SI(wp_s_820), .SO(wp_s_821), .VCO(core_CM_wd[16]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_17_ (
    .Func_out(CM_wd[17]), .SI(wp_s_819), .SO(wp_s_820), .VCO(core_CM_wd[17]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_18_ (
    .Func_out(CM_wd[18]), .SI(wp_s_818), .SO(wp_s_819), .VCO(core_CM_wd[18]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_19_ (
    .Func_out(CM_wd[19]), .SI(wp_s_817), .SO(wp_s_818), .VCO(core_CM_wd[19]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_1_ (
    .Func_out(CM_wd[1]), .SI(wp_s_835), .SO(wp_s_836), .VCO(core_CM_wd[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_20_ (
    .Func_out(CM_wd[20]), .SI(wp_s_816), .SO(wp_s_817), .VCO(core_CM_wd[20]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_21_ (
    .Func_out(CM_wd[21]), .SI(wp_s_815), .SO(wp_s_816), .VCO(core_CM_wd[21]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_22_ (
    .Func_out(CM_wd[22]), .SI(wp_s_814), .SO(wp_s_815), .VCO(core_CM_wd[22]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_23_ (
    .Func_out(CM_wd[23]), .SI(wp_s_813), .SO(wp_s_814), .VCO(core_CM_wd[23]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_2_ (
    .Func_out(CM_wd[2]), .SI(wp_s_834), .SO(wp_s_835), .VCO(core_CM_wd[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_3_ (
    .Func_out(CM_wd[3]), .SI(wp_s_833), .SO(wp_s_834), .VCO(core_CM_wd[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_4_ (
    .Func_out(CM_wd[4]), .SI(wp_s_832), .SO(wp_s_833), .VCO(core_CM_wd[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_5_ (
    .Func_out(CM_wd[5]), .SI(wp_s_831), .SO(wp_s_832), .VCO(core_CM_wd[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_6_ (
    .Func_out(CM_wd[6]), .SI(wp_s_830), .SO(wp_s_831), .VCO(core_CM_wd[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_7_ (
    .Func_out(CM_wd[7]), .SI(wp_s_829), .SO(wp_s_830), .VCO(core_CM_wd[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_8_ (
    .Func_out(CM_wd[8]), .SI(wp_s_828), .SO(wp_s_829), .VCO(core_CM_wd[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_wd_9_ (
    .Func_out(CM_wd[9]), .SI(wp_s_827), .SO(wp_s_828), .VCO(core_CM_wd[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CM_web (
    .Func_out(CM_web), .SI(wp_s_729), .SO(wp_s_730), .VCO(core_CM_web), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_cs0 (
    .Func_out(CMo_cs0), .SI(wp_s_721), .SO(wp_s_722), .VCO(core_CMo_cs0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_cs1 (
    .Func_out(CMo_cs1), .SI(wp_s_722), .SO(wp_s_723), .VCO(core_CMo_cs1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_cs2 (
    .Func_out(CMo_cs2), .SI(wp_s_723), .SO(wp_s_724), .VCO(core_CMo_cs2), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_cs3 (
    .Func_out(CMo_cs3), .SI(wp_s_724), .SO(wp_s_725), .VCO(core_CMo_cs3), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_cs4 (
    .Func_out(CMo_cs4), .SI(wp_s_725), .SO(wp_s_726), .VCO(core_CMo_cs4), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_cs5 (
    .Func_out(CMo_cs5), .SI(wp_s_726), .SO(wp_s_727), .VCO(core_CMo_cs5), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_cs6 (
    .Func_out(CMo_cs6), .SI(wp_s_727), .SO(wp_s_728), .VCO(core_CMo_cs6), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_cs7 (
    .Func_out(CMo_cs7), .SI(wp_s_728), .SO(wp_s_729), .VCO(core_CMo_cs7), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_oe0 (
    .Func_out(CMo_oe0), .SI(wp_s_731), .SO(wp_s_732), .VCO(core_CMo_oe0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_oe1 (
    .Func_out(CMo_oe1), .SI(wp_s_732), .SO(wp_s_733), .VCO(core_CMo_oe1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_oe2 (
    .Func_out(CMo_oe2), .SI(wp_s_733), .SO(wp_s_734), .VCO(core_CMo_oe2), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_oe3 (
    .Func_out(CMo_oe3), .SI(wp_s_734), .SO(wp_s_735), .VCO(core_CMo_oe3), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_oe4 (
    .Func_out(CMo_oe4), .SI(wp_s_735), .SO(wp_s_736), .VCO(core_CMo_oe4), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_oe5 (
    .Func_out(CMo_oe5), .SI(wp_s_736), .SO(wp_s_737), .VCO(core_CMo_oe5), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_oe6 (
    .Func_out(CMo_oe6), .SI(wp_s_737), .SO(wp_s_738), .VCO(core_CMo_oe6), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_CMo_oe7 (
    .Func_out(CMo_oe7), .SI(wp_s_738), .SO(wp_s_739), .VCO(core_CMo_oe7), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMAinx_0_ (
    .Func_out(DMAinx[0]), .SI(wp_s_798), .SO(wp_s_799), .VCO(core_DMAinx[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMAinx_10_ (
    .Func_out(DMAinx[10]), .SI(wp_s_788), .SO(wp_s_789), .VCO(core_DMAinx[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMAinx_11_ (
    .Func_out(DMAinx[11]), .SI(wp_s_787), .SO(wp_s_788), .VCO(core_DMAinx[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMAinx_12_ (
    .Func_out(DMAinx[12]), .SI(wp_s_786), .SO(wp_s_787), .VCO(core_DMAinx[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMAinx_13_ (
    .Func_out(DMAinx[13]), .SI(wp_s_785), .SO(wp_s_786), .VCO(core_DMAinx[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMAinx_1_ (
    .Func_out(DMAinx[1]), .SI(wp_s_797), .SO(wp_s_798), .VCO(core_DMAinx[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMAinx_2_ (
    .Func_out(DMAinx[2]), .SI(wp_s_796), .SO(wp_s_797), .VCO(core_DMAinx[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMAinx_3_ (
    .Func_out(DMAinx[3]), .SI(wp_s_795), .SO(wp_s_796), .VCO(core_DMAinx[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMAinx_4_ (
    .Func_out(DMAinx[4]), .SI(wp_s_794), .SO(wp_s_795), .VCO(core_DMAinx[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMAinx_5_ (
    .Func_out(DMAinx[5]), .SI(wp_s_793), .SO(wp_s_794), .VCO(core_DMAinx[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMAinx_6_ (
    .Func_out(DMAinx[6]), .SI(wp_s_792), .SO(wp_s_793), .VCO(core_DMAinx[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMAinx_7_ (
    .Func_out(DMAinx[7]), .SI(wp_s_791), .SO(wp_s_792), .VCO(core_DMAinx[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMAinx_8_ (
    .Func_out(DMAinx[8]), .SI(wp_s_790), .SO(wp_s_791), .VCO(core_DMAinx[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMAinx_9_ (
    .Func_out(DMAinx[9]), .SI(wp_s_789), .SO(wp_s_790), .VCO(core_DMAinx[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMSn (
    .Func_out(DMSn), .SI(wp_s_584), .SO(wp_s_585), .VCO(core_DMSn), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_cs (
    .Func_out(DM_cs), .SI(wp_s_701), .SO(wp_s_702), .VCO(core_DM_cs), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_oe (
    .Func_out(DM_oe), .SI(wp_s_711), .SO(wp_s_712), .VCO(core_DM_oe), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_0_ (
    .Func_in(DM_rd0[0]), .SI(wp_s_240), .SO(wp_s_241), .VCI(core_DM_rd0[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_10_ (
    .Func_in(DM_rd0[10]), .SI(wp_s_230), .SO(wp_s_231), .VCI(core_DM_rd0[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_11_ (
    .Func_in(DM_rd0[11]), .SI(wp_s_229), .SO(wp_s_230), .VCI(core_DM_rd0[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_12_ (
    .Func_in(DM_rd0[12]), .SI(wp_s_228), .SO(wp_s_229), .VCI(core_DM_rd0[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_13_ (
    .Func_in(DM_rd0[13]), .SI(wp_s_227), .SO(wp_s_228), .VCI(core_DM_rd0[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_14_ (
    .Func_in(DM_rd0[14]), .SI(wp_s_226), .SO(wp_s_227), .VCI(core_DM_rd0[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_15_ (
    .Func_in(DM_rd0[15]), .SI(wp_s_225), .SO(wp_s_226), .VCI(core_DM_rd0[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_1_ (
    .Func_in(DM_rd0[1]), .SI(wp_s_239), .SO(wp_s_240), .VCI(core_DM_rd0[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_2_ (
    .Func_in(DM_rd0[2]), .SI(wp_s_238), .SO(wp_s_239), .VCI(core_DM_rd0[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_3_ (
    .Func_in(DM_rd0[3]), .SI(wp_s_237), .SO(wp_s_238), .VCI(core_DM_rd0[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_4_ (
    .Func_in(DM_rd0[4]), .SI(wp_s_236), .SO(wp_s_237), .VCI(core_DM_rd0[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_5_ (
    .Func_in(DM_rd0[5]), .SI(wp_s_235), .SO(wp_s_236), .VCI(core_DM_rd0[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_6_ (
    .Func_in(DM_rd0[6]), .SI(wp_s_234), .SO(wp_s_235), .VCI(core_DM_rd0[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_7_ (
    .Func_in(DM_rd0[7]), .SI(wp_s_233), .SO(wp_s_234), .VCI(core_DM_rd0[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_8_ (
    .Func_in(DM_rd0[8]), .SI(wp_s_232), .SO(wp_s_233), .VCI(core_DM_rd0[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd0_9_ (
    .Func_in(DM_rd0[9]), .SI(wp_s_231), .SO(wp_s_232), .VCI(core_DM_rd0[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_0_ (
    .Func_in(DM_rd1[0]), .SI(wp_s_256), .SO(wp_s_257), .VCI(core_DM_rd1[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_10_ (
    .Func_in(DM_rd1[10]), .SI(wp_s_246), .SO(wp_s_247), .VCI(core_DM_rd1[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_11_ (
    .Func_in(DM_rd1[11]), .SI(wp_s_245), .SO(wp_s_246), .VCI(core_DM_rd1[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_12_ (
    .Func_in(DM_rd1[12]), .SI(wp_s_244), .SO(wp_s_245), .VCI(core_DM_rd1[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_13_ (
    .Func_in(DM_rd1[13]), .SI(wp_s_243), .SO(wp_s_244), .VCI(core_DM_rd1[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_14_ (
    .Func_in(DM_rd1[14]), .SI(wp_s_242), .SO(wp_s_243), .VCI(core_DM_rd1[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_15_ (
    .Func_in(DM_rd1[15]), .SI(wp_s_241), .SO(wp_s_242), .VCI(core_DM_rd1[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_1_ (
    .Func_in(DM_rd1[1]), .SI(wp_s_255), .SO(wp_s_256), .VCI(core_DM_rd1[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_2_ (
    .Func_in(DM_rd1[2]), .SI(wp_s_254), .SO(wp_s_255), .VCI(core_DM_rd1[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_3_ (
    .Func_in(DM_rd1[3]), .SI(wp_s_253), .SO(wp_s_254), .VCI(core_DM_rd1[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_4_ (
    .Func_in(DM_rd1[4]), .SI(wp_s_252), .SO(wp_s_253), .VCI(core_DM_rd1[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_5_ (
    .Func_in(DM_rd1[5]), .SI(wp_s_251), .SO(wp_s_252), .VCI(core_DM_rd1[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_6_ (
    .Func_in(DM_rd1[6]), .SI(wp_s_250), .SO(wp_s_251), .VCI(core_DM_rd1[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_7_ (
    .Func_in(DM_rd1[7]), .SI(wp_s_249), .SO(wp_s_250), .VCI(core_DM_rd1[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_8_ (
    .Func_in(DM_rd1[8]), .SI(wp_s_248), .SO(wp_s_249), .VCI(core_DM_rd1[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd1_9_ (
    .Func_in(DM_rd1[9]), .SI(wp_s_247), .SO(wp_s_248), .VCI(core_DM_rd1[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_0_ (
    .Func_in(DM_rd2[0]), .SI(wp_s_272), .SO(wp_s_273), .VCI(core_DM_rd2[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_10_ (
    .Func_in(DM_rd2[10]), .SI(wp_s_262), .SO(wp_s_263), .VCI(core_DM_rd2[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_11_ (
    .Func_in(DM_rd2[11]), .SI(wp_s_261), .SO(wp_s_262), .VCI(core_DM_rd2[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_12_ (
    .Func_in(DM_rd2[12]), .SI(wp_s_260), .SO(wp_s_261), .VCI(core_DM_rd2[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_13_ (
    .Func_in(DM_rd2[13]), .SI(wp_s_259), .SO(wp_s_260), .VCI(core_DM_rd2[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_14_ (
    .Func_in(DM_rd2[14]), .SI(wp_s_258), .SO(wp_s_259), .VCI(core_DM_rd2[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_15_ (
    .Func_in(DM_rd2[15]), .SI(wp_s_257), .SO(wp_s_258), .VCI(core_DM_rd2[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_1_ (
    .Func_in(DM_rd2[1]), .SI(wp_s_271), .SO(wp_s_272), .VCI(core_DM_rd2[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_2_ (
    .Func_in(DM_rd2[2]), .SI(wp_s_270), .SO(wp_s_271), .VCI(core_DM_rd2[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_3_ (
    .Func_in(DM_rd2[3]), .SI(wp_s_269), .SO(wp_s_270), .VCI(core_DM_rd2[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_4_ (
    .Func_in(DM_rd2[4]), .SI(wp_s_268), .SO(wp_s_269), .VCI(core_DM_rd2[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_5_ (
    .Func_in(DM_rd2[5]), .SI(wp_s_267), .SO(wp_s_268), .VCI(core_DM_rd2[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_6_ (
    .Func_in(DM_rd2[6]), .SI(wp_s_266), .SO(wp_s_267), .VCI(core_DM_rd2[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_7_ (
    .Func_in(DM_rd2[7]), .SI(wp_s_265), .SO(wp_s_266), .VCI(core_DM_rd2[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_8_ (
    .Func_in(DM_rd2[8]), .SI(wp_s_264), .SO(wp_s_265), .VCI(core_DM_rd2[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd2_9_ (
    .Func_in(DM_rd2[9]), .SI(wp_s_263), .SO(wp_s_264), .VCI(core_DM_rd2[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_0_ (
    .Func_in(DM_rd3[0]), .SI(wp_s_288), .SO(wp_s_289), .VCI(core_DM_rd3[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_10_ (
    .Func_in(DM_rd3[10]), .SI(wp_s_278), .SO(wp_s_279), .VCI(core_DM_rd3[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_11_ (
    .Func_in(DM_rd3[11]), .SI(wp_s_277), .SO(wp_s_278), .VCI(core_DM_rd3[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_12_ (
    .Func_in(DM_rd3[12]), .SI(wp_s_276), .SO(wp_s_277), .VCI(core_DM_rd3[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_13_ (
    .Func_in(DM_rd3[13]), .SI(wp_s_275), .SO(wp_s_276), .VCI(core_DM_rd3[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_14_ (
    .Func_in(DM_rd3[14]), .SI(wp_s_274), .SO(wp_s_275), .VCI(core_DM_rd3[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_15_ (
    .Func_in(DM_rd3[15]), .SI(wp_s_273), .SO(wp_s_274), .VCI(core_DM_rd3[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_1_ (
    .Func_in(DM_rd3[1]), .SI(wp_s_287), .SO(wp_s_288), .VCI(core_DM_rd3[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_2_ (
    .Func_in(DM_rd3[2]), .SI(wp_s_286), .SO(wp_s_287), .VCI(core_DM_rd3[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_3_ (
    .Func_in(DM_rd3[3]), .SI(wp_s_285), .SO(wp_s_286), .VCI(core_DM_rd3[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_4_ (
    .Func_in(DM_rd3[4]), .SI(wp_s_284), .SO(wp_s_285), .VCI(core_DM_rd3[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_5_ (
    .Func_in(DM_rd3[5]), .SI(wp_s_283), .SO(wp_s_284), .VCI(core_DM_rd3[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_6_ (
    .Func_in(DM_rd3[6]), .SI(wp_s_282), .SO(wp_s_283), .VCI(core_DM_rd3[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_7_ (
    .Func_in(DM_rd3[7]), .SI(wp_s_281), .SO(wp_s_282), .VCI(core_DM_rd3[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_8_ (
    .Func_in(DM_rd3[8]), .SI(wp_s_280), .SO(wp_s_281), .VCI(core_DM_rd3[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd3_9_ (
    .Func_in(DM_rd3[9]), .SI(wp_s_279), .SO(wp_s_280), .VCI(core_DM_rd3[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_0_ (
    .Func_in(DM_rd4[0]), .SI(wp_s_304), .SO(wp_s_305), .VCI(core_DM_rd4[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_10_ (
    .Func_in(DM_rd4[10]), .SI(wp_s_294), .SO(wp_s_295), .VCI(core_DM_rd4[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_11_ (
    .Func_in(DM_rd4[11]), .SI(wp_s_293), .SO(wp_s_294), .VCI(core_DM_rd4[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_12_ (
    .Func_in(DM_rd4[12]), .SI(wp_s_292), .SO(wp_s_293), .VCI(core_DM_rd4[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_13_ (
    .Func_in(DM_rd4[13]), .SI(wp_s_291), .SO(wp_s_292), .VCI(core_DM_rd4[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_14_ (
    .Func_in(DM_rd4[14]), .SI(wp_s_290), .SO(wp_s_291), .VCI(core_DM_rd4[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_15_ (
    .Func_in(DM_rd4[15]), .SI(wp_s_289), .SO(wp_s_290), .VCI(core_DM_rd4[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_1_ (
    .Func_in(DM_rd4[1]), .SI(wp_s_303), .SO(wp_s_304), .VCI(core_DM_rd4[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_2_ (
    .Func_in(DM_rd4[2]), .SI(wp_s_302), .SO(wp_s_303), .VCI(core_DM_rd4[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_3_ (
    .Func_in(DM_rd4[3]), .SI(wp_s_301), .SO(wp_s_302), .VCI(core_DM_rd4[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_4_ (
    .Func_in(DM_rd4[4]), .SI(wp_s_300), .SO(wp_s_301), .VCI(core_DM_rd4[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_5_ (
    .Func_in(DM_rd4[5]), .SI(wp_s_299), .SO(wp_s_300), .VCI(core_DM_rd4[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_6_ (
    .Func_in(DM_rd4[6]), .SI(wp_s_298), .SO(wp_s_299), .VCI(core_DM_rd4[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_7_ (
    .Func_in(DM_rd4[7]), .SI(wp_s_297), .SO(wp_s_298), .VCI(core_DM_rd4[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_8_ (
    .Func_in(DM_rd4[8]), .SI(wp_s_296), .SO(wp_s_297), .VCI(core_DM_rd4[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd4_9_ (
    .Func_in(DM_rd4[9]), .SI(wp_s_295), .SO(wp_s_296), .VCI(core_DM_rd4[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_0_ (
    .Func_in(DM_rd5[0]), .SI(wp_s_320), .SO(wp_s_321), .VCI(core_DM_rd5[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_10_ (
    .Func_in(DM_rd5[10]), .SI(wp_s_310), .SO(wp_s_311), .VCI(core_DM_rd5[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_11_ (
    .Func_in(DM_rd5[11]), .SI(wp_s_309), .SO(wp_s_310), .VCI(core_DM_rd5[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_12_ (
    .Func_in(DM_rd5[12]), .SI(wp_s_308), .SO(wp_s_309), .VCI(core_DM_rd5[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_13_ (
    .Func_in(DM_rd5[13]), .SI(wp_s_307), .SO(wp_s_308), .VCI(core_DM_rd5[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_14_ (
    .Func_in(DM_rd5[14]), .SI(wp_s_306), .SO(wp_s_307), .VCI(core_DM_rd5[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_15_ (
    .Func_in(DM_rd5[15]), .SI(wp_s_305), .SO(wp_s_306), .VCI(core_DM_rd5[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_1_ (
    .Func_in(DM_rd5[1]), .SI(wp_s_319), .SO(wp_s_320), .VCI(core_DM_rd5[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_2_ (
    .Func_in(DM_rd5[2]), .SI(wp_s_318), .SO(wp_s_319), .VCI(core_DM_rd5[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_3_ (
    .Func_in(DM_rd5[3]), .SI(wp_s_317), .SO(wp_s_318), .VCI(core_DM_rd5[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_4_ (
    .Func_in(DM_rd5[4]), .SI(wp_s_316), .SO(wp_s_317), .VCI(core_DM_rd5[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_5_ (
    .Func_in(DM_rd5[5]), .SI(wp_s_315), .SO(wp_s_316), .VCI(core_DM_rd5[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_6_ (
    .Func_in(DM_rd5[6]), .SI(wp_s_314), .SO(wp_s_315), .VCI(core_DM_rd5[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_7_ (
    .Func_in(DM_rd5[7]), .SI(wp_s_313), .SO(wp_s_314), .VCI(core_DM_rd5[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_8_ (
    .Func_in(DM_rd5[8]), .SI(wp_s_312), .SO(wp_s_313), .VCI(core_DM_rd5[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd5_9_ (
    .Func_in(DM_rd5[9]), .SI(wp_s_311), .SO(wp_s_312), .VCI(core_DM_rd5[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_0_ (
    .Func_in(DM_rd6[0]), .SI(wp_s_336), .SO(wp_s_337), .VCI(core_DM_rd6[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_10_ (
    .Func_in(DM_rd6[10]), .SI(wp_s_326), .SO(wp_s_327), .VCI(core_DM_rd6[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_11_ (
    .Func_in(DM_rd6[11]), .SI(wp_s_325), .SO(wp_s_326), .VCI(core_DM_rd6[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_12_ (
    .Func_in(DM_rd6[12]), .SI(wp_s_324), .SO(wp_s_325), .VCI(core_DM_rd6[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_13_ (
    .Func_in(DM_rd6[13]), .SI(wp_s_323), .SO(wp_s_324), .VCI(core_DM_rd6[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_14_ (
    .Func_in(DM_rd6[14]), .SI(wp_s_322), .SO(wp_s_323), .VCI(core_DM_rd6[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_15_ (
    .Func_in(DM_rd6[15]), .SI(wp_s_321), .SO(wp_s_322), .VCI(core_DM_rd6[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_1_ (
    .Func_in(DM_rd6[1]), .SI(wp_s_335), .SO(wp_s_336), .VCI(core_DM_rd6[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_2_ (
    .Func_in(DM_rd6[2]), .SI(wp_s_334), .SO(wp_s_335), .VCI(core_DM_rd6[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_3_ (
    .Func_in(DM_rd6[3]), .SI(wp_s_333), .SO(wp_s_334), .VCI(core_DM_rd6[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_4_ (
    .Func_in(DM_rd6[4]), .SI(wp_s_332), .SO(wp_s_333), .VCI(core_DM_rd6[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_5_ (
    .Func_in(DM_rd6[5]), .SI(wp_s_331), .SO(wp_s_332), .VCI(core_DM_rd6[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_6_ (
    .Func_in(DM_rd6[6]), .SI(wp_s_330), .SO(wp_s_331), .VCI(core_DM_rd6[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_7_ (
    .Func_in(DM_rd6[7]), .SI(wp_s_329), .SO(wp_s_330), .VCI(core_DM_rd6[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_8_ (
    .Func_in(DM_rd6[8]), .SI(wp_s_328), .SO(wp_s_329), .VCI(core_DM_rd6[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd6_9_ (
    .Func_in(DM_rd6[9]), .SI(wp_s_327), .SO(wp_s_328), .VCI(core_DM_rd6[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_0_ (
    .Func_in(DM_rd7[0]), .SI(wp_s_352), .SO(wp_s_353), .VCI(core_DM_rd7[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_10_ (
    .Func_in(DM_rd7[10]), .SI(wp_s_342), .SO(wp_s_343), .VCI(core_DM_rd7[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_11_ (
    .Func_in(DM_rd7[11]), .SI(wp_s_341), .SO(wp_s_342), .VCI(core_DM_rd7[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_12_ (
    .Func_in(DM_rd7[12]), .SI(wp_s_340), .SO(wp_s_341), .VCI(core_DM_rd7[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_13_ (
    .Func_in(DM_rd7[13]), .SI(wp_s_339), .SO(wp_s_340), .VCI(core_DM_rd7[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_14_ (
    .Func_in(DM_rd7[14]), .SI(wp_s_338), .SO(wp_s_339), .VCI(core_DM_rd7[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_15_ (
    .Func_in(DM_rd7[15]), .SI(wp_s_337), .SO(wp_s_338), .VCI(core_DM_rd7[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_1_ (
    .Func_in(DM_rd7[1]), .SI(wp_s_351), .SO(wp_s_352), .VCI(core_DM_rd7[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_2_ (
    .Func_in(DM_rd7[2]), .SI(wp_s_350), .SO(wp_s_351), .VCI(core_DM_rd7[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_3_ (
    .Func_in(DM_rd7[3]), .SI(wp_s_349), .SO(wp_s_350), .VCI(core_DM_rd7[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_4_ (
    .Func_in(DM_rd7[4]), .SI(wp_s_348), .SO(wp_s_349), .VCI(core_DM_rd7[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_5_ (
    .Func_in(DM_rd7[5]), .SI(wp_s_347), .SO(wp_s_348), .VCI(core_DM_rd7[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_6_ (
    .Func_in(DM_rd7[6]), .SI(wp_s_346), .SO(wp_s_347), .VCI(core_DM_rd7[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_7_ (
    .Func_in(DM_rd7[7]), .SI(wp_s_345), .SO(wp_s_346), .VCI(core_DM_rd7[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_8_ (
    .Func_in(DM_rd7[8]), .SI(wp_s_344), .SO(wp_s_345), .VCI(core_DM_rd7[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rd7_9_ (
    .Func_in(DM_rd7[9]), .SI(wp_s_343), .SO(wp_s_344), .VCI(core_DM_rd7[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_0_ (
    .Func_in(DM_rdm[0]), .SI(wp_s_224), .SO(wp_s_225), .VCI(core_DM_rdm[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_10_ (
    .Func_in(DM_rdm[10]), .SI(wp_s_214), .SO(wp_s_215), .VCI(core_DM_rdm[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_11_ (
    .Func_in(DM_rdm[11]), .SI(wp_s_213), .SO(wp_s_214), .VCI(core_DM_rdm[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_12_ (
    .Func_in(DM_rdm[12]), .SI(wp_s_212), .SO(wp_s_213), .VCI(core_DM_rdm[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_13_ (
    .Func_in(DM_rdm[13]), .SI(wp_s_211), .SO(wp_s_212), .VCI(core_DM_rdm[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_14_ (
    .Func_in(DM_rdm[14]), .SI(wp_s_210), .SO(wp_s_211), .VCI(core_DM_rdm[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_15_ (
    .Func_in(DM_rdm[15]), .SI(wp_s_209), .SO(wp_s_210), .VCI(core_DM_rdm[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_1_ (
    .Func_in(DM_rdm[1]), .SI(wp_s_223), .SO(wp_s_224), .VCI(core_DM_rdm[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_2_ (
    .Func_in(DM_rdm[2]), .SI(wp_s_222), .SO(wp_s_223), .VCI(core_DM_rdm[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_3_ (
    .Func_in(DM_rdm[3]), .SI(wp_s_221), .SO(wp_s_222), .VCI(core_DM_rdm[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_4_ (
    .Func_in(DM_rdm[4]), .SI(wp_s_220), .SO(wp_s_221), .VCI(core_DM_rdm[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_5_ (
    .Func_in(DM_rdm[5]), .SI(wp_s_219), .SO(wp_s_220), .VCI(core_DM_rdm[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_6_ (
    .Func_in(DM_rdm[6]), .SI(wp_s_218), .SO(wp_s_219), .VCI(core_DM_rdm[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_7_ (
    .Func_in(DM_rdm[7]), .SI(wp_s_217), .SO(wp_s_218), .VCI(core_DM_rdm[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_8_ (
    .Func_in(DM_rdm[8]), .SI(wp_s_216), .SO(wp_s_217), .VCI(core_DM_rdm[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_DM_rdm_9_ (
    .Func_in(DM_rdm[9]), .SI(wp_s_215), .SO(wp_s_216), .VCI(core_DM_rdm[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_0_ (
    .Func_out(DM_wd[0]), .SI(wp_s_770), .SO(wp_s_771), .VCO(core_DM_wd[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_10_ (
    .Func_out(DM_wd[10]), .SI(wp_s_760), .SO(wp_s_761), .VCO(core_DM_wd[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_11_ (
    .Func_out(DM_wd[11]), .SI(wp_s_759), .SO(wp_s_760), .VCO(core_DM_wd[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_12_ (
    .Func_out(DM_wd[12]), .SI(wp_s_758), .SO(wp_s_759), .VCO(core_DM_wd[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_13_ (
    .Func_out(DM_wd[13]), .SI(wp_s_757), .SO(wp_s_758), .VCO(core_DM_wd[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_14_ (
    .Func_out(DM_wd[14]), .SI(wp_s_756), .SO(wp_s_757), .VCO(core_DM_wd[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_15_ (
    .Func_out(DM_wd[15]), .SI(wp_s_755), .SO(wp_s_756), .VCO(core_DM_wd[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_1_ (
    .Func_out(DM_wd[1]), .SI(wp_s_769), .SO(wp_s_770), .VCO(core_DM_wd[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_2_ (
    .Func_out(DM_wd[2]), .SI(wp_s_768), .SO(wp_s_769), .VCO(core_DM_wd[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_3_ (
    .Func_out(DM_wd[3]), .SI(wp_s_767), .SO(wp_s_768), .VCO(core_DM_wd[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_4_ (
    .Func_out(DM_wd[4]), .SI(wp_s_766), .SO(wp_s_767), .VCO(core_DM_wd[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_5_ (
    .Func_out(DM_wd[5]), .SI(wp_s_765), .SO(wp_s_766), .VCO(core_DM_wd[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_6_ (
    .Func_out(DM_wd[6]), .SI(wp_s_764), .SO(wp_s_765), .VCO(core_DM_wd[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_7_ (
    .Func_out(DM_wd[7]), .SI(wp_s_763), .SO(wp_s_764), .VCO(core_DM_wd[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_8_ (
    .Func_out(DM_wd[8]), .SI(wp_s_762), .SO(wp_s_763), .VCO(core_DM_wd[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DM_wd_9_ (
    .Func_out(DM_wd[9]), .SI(wp_s_761), .SO(wp_s_762), .VCO(core_DM_wd[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_cs0 (
    .Func_out(DMo_cs0), .SI(wp_s_702), .SO(wp_s_703), .VCO(core_DMo_cs0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_cs1 (
    .Func_out(DMo_cs1), .SI(wp_s_703), .SO(wp_s_704), .VCO(core_DMo_cs1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_cs2 (
    .Func_out(DMo_cs2), .SI(wp_s_704), .SO(wp_s_705), .VCO(core_DMo_cs2), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_cs3 (
    .Func_out(DMo_cs3), .SI(wp_s_705), .SO(wp_s_706), .VCO(core_DMo_cs3), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_cs4 (
    .Func_out(DMo_cs4), .SI(wp_s_706), .SO(wp_s_707), .VCO(core_DMo_cs4), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_cs5 (
    .Func_out(DMo_cs5), .SI(wp_s_707), .SO(wp_s_708), .VCO(core_DMo_cs5), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_cs6 (
    .Func_out(DMo_cs6), .SI(wp_s_708), .SO(wp_s_709), .VCO(core_DMo_cs6), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_cs7 (
    .Func_out(DMo_cs7), .SI(wp_s_709), .SO(wp_s_710), .VCO(core_DMo_cs7), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_oe0 (
    .Func_out(DMo_oe0), .SI(wp_s_712), .SO(wp_s_713), .VCO(core_DMo_oe0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_oe1 (
    .Func_out(DMo_oe1), .SI(wp_s_713), .SO(wp_s_714), .VCO(core_DMo_oe1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_oe2 (
    .Func_out(DMo_oe2), .SI(wp_s_714), .SO(wp_s_715), .VCO(core_DMo_oe2), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_oe3 (
    .Func_out(DMo_oe3), .SI(wp_s_715), .SO(wp_s_716), .VCO(core_DMo_oe3), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_oe4 (
    .Func_out(DMo_oe4), .SI(wp_s_716), .SO(wp_s_717), .VCO(core_DMo_oe4), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_oe5 (
    .Func_out(DMo_oe5), .SI(wp_s_717), .SO(wp_s_718), .VCO(core_DMo_oe5), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_oe6 (
    .Func_out(DMo_oe6), .SI(wp_s_718), .SO(wp_s_719), .VCO(core_DMo_oe6), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_oe7 (
    .Func_out(DMo_oe7), .SI(wp_s_719), .SO(wp_s_720), .VCO(core_DMo_oe7), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DMo_web (
    .Func_out(DMo_web), .SI(wp_s_710), .SO(wp_s_711), .VCO(core_DMo_web), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DSPCLK_cm0 (
    .Func_out(DSPCLK_cm0), .SI(wp_s_569), .SO(wp_s_570), .VCO(core_DSPCLK_cm0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DSPCLK_cm1 (
    .Func_out(DSPCLK_cm1), .SI(wp_s_570), .SO(wp_s_571), .VCO(core_DSPCLK_cm1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DSPCLK_cm2 (
    .Func_out(DSPCLK_cm2), .SI(wp_s_571), .SO(wp_s_572), .VCO(core_DSPCLK_cm2), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DSPCLK_dm0 (
    .Func_out(DSPCLK_dm0), .SI(wp_s_575), .SO(wp_s_576), .VCO(core_DSPCLK_dm0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DSPCLK_dm1 (
    .Func_out(DSPCLK_dm1), .SI(wp_s_576), .SO(wp_s_577), .VCO(core_DSPCLK_dm1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DSPCLK_dm2 (
    .Func_out(DSPCLK_dm2), .SI(wp_s_577), .SO(wp_s_578), .VCO(core_DSPCLK_dm2), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DSPCLK_pm0 (
    .Func_out(DSPCLK_pm0), .SI(wp_s_572), .SO(wp_s_573), .VCO(core_DSPCLK_pm0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DSPCLK_pm1 (
    .Func_out(DSPCLK_pm1), .SI(wp_s_573), .SO(wp_s_574), .VCO(core_DSPCLK_pm1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_DSPCLK_pm2 (
    .Func_out(DSPCLK_pm2), .SI(wp_s_574), .SO(wp_s_575), .VCO(core_DSPCLK_pm2), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_0_ (
    .Func_out(EA_do[0]), .SI(wp_s_625), .SO(wp_s_626), .VCO(core_EA_do[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_10_ (
    .Func_out(EA_do[10]), .SI(wp_s_615), .SO(wp_s_616), .VCO(core_EA_do[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_11_ (
    .Func_out(EA_do[11]), .SI(wp_s_614), .SO(wp_s_615), .VCO(core_EA_do[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_12_ (
    .Func_out(EA_do[12]), .SI(wp_s_613), .SO(wp_s_614), .VCO(core_EA_do[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_13_ (
    .Func_out(EA_do[13]), .SI(wp_s_612), .SO(wp_s_613), .VCO(core_EA_do[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_14_ (
    .Func_out(EA_do[14]), .SI(wp_s_611), .SO(wp_s_612), .VCO(core_EA_do[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_1_ (
    .Func_out(EA_do[1]), .SI(wp_s_624), .SO(wp_s_625), .VCO(core_EA_do[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_2_ (
    .Func_out(EA_do[2]), .SI(wp_s_623), .SO(wp_s_624), .VCO(core_EA_do[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_3_ (
    .Func_out(EA_do[3]), .SI(wp_s_622), .SO(wp_s_623), .VCO(core_EA_do[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_4_ (
    .Func_out(EA_do[4]), .SI(wp_s_621), .SO(wp_s_622), .VCO(core_EA_do[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_5_ (
    .Func_out(EA_do[5]), .SI(wp_s_620), .SO(wp_s_621), .VCO(core_EA_do[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_6_ (
    .Func_out(EA_do[6]), .SI(wp_s_619), .SO(wp_s_620), .VCO(core_EA_do[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_7_ (
    .Func_out(EA_do[7]), .SI(wp_s_618), .SO(wp_s_619), .VCO(core_EA_do[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_8_ (
    .Func_out(EA_do[8]), .SI(wp_s_617), .SO(wp_s_618), .VCO(core_EA_do[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_do_9_ (
    .Func_out(EA_do[9]), .SI(wp_s_616), .SO(wp_s_617), .VCO(core_EA_do[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_EA_oe (
    .Func_out(EA_oe), .SI(wp_s_582), .SO(wp_s_583), .VCO(core_EA_oe), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ECMA_EN (
    .Func_out(ECMA_EN), .SI(wp_s_594), .SO(wp_s_595), .VCO(core_ECMA_EN), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ECMSn (
    .Func_out(ECMSn), .SI(wp_s_593), .SO(wp_s_594), .VCO(core_ECMSn), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_0_ (
    .Func_out(ED_do[0]), .SI(wp_s_610), .SO(wp_s_611), .VCO(core_ED_do[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_10_ (
    .Func_out(ED_do[10]), .SI(wp_s_600), .SO(wp_s_601), .VCO(core_ED_do[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_11_ (
    .Func_out(ED_do[11]), .SI(wp_s_599), .SO(wp_s_600), .VCO(core_ED_do[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_12_ (
    .Func_out(ED_do[12]), .SI(wp_s_598), .SO(wp_s_599), .VCO(core_ED_do[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_13_ (
    .Func_out(ED_do[13]), .SI(wp_s_597), .SO(wp_s_598), .VCO(core_ED_do[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_14_ (
    .Func_out(ED_do[14]), .SI(wp_s_596), .SO(wp_s_597), .VCO(core_ED_do[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_15_ (
    .Func_out(ED_do[15]), .SI(wp_s_595), .SO(wp_s_596), .VCO(core_ED_do[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_1_ (
    .Func_out(ED_do[1]), .SI(wp_s_609), .SO(wp_s_610), .VCO(core_ED_do[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_2_ (
    .Func_out(ED_do[2]), .SI(wp_s_608), .SO(wp_s_609), .VCO(core_ED_do[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_3_ (
    .Func_out(ED_do[3]), .SI(wp_s_607), .SO(wp_s_608), .VCO(core_ED_do[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_4_ (
    .Func_out(ED_do[4]), .SI(wp_s_606), .SO(wp_s_607), .VCO(core_ED_do[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_5_ (
    .Func_out(ED_do[5]), .SI(wp_s_605), .SO(wp_s_606), .VCO(core_ED_do[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_6_ (
    .Func_out(ED_do[6]), .SI(wp_s_604), .SO(wp_s_605), .VCO(core_ED_do[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_7_ (
    .Func_out(ED_do[7]), .SI(wp_s_603), .SO(wp_s_604), .VCO(core_ED_do[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_8_ (
    .Func_out(ED_do[8]), .SI(wp_s_602), .SO(wp_s_603), .VCO(core_ED_do[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_do_9_ (
    .Func_out(ED_do[9]), .SI(wp_s_601), .SO(wp_s_602), .VCO(core_ED_do[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_oe_14_8 (
    .Func_out(ED_oe_14_8), .SI(wp_s_591), .SO(wp_s_592), .VCO(core_ED_oe_14_8), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_oe_15 (
    .Func_out(ED_oe_15), .SI(wp_s_590), .SO(wp_s_591), .VCO(core_ED_oe_15), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ED_oe_7_0 (
    .Func_out(ED_oe_7_0), .SI(wp_s_592), .SO(wp_s_593), .VCO(core_ED_oe_7_0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IACKn (
    .Func_out(IACKn), .SI(wp_s_640), .SO(wp_s_641), .VCO(core_IACKn), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_0_ (
    .Func_out(IAD_do[0]), .SI(wp_s_657), .SO(wp_s_658), .VCO(core_IAD_do[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_10_ (
    .Func_out(IAD_do[10]), .SI(wp_s_647), .SO(wp_s_648), .VCO(core_IAD_do[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_11_ (
    .Func_out(IAD_do[11]), .SI(wp_s_646), .SO(wp_s_647), .VCO(core_IAD_do[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_12_ (
    .Func_out(IAD_do[12]), .SI(wp_s_645), .SO(wp_s_646), .VCO(core_IAD_do[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_13_ (
    .Func_out(IAD_do[13]), .SI(wp_s_644), .SO(wp_s_645), .VCO(core_IAD_do[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_14_ (
    .Func_out(IAD_do[14]), .SI(wp_s_643), .SO(wp_s_644), .VCO(core_IAD_do[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_15_ (
    .Func_out(IAD_do[15]), .SI(wp_s_642), .SO(wp_s_643), .VCO(core_IAD_do[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_1_ (
    .Func_out(IAD_do[1]), .SI(wp_s_656), .SO(wp_s_657), .VCO(core_IAD_do[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_2_ (
    .Func_out(IAD_do[2]), .SI(wp_s_655), .SO(wp_s_656), .VCO(core_IAD_do[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_3_ (
    .Func_out(IAD_do[3]), .SI(wp_s_654), .SO(wp_s_655), .VCO(core_IAD_do[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_4_ (
    .Func_out(IAD_do[4]), .SI(wp_s_653), .SO(wp_s_654), .VCO(core_IAD_do[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_5_ (
    .Func_out(IAD_do[5]), .SI(wp_s_652), .SO(wp_s_653), .VCO(core_IAD_do[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_6_ (
    .Func_out(IAD_do[6]), .SI(wp_s_651), .SO(wp_s_652), .VCO(core_IAD_do[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_7_ (
    .Func_out(IAD_do[7]), .SI(wp_s_650), .SO(wp_s_651), .VCO(core_IAD_do[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_8_ (
    .Func_out(IAD_do[8]), .SI(wp_s_649), .SO(wp_s_650), .VCO(core_IAD_do[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_do_9_ (
    .Func_out(IAD_do[9]), .SI(wp_s_648), .SO(wp_s_649), .VCO(core_IAD_do[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IAD_oe (
    .Func_out(IAD_oe), .SI(wp_s_641), .SO(wp_s_642), .VCO(core_IAD_oe), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IDo (
    .Func_out(IDo), .SI(wp_s_682), .SO(wp_s_683), .VCO(core_IDo), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IDoe (
    .Func_out(IDoe), .SI(wp_s_683), .SO(wp_s_684), .VCO(core_IDoe), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IOSn (
    .Func_out(IOSn), .SI(wp_s_585), .SO(wp_s_586), .VCO(core_IOSn), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IRFS0 (
    .Func_out(IRFS0), .SI(wp_s_633), .SO(wp_s_634), .VCO(core_IRFS0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_IRFS1 (
    .Func_out(IRFS1), .SI(wp_s_637), .SO(wp_s_638), .VCO(core_IRFS1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ISCLK0 (
    .Func_out(ISCLK0), .SI(wp_s_629), .SO(wp_s_630), .VCO(core_ISCLK0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ISCLK1 (
    .Func_out(ISCLK1), .SI(wp_s_631), .SO(wp_s_632), .VCO(core_ISCLK1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ITFS0 (
    .Func_out(ITFS0), .SI(wp_s_635), .SO(wp_s_636), .VCO(core_ITFS0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_ITFS1 (
    .Func_out(ITFS1), .SI(wp_s_639), .SO(wp_s_640), .VCO(core_ITFS1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_oe_0_ (
    .Func_out(PIO_oe[0]), .SI(wp_s_669), .SO(wp_s_670), .VCO(core_PIO_oe[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_oe_10_ (
    .Func_out(PIO_oe[10]), .SI(wp_s_659), .SO(wp_s_660), .VCO(core_PIO_oe[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_oe_11_ (
    .Func_out(PIO_oe[11]), .SI(wp_s_658), .SO(wp_s_659), .VCO(core_PIO_oe[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_oe_1_ (
    .Func_out(PIO_oe[1]), .SI(wp_s_668), .SO(wp_s_669), .VCO(core_PIO_oe[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_oe_2_ (
    .Func_out(PIO_oe[2]), .SI(wp_s_667), .SO(wp_s_668), .VCO(core_PIO_oe[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_oe_3_ (
    .Func_out(PIO_oe[3]), .SI(wp_s_666), .SO(wp_s_667), .VCO(core_PIO_oe[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_oe_4_ (
    .Func_out(PIO_oe[4]), .SI(wp_s_665), .SO(wp_s_666), .VCO(core_PIO_oe[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_oe_5_ (
    .Func_out(PIO_oe[5]), .SI(wp_s_664), .SO(wp_s_665), .VCO(core_PIO_oe[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_oe_6_ (
    .Func_out(PIO_oe[6]), .SI(wp_s_663), .SO(wp_s_664), .VCO(core_PIO_oe[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_oe_7_ (
    .Func_out(PIO_oe[7]), .SI(wp_s_662), .SO(wp_s_663), .VCO(core_PIO_oe[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_oe_8_ (
    .Func_out(PIO_oe[8]), .SI(wp_s_661), .SO(wp_s_662), .VCO(core_PIO_oe[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_oe_9_ (
    .Func_out(PIO_oe[9]), .SI(wp_s_660), .SO(wp_s_661), .VCO(core_PIO_oe[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_out_0_ (
    .Func_out(PIO_out[0]), .SI(wp_s_681), .SO(wp_s_682), .VCO(core_PIO_out[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_out_10_ (
    .Func_out(PIO_out[10]), .SI(wp_s_671), .SO(wp_s_672), .VCO(core_PIO_out[10]),
     .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_out_11_ (
    .Func_out(PIO_out[11]), .SI(wp_s_670), .SO(wp_s_671), .VCO(core_PIO_out[11]),
     .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_out_1_ (
    .Func_out(PIO_out[1]), .SI(wp_s_680), .SO(wp_s_681), .VCO(core_PIO_out[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_out_2_ (
    .Func_out(PIO_out[2]), .SI(wp_s_679), .SO(wp_s_680), .VCO(core_PIO_out[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_out_3_ (
    .Func_out(PIO_out[3]), .SI(wp_s_678), .SO(wp_s_679), .VCO(core_PIO_out[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_out_4_ (
    .Func_out(PIO_out[4]), .SI(wp_s_677), .SO(wp_s_678), .VCO(core_PIO_out[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_out_5_ (
    .Func_out(PIO_out[5]), .SI(wp_s_676), .SO(wp_s_677), .VCO(core_PIO_out[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_out_6_ (
    .Func_out(PIO_out[6]), .SI(wp_s_675), .SO(wp_s_676), .VCO(core_PIO_out[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_out_7_ (
    .Func_out(PIO_out[7]), .SI(wp_s_674), .SO(wp_s_675), .VCO(core_PIO_out[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_out_8_ (
    .Func_out(PIO_out[8]), .SI(wp_s_673), .SO(wp_s_674), .VCO(core_PIO_out[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PIO_out_9_ (
    .Func_out(PIO_out[9]), .SI(wp_s_672), .SO(wp_s_673), .VCO(core_PIO_out[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMAinx_0_ (
    .Func_out(PMAinx[0]), .SI(wp_s_784), .SO(wp_s_785), .VCO(core_PMAinx[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMAinx_10_ (
    .Func_out(PMAinx[10]), .SI(wp_s_774), .SO(wp_s_775), .VCO(core_PMAinx[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMAinx_11_ (
    .Func_out(PMAinx[11]), .SI(wp_s_773), .SO(wp_s_774), .VCO(core_PMAinx[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMAinx_12_ (
    .Func_out(PMAinx[12]), .SI(wp_s_772), .SO(wp_s_773), .VCO(core_PMAinx[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMAinx_13_ (
    .Func_out(PMAinx[13]), .SI(wp_s_771), .SO(wp_s_772), .VCO(core_PMAinx[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMAinx_1_ (
    .Func_out(PMAinx[1]), .SI(wp_s_783), .SO(wp_s_784), .VCO(core_PMAinx[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMAinx_2_ (
    .Func_out(PMAinx[2]), .SI(wp_s_782), .SO(wp_s_783), .VCO(core_PMAinx[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMAinx_3_ (
    .Func_out(PMAinx[3]), .SI(wp_s_781), .SO(wp_s_782), .VCO(core_PMAinx[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMAinx_4_ (
    .Func_out(PMAinx[4]), .SI(wp_s_780), .SO(wp_s_781), .VCO(core_PMAinx[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMAinx_5_ (
    .Func_out(PMAinx[5]), .SI(wp_s_779), .SO(wp_s_780), .VCO(core_PMAinx[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMAinx_6_ (
    .Func_out(PMAinx[6]), .SI(wp_s_778), .SO(wp_s_779), .VCO(core_PMAinx[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMAinx_7_ (
    .Func_out(PMAinx[7]), .SI(wp_s_777), .SO(wp_s_778), .VCO(core_PMAinx[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMAinx_8_ (
    .Func_out(PMAinx[8]), .SI(wp_s_776), .SO(wp_s_777), .VCO(core_PMAinx[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMAinx_9_ (
    .Func_out(PMAinx[9]), .SI(wp_s_775), .SO(wp_s_776), .VCO(core_PMAinx[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMSn (
    .Func_out(PMSn), .SI(wp_s_583), .SO(wp_s_584), .VCO(core_PMSn), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_bdry_sel (
    .Func_in(PM_bdry_sel), .SI(wp_s_32), .SO(wp_s_33), .VCI(core_PM_bdry_sel), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_0_ (
    .Func_in(PM_rd0[0]), .SI(wp_s_96), .SO(wp_s_97), .VCI(core_PM_rd0[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_10_ (
    .Func_in(PM_rd0[10]), .SI(wp_s_86), .SO(wp_s_87), .VCI(core_PM_rd0[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_11_ (
    .Func_in(PM_rd0[11]), .SI(wp_s_85), .SO(wp_s_86), .VCI(core_PM_rd0[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_12_ (
    .Func_in(PM_rd0[12]), .SI(wp_s_84), .SO(wp_s_85), .VCI(core_PM_rd0[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_13_ (
    .Func_in(PM_rd0[13]), .SI(wp_s_83), .SO(wp_s_84), .VCI(core_PM_rd0[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_14_ (
    .Func_in(PM_rd0[14]), .SI(wp_s_82), .SO(wp_s_83), .VCI(core_PM_rd0[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_15_ (
    .Func_in(PM_rd0[15]), .SI(wp_s_81), .SO(wp_s_82), .VCI(core_PM_rd0[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_1_ (
    .Func_in(PM_rd0[1]), .SI(wp_s_95), .SO(wp_s_96), .VCI(core_PM_rd0[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_2_ (
    .Func_in(PM_rd0[2]), .SI(wp_s_94), .SO(wp_s_95), .VCI(core_PM_rd0[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_3_ (
    .Func_in(PM_rd0[3]), .SI(wp_s_93), .SO(wp_s_94), .VCI(core_PM_rd0[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_4_ (
    .Func_in(PM_rd0[4]), .SI(wp_s_92), .SO(wp_s_93), .VCI(core_PM_rd0[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_5_ (
    .Func_in(PM_rd0[5]), .SI(wp_s_91), .SO(wp_s_92), .VCI(core_PM_rd0[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_6_ (
    .Func_in(PM_rd0[6]), .SI(wp_s_90), .SO(wp_s_91), .VCI(core_PM_rd0[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_7_ (
    .Func_in(PM_rd0[7]), .SI(wp_s_89), .SO(wp_s_90), .VCI(core_PM_rd0[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_8_ (
    .Func_in(PM_rd0[8]), .SI(wp_s_88), .SO(wp_s_89), .VCI(core_PM_rd0[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd0_9_ (
    .Func_in(PM_rd0[9]), .SI(wp_s_87), .SO(wp_s_88), .VCI(core_PM_rd0[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_0_ (
    .Func_in(PM_rd1[0]), .SI(wp_s_112), .SO(wp_s_113), .VCI(core_PM_rd1[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_10_ (
    .Func_in(PM_rd1[10]), .SI(wp_s_102), .SO(wp_s_103), .VCI(core_PM_rd1[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_11_ (
    .Func_in(PM_rd1[11]), .SI(wp_s_101), .SO(wp_s_102), .VCI(core_PM_rd1[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_12_ (
    .Func_in(PM_rd1[12]), .SI(wp_s_100), .SO(wp_s_101), .VCI(core_PM_rd1[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_13_ (
    .Func_in(PM_rd1[13]), .SI(wp_s_99), .SO(wp_s_100), .VCI(core_PM_rd1[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_14_ (
    .Func_in(PM_rd1[14]), .SI(wp_s_98), .SO(wp_s_99), .VCI(core_PM_rd1[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_15_ (
    .Func_in(PM_rd1[15]), .SI(wp_s_97), .SO(wp_s_98), .VCI(core_PM_rd1[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_1_ (
    .Func_in(PM_rd1[1]), .SI(wp_s_111), .SO(wp_s_112), .VCI(core_PM_rd1[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_2_ (
    .Func_in(PM_rd1[2]), .SI(wp_s_110), .SO(wp_s_111), .VCI(core_PM_rd1[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_3_ (
    .Func_in(PM_rd1[3]), .SI(wp_s_109), .SO(wp_s_110), .VCI(core_PM_rd1[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_4_ (
    .Func_in(PM_rd1[4]), .SI(wp_s_108), .SO(wp_s_109), .VCI(core_PM_rd1[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_5_ (
    .Func_in(PM_rd1[5]), .SI(wp_s_107), .SO(wp_s_108), .VCI(core_PM_rd1[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_6_ (
    .Func_in(PM_rd1[6]), .SI(wp_s_106), .SO(wp_s_107), .VCI(core_PM_rd1[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_7_ (
    .Func_in(PM_rd1[7]), .SI(wp_s_105), .SO(wp_s_106), .VCI(core_PM_rd1[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_8_ (
    .Func_in(PM_rd1[8]), .SI(wp_s_104), .SO(wp_s_105), .VCI(core_PM_rd1[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd1_9_ (
    .Func_in(PM_rd1[9]), .SI(wp_s_103), .SO(wp_s_104), .VCI(core_PM_rd1[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_0_ (
    .Func_in(PM_rd2[0]), .SI(wp_s_128), .SO(wp_s_129), .VCI(core_PM_rd2[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_10_ (
    .Func_in(PM_rd2[10]), .SI(wp_s_118), .SO(wp_s_119), .VCI(core_PM_rd2[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_11_ (
    .Func_in(PM_rd2[11]), .SI(wp_s_117), .SO(wp_s_118), .VCI(core_PM_rd2[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_12_ (
    .Func_in(PM_rd2[12]), .SI(wp_s_116), .SO(wp_s_117), .VCI(core_PM_rd2[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_13_ (
    .Func_in(PM_rd2[13]), .SI(wp_s_115), .SO(wp_s_116), .VCI(core_PM_rd2[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_14_ (
    .Func_in(PM_rd2[14]), .SI(wp_s_114), .SO(wp_s_115), .VCI(core_PM_rd2[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_15_ (
    .Func_in(PM_rd2[15]), .SI(wp_s_113), .SO(wp_s_114), .VCI(core_PM_rd2[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_1_ (
    .Func_in(PM_rd2[1]), .SI(wp_s_127), .SO(wp_s_128), .VCI(core_PM_rd2[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_2_ (
    .Func_in(PM_rd2[2]), .SI(wp_s_126), .SO(wp_s_127), .VCI(core_PM_rd2[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_3_ (
    .Func_in(PM_rd2[3]), .SI(wp_s_125), .SO(wp_s_126), .VCI(core_PM_rd2[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_4_ (
    .Func_in(PM_rd2[4]), .SI(wp_s_124), .SO(wp_s_125), .VCI(core_PM_rd2[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_5_ (
    .Func_in(PM_rd2[5]), .SI(wp_s_123), .SO(wp_s_124), .VCI(core_PM_rd2[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_6_ (
    .Func_in(PM_rd2[6]), .SI(wp_s_122), .SO(wp_s_123), .VCI(core_PM_rd2[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_7_ (
    .Func_in(PM_rd2[7]), .SI(wp_s_121), .SO(wp_s_122), .VCI(core_PM_rd2[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_8_ (
    .Func_in(PM_rd2[8]), .SI(wp_s_120), .SO(wp_s_121), .VCI(core_PM_rd2[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd2_9_ (
    .Func_in(PM_rd2[9]), .SI(wp_s_119), .SO(wp_s_120), .VCI(core_PM_rd2[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_0_ (
    .Func_in(PM_rd3[0]), .SI(wp_s_144), .SO(wp_s_145), .VCI(core_PM_rd3[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_10_ (
    .Func_in(PM_rd3[10]), .SI(wp_s_134), .SO(wp_s_135), .VCI(core_PM_rd3[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_11_ (
    .Func_in(PM_rd3[11]), .SI(wp_s_133), .SO(wp_s_134), .VCI(core_PM_rd3[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_12_ (
    .Func_in(PM_rd3[12]), .SI(wp_s_132), .SO(wp_s_133), .VCI(core_PM_rd3[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_13_ (
    .Func_in(PM_rd3[13]), .SI(wp_s_131), .SO(wp_s_132), .VCI(core_PM_rd3[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_14_ (
    .Func_in(PM_rd3[14]), .SI(wp_s_130), .SO(wp_s_131), .VCI(core_PM_rd3[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_15_ (
    .Func_in(PM_rd3[15]), .SI(wp_s_129), .SO(wp_s_130), .VCI(core_PM_rd3[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_1_ (
    .Func_in(PM_rd3[1]), .SI(wp_s_143), .SO(wp_s_144), .VCI(core_PM_rd3[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_2_ (
    .Func_in(PM_rd3[2]), .SI(wp_s_142), .SO(wp_s_143), .VCI(core_PM_rd3[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_3_ (
    .Func_in(PM_rd3[3]), .SI(wp_s_141), .SO(wp_s_142), .VCI(core_PM_rd3[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_4_ (
    .Func_in(PM_rd3[4]), .SI(wp_s_140), .SO(wp_s_141), .VCI(core_PM_rd3[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_5_ (
    .Func_in(PM_rd3[5]), .SI(wp_s_139), .SO(wp_s_140), .VCI(core_PM_rd3[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_6_ (
    .Func_in(PM_rd3[6]), .SI(wp_s_138), .SO(wp_s_139), .VCI(core_PM_rd3[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_7_ (
    .Func_in(PM_rd3[7]), .SI(wp_s_137), .SO(wp_s_138), .VCI(core_PM_rd3[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_8_ (
    .Func_in(PM_rd3[8]), .SI(wp_s_136), .SO(wp_s_137), .VCI(core_PM_rd3[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd3_9_ (
    .Func_in(PM_rd3[9]), .SI(wp_s_135), .SO(wp_s_136), .VCI(core_PM_rd3[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_0_ (
    .Func_in(PM_rd4[0]), .SI(wp_s_160), .SO(wp_s_161), .VCI(core_PM_rd4[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_10_ (
    .Func_in(PM_rd4[10]), .SI(wp_s_150), .SO(wp_s_151), .VCI(core_PM_rd4[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_11_ (
    .Func_in(PM_rd4[11]), .SI(wp_s_149), .SO(wp_s_150), .VCI(core_PM_rd4[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_12_ (
    .Func_in(PM_rd4[12]), .SI(wp_s_148), .SO(wp_s_149), .VCI(core_PM_rd4[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_13_ (
    .Func_in(PM_rd4[13]), .SI(wp_s_147), .SO(wp_s_148), .VCI(core_PM_rd4[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_14_ (
    .Func_in(PM_rd4[14]), .SI(wp_s_146), .SO(wp_s_147), .VCI(core_PM_rd4[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_15_ (
    .Func_in(PM_rd4[15]), .SI(wp_s_145), .SO(wp_s_146), .VCI(core_PM_rd4[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_1_ (
    .Func_in(PM_rd4[1]), .SI(wp_s_159), .SO(wp_s_160), .VCI(core_PM_rd4[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_2_ (
    .Func_in(PM_rd4[2]), .SI(wp_s_158), .SO(wp_s_159), .VCI(core_PM_rd4[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_3_ (
    .Func_in(PM_rd4[3]), .SI(wp_s_157), .SO(wp_s_158), .VCI(core_PM_rd4[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_4_ (
    .Func_in(PM_rd4[4]), .SI(wp_s_156), .SO(wp_s_157), .VCI(core_PM_rd4[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_5_ (
    .Func_in(PM_rd4[5]), .SI(wp_s_155), .SO(wp_s_156), .VCI(core_PM_rd4[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_6_ (
    .Func_in(PM_rd4[6]), .SI(wp_s_154), .SO(wp_s_155), .VCI(core_PM_rd4[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_7_ (
    .Func_in(PM_rd4[7]), .SI(wp_s_153), .SO(wp_s_154), .VCI(core_PM_rd4[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_8_ (
    .Func_in(PM_rd4[8]), .SI(wp_s_152), .SO(wp_s_153), .VCI(core_PM_rd4[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd4_9_ (
    .Func_in(PM_rd4[9]), .SI(wp_s_151), .SO(wp_s_152), .VCI(core_PM_rd4[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_0_ (
    .Func_in(PM_rd5[0]), .SI(wp_s_176), .SO(wp_s_177), .VCI(core_PM_rd5[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_10_ (
    .Func_in(PM_rd5[10]), .SI(wp_s_166), .SO(wp_s_167), .VCI(core_PM_rd5[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_11_ (
    .Func_in(PM_rd5[11]), .SI(wp_s_165), .SO(wp_s_166), .VCI(core_PM_rd5[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_12_ (
    .Func_in(PM_rd5[12]), .SI(wp_s_164), .SO(wp_s_165), .VCI(core_PM_rd5[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_13_ (
    .Func_in(PM_rd5[13]), .SI(wp_s_163), .SO(wp_s_164), .VCI(core_PM_rd5[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_14_ (
    .Func_in(PM_rd5[14]), .SI(wp_s_162), .SO(wp_s_163), .VCI(core_PM_rd5[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_15_ (
    .Func_in(PM_rd5[15]), .SI(wp_s_161), .SO(wp_s_162), .VCI(core_PM_rd5[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_1_ (
    .Func_in(PM_rd5[1]), .SI(wp_s_175), .SO(wp_s_176), .VCI(core_PM_rd5[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_2_ (
    .Func_in(PM_rd5[2]), .SI(wp_s_174), .SO(wp_s_175), .VCI(core_PM_rd5[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_3_ (
    .Func_in(PM_rd5[3]), .SI(wp_s_173), .SO(wp_s_174), .VCI(core_PM_rd5[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_4_ (
    .Func_in(PM_rd5[4]), .SI(wp_s_172), .SO(wp_s_173), .VCI(core_PM_rd5[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_5_ (
    .Func_in(PM_rd5[5]), .SI(wp_s_171), .SO(wp_s_172), .VCI(core_PM_rd5[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_6_ (
    .Func_in(PM_rd5[6]), .SI(wp_s_170), .SO(wp_s_171), .VCI(core_PM_rd5[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_7_ (
    .Func_in(PM_rd5[7]), .SI(wp_s_169), .SO(wp_s_170), .VCI(core_PM_rd5[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_8_ (
    .Func_in(PM_rd5[8]), .SI(wp_s_168), .SO(wp_s_169), .VCI(core_PM_rd5[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd5_9_ (
    .Func_in(PM_rd5[9]), .SI(wp_s_167), .SO(wp_s_168), .VCI(core_PM_rd5[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_0_ (
    .Func_in(PM_rd6[0]), .SI(wp_s_192), .SO(wp_s_193), .VCI(core_PM_rd6[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_10_ (
    .Func_in(PM_rd6[10]), .SI(wp_s_182), .SO(wp_s_183), .VCI(core_PM_rd6[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_11_ (
    .Func_in(PM_rd6[11]), .SI(wp_s_181), .SO(wp_s_182), .VCI(core_PM_rd6[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_12_ (
    .Func_in(PM_rd6[12]), .SI(wp_s_180), .SO(wp_s_181), .VCI(core_PM_rd6[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_13_ (
    .Func_in(PM_rd6[13]), .SI(wp_s_179), .SO(wp_s_180), .VCI(core_PM_rd6[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_14_ (
    .Func_in(PM_rd6[14]), .SI(wp_s_178), .SO(wp_s_179), .VCI(core_PM_rd6[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_15_ (
    .Func_in(PM_rd6[15]), .SI(wp_s_177), .SO(wp_s_178), .VCI(core_PM_rd6[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_1_ (
    .Func_in(PM_rd6[1]), .SI(wp_s_191), .SO(wp_s_192), .VCI(core_PM_rd6[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_2_ (
    .Func_in(PM_rd6[2]), .SI(wp_s_190), .SO(wp_s_191), .VCI(core_PM_rd6[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_3_ (
    .Func_in(PM_rd6[3]), .SI(wp_s_189), .SO(wp_s_190), .VCI(core_PM_rd6[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_4_ (
    .Func_in(PM_rd6[4]), .SI(wp_s_188), .SO(wp_s_189), .VCI(core_PM_rd6[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_5_ (
    .Func_in(PM_rd6[5]), .SI(wp_s_187), .SO(wp_s_188), .VCI(core_PM_rd6[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_6_ (
    .Func_in(PM_rd6[6]), .SI(wp_s_186), .SO(wp_s_187), .VCI(core_PM_rd6[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_7_ (
    .Func_in(PM_rd6[7]), .SI(wp_s_185), .SO(wp_s_186), .VCI(core_PM_rd6[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_8_ (
    .Func_in(PM_rd6[8]), .SI(wp_s_184), .SO(wp_s_185), .VCI(core_PM_rd6[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd6_9_ (
    .Func_in(PM_rd6[9]), .SI(wp_s_183), .SO(wp_s_184), .VCI(core_PM_rd6[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_0_ (
    .Func_in(PM_rd7[0]), .SI(wp_s_208), .SO(wp_s_209), .VCI(core_PM_rd7[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_10_ (
    .Func_in(PM_rd7[10]), .SI(wp_s_198), .SO(wp_s_199), .VCI(core_PM_rd7[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_11_ (
    .Func_in(PM_rd7[11]), .SI(wp_s_197), .SO(wp_s_198), .VCI(core_PM_rd7[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_12_ (
    .Func_in(PM_rd7[12]), .SI(wp_s_196), .SO(wp_s_197), .VCI(core_PM_rd7[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_13_ (
    .Func_in(PM_rd7[13]), .SI(wp_s_195), .SO(wp_s_196), .VCI(core_PM_rd7[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_14_ (
    .Func_in(PM_rd7[14]), .SI(wp_s_194), .SO(wp_s_195), .VCI(core_PM_rd7[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_15_ (
    .Func_in(PM_rd7[15]), .SI(wp_s_193), .SO(wp_s_194), .VCI(core_PM_rd7[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_1_ (
    .Func_in(PM_rd7[1]), .SI(wp_s_207), .SO(wp_s_208), .VCI(core_PM_rd7[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_2_ (
    .Func_in(PM_rd7[2]), .SI(wp_s_206), .SO(wp_s_207), .VCI(core_PM_rd7[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_3_ (
    .Func_in(PM_rd7[3]), .SI(wp_s_205), .SO(wp_s_206), .VCI(core_PM_rd7[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_4_ (
    .Func_in(PM_rd7[4]), .SI(wp_s_204), .SO(wp_s_205), .VCI(core_PM_rd7[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_5_ (
    .Func_in(PM_rd7[5]), .SI(wp_s_203), .SO(wp_s_204), .VCI(core_PM_rd7[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_6_ (
    .Func_in(PM_rd7[6]), .SI(wp_s_202), .SO(wp_s_203), .VCI(core_PM_rd7[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_7_ (
    .Func_in(PM_rd7[7]), .SI(wp_s_201), .SO(wp_s_202), .VCI(core_PM_rd7[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_8_ (
    .Func_in(PM_rd7[8]), .SI(wp_s_200), .SO(wp_s_201), .VCI(core_PM_rd7[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_PM_rd7_9_ (
    .Func_in(PM_rd7[9]), .SI(wp_s_199), .SO(wp_s_200), .VCI(core_PM_rd7[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_0_ (
    .Func_out(PM_wd[0]), .SI(wp_s_754), .SO(wp_s_755), .VCO(core_PM_wd[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_10_ (
    .Func_out(PM_wd[10]), .SI(wp_s_744), .SO(wp_s_745), .VCO(core_PM_wd[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_11_ (
    .Func_out(PM_wd[11]), .SI(wp_s_743), .SO(wp_s_744), .VCO(core_PM_wd[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_12_ (
    .Func_out(PM_wd[12]), .SI(wp_s_742), .SO(wp_s_743), .VCO(core_PM_wd[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_13_ (
    .Func_out(PM_wd[13]), .SI(wp_s_741), .SO(wp_s_742), .VCO(core_PM_wd[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_14_ (
    .Func_out(PM_wd[14]), .SI(wp_s_740), .SO(wp_s_741), .VCO(core_PM_wd[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_15_ (
    .Func_out(PM_wd[15]), .SI(wp_s_739), .SO(wp_s_740), .VCO(core_PM_wd[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_1_ (
    .Func_out(PM_wd[1]), .SI(wp_s_753), .SO(wp_s_754), .VCO(core_PM_wd[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_2_ (
    .Func_out(PM_wd[2]), .SI(wp_s_752), .SO(wp_s_753), .VCO(core_PM_wd[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_3_ (
    .Func_out(PM_wd[3]), .SI(wp_s_751), .SO(wp_s_752), .VCO(core_PM_wd[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_4_ (
    .Func_out(PM_wd[4]), .SI(wp_s_750), .SO(wp_s_751), .VCO(core_PM_wd[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_5_ (
    .Func_out(PM_wd[5]), .SI(wp_s_749), .SO(wp_s_750), .VCO(core_PM_wd[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_6_ (
    .Func_out(PM_wd[6]), .SI(wp_s_748), .SO(wp_s_749), .VCO(core_PM_wd[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_7_ (
    .Func_out(PM_wd[7]), .SI(wp_s_747), .SO(wp_s_748), .VCO(core_PM_wd[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_8_ (
    .Func_out(PM_wd[8]), .SI(wp_s_746), .SO(wp_s_747), .VCO(core_PM_wd[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PM_wd_9_ (
    .Func_out(PM_wd[9]), .SI(wp_s_745), .SO(wp_s_746), .VCO(core_PM_wd[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_cs0 (
    .Func_out(PMo_cs0), .SI(wp_s_684), .SO(wp_s_685), .VCO(core_PMo_cs0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_cs1 (
    .Func_out(PMo_cs1), .SI(wp_s_685), .SO(wp_s_686), .VCO(core_PMo_cs1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_cs2 (
    .Func_out(PMo_cs2), .SI(wp_s_686), .SO(wp_s_687), .VCO(core_PMo_cs2), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_cs3 (
    .Func_out(PMo_cs3), .SI(wp_s_687), .SO(wp_s_688), .VCO(core_PMo_cs3), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_cs4 (
    .Func_out(PMo_cs4), .SI(wp_s_688), .SO(wp_s_689), .VCO(core_PMo_cs4), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_cs5 (
    .Func_out(PMo_cs5), .SI(wp_s_689), .SO(wp_s_690), .VCO(core_PMo_cs5), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_cs6 (
    .Func_out(PMo_cs6), .SI(wp_s_690), .SO(wp_s_691), .VCO(core_PMo_cs6), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_cs7 (
    .Func_out(PMo_cs7), .SI(wp_s_691), .SO(wp_s_692), .VCO(core_PMo_cs7), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_oe0 (
    .Func_out(PMo_oe0), .SI(wp_s_693), .SO(wp_s_694), .VCO(core_PMo_oe0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_oe1 (
    .Func_out(PMo_oe1), .SI(wp_s_694), .SO(wp_s_695), .VCO(core_PMo_oe1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_oe2 (
    .Func_out(PMo_oe2), .SI(wp_s_695), .SO(wp_s_696), .VCO(core_PMo_oe2), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_oe3 (
    .Func_out(PMo_oe3), .SI(wp_s_696), .SO(wp_s_697), .VCO(core_PMo_oe3), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_oe4 (
    .Func_out(PMo_oe4), .SI(wp_s_697), .SO(wp_s_698), .VCO(core_PMo_oe4), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_oe5 (
    .Func_out(PMo_oe5), .SI(wp_s_698), .SO(wp_s_699), .VCO(core_PMo_oe5), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_oe6 (
    .Func_out(PMo_oe6), .SI(wp_s_699), .SO(wp_s_700), .VCO(core_PMo_oe6), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_oe7 (
    .Func_out(PMo_oe7), .SI(wp_s_700), .SO(wp_s_701), .VCO(core_PMo_oe7), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PMo_web (
    .Func_out(PMo_web), .SI(wp_s_692), .SO(wp_s_693), .VCO(core_PMo_web), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_PWDACK (
    .Func_out(PWDACK), .SI(wp_s_580), .SO(wp_s_581), .VCO(core_PWDACK), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_RDn (
    .Func_out(RDn), .SI(wp_s_588), .SO(wp_s_589), .VCO(core_RDn), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_RFS0 (
    .Func_out(RFS0), .SI(wp_s_632), .SO(wp_s_633), .VCO(core_RFS0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_RFS1 (
    .Func_out(RFS1), .SI(wp_s_636), .SO(wp_s_637), .VCO(core_RFS1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_SCLK0 (
    .Func_out(SCLK0), .SI(wp_s_628), .SO(wp_s_629), .VCO(core_SCLK0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_SCLK1 (
    .Func_out(SCLK1), .SI(wp_s_630), .SO(wp_s_631), .VCO(core_SCLK1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_TD0 (
    .Func_out(TD0), .SI(wp_s_626), .SO(wp_s_627), .VCO(core_TD0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_TD1 (
    .Func_out(TD1), .SI(wp_s_627), .SO(wp_s_628), .VCO(core_TD1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_TFS0 (
    .Func_out(TFS0), .SI(wp_s_634), .SO(wp_s_635), .VCO(core_TFS0), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_TFS1 (
    .Func_out(TFS1), .SI(wp_s_638), .SO(wp_s_639), .VCO(core_TFS1), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_BMODE (
    .Func_in(T_BMODE), .SI(wp_s_1), .SO(wp_s_2), .VCI(core_T_BMODE), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_BRn (
    .Func_in(T_BRn), .SI(wp_s_34), .SO(wp_s_35), .VCI(core_T_BRn), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_CLKI_PLL (
    .Func_in(T_CLKI_PLL), .SI(wp_s_3), .SO(wp_s_4), .VCI(core_T_CLKI_PLL), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_EA_0_ (
    .Func_in(T_EA[0]), .SI(wp_s_31), .SO(wp_s_32), .VCI(core_T_EA[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_EA_1_ (
    .Func_in(T_EA[1]), .SI(wp_s_30), .SO(wp_s_31), .VCI(core_T_EA[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_EA_2_ (
    .Func_in(T_EA[2]), .SI(wp_s_29), .SO(wp_s_30), .VCI(core_T_EA[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_EA_3_ (
    .Func_in(T_EA[3]), .SI(wp_s_28), .SO(wp_s_29), .VCI(core_T_EA[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_EA_4_ (
    .Func_in(T_EA[4]), .SI(wp_s_27), .SO(wp_s_28), .VCI(core_T_EA[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_EA_5_ (
    .Func_in(T_EA[5]), .SI(wp_s_26), .SO(wp_s_27), .VCI(core_T_EA[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_EA_6_ (
    .Func_in(T_EA[6]), .SI(wp_s_25), .SO(wp_s_26), .VCI(core_T_EA[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_EA_7_ (
    .Func_in(T_EA[7]), .SI(wp_s_24), .SO(wp_s_25), .VCI(core_T_EA[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_0_ (
    .Func_in(T_ED[0]), .SI(wp_s_23), .SO(wp_s_24), .VCI(core_T_ED[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_10_ (
    .Func_in(T_ED[10]), .SI(wp_s_13), .SO(wp_s_14), .VCI(core_T_ED[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_11_ (
    .Func_in(T_ED[11]), .SI(wp_s_12), .SO(wp_s_13), .VCI(core_T_ED[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_12_ (
    .Func_in(T_ED[12]), .SI(wp_s_11), .SO(wp_s_12), .VCI(core_T_ED[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_13_ (
    .Func_in(T_ED[13]), .SI(wp_s_10), .SO(wp_s_11), .VCI(core_T_ED[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_14_ (
    .Func_in(T_ED[14]), .SI(wp_s_9), .SO(wp_s_10), .VCI(core_T_ED[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_15_ (
    .Func_in(T_ED[15]), .SI(wp_s_8), .SO(wp_s_9), .VCI(core_T_ED[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_1_ (
    .Func_in(T_ED[1]), .SI(wp_s_22), .SO(wp_s_23), .VCI(core_T_ED[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_2_ (
    .Func_in(T_ED[2]), .SI(wp_s_21), .SO(wp_s_22), .VCI(core_T_ED[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_3_ (
    .Func_in(T_ED[3]), .SI(wp_s_20), .SO(wp_s_21), .VCI(core_T_ED[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_4_ (
    .Func_in(T_ED[4]), .SI(wp_s_19), .SO(wp_s_20), .VCI(core_T_ED[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_5_ (
    .Func_in(T_ED[5]), .SI(wp_s_18), .SO(wp_s_19), .VCI(core_T_ED[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_6_ (
    .Func_in(T_ED[6]), .SI(wp_s_17), .SO(wp_s_18), .VCI(core_T_ED[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_7_ (
    .Func_in(T_ED[7]), .SI(wp_s_16), .SO(wp_s_17), .VCI(core_T_ED[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_8_ (
    .Func_in(T_ED[8]), .SI(wp_s_15), .SO(wp_s_16), .VCI(core_T_ED[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ED_9_ (
    .Func_in(T_ED[9]), .SI(wp_s_14), .SO(wp_s_15), .VCI(core_T_ED[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_GOICE (
    .Func_in(T_GOICE), .SI(wp_s_5), .SO(wp_s_6), .VCI(core_T_GOICE), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_0_ (
    .Func_in(T_IAD[0]), .SI(wp_s_66), .SO(wp_s_67), .VCI(core_T_IAD[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_10_ (
    .Func_in(T_IAD[10]), .SI(wp_s_56), .SO(wp_s_57), .VCI(core_T_IAD[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_11_ (
    .Func_in(T_IAD[11]), .SI(wp_s_55), .SO(wp_s_56), .VCI(core_T_IAD[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_12_ (
    .Func_in(T_IAD[12]), .SI(wp_s_54), .SO(wp_s_55), .VCI(core_T_IAD[12]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_13_ (
    .Func_in(T_IAD[13]), .SI(wp_s_53), .SO(wp_s_54), .VCI(core_T_IAD[13]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_14_ (
    .Func_in(T_IAD[14]), .SI(wp_s_52), .SO(wp_s_53), .VCI(core_T_IAD[14]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_15_ (
    .Func_in(T_IAD[15]), .SI(wp_s_51), .SO(wp_s_52), .VCI(core_T_IAD[15]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_1_ (
    .Func_in(T_IAD[1]), .SI(wp_s_65), .SO(wp_s_66), .VCI(core_T_IAD[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_2_ (
    .Func_in(T_IAD[2]), .SI(wp_s_64), .SO(wp_s_65), .VCI(core_T_IAD[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_3_ (
    .Func_in(T_IAD[3]), .SI(wp_s_63), .SO(wp_s_64), .VCI(core_T_IAD[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_4_ (
    .Func_in(T_IAD[4]), .SI(wp_s_62), .SO(wp_s_63), .VCI(core_T_IAD[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_5_ (
    .Func_in(T_IAD[5]), .SI(wp_s_61), .SO(wp_s_62), .VCI(core_T_IAD[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_6_ (
    .Func_in(T_IAD[6]), .SI(wp_s_60), .SO(wp_s_61), .VCI(core_T_IAD[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_7_ (
    .Func_in(T_IAD[7]), .SI(wp_s_59), .SO(wp_s_60), .VCI(core_T_IAD[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_8_ (
    .Func_in(T_IAD[8]), .SI(wp_s_58), .SO(wp_s_59), .VCI(core_T_IAD[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAD_9_ (
    .Func_in(T_IAD[9]), .SI(wp_s_57), .SO(wp_s_58), .VCI(core_T_IAD[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IAL (
    .Func_in(T_IAL), .SI(wp_s_50), .SO(wp_s_51), .VCI(core_T_IAL), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ICE_RSTn (
    .Func_in(T_ICE_RSTn), .SI(wp_s_0), .SO(wp_s_1), .VCI(core_T_ICE_RSTn), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ID (
    .Func_in(T_ID), .SI(wp_s_80), .SO(wp_s_81), .VCI(core_T_ID), .WP_CLK(WP_CLK),
     .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IMS (
    .Func_in(T_IMS), .SI(wp_s_79), .SO(wp_s_80), .VCI(core_T_IMS), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IRDn (
    .Func_in(T_IRDn), .SI(wp_s_47), .SO(wp_s_48), .VCI(core_T_IRDn), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IRQ0n (
    .Func_in(T_IRQ0n), .SI(wp_s_37), .SO(wp_s_38), .VCI(core_T_IRQ0n), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IRQ1n (
    .Func_in(T_IRQ1n), .SI(wp_s_36), .SO(wp_s_37), .VCI(core_T_IRQ1n), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IRQ2n (
    .Func_in(T_IRQ2n), .SI(wp_s_35), .SO(wp_s_36), .VCI(core_T_IRQ2n), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IRQE0n (
    .Func_in(T_IRQE0n), .SI(wp_s_40), .SO(wp_s_41), .VCI(core_T_IRQE0n), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IRQE1n (
    .Func_in(T_IRQE1n), .SI(wp_s_39), .SO(wp_s_40), .VCI(core_T_IRQE1n), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IRQL1n (
    .Func_in(T_IRQL1n), .SI(wp_s_38), .SO(wp_s_39), .VCI(core_T_IRQL1n), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_ISn (
    .Func_in(T_ISn), .SI(wp_s_49), .SO(wp_s_50), .VCI(core_T_ISn), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_IWRn (
    .Func_in(T_IWRn), .SI(wp_s_48), .SO(wp_s_49), .VCI(core_T_IWRn), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_MMAP (
    .Func_in(T_MMAP), .SI(wp_s_2), .SO(wp_s_3), .VCI(core_T_MMAP), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_PIOin_0_ (
    .Func_in(T_PIOin[0]), .SI(wp_s_78), .SO(wp_s_79), .VCI(core_T_PIOin[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_PIOin_10_ (
    .Func_in(T_PIOin[10]), .SI(wp_s_68), .SO(wp_s_69), .VCI(core_T_PIOin[10]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_PIOin_11_ (
    .Func_in(T_PIOin[11]), .SI(wp_s_67), .SO(wp_s_68), .VCI(core_T_PIOin[11]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_PIOin_1_ (
    .Func_in(T_PIOin[1]), .SI(wp_s_77), .SO(wp_s_78), .VCI(core_T_PIOin[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_PIOin_2_ (
    .Func_in(T_PIOin[2]), .SI(wp_s_76), .SO(wp_s_77), .VCI(core_T_PIOin[2]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_PIOin_3_ (
    .Func_in(T_PIOin[3]), .SI(wp_s_75), .SO(wp_s_76), .VCI(core_T_PIOin[3]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_PIOin_4_ (
    .Func_in(T_PIOin[4]), .SI(wp_s_74), .SO(wp_s_75), .VCI(core_T_PIOin[4]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_PIOin_5_ (
    .Func_in(T_PIOin[5]), .SI(wp_s_73), .SO(wp_s_74), .VCI(core_T_PIOin[5]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_PIOin_6_ (
    .Func_in(T_PIOin[6]), .SI(wp_s_72), .SO(wp_s_73), .VCI(core_T_PIOin[6]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_PIOin_7_ (
    .Func_in(T_PIOin[7]), .SI(wp_s_71), .SO(wp_s_72), .VCI(core_T_PIOin[7]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_PIOin_8_ (
    .Func_in(T_PIOin[8]), .SI(wp_s_70), .SO(wp_s_71), .VCI(core_T_PIOin[8]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_PIOin_9_ (
    .Func_in(T_PIOin[9]), .SI(wp_s_69), .SO(wp_s_70), .VCI(core_T_PIOin[9]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_PWDn (
    .Func_in(T_PWDn), .SI(wp_s_33), .SO(wp_s_34), .VCI(core_T_PWDn), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_RD0 (
    .Func_in(T_RD0), .SI(wp_s_41), .SO(wp_s_42), .VCI(core_T_RD0), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_RD1 (
    .Func_in(T_RD1), .SI(wp_s_42), .SO(wp_s_43), .VCI(core_T_RD1), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_RFS0 (
    .Func_in(T_RFS0), .SI(wp_s_43), .SO(wp_s_44), .VCI(core_T_RFS0), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_RFS1 (
    .Func_in(T_RFS1), .SI(wp_s_45), .SO(wp_s_46), .VCI(core_T_RFS1), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_Sel_PLL (
    .Func_in(T_Sel_PLL), .SI(wp_s_4), .SO(wp_s_5), .VCI(core_T_Sel_PLL), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_TFS0 (
    .Func_in(T_TFS0), .SI(wp_s_44), .SO(wp_s_45), .VCI(core_T_TFS0), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_TFS1 (
    .Func_in(T_TFS1), .SI(wp_s_46), .SO(wp_s_47), .VCI(core_T_TFS1), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_TMODE_0_ (
    .Func_in(T_TMODE[0]), .SI(wp_s_7), .SO(wp_s_8), .VCI(core_T_TMODE[0]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_in WC_T_TMODE_1_ (
    .Func_in(T_TMODE[1]), .SI(wp_s_6), .SO(wp_s_7), .VCI(core_T_TMODE[1]), 
    .WP_CLK(WP_CLK), .WP_HOLD_IN(WP_HOLD_IN), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_WRn (
    .Func_out(WRn), .SI(wp_s_589), .SO(wp_s_590), .VCO(core_WRn), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);
DSP_CORE_vsia_tst_wp_cell_out WC_XTALoffn (
    .Func_out(XTALoffn), .SI(wp_s_579), .SO(wp_s_580), .VCO(core_XTALoffn), 
    .WP_CLK(WP_CLK), .WP_HOLD_OUT(WP_HOLD_OUT), .WP_SHIFT(WP_SHIFT)
);

assign	WP_SO_beforeskew = wp_s_837;
assign	wp_s_0 = WP_SI;
endmodule



module DSP_CORE_vsia_tst_wp_cell_in (
    Func_in, SI, VCI, SO,
    WP_SHIFT, WP_HOLD_IN,
    WP_CLK
);

//data
input   Func_in;
input   SI;
output  VCI;
output  SO;

//control
input   WP_SHIFT;
input   WP_HOLD_IN;

//clock
input   WP_CLK;

reg     SO;

assign  VCI = (WP_HOLD_IN) ? SO : Func_in;

always @(posedge WP_CLK) begin
    SO <= (WP_SHIFT) ? SI : VCI;
end

endmodule



module DSP_CORE_vsia_tst_wp_cell_out (
    VCO, SI, Func_out, SO,
    WP_SHIFT, WP_HOLD_OUT,
    WP_CLK
);

//data
input   VCO;
input   SI;
output  Func_out;
output  SO;

//control
input   WP_SHIFT;
input   WP_HOLD_OUT;

//clock
input   WP_CLK;

reg     SO;

assign  Func_out = (WP_HOLD_OUT) ? SO : VCO;

always @(posedge WP_CLK) begin
    SO <= (WP_SHIFT) ? SI : Func_out;
end

endmodule



module DSP_CORE_vsia_tst_tcb_cell (
    SI, SO, DO,
    TC_SHIFT, TC_UPDATE, TC_RESET,
    TCLK
);

//data I/O
input   SI;
output  SO;
output  DO;

//control signals
input   TC_SHIFT;
input   TC_UPDATE;
input   TC_RESET;

//clock
input   TCLK;

reg     SO, DO;

always @(posedge TCLK or posedge TC_RESET) begin
    if(TC_RESET)
        SO <= 1'b0;
    else
        SO <= (TC_SHIFT) ? SI : SO;
end

always @(posedge TCLK or posedge TC_RESET) begin
    if(TC_RESET)
        DO <= 1'b0;
    else
        DO <= (TC_UPDATE) ? SO : DO;
end

endmodule


module DSP_CORE_vsia_tst_tcb_cell_capture (
    SI, DI, SO, DO,
    TC_SHIFT, TC_UPDATE, TC_CAPTURE, TC_RESET,
    TCLK
);

//data I/O
input   SI;
input   DI;
output  SO;
output  DO;

//control signals
input   TC_SHIFT;
input   TC_UPDATE;
input   TC_CAPTURE;
input   TC_RESET;

//clock
input   TCLK;

reg     SO, DO;

always @(posedge TCLK or posedge TC_RESET) begin
    if(TC_RESET)
        SO <= 1'b0;
    else
        SO <= (TC_CAPTURE) ? DI : (TC_SHIFT) ? SI : SO;
end

always @(posedge TCLK or posedge TC_RESET) begin
    if(TC_RESET)
        DO <= 1'b0;
    else
        DO <= (TC_UPDATE) ? SO : DO;
end

endmodule

module DSP_CORE_vsia_tst_bypass_reg (
    SI, SO_BYPASS,
    TCLK
);

//data I/O
input   SI;
output  SO_BYPASS;

//clock
input   TCLK;

reg     SO_BYPASS;

always @(posedge TCLK) begin
    SO_BYPASS <= SI;
end

endmodule

module DSP_CORE_vsia_tst_antiskew (
    SI, SO,
    TCLK
);

input   SI;
output  SO;
input   TCLK;

reg SO;

always @(TCLK or SI) begin
    if(~TCLK)
        SO <= SI;
end

endmodule


module DSP_CORE_vsia_tst_mas (
    SO_BYPASS, SO_beforeskew, SO,
    WP_BP, TCLK
);

//data I/O
input   SO_BYPASS;   //wp_reg bypass
input   SO_beforeskew;
output  SO;

//control
input   WP_BP;
input   TCLK;

reg     SO;

always @(TCLK or SO_BYPASS or SO_beforeskew or WP_BP) begin
    if(~TCLK)
    SO <= (WP_BP) ? SO_BYPASS : SO_beforeskew;
end

endmodule


module DSP_CORE_vsia_tst_hold_cell (
    IN, OUT, TCLK, RST_L
);

input   IN;
output  OUT;

input   TCLK;
input   RST_L;

reg     OUT;

always @(posedge TCLK or negedge RST_L) begin
    if(RST_L == 0)
        OUT <= 0;
    else
        OUT <= IN | OUT;
end

endmodule


module DSP_CORE_vsia_tst_capture_cell (
    SI, DI, SO, 
    SEL, TCLK
);

input   SI;
input   DI;
output  SO;

input   SEL;
input   TCLK;

reg     SO;

always @(posedge TCLK) begin
    SO <= (SEL) ? SI : DI;
end

endmodule

module DSP_CORE_vsia_tst_control_cell (
    SI, SO, SEL,
    TCLK
);

input   SI;
input   SEL;
output  SO;

input   TCLK;

reg     SO;

always @(posedge TCLK) begin
    SO <= (SEL) ? SI : SO;
end

endmodule
