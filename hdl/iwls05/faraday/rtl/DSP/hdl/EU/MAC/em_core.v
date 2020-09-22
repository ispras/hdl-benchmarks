






/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/


/*--------------------------------------------------------------*/

`include "x_def.v"

module EM_CORE(/* IN */
unsignX_E, unsignY_E, FracMode_E,
mzero_E, msub1_E, rnd_E,
MXOP_E, MYOP_E, MR2di, MR1di,
MR0di, msub2_E, msub3_E, msub4_E, msub5_E,
msub6_E, msub7_E, msub8_E, MACop_E, BIASRND,


MACin);


input unsignX_E, unsignY_E, msub1_E;
input FracMode_E, mzero_E, rnd_E;
input [15:0] MXOP_E;
input [15:0] MYOP_E;
input [7:0] MR2di;
input [15:0] MR1di;
input [15:0] MR0di;
input msub2_E;
input msub3_E;
input msub4_E;
input msub5_E;
input msub6_E;
input msub7_E;
input msub8_E;
input MACop_E;
input BIASRND;


output [39:0] MACin;



wire [16:0] Cin_E;
wire [39:14] MRb_E;
wire [15:0] MRa_E;
wire [17:0] P0_E;
wire [19:2] P1_E;
wire [21:4] P2_E;
wire [23:6] P3_E;
wire [25:8] P4_E;
wire [27:10] P5_E;
wire [29:12] P6_E;
wire [31:14] P7_E;
wire [32:16] P8_E;















wire X16, Y16;
wire mzero_0, mzero_1;


wire [17:0] X1p, X2p;
wire [17:0] X1m, X2m;
wire [7:0] MR2;
wire [15:0] MR1, MR0;

assign X16 = (~unsignX_E) & MXOP_E[15];
assign Y16 = (~unsignY_E) & MYOP_E[15];
assign X1p[17:0] = {X16, X16, MXOP_E[15:0]};
assign X2p[17:0] = {X1p[16:0], 1'b0};
assign X1m[17:0] = ~X1p[17:0];
assign X2m[17:0] = {X1m[16:0], 1'b0};

assign MR2[7:0] = MR2di[7:0] & {8{MACop_E}};
assign MR1[15:0] = MR1di[15:0] & {16{MACop_E}};
assign MR0[15:0] = MR0di[15:0] & {16{MACop_E}};

assign mzero_0 = FracMode_E && rnd_E;
assign mzero_1 = (~FracMode_E) && rnd_E;

assign MRa_E[15:0] = mzero_E ? 16'b0 :
FracMode_E ? {1'b0, MR0[15:1]} : MR0[15:0];

assign MRb_E[39:14] = mzero_E ? {24'b0, mzero_1, mzero_0} :
FracMode_E ? {MR2[7], MR2[7:0], MR1[15:0], rnd_E} :
{MR2[7:0], MR1[15:0], rnd_E, 1'b0};

/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
wire P0_1p, P0_2p, P0_1m, P0_2m;
wire P1_1p, P1_2p, P1_1m, P1_2m;
wire P2_1p, P2_2p, P2_1m, P2_2m;
wire P3_1p, P3_2p, P3_1m, P3_2m;
wire P4_1p, P4_2p, P4_1m, P4_2m;
wire P5_1p, P5_2p, P5_1m, P5_2m;
wire P6_1p, P6_2p, P6_1m, P6_2m;
wire P7_1p, P7_2p, P7_1m, P7_2m;
wire P8_1p, P8_1m;

PSEL P0_sel(msub1_E, {MYOP_E[1:0], 1'b0}, P0_1p, P0_2p, P0_1m, P0_2m);
PSEL P1_sel(msub2_E, MYOP_E[3:1], P1_1p, P1_2p, P1_1m, P1_2m);
PSEL P2_sel(msub3_E, MYOP_E[5:3], P2_1p, P2_2p, P2_1m, P2_2m);
PSEL P3_sel(msub4_E, MYOP_E[7:5], P3_1p, P3_2p, P3_1m, P3_2m);
PSEL P4_sel(msub5_E, MYOP_E[9:7], P4_1p, P4_2p, P4_1m, P4_2m);
PSEL P5_sel(msub6_E, MYOP_E[11:9], P5_1p, P5_2p, P5_1m, P5_2m);
PSEL P6_sel(msub7_E, MYOP_E[13:11], P6_1p, P6_2p, P6_1m, P6_2m);
PSEL P7_sel(msub8_E, MYOP_E[15:13], P7_1p, P7_2p, P7_1m, P7_2m);

/*--------------------------------------------------------------*/





/*--------------------------------------------------------------*/

assign P8_1p = unsignY_E & MYOP_E[15] & (~msub1_E);
assign P8_1m = unsignY_E & MYOP_E[15] & msub2_E;

/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/













assign Cin_E[16:0] = {P8_1m, P7_2m, P7_1m, P6_2m, P6_1m, P5_2m, P5_1m,
P4_2m, P4_1m, P3_2m, P3_1m, P2_2m, P2_1m, P1_2m,
P1_1m, P0_2m, P0_1m};

PPART P0_part(P0_1p, P0_2p, P0_1m, P0_2m,
X1p, X2p, X1m, X2m, P0_E[17:0]);

PPART P1_part(P1_1p, P1_2p, P1_1m, P1_2m,
X1p, X2p, X1m, X2m, P1_E[19:2]);

PPART P2_part(P2_1p, P2_2p, P2_1m, P2_2m,
X1p, X2p, X1m, X2m, P2_E[21:4]);

PPART p3_part(P3_1p, P3_2p, P3_1m, P3_2m,
X1p, X2p, X1m, X2m, P3_E[23:6]);

PPART p4_part(P4_1p, P4_2p, P4_1m, P4_2m,
X1p, X2p, X1m, X2m, P4_E[25:8]);

PPART p5_part(P5_1p, P5_2p, P5_1m, P5_2m,
X1p, X2p, X1m, X2m, P5_E[27:10]);

PPART p6_part(P6_1p, P6_2p, P6_1m, P6_2m,
X1p, X2p, X1m, X2m, P6_E[29:12]);

PPART p7_part(P7_1p, P7_2p, P7_1m, P7_2m,
X1p, X2p, X1m, X2m, P7_E[31:14]);

assign P8_E[32:16] = ({17{P8_1p}} & X1p[16:0]) | {17{P8_1m}} & X1m[16:0];






wire [2:0] MLSB_E;
wire [39:3] SUM_E;
wire [39:3] CRY_E;












wire [39:0] CSA10_i0 = {23'b0, Cin_E[16:0]};
wire [39:0] CSA10_i1 = {24'b0, MRa_E[15:0]};
wire [39:0] CSA10_i2 = {{22{P0_E[17]}}, P0_E[17:0]};
wire [39:0] S1_0;
wire [39:1] C1_0;

assign S1_0[39:0] = CSA10_i0[39:0] ^ CSA10_i1[39:0] ^ CSA10_i2[39:0];
assign C1_0[39:1] = CSA10_i0[38:0] & CSA10_i1[38:0]
| CSA10_i1[38:0] & CSA10_i2[38:0]
| CSA10_i2[38:0] & CSA10_i0[38:0];


wire [39:2] CSA11_i0 = {{20{P1_E[19]}}, P1_E[19:2]};
wire [39:2] CSA11_i1 = {{18{P2_E[21]}}, P2_E[21:4], 2'b0};
wire [39:2] CSA11_i2 = {{16{P3_E[23]}}, P3_E[23:6], 4'b0};
wire [39:2] S1_1;
wire [39:3] C1_1;

assign S1_1[39:2] = CSA11_i0[39:2] ^ CSA11_i1[39:2] ^ CSA11_i2[39:2];
assign C1_1[39:3] = CSA11_i0[38:2] & CSA11_i1[38:2]
| CSA11_i1[38:2] & CSA11_i2[38:2]
| CSA11_i2[38:2] & CSA11_i0[38:2];


wire [39:8] CSA12_i0 = {{14{P4_E[25]}}, P4_E[25:8]};
wire [39:8] CSA12_i1 = {{12{P5_E[27]}}, P5_E[27:10], 2'b0};
wire [39:8] CSA12_i2 = {{10{P6_E[29]}}, P6_E[29:12], 4'b0};
wire [39:8] S1_2;
wire [39:9] C1_2;

assign S1_2[39:8] = CSA12_i0[39:8] ^ CSA12_i1[39:8] ^ CSA12_i2[39:8];
assign C1_2[39:9] = CSA12_i0[38:8] & CSA12_i1[38:8]
| CSA12_i1[38:8] & CSA12_i2[38:8]
| CSA12_i2[38:8] & CSA12_i0[38:8];


wire [39:14] CSA13_i0 = {{8{P7_E[31]}}, P7_E[31:14]};
wire [39:14] CSA13_i1 = {{7{P8_E[32]}}, P8_E[32:16], 2'b0};
wire [39:14] CSA13_i2 = MRb_E[39:14];
wire [39:14] S1_3;
wire [39:15] C1_3;

assign S1_3[39:14] = CSA13_i0[39:14] ^ CSA13_i1[39:14] ^ CSA13_i2[39:14];
assign C1_3[39:15] = CSA13_i0[38:14] & CSA13_i1[38:14]
| CSA13_i1[38:14] & CSA13_i2[38:14]
| CSA13_i2[38:14] & CSA13_i0[38:14];


wire [39:1] CSA20_i0 = S1_0[39:1];
wire [39:1] CSA20_i1 = C1_0[39:1];
wire [39:1] CSA20_i2 = {S1_1[39:2], 1'b0};
wire [39:1] CSA20_i3 = {C1_1[39:3], 2'b0};

wire [39:1] G2_0;
wire [39:1] H2_0;
wire [39:1] P2_0;
wire [39:1] S2_0;
wire [39:2] C2_0;

assign G2_0[39:1] = ((CSA20_i0[39:1] | CSA20_i1[39:1])
& (CSA20_i2[39:1] | CSA20_i3[39:1]));

assign H2_0[39:1] = ~((CSA20_i0[39:1] & CSA20_i1[39:1])
| (CSA20_i2[39:1] & CSA20_i3[39:1]));

assign P2_0[39:1] = CSA20_i0[39:1] ^ CSA20_i1[39:1]
^ CSA20_i2[39:1] ^ CSA20_i3[39:1];

assign S2_0[39:1] = ~((P2_0[39:1] & {G2_0[38:1], 1'b0})
| (~P2_0[39:1] & ~{G2_0[38:1], 1'b0}));

assign C2_0[39:2] = ~((P2_0[38:1] & ~{G2_0[37:1], 1'b0})
| (~P2_0[38:1] & H2_0[38:1]));



wire [39:8] CSA21_i0 = S1_2[39:8];
wire [39:8] CSA21_i1 = {C1_2[39:9], 1'b0};
wire [39:8] CSA21_i2 = {S1_3[39:14], 6'b0};
wire [39:8] CSA21_i3 = {C1_3[39:15], 7'b0};
wire [39:8] G2_1;
wire [39:8] H2_1;
wire [39:8] P2_1;
wire [39:8] S2_1;
wire [39:9] C2_1;

assign G2_1[39:8] = ((CSA21_i0[39:8] | CSA21_i1[39:8])
& (CSA21_i2[39:8] | CSA21_i3[39:8]));

assign H2_1[39:8] = ~((CSA21_i0[39:8] & CSA21_i1[39:8])
| (CSA21_i2[39:8] & CSA21_i3[39:8]));

assign P2_1[39:8] = CSA21_i0[39:8] ^ CSA21_i1[39:8]
^ CSA21_i2[39:8] ^ CSA21_i3[39:8];

assign S2_1[39:8] = ~((P2_1[39:8] & {G2_1[38:8], 1'b0})
| (~P2_1[39:8] & ~{G2_1[38:8], 1'b0}));

assign C2_1[39:9] = ~((P2_1[38:8] & ~{G2_1[37:8], 1'b0})
| (~P2_1[38:8] & H2_1[38:8]));



wire [39:2] CSA30_i0 = S2_0[39:2];
wire [39:2] CSA30_i1 = C2_0[39:2];
wire [39:2] CSA30_i2 = {S2_1[39:8], 6'b0};
wire [39:2] CSA30_i3 = {C2_1[39:9], 7'b0};
wire [39:2] G3_0;
wire [39:2] H3_0;
wire [39:2] P3_0;
wire [39:2] S3_0;
wire [39:3] C3_0;

assign G3_0[39:2] = ((CSA30_i0[39:2] | CSA30_i1[39:2])
& (CSA30_i2[39:2] | CSA30_i3[39:2]));

assign H3_0[39:2] = ~((CSA30_i0[39:2] & CSA30_i1[39:2])
| (CSA30_i2[39:2] & CSA30_i3[39:2]));

assign P3_0[39:2] = CSA30_i0[39:2] ^ CSA30_i1[39:2]
^ CSA30_i2[39:2] ^ CSA30_i3[39:2];

assign S3_0[39:2] = ~((P3_0[39:2] & {G3_0[38:2], 1'b0})
| (~P3_0[39:2] & ~{G3_0[38:2], 1'b0}));

assign C3_0[39:3] = ~((P3_0[38:2] & ~{G3_0[37:2], 1'b0})
| (~P3_0[38:2] & H3_0[38:2]));





assign #`da MLSB_E[2:0] = {S3_0[2], S2_0[1], S1_0[0]};
assign #`da SUM_E[39:3] = S3_0[39:3];
assign #`da CRY_E[39:3] = C3_0[39:3];





















