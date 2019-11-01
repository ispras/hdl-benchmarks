







































`include "DMA_DEFINE.vh" 

module dma_chsel 
( 
HCLK, HRSTn, 


dma_req, dma_ack, dma_tc, 


csr, sync, 



de_err_notify, 
c0csr, c0cfg, c0sad, c0dad, 
`ifdef DMA_HAVE_LINKLIST 
c0llp, 
`endif 
c0tsz, c0abt, 
`ifdef DMA_HAVE_LINKLIST 
c0llpen, 
`endif 
`ifdef DMA_HAVE_CH1 
c1csr, c1cfg, c1sad, c1dad, 
`ifdef DMA_HAVE_LINKLIST 
c1llp, 
`endif 
c1tsz, c1abt, 
`ifdef DMA_HAVE_LINKLIST 
c1llpen, 
`endif 
`endif 

`ifdef DMA_HAVE_CH2 
c2csr, c2cfg, c2sad, c2dad, 
`ifdef DMA_HAVE_LINKLIST 
c2llp, 
`endif 
c2tsz, c2abt, 
`ifdef DMA_HAVE_LINKLIST 
c2llpen, 
`endif 
`endif 

`ifdef DMA_HAVE_CH3 
c3csr, c3cfg, c3sad, c3dad, 
`ifdef DMA_HAVE_LINKLIST 
c3llp, 
`endif 
c3tsz, c3abt, 
`ifdef DMA_HAVE_LINKLIST 
c3llpen, 
`endif 
`endif 

`ifdef DMA_HAVE_CH4 
c4csr, c4cfg, c4sad, c4dad, 
`ifdef DMA_HAVE_LINKLIST 
c4llp, 
`endif 
c4tsz, c4abt, 
`ifdef DMA_HAVE_LINKLIST 
c4llpen, 
`endif 
`endif 

`ifdef DMA_HAVE_CH5 
c5csr, c5cfg, c5sad, c5dad, 
`ifdef DMA_HAVE_LINKLIST 
c5llp, 
`endif 
c5tsz, c5abt, 
`ifdef DMA_HAVE_LINKLIST 
c5llpen, 
`endif 
`endif 

`ifdef DMA_HAVE_CH6 
c6csr, c6cfg, c6sad, c6dad, 
`ifdef DMA_HAVE_LINKLIST 
c6llp, 
`endif 
c6tsz, c6abt, 
`ifdef DMA_HAVE_LINKLIST 
c6llpen, 
`endif 
`endif 

`ifdef DMA_HAVE_CH7 
c7csr, c7cfg, c7sad, c7dad, 
`ifdef DMA_HAVE_LINKLIST 
c7llp, 
`endif 
c7tsz, c7abt, 
`ifdef DMA_HAVE_LINKLIST 
c7llpen, 
`endif 
`endif 


arb_ch_sel, 
arb_chcsr, arb_chsad, arb_chdad, 
`ifdef DMA_HAVE_LINKLIST 
arb_chllp, 
`endif 
arb_chtsz, arb_chabt, 
`ifdef DMA_HAVE_LINKLIST 
arb_chllpen, 
`endif 

arb_abt_any, 


de_ack, 


de_stup, 

de_st_idle, 

de_abt_on_idle, 

tsz_eq0, 

arb_req 
); 

input HCLK, HRSTn; 
input [`DMA_MAX_CHNO-1:0] dma_req; 
output [`DMA_MAX_CHNO-1:0] dma_ack; 
output [`DMA_MAX_CHNO-1:0] dma_tc; 

input [`DMA_CSR_WIDTH-1:0] csr; 
input [`DMA_MAX_CHNO-1:0] sync; 



input de_err_notify; 

input [`DMA_CHCSR_WIDTH-1:0] c0csr; 
input [`DMA_CHCFG_WIDTH-1:0] c0cfg; 
input [`DMA_HADDR_WIDTH-1:0] c0sad; 
input [`DMA_HADDR_WIDTH-1:0] c0dad; 
`ifdef DMA_HAVE_LINKLIST 
input [`DMA_HADDR_WIDTH-1:0] c0llp; 
`endif 
input [`DMA_CHSZ_WIDTH-1:0] c0tsz; 
input c0abt; 
`ifdef DMA_HAVE_LINKLIST 
input c0llpen; 
`endif 

