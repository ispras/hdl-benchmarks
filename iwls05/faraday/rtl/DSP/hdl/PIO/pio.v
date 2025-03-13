`include "reg12lc.v"
`include "x_def.v"
module PIO(

DSPCLK, T_RST, DMD, PIO_IN,


selPMASK, selPINT, selPFTYPE, selPFDATA,
PMASK_we, PINT_we, PFTYPE_we, PFDATA_we,
MMR_web,
`ifdef FD_DFT
SCAN_TEST,
`endif


PIO_INTn, PIO_DMD, PIO_EN, PIO_OUT);

input DSPCLK;
input T_RST;
input selPMASK;
input selPINT;
input selPFTYPE;
input selPFDATA;
input PMASK_we;
input PINT_we;
input PFTYPE_we;
input PFDATA_we;
input [11:0] PIO_IN;
input [15:0] DMD;
input MMR_web;

`ifdef FD_DFT
input SCAN_TEST;
`endif

output PIO_INTn;
output [15:0] PIO_DMD;
output [11:0] PIO_OUT;
output [11:0] PIO_EN;
/*-----------------------------------------------------*/
wire [11:0] PIO_IN;
wire [11:0] PIO_OUT;
wire [11:0] PIO_EN;


















/*------------------------------------------------------*/



/*------------------------------------------------------*/



/*------------------------------------------------------*/




/*------------------------------------------------------*/

/*------------------------------------------------------*/
wire [11:0] PMASK;

`ifdef FD_DFT
REG12LC pmask_reg(DSPCLK, MMR_web, PMASK_we, {DMD[15:12], DMD[7:0]}, PMASK[11:0],
T_RST, SCAN_TEST);
`else
REG12LC pmask_reg(DSPCLK, MMR_web, PMASK_we, {DMD[15:12], DMD[7:0]}, PMASK[11:0], T_RST);
`endif













/*-----------------------------------------------------*/
wire [11:0] PFTYPE;

`ifdef FD_DFT
REG12LC pftype_reg(DSPCLK, MMR_web, PFTYPE_we, {DMD[15:12], DMD[7:0]}, PFTYPE[11:0],
T_RST, SCAN_TEST);
`else
REG12LC pftype_reg(DSPCLK, MMR_web, PFTYPE_we, {DMD[15:12], DMD[7:0]}, PFTYPE[11:0], T_RST);
`endif













/*-----------------------------------------------------*/
`ifdef FD_GTCLK

`ifdef FD_DFT
GTECH_AND3 uk00 (.Z(CKenb0_dft), .A(MMR_web), .B(PFTYPE[0]), .C(PFTYPE[1]));
GTECH_AND3 uk10 (.Z(CKenb1_dft), .A(MMR_web), .B(PFTYPE[2]), .C(PFTYPE[3]));
GTECH_AND3 uk20 (.Z(CKenb2_dft), .A(MMR_web), .B(PFTYPE[4]), .C(PFTYPE[5]));
GTECH_AND3 uk30 (.Z(CKenb3_dft), .A(MMR_web), .B(PFTYPE[6]), .C(PFTYPE[7]));
GTECH_AND3 uk40 (.Z(CKenb4_dft), .A(MMR_web), .B(PFTYPE[8]), .C(PFTYPE[9]));
GTECH_AND3 uk50 (.Z(CKenb5_dft), .A(MMR_web), .B(PFTYPE[10]), .C(PFTYPE[11]));
GTECH_AND_NOT utm0 (.Z(CKenb0), .A(CKenb0_dft), .B(SCAN_TEST));
GTECH_AND_NOT utm1 (.Z(CKenb1), .A(CKenb1_dft), .B(SCAN_TEST));
GTECH_AND_NOT utm2 (.Z(CKenb2), .A(CKenb2_dft), .B(SCAN_TEST));
GTECH_AND_NOT utm3 (.Z(CKenb3), .A(CKenb3_dft), .B(SCAN_TEST));
GTECH_AND_NOT utm4 (.Z(CKenb4), .A(CKenb4_dft), .B(SCAN_TEST));
GTECH_AND_NOT utm5 (.Z(CKenb5), .A(CKenb5_dft), .B(SCAN_TEST));
`else
GTECH_AND3 uk00 (.Z(CKenb0), .A(MMR_web), .B(PFTYPE[0]), .C(PFTYPE[1]));
GTECH_AND3 uk10 (.Z(CKenb1), .A(MMR_web), .B(PFTYPE[2]), .C(PFTYPE[3]));
GTECH_AND3 uk20 (.Z(CKenb2), .A(MMR_web), .B(PFTYPE[4]), .C(PFTYPE[5]));
GTECH_AND3 uk30 (.Z(CKenb3), .A(MMR_web), .B(PFTYPE[6]), .C(PFTYPE[7]));
GTECH_AND3 uk40 (.Z(CKenb4), .A(MMR_web), .B(PFTYPE[8]), .C(PFTYPE[9]));
GTECH_AND3 uk50 (.Z(CKenb5), .A(MMR_web), .B(PFTYPE[10]), .C(PFTYPE[11]));
`endif