wire [37:1] PS;
assign PS[37:1] = SUM_E[39:3] ^ CRY_E[39:3];





wire [37:1] P, G;
assign P[36:1] = CRY_E[38:3] | SUM_E[38:3];
assign G[36:1] = CRY_E[38:3] & SUM_E[38:3];





wire [18:1] G1;

assign G1[1] = G[2] | (G[1] & P[2]);

assign G1[2] = G[4] | (G[3] & P[4]);

assign G1[3] = G[6] | (G[5] & P[6]);

assign G1[4] = G[8] | (G[7] & P[8]);

assign G1[5] = G[10] | (G[9] & P[10]);

assign G1[6] = G[12] | (G[11] & P[12]);

assign G1[7] = G[14] | (G[13] & P[14]);

assign G1[8] = G[16] | (G[15] & P[16]);

assign G1[9] = G[18] | (G[17] & P[18]);

assign G1[10] = G[20] | (G[19] & P[20]);

assign G1[11] = G[22] | (G[21] & P[22]);

assign G1[12] = G[24] | (G[23] & P[24]);

assign G1[13] = G[26] | (G[25] & P[26]);

assign G1[14] = G[28] | (G[27] & P[28]);

assign G1[15] = G[30] | (G[29] & P[30]);

assign G1[16] = G[32] | (G[31] & P[32]);

