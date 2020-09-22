
`include "x_def.v"

module EM_CLA36 (/* IN */
                 SUM_E, CRY_E, MLSB_E,
                 MR00_E, FracMode_E, rnd_E, mzero_E, BIASRND,

                 /* OUT */
                 MACin_E);

input [37:1] SUM_E;
input [37:1] CRY_E;
input [2:0]  MLSB_E;
input MR00_E;
input FracMode_E;
input rnd_E;
input mzero_E;
input BIASRND;

/****************************************/
/*	    Output declaration		*/
/****************************************/
output [39:0] MACin_E;


wire [37:1] PS;
assign PS[37:1] = SUM_E[37:1] ^ CRY_E[37:1];


wire [37:1] P, G;
assign P[36:1] = CRY_E[36:1] | SUM_E[36:1]; // Propagate Signal
assign G[36:1] = CRY_E[36:1] & SUM_E[36:1]; // Generate  Signal


wire [18:1] G1;

assign G1[1]  = G[2]  | (G[1]  & P[2]);
//
assign G1[2]  = G[4]  | (G[3]  & P[4]);
//
assign G1[3]  = G[6]  | (G[5]  & P[6]);
//
assign G1[4]  = G[8]  | (G[7]  & P[8]);
//
assign G1[5]  = G[10] | (G[9]  & P[10]);
//
assign G1[6]  = G[12] | (G[11] & P[12]);
//
assign G1[7]  = G[14] | (G[13] & P[14]);
//
assign G1[8]  = G[16] | (G[15] & P[16]);
//
assign G1[9]  = G[18] | (G[17] & P[18]);
//
assign G1[10] = G[20] | (G[19] & P[20]);
//
assign G1[11] = G[22] | (G[21] & P[22]);
//
assign G1[12] = G[24] | (G[23] & P[24]);
//
assign G1[13] = G[26] | (G[25] & P[26]);
//
assign G1[14] = G[28] | (G[27] & P[28]);
//
assign G1[15] = G[30] | (G[29] & P[30]);
//
assign G1[16] = G[32] | (G[31] & P[32]);
//
assign G1[17] = G[34] | (G[33] & P[34]);
//
assign G1[18] = G[36] | (G[35] & P[36]);
//
//

wire [18:1] P1;

assign P1[1] = P[2] & P[1];
//
assign P1[2] = P[4] & P[3];
//
assign P1[3] = P[6] & P[5];
//
assign P1[4] = P[8] & P[7];
//
assign P1[5] = P[10] & P[9];
//
assign P1[6] = P[12] & P[11];
//
assign P1[7] = P[14] & P[13];
//
assign P1[8] = P[16] & P[15];
//
assign P1[9] = P[18] & P[17];
//
assign P1[10] = P[20] & P[19];
//
assign P1[11] = P[22] & P[21];
//
assign P1[12] = P[24] & P[23];
//
assign P1[13] = P[26] & P[25];
//
assign P1[14] = P[28] & P[27];
//
assign P1[15] = P[30] & P[29];
//
assign P1[16] = P[32] & P[31];
//
assign P1[17] = P[34] & P[33];
//
assign P1[18] = P[36] & P[35];
//
//

wire [9:1] G2;

assign G2[1]  = G1[2]  | (G1[1] & P1[2]);
//
assign G2[2]  = G1[4]  | (G1[3] & P1[4]);
//
assign G2[3]  = G1[6]  | (G1[5] & P1[6]);
//
assign G2[4]  = G1[8]  | (G1[7] & P1[8]);
//
assign G2[5]  = G1[10] | (G1[9] & P1[10]);
//
assign G2[6]  = G1[12] | (G1[11] & P1[12]);
//
assign G2[7]  = G1[14] | (G1[13] & P1[14]);
//
assign G2[8]  = G1[16] | (G1[15] & P1[16]);
//
assign G2[9]  = G1[18] | (G1[17] & P1[18]);
//
//

wire [9:1] P2;

assign P2[1] = P1[2] & P1[1];
//
assign P2[2] = P1[4] & P1[3];
//
assign P2[3] = P1[6] & P1[5];
//
assign P2[4] = P1[8] & P1[7];
//
assign P2[5] = P1[10] & P1[9];
//
assign P2[6] = P1[12] & P1[11];
//
assign P2[7] = P1[14] & P1[13];
//
assign P2[8] = P1[16] & P1[15];
//
assign P2[9] = P1[18] & P1[17];
//
//

wire [3:1] G3;

assign G3[1] = G2[3] | (G2[2] & P2[3]) | (G2[1] & P2[3] & P2[2]);
//
assign G3[2] = G2[6] | (G2[5] & P2[6]) | (G2[4] & P2[6] & P2[5]);
//
assign G3[3] = G2[9] | (G2[8] & P2[9]) | (G2[7] & P2[9] & P2[8]);
//
//

wire [3:1] P3;

assign P3[1] = P2[3] & P2[2] & P2[1];
//
assign P3[2] = P2[6] & P2[5] & P2[4];
//
assign P3[3] = P2[9] & P2[8] & P2[7];
//
//

wire C36;
assign C36 = G3[3] | (G3[2] & P3[3]) | (G3[1] & P3[3] & P3[2]);
//
//

wire P4 = P3[3] & P3[2] & P3[1];
//
//

wire C35, C34, C33, C32, C31;
wire C30, C29, C28, C27, C26;
wire C25, C24, C23, C22, C21;
wire C20, C19, C18, C17, C16;
wire C15, C14, C13, C12, C11;
wire C10, C9,  C8,  C7,  C6;
wire C5,  C4,  C3,  C2,  C1;

assign #`db C1 = G[1];
//
assign #`db C2 = G1[1];
//
assign #`db C3 = G[3] | (G1[1] & P[3]);
//
assign #`db C4 = G2[1];
//
assign #`db C5 = G[5] | (G2[1] & P[5]);
//
assign #`db C6 = G1[3] | (G2[1] & P1[3]);
//
assign #`db C7 = G[7] | (G1[3] & P[7]) | (G2[1] & P1[3] & P[7]);
//
assign #`db C8 = G2[2] | (G2[1] & P2[2]);
//
assign #`db C9 = G[9] | (G2[2] & P[9]) | (G2[1] & P2[2] & P[9]);
//
assign #`db C10 = G1[5] | (G2[2] & P1[5]) | (G2[1] & P2[2] & P1[5]);
//
assign #`db C11 = G[11] | (C10 & P[11]);
//
assign #`db C12 = G3[1];
//
assign #`db C13 = G[13] | G3[1] & P[13];
//
assign #`db C14 = G1[7] | (G3[1] & P1[7]);
//
assign #`db C15 = G[15] | (G1[7] & P[15]) | (G3[1] & P1[7] & P[15]);
//
assign #`db C16 = G2[4] | (G3[1] & P2[4]);
//
assign #`db C17 = G[17] | (G2[4] & P[17]) | (G3[1] & P2[4] & P[17]);
//
assign #`db C18 = G1[9] | (G2[4] & P1[9]) | (G3[1] & P2[4] & P1[9]);
//
assign #`db C19 = G[19] | (C18 & P[19]);
//
assign #`db C20 = G2[5] | (G2[4] & P2[5]) | (G3[1] & P2[4] & P2[5]);
//
assign #`db C21 = G[21] | (C20 & P[21]);
//
assign #`db C22 = G1[11] | (C20 & P1[11]);
//
assign #`db C23 = G[23] | (C22 & P[23]);
//
assign #`db C24 = G3[2] | (G3[1] & P3[2]);
//
assign #`db C25 = G[25] | (C24 & P[25]);
//
assign #`db C26 = G1[13] | (C24 & P1[13]);
//
assign #`db C27 = G[27] | (C26 & P[27]);
//
assign #`db C28 = G2[7] | (G3[2] & P2[7]) | (G3[1] & P2[7] & P3[2]);
//
assign #`db C29 = G[29] | (C28 & P[29]);
//
assign #`db C30 = G1[15] | (C29 & P1[15]);
//
assign #`db C31 = G[31] | (G1[15] & P[31]) | (C29 & P1[15] & P[31]);
//
assign #`db C32 = G2[8] | (G2[7] & P2[8]) | (G3[2] & P2[7] & P2[8]) | (G3[1] & P3[2] & P2[7] & P2[8]);
//
assign #`db C33 = G[33] | (C32 & P[33]);
//
assign #`db C34 = G1[17] | (C32 & P1[17]);
//
assign #`db C35 = G[35] | (G1[17] & P[35]) | (C32 & P1[17] & P[35]);
//
//
//
wire [39:0] Morig;

