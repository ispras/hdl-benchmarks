











































































































`include "../include/lxr_symbols.vh"





module ce_buf
(


RALU_CINA_E_R,
RALU_CINBI_E_R,

RALU_CE0OP_S_R,
RALU_CE1OP_S_R,
RALU_INSTM32_S_R_N,

CEI_CE0AOP_E_R,
CEI_CE0BOP_E_R,
CEI_CE1AOP_E_R,
CEI_CE1BOP_E_R,
CEI_CEHLW_AOP_E_R,

CEI_CE0OP_S_R,
CEI_CE1OP_S_R,
CEI_INSTM32_S_R_N
);

input [31:0] RALU_CINA_E_R;
input [31:0] RALU_CINBI_E_R;

output [31:0] CEI_CE0AOP_E_R;
output [31:0] CEI_CE0BOP_E_R;

output [31:0] CEI_CE1AOP_E_R;
output [31:0] CEI_CE1BOP_E_R;

output [31:0] CEI_CEHLW_AOP_E_R;

input [11:0] RALU_CE1OP_S_R;
input [11:0] RALU_CE0OP_S_R;
input RALU_INSTM32_S_R_N;

output [11:0] CEI_CE1OP_S_R;
output [11:0] CEI_CE0OP_S_R;
output CEI_INSTM32_S_R_N;



assign CEI_CE0AOP_E_R = RALU_CINA_E_R;
assign CEI_CE1AOP_E_R = RALU_CINA_E_R;
assign CEI_CEHLW_AOP_E_R = RALU_CINA_E_R;

assign CEI_CE0BOP_E_R = RALU_CINBI_E_R;
assign CEI_CE1BOP_E_R = RALU_CINBI_E_R;

assign CEI_CE0OP_S_R = RALU_CE0OP_S_R;
assign CEI_CE1OP_S_R = RALU_CE1OP_S_R;
assign CEI_INSTM32_S_R_N = RALU_INSTM32_S_R_N;



endmodule