assign G1[17] = G[34] | (G[33] & P[34]);

assign G1[18] = G[36] | (G[35] & P[36]);






wire [18:1] P1;

assign P1[1] = P[2] & P[1];

assign P1[2] = P[4] & P[3];

assign P1[3] = P[6] & P[5];

assign P1[4] = P[8] & P[7];

assign P1[5] = P[10] & P[9];

assign P1[6] = P[12] & P[11];

assign P1[7] = P[14] & P[13];

assign P1[8] = P[16] & P[15];

assign P1[9] = P[18] & P[17];

assign P1[10] = P[20] & P[19];

assign P1[11] = P[22] & P[21];

assign P1[12] = P[24] & P[23];

assign P1[13] = P[26] & P[25];

assign P1[14] = P[28] & P[27];

assign P1[15] = P[30] & P[29];

assign P1[16] = P[32] & P[31];

assign P1[17] = P[34] & P[33];

assign P1[18] = P[36] & P[35];






wire [9:1] G2;

assign G2[1] = G1[2] | (G1[1] & P1[2]);

assign G2[2] = G1[4] | (G1[3] & P1[4]);

assign G2[3] = G1[6] | (G1[5] & P1[6]);

assign G2[4] = G1[8] | (G1[7] & P1[8]);

assign G2[5] = G1[10] | (G1[9] & P1[10]);

