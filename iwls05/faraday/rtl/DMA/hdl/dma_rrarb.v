






































`include "DMA_DEFINE.vh" 

module dma_rrarb 
( 
HCLK, 
HRSTn, 
vld_req, 
gnt_chno, 
next_ch 
); 

input HCLK; 
input HRSTn; 
input [`DMA_MAX_CHNO-1:0] vld_req; 
output [`DMA_CHNO_WIDTH-1:0] gnt_chno; 
input next_ch; 

parameter 
grant0 = 'h0, 
grant1 = 'h1, 
grant2 = 'h2, 
grant3 = 'h3, 
grant4 = 'h4, 
grant5 = 'h5, 
grant6 = 'h6, 
grant7 = 'h7 
; 

reg [`DMA_CHNO_WIDTH-1:0] state, next_state; 

assign gnt_chno = state; 

always@(posedge HCLK or negedge HRSTn) 
if(!HRSTn) state <= grant0; 
else state <= next_state; 

always@(state or vld_req or next_ch) 
begin 
case(state) 
grant0: 
if(next_ch) 
begin 
`ifdef DMA_HAVE_CH1 
if(vld_req[1]) next_state = grant1; 
else 
`endif 
`ifdef DMA_HAVE_CH2 
if(vld_req[2]) next_state = grant2; 
else 
`endif 
`ifdef DMA_HAVE_CH3 
if(vld_req[3]) next_state = grant3; 
else 
`endif 
`ifdef DMA_HAVE_CH4 
if(vld_req[4]) next_state = grant4; 
else 
`endif 
`ifdef DMA_HAVE_CH5 
if(vld_req[5]) next_state = grant5; 
else 
`endif 
`ifdef DMA_HAVE_CH6 
if(vld_req[6]) next_state = grant6; 
else 
`endif 
`ifdef DMA_HAVE_CH7 
if(vld_req[7]) next_state = grant7; 
else 
`endif 
next_state = state; 
end 
else next_state = state; 

`ifdef DMA_HAVE_CH1 
grant1: 
if(next_ch) 
begin 
`ifdef DMA_HAVE_CH2 
if(vld_req[2]) next_state = grant2; 
else 
`endif 
`ifdef DMA_HAVE_CH3 
if(vld_req[3]) next_state = grant3; 
else 
`endif 
`ifdef DMA_HAVE_CH4 
if(vld_req[4]) next_state = grant4; 
else 
`endif 
`ifdef DMA_HAVE_CH5 
if(vld_req[5]) next_state = grant5; 
else 
`endif 
`ifdef DMA_HAVE_CH6 
if(vld_req[6]) next_state = grant6; 
else 
`endif 
`ifdef DMA_HAVE_CH7 
if(vld_req[7]) next_state = grant7; 
else 
`endif 
if(vld_req[0]) next_state = grant0; 
else next_state = state; 
end 
else next_state = state; 
`endif 

`ifdef DMA_HAVE_CH2 
grant2: 
if(next_ch) 
begin 
`ifdef DMA_HAVE_CH3 
if(vld_req[3]) next_state = grant3; 
else 
`endif 
`ifdef DMA_HAVE_CH4 
if(vld_req[4]) next_state = grant4; 
else 
`endif 
`ifdef DMA_HAVE_CH5 
if(vld_req[5]) next_state = grant5; 
else 
`endif 
`ifdef DMA_HAVE_CH6 
if(vld_req[6]) next_state = grant6; 
else 
`endif 
`ifdef DMA_HAVE_CH7 
if(vld_req[7]) next_state = grant7; 
else 
`endif 
if(vld_req[0]) next_state = grant0; 
else if(vld_req[1]) next_state = grant1; 
else next_state = state; 
end 
else next_state = state; 
`endif 

`ifdef DMA_HAVE_CH3 
grant3: 
if(next_ch) 
begin 
`ifdef DMA_HAVE_CH4 
if(vld_req[4]) next_state = grant4; 
else 
`endif 
`ifdef DMA_HAVE_CH5 
if(vld_req[5]) next_state = grant5; 
else 
`endif 
`ifdef DMA_HAVE_CH6 
if(vld_req[6]) next_state = grant6; 
else 
`endif 
`ifdef DMA_HAVE_CH7 
if(vld_req[7]) next_state = grant7; 
else 
`endif 
if(vld_req[0]) next_state = grant0; 
else if(vld_req[1]) next_state = grant1; 
else if(vld_req[2]) next_state = grant2; 
else next_state = state; 
end 
else next_state = state; 
`endif 

`ifdef DMA_HAVE_CH4 
grant4: 
if(next_ch) 
begin 
`ifdef DMA_HAVE_CH5 
if(vld_req[5]) next_state = grant5; 
else 
`endif 
`ifdef DMA_HAVE_CH6 
if(vld_req[6]) next_state = grant6; 
else 
`endif 
`ifdef DMA_HAVE_CH7 
if(vld_req[7]) next_state = grant7; 
else 
`endif 
if(vld_req[0]) next_state = grant0; 
else if(vld_req[1]) next_state = grant1; 
else if(vld_req[2]) next_state = grant2; 
else if(vld_req[3]) next_state = grant3; 
else next_state = state; 
end 
else next_state = state; 
`endif 

`ifdef DMA_HAVE_CH5 
grant5: 
if(next_ch) 
begin 
`ifdef DMA_HAVE_CH6 
if(vld_req[6]) next_state = grant6; 
else 
`endif 
`ifdef DMA_HAVE_CH7 
if(vld_req[7]) next_state = grant7; 
else 
`endif 
if(vld_req[0]) next_state = grant0; 
else if(vld_req[1]) next_state = grant1; 
else if(vld_req[2]) next_state = grant2; 
else if(vld_req[3]) next_state = grant3; 
else if(vld_req[4]) next_state = grant4; 
else next_state = state; 
end 
else next_state = state; 
`endif 

`ifdef DMA_HAVE_CH6 
grant6: 
if(next_ch) 
begin 
`ifdef DMA_HAVE_CH7 
if(vld_req[7]) next_state = grant7; 
else 
`endif 
if(vld_req[0]) next_state = grant0; 
else if(vld_req[1]) next_state = grant1; 
else if(vld_req[2]) next_state = grant2; 
else if(vld_req[3]) next_state = grant3; 
else if(vld_req[4]) next_state = grant4; 
else if(vld_req[5]) next_state = grant5; 
else next_state = state; 
end 
else next_state = state; 
`endif 

`ifdef DMA_HAVE_CH7 
grant7: 
if(next_ch) 
begin 
if(vld_req[0]) next_state = grant0; 
else if(vld_req[1]) next_state = grant1; 
else if(vld_req[2]) next_state = grant2; 
else if(vld_req[3]) next_state = grant3; 
else if(vld_req[4]) next_state = grant4; 
else if(vld_req[5]) next_state = grant5; 
else if(vld_req[6]) next_state = grant6; 
else next_state = state; 
end 
else next_state = state; 
`endif 

endcase 
end 

endmodule 

