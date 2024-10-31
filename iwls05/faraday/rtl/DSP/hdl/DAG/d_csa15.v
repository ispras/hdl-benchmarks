
`define del 1

module CSA15 (/* IN  */ INa, INb, INc,
              /* OUT */ SOUT, COUT);

input  [15:1] INa, INb, INc;
output [15:1] SOUT;
output [16:2] COUT;

CSA_d  b1( INa[1],  INb[1],  INc[1],  SOUT[1],  COUT[2] );
CSA_d  b2( INa[2],  INb[2],  INc[2],  SOUT[2],  COUT[3] );
CSA_d  b3( INa[3],  INb[3],  INc[3],  SOUT[3],  COUT[4] );
CSA_d  b4( INa[4],  INb[4],  INc[4],  SOUT[4],  COUT[5] );
CSA_d  b5( INa[5],  INb[5],  INc[5],  SOUT[5],  COUT[6] );
CSA_d  b6( INa[6],  INb[6],  INc[6],  SOUT[6],  COUT[7] );
CSA_d  b7( INa[7],  INb[7],  INc[7],  SOUT[7],  COUT[8] );
CSA_d  b8( INa[8],  INb[8],  INc[8],  SOUT[8],  COUT[9] );
CSA_d  b9( INa[9],  INb[9],  INc[9],  SOUT[9], COUT[10] );
CSA_d b10(INa[10], INb[10], INc[10], SOUT[10], COUT[11] );
CSA_d b11(INa[11], INb[11], INc[11], SOUT[11], COUT[12] );
CSA_d b12(INa[12], INb[12], INc[12], SOUT[12], COUT[13] );
CSA_d b13(INa[13], INb[13], INc[13], SOUT[13], COUT[14] );
CSA_d b14(INa[14], INb[14], INc[14], SOUT[14], COUT[15] );
CSA_d b15(INa[15], INb[15], INc[15], SOUT[15], COUT[16] );

endmodule

module CSA_d (/* IN  */ INa, INb, INc,
              /* OUT */ SUM, COUT);

input  INa, INb, INc;
output SUM, COUT;

wire TMP;
assign TMP  = INa^ INb;
assign SUM  = TMP ^ INc;
assign COUT = (INa & INb) | (INb & INc) | (INc & INa);

endmodule