assign G2[6] = G1[12] | (G1[11] & P1[12]);

assign G2[7] = G1[14] | (G1[13] & P1[14]);

assign G2[8] = G1[16] | (G1[15] & P1[16]);

assign G2[9] = G1[18] | (G1[17] & P1[18]);






wire [9:1] P2;

assign P2[1] = P1[2] & P1[1];

assign P2[2] = P1[4] & P1[3];

assign P2[3] = P1[6] & P1[5];

assign P2[4] = P1[8] & P1[7];

assign P2[5] = P1[10] & P1[9];

assign P2[6] = P1[12] & P1[11];

assign P2[7] = P1[14] & P1[13];

assign P2[8] = P1[16] & P1[15];

assign P2[9] = P1[18] & P1[17];






wire [3:1] G3;

assign G3[1] = G2[3] | (G2[2] & P2[3]) | (G2[1] & P2[3] & P2[2]);

assign G3[2] = G2[6] | (G2[5] & P2[6]) | (G2[4] & P2[6] & P2[5]);

assign G3[3] = G2[9] | (G2[8] & P2[9]) | (G2[7] & P2[9] & P2[8]);






wire [3:1] P3;

assign P3[1] = P2[3] & P2[2] & P2[1];

assign P3[2] = P2[6] & P2[5] & P2[4];