assign #`db Morig[3] = PS[1];
//
assign #`db Morig[4] = C1 ? (~PS[2]) : PS[2];
//
assign #`db Morig[5] = C2 ? (~PS[3]) : PS[3];
//
assign #`db Morig[6] = C3 ? (~PS[4]) : PS[4];
//
assign #`db Morig[7] = C4 ? (~PS[5]) : PS[5];
//
assign #`db Morig[8] = C5 ? (~PS[6]) : PS[6];
//
assign #`db Morig[9] = C6 ? (~PS[7]) : PS[7];
//
assign #`db Morig[10] = C7 ? (~PS[8]) : PS[8];
//
assign #`db Morig[11] = C8 ? (~PS[9]) : PS[9];
//
assign #`db Morig[12] = C9 ? (~PS[10]) : PS[10];
//
assign #`db Morig[13] = C10 ? (~PS[11]) : PS[11];
//
assign #`db Morig[14] = C11 ? (~PS[12]) : PS[12];
//
assign #`db Morig[15] = C12 ? (~PS[13]) : PS[13];
//
assign #`db Morig[16] = C13 ? (~PS[14]) : PS[14];
//
assign #`db Morig[17] = C14 ? (~PS[15]) : PS[15];
//
assign #`db Morig[18] = C15 ? (~PS[16]) : PS[16];
//
assign #`db Morig[19] = C16 ? (~PS[17]) : PS[17];
//
assign #`db Morig[20] = C17 ? (~PS[18]) : PS[18];
//
assign #`db Morig[21] = C18 ? (~PS[19]) : PS[19];
//
assign #`db Morig[22] = C19 ? (~PS[20]) : PS[20];
//
assign #`db Morig[23] = C20 ? (~PS[21]) : PS[21];
//
assign #`db Morig[24] = C21 ? (~PS[22]) : PS[22];
//
assign #`db Morig[25] = C22 ? (~PS[23]) : PS[23];
//
assign #`db Morig[26] = C23 ? (~PS[24]) : PS[24];
//
assign #`db Morig[27] = C24 ? (~PS[25]) : PS[25];
//
assign #`db Morig[28] = C25 ? (~PS[26]) : PS[26];
//
assign #`db Morig[29] = C26 ? (~PS[27]) : PS[27];
//
assign #`db Morig[30] = C27 ? (~PS[28]) : PS[28];
//
assign #`db Morig[31] = C28 ? (~PS[29]) : PS[29];
//
assign #`db Morig[32] = C29 ? (~PS[30]) : PS[30];
//
assign #`db Morig[33] = C30 ? (~PS[31]) : PS[31];
//
assign #`db Morig[34] = C31 ? (~PS[32]) : PS[32];
//
assign #`db Morig[35] = C32 ? (~PS[33]) : PS[33];
//
assign #`db Morig[36] = C33 ? (~PS[34]) : PS[34];
//
assign #`db Morig[37] = C34 ? (~PS[35]) : PS[35];
//
assign #`db Morig[38] = C35 ? (~PS[36]) : PS[36];
//
assign #`db Morig[39] = C36 ? (~PS[37]) : PS[37];

//
//
wire MR0_0;
assign MR0_0 = (MR00_E & (~mzero_E));

assign Morig[2:0] = MLSB_E[2:0];

wire [39:0] Mshft;
assign Mshft[39:0] = FracMode_E ? {Morig[38:0], MR0_0} : Morig[39:0];

wire MR_ZERO_0_15;
assign MR_ZERO_0_15 = (|Mshft[15:0]); // The LSB 16-bits == 0

wire rnd16;
assign rnd16 = (BIASRND | (!rnd_E) | MR_ZERO_0_15) & Mshft[16];

assign #2 MACin_E[39:0] = {Mshft[39:17], rnd16, Mshft[15:0]};

endmodule
