module oc_des_des3area(desOut, desIn, key1, key2, key3, decrypt, roundSel, clk);
output	[63:0]	desOut;
input	[63:0]	desIn;
input	[55:0]	key1;
input	[55:0]	key2;
input	[55:0]	key3;
input		decrypt;
input	[5:0]	roundSel;
input		clk;

des3 desinst (
	.desOut(desOut), 
	.desIn(desIn), 
	.key1(key1), 
	.key2(key2), 
	.key3(key3), 
	.decrypt(decrypt), 
	.roundSel(roundSel),
	.clk(clk)); 


endmodule