GTECH_NOR2 uk01 (.Z(PIOCLK0_), .A(DSPCLK), .B(CKenb0));
GtCLK_NOT ckPIOCLK0 (.Z(PIOCLK0), .A(PIOCLK0_));

GTECH_NOR2 uk11 (.Z(PIOCLK1_), .A(DSPCLK), .B(CKenb1));
GtCLK_NOT ckPIOCLK1 (.Z(PIOCLK1), .A(PIOCLK1_));

GTECH_NOR2 uk21 (.Z(PIOCLK2_), .A(DSPCLK), .B(CKenb2));
GtCLK_NOT ckPIOCLK2 (.Z(PIOCLK2), .A(PIOCLK2_));

GTECH_NOR2 uk31 (.Z(PIOCLK3_), .A(DSPCLK), .B(CKenb3));
GtCLK_NOT ckPIOCLK3 (.Z(PIOCLK3), .A(PIOCLK3_));

GTECH_NOR2 uk41 (.Z(PIOCLK4_), .A(DSPCLK), .B(CKenb4));
GtCLK_NOT ckPIOCLK4 (.Z(PIOCLK4), .A(PIOCLK4_));

GTECH_NOR2 uk51 (.Z(PIOCLK5_), .A(DSPCLK), .B(CKenb5));
GtCLK_NOT ckPIOCLK5 (.Z(PIOCLK5), .A(PIOCLK5_));

`else
wire PIOCLK0_en=!(MMR_web & PFTYPE[0] & PFTYPE[1]);
wire PIOCLK1_en=!(MMR_web & PFTYPE[2] & PFTYPE[3]);
wire PIOCLK2_en=!(MMR_web & PFTYPE[4] & PFTYPE[5]);
wire PIOCLK3_en=!(MMR_web & PFTYPE[6] & PFTYPE[7]);
wire PIOCLK4_en=!(MMR_web & PFTYPE[8] & PFTYPE[9]);
wire PIOCLK5_en=!(MMR_web & PFTYPE[10] & PFTYPE[11]);
wire PIOCLK0=DSPCLK;
wire PIOCLK1=DSPCLK;
wire PIOCLK2=DSPCLK;
wire PIOCLK3=DSPCLK;
wire PIOCLK4=DSPCLK;
wire PIOCLK5=DSPCLK;

`endif

reg [11:0] PFDATA;
reg [11:0] PIO_RES;


always @(posedge PIOCLK5 or posedge T_RST)
begin
if (T_RST)
PFDATA[11] <= #1 1'b0;
`ifdef FD_GTCLK
else if (!PFTYPE[11])
PFDATA[11] <= #1 PIO_RES[11];
else if (PFDATA_we)
PFDATA[11] <= #1 DMD[15];
else
PFDATA[11] <= #1 PFDATA[11];
`else
else if (!PFTYPE[11] & PIOCLK5_en)
PFDATA[11] <= #1 PIO_RES[11];
else if (PFDATA_we & PIOCLK5_en)
PFDATA[11] <= #1 DMD[15];
else if(PIOCLK5_en)
PFDATA[11] <= #1 PFDATA[11];
`endif

end

always @(posedge PIOCLK5 or posedge T_RST)
begin
if (T_RST)
PFDATA[10] <= #1 1'b0;
`ifdef FD_GTCLK
else if (!PFTYPE[10])
PFDATA[10] <= #1 PIO_RES[10];
else if (PFDATA_we)
PFDATA[10] <= #1 DMD[14];
else
PFDATA[10] <= #1 PFDATA[10];
`else
else if (!PFTYPE[10] & PIOCLK5_en)
PFDATA[10] <= #1 PIO_RES[10];
else if (PFDATA_we & PIOCLK5_en)
PFDATA[10] <= #1 DMD[14];
else if(PIOCLK5_en)
PFDATA[10] <= #1 PFDATA[10];
`endif
end

