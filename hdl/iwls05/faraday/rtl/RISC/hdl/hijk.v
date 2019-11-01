



















































































`include "../include/lxr_symbols.vh"

module ejtag_async

















(

OUT,

IN, CLK, RESET_N
);

input IN;
input CLK;
input RESET_N;

output OUT;

reg REG_D1_R;
reg REG_D2_R;

assign OUT = REG_D2_R;

always @ (posedge CLK `negedge_RESET_N_)
if (~RESET_N) begin
REG_D1_R <= 1'b0;
REG_D2_R <= 1'b0;
end
else begin
REG_D1_R <= IN;
REG_D2_R <= REG_D1_R;
end

endmodule
