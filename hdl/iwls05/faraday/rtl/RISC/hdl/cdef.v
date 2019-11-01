



















































































module ce_hl




































































































(CLK, TMODE, RESET_D1_R_N, CFG_CEENBL, CEI_CEHOLD, CEI_XCPN_M,
CEI_OP_S_R, CEI_INSTM32_S_R_N, CEI_AOP_E_R,

CEI_BOP_E_R,

CE_RES_E,
CE_SEL_E_R, CE_HALT_E_R_C);


`include "../include/lxr_symbols.vh"
`include "../include/core_symbols.vh"



























input CLK;
input TMODE;
input RESET_D1_R_N;
input CEI_CEHOLD;
input CEI_XCPN_M;

input [11:0] CEI_OP_S_R;
input CEI_INSTM32_S_R_N;
input [31:0] CEI_AOP_E_R;
input [31:0] CEI_BOP_E_R;

input CFG_CEENBL;

output [31:0] CE_RES_E;
output CE_SEL_E_R;


output [`HALT_DRV_RANGE] CE_HALT_E_R_C;








wire NC_FOO = TMODE;



reg [31:0] CE_RES_E;
reg CE_SEL_E_R;
reg CE_HALT_E_R;




wire CFG_CEENBL_C1;

reg [31:0] HI_R;
reg [31:0] LO_R;
reg [7:0] CEop_E_R;

reg CEopMTHI_M_R;
reg CEopMTLO_M_R;

reg [31:0] AOP_E_D1_R;

reg [4:0] HI2RES_E_R_C;



wire ECycGo;
wire myRhold;

reg [31:0] HI_P;
reg [31:0] LO_P;
wire [7:0] CEop_S;
reg [7:0] CEopIfM32_S;
reg [7:0] CEopIfM16_S;
wire [7:0] CEopIfNotExcpn_E_P;
wire [7:0] CEop_E_P;
reg CEopMTHI_E;
reg CEopMTLO_E;

wire CEopMTHIGo_E;
wire CEopMTLOGo_E;

wire CEopMTHIGo_M;
wire CEopMTLOGo_M;

wire HIbusyIfHX00_E_P;
wire LObusyIfHX00_E_P;
wire HIbusyIfHX10_E_P;
wire LObusyIfHX10_E_P;
wire CEhaltLOEn_S;
wire CEhaltHIEn_S;
reg CEhaltLOEnIfM32_S;
reg CEhaltHIEnIfM32_S;
reg CEhaltLOEnIfM16_S;
reg CEhaltHIEnIfM16_S;
reg CEhaltLOEn_E;
reg CEhaltHIEn_E;

wire CE_HALT_E_P;

wire [31:0] AOP_E_D1_P;

wire HI2RES_S;
reg HI2RESIfM32_S;
reg HI2RESIfM16_S;
wire HI2RES_E_P;




assign CE_HALT_E_R_C = {`HALT_DRV_COUNT{CE_HALT_E_R}};













assign AOP_E_D1_P = CEI_AOP_E_R;









assign ECycGo = ~CEI_XCPN_M & ~CEI_CEHOLD & ~CE_HALT_E_R;



assign myRhold = CEI_CEHOLD | CE_HALT_E_R;
























always @(CEI_OP_S_R) begin



CEopIfM32_S[5:0] = CEI_OP_S_R[5:0];

case (CEI_OP_S_R[`M32_CEIOPCODE])

`M32_SPECIAL: CEopIfM32_S[6] = 0;
`M32_LEXOP: CEopIfM32_S[6] = 1;
default: CEopIfM32_S[6] = 0;

endcase

case (CEI_OP_S_R)

{`M32_SPECIAL,`M32_MFHI }: CEopIfM32_S[7] = 1;
{`M32_SPECIAL,`M32_MTHI }: CEopIfM32_S[7] = 1;
{`M32_SPECIAL,`M32_MFLO }: CEopIfM32_S[7] = 1;
{`M32_SPECIAL,`M32_MTLO }: CEopIfM32_S[7] = 1;

default: CEopIfM32_S[7] = 0;

endcase



CEopIfM16_S[5:0] = {1'b0,CEI_OP_S_R[4:0]};


case (CEI_OP_S_R[`M16_CEIOPCODE])