always @(posedge PIOCLK4 or posedge T_RST)
begin
if (T_RST)
PFDATA[9] <= #1 1'b0;
`ifdef FD_GTCLK
else if (!PFTYPE[9])
PFDATA[9] <= #1 PIO_RES[9];
else if (PFDATA_we)
PFDATA[9] <= #1 DMD[13];
else
PFDATA[9] <= #1 PFDATA[9];
`else
else if (!PFTYPE[9] & PIOCLK4_en)
PFDATA[9] <= #1 PIO_RES[9];
else if (PFDATA_we & PIOCLK4_en)
PFDATA[9] <= #1 DMD[13];
else if(PIOCLK4_en)
PFDATA[9] <= #1 PFDATA[9];
`endif
end

always @(posedge PIOCLK4 or posedge T_RST)
begin
if (T_RST)
PFDATA[8] <= #1 1'b0;
`ifdef FD_GTCLK
else if (!PFTYPE[8])
PFDATA[8] <= #1 PIO_RES[8];
else if (PFDATA_we)
PFDATA[8] <= #1 DMD[12];
else
PFDATA[8] <= #1 PFDATA[8];
`else
else if (!PFTYPE[8] & PIOCLK4_en)
PFDATA[8] <= #1 PIO_RES[8];
else if (PFDATA_we & PIOCLK4_en)
PFDATA[8] <= #1 DMD[12];
else if(PIOCLK4_en)
PFDATA[8] <= #1 PFDATA[8];
`endif
end

always @(posedge PIOCLK3 or posedge T_RST)
begin
if (T_RST)
PFDATA[7] <= #1 1'b0;
`ifdef FD_GTCLK
else if (!PFTYPE[7])
PFDATA[7] <= #1 PIO_RES[7];
else if (PFDATA_we)
PFDATA[7] <= #1 DMD[7];
else
PFDATA[7] <= #1 PFDATA[7];
`else
else if (!PFTYPE[7] & PIOCLK3_en)
PFDATA[7] <= #1 PIO_RES[7];
else if (PFDATA_we & PIOCLK3_en)
PFDATA[7] <= #1 DMD[7];
else if(PIOCLK3_en)
PFDATA[7] <= #1 PFDATA[7];
`endif
end

always @(posedge PIOCLK3 or posedge T_RST)
begin
if (T_RST)
PFDATA[6] <= #1 1'b0;
`ifdef FD_GTCLK
else if (!PFTYPE[6])
PFDATA[6] <= #1 PIO_RES[6];
else if (PFDATA_we)
PFDATA[6] <= #1 DMD[6];
else
PFDATA[6] <= #1 PFDATA[6];
`else
else if (!PFTYPE[6] & PIOCLK3_en)
PFDATA[6] <= #1 PIO_RES[6];
else if (PFDATA_we & PIOCLK3_en)
PFDATA[6] <= #1 DMD[6];
else if(PIOCLK3_en)
PFDATA[6] <= #1 PFDATA[6];
`endif
end

always @(posedge PIOCLK2 or posedge T_RST)
begin
if (T_RST)
PFDATA[5] <= #1 1'b0;
`ifdef FD_GTCLK
else if (!PFTYPE[5])
PFDATA[5] <= #1 PIO_RES[5];
else if (PFDATA_we)
PFDATA[5] <= #1 DMD[5];
else
PFDATA[5] <= #1 PFDATA[5];
`else
else if (!PFTYPE[5] & PIOCLK2_en)
PFDATA[5] <= #1 PIO_RES[5];
else if (PFDATA_we & PIOCLK2_en)
PFDATA[5] <= #1 DMD[5];
else if(PIOCLK2_en)
PFDATA[5] <= #1 PFDATA[5];
`endif
end

always @(posedge PIOCLK2 or posedge T_RST)
begin
if (T_RST)
PFDATA[4] <= #1 1'b0;
`ifdef FD_GTCLK
else if (!PFTYPE[4])
PFDATA[4] <= #1 PIO_RES[4];
else if (PFDATA_we)
PFDATA[4] <= #1 DMD[4];
else
PFDATA[4] <= #1 PFDATA[4];
`else
else if (!PFTYPE[4] & PIOCLK2_en)
PFDATA[4] <= #1 PIO_RES[4];
else if (PFDATA_we & PIOCLK2_en)
PFDATA[4] <= #1 DMD[4];
else if(PIOCLK2_en)
PFDATA[4] <= #1 PFDATA[4];
`endif
end

