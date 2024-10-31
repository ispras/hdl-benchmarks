



















































































module pcont_copif








(SYSCLK, TMODE, RESET_D1_R_N,
INSTIF, ISTALLIF,
IMISS, DMISS, IVAL, DVAL,
X_HALT_R,
DLOAD, RHOLD,
INSTSF_R,
CNTINST_R, CNTIMISS_R, CNTISTALL_R,
CNTDMISS_R, CNTDSTALL_R, CNTDLOAD_R, CNTDSTORE_R
);



































`define CI_SRESET 4'b0001
`define CI_SLOAD 4'b0010
`define CI_SREQUEST 4'b0100
`define CI_S1STBEAT 4'b1000

`include "lxr_symbols.vh"
`include "core_symbols.vh"





input SYSCLK;
input TMODE;
input RESET_D1_R_N;

input [31:0] INSTIF;
input ISTALLIF;

input IMISS;
input DMISS;
input IVAL;
input DVAL;

input [`HALT_SIG_RANGE] X_HALT_R;

output DLOAD;
output RHOLD;
output [31:0] INSTSF_R;

output CNTINST_R;
output CNTIMISS_R;
output CNTISTALL_R;
output CNTDMISS_R;
output CNTDSTALL_R;
output CNTDLOAD_R;
output CNTDSTORE_R;






reg DLOAD;
reg RHOLD;
reg [31:0] INSTSF_R;

reg CNTINST_R;
reg CNTIMISS_R;
reg CNTISTALL_R;
reg CNTDMISS_R;
reg CNTDSTALL_R;
reg CNTDLOAD_R;
reg CNTDSTORE_R;


wire RESET_D2_R_N;




wire NC_FOO = TMODE;






reg [31:0] InstNext;
reg [3:0] Istate_R, IstateNext;




reg [3:0] Dstate_R, DstateNext;





reg CNTDLOAD_P;
reg CNTDSTORE_P;




wire ImissQ;
wire DmissQ;














always @(X_HALT_R)
RHOLD = | X_HALT_R;





assign ImissQ = IMISS;
assign DmissQ = DMISS;






always @(Istate_R or ISTALLIF or INSTIF or INSTSF_R or
ImissQ or IVAL or RHOLD) begin


IstateNext = `CI_SLOAD;
InstNext = INSTIF;


case (Istate_R)

`CI_SRESET: begin

IstateNext = `CI_SLOAD;
InstNext = RHOLD ? `M32_NOP : INSTIF;
end

`CI_SLOAD: if (ImissQ ) begin
IstateNext = `CI_SREQUEST;
InstNext = INSTSF_R;
end













else if (~ImissQ && ~RHOLD) begin
IstateNext = `CI_SLOAD;
InstNext = INSTIF;
end


else if (~ImissQ && RHOLD) begin
IstateNext = `CI_SLOAD;
InstNext = INSTSF_R;
end



else begin
IstateNext = `CI_SLOAD;
InstNext = INSTSF_R;
end





`CI_SREQUEST: if (IVAL) begin
IstateNext = `CI_S1STBEAT;
InstNext = INSTIF;
end

else begin
IstateNext = `CI_SREQUEST;
InstNext = INSTSF_R;
end


`CI_S1STBEAT: if (RHOLD) begin
IstateNext = `CI_S1STBEAT;
InstNext = INSTSF_R;
end

else begin
IstateNext = `CI_SLOAD;
InstNext = INSTIF;
end

default: begin
IstateNext = `CI_SLOAD;
InstNext = INSTIF;
end


endcase


if (ISTALLIF && ~RHOLD) begin
IstateNext = `CI_SLOAD;
InstNext = 32'h0000_0000;
end


end










always @( Dstate_R or INSTIF or INSTSF_R or DmissQ or DVAL or RHOLD) begin



DstateNext = `CI_SLOAD;
DLOAD = 1'b0;


case (Dstate_R)

`CI_SRESET: begin

DstateNext = `CI_SLOAD;
DLOAD = 1'b0;
end

`CI_SLOAD: if (DmissQ) begin
DstateNext = `CI_SREQUEST;
DLOAD = 1'b0;
end












else if (~DmissQ && ~RHOLD) begin
DstateNext = `CI_SLOAD;
DLOAD = 1'b0;
end

else if (~DmissQ && RHOLD) begin
DstateNext = `CI_SLOAD;
DLOAD = 1'b0;
end


else begin
DstateNext = `CI_SLOAD;
DLOAD = 1'b0;
end




`CI_SREQUEST: if (DVAL) begin
DstateNext = `CI_S1STBEAT;
DLOAD = 1'b1;
end

else begin
DstateNext = `CI_SREQUEST;
DLOAD = 1'b1;
end


`CI_S1STBEAT: if (RHOLD) begin
DstateNext = `CI_S1STBEAT;
DLOAD = 1'b0;
end

else begin
DstateNext = `CI_SLOAD;
DLOAD = 1'b0;
end

default: begin
DstateNext = `CI_SLOAD;
DLOAD = 1'b0;
end


endcase



end













always @(INSTSF_R)

case (INSTSF_R[`M32_OPCODE])

`M32_LB, `M32_LBU,
`M32_LH, `M32_LHU,
`M32_LW: begin
CNTDLOAD_P = 1'b1;
CNTDSTORE_P = 1'b0;
end
`M32_SB,
`M32_SH,
`M32_SW: begin
CNTDLOAD_P = 1'b0;
CNTDSTORE_P = 1'b1;
end
default: begin
CNTDLOAD_P = 1'b0;
CNTDSTORE_P = 1'b0;
end

endcase













reg RESET_X_R_N;
always @ (posedge SYSCLK)
RESET_X_R_N <= RESET_D1_R_N;
assign RESET_D2_R_N = RESET_X_R_N | TMODE;






always @(posedge SYSCLK `negedge_RESET_D2_R_N_) begin

if (!`RESET_D2_R_N_) begin
INSTSF_R <= `M32_NOP;
Istate_R <= `CI_SRESET;
Dstate_R <= `CI_SRESET;
end
else begin
INSTSF_R <= InstNext;
Istate_R <= IstateNext;
Dstate_R <= DstateNext;
end
end


always @(posedge SYSCLK `negedge_RESET_D2_R_N_)

if(!`RESET_D2_R_N_) begin
CNTINST_R <= 1'b0;
CNTIMISS_R <= 1'b0;
CNTISTALL_R <= 1'b0;
CNTDMISS_R <= 1'b0;
CNTDSTALL_R <= 1'b0;
CNTDLOAD_R <= 1'b0;
CNTDSTORE_R <= 1'b0;
end
else begin
CNTINST_R <= ~(RHOLD | ISTALLIF);

CNTIMISS_R <= IMISS;
CNTISTALL_R <= X_HALT_R[`IC_HALT_S_INDEX] | X_HALT_R[`IW_HALT_S_INDEX];
CNTDMISS_R <= DMISS;
CNTDSTALL_R <= X_HALT_R[`DC_HALT_W_INDEX] | X_HALT_R[`DC_HALT_M_INDEX] | X_HALT_R[`DW_HALT_W_INDEX] | X_HALT_R[`CBUS_HALT_W_INDEX] ;
CNTDLOAD_R <= CNTDLOAD_P & ~(RHOLD | ISTALLIF);
CNTDSTORE_R <= CNTDSTORE_P & ~(RHOLD | ISTALLIF);

end





endmodule







