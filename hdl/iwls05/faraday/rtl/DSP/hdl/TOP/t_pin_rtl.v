






`include "x_def.v"


module PINs (/* ------- Inputs : --------- */
X_CLKI,
X_RSTn,
X_ICE_RSTn,
X_BMODE,
X_TMODE,
X_PLLsel,
X_MMAP,
X_GOICE,
X_PWDn,
X_IRQ2n,
X_IRQL1n,
X_IRQE1n,
X_IRQE0n,
X_BRn,
X_RD0,
X_RD1,
X_IRDn,
X_IWRn,
X_ISn,
X_IAL,
X_ICK,
X_IMS,
`ifdef FD_DFT
X_DFT_en,
`endif


X_CLKO,
X_PWDACK,
X_BGn,
X_EA_U,
X_EA,
X_PMSn,
X_DMSn,
X_IOSn,
X_RDn,
X_WRn,
X_ECMSn,
X_ECMA_EN,
X_TD0,
X_TD1,
X_IACKn,
X_BMSn,


`ifdef FD_EVB
`else
XTAL,
`endif
X_ED,
X_SCLK0,
X_RFS0,
X_TFS0,
X_SCLK1,
X_RFS1,
X_TFS1,
X_IAD,
X_PIO,
X_ID,





D_RSTn,
T_ICE_RSTn,
T_BMODE,
T_MMAP,
T_TMODE,
D_CLKI_OSC,
T_PLLsel,
T_ED,
T_EA,
T_PWDn,
D_IRQ2n,
T_IRQ1n,
T_IRQ0n,
D_IRQL1n,
D_IRQE1n,
D_IRQE0n,
T_BRn,
D_RD0,
D_RD1,
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
D_IAD_di,
T_PIOin,
D_ICK,
T_IMS,
T_ID,
T_GOICE,
`ifdef FD_DFT
D_DFT_en,
`endif

CLKO,
PWDACK,
XTALoffn,
BGn,
EA_oe,
EA_do,
PMSn,
DMSn,
BMSn,
IOSn,
RDn,
WRn,
ED_oe_15,
ED_oe_14_8,
ED_oe_7_0,
ED_do,
ECMSn,
ECMA_EN,
D_TD0,
D_TD1,
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
IAD_oex,
D_IAD_do,
PIO_oe,
PIO_out,
IDo,
IDoe
);



input X_CLKI,
X_RSTn,
X_ICE_RSTn,
X_BMODE;

input[1:0]
X_TMODE;

input[3:0]
X_PLLsel;

input X_MMAP,
X_GOICE,
X_PWDn,
X_IRQ2n,
X_IRQL1n,
X_IRQE1n,
X_IRQE0n,
X_BRn,
X_RD0,
X_RD1,
X_IRDn,
X_IWRn,
X_ISn,
X_IAL,
X_ICK,
X_IMS,
CLKO,
PWDACK,
BGn,
EA_oe;

input[14:0]
EA_do;

input PMSn,
DMSn,
BMSn,
IOSn,
RDn,
WRn,
ED_oe_15,
ED_oe_14_8,
ED_oe_7_0;

input[15:0]
ED_do;

input ECMSn,
ECMA_EN,
D_TD0,
D_TD1,
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
XTALoffn,
IAD_oex;

input[15:0]
D_IAD_do;

input[11:0]
PIO_oe,
PIO_out;

input IDo,
IDoe;

`ifdef FD_DFT
input X_DFT_en;
`endif



output X_CLKO,
X_PWDACK,
X_BGn;

output[14:8]
X_EA_U;

inout [7:0]
X_EA;

output X_PMSn,
X_DMSn,
X_IOSn,
X_RDn,
X_WRn,
X_ECMSn,
X_ECMA_EN,
X_TD0,
X_TD1,
X_IACKn,
X_BMSn;

output D_RSTn,
T_ICE_RSTn,
T_BMODE,
T_MMAP;

output[1:0] T_TMODE;

output D_CLKI_OSC;

output[3:0] T_PLLsel;

output[15:0]T_ED;

output[7:0] T_EA;

output T_PWDn,
D_IRQ2n,
T_IRQ1n,
T_IRQ0n,
D_IRQL1n,
D_IRQE1n,
D_IRQE0n,
T_BRn,
D_RD0,
D_RD1,
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
output[15:0] D_IAD_di;
output[11:0] T_PIOin;

output D_ICK,
T_IMS,
T_ID,
T_GOICE;

`ifdef FD_DFT
output D_DFT_en;
`endif



