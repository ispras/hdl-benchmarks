module MUX_IO( 

D_CLKI_OSC, 
D_RSTn, 
D_ICK, 
D_IRQ2n, 
D_IRQL1n, 
D_IRQE1n, 
D_IRQE0n, 
D_RD0, 
D_RD1, 
D_IAD_di, 
`ifdef FD_DFT 
D_DFT_en, 
`endif 

`ifdef FD_DFT 
WP_SO, 
TC_SO, 
VC_SO, 
`endif 
TD0, 
TD1, 
IAD_oe, 
IAD_do, 


D_TD0, 
D_TD1, 
D_IAD_do, 
IAD_oex, 

T_CLKI_OSC, 
T_RSTn, 
T_ICK, 
T_IRQ2n, 
T_IRQL1n, 
T_IRQE1n, 
T_IRQE0n, 
T_RD0, 
T_RD1, 
PM_bdry_sel, 
T_IAD 
`ifdef FD_DFT 
, 
TEST_CLK, 
TEST_RST, 
TCLK, 
VC_SHIFT, 
TC_UPDATE, 
TC_SHIFT, 
TC_SI, 
WP_SI, 
WP_CLK, 
TC_RESET, 
VC_SI 
`endif 
); 


input D_CLKI_OSC, 
D_RSTn, 
D_ICK, 
D_IRQ2n, 
D_IRQL1n, 
D_IRQE1n, 
D_IRQE0n, 
D_RD0, 
D_RD1; 
input [15:0] D_IAD_di; 

`ifdef FD_DFT 
input D_DFT_en; 
`endif 


`ifdef FD_DFT 
input WP_SO, 
TC_SO; 
input [7:0] VC_SO; 
`endif 

input TD0, 
TD1, 
IAD_oe; 

input [15:0] IAD_do; 



output D_TD0, 
D_TD1, 
IAD_oex; 

output [15:0] D_IAD_do; 


output T_CLKI_OSC, 
T_RSTn, 
T_ICK, 
T_IRQ2n, 
T_IRQL1n, 
T_IRQE1n, 
T_IRQE0n, 
T_RD0, 
T_RD1, 
PM_bdry_sel; 

output [15:0] T_IAD; 

`ifdef FD_DFT 
output TEST_CLK, 
TEST_RST, 
TCLK, 
VC_SHIFT, 
TC_UPDATE, 
TC_SHIFT, 
TC_SI, 
WP_SI, 
WP_CLK, 
TC_RESET; 
output [7:0] VC_SI; 
`endif 




`ifdef FD_DFT 
assign T_CLKI_OSC = !D_DFT_en && D_CLKI_OSC; 
assign TEST_CLK = D_DFT_en && D_CLKI_OSC; 

assign T_RSTn = !D_DFT_en && D_RSTn; 
assign TEST_RST = D_DFT_en && D_RSTn; 

assign T_ICK = !D_DFT_en && D_ICK; 
assign TCLK = D_DFT_en && D_ICK; 

assign T_IRQ2n = !D_DFT_en && D_IRQ2n; 
assign VC_SHIFT = D_DFT_en && D_IRQ2n; 

assign T_IRQL1n = !D_DFT_en && D_IRQL1n; 
assign TC_UPDATE = D_DFT_en && D_IRQL1n; 

assign T_IRQE1n = !D_DFT_en && D_IRQE1n; 
assign TC_SHIFT = D_DFT_en && D_IRQE1n; 

assign T_IRQE0n = !D_DFT_en && D_IRQE0n; 
assign TC_SI = D_DFT_en && D_IRQE0n; 

assign T_RD0 = !D_DFT_en && D_RD0; 
assign WP_SI = D_DFT_en && D_RD0; 

assign T_RD1 = !D_DFT_en && D_RD1; 
assign WP_CLK = D_DFT_en && D_RD1; 

assign TC_RESET = !D_RSTn; 

`else 
assign T_RSTn = D_RSTn; 
assign T_CLKI_OSC = D_CLKI_OSC; 
assign T_IRQ2n = D_IRQ2n; 
assign T_IRQL1n = D_IRQL1n; 
assign T_IRQE1n = D_IRQE1n; 
assign T_IRQE0n = D_IRQE0n; 
assign T_RD0 = D_RD0; 
assign T_RD1 = D_RD1; 
assign T_ICK = D_ICK; 
`endif 



`ifdef FD_DFT 
assign D_TD0 = D_DFT_en ? WP_SO : TD0; 
assign D_TD1 = D_DFT_en ? TC_SO : TD1; 
`else 
assign D_TD0 = TD0; 
assign D_TD1 = TD1; 
`endif 




`ifdef FD_DFT 


assign D_IAD_do[15:8] = D_DFT_en ? VC_SO[7:0] : IAD_do[15:8]; 
assign D_IAD_do[7:0] = IAD_do[7:0]; 
assign IAD_oex = IAD_oe || D_DFT_en; 


assign T_IAD[15:8] = D_IAD_di[15:8]; 

assign T_IAD[7] = !D_DFT_en && D_IAD_di[7]; 
assign VC_SI[7] = D_DFT_en && D_IAD_di[7]; 

assign T_IAD[6] = !D_DFT_en && D_IAD_di[6]; 
assign VC_SI[6] = D_DFT_en && D_IAD_di[6]; 

assign T_IAD[5] = !D_DFT_en && D_IAD_di[5]; 
assign VC_SI[5] = D_DFT_en && D_IAD_di[5]; 

assign T_IAD[4] = !D_DFT_en && D_IAD_di[4]; 
assign VC_SI[4] = D_DFT_en && D_IAD_di[4]; 

assign T_IAD[3] = !D_DFT_en && D_IAD_di[3]; 
assign VC_SI[3] = D_DFT_en && D_IAD_di[3]; 

assign T_IAD[2] = !D_DFT_en && D_IAD_di[2]; 
assign VC_SI[2] = D_DFT_en && D_IAD_di[2]; 

assign T_IAD[1] = !D_DFT_en && D_IAD_di[1]; 
assign VC_SI[1] = D_DFT_en && D_IAD_di[1]; 

assign T_IAD[0] = !D_DFT_en && D_IAD_di[0]; 
assign VC_SI[0] = D_DFT_en && D_IAD_di[0]; 

`else 
assign D_IAD_do[15:0] = IAD_do[15:0]; 
assign IAD_oex = IAD_oe; 
assign T_IAD[15:0] = D_IAD_di[15:0]; 
`endif 


`ifdef FD_PM8K 
assign PM_bdry_sel = 1'b1; 
`else 
assign PM_bdry_sel = 1'b0; 
`endif 

endmodule 

