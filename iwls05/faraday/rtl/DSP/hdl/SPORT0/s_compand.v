





















module COMPAND (/* in */ DTYPE0, RX0, TX0, 
expRX0, logTX0); 


input [1:0] DTYPE0; 
input [15:0] RX0, 
TX0; 

output [15:0] expRX0; 
output [7:0] logTX0; 


EXPAND exp (/* in */ RX0[15:0], DTYPE0[1:0], 
expRX0[15:0]); 

COMPRESS log (/* in */ TX0[15:0], DTYPE0[0], 
logTX0[7:0]); 


endmodule 