always @(posedge PIOCLK1 or posedge T_RST)
begin
if (T_RST)
PFDATA[3] <= #1 1'b0;
`ifdef FD_GTCLK
else if (!PFTYPE[3])
PFDATA[3] <= #1 PIO_RES[3];
else if (PFDATA_we)
PFDATA[3] <= #1 DMD[3];
else
PFDATA[3] <= #1 PFDATA[3];
`else
else if (!PFTYPE[3] & PIOCLK1_en)
PFDATA[3] <= #1 PIO_RES[3];
else if (PFDATA_we & PIOCLK1_en)
PFDATA[3] <= #1 DMD[3];
else if(PIOCLK1_en)
PFDATA[3] <= #1 PFDATA[3];
`endif
end

always @(posedge PIOCLK1 or posedge T_RST)
begin
if (T_RST)
PFDATA[2] <= #1 1'b0;
`ifdef FD_GTCLK
else if (!PFTYPE[2])
PFDATA[2] <= #1 PIO_RES[2];
else if (PFDATA_we)
PFDATA[2] <= #1 DMD[2];
else
PFDATA[2] <= #1 PFDATA[2];
`else
else if (!PFTYPE[2] & PIOCLK1_en)
PFDATA[2] <= #1 PIO_RES[2];
else if (PFDATA_we & PIOCLK1_en)
PFDATA[2] <= #1 DMD[2];
else if(PIOCLK1_en)
PFDATA[2] <= #1 PFDATA[2];
`endif
end

always @(posedge PIOCLK0 or posedge T_RST)
begin
if (T_RST)
PFDATA[1] <= #1 1'b0;
`ifdef FD_GTCLK
else if (!PFTYPE[1])
PFDATA[1] <= #1 PIO_RES[1];
else if (PFDATA_we)
PFDATA[1] <= #1 DMD[1];
else
PFDATA[1] <= #1 PFDATA[1];
`else
else if (!PFTYPE[1] & PIOCLK0_en)
PFDATA[1] <= #1 PIO_RES[1];
else if (PFDATA_we & PIOCLK0_en)
PFDATA[1] <= #1 DMD[1];
else if(PIOCLK0_en)
PFDATA[1] <= #1 PFDATA[1];
`endif
end

always @(posedge PIOCLK0 or posedge T_RST)
begin
if (T_RST)
PFDATA[0] <= #1 1'b0;
`ifdef FD_GTCLK
else if (!PFTYPE[0])
PFDATA[0] <= #1 PIO_RES[0];
else if (PFDATA_we)
PFDATA[0] <= #1 DMD[0];
else
PFDATA[0] <= #1 PFDATA[0];
`else
else if (!PFTYPE[0] & PIOCLK0_en)
PFDATA[0] <= #1 PIO_RES[0];
else if (PFDATA_we & PIOCLK0_en)
PFDATA[0] <= #1 DMD[0];
else if(PIOCLK0_en)
PFDATA[0] <= #1 PFDATA[0];
`endif
end
























































































/*-----------------------------------------------------------*/

/*--------------------------------------*/

/*--------------------------------------*/
reg [11:0] PIO_IN_P;
wire [11:0] PIO_RES_in;
wire [11:0] PIO_RES0;
wire [11:0] PIO_RES1;

always @(posedge PIOCLK5)
`ifdef FD_GTCLK
`else
if(PIOCLK5_en)
`endif
PIO_IN_P[11] <= #`da PIO_IN[11];

always @(posedge PIOCLK5)
`ifdef FD_GTCLK
`else
if(PIOCLK5_en)
`endif
PIO_IN_P[10] <= #`da PIO_IN[10];

always @(posedge PIOCLK4)
`ifdef FD_GTCLK
`else
if(PIOCLK4_en)
`endif
PIO_IN_P[9] <= #`da PIO_IN[9];

always @(posedge PIOCLK4)
`ifdef FD_GTCLK
`else
if(PIOCLK4_en)
`endif
PIO_IN_P[8] <= #`da PIO_IN[8];

always @(posedge PIOCLK3)
`ifdef FD_GTCLK
`else
if(PIOCLK3_en)
`endif
PIO_IN_P[7] <= #`da PIO_IN[7];

always @(posedge PIOCLK3)
`ifdef FD_GTCLK
`else
if(PIOCLK3_en)
`endif
PIO_IN_P[6] <= #`da PIO_IN[6];

always @(posedge PIOCLK2)
`ifdef FD_GTCLK
`else
if(PIOCLK2_en)
`endif
PIO_IN_P[5] <= #`da PIO_IN[5];

