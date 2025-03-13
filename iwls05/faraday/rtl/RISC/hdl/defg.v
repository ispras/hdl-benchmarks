`include "def.v"
`include "lxr_symbols.vh"
module ce_hlw

(

CE_RES_E, CE_SEL_E_R, CE_HALT_E_R_C,

CLK, TMODE, SEN, RESET_D1_R_N, CEI_CEHOLD, CEI_XCPN_M, CEI_OP_S_R,
CEI_INSTM32_S_R_N, CEI_AOP_E_R, CFG_CEENBL, MAC_RES_E, MAC_SEL_E_R
);







input CLK;
input TMODE;
input SEN;
input RESET_D1_R_N;
input CEI_CEHOLD;
input CEI_XCPN_M;

input [11:0] CEI_OP_S_R;
input CEI_INSTM32_S_R_N;
input [31:0] CEI_AOP_E_R;

input CFG_CEENBL;

input [31:0] MAC_RES_E;
input MAC_SEL_E_R;

output [31:0] CE_RES_E;
output CE_SEL_E_R;


output [`HALT_DRV_RANGE] CE_HALT_E_R_C;


wire NC_FOO = SEN;








wire [3:0] CFG_CEENBL_C1;



wire [31:0] HL_RES_E;
wire HL_SEL_E_R;




assign CE_SEL_E_R = CFG_CEENBL_C1[0] ? HL_SEL_E_R : MAC_SEL_E_R;
assign CE_RES_E[07:00] = CFG_CEENBL_C1[0] ? HL_RES_E[07:00] : MAC_RES_E[07:00];
assign CE_RES_E[15:08] = CFG_CEENBL_C1[1] ? HL_RES_E[15:08] : MAC_RES_E[15:08];
assign CE_RES_E[23:16] = CFG_CEENBL_C1[2] ? HL_RES_E[23:16] : MAC_RES_E[23:16];
assign CE_RES_E[31:24] = CFG_CEENBL_C1[3] ? HL_RES_E[31:24] : MAC_RES_E[31:24];

ce_hl ce_hl (


.CE_RES_E (HL_RES_E[31:0] ),
.CE_SEL_E_R (HL_SEL_E_R),
.CE_HALT_E_R_C (CE_HALT_E_R_C[`HALT_DRV_RANGE]),

.CLK (CLK),
.TMODE (TMODE),
.RESET_D1_R_N (RESET_D1_R_N),
.CFG_CEENBL (CFG_CEENBL),
.CEI_CEHOLD (CEI_CEHOLD),
.CEI_XCPN_M (CEI_XCPN_M),
.CEI_OP_S_R (CEI_OP_S_R[11:0]),
.CEI_INSTM32_S_R_N (CEI_INSTM32_S_R_N),
.CEI_AOP_E_R (CEI_AOP_E_R[31:0]),
.CEI_BOP_E_R (32'h0000_0000));








reg RESET_X_R_N;
always @ (posedge CLK)
RESET_X_R_N <= RESET_D1_R_N;
wire RESET_D2_R_N = RESET_X_R_N | TMODE;




assign CFG_CEENBL_C1 = {4{CFG_CEENBL}};







endmodule








