



















































































module ejtag_dclk






























































































(

EJT_DREN_R, EJT_DCLK,

CLK, CLK_N, CLKDELAYED, RESET_D1_R_N, RESET_DIS, CFG_EJTNMINUS1
);

`include "../include/lxr_symbols.vh"

`define DCLK_IDLE 2'b00
`define DCLK_STE1 2'b01
`define DCLK_STE2 2'b10
`define DCLK_STE3 2'b11








input CLK;
input CLK_N;
input CLKDELAYED;
input RESET_D1_R_N;

input RESET_DIS;

input [1:0] CFG_EJTNMINUS1;

output EJT_DREN_R;
output EJT_DCLK;




wire EJT_DCLK;



reg EJT_DREN_R;




wire RESET_D2_R_N;

reg [1:0] DclkState_R;


wire [1:0] CFG_EJTNMINUS1_C1;


reg DCLK2_R;
reg DCLK4_R;
reg DCLK3pedge_R;
reg DCLK3nedge_P_R;
reg DCLK3nedge_NR;



reg [1:0] DclkState_P;
reg EJT_DREN_P;

reg DCLK2_P;
reg DCLK4_P;
reg DCLK3pedge_P;
reg DCLK3nedge_P2;

wire Neq1;
wire Neq2;
wire Neq3;
wire Neq4;

wire DCLK1AndN1;
wire DCLK124_N;
wire DCLK3_N;



assign CFG_EJTNMINUS1_C1 = CFG_EJTNMINUS1;


assign Neq1 = ~CFG_EJTNMINUS1_C1[1] & ~CFG_EJTNMINUS1_C1[0];
assign Neq2 = ~CFG_EJTNMINUS1_C1[1] & CFG_EJTNMINUS1_C1[0];
assign Neq3 = CFG_EJTNMINUS1_C1[1] & ~CFG_EJTNMINUS1_C1[0];
assign Neq4 = CFG_EJTNMINUS1_C1[1] & CFG_EJTNMINUS1_C1[0];



ejtag_dclkand2 anddclk1 (DCLK1AndN1, Neq1, CLKDELAYED);

ejtag_dclknr3 norclk124 (DCLK124_N, DCLK1AndN1, DCLK2_R, DCLK4_R);
ejtag_dclknr3 norclk3 (DCLK3_N, DCLK3pedge_R, DCLK3nedge_NR, 1'b0);

ejtag_dclknd2 nandclk (EJT_DCLK, DCLK124_N, DCLK3_N);


always @(DclkState_R or Neq1 or Neq2 or Neq3 or Neq4) begin

casex (DclkState_R)
`DCLK_IDLE: begin
DclkState_P = Neq1 ? `DCLK_IDLE : `DCLK_STE1;
EJT_DREN_P = Neq1 | Neq2;
DCLK2_P = 0;
DCLK3pedge_P = 0;
DCLK3nedge_P2 = 0;
DCLK4_P = Neq4;
end

`DCLK_STE1: begin
DclkState_P = Neq2 ? `DCLK_IDLE : `DCLK_STE2;
EJT_DREN_P = Neq3;
DCLK2_P = Neq2;
DCLK3pedge_P = 0;
DCLK3nedge_P2 = 0;
DCLK4_P = 0;
end

`DCLK_STE2: begin
DclkState_P = Neq3 ? `DCLK_IDLE : `DCLK_STE3;
EJT_DREN_P = Neq4;
DCLK2_P = 0;
DCLK3pedge_P = Neq3;
DCLK3nedge_P2 = Neq3;
DCLK4_P = 0;
end

`DCLK_STE3: begin
DclkState_P = `DCLK_IDLE ;
EJT_DREN_P = 0;
DCLK2_P = 0;
DCLK3pedge_P = 0;
DCLK3nedge_P2 = 0;
DCLK4_P = Neq4;
end

endcase
end



wire NC_TRESET_DIS = RESET_DIS;








reg RESET_X_R_N;
always @ (posedge CLK)
RESET_X_R_N <= RESET_D1_R_N;
assign RESET_D2_R_N = RESET_X_R_N | RESET_DIS;








always @(posedge CLK_N `negedge_RESET_D2_R_N_) begin

if (~`RESET_D2_R_N_) begin

DCLK3nedge_NR <= 0;

end
else begin


DCLK3nedge_NR <= DCLK3nedge_P_R;

end
end

always @(posedge CLK `negedge_RESET_D2_R_N_) begin

if (~`RESET_D2_R_N_) begin

DclkState_R <= `DCLK_IDLE;

EJT_DREN_R <= 0;

DCLK2_R <= 0;
DCLK4_R <= 0;
DCLK3pedge_R <= 0;
DCLK3nedge_P_R <= 0;

end
else begin

DclkState_R <= DclkState_P;

EJT_DREN_R <= EJT_DREN_P;

DCLK2_R <= DCLK2_P;
DCLK4_R <= DCLK4_P;
DCLK3pedge_R <= DCLK3pedge_P;
DCLK3nedge_P_R <= DCLK3nedge_P2;

end
end



endmodule

module ejtag_dclkand2 (OUT, IN1, IN2);
output OUT;
input IN1, IN2;

assign OUT = (IN1 & IN2);

endmodule

module ejtag_dclknr3 (OUT, IN1, IN2, IN3);
output OUT;
input IN1, IN2, IN3;

assign OUT = ~(IN1 | IN2 | IN3);

endmodule

module ejtag_dclknd2 (OUT, IN1, IN2);
output OUT;
input IN1, IN2;

assign OUT = ~(IN1 & IN2);

endmodule

