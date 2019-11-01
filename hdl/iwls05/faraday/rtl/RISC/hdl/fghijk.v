























































































`include "../include/lxr_symbols.vh"



module lmi_watchd



(
CLK,
TMODE,
RESET_D1_R_N,
X_HALT_R,
C_IADDR_A,
IX_MISS_S_R,
IX_VAL,
DC_MISS_W_R,
DC_VAL,

LW_IADDR_S_R,
anyIMiss_S, anyIVal,
anyDMiss_W, anyDVal,
anyIBusy, anyDBusy
);


input CLK;
input TMODE;
input RESET_D1_R_N;

input [`HALT_SIG_RANGE] X_HALT_R;

input [31:0] C_IADDR_A;

input [1:0] IX_MISS_S_R;
input [1:0] IX_VAL;

input DC_MISS_W_R;
input DC_VAL;

output [31:0] LW_IADDR_S_R;

output anyIMiss_S;
output anyIVal;

output anyDMiss_W;
output anyDVal;

output anyIBusy;
output anyDBusy;

reg [31:0] IADDR_I_R;
reg [31:0] LW_IADDR_S_R;

reg InitialCycle_R;

wire [31:0] IADDR_I_P;



reg RESET_X_R_N;
always @ (posedge CLK)


RESET_X_R_N <= RESET_D1_R_N;


wire RESET_D2_R_N = RESET_X_R_N | TMODE;





wire NC_FOO = TMODE;



wire [31:0] LW_IADDR_S_P;





wire anyIMiss_S = |IX_MISS_S_R;
wire anyIVal = |IX_VAL;

wire anyDMiss_W = DC_MISS_W_R;
wire anyDVal = DC_VAL;

wire anyDBusy = | (X_HALT_R & ~`RALU_HALT_E_MASK);
wire anyIBusy = | X_HALT_R;


assign IADDR_I_P = (anyIBusy&~InitialCycle_R) ? IADDR_I_R : C_IADDR_A;

assign LW_IADDR_S_P = anyIBusy ? LW_IADDR_S_R : IADDR_I_R;




always @ (posedge CLK `negedge_RESET_D2_R_N_)
if (~`RESET_D2_R_N_)
begin
LW_IADDR_S_R <= 32'h0000_0000;
IADDR_I_R <= 32'h0000_0000;
InitialCycle_R <= 1'b1;
end
else
begin
LW_IADDR_S_R <= LW_IADDR_S_P;
IADDR_I_R <= IADDR_I_P;
InitialCycle_R <= 1'b0;
end


endmodule

