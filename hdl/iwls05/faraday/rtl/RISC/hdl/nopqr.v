




















































































module lmi_dcache_tag
















(EN, KSEG1, ADDR, TAG, VAL,
wrPartial, wrWord,
CMP, RCMP_N, wrPartialHit, wrWordHit);

`include "../include/lxr_symbols.vh"




parameter TAG_HI = 31;
parameter TAG_LO = `DC_ADDR_HI+1-`DC_TAG_EXTRA_SIZE;




input EN;
input KSEG1;
input VAL;
input [TAG_HI:TAG_LO] ADDR;
input [TAG_HI:TAG_LO] TAG;

input wrWord;
input wrPartial;

output CMP;
output RCMP_N;

output wrPartialHit;
output wrWordHit;





































wire RAW_CMP = |(~(~{TAG,VAL} ^ {ADDR,1'b1}));
wire RCMP_N = &(~{TAG,VAL} ^ {ADDR,1'b1});
assign CMP = EN & ( RAW_CMP | KSEG1 );
assign wrPartialHit = & (3'b101 ^ ~({ EN, KSEG1, wrPartial })) & ~RAW_CMP;
assign wrWordHit = & (3'b101 ^ ~({ EN, KSEG1, wrWord })) & ~RAW_CMP;

endmodule

