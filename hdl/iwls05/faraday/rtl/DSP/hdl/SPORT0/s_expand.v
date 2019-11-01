






`include "../../include/x_def.v"















module EXPAND (/* in */ RX, DTYPE0,
expRX);

input [15:0] RX;
input [1:0] DTYPE0;

output [15:0] expRX;


wire [15:0] RX;
wire [12:0] as;
wire [7:0] newin;

wire alaw = DTYPE0[0];
wire expand = DTYPE0[1];
wire nzero;













assign #`da newin[7] = RX[7];
assign #`da newin[6] = RX[6];
assign #`da newin[5] = alaw ? !RX[5] : RX[5];
assign #`da newin[4] = RX[4];
assign #`da newin[3] = alaw ? !RX[3] : RX[3];
assign #`da newin[2] = RX[2];
assign #`da newin[1] = alaw ? !RX[1] : RX[1];
assign #`da newin[0] = RX[0];

assign #`da nzero = ~newin[7] & (&newin[6:0]);




wire [12:0] aso;
wire shift0, shift1, shift2, shift3, shift4, shift5, shift6, shift7;



assign #`da shift0 = (newin[6:4] == 3'd7);
assign #`da shift1 = (newin[6:4] == 3'd6);
assign #`da shift2 = (newin[6:4] == 3'd5);
assign #`da shift3 = (newin[6:4] == 3'd4);
assign #`da shift4 = (newin[6:4] == 3'd3);
assign #`da shift5 = (newin[6:4] == 3'd2);
assign #`da shift6 = (newin[6:4] == 3'd1);
assign #`da shift7 = (newin[6:4] == 3'd0);



assign #`da aso[12:0] = shift7 ? ~{1'b0, newin[3:0], 8'b01111111} :
shift6 ? ~{2'b10, newin[3:0], 7'b0111111} :
shift5 ? ~{3'b110, newin[3:0], 6'b011111} :
shift4 ? ~{4'b1110, newin[3:0], 5'b01111} :
shift3 ? ~{5'b11110, newin[3:0], 4'b0111} :
shift2 ? ~{6'b111110, newin[3:0], 3'b011} :
shift1 ? ~{7'b1111110, newin[3:0], 2'b01} :
shift0 ? ~{8'b11111110, newin[3:0], 1'b0} :
13'bx;

assign #`da as[12:0] = alaw && shift0 ? {aso[12:6], 1'b0, aso[4:0]} :
alaw && !shift0 ? {1'b0, aso[12:1]} :
aso[12:0];




wire [12:0] tc, asp;



assign #`da asp[12:0] = alaw ? as[12:0] : as[12:0] - 6'd33;



assign #`da tc[12:0] = newin[7] ? asp[12:0] : (~asp[12:0] + 1'b1);

assign expRX[15:0] = expand ?
(alaw ? {newin[7] ? 4'b0000 : 4'b1111, tc[11:0]} :
{newin[7]|nzero ? 3'b000 : 3'b111, tc[12:0]}) :
RX[15:0];


endmodule