assign P3[3] = P2[9] & P2[8] & P2[7];






wire C36;
assign C36 = G3[3] | (G3[2] & P3[3]) | (G3[1] & P3[3] & P3[2]);






wire P4 = P3[3] & P3[2] & P3[1];






wire C35, C34, C33, C32, C31;
wire C30, C29, C28, C27, C26;
wire C25, C24, C23, C22, C21;
wire C20, C19, C18, C17, C16;
wire C15, C14, C13, C12, C11;
wire C10, C9, C8, C7, C6;
wire C5, C4, C3, C2, C1;

assign #`db C1 = G[1];

assign #`db C2 = G1[1];

assign #`db C3 = G[3] | (G1[1] & P[3]);

assign #`db C4 = G2[1];

assign #`db C5 = G[5] | (G2[1] & P[5]);

assign #`db C6 = G1[3] | (G2[1] & P1[3]);

assign #`db C7 = G[7] | (G1[3] & P[7]) | (G2[1] & P1[3] & P[7]);

assign #`db C8 = G2[2] | (G2[1] & P2[2]);

assign #`db C9 = G[9] | (G2[2] & P[9]) | (G2[1] & P2[2] & P[9]);

assign #`db C10 = G1[5] | (G2[2] & P1[5]) | (G2[1] & P2[2] & P1[5]);

assign #`db C11 = G[11] | (C10 & P[11]);

assign #`db C12 = G3[1];

assign #`db C13 = G[13] | G3[1] & P[13];

assign #`db C14 = G1[7] | (G3[1] & P1[7]);

assign #`db C15 = G[15] | (G1[7] & P[15]) | (G3[1] & P1[7] & P[15]);

assign #`db C16 = G2[4] | (G3[1] & P2[4]);

assign #`db C17 = G[17] | (G2[4] & P[17]) | (G3[1] & P2[4] & P[17]);

assign #`db C18 = G1[9] | (G2[4] & P1[9]) | (G3[1] & P2[4] & P1[9]);

assign #`db C19 = G[19] | (C18 & P[19]);

assign #`db C20 = G2[5] | (G2[4] & P2[5]) | (G3[1] & P2[4] & P2[5]);

assign #`db C21 = G[21] | (C20 & P[21]);

assign #`db C22 = G1[11] | (C20 & P1[11]);

assign #`db C23 = G[23] | (C22 & P[23]);

assign #`db C24 = G3[2] | (G3[1] & P3[2]);

assign #`db C25 = G[25] | (C24 & P[25]);

assign #`db C26 = G1[13] | (C24 & P1[13]);

assign #`db C27 = G[27] | (C26 & P[27]);

assign #`db C28 = G2[7] | (G3[2] & P2[7]) | (G3[1] & P2[7] & P3[2]);

assign #`db C29 = G[29] | (C28 & P[29]);

assign #`db C30 = G1[15] | (C29 & P1[15]);

