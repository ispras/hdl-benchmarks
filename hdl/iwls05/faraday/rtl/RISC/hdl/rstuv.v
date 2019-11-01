



















































































`include "../include/lxr_symbols.vh"
`include "../include/lmi_symbols.vh"

module lmi_dram_cmp






(
CMP,

ADDR,

BASE,
TOP
);

parameter BASE_HI = 31;
parameter BASE_LO = `LM_BASE_LO;
parameter TOP_HI = `LM_TOP_HI;
parameter TOP_LO = 4;

output CMP;
input [31:0] ADDR;
input [BASE_HI:BASE_LO] BASE;
input [TOP_HI:TOP_LO] TOP;





wire BaseRangeCompare = ADDR[TOP_HI:BASE_LO] >= BASE[TOP_HI:BASE_LO];

assign CMP = BaseRangeCompare & (ADDR[BASE_HI:TOP_HI+1] == BASE[BASE_HI:TOP_HI+1]) & (ADDR[TOP_HI:TOP_LO] <= TOP);

endmodule