`M16_RR: CEopIfM16_S[6] = 0;
`M16_LEXOP: CEopIfM16_S[6] = 1;
default: CEopIfM16_S[6] = 0;

endcase

case ({CEI_OP_S_R[11:6],CEI_OP_S_R[4:0]})

{`M16_RR ,`M16_MFHI }: CEopIfM16_S[7] = 1;

{`M16_RR ,`M16_MFLO }: CEopIfM16_S[7] = 1;


default: CEopIfM16_S[7] = 0;

endcase

end


assign CEop_S = (~CEI_INSTM32_S_R_N) ? CEopIfM32_S : CEopIfM16_S;


assign CEopIfNotExcpn_E_P = myRhold ? CEop_E_R : CEop_S;



assign CEop_E_P[7] = CEopIfNotExcpn_E_P[7] & ~CEI_XCPN_M & CFG_CEENBL_C1;
assign CEop_E_P[6:0] = CEopIfNotExcpn_E_P[6:0];




































always @(CEI_OP_S_R) begin


CEhaltHIEnIfM32_S = 0;
CEhaltLOEnIfM32_S = 0;


case (CEI_OP_S_R)

{`M32_SPECIAL,`M32_MFHI }: begin CEhaltHIEnIfM32_S = 1; CEhaltLOEnIfM32_S = 0; end
{`M32_SPECIAL,`M32_MFLO }: begin CEhaltHIEnIfM32_S = 0; CEhaltLOEnIfM32_S = 1; end

default: ;

endcase


CEhaltHIEnIfM16_S = 0;
CEhaltLOEnIfM16_S = 0;


case ({CEI_OP_S_R[11:6],CEI_OP_S_R[4:0]})

{`M16_RR ,`M16_MFHI }: begin CEhaltHIEnIfM16_S = 1; CEhaltLOEnIfM16_S = 0; end
{`M16_RR ,`M16_MFLO }: begin CEhaltHIEnIfM16_S = 0; CEhaltLOEnIfM16_S = 1; end

default: ;

endcase
end


assign CEhaltHIEn_S = (~CEI_INSTM32_S_R_N) ? CEhaltHIEnIfM32_S : CEhaltHIEnIfM16_S ;
assign CEhaltLOEn_S = (~CEI_INSTM32_S_R_N) ? CEhaltLOEnIfM32_S : CEhaltLOEnIfM16_S ;



always @(CEop_E_R) begin

CEhaltHIEn_E = 0;
CEhaltLOEn_E = 0;

case (CEop_E_R)