always @(posedge PIOCLK2)
`ifdef FD_GTCLK
`else
if(PIOCLK2_en)
`endif
PIO_IN_P[4] <= #`da PIO_IN[4];

always @(posedge PIOCLK1)
`ifdef FD_GTCLK
`else
if(PIOCLK1_en)
`endif
PIO_IN_P[3] <= #`da PIO_IN[3];

always @(posedge PIOCLK1)
`ifdef FD_GTCLK
`else
if(PIOCLK1_en)
`endif
PIO_IN_P[2] <= #`da PIO_IN[2];

always @(posedge PIOCLK0)
`ifdef FD_GTCLK
`else
if(PIOCLK0_en)
`endif
PIO_IN_P[1] <= #`da PIO_IN[1];

always @(posedge PIOCLK0)
`ifdef FD_GTCLK
`else
if(PIOCLK0_en)
`endif
PIO_IN_P[0] <= #`da PIO_IN[0];


assign PIO_RES0[11:0] = PIO_IN[11:0] & PIO_IN_P[11:0];
assign PIO_RES1[11:0] = PIO_IN[11:0] | PIO_IN_P[11:0];

assign PIO_RES_in[11] = PIO_RES[11] ? PIO_RES1[11] : PIO_RES0[11];
assign PIO_RES_in[10] = PIO_RES[10] ? PIO_RES1[10] : PIO_RES0[10];
assign PIO_RES_in[9] = PIO_RES[9] ? PIO_RES1[9] : PIO_RES0[9];
assign PIO_RES_in[8] = PIO_RES[8] ? PIO_RES1[8] : PIO_RES0[8];
assign PIO_RES_in[7] = PIO_RES[7] ? PIO_RES1[7] : PIO_RES0[7];
assign PIO_RES_in[6] = PIO_RES[6] ? PIO_RES1[6] : PIO_RES0[6];
assign PIO_RES_in[5] = PIO_RES[5] ? PIO_RES1[5] : PIO_RES0[5];
assign PIO_RES_in[4] = PIO_RES[4] ? PIO_RES1[4] : PIO_RES0[4];
assign PIO_RES_in[3] = PIO_RES[3] ? PIO_RES1[3] : PIO_RES0[3];
assign PIO_RES_in[2] = PIO_RES[2] ? PIO_RES1[2] : PIO_RES0[2];
assign PIO_RES_in[1] = PIO_RES[1] ? PIO_RES1[1] : PIO_RES0[1];
assign PIO_RES_in[0] = PIO_RES[0] ? PIO_RES1[0] : PIO_RES0[0];

always @(posedge PIOCLK0 or posedge T_RST)
if (T_RST)
PIO_RES[1:0] <= #1 2'b0;
`ifdef FD_GTCLK
else
`else
else if(PIOCLK0_en)
`endif
PIO_RES[1:0] <= PIO_RES_in[1:0];

always @(posedge PIOCLK1 or posedge T_RST)
if (T_RST)
PIO_RES[3:2] <= #1 2'b0;
`ifdef FD_GTCLK
else
`else
else if(PIOCLK1_en)
`endif
PIO_RES[3:2] <= PIO_RES_in[3:2];

always @(posedge PIOCLK2 or posedge T_RST)
if (T_RST)
PIO_RES[5:4] <= #1 2'b0;
`ifdef FD_GTCLK
else
`else
else if(PIOCLK2_en)
`endif
PIO_RES[5:4] <= PIO_RES_in[5:4];

always @(posedge PIOCLK3 or posedge T_RST)
if (T_RST)
PIO_RES[7:6] <= #1 2'b0;
`ifdef FD_GTCLK
else
`else
else if(PIOCLK3_en)
`endif
PIO_RES[7:6] <= PIO_RES_in[7:6];

always @(posedge PIOCLK4 or posedge T_RST)
if (T_RST)
PIO_RES[9:8] <= #1 2'b0;
`ifdef FD_GTCLK
else
`else
else if(PIOCLK4_en)
`endif
PIO_RES[9:8] <= PIO_RES_in[9:8];

always @(posedge PIOCLK5 or posedge T_RST)
if (T_RST)
PIO_RES[11:10] <= #1 2'b0;
`ifdef FD_GTCLK
else
`else
else if(PIOCLK5_en)
`endif
PIO_RES[11:10] <= PIO_RES_in[11:10];

/*--------------------------------------*/