`ifdef FD_EVB
`else
inout XTAL;
`endif

inout[15:0] X_ED;
inout X_SCLK0,
X_RFS0,
X_TFS0,
X_SCLK1,
X_RFS1,
X_TFS1;
inout[15:0] X_IAD;
inout[7:0] X_PIO;
inout X_ID;






`ifdef FD_DFT
assign D_DFT_en = X_DFT_en;
`endif

assign D_RSTn = X_RSTn;
assign D_CLKI_OSC = X_CLKI;
assign D_IRQ2n = X_IRQ2n;
assign D_IRQL1n = X_IRQL1n;
assign D_IRQE1n = X_IRQE1n;
assign D_IRQE0n = X_IRQE0n;
assign D_RD0 = X_RD0;
assign D_RD1 = X_RD1;
assign D_ICK = X_ICK;


assign T_PLLsel[3:0] = X_PLLsel[3:0];

assign T_ICE_RSTn = X_ICE_RSTn;
assign T_BMODE = X_BMODE;
assign T_TMODE[1:0] = X_TMODE[1:0];
assign T_PWDn = X_PWDn;
`ifdef FD_EVB
assign T_IRQ1n = 1'b1;
assign T_IRQ0n = 1'b1;
`else
pullup(T_IRQ1n);
pullup(T_IRQ0n);
`endif
assign T_IRDn = X_IRDn;
assign T_IWRn = X_IWRn;
assign T_ISn = X_ISn;
assign T_IAL = X_IAL;

assign T_MMAP = X_MMAP;
assign T_GOICE = X_GOICE;

assign T_IMS = X_IMS;

assign T_BRn = X_BRn;




assign X_CLKO = CLKO;
assign X_PWDACK = PWDACK;
assign X_BGn = BGn;

assign X_EA_U[14:8] = BGn ? EA_do[14:8] : 7'bz;
assign X_PMSn = BGn ? PMSn : 1'bz;
assign X_DMSn = BGn ? DMSn : 1'bz;
assign X_IOSn = BGn ? IOSn : 1'bz;
assign X_BMSn = BGn ? BMSn : 1'bz;

assign X_ECMSn = BGn ? ECMSn : 1'bz;
assign X_ECMA_EN = BGn ? ECMA_EN : 1'bz;

assign X_RDn = BGn ? RDn : 1'bz;
assign X_WRn = BGn ? WRn : 1'bz;
assign X_IACKn = IACKn;



assign X_TD0 = D_TD0;
assign X_TD1 = D_TD1;



assign X_EA[7:0] = EA_oe ? EA_do[7:0] : 8'bz;
assign T_EA[7:0] = X_EA[7:0];

assign X_ED[15] = ED_oe_15 ? ED_do[15] : 1'bz;
assign X_ED[14:8] = ED_oe_14_8 ? ED_do[14:8] : 7'bz;
assign X_ED[7:0] = ED_oe_7_0 ? ED_do[7:0] : 8'bz;
assign T_ED[15:0] = X_ED[15:0];

assign X_SCLK0 = ISCLK0 ? SCLK0 : 1'bz;
assign T_SCLK0 = X_SCLK0;

assign X_RFS0 = IRFS0 ? RFS0 : 1'bz;
assign T_RFS0 = X_RFS0;

assign X_TFS0 = ITFS0 ? TFS0 : 1'bz;
assign T_TFS0 = X_TFS0;

assign X_SCLK1 = ISCLK1 ? SCLK1 : 1'bz;
assign T_SCLK1 = X_SCLK1;

assign X_RFS1 = IRFS1 ? RFS1 : 1'bz;
assign T_RFS1 = X_RFS1;

assign X_TFS1 = ITFS1 ? TFS1 : 1'bz;
assign T_TFS1 = X_TFS1;


assign X_IAD[15:0] = IAD_oex ? D_IAD_do[15:0] : 16'bz;
assign D_IAD_di[15:0] = X_IAD[15:0];

assign X_ID = IDoe ? IDo : 1'bz;
assign T_ID = X_ID;

assign T_PIOin[11] = 1'b0;
assign T_PIOin[10] = 1'b0;
assign T_PIOin[9] = 1'b0;
assign T_PIOin[8] = 1'b0;
assign T_PIOin[7:0] = X_PIO[7:0];






assign X_PIO[7] = PIO_oe[7] ? PIO_out[7] : 1'bz;
assign X_PIO[6] = PIO_oe[6] ? PIO_out[6] : 1'bz;
assign X_PIO[5] = PIO_oe[5] ? PIO_out[5] : 1'bz;
assign X_PIO[4] = PIO_oe[4] ? PIO_out[4] : 1'bz;
assign X_PIO[3] = PIO_oe[3] ? PIO_out[3] : 1'bz;
assign X_PIO[2] = PIO_oe[2] ? PIO_out[2] : 1'bz;
assign X_PIO[1] = PIO_oe[1] ? PIO_out[1] : 1'bz;
assign X_PIO[0] = PIO_oe[0] ? PIO_out[0] : 1'bz;


endmodule