{2'b10,`SOP_MFHI }: begin CEhaltHIEn_E = 1; CEhaltLOEn_E = 0; end
{2'b10,`SOP_MFLO }: begin CEhaltHIEn_E = 0; CEhaltLOEn_E = 1; end

default: ;

endcase
end


always @(CEI_OP_S_R) begin


case (CEI_OP_S_R)

{`M32_SPECIAL,`M32_MFHI }: HI2RESIfM32_S = 1;
{`M32_SPECIAL,`M32_MFLO }: HI2RESIfM32_S = 0;
default: HI2RESIfM32_S = 0;

endcase


case ({CEI_OP_S_R[11:6],CEI_OP_S_R[4:0]})

{`M16_RR ,`M16_MFHI }: HI2RESIfM16_S = 1;
{`M16_RR ,`M16_MFLO }: HI2RESIfM16_S = 0;
default: HI2RESIfM16_S = 0;

endcase
end


assign HI2RES_S = (~CEI_INSTM32_S_R_N) ? HI2RESIfM32_S : HI2RESIfM16_S;




assign HI2RES_E_P = myRhold ? HI2RES_E_R_C[4] : HI2RES_S;




always @(CEop_E_R) begin





CEopMTHI_E = 0;
CEopMTLO_E = 0;




case (CEop_E_R)


{2'b10,`SOP_MTHI}: CEopMTHI_E = 1;
{2'b10,`SOP_MTLO}: CEopMTLO_E = 1;

default: ;

endcase
end



assign CEopMTHIGo_E = ECycGo & CEopMTHI_E ;
assign CEopMTLOGo_E = ECycGo & CEopMTLO_E ;



assign HIbusyIfHX00_E_P =
CEopMTHI_E ;

assign LObusyIfHX00_E_P =
CEopMTLO_E ;



assign HIbusyIfHX10_E_P = 1'b0;


assign LObusyIfHX10_E_P = 1'b0;





















assign CE_HALT_E_P =
(CEhaltLOEn_S & LObusyIfHX00_E_P & ~myRhold & ~CEI_XCPN_M) |
(CEhaltHIEn_S & HIbusyIfHX00_E_P & ~myRhold & ~CEI_XCPN_M) |
(CEhaltLOEn_E & LObusyIfHX10_E_P & myRhold & ~CEI_XCPN_M) |
(CEhaltHIEn_E & HIbusyIfHX10_E_P & myRhold & ~CEI_XCPN_M) ;

always @(HI2RES_E_R_C or HI_R or LO_R) begin

CE_RES_E[31:28] = HI2RES_E_R_C[4] ? HI_R[31:28] : LO_R[31:28] ;
CE_RES_E[27:21] = HI2RES_E_R_C[3] ? HI_R[27:21] : LO_R[27:21] ;
CE_RES_E[20:14] = HI2RES_E_R_C[2] ? HI_R[20:14] : LO_R[20:14] ;
CE_RES_E[13:07] = HI2RES_E_R_C[1] ? HI_R[13:07] : LO_R[13:07] ;
CE_RES_E[06:00] = HI2RES_E_R_C[0] ? HI_R[06:00] : LO_R[06:00] ;

end


assign CEopMTLOGo_M = CEopMTLO_M_R & ~CEI_XCPN_M;
assign CEopMTHIGo_M = CEopMTHI_M_R & ~CEI_XCPN_M;

always @(AOP_E_D1_R or CEopMTHIGo_M or HI_R) begin

case (1'b1)
CEopMTHIGo_M: HI_P = AOP_E_D1_R;
default: HI_P = HI_R;
endcase

end


always @(AOP_E_D1_R or CEopMTLOGo_M or LO_R) begin

case (1'b1)
CEopMTLOGo_M: LO_P = AOP_E_D1_R;
default: LO_P = LO_R;
endcase

end










reg RESET_X_R_N;
always @ (posedge CLK)
RESET_X_R_N <= RESET_D1_R_N;
wire RESET_D2_R_N = RESET_X_R_N | TMODE;




assign CFG_CEENBL_C1 = CFG_CEENBL;

always @(posedge CLK `negedge_RESET_D2_R_N_) begin

if (~`RESET_D2_R_N_) begin

LO_R <= 32'h0000_0000;
HI_R <= 32'h0000_0000;

CEop_E_R <= 8'b0000_0000;
CE_SEL_E_R <= 0;
HI2RES_E_R_C <= 5'b00000;
CE_HALT_E_R <= 0;

CEopMTHI_M_R <= 0;
CEopMTLO_M_R <= 0;

AOP_E_D1_R <= 32'h0000_0000;

end

else begin

LO_R <= LO_P;
HI_R <= HI_P;

CEop_E_R <= CEop_E_P;
CE_SEL_E_R <= CEop_E_P[7];
HI2RES_E_R_C <= {5{HI2RES_E_P}};
CE_HALT_E_R <= CE_HALT_E_P;

CEopMTHI_M_R <= CEopMTHIGo_E;
CEopMTLO_M_R <= CEopMTLOGo_E;

AOP_E_D1_R <= AOP_E_D1_P;

end
end

































wire write_lo = CEopMTLOGo_M ;
wire write_hi = CEopMTHIGo_M ;



endmodule

