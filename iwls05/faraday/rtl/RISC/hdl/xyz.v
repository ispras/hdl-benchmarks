module dalu

(SYSCLK, TMODE, RESET_D1_R_N, CLMI_RHOLD,
REGA_E_R, REGBI_E_R,
ALUOP_E_P,
CP0_LINK_E_R,
CE0_RES_E,
CE1_RES_E,
CE0_SEL_E_R,
CE1_SEL_E_R,
ALURES_E,
V_E
);

`include "lxr_symbols.vh"
`include "core_symbols.vh"


input SYSCLK;
input TMODE;
input RESET_D1_R_N;
input CLMI_RHOLD;

input [31:0] REGA_E_R;
input [31:0] REGBI_E_R;

input [`RALU_WALUOP:0] ALUOP_E_P;
input [31:0] CP0_LINK_E_R;

input [31:0] CE0_RES_E;
input [31:0] CE1_RES_E;
input CE0_SEL_E_R;
input CE1_SEL_E_R;

output [31:0] ALURES_E;
output V_E;




reg [31:0] ALURES_E;
reg V_E;




reg [31:0] Sum_E;
reg [31:0] Logical_E;
reg Upper_E;
reg [31:0] Aluresi_E;

reg [`RALU_WALUOP:0] Aluop_E_R;

reg [31:0] ShiftR_E;
reg [31:0] ShiftL_E;


wire RESET_D2_R_N;




wire NC_FOO = TMODE;














always @(Aluop_E_R or REGA_E_R or REGBI_E_R or CP0_LINK_E_R or
CE1_SEL_E_R or CE0_SEL_E_R or CE0_RES_E or CE1_RES_E ) begin







if (Aluop_E_R[`RALU_IOP_ADD])

{Upper_E, Sum_E} = { ~Aluop_E_R[`RALU_IOP_SLTZ] & REGA_E_R[31], REGA_E_R }
+ { ~Aluop_E_R[`RALU_IOP_SLTZ] & REGBI_E_R[31], REGBI_E_R};
else

{Upper_E, Sum_E} = { ~Aluop_E_R[`RALU_IOP_SLTZ] & REGA_E_R[31], REGA_E_R }
- { ~Aluop_E_R[`RALU_IOP_SLTZ] & REGBI_E_R[31], REGBI_E_R};







case (1'b1)
Aluop_E_R[`RALU_IOP_AND]: Logical_E = REGA_E_R & REGBI_E_R;
Aluop_E_R[`RALU_IOP_OR]: Logical_E = REGA_E_R | REGBI_E_R;
Aluop_E_R[`RALU_IOP_NOR]: Logical_E = ~(REGA_E_R | REGBI_E_R);
Aluop_E_R[`RALU_IOP_XOR]: Logical_E = REGA_E_R ^ REGBI_E_R;
default: Logical_E = 32'h0000_0000;
endcase




ShiftR_E = Aluop_E_R[`RALU_IOP_SRIGHTL] ? rshift(REGA_E_R[4:0], REGBI_E_R, `RALU_LOGICAL) :
rshift(REGA_E_R[4:0], REGBI_E_R, `RALU_ARITH);

ShiftL_E = Aluop_E_R[`RALU_IOP_SLEFT] ? lshift(REGA_E_R[4:0], REGBI_E_R, `RALU_L_NORMAL) :
lshift(REGA_E_R[4:0], REGBI_E_R, `RALU_L_LUI);





V_E = Upper_E ^ Sum_E[31];




case (1'b1)

Aluop_E_R[`RALU_IOP_ADD],
Aluop_E_R[`RALU_IOP_SUB]: Aluresi_E = Sum_E;

Aluop_E_R[`RALU_IOP_SLTZ],
Aluop_E_R[`RALU_IOP_SLTS]: Aluresi_E = {3'b000, 28'h000_0000, Upper_E};

Aluop_E_R[`RALU_IOP_AND],
Aluop_E_R[`RALU_IOP_OR],
Aluop_E_R[`RALU_IOP_XOR],
Aluop_E_R[`RALU_IOP_NOR]: Aluresi_E = Logical_E;

Aluop_E_R[`RALU_IOP_SLEFT16],
Aluop_E_R[`RALU_IOP_SLEFT]: Aluresi_E = ShiftL_E;

Aluop_E_R[`RALU_IOP_SRIGHTL],
Aluop_E_R[`RALU_IOP_SRIGHTA]: Aluresi_E = ShiftR_E;

Aluop_E_R[`RALU_IOP_LINK]: Aluresi_E = CP0_LINK_E_R;

endcase



case (1'b1)

CE0_SEL_E_R: ALURES_E = CE0_RES_E;
CE1_SEL_E_R: ALURES_E = CE1_RES_E;
default: ALURES_E = Aluresi_E;

endcase

end



  // synopsys translate_off
  // verilint translate off


always @ (posedge SYSCLK) begin

if (`RESET_D2_R_N_ && (|Aluop_E_R == 0)) begin
$display ("ERROR %t %m: Illegal ALU OUTPUT SELECT", $time);
$stop;
end

if (`RESET_D2_R_N_ && CE1_SEL_E_R && CE0_SEL_E_R) begin
$display ("ERROR %t %m: CE0 and CE1 BOTH ACTIVE", $time);
$stop;
end

end








  // verilint translate on
  // synopsys translate_on












reg RESET_X_R_N;
always @ (posedge SYSCLK)
RESET_X_R_N <= RESET_D1_R_N;
assign RESET_D2_R_N = RESET_X_R_N | TMODE;






always @(posedge SYSCLK `negedge_RESET_D2_R_N_)


if (!`RESET_D2_R_N_)

Aluop_E_R <= `RALU_IOP_INIT;

else if (!CLMI_RHOLD)

Aluop_E_R <= ALUOP_E_P;






















function [31:0] lshift;
input [4:0] inamt;
input [31:0] in;
input type_;

reg [31:0] temp1, temp2, temp3, temp4;
reg [4:0] amount;

begin


amount = (type_ == `RALU_L_LUI) ? 5'b10000 : inamt;

temp1 = amount[0] ? {in[30:0], 1'b0} : in;
temp2 = amount[1] ? {temp1[29:0], 2'b00} : temp1;
temp3 = amount[2] ? {temp2[27:0], 4'b0000} : temp2;
temp4 = amount[3] ? {temp3[23:0], 8'b0000_0000} : temp3;

lshift = (amount[4]) ? {temp4[15:0], 16'h0000} : temp4;

end

endfunction



function [31:0] rshift;
input [4:0] amount;
input [31:0] in;
input type_;

reg [31:0] temp1, temp2, temp3, temp4;
reg sign;

begin
sign = (type_ == `RALU_ARITH) ? in[31] : 1'b0;

temp1 = amount[0] ? {{1{sign}}, in[31:1]} : in;
temp2 = amount[1] ? {{2{sign}}, temp1[31:2]} : temp1;
temp3 = amount[2] ? {{4{sign}}, temp2[31:4]} : temp2;
temp4 = amount[3] ? {{8{sign}}, temp3[31:8]} : temp3;

rshift = (amount[4]) ? {{16{sign}}, temp4[31:16]} : temp4;
end

endfunction


endmodule
