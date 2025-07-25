`include "definitions.v"
`include "x_def.v"































module SCreg1 (/* in */ RST, DSPCLK, selAUTO, selFSDIV, selSCLKDIV,
selSCTL, selMWORD, AUTO_we, FSDIV_we, SCLKDIV_we,
SCTL_we, MWORD_we, DMD, MMR_web,
SLOT1_EXT, SLOT_NUM,
`ifdef FD_DFT
SCAN_TEST,
`endif


TIREG, TMREG, RIREG, RMREG,
TBUF, RBUF, FSDIV, SCLKDIV, LOOP,
ISCLK, FSD, FSW, ITFS, IRFS, INVTFS, INVRFS,
DTYPE, SLEN, MWORD, DMD_do,
SLEN_ex, INVxSCLK);


input [15:0] DMD;
input RST,
DSPCLK,
selAUTO,
selFSDIV,
selSCLKDIV,
selSCTL,
selMWORD,
AUTO_we,
FSDIV_we,
SCLKDIV_we,
SCTL_we,
MWORD_we,
MMR_web;
input [3:0] SLOT_NUM;
input [3:2] SLOT1_EXT;

`ifdef FD_DFT
input SCAN_TEST;
`endif

output [2:0] TIREG,
RIREG;
output [1:0] TMREG,
RMREG;
output [15:0] FSDIV,
SCLKDIV,
DMD_do;
output [1:0] FSD,
DTYPE;
output [4:0] SLEN;
output [15:0] MWORD;
output TBUF,
RBUF,
LOOP,
ISCLK,
FSW,
SLEN_ex,
INVxSCLK,
ITFS,
IRFS,
INVTFS,
INVRFS;

wire [11:0] DMD_MW;
wire [15:0] DMD_SCTL, DMD_FSDIV;
wire [15:0] MWORD;

wire [15:0] FSDIV, SCLKDIV, SCTL;
wire [11:0] AUTO_b;
wire [11:0] MW_OUT;

reg [15:12] AUTO_a;

wire [15:0] AUTO;
wire SPbas_R, SPidx_R;
wire SLEN_ex, INVxSCLK;









wire AC97_PSET, FSDIV_we_PSET, SCTL_we_PSET, MWORD_we_PSET;
wire [15:0] AC97_FSDIV = `AC97_FSDIV;
wire [15:0] AC97_SCTL = `AC97_SCTL;
wire [11:0] AC97_MWORD = `AC97_MWORD;

assign #`da AC97_PSET = MWORD_we && DMD[14];
assign #`da FSDIV_we_PSET = FSDIV_we || AC97_PSET;
assign #`da SCTL_we_PSET = SCTL_we || AC97_PSET;
assign #`da MWORD_we_PSET = MWORD_we || AC97_PSET;









wire [15:0] MWORD_RD;
wire AC97_MODE = MWORD[14];

assign #`da MWORD_RD[15:0] = !AC97_MODE ? {MWORD[15:13], 5'b0, MWORD[7:0]} :
{MWORD[15:14], SLOT1_EXT[3:2], SLOT_NUM[3:0], MWORD[7:0]};


assign #`da DMD_do[15:0] = {16{selAUTO}} & {4'b0, AUTO[11:0]} |
{16{selFSDIV}} & FSDIV[15:0] |
{16{selSCLKDIV}} & SCLKDIV[15:0] |
{16{selSCTL}} & SCTL[15:0] |

{16{selMWORD}} & MWORD_RD[15:0];


























`ifdef FD_DFT
REG12LC AUTOreg (DSPCLK, MMR_web, AUTO_we, DMD[11:0], AUTO[11:0], RST, SCAN_TEST);
`else
REG12LC AUTOreg (DSPCLK, MMR_web, AUTO_we, DMD[11:0], AUTO[11:0], RST);
`endif

assign #`d0 {TIREG[2:0], TMREG[1:0], RIREG[2:0],
RMREG[1:0], TBUF, RBUF} = AUTO[11:0];



















assign #`d0 DMD_FSDIV[15:0] = AC97_PSET ? AC97_FSDIV : DMD[15:0];

`ifdef FD_DFT
REG16LC FSDIVreg (DSPCLK, MMR_web, FSDIV_we_PSET, DMD_FSDIV[15:0], FSDIV[15:0], RST, SCAN_TEST);
`else
REG16LC FSDIVreg (DSPCLK, MMR_web, FSDIV_we_PSET, DMD_FSDIV[15:0], FSDIV[15:0], RST);
`endif


















`ifdef FD_DFT
REG16LC SCLKDIVreg (DSPCLK, MMR_web, SCLKDIV_we, DMD[15:0],
SCLKDIV[15:0], RST, SCAN_TEST);
`else
REG16LC SCLKDIVreg (DSPCLK, MMR_web, SCLKDIV_we, DMD[15:0],
SCLKDIV[15:0], RST);
`endif




































assign #`d0 DMD_SCTL[15:0] = AC97_PSET ? AC97_SCTL : DMD[15:0];


`ifdef FD_DFT
SREG16MC SCTLreg (DSPCLK, MMR_web, SCTL_we_PSET, DMD_SCTL[15:0], SCTL[15:0], RST, SCAN_TEST);
`else
SREG16MC SCTLreg (DSPCLK, MMR_web, SCTL_we_PSET, DMD_SCTL[15:0], SCTL[15:0], RST);
`endif

assign #`d0 LOOP = SCTL[15];
assign #`d0 ISCLK = SCTL[14];
assign #`d0 INVxSCLK = SCTL[13];
assign #`d0 FSD[1:0] = SCTL[12:11];
assign #`d0 FSW = SCTL[10];
assign #`d0 ITFS = SCTL[9];
assign #`d0 IRFS = SCTL[8];
assign #`d0 INVTFS = SCTL[7];
assign #`d0 INVRFS = SCTL[6];
assign #`d0 DTYPE[1:0] = SCTL[5:4];
assign #`d0 SLEN_ex = MWORD[15];
assign #`d0 SLEN[4:0] = {SLEN_ex, SCTL[3:0]};




















assign #`d0 DMD_MW[10:0] = AC97_PSET ? AC97_MWORD | {2'b0,DMD[13],8'b0} :
{DMD[15:13], DMD[7:0]};

assign #`d0 MWORD[15:0] = {MW_OUT[10:8], 5'b0, MW_OUT[7:0]};


`ifdef FD_DFT
REG11LC MWORDreg (DSPCLK, MMR_web, MWORD_we_PSET, DMD_MW[10:0], MW_OUT[10:0], RST, SCAN_TEST);
`else
REG11LC MWORDreg (DSPCLK, MMR_web, MWORD_we_PSET, DMD_MW[10:0], MW_OUT[10:0], RST);
`endif

endmodule

