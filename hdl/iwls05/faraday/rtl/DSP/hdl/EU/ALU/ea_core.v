


























`define del 1
`include "../../../include/x_def.v"

module EA_CORE (K, L, ADD, Cin, X, Y, cout, ovf_, ALU);

/********************************/

/********************************/

input K, L, ADD, Cin;
input [16:1] X, Y;

/********************************/

/********************************/

output cout, ovf_;
output [16:1] ALU;

/***********************************/


/***********************************/

wire [16:1] P, G, AL;
assign P[16:1] = X[16:1] | Y[16:1];
assign G[16:1] = X[16:1] & Y[16:1];

wire K_ = ~K;
assign #`da AL = ( (X[16:1] & Y[16:1]) & {16{K_}} ) |
( (X[16:1] ^ Y[16:1]) & {16{L}} ) ;





wire [8:1] G1;
wire GS;

assign GS = Cin ? (G[1] | P[2]) : G[1];

assign G1[1] = G[2] | (P[1] & GS);

assign G1[2] = G[4] | (P[6] & G[3]);

assign G1[3] = G[6] | (P[4] & G[5]);

assign G1[4] = G[8] | (P[8] & G[7]);

assign G1[5] = G[10] | (P[12] & G[9]);

assign G1[6] = G[12] | (P[10] & G[11]);

assign G1[7] = G[14] | (P[16] & G[13]);

assign G1[8] = G[16] | (P[14] & G[15]);






wire [8:1] P1;

assign P1[1] = P[2] & P[1];

assign P1[2] = P[4] & P[3];

assign P1[3] = P[6] & P[5];

assign P1[4] = P[8] & P[7];

assign P1[5] = P[10] & P[9];

assign P1[6] = P[12] & P[11];

assign P1[7] = P[14] & P[13];

assign P1[8] = P[16] & P[15];






wire [4:1] G2;

assign G2[1] = G1[2] | (P1[2] & G1[1]);

assign G2[2] = G1[4] | (P1[4] & G1[3]);

assign G2[3] = G1[6] | (P1[6] & G1[5]);

assign G2[4] = G1[8] | (P1[8] & G1[7]);






wire [4:1] P2;

assign P2[1] = P1[2] & P1[1];

assign P2[2] = P1[4] & P1[3];

assign P2[3] = P1[6] & P1[5];

assign P2[4] = P1[8] & P1[7];





wire [2:1] G3;

assign G3[1] = G2[2] | (P2[2] & G2[1]);

assign G3[2] = G2[4] | (P2[4] & G2[3]);





wire [2:1] P3;

assign P3[1] = P2[2] & P2[1];

assign P3[2] = P2[4] & P2[3];





wire G4 = G3[2] | (P3[2] & G3[1]);






wire P4 = P3[2] & P3[1];





wire C16, C15, C14, C13;
wire C12, C11, C10, C9;
wire C8, C7, C6, C5;
wire C4, C3, C2, C1;
wire t1, t2, t3, t4, t5;

assign #`da C1 = GS;

assign #`da C2 = G1[1];

assign #`da C3 = G[3] | (G1[1] & P[3]);

assign #`da C4 = G2[1];

assign #`da C5 = G[5] | (G2[1] & P[5]);

assign #`da C6 = G1[3] | (G2[1] & P1[3]);

assign #`da C7 = G[7] | (C6 & P[7]);

assign #`da C8 = G3[1];

assign #`da C9 = G[9] | (G3[1] & P[9]);

assign #`da C10 = G1[5] | (G3[1] & P1[5]);

assign t1 = G[11] | (G1[5] & P[11]);
assign #`da C11 = t1 | (G3[1] & P[11] & P1[5]);

assign #`da C12 = G2[3] | (G3[1] & P2[3]);

assign t2 = G[13] | (G2[3] & P[13]);
assign #`da C13 = t2 | (G3[1] & P2[3] & P[13]);

assign t3 = G1[7] | (G2[3] & P1[7]);
assign #`da C14 = t3 | (G3[1] & P2[3] & P1[7]);

assign t4 = G[15] | (G1[7] & P[15]);
assign t5 = t4 | (G2[3] & P1[7] & P[15]);
assign #`da C15 = t5 | (G3[1] & P2[3] & P1[7] & P[15]);
assign #`da C16 = G4;






assign #`db ALU[1] = (Cin & ADD) ^ AL[1];

assign #`db ALU[2] = (C1 & ADD) ^ AL[2];

assign #`db ALU[3] = (C2 & ADD) ^ AL[3];

assign #`db ALU[4] = (C3 & ADD) ^ AL[4];

assign #`db ALU[5] = (C4 & ADD) ^ AL[5];

assign #`db ALU[6] = (C5 & ADD) ^ AL[6];

assign #`db ALU[7] = (C6 & ADD) ^ AL[7];

assign #`db ALU[8] = (C7 & ADD) ^ AL[8];

assign #`db ALU[9] = (C8 & ADD) ^ AL[9];

assign #`db ALU[10] = (C9 & ADD) ^ AL[10];

assign #`db ALU[11] = (C10 & ADD) ^ AL[11];

assign #`db ALU[12] = (C11 & ADD) ^ AL[12];

assign #`db ALU[13] = (C12 & ADD) ^ AL[13];

assign #`db ALU[14] = (C13 & ADD) ^ AL[14];

assign #`db ALU[15] = (C14 & ADD) ^ AL[15];

assign #`db ALU[16] = (C15 & ADD) ^ AL[16];

assign #`db cout = C16;

/********************************/

/********************************/

wire ovf_;
assign #`da ovf_ =!((X[16] == Y[16]) && (X[16] != (C15 ^ X[16] ^ Y[16])));


endmodule

