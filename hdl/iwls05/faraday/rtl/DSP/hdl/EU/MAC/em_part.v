
`include "x_def.v"

module EM_PART(/* In  */
	       unsignX_E, unsignY_E, FracMode_E, mzero_E, msub1_E,
	       rnd_E, MXOP_E[15:0], MYOP_E[15:0], MR2di[7:0],
	       MR1di[15:0], MR0di[15:0], msub2_E, msub3_E, msub4_E,
	       msub5_E, msub6_E, msub7_E, msub8_E, MACop_E,

	       /* Out */
	       Cin_E[16:0], MRb_E[39:14], MRa_E[15:0], P0_E[17:0],
	       P1_E[19:2],  P2_E[21:4],  P3_E[23:6],  P4_E[25:8],
	       P5_E[27:10], P6_E[29:12], P7_E[31:14], P8_E[32:16]);


/*----------------------------------------------------------------*/
input unsignX_E;	// X is a signed 2's complement
input unsignY_E;	// Y is a signed 2's complement
input rnd_E;		// Round Mode enable
input FracMode_E;	// 1: Fraction Mode; 0: Integer mode
input mzero_E;		// "X*Y" operation type
input msub1_E;		// "MR - X*Y" type opeartion
input [15:0] MXOP_E;	// "X" operands
input [15:0] MYOP_E;	// "Y" operands
input [7:0] MR2di;
input [15:0] MR1di, MR0di;
input MACop_E;
input msub2_E;
input msub3_E;
input msub4_E;
input msub5_E;
input msub6_E;
input msub7_E;
input msub8_E;

/*---------------------------------------------------------------*/
output [16:0] Cin_E;	// 2's complement == 1's complement + Cin
output [17:0] P0_E;	// the 1st row partial product
output [19:2] P1_E;	// the 2nd row partial product
output [21:4] P2_E;	// the 3rd row partial product
output [23:6] P3_E;	// the 4th row partial product
output [25:8] P4_E;	// the 5th row partial product
output [27:10] P5_E;	// the 6th row partial product
output [29:12] P6_E;	// the 7th row partial product
output [31:14] P7_E;	// the 8th row partial product
output [32:16] P8_E;	// the partial product when unsign
			// happen and the last bit is 1
output [39:14] MRb_E;   // MSB of feedback MR
output [15:0]  MRa_E;	// LSB of feedback MR

/*--------------------------------------------------------------*/
wire X16, Y16;
wire mzero_0, mzero_1;
wire [15:0]  MRa_E;
wire [39:14] MRb_E;
wire [17:0]  X1p, X2p;
wire [17:0]  X1m, X2m;
wire [7:0] MR2;
wire [15:0] MR1, MR0;

assign X16       = (~unsignX_E) & MXOP_E[15];
assign Y16	 = (~unsignY_E) & MYOP_E[15];
assign X1p[17:0] = {X16, X16, MXOP_E[15:0]};
assign X2p[17:0] = {X1p[16:0], 1'b0};
assign X1m[17:0] = ~X1p[17:0];
assign X2m[17:0] = {X1m[16:0], 1'b0};

assign MR2[7:0] =  MR2di[7:0] & {8{MACop_E}};
assign MR1[15:0] = MR1di[15:0] & {16{MACop_E}};
assign MR0[15:0] = MR0di[15:0] & {16{MACop_E}};

assign mzero_0 = FracMode_E    && rnd_E;
assign mzero_1 = (~FracMode_E) && rnd_E;

assign MRa_E[15:0]  = mzero_E    ? 16'b0 :
		      FracMode_E ? {1'b0, MR0[15:1]} : MR0[15:0];

assign MRb_E[39:14] = mzero_E	 ? {24'b0, mzero_1, mzero_0} :
		      FracMode_E ? {MR2[7], MR2[7:0], MR1[15:0], rnd_E} :
				   {MR2[7:0], MR1[15:0], rnd_E, 1'b0};

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
PSEL P1_sel(msub2_E, MYOP_E[3:1],         P1_1p, P1_2p, P1_1m, P1_2m);
PSEL P2_sel(msub3_E, MYOP_E[5:3],	 P2_1p, P2_2p, P2_1m, P2_2m);
PSEL P3_sel(msub4_E, MYOP_E[7:5],	 P3_1p, P3_2p, P3_1m, P3_2m);
PSEL P4_sel(msub5_E, MYOP_E[9:7],         P4_1p, P4_2p, P4_1m, P4_2m);
PSEL P5_sel(msub6_E, MYOP_E[11:9],	 P5_1p, P5_2p, P5_1m, P5_2m);
PSEL P6_sel(msub7_E, MYOP_E[13:11],	 P6_1p, P6_2p, P6_1m, P6_2m);
PSEL P7_sel(msub8_E, MYOP_E[15:13],	 P7_1p, P7_2p, P7_1m, P7_2m);


assign P8_1p = unsignY_E & MYOP_E[15] & (~msub1_E);
assign P8_1m = unsignY_E & MYOP_E[15] & msub2_E;

wire [17:0]  P0_E;
wire [19:2]  P1_E;
wire [21:4]  P2_E;
wire [23:6]  P3_E;
wire [25:8]  P4_E;
wire [27:10] P5_E;
wire [29:12] P6_E;
wire [31:14] P7_E;
wire [32:16] P8_E;
wire [16:0]  Cin_E; // 2's complement == 1's complement + 1

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

endmodule

/*--------------------------------------------------------------*/
module PSEL (/* IN */
             msub, Y[2:0],
             /* OUT */
             P_1p, P_2p, P_1m, P_2m);

input msub;  		// -X*Y
input [2:0] Y;

output P_1p;	// +X  enable
output P_2p;	// +2X enable
output P_1m;	// -X  enable
output P_2m;	// -2X enable

wire P_1pi, P_2pi, P_1mi, P_2mi;
assign P_1pi = (!Y[2]) & (Y[1] ^ Y[0]);
assign P_2pi = (!Y[2]) & (Y[1] & Y[0]);
assign P_1mi = Y[2] & (Y[1] ^ Y[0]);
assign P_2mi = Y[2] & (~(Y[1] | Y[0]));

assign #`da P_1p = msub ? P_1mi : P_1pi;
assign #`da P_2p = msub ? P_2mi : P_2pi;
assign #`da P_1m = msub ? P_1pi : P_1mi;
assign #`da P_2m = msub ? P_2pi : P_2mi;

endmodule

/*--------------------------------------------------------------*/
module PPART(/* IN  */ PX_1p, PX_2p, PX_1m, PX_2m,
	     /* IN  */ PX1p,  PX2p,  PX1m,  PX2m,
	     /* OUT */ PX[17:0]);

input PX_1p, PX_2p, PX_1m, PX_2m;
input [17:0] PX1p;
input [17:0] PX2p;
input [17:0] PX1m;
input [17:0] PX2m;

output [17:0] PX;
assign #`da PX[17:0] = ({18{PX_1p}} & PX1p[17:0]) |
		       ({18{PX_2p}} & PX2p[17:0]) |
		       ({18{PX_1m}} & PX1m[17:0]) |
		       ({18{PX_2m}} & PX2m[17:0]) ; // Others PX[17:0] == 18'b0

endmodule

