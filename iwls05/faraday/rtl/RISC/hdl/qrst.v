module ejtag_setclr 


















( 

SETQ, CLRQ, 

SET, SETCLK, SETRST_N, CLR, CLRCLK, CLRRST_N 
); 


input SET; 
input SETCLK; 
input SETRST_N; 

input CLR; 
input CLRCLK; 
input CLRRST_N; 

output SETQ; 
output CLRQ; 

wire clear_onetoset; 
wire set_zerotoclear; 
wire set_pulse; 
wire clr_pulse; 
wire set_toggle; 
wire clr_toggle; 


ejtag_edge2pulse set_edge2pulse 
( 
.EDGE_ (SET), 
.PULSE_ (set_pulse), 
.CLOCK (SETCLK), 
.RESET_N (SETRST_N) 
); 

ejtag_edge2pulse clr_edge2pulse 
( 
.EDGE_ (CLR), 
.PULSE_ (clr_pulse), 
.CLOCK (CLRCLK), 
.RESET_N (CLRRST_N) 
); 

ejtag_rsflop onetoset 
( 
.Q (SETQ), 
.SET (set_pulse), 
.CLR (clear_onetoset), 
.CLOCK (SETCLK), 
.RESET_N (SETRST_N) 
); 


ejtag_rsflop zerotoclear 
( 
.Q (CLRQ), 
.SET (set_zerotoclear), 
.CLR (clr_pulse), 
.CLOCK (CLRCLK), 
.RESET_N (CLRRST_N) 
); 

ejtag_edge2toggle set_edge2toggle 
( 
.EDGE_ (SET), 
.TOGGLE_ (set_toggle), 
.CLOCK (SETCLK), 
.RESET_N (SETRST_N) 
); 

ejtag_toggle2pulse set_toggle2edge 
( 
.TOGGLE_ (set_toggle), 
.PULSE_ (set_zerotoclear), 
.CLOCK (CLRCLK), 
.RESET_N (CLRRST_N) 
); 

ejtag_edge2toggle clr_edge2toggle 
( 
.EDGE_ (CLR), 
.TOGGLE_ (clr_toggle), 
.CLOCK (CLRCLK), 
.RESET_N (CLRRST_N) 
); 

ejtag_toggle2pulse clr_toggle2edge 
( 
.TOGGLE_ (clr_toggle), 
.PULSE_ (clear_onetoset), 
.CLOCK (SETCLK), 
.RESET_N (SETRST_N) 
); 

endmodule 




module ejtag_edge2pulse 
( 

PULSE_, 

EDGE_, CLOCK, RESET_N 
); 

input EDGE_; 

input CLOCK; 
input RESET_N; 

output PULSE_; 

reg D1_R; 


assign PULSE_ = EDGE_ & ~D1_R; 

always @(posedge CLOCK or negedge RESET_N) begin 
if (!RESET_N) begin 
D1_R <= 1'b0; 
end 
else begin 
D1_R <= EDGE_; 
end 
end 
endmodule 


module ejtag_edge2toggle 
( 

TOGGLE_, 

EDGE_, CLOCK, RESET_N 
); 


parameter WIDTH = 1; 

input [WIDTH:1] EDGE_; 

input CLOCK; 
input RESET_N; 

output [WIDTH:1] TOGGLE_; 

reg [WIDTH:1] D1_R; 
reg [WIDTH:1] Toggle_R; 
wire [WIDTH:1] Toggle_P; 



assign Toggle_P = ((EDGE_ & ~D1_R) & ~Toggle_R) | 
(~(EDGE_ & ~D1_R) & Toggle_R); 
assign TOGGLE_ = Toggle_R; 

always @(posedge CLOCK or negedge RESET_N) begin 
if (!RESET_N) begin 
D1_R <= {WIDTH {1'b0}}; 
Toggle_R <= {WIDTH {1'b0}}; 
end 
else begin 
D1_R <= EDGE_; 
Toggle_R <= Toggle_P; 
end 
end 
endmodule 


module ejtag_toggle2pulse 
( 

PULSE_, 

TOGGLE_, CLOCK, RESET_N 
); 


parameter WIDTH = 1; 

input [WIDTH:1] TOGGLE_; 

input CLOCK; 
input RESET_N; 

output [WIDTH:1] PULSE_; 

reg [WIDTH:1] Toggle_D0_R; 
reg [WIDTH:1] Toggle_D1_R; 
reg [WIDTH:1] Toggle_D2_R; 




assign PULSE_ = Toggle_D1_R ^ Toggle_D2_R; 

always @(posedge CLOCK or negedge RESET_N) begin 
if (!RESET_N) begin 
Toggle_D0_R <= {WIDTH {1'b0}}; 
Toggle_D1_R <= {WIDTH {1'b0}}; 
Toggle_D2_R <= {WIDTH {1'b0}}; 

end 
else begin 
Toggle_D0_R <= TOGGLE_; 
Toggle_D1_R <= Toggle_D0_R; 
Toggle_D2_R <= Toggle_D1_R; 

end 
end 
endmodule 


module ejtag_rsflop 
( 

Q, 

SET, CLR, CLOCK, RESET_N 
); 

input SET; 
input CLR; 

input CLOCK; 
input RESET_N; 

output Q; 

reg Flop_R; 
wire Flop_P; 


assign Flop_P = (SET | Flop_R) & ~CLR; 
assign Q = Flop_R; 

always @(posedge CLOCK or negedge RESET_N) begin 
if (!RESET_N) begin 
Flop_R <= 1'b0; 
end 
else begin 
Flop_R <= Flop_P; 
end 
end 
endmodule 

