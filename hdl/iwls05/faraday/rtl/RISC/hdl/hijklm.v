



















































































module pcont_ralu







(SYSCLK, TMODE, RESET_D1_R_N,
INST_I, CP0_INSTM32_I_R_C1_N, CP0_M16IADDRB1_I,
CLMI_RHOLD,
INST_S_R,
CLMI_SELINST_S_P,
CEI_CE1OP_S_R,
CEI_CE0OP_S_R,
CEI_INSTM32_S_R_N
);






























`include "../include/lxr_symbols.vh"
`include "../include/core_symbols.vh"


input SYSCLK;
input TMODE;
input RESET_D1_R_N;
input [31:0] INST_I;
input CP0_INSTM32_I_R_C1_N;
input CP0_M16IADDRB1_I;
input CLMI_RHOLD;

input [`CLMI_SEL_INST_HI:0] CLMI_SELINST_S_P;

output [31:0] INST_S_R;
output [11:0] CEI_CE1OP_S_R;
output [11:0] CEI_CE0OP_S_R;
output CEI_INSTM32_S_R_N;





reg [31:0] INST_S_R;
reg [11:0] CEI_CE1OP_S_R;
reg [11:0] CEI_CE0OP_S_R;



reg [31:0] InstSF_P;


wire RESET_D2_R_N;




wire NC_FOO = TMODE;



reg CEI_INSTM32_S_R_N, Select;




reg [11:0] CEI_OP_S_R;
reg JALval_E_R;









always @(CLMI_SELINST_S_P or INST_I or INST_S_R or Select or CP0_M16IADDRB1_I ) begin

case (1'b1)


CLMI_SELINST_S_P[`CLMI_SEL_INST_ZERO_POS]:
InstSF_P = (Select == `M32) ? `M32_NOP : `M16_NOP;














CLMI_SELINST_S_P[`CLMI_SEL_INST_LOAD_POS]:
InstSF_P = (Select == `M32) ? INST_I:
(CP0_M16IADDRB1_I) ? {INST_I[15], 1'b0, INST_I[14:11], 10'b00_0000_0000, INST_I[15:0]}:
{INST_I[31], 1'b0, INST_I[30:27], 10'b00_0000_0000, INST_I[31:16]};


CLMI_SELINST_S_P[`CLMI_SEL_INST_HOLD_POS]: InstSF_P = INST_S_R;

endcase
end

  // synopsys translate_off
  // verilint translate off


always @(posedge SYSCLK)

case (1'b1)


CLMI_SELINST_S_P[`CLMI_SEL_INST_ZERO_POS]: ;

CLMI_SELINST_S_P[`CLMI_SEL_INST_LOAD_POS]: ;

CLMI_SELINST_S_P[`CLMI_SEL_INST_HOLD_POS]: ;


default:
begin
if (RESET_D1_R_N)
begin
$display ("ERROR %t %m: At posedge SYSCLK: invalid INST_I selection code %b", $time, CLMI_SELINST_S_P);
$stop;
end
end


endcase









always @(CEI_OP_S_R or CEI_INSTM32_S_R_N or JALval_E_R) begin

CEI_CE0OP_S_R = JALval_E_R ?
{`M16_ADDIUSP, 6'b000_000} :
CEI_OP_S_R;

CEI_CE1OP_S_R = CEI_INSTM32_S_R_N ?
{ `M32_ADDI, 6'b011_111 } :
CEI_OP_S_R;


end









always @(CEI_INSTM32_S_R_N or CP0_INSTM32_I_R_C1_N or CLMI_RHOLD)
if (CLMI_RHOLD)
Select = CEI_INSTM32_S_R_N;
else
Select = CP0_INSTM32_I_R_C1_N;












reg RESET_X_R_N;
always @ (posedge SYSCLK)
RESET_X_R_N <= RESET_D1_R_N;
assign RESET_D2_R_N = RESET_X_R_N | TMODE;






always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if (!`RESET_D2_R_N_) begin
INST_S_R <= `M32_NOP;
CEI_OP_S_R <= 12'b0000_0000_0000;
end
else begin
INST_S_R <= InstSF_P;
CEI_OP_S_R <= {InstSF_P[`M32_OPCODE], InstSF_P[`M32_SUBOP]};
end

end
always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if (!`RESET_D2_R_N_) begin

CEI_INSTM32_S_R_N <= `M32;
JALval_E_R <= 1'b0;

end
else if (!CLMI_RHOLD) begin

CEI_INSTM32_S_R_N <= CP0_INSTM32_I_R_C1_N;



JALval_E_R <= (INST_S_R[`M16_OPCODE] == `M16_JAL) &
(CEI_INSTM32_S_R_N == `M16) &
~JALval_E_R;

end

end










reg [31:0] tInstEX_R;
reg [31:0] tInstM_R;
reg [31:0] tInstWB_R;


always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if (!`RESET_D2_R_N_) begin
tInstEX_R <= 32'h0000_0000;
tInstM_R <= 32'h0000_0000;
tInstWB_R <= 32'h0000_0000;
end
else if (!CLMI_RHOLD) begin
tInstEX_R <= INST_S_R;
tInstM_R <= tInstEX_R;
tInstWB_R <= tInstM_R;
end

end




always @(posedge SYSCLK) begin


case (tInstEX_R[`M32_OPCODE])

`M32_REGIMM: if ( (tInstEX_R[20:16] != `M32_BLTZ) &&
(tInstEX_R[20:16] != `M32_BGEZ) &&
(tInstEX_R[20:16] != `M32_BLTZAL) &&
(tInstEX_R[20:16] != `M32_BGEZAL) &&
`RESET_D2_R_N_ &&
(CP0_INSTM32_I_R_C1_N == `M32)) begin

$display ("ERROR %t %m: Illegal REGIMM opcode", $time);
$stop;
end


`M32_COP0,
`M32_COP1,
`M32_COP2,
`M32_COP3: begin

if ( (tInstEX_R[25:21] != `M32_MF) &&
(tInstEX_R[25:21] != `M32_CF) &&
(tInstEX_R[25:21] != `M32_MT) &&
(tInstEX_R[25:21] != `M32_CT) &&
(tInstEX_R[25:21] != `M32_BC) &&
(tInstEX_R[25] == 1'b0) &&
`RESET_D2_R_N_ &&
(CP0_INSTM32_I_R_C1_N == `M32)) begin

$display ("ERROR %t %m: Illegal COP opcode", $time);
$stop;
end


if ( (tInstEX_R[25:21] == `M32_BC) &&
(tInstEX_R[20:16] != `M32_BCF) &&
(tInstEX_R[20:16] != `M32_BCT) &&
(tInstEX_R[25] == 1'b0) &&
`RESET_D2_R_N_ &&
(CP0_INSTM32_I_R_C1_N == `M32)) begin

$display ("ERROR %t %m: Illegal COP BRANCH opcode", $time);
$stop;
end


if ( (tInstEX_R[31:26] == `M32_COP0) &&
(tInstEX_R[25] == 1'b1) &&
(tInstEX_R[5:0] != `M32_RFE) && (tInstEX_R[5:0] != `M32_DRET) &&
(tInstEX_R[5:0] != `M32_SLEEP) &&
`RESET_D2_R_N_ &&
(CP0_INSTM32_I_R_C1_N == `M32)) begin

$display ("ERROR %t %m: Illegal COP0 opcode", $time);
$stop;
end

end

endcase
end


  // verilint translate on
  // synopsys translate_on





endmodule

