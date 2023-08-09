module oc_des_des3perf(desOut, desIn, key1, key2, key3, decrypt, clk); 
output	[63:0]	desOut;
input	[63:0]	desIn;
input	[55:0]	key1;
input	[55:0]	key2;
input	[55:0]	key3;
input		decrypt;
input		clk;


des3 desinst (
	.desOut(desOut), 
	.desIn(desIn), 
	.key1(key1), 
	.key2(key2), 
	.key3(key3), 
	.decrypt(decrypt), 
	.clk(clk)); 


endmodule