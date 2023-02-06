






`include "x_def.v"









module COMPRESS (/* in */ TX, alaw,
logTX);


input [15:0] TX;
input alaw;

output [7:0] logTX;


wire [12:1] newin;
wire [3:0] q;
wire [2:0] sc;



wire [14:0] magi, mag;
wire mover,ovf,negmax;



assign #`da magi[14:0] = TX[15] ? (~TX[14:0] + 1'b1) : TX[14:0];

assign #`da {ovf,mag[12:0]} = magi[12:0] + (alaw ? 1'b0 : 6'd33);

assign #`da mag[14:13] = magi[14:13];

assign #`da negmax = TX[15] & (~|magi[14:0]);




assign #`da mover = (|mag[14:13]) || alaw && mag[12] || ovf || negmax;

assign #`da newin[12:1] = mover ? {12'hfc0} :
alaw ? mag[11:0] :
mag[12:1];







wire [1:0] sc0, sc1;

cpen4 P1 (sc1[1:0], nzero1, newin[12:9]);
cpen4 P0 (sc0[1:0], nzero0, newin[8:5]);

assign #`da sc[1:0] = nzero1 ? sc1[1:0] :
nzero0 ? sc0[1:0] : 2'b11;


cpen2 P2 (nzero, sc[2], {nzero1, nzero0});




wire [3:0] as_;
wire shift7, shift6, shift5, shift4, shift3, shift2, shift1, shift0;

assign #`da q[3:0] = alaw && (!nzero || shift7) ? ~newin[5:2]
: as_[3:0];



assign #`da shift0 = (sc[2:0] == 3'd0);
assign #`da shift1 = (sc[2:0] == 3'd1);
assign #`da shift2 = (sc[2:0] == 3'd2);
assign #`da shift3 = (sc[2:0] == 3'd3);
assign #`da shift4 = (sc[2:0] == 3'd4);
assign #`da shift5 = (sc[2:0] == 3'd5);
assign #`da shift6 = (sc[2:0] == 3'd6);
assign #`da shift7 = (sc[2:0] == 3'd7);



assign #`da as_[3:0] = shift0 ? ~newin[11:8] :
shift1 ? ~newin[10:7] :
shift2 ? ~newin[9:6] :
shift3 ? ~newin[8:5] :
shift4 ? ~newin[7:4] :
shift5 ? ~newin[6:3] :
shift6 ? ~newin[5:2] :
shift7 ? ~newin[4:1] : 4'bx;












assign #`da logTX[7] = !TX[15];
assign #`da logTX[6] = sc[2];
assign #`da logTX[5] = alaw ? !sc[1] : sc[1];
assign #`da logTX[4] = sc[0];
assign #`da logTX[3] = alaw ? !q[3] : q[3];
assign #`da logTX[2] = q[2];
assign #`da logTX[1] = alaw ? !q[1] : q[1];
assign #`da logTX[0] = q[0];


endmodule







module cpen4 (e, nz, w);

output [1:0] e;
output nz;
input [3:0] w;

assign #`da nz = |w[3:0];
assign #`da e[0] = (w[3:2] == 2'b01) || (w[3:0] == 4'b0001);
assign #`da e[1] = (w[3:2] == 2'b00);

endmodule



module cpen2 (nzero, sc, in);

output nzero,
sc;
input [1:0] in;

assign #`da sc = (in[1] == 1'b0);
assign #`da nzero = (in[1:0] != 2'b0);

endmodule