`ifdef DMA_HAVE_CH1 

input [`DMA_CHCSR_WIDTH-1:0] c1csr; 
input [`DMA_CHCFG_WIDTH-1:0] c1cfg; 
input [`DMA_HADDR_WIDTH-1:0] c1sad; 
input [`DMA_HADDR_WIDTH-1:0] c1dad; 
`ifdef DMA_HAVE_LINKLIST 
input [`DMA_HADDR_WIDTH-1:0] c1llp; 
`endif 
input [`DMA_CHSZ_WIDTH-1:0] c1tsz; 
input c1abt; 
`ifdef DMA_HAVE_LINKLIST 
input c1llpen; 
`endif 
`endif 

`ifdef DMA_HAVE_CH2 

input [`DMA_CHCSR_WIDTH-1:0] c2csr; 
input [`DMA_CHCFG_WIDTH-1:0] c2cfg; 
input [`DMA_HADDR_WIDTH-1:0] c2sad; 
input [`DMA_HADDR_WIDTH-1:0] c2dad; 
`ifdef DMA_HAVE_LINKLIST 
input [`DMA_HADDR_WIDTH-1:0] c2llp; 
`endif 
input [`DMA_CHSZ_WIDTH-1:0] c2tsz; 
input c2abt; 
`ifdef DMA_HAVE_LINKLIST 
input c2llpen; 
`endif 
`endif 

`ifdef DMA_HAVE_CH3 

input [`DMA_CHCSR_WIDTH-1:0] c3csr; 
input [`DMA_CHCFG_WIDTH-1:0] c3cfg; 
input [`DMA_HADDR_WIDTH-1:0] c3sad; 
input [`DMA_HADDR_WIDTH-1:0] c3dad; 
`ifdef DMA_HAVE_LINKLIST 
input [`DMA_HADDR_WIDTH-1:0] c3llp; 
`endif 
input [`DMA_CHSZ_WIDTH-1:0] c3tsz; 
input c3abt; 
`ifdef DMA_HAVE_LINKLIST 
input c3llpen; 
`endif 
`endif 

`ifdef DMA_HAVE_CH4 

input [`DMA_CHCSR_WIDTH-1:0] c4csr; 
input [`DMA_CHCFG_WIDTH-1:0] c4cfg; 
input [`DMA_HADDR_WIDTH-1:0] c4sad; 
input [`DMA_HADDR_WIDTH-1:0] c4dad; 
`ifdef DMA_HAVE_LINKLIST 
input [`DMA_HADDR_WIDTH-1:0] c4llp; 
`endif 
input [`DMA_CHSZ_WIDTH-1:0] c4tsz; 
input c4abt; 
`ifdef DMA_HAVE_LINKLIST 
input c4llpen; 
`endif 
`endif 

`ifdef DMA_HAVE_CH5 

input [`DMA_CHCSR_WIDTH-1:0] c5csr; 
input [`DMA_CHCFG_WIDTH-1:0] c5cfg; 
input [`DMA_HADDR_WIDTH-1:0] c5sad; 
input [`DMA_HADDR_WIDTH-1:0] c5dad; 
`ifdef DMA_HAVE_LINKLIST 
input [`DMA_HADDR_WIDTH-1:0] c5llp; 
`endif 
input [`DMA_CHSZ_WIDTH-1:0] c5tsz; 
input c5abt; 
`ifdef DMA_HAVE_LINKLIST 
input c5llpen; 
`endif 
`endif 

`ifdef DMA_HAVE_CH6 

input [`DMA_CHCSR_WIDTH-1:0] c6csr; 
input [`DMA_CHCFG_WIDTH-1:0] c6cfg; 
input [`DMA_HADDR_WIDTH-1:0] c6sad; 
input [`DMA_HADDR_WIDTH-1:0] c6dad; 
`ifdef DMA_HAVE_LINKLIST 
input [`DMA_HADDR_WIDTH-1:0] c6llp; 
`endif 
input [`DMA_CHSZ_WIDTH-1:0] c6tsz; 
input c6abt; 
`ifdef DMA_HAVE_LINKLIST 
input c6llpen; 
`endif 
`endif 

`ifdef DMA_HAVE_CH7 

input [`DMA_CHCSR_WIDTH-1:0] c7csr; 
input [`DMA_CHCFG_WIDTH-1:0] c7cfg; 
input [`DMA_HADDR_WIDTH-1:0] c7sad; 
input [`DMA_HADDR_WIDTH-1:0] c7dad; 
`ifdef DMA_HAVE_LINKLIST 
input [`DMA_HADDR_WIDTH-1:0] c7llp; 
`endif 
input [`DMA_CHSZ_WIDTH-1:0] c7tsz; 
input c7abt; 
`ifdef DMA_HAVE_LINKLIST 
input c7llpen; 
`endif 
`endif 


output [`DMA_CHCSR_WIDTH-1:0] arb_chcsr; 
output [`DMA_HADDR_WIDTH-1:0] arb_chsad; 
output [`DMA_HADDR_WIDTH-1:0] arb_chdad; 
`ifdef DMA_HAVE_LINKLIST 
output [`DMA_HADDR_WIDTH-1:0] arb_chllp; 
`endif 
output [`DMA_CHSZ_WIDTH-1:0] arb_chtsz; 
output arb_chabt; 
`ifdef DMA_HAVE_LINKLIST 
output arb_chllpen; 
`endif 
output arb_abt_any; 

output [`DMA_CHNO_WIDTH-1:0] arb_ch_sel; 


input de_ack; 


input de_stup; 

input de_st_idle; 

input de_abt_on_idle; 

input tsz_eq0; 

output arb_req; 

wire [`DMA_PRI_WIDTH-1:0] ch0pri, ch1pri, ch2pri, ch3pri; 
wire [`DMA_PRI_WIDTH-1:0] ch4pri, ch5pri, ch6pri, ch7pri; 

wire [`DMA_MAX_CHNO-1:0] abnormal; 
wire [`DMA_MAX_CHNO-1:0] dma_reqs; 
wire [`DMA_MAX_CHNO-1:0] hwvld_req; 
wire [`DMA_MAX_CHNO-1:0] vld_req; 




wire [`DMA_PRI_LEVEL-1:0] chfpri_nx; 

wire vld_req_any; 
wire [`DMA_MAX_CHNO-1:0] dmaack_nx; 
wire [`DMA_MAX_CHNO-1:0] dmatc_nx; 
wire [`DMA_MAX_CHNO-1:0] vld_req_p0, vld_req_p1; 
wire [`DMA_MAX_CHNO-1:0] vld_req_p2, vld_req_p3; 
wire [`DMA_CHNO_WIDTH-1:0] gnt_p0, gnt_p1, gnt_p2, gnt_p3; 
wire next_ch; 
wire ch_sel0,ch_sel1,ch_sel2,ch_sel3; 
wire ch_sel4,ch_sel5,ch_sel6,ch_sel7; 

wire dma_tc_st1; 

reg [`DMA_PRI_LEVEL-1:0] ch0fpri; 
`ifdef DMA_HAVE_CH1 
reg [`DMA_PRI_LEVEL-1:0] ch1fpri; 
`endif 
`ifdef DMA_HAVE_CH2 
reg [`DMA_PRI_LEVEL-1:0] ch2fpri; 
`endif 
`ifdef DMA_HAVE_CH3 
reg [`DMA_PRI_LEVEL-1:0] ch3fpri; 
`endif 
`ifdef DMA_HAVE_CH4 
reg [`DMA_PRI_LEVEL-1:0] ch4fpri; 
`endif 
`ifdef DMA_HAVE_CH5 
reg [`DMA_PRI_LEVEL-1:0] ch5fpri; 
`endif 
`ifdef DMA_HAVE_CH6 
reg [`DMA_PRI_LEVEL-1:0] ch6fpri; 
`endif 
`ifdef DMA_HAVE_CH7 
reg [`DMA_PRI_LEVEL-1:0] ch7fpri; 
`endif 

reg [`DMA_PRI_WIDTH-1:0] fix_pri_sel; 
reg [`DMA_CHNO_WIDTH-1:0] arb_ch_sel; 
reg vld_req_any_d1; 

reg [`DMA_MAX_CHNO-1:0] dma_reqd1,dma_reqd2; 
reg [`DMA_MAX_CHNO-1:0] dma_ack; 
reg [`DMA_MAX_CHNO-1:0] dma_tc; 




reg [`DMA_CHCSR_WIDTH-8:0] arb_chcsr_reg; 
reg [`DMA_CHCSR_WIDTH-1:0] arb_chcsri; 

reg [`DMA_HADDR_WIDTH-1:0] arb_chsad; 
reg [`DMA_HADDR_WIDTH-1:0] arb_chdad; 
`ifdef DMA_HAVE_LINKLIST 
reg [`DMA_HADDR_WIDTH-1:0] arb_chllp; 
`endif 
reg [`DMA_CHSZ_WIDTH-1:0] arb_chtsz; 
reg arb_chabt; 
`ifdef DMA_HAVE_LINKLIST 
reg arb_chllpen; 
`endif 

reg arb_req,de_stup_d1; 

assign ch0pri = c0csr[`DMA_CHCSR_PRI]; 
`ifdef DMA_HAVE_CH1 
assign ch1pri = c1csr[`DMA_CHCSR_PRI]; 
`endif 
`ifdef DMA_HAVE_CH2 
assign ch2pri = c2csr[`DMA_CHCSR_PRI]; 
`endif 
`ifdef DMA_HAVE_CH3 
assign ch3pri = c3csr[`DMA_CHCSR_PRI]; 
`endif 
`ifdef DMA_HAVE_CH4 
assign ch4pri = c4csr[`DMA_CHCSR_PRI]; 
`endif 
`ifdef DMA_HAVE_CH5 
assign ch5pri = c5csr[`DMA_CHCSR_PRI]; 
`endif 
`ifdef DMA_HAVE_CH6 
assign ch6pri = c6csr[`DMA_CHCSR_PRI]; 
`endif 
`ifdef DMA_HAVE_CH7 
assign ch7pri = c7csr[`DMA_CHCSR_PRI]; 
`endif 


always @(posedge HCLK) 
begin 
dma_reqd1[0] <= dma_req[0]; 
`ifdef DMA_HAVE_CH1 
dma_reqd1[1] <= dma_req[1]; 
`endif 
`ifdef DMA_HAVE_CH2 
dma_reqd1[2] <= dma_req[2]; 
`endif 
`ifdef DMA_HAVE_CH3 
dma_reqd1[3] <= dma_req[3]; 
`endif 
`ifdef DMA_HAVE_CH4 
dma_reqd1[4] <= dma_req[4]; 
`endif 
`ifdef DMA_HAVE_CH5 
dma_reqd1[5] <= dma_req[5]; 
`endif 
`ifdef DMA_HAVE_CH6 
dma_reqd1[6] <= dma_req[6]; 
`endif 
`ifdef DMA_HAVE_CH7 
dma_reqd1[7] <= dma_req[7]; 
`endif 
end 

always @(posedge HCLK) 
begin 
dma_reqd2[0] <= sync[0] & dma_reqd1[0]; 
`ifdef DMA_HAVE_CH1 
dma_reqd2[1] <= sync[1] & dma_reqd1[1]; 
`endif 
`ifdef DMA_HAVE_CH2 
dma_reqd2[2] <= sync[2] & dma_reqd1[2]; 
`endif 
`ifdef DMA_HAVE_CH3 
dma_reqd2[3] <= sync[3] & dma_reqd1[3]; 
`endif 
`ifdef DMA_HAVE_CH4 
dma_reqd2[4] <= sync[4] & dma_reqd1[4]; 
`endif 
`ifdef DMA_HAVE_CH5 
dma_reqd2[5] <= sync[5] & dma_reqd1[5]; 
`endif 
`ifdef DMA_HAVE_CH6 
dma_reqd2[6] <= sync[6] & dma_reqd1[6]; 
`endif 
`ifdef DMA_HAVE_CH7 
dma_reqd2[7] <= sync[7] & dma_reqd1[7]; 
`endif 
end 

assign dma_reqs[0] = sync[0]? dma_reqd2[0] : dma_reqd1[0]; 
`ifdef DMA_HAVE_CH1 
assign dma_reqs[1] = sync[1]? dma_reqd2[1] : dma_reqd1[1]; 
`endif 
`ifdef DMA_HAVE_CH2 
assign dma_reqs[2] = sync[2]? dma_reqd2[2] : dma_reqd1[2]; 
`endif 
`ifdef DMA_HAVE_CH3 
assign dma_reqs[3] = sync[3]? dma_reqd2[3] : dma_reqd1[3]; 
`endif 
`ifdef DMA_HAVE_CH4 
assign dma_reqs[4] = sync[4]? dma_reqd2[4] : dma_reqd1[4]; 
`endif 
`ifdef DMA_HAVE_CH5 
assign dma_reqs[5] = sync[5]? dma_reqd2[5] : dma_reqd1[5]; 
`endif 
`ifdef DMA_HAVE_CH6 
assign dma_reqs[6] = sync[6]? dma_reqd2[6] : dma_reqd1[6]; 
`endif 
`ifdef DMA_HAVE_CH7 
assign dma_reqs[7] = sync[7]? dma_reqd2[7] : dma_reqd1[7]; 
`endif 








assign hwvld_req[0] = dma_reqs[0] & ~dma_ack[0] & !((arb_ch_sel==0) & de_ack); 
`ifdef DMA_HAVE_CH1 
assign hwvld_req[1] = dma_reqs[1] & ~dma_ack[1] & !((arb_ch_sel==1) & de_ack); 
`endif 
`ifdef DMA_HAVE_CH2 
assign hwvld_req[2] = dma_reqs[2] & ~dma_ack[2] & !((arb_ch_sel==2) & de_ack); 
`endif 
`ifdef DMA_HAVE_CH3 
assign hwvld_req[3] = dma_reqs[3] & ~dma_ack[3] & !((arb_ch_sel==3) & de_ack); 
`endif 
`ifdef DMA_HAVE_CH4 
assign hwvld_req[4] = dma_reqs[4] & ~dma_ack[4] & !((arb_ch_sel==4) & de_ack); 
`endif 
`ifdef DMA_HAVE_CH5 
assign hwvld_req[5] = dma_reqs[5] & ~dma_ack[5] & !((arb_ch_sel==5) & de_ack); 
`endif 
`ifdef DMA_HAVE_CH6 
assign hwvld_req[6] = dma_reqs[6] & ~dma_ack[6] & !((arb_ch_sel==6) & de_ack); 
`endif 
`ifdef DMA_HAVE_CH7 
assign hwvld_req[7] = dma_reqs[7] & ~dma_ack[7] & !((arb_ch_sel==7) & de_ack); 
`endif 































assign vld_req[0] = csr[0]&c0csr[`DMA_CHCSR_EN]&~abnormal[0]&(~c0csr[`DMA_CHCSR_MOD] | 
(c0csr[`DMA_CHCSR_MOD]&hwvld_req[0])); 
`ifdef DMA_HAVE_CH1 






assign vld_req[1] = csr[0]&c1csr[`DMA_CHCSR_EN]&~abnormal[1]&(~c1csr[`DMA_CHCSR_MOD] | 
(c1csr[`DMA_CHCSR_MOD]&hwvld_req[1])); 

`endif 
`ifdef DMA_HAVE_CH2 






assign vld_req[2] = csr[0]&c2csr[`DMA_CHCSR_EN]&~abnormal[2]&(~c2csr[`DMA_CHCSR_MOD] | 
(c2csr[`DMA_CHCSR_MOD]&hwvld_req[2])); 

`endif 
`ifdef DMA_HAVE_CH3 






assign vld_req[3] = csr[0]&c3csr[`DMA_CHCSR_EN]&~abnormal[3]&(~c3csr[`DMA_CHCSR_MOD] | 
(c3csr[`DMA_CHCSR_MOD]&hwvld_req[3])); 

`endif 
`ifdef DMA_HAVE_CH4 






assign vld_req[4] = csr[0]&c4csr[`DMA_CHCSR_EN]&~abnormal[4]&(~c4csr[`DMA_CHCSR_MOD] | 
(c4csr[`DMA_CHCSR_MOD]&hwvld_req[4])); 

`endif 
`ifdef DMA_HAVE_CH5 






assign vld_req[5] = csr[0]&c5csr[`DMA_CHCSR_EN]&~abnormal[5]&(~c5csr[`DMA_CHCSR_MOD] | 
(c5csr[`DMA_CHCSR_MOD]&hwvld_req[5])); 

`endif 
`ifdef DMA_HAVE_CH6 






assign vld_req[6] = csr[0]&c6csr[`DMA_CHCSR_EN]&~abnormal[6]&(~c6csr[`DMA_CHCSR_MOD] | 
(c6csr[`DMA_CHCSR_MOD]&hwvld_req[6])); 

`endif 
`ifdef DMA_HAVE_CH7 






assign vld_req[7] = csr[0]&c7csr[`DMA_CHCSR_EN]&~abnormal[7]&(~c7csr[`DMA_CHCSR_MOD] | 
(c7csr[`DMA_CHCSR_MOD]&hwvld_req[7])); 

`endif 



reg [3:0] ch0fprii; 

always @(ch0pri) 
case(ch0pri) 
'h0: ch0fprii = 'b0001; 
'h1: ch0fprii = 'b0010; 
'h2: ch0fprii = 'b0100; 
default: ch0fprii = 'b1000; 
endcase 

always @(vld_req or ch0fprii) 
if(~vld_req[0]) 
ch0fpri = 'b0001; 
else 
ch0fpri = ch0fprii; 

`ifdef DMA_HAVE_CH1 

reg [3:0] ch1fprii; 

always @(ch1pri) 
case(ch1pri) 
'h0: ch1fprii = 'b0001; 
'h1: ch1fprii = 'b0010; 
'h2: ch1fprii = 'b0100; 
default: ch1fprii = 'b1000; 
endcase 

always @(vld_req or ch1fprii) 
if(~vld_req[1]) 
ch1fpri = 'b0001; 
else 
ch1fpri = ch1fprii; 

`endif 


`ifdef DMA_HAVE_CH2 

reg [3:0] ch2fprii; 

always @(ch2pri) 
case(ch2pri) 
'h0: ch2fprii = 'b0001; 
'h1: ch2fprii = 'b0010; 
'h2: ch2fprii = 'b0100; 
default: ch2fprii = 'b1000; 
endcase 

always @(vld_req or ch2fprii) 
if(~vld_req[2]) 
ch2fpri = 'b0001; 
else 
ch2fpri = ch2fprii; 

`endif 

`ifdef DMA_HAVE_CH3 

reg [3:0] ch3fprii; 

always @(ch3pri) 
case(ch3pri) 
'h0: ch3fprii = 'b0001; 
'h1: ch3fprii = 'b0010; 
'h2: ch3fprii = 'b0100; 
default: ch3fprii = 'b1000; 
endcase 

always @(vld_req or ch3fprii) 
if(~vld_req[3]) 
ch3fpri = 'b0001; 
else 
ch3fpri = ch3fprii; 

`endif 

`ifdef DMA_HAVE_CH4 

reg [3:0] ch4fprii; 

always @(ch4pri) 
case(ch4pri) 
'h0: ch4fprii = 'b0001; 
'h1: ch4fprii = 'b0010; 
'h2: ch4fprii = 'b0100; 
default: ch4fprii = 'b1000; 
endcase 

always @(vld_req or ch4fprii) 
if(~vld_req[4]) 
ch4fpri = 'b0001; 
else 
ch4fpri = ch4fprii; 

`endif 

`ifdef DMA_HAVE_CH5 

reg [3:0] ch5fprii; 

always @(ch5pri) 
case(ch5pri) 
'h0: ch5fprii = 'b0001; 
'h1: ch5fprii = 'b0010; 
'h2: ch5fprii = 'b0100; 
default: ch5fprii = 'b1000; 
endcase 

always @(vld_req or ch5fprii) 
if(~vld_req[5]) 
ch5fpri = 'b0001; 
else 
ch5fpri = ch5fprii; 

`endif 

`ifdef DMA_HAVE_CH6 

reg [3:0] ch6fprii; 

always @(ch6pri) 
case(ch6pri) 
'h0: ch6fprii = 'b0001; 
'h1: ch6fprii = 'b0010; 
'h2: ch6fprii = 'b0100; 
default: ch6fprii = 'b1000; 
endcase 

always @(vld_req or ch6fprii) 
if(~vld_req[6]) 
ch6fpri = 'b0001; 
else 
ch6fpri = ch6fprii; 

`endif 

`ifdef DMA_HAVE_CH7 

reg [3:0] ch7fprii; 

always @(ch7pri) 
case(ch7pri) 
'h0: ch7fprii = 'b0001; 
'h1: ch7fprii = 'b0010; 
'h2: ch7fprii = 'b0100; 
default: ch7fprii = 'b1000; 
endcase 

always @(vld_req or ch7fprii) 
if(~vld_req[7]) 
ch7fpri = 'b0001; 
else 
ch7fpri = ch7fprii; 

`endif 

assign chfpri_nx = ch0fpri 
`ifdef DMA_HAVE_CH1 
| ch1fpri 
`endif 
`ifdef DMA_HAVE_CH2 
| ch2fpri 
`endif 
`ifdef DMA_HAVE_CH3 
| ch3fpri 
`endif 
`ifdef DMA_HAVE_CH4 
| ch4fpri 
`endif 
`ifdef DMA_HAVE_CH5 
| ch5fpri 
`endif 
`ifdef DMA_HAVE_CH6 
| ch6fpri 
`endif 
`ifdef DMA_HAVE_CH7 
| ch7fpri 
`endif 
; 


reg [1:0] fix_pri_sx; 
always @(chfpri_nx) 
if (chfpri_nx[3]) fix_pri_sx = 'h3; 
else if (chfpri_nx[2]) fix_pri_sx = 'h2; 
else if (chfpri_nx[1]) fix_pri_sx = 'h1; 
else fix_pri_sx = 'h0; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
fix_pri_sel <= 'h0; 



else if(next_ch) 
fix_pri_sel <= fix_pri_sx; 


always @(fix_pri_sel or gnt_p0 or gnt_p1 or gnt_p2 or 
gnt_p3) 
case(fix_pri_sel) 
'h0: arb_ch_sel = gnt_p0; 
'h1: arb_ch_sel = gnt_p1; 
'h2: arb_ch_sel = gnt_p2; 
'h3: arb_ch_sel = gnt_p3; 
endcase 



assign vld_req_any = (| vld_req); 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
vld_req_any_d1 <= 'b0; 
else 
vld_req_any_d1 <= vld_req_any; 


wire vld_req_any1s = vld_req_any&~vld_req_any_d1; 



/* 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
arb_req <= 1'b0; 
else if(~arb_req&~de_stup_d1&vld_req_any) 
arb_req <= 1'b1; 
else if(arb_req&de_stup) 
arb_req <= 1'b0; 
*/ 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
arb_req <= 1'b0; 
else if(de_abt_on_idle|(arb_req&de_stup)) 
arb_req <= 1'b0; 
else if(~arb_req&~de_stup_d1&vld_req_any) 
arb_req <= 1'b1; 










always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
de_stup_d1 <= 0; 
else 
de_stup_d1 <= de_stup; 














assign next_ch = (vld_req_any1s&de_st_idle) | 
de_stup_d1|de_abt_on_idle; 










































assign abnormal[0] = de_err_notify | c0abt; 
assign dmaack_nx[0] = (~dma_ack[0] & ch_sel0 & c0csr[`DMA_CHCSR_MOD] & de_ack & ~abnormal[0]) | 
(dma_ack[0] & dma_reqs[0]); 

`ifdef DMA_HAVE_CH1 



assign abnormal[1] = de_err_notify | c1abt; 
assign dmaack_nx[1] = (~dma_ack[1] & ch_sel1 & c1csr[`DMA_CHCSR_MOD] & de_ack & ~abnormal[1]) | 
(dma_ack[1] & dma_reqs[1]); 
`endif 
`ifdef DMA_HAVE_CH2 



assign abnormal[2] = de_err_notify | c2abt; 
assign dmaack_nx[2] = (~dma_ack[2] & ch_sel2 & c2csr[`DMA_CHCSR_MOD] & de_ack & ~abnormal[2]) | 
(dma_ack[2] & dma_reqs[2]); 
`endif 
`ifdef DMA_HAVE_CH3 



assign abnormal[3] = de_err_notify | c3abt; 
assign dmaack_nx[3] = (~dma_ack[3] & ch_sel3 & c3csr[`DMA_CHCSR_MOD] & de_ack & ~abnormal[3]) | 
(dma_ack[3] & dma_reqs[3]); 
`endif 
`ifdef DMA_HAVE_CH4 



assign abnormal[4] = de_err_notify | c4abt; 
assign dmaack_nx[4] = (~dma_ack[4] & ch_sel4 & c4csr[`DMA_CHCSR_MOD] & de_ack & ~abnormal[4]) | 
(dma_ack[4] & dma_reqs[4]); 
`endif 
`ifdef DMA_HAVE_CH5 



assign abnormal[5] = de_err_notify | c5abt; 
assign dmaack_nx[5] = (~dma_ack[5] & ch_sel5 & c5csr[`DMA_CHCSR_MOD] & de_ack & ~abnormal[5]) | 
(dma_ack[5] & dma_reqs[5]); 
`endif 
`ifdef DMA_HAVE_CH6 



assign abnormal[6] = de_err_notify | c6abt; 
assign dmaack_nx[6] = (~dma_ack[6] & ch_sel6 & c6csr[`DMA_CHCSR_MOD] & de_ack & ~abnormal[6]) | 
(dma_ack[6] & dma_reqs[6]); 
`endif 
`ifdef DMA_HAVE_CH7 



assign abnormal[7] = de_err_notify | c7abt; 
assign dmaack_nx[7] = (~dma_ack[7] & ch_sel7 & c7csr[`DMA_CHCSR_MOD] & de_ack & ~abnormal[7]) | 
(dma_ack[7] & dma_reqs[7]); 

`endif 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_ack[0] <= 1'b0; 
else 
dma_ack[0] <= dmaack_nx[0]; 

`ifdef DMA_HAVE_CH1 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_ack[1] <= 1'b0; 
else 
dma_ack[1] <= dmaack_nx[1]; 
`endif 

`ifdef DMA_HAVE_CH2 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_ack[2] <= 1'b0; 
else 
dma_ack[2] <= dmaack_nx[2]; 
`endif 

`ifdef DMA_HAVE_CH3 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_ack[3] <= 1'b0; 
else 
dma_ack[3] <= dmaack_nx[3]; 
`endif 

`ifdef DMA_HAVE_CH4 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_ack[4] <= 1'b0; 
else 
dma_ack[4] <= dmaack_nx[4]; 
`endif 

`ifdef DMA_HAVE_CH5 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_ack[5] <= 1'b0; 
else 
dma_ack[5] <= dmaack_nx[5]; 
`endif 

`ifdef DMA_HAVE_CH6 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_ack[6] <= 1'b0; 
else 
dma_ack[6] <= dmaack_nx[6]; 
`endif 

`ifdef DMA_HAVE_CH7 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_ack[7] <= 1'b0; 
else 
dma_ack[7] <= dmaack_nx[7]; 
`endif 


assign ch_sel0 = (arb_ch_sel == 0); 
`ifdef DMA_HAVE_CH1 
assign ch_sel1 = (arb_ch_sel == 1); 
`endif 
`ifdef DMA_HAVE_CH2 
assign ch_sel2 = (arb_ch_sel == 2); 
`endif 
`ifdef DMA_HAVE_CH3 
assign ch_sel3 = (arb_ch_sel == 3); 
`endif 
`ifdef DMA_HAVE_CH4 
assign ch_sel4 = (arb_ch_sel == 4); 
`endif 
`ifdef DMA_HAVE_CH5 
assign ch_sel5 = (arb_ch_sel == 5); 
`endif 
`ifdef DMA_HAVE_CH6 
assign ch_sel6 = (arb_ch_sel == 6); 
`endif 
`ifdef DMA_HAVE_CH7 
assign ch_sel7 = (arb_ch_sel == 7); 
`endif 








/* 
assign dmatc_nx[0] = (~dma_tc[0] & ch_sel0 & c0csr[`DMA_CHCSR_MOD] & de_tc_st) | 
(dma_tc[0] & dma_reqs[0]); 
`ifdef DMA_HAVE_CH1 
assign dmatc_nx[1] = (~dma_tc[1] & ch_sel1 & c1csr[`DMA_CHCSR_MOD] & de_tc_st) | 
(dma_tc[1] & dma_reqs[1]); 
`endif 
`ifdef DMA_HAVE_CH2 
assign dmatc_nx[2] = (~dma_tc[2] & ch_sel2 & c2csr[`DMA_CHCSR_MOD] & de_tc_st) | 
(dma_tc[2] & dma_reqs[2]); 
`endif 
`ifdef DMA_HAVE_CH3 
assign dmatc_nx[3] = (~dma_tc[3] & ch_sel3 & c3csr[`DMA_CHCSR_MOD] & de_tc_st) | 
(dma_tc[3] & dma_reqs[3]); 
`endif 
`ifdef DMA_HAVE_CH4 
assign dmatc_nx[4] = (~dma_tc[4] & ch_sel4 & c4csr[`DMA_CHCSR_MOD] & de_tc_st) | 
(dma_tc[4] & dma_reqs[4]); 
`endif 
`ifdef DMA_HAVE_CH5 
assign dmatc_nx[5] = (~dma_tc[5] & ch_sel5 & c5csr[`DMA_CHCSR_MOD] & de_tc_st) | 
(dma_tc[5] & dma_reqs[5]); 
`endif 
`ifdef DMA_HAVE_CH6 
assign dmatc_nx[6] = (~dma_tc[6] & ch_sel6 & c6csr[`DMA_CHCSR_MOD] & de_tc_st) | 
(dma_tc[6] & dma_reqs[6]); 
`endif 
`ifdef DMA_HAVE_CH7 
assign dmatc_nx[7] = (~dma_tc[7] & ch_sel7 & c7csr[`DMA_CHCSR_MOD] & de_tc_st) | 
(dma_tc[7] & dma_reqs[7]); 
`endif 
*/ 
assign dma_tc_st1 = de_ack & tsz_eq0; 

assign dmatc_nx[0] = (~dma_tc[0] & ch_sel0 & c0csr[`DMA_CHCSR_MOD] & dma_tc_st1 & ~abnormal[0]) | 
(dma_tc[0] & dma_reqs[0]); 
`ifdef DMA_HAVE_CH1 
assign dmatc_nx[1] = (~dma_tc[1] & ch_sel1 & c1csr[`DMA_CHCSR_MOD] & dma_tc_st1 & ~abnormal[1]) | 
(dma_tc[1] & dma_reqs[1]); 
`endif 
`ifdef DMA_HAVE_CH2 
assign dmatc_nx[2] = (~dma_tc[2] & ch_sel2 & c2csr[`DMA_CHCSR_MOD] & dma_tc_st1 & ~abnormal[2]) | 
(dma_tc[2] & dma_reqs[2]); 
`endif 
`ifdef DMA_HAVE_CH3 
assign dmatc_nx[3] = (~dma_tc[3] & ch_sel3 & c3csr[`DMA_CHCSR_MOD] & dma_tc_st1 & ~abnormal[3]) | 
(dma_tc[3] & dma_reqs[3]); 
`endif 
`ifdef DMA_HAVE_CH4 
assign dmatc_nx[4] = (~dma_tc[4] & ch_sel4 & c4csr[`DMA_CHCSR_MOD] & dma_tc_st1 & ~abnormal[4]) | 
(dma_tc[4] & dma_reqs[4]); 
`endif 
`ifdef DMA_HAVE_CH5 
assign dmatc_nx[5] = (~dma_tc[5] & ch_sel5 & c5csr[`DMA_CHCSR_MOD] & dma_tc_st1 & ~abnormal[5]) | 
(dma_tc[5] & dma_reqs[5]); 
`endif 
`ifdef DMA_HAVE_CH6 
assign dmatc_nx[6] = (~dma_tc[6] & ch_sel6 & c6csr[`DMA_CHCSR_MOD] & dma_tc_st1 & ~abnormal[6]) | 
(dma_tc[6] & dma_reqs[6]); 
`endif 
`ifdef DMA_HAVE_CH7 
assign dmatc_nx[7] = (~dma_tc[7] & ch_sel7 & c7csr[`DMA_CHCSR_MOD] & dma_tc_st1 & ~abnormal[7]) | 
(dma_tc[7] & dma_reqs[7]); 
`endif 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_tc[0] <= 1'b0; 
else 
dma_tc[0] <= dmatc_nx[0]; 

`ifdef DMA_HAVE_CH1 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_tc[1] <= 1'b0; 
else 
dma_tc[1] <= dmatc_nx[1]; 
`endif 

`ifdef DMA_HAVE_CH2 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_tc[2] <= 1'b0; 
else 
dma_tc[2] <= dmatc_nx[2]; 
`endif 

`ifdef DMA_HAVE_CH3 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_tc[3] <= 1'b0; 
else 
dma_tc[3] <= dmatc_nx[3]; 
`endif 

`ifdef DMA_HAVE_CH4 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_tc[4] <= 1'b0; 
else 
dma_tc[4] <= dmatc_nx[4]; 
`endif 

`ifdef DMA_HAVE_CH5 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_tc[5] <= 1'b0; 
else 
dma_tc[5] <= dmatc_nx[5]; 
`endif 

`ifdef DMA_HAVE_CH6 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_tc[6] <= 1'b0; 
else 
dma_tc[6] <= dmatc_nx[6]; 
`endif 

`ifdef DMA_HAVE_CH7 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dma_tc[7] <= 1'b0; 
else 
dma_tc[7] <= dmatc_nx[7]; 
`endif 



always @(arb_ch_sel or c0csr 
`ifdef DMA_HAVE_CH1 
or c1csr 
`endif 
`ifdef DMA_HAVE_CH2 
or c2csr 
`endif 
`ifdef DMA_HAVE_CH3 
or c3csr 
`endif 
`ifdef DMA_HAVE_CH4 
or c4csr 
`endif 
`ifdef DMA_HAVE_CH5 
or c5csr 
`endif 
`ifdef DMA_HAVE_CH6 
or c6csr 
`endif 
`ifdef DMA_HAVE_CH7 
or c7csr 
`endif 
) 
case(arb_ch_sel) 
3'h0: arb_chcsri = c0csr; 
`ifdef DMA_HAVE_CH1 
3'h1: arb_chcsri = c1csr; 
`endif 
`ifdef DMA_HAVE_CH2 
3'h2: arb_chcsri = c2csr; 
`endif 
`ifdef DMA_HAVE_CH3 
3'h3: arb_chcsri = c3csr; 
`endif 
`ifdef DMA_HAVE_CH4 
3'h4: arb_chcsri = c4csr; 
`endif 
`ifdef DMA_HAVE_CH5 
3'h5: arb_chcsri = c5csr; 
`endif 
`ifdef DMA_HAVE_CH6 
3'h6: arb_chcsri = c6csr; 
`endif 
`ifdef DMA_HAVE_CH7 
3'h7: arb_chcsri = c7csr; 
`endif 
default: 
arb_chcsri = 0; 
endcase 









always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
arb_chcsr_reg <= 0; 
else 
arb_chcsr_reg <= {arb_chcsri[31],arb_chcsri[24:16],arb_chcsri[14:0]}; 
wire [`DMA_CHCSR_WIDTH-1:0] arb_chcsr = {arb_chcsr_reg[24],6'b0,arb_chcsr_reg[23:15],1'b0,arb_chcsr_reg[14:0]}; 


always @(arb_ch_sel or c0sad 
`ifdef DMA_HAVE_CH1 
or c1sad 
`endif 
`ifdef DMA_HAVE_CH2 
or c2sad 
`endif 
`ifdef DMA_HAVE_CH3 
or c3sad 
`endif 
`ifdef DMA_HAVE_CH4 
or c4sad 
`endif 
`ifdef DMA_HAVE_CH5 
or c5sad 
`endif 
`ifdef DMA_HAVE_CH6 
or c6sad 
`endif 
`ifdef DMA_HAVE_CH7 
or c7sad 
`endif 
) 
case(arb_ch_sel) 
3'h0: arb_chsad = c0sad; 
`ifdef DMA_HAVE_CH1 
3'h1: arb_chsad = c1sad; 
`endif 
`ifdef DMA_HAVE_CH2 
3'h2: arb_chsad = c2sad; 
`endif 
`ifdef DMA_HAVE_CH3 
3'h3: arb_chsad = c3sad; 
`endif 
`ifdef DMA_HAVE_CH4 
3'h4: arb_chsad = c4sad; 
`endif 
`ifdef DMA_HAVE_CH5 
3'h5: arb_chsad = c5sad; 
`endif 
`ifdef DMA_HAVE_CH6 
3'h6: arb_chsad = c6sad; 
`endif 
`ifdef DMA_HAVE_CH7 
3'h7: arb_chsad = c7sad; 
`endif 
default: arb_chsad = 0; 
endcase 

always @(arb_ch_sel or c0dad 
`ifdef DMA_HAVE_CH1 
or c1dad 
`endif 
`ifdef DMA_HAVE_CH2 
or c2dad 
`endif 
`ifdef DMA_HAVE_CH3 
or c3dad 
`endif 
`ifdef DMA_HAVE_CH4 
or c4dad 
`endif 
`ifdef DMA_HAVE_CH5 
or c5dad 
`endif 
`ifdef DMA_HAVE_CH6 
or c6dad 
`endif 
`ifdef DMA_HAVE_CH7 
or c7dad 
`endif 
) 
case(arb_ch_sel) 
3'h0: arb_chdad = c0dad; 
`ifdef DMA_HAVE_CH1 
3'h1: arb_chdad = c1dad; 
`endif 
`ifdef DMA_HAVE_CH2 
3'h2: arb_chdad = c2dad; 
`endif 
`ifdef DMA_HAVE_CH3 
3'h3: arb_chdad = c3dad; 
`endif 
`ifdef DMA_HAVE_CH4 
3'h4: arb_chdad = c4dad; 
`endif 
`ifdef DMA_HAVE_CH5 
3'h5: arb_chdad = c5dad; 
`endif 
`ifdef DMA_HAVE_CH6 
3'h6: arb_chdad = c6dad; 
`endif 
`ifdef DMA_HAVE_CH7 
3'h7: arb_chdad = c7dad; 
`endif 
default: arb_chdad = 0; 
endcase 

`ifdef DMA_HAVE_LINKLIST 
always @(arb_ch_sel or c0llp 
`ifdef DMA_HAVE_CH1 
or c1llp 
`endif 
`ifdef DMA_HAVE_CH2 
or c2llp 
`endif 
`ifdef DMA_HAVE_CH3 
or c3llp 
`endif 
`ifdef DMA_HAVE_CH4 
or c4llp 
`endif 
`ifdef DMA_HAVE_CH5 
or c5llp 
`endif 
`ifdef DMA_HAVE_CH6 
or c6llp 
`endif 
`ifdef DMA_HAVE_CH7 
or c7llp 
`endif 
) 
case(arb_ch_sel) 
3'h0: arb_chllp = c0llp; 
`ifdef DMA_HAVE_CH1 
3'h1: arb_chllp = c1llp; 
`endif 
`ifdef DMA_HAVE_CH2 
3'h2: arb_chllp = c2llp; 
`endif 
`ifdef DMA_HAVE_CH3 
3'h3: arb_chllp = c3llp; 
`endif 
`ifdef DMA_HAVE_CH4 
3'h4: arb_chllp = c4llp; 
`endif 
`ifdef DMA_HAVE_CH5 
3'h5: arb_chllp = c5llp; 
`endif 
`ifdef DMA_HAVE_CH6 
3'h6: arb_chllp = c6llp; 
`endif 
`ifdef DMA_HAVE_CH7 
3'h7: arb_chllp = c7llp; 
`endif 
default: arb_chllp = 0; 
endcase 
`endif 


always @(arb_ch_sel or c0tsz 
`ifdef DMA_HAVE_CH1 
or c1tsz 
`endif 
`ifdef DMA_HAVE_CH2 
or c2tsz 
`endif 
`ifdef DMA_HAVE_CH3 
or c3tsz 
`endif 
`ifdef DMA_HAVE_CH4 
or c4tsz 
`endif 
`ifdef DMA_HAVE_CH5 
or c5tsz 
`endif 
`ifdef DMA_HAVE_CH6 
or c6tsz 
`endif 
`ifdef DMA_HAVE_CH7 
or c7tsz 
`endif 
) 
case(arb_ch_sel) 
3'h0: arb_chtsz = c0tsz; 
`ifdef DMA_HAVE_CH1 
3'h1: arb_chtsz = c1tsz; 
`endif 
`ifdef DMA_HAVE_CH2 
3'h2: arb_chtsz = c2tsz; 
`endif 
`ifdef DMA_HAVE_CH3 
3'h3: arb_chtsz = c3tsz; 
`endif 
`ifdef DMA_HAVE_CH4 
3'h4: arb_chtsz = c4tsz; 
`endif 
`ifdef DMA_HAVE_CH5 
3'h5: arb_chtsz = c5tsz; 
`endif 
`ifdef DMA_HAVE_CH6 
3'h6: arb_chtsz = c6tsz; 
`endif 
`ifdef DMA_HAVE_CH7 
3'h7: arb_chtsz = c7tsz; 
`endif 
default: arb_chtsz = 0; 
endcase 


assign arb_abt_any = c0abt 
`ifdef DMA_HAVE_CH1 
| c1abt 
`endif 
`ifdef DMA_HAVE_CH2 
| c2abt 
`endif 
`ifdef DMA_HAVE_CH3 
| c3abt 
`endif 
`ifdef DMA_HAVE_CH4 
| c4abt 
`endif 
`ifdef DMA_HAVE_CH5 
| c5abt 
`endif 
`ifdef DMA_HAVE_CH6 
| c6abt 
`endif 
`ifdef DMA_HAVE_CH7 
| c7abt 
`endif 
; 

always @(arb_ch_sel or c0abt 
`ifdef DMA_HAVE_CH1 
or c1abt 
`endif 
`ifdef DMA_HAVE_CH2 
or c2abt 
`endif 
`ifdef DMA_HAVE_CH3 
or c3abt 
`endif 
`ifdef DMA_HAVE_CH4 
or c4abt 
`endif 
`ifdef DMA_HAVE_CH5 
or c5abt 
`endif 
`ifdef DMA_HAVE_CH6 
or c6abt 
`endif 
`ifdef DMA_HAVE_CH7 
or c7abt 
`endif 
) 
case(arb_ch_sel) 
3'h0: arb_chabt = c0abt; 
`ifdef DMA_HAVE_CH1 
3'h1: arb_chabt = c1abt; 
`endif 
`ifdef DMA_HAVE_CH2 
3'h2: arb_chabt = c2abt; 
`endif 
`ifdef DMA_HAVE_CH3 
3'h3: arb_chabt = c3abt; 
`endif 
`ifdef DMA_HAVE_CH4 
3'h4: arb_chabt = c4abt; 
`endif 
`ifdef DMA_HAVE_CH5 
3'h5: arb_chabt = c5abt; 
`endif 
`ifdef DMA_HAVE_CH6 
3'h6: arb_chabt = c6abt; 
`endif 
`ifdef DMA_HAVE_CH7 
3'h7: arb_chabt = c7abt; 
`endif 
default: arb_chabt = 0; 
endcase 

`ifdef DMA_HAVE_LINKLIST 
always @(arb_ch_sel or c0llpen 
`ifdef DMA_HAVE_CH1 
or c1llpen 
`endif 
`ifdef DMA_HAVE_CH2 
or c2llpen 
`endif 
`ifdef DMA_HAVE_CH3 
or c3llpen 
`endif 
`ifdef DMA_HAVE_CH4 
or c4llpen 
`endif 
`ifdef DMA_HAVE_CH5 
or c5llpen 
`endif 
`ifdef DMA_HAVE_CH6 
or c6llpen 
`endif 
`ifdef DMA_HAVE_CH7 
or c7llpen 
`endif 
) 
case(arb_ch_sel) 
3'h0: arb_chllpen = c0llpen; 
`ifdef DMA_HAVE_CH1 
3'h1: arb_chllpen = c1llpen; 
`endif 
`ifdef DMA_HAVE_CH2 
3'h2: arb_chllpen = c2llpen; 
`endif 
`ifdef DMA_HAVE_CH3 
3'h3: arb_chllpen = c3llpen; 
`endif 
`ifdef DMA_HAVE_CH4 
3'h4: arb_chllpen = c4llpen; 
`endif 
`ifdef DMA_HAVE_CH5 
3'h5: arb_chllpen = c5llpen; 
`endif 
`ifdef DMA_HAVE_CH6 
3'h6: arb_chllpen = c6llpen; 
`endif 
`ifdef DMA_HAVE_CH7 
3'h7: arb_chllpen = c7llpen; 
`endif 
default: arb_chllpen = 0; 
endcase 
`endif 


assign vld_req_p0[0] = vld_req[0] & (ch0pri=='h0); 
`ifdef DMA_HAVE_CH1 
assign vld_req_p0[1] = vld_req[1] & (ch1pri=='h0); 
`endif 
`ifdef DMA_HAVE_CH2 
assign vld_req_p0[2] = vld_req[2] & (ch2pri=='h0); 
`endif 
`ifdef DMA_HAVE_CH3 
assign vld_req_p0[3] = vld_req[3] & (ch3pri=='h0); 
`endif 
`ifdef DMA_HAVE_CH4 
assign vld_req_p0[4] = vld_req[4] & (ch4pri=='h0); 
`endif 
`ifdef DMA_HAVE_CH5 
assign vld_req_p0[5] = vld_req[5] & (ch5pri=='h0); 
`endif 
`ifdef DMA_HAVE_CH6 
assign vld_req_p0[6] = vld_req[6] & (ch6pri=='h0); 
`endif 
`ifdef DMA_HAVE_CH7 
assign vld_req_p0[7] = vld_req[7] & (ch7pri=='h0); 
`endif 

assign vld_req_p1[0] = vld_req[0] & (ch0pri=='h1); 
`ifdef DMA_HAVE_CH1 
assign vld_req_p1[1] = vld_req[1] & (ch1pri=='h1); 
`endif 
`ifdef DMA_HAVE_CH2 
assign vld_req_p1[2] = vld_req[2] & (ch2pri=='h1); 
`endif 
`ifdef DMA_HAVE_CH3 
assign vld_req_p1[3] = vld_req[3] & (ch3pri=='h1); 
`endif 
`ifdef DMA_HAVE_CH4 
assign vld_req_p1[4] = vld_req[4] & (ch4pri=='h1); 
`endif 
`ifdef DMA_HAVE_CH5 
assign vld_req_p1[5] = vld_req[5] & (ch5pri=='h1); 
`endif 
`ifdef DMA_HAVE_CH6 
assign vld_req_p1[6] = vld_req[6] & (ch6pri=='h1); 
`endif 
`ifdef DMA_HAVE_CH7 
assign vld_req_p1[7] = vld_req[7] & (ch7pri=='h1); 
`endif 

assign vld_req_p2[0] = vld_req[0] & (ch0pri=='h2); 
`ifdef DMA_HAVE_CH1 
assign vld_req_p2[1] = vld_req[1] & (ch1pri=='h2); 
`endif 
`ifdef DMA_HAVE_CH2 
assign vld_req_p2[2] = vld_req[2] & (ch2pri=='h2); 
`endif 
`ifdef DMA_HAVE_CH3 
assign vld_req_p2[3] = vld_req[3] & (ch3pri=='h2); 
`endif 
`ifdef DMA_HAVE_CH4 
assign vld_req_p2[4] = vld_req[4] & (ch4pri=='h2); 
`endif 
`ifdef DMA_HAVE_CH5 
assign vld_req_p2[5] = vld_req[5] & (ch5pri=='h2); 
`endif 
`ifdef DMA_HAVE_CH6 
assign vld_req_p2[6] = vld_req[6] & (ch6pri=='h2); 
`endif 
`ifdef DMA_HAVE_CH7 
assign vld_req_p2[7] = vld_req[7] & (ch7pri=='h2); 
`endif 

assign vld_req_p3[0] = vld_req[0] & (ch0pri=='h3); 
`ifdef DMA_HAVE_CH1 
assign vld_req_p3[1] = vld_req[1] & (ch1pri=='h3); 
`endif 
`ifdef DMA_HAVE_CH2 
assign vld_req_p3[2] = vld_req[2] & (ch2pri=='h3); 
`endif 
`ifdef DMA_HAVE_CH3 
assign vld_req_p3[3] = vld_req[3] & (ch3pri=='h3); 
`endif 
`ifdef DMA_HAVE_CH4 
assign vld_req_p3[4] = vld_req[4] & (ch4pri=='h3); 
`endif 
`ifdef DMA_HAVE_CH5 
assign vld_req_p3[5] = vld_req[5] & (ch5pri=='h3); 
`endif 
`ifdef DMA_HAVE_CH6 
assign vld_req_p3[6] = vld_req[6] & (ch6pri=='h3); 
`endif 
`ifdef DMA_HAVE_CH7 
assign vld_req_p3[7] = vld_req[7] & (ch7pri=='h3); 
`endif 


dma_rrarb dma_rrarb0( 
.HCLK(HCLK), 
.HRSTn(HRSTn), 
.vld_req(vld_req_p0), 
.gnt_chno(gnt_p0), 
.next_ch(next_ch) 
); 

dma_rrarb dma_rrarb1( 
.HCLK(HCLK), 
.HRSTn(HRSTn), 
.vld_req(vld_req_p1), 
.gnt_chno(gnt_p1), 
.next_ch(next_ch) 
); 

dma_rrarb dma_rrarb2( 
.HCLK(HCLK), 
.HRSTn(HRSTn), 
.vld_req(vld_req_p2), 
.gnt_chno(gnt_p2), 
.next_ch(next_ch) 
); 

dma_rrarb dma_rrarb3( 
.HCLK(HCLK), 
.HRSTn(HRSTn), 
.vld_req(vld_req_p3), 
.gnt_chno(gnt_p3), 
.next_ch(next_ch) 
); 

endmodule 