/*--------------------------------------*/
reg [11:0] PIO_RES_OUT;
reg [11:0] PINT;
wire [11:0] PINT_in;
wire [11:0] PIO_RES_T;

always @(posedge PIOCLK0)
`ifdef FD_GTCLK
`else
if(PIOCLK0_en)
`endif
PIO_RES_OUT[1:0] <= #1 PIO_RES[1:0];

always @(posedge PIOCLK1)
`ifdef FD_GTCLK
`else
if(PIOCLK1_en)
`endif
PIO_RES_OUT[3:2] <= #1 PIO_RES[3:2];

always @(posedge PIOCLK2)
`ifdef FD_GTCLK
`else
if(PIOCLK2_en)
`endif
PIO_RES_OUT[5:4] <= #1 PIO_RES[5:4];

always @(posedge PIOCLK3)
`ifdef FD_GTCLK
`else
if(PIOCLK3_en)
`endif
PIO_RES_OUT[7:6] <= #1 PIO_RES[7:6];

always @(posedge PIOCLK4)
`ifdef FD_GTCLK
`else
if(PIOCLK4_en)
`endif
PIO_RES_OUT[9:8] <= #1 PIO_RES[9:8];

always @(posedge PIOCLK5)
`ifdef FD_GTCLK
`else
if(PIOCLK5_en)
`endif
PIO_RES_OUT[11:10] <= #1 PIO_RES[11:10];

assign PIO_RES_T[11:0] = PIO_RES[11:0] ^ PIO_RES_OUT[11:0];
assign PINT_in[11] = PIO_RES_T[11] & (~PFTYPE[11]) & PMASK[11] ? 1'b1 : PINT[11];
assign PINT_in[10] = PIO_RES_T[10] & (~PFTYPE[10]) & PMASK[10] ? 1'b1 : PINT[10];
assign PINT_in[9] = PIO_RES_T[9] & (~PFTYPE[9]) & PMASK[9] ? 1'b1 : PINT[9];
assign PINT_in[8] = PIO_RES_T[8] & (~PFTYPE[8]) & PMASK[8] ? 1'b1 : PINT[8];
assign PINT_in[7] = PIO_RES_T[7] & (~PFTYPE[7]) & PMASK[7] ? 1'b1 : PINT[7];
assign PINT_in[6] = PIO_RES_T[6] & (~PFTYPE[6]) & PMASK[6] ? 1'b1 : PINT[6];
assign PINT_in[5] = PIO_RES_T[5] & (~PFTYPE[5]) & PMASK[5] ? 1'b1 : PINT[5];
assign PINT_in[4] = PIO_RES_T[4] & (~PFTYPE[4]) & PMASK[4] ? 1'b1 : PINT[4];
assign PINT_in[3] = PIO_RES_T[3] & (~PFTYPE[3]) & PMASK[3] ? 1'b1 : PINT[3];
assign PINT_in[2] = PIO_RES_T[2] & (~PFTYPE[2]) & PMASK[2] ? 1'b1 : PINT[2];
assign PINT_in[1] = PIO_RES_T[1] & (~PFTYPE[1]) & PMASK[1] ? 1'b1 : PINT[1];
assign PINT_in[0] = PIO_RES_T[0] & (~PFTYPE[0]) & PMASK[0] ? 1'b1 : PINT[0];

always @(posedge DSPCLK or posedge T_RST)
begin
if (T_RST)
PINT[11:0] <= #1 12'b0;
else if (PINT_we)
PINT[11:0] <= #1 {DMD[15:12], DMD[7:0]};
else
PINT[11:0] <= #1 PINT_in[11:0];
end

/*--------------------------------------*/



/*--------------------------------------*/
wire PIO_INTn;

assign PIO_INTn = ~(|(PMASK[11:0] & PINT[11:0]));

/*-----------------------------------------------------------------*/
/*--------------------------------------*/

/*--------------------------------------*/
assign PIO_OUT[11:0] = PFDATA[11:0];
assign PIO_EN[11:0] = PFTYPE[11:0];

/*-----------------------------------------------------------------*/
/*--------------------------------------*/

/*--------------------------------------*/

assign PIO_DMD[15:0] = ({16{selPMASK}} & {PMASK[11:8], 4'b0, PMASK[7:0]})
| ({16{selPINT}} & {PINT[11:8], 4'b0, PINT[7:0]})
| ({16{selPFTYPE}} & {PFTYPE[11:8], 4'b0, PFTYPE[7:0]})
| ({16{selPFDATA}} & {PFDATA[11:8], 4'b0, PFDATA[7:0]});



endmodule



