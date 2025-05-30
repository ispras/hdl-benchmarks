
`include "lxr_symbols.vh"

module lmi_icache_tag
















(CMP, ADDR, TAG);




parameter TAG_HI = 32;
parameter TAG_LO = `IC_ADDR_HI+1-`IC_TAG_EXTRA_SIZE;




input [TAG_HI:TAG_LO] ADDR;
input [TAG_HI:TAG_LO] TAG;
output CMP;

assign CMP = (TAG != ADDR);

endmodule


