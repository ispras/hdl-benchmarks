`include "efghi.v"

module macw

(

CE_RES_E, CE_SEL_E_R, CE_HALT_E_R_C,

CLK, TMODE, SEN, RESET_D1_R_N, CFG_CEENBL, CEI_CEHOLD, CEI_XCPN_M,
CEI_OP_S_R, CEI_INSTM32_S_R_N, CEI_AOP_E_R, CEI_BOP_E_R
);

`include "lxr_symbols.vh"
`include "core_symbols.vh"



input CLK;
input TMODE;
input SEN;
input RESET_D1_R_N;
input CFG_CEENBL;
input CEI_CEHOLD;
input CEI_XCPN_M;
input [11:0] CEI_OP_S_R;
input CEI_INSTM32_S_R_N;

input [31:0] CEI_AOP_E_R;
input [31:0] CEI_BOP_E_R;

output [31:0] CE_RES_E;
output CE_SEL_E_R;


output [`HALT_DRV_RANGE] CE_HALT_E_R_C;


macd macd (

.CLK (CLK),
.RESET_D1_R_N (RESET_D1_R_N),
.SEN (SEN),
.RESET_DIS (TMODE),
.CFG_CEENBL (CFG_CEENBL),
.CFG_MACMODE_E_R (5'd0),
.CEI_CEHOLD (CEI_CEHOLD),
.CEI_XCPN_M (CEI_XCPN_M),
.CEI_INVLD_M (CEI_XCPN_M),
.CEI_INVLDP_S_R (1'b0),
.CEI_ILEXOP_S_R (1'b0),
.CEI_INST_S_R ({CEI_OP_S_R[11:6],
20'd0,
CEI_OP_S_R[ 5:0]}),
.CEI_INSTM32_S_R_N (CEI_INSTM32_S_R_N),
.CEI_AOP_E_R (CEI_AOP_E_R),
.CEI_BOP_E_R (CEI_BOP_E_R),
.CE_RES_E (CE_RES_E),
.CE_SEL_E_R (CE_SEL_E_R),
.CE_HALT_E_R_C (CE_HALT_E_R_C)
);


endmodule