assign #`db C31 = G[31] | (G1[15] & P[31]) | (C29 & P1[15] & P[31]);

assign #`db C32 = G2[8] | (G2[7] & P2[8]) | (G3[2] & P2[7] & P2[8]) | (G3[1] & P3[2] & P2[7] & P2[8]);

assign #`db C33 = G[33] | (C32 & P[33]);

assign #`db C34 = G1[17] | (C32 & P1[17]);

assign #`db C35 = G[35] | (G1[17] & P[35]) | (C32 & P1[17] & P[35]);






wire [39:0] Morig;

assign #`db Morig[3] = PS[1];

assign #`db Morig[4] = C1 ? (~PS[2]) : PS[2];

assign #`db Morig[5] = C2 ? (~PS[3]) : PS[3];

assign #`db Morig[6] = C3 ? (~PS[4]) : PS[4];

assign #`db Morig[7] = C4 ? (~PS[5]) : PS[5];

assign #`db Morig[8] = C5 ? (~PS[6]) : PS[6];

assign #`db Morig[9] = C6 ? (~PS[7]) : PS[7];

assign #`db Morig[10] = C7 ? (~PS[8]) : PS[8];

assign #`db Morig[11] = C8 ? (~PS[9]) : PS[9];

assign #`db Morig[12] = C9 ? (~PS[10]) : PS[10];

assign #`db Morig[13] = C10 ? (~PS[11]) : PS[11];

assign #`db Morig[14] = C11 ? (~PS[12]) : PS[12];

assign #`db Morig[15] = C12 ? (~PS[13]) : PS[13];

assign #`db Morig[16] = C13 ? (~PS[14]) : PS[14];

assign #`db Morig[17] = C14 ? (~PS[15]) : PS[15];

assign #`db Morig[18] = C15 ? (~PS[16]) : PS[16];

assign #`db Morig[19] = C16 ? (~PS[17]) : PS[17];

assign #`db Morig[20] = C17 ? (~PS[18]) : PS[18];

assign #`db Morig[21] = C18 ? (~PS[19]) : PS[19];

assign #`db Morig[22] = C19 ? (~PS[20]) : PS[20];

assign #`db Morig[23] = C20 ? (~PS[21]) : PS[21];

assign #`db Morig[24] = C21 ? (~PS[22]) : PS[22];

assign #`db Morig[25] = C22 ? (~PS[23]) : PS[23];

assign #`db Morig[26] = C23 ? (~PS[24]) : PS[24];

assign #`db Morig[27] = C24 ? (~PS[25]) : PS[25];

assign #`db Morig[28] = C25 ? (~PS[26]) : PS[26];

assign #`db Morig[29] = C26 ? (~PS[27]) : PS[27];

assign #`db Morig[30] = C27 ? (~PS[28]) : PS[28];

assign #`db Morig[31] = C28 ? (~PS[29]) : PS[29];

assign #`db Morig[32] = C29 ? (~PS[30]) : PS[30];

assign #`db Morig[33] = C30 ? (~PS[31]) : PS[31];

assign #`db Morig[34] = C31 ? (~PS[32]) : PS[32];

assign #`db Morig[35] = C32 ? (~PS[33]) : PS[33];

assign #`db Morig[36] = C33 ? (~PS[34]) : PS[34];

assign #`db Morig[37] = C34 ? (~PS[35]) : PS[35];

assign #`db Morig[38] = C35 ? (~PS[36]) : PS[36];

assign #`db Morig[39] = C36 ? (~PS[37]) : PS[37];


wire MR0_0;
assign MR0_0 = (MR0di[0] & (~mzero_E));

assign Morig[2:0] = MLSB_E[2:0];

wire [39:0] Mshft;
assign Mshft[39:0] = FracMode_E ? {Morig[38:0], MR0_0} : Morig[39:0];

wire MR_ZERO_0_15;
assign MR_ZERO_0_15 = (|Mshft[15:0]);

wire rnd16;
assign rnd16 = (BIASRND | (!rnd_E) | MR_ZERO_0_15) & Mshft[16];

assign #2 MACin[39:0] = {Mshft[39:17], rnd16, Mshft[15:0]};




endmodule




