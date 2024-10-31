










































`include "DMA_DEFINE.vh" 



module dma_fifo 



( 
HCLK, 
HRSTn, 



push, 
pop, 
look_ahead, 
flush, 

clear, 
de_ff_ini, 
pack_en, 
swid16, 
swid32, 
cvtp2, 
cv8t16, 
cv8t32, 
cv16t32, 
adi, 
dti, 


ff_dto, 

ff_empty, 
ff_eq1, 
ff_eq2, 
ff_geth, 
ff_2ltfl, 
ff_1ltfl, 

ff_q_full, 
ff_part_wd, 
ff_cbe, 
ff_cnv_q_vld, 

ff_wr 
); 

input HCLK; 
input HRSTn; 



input push; 
input pop; 
input look_ahead; 
input flush; 

input clear; 
input de_ff_ini; 

input pack_en; 
input swid16; 
input swid32; 
input cvtp2; 
input cv8t16; 
input cv8t32; 
input cv16t32; 
input [1:0] adi; 
input [`DMA_HDATA_WIDTH-1:0] dti; 


output [`DMA_HDATA_WIDTH-1:0] ff_dto; 

output ff_empty; 
output ff_eq1; 
output ff_eq2; 
output ff_geth; 
output ff_2ltfl; 
output ff_1ltfl; 

output ff_q_full; 
output ff_part_wd; 
output [3:0] ff_cbe; 
output ff_cnv_q_vld; 

output ff_wr; 



reg part_wd; 
reg ram_wrq; 
reg [7:0] cnv_bt0,cnv_bt1,cnv_bt2,cnv_bt3; 

reg ram_wr; 
reg [`DMA_FF_ADD_WIDTH-1:0] ff_fram_wado; 
reg [`DMA_FF_ADD_WIDTH-1:0] ff_fram_radx; 
reg [`DMA_FF_CNT_WIDTH-1:0] ff_cnt; 

wire last_bt,ram_wr_nx,ram_wrx,ff_wr; 

wire push_qualify,pop_qualify; 
wire ram_wr_qualify,ram_wrq_qualify,ram_wrq_nx; 

assign push_qualify = push & ~clear; 
assign pop_qualify = pop & ~clear; 














wire cb0i_sel1 = adi[1]&~swid32; 
wire cb0i_sel0 = adi[0]&~swid16&~swid32; 






wire cb1i_sel1 = adi[1]&~swid32; 
wire cb1i_sel0 = adi[0]|swid16|swid32; 






wire cb2i_sel1 = adi[1]|swid32; 
wire cb2i_sel0 = adi[0]&~swid16&~swid32; 






wire cb3i_sel1 = adi[1]|swid32; 
wire cb3i_sel0 = adi[0]|swid16|swid32; 



reg [7:0] cb0i,cb1i,cb2i,cb3i; 



wire ff_empty = (ff_cnt == 0); 
wire ff_eq1 = (ff_cnt == 1); 
wire ff_eq2 = (ff_cnt == 2); 
wire ff_geth = (ff_cnt > `DMA_FF_TH); 
wire ff_2ltfl = (ff_cnt > (`DMA_FF_DEP - 2)); 
wire ff_1ltfl = (ff_cnt > (`DMA_FF_DEP - 1)); 
wire ff_full = (ff_cnt == `DMA_FF_DEP); 



assign ff_q_full = ram_wrq_nx; 

always @(cb0i_sel1 or cb0i_sel0 or dti) 
case({cb0i_sel1,cb0i_sel0}) 
2'b00: cb0i = dti[7:0]; 
2'b01: cb0i = dti[15:8]; 
2'b10: cb0i = dti[23:16]; 
2'b11: cb0i = dti[31:24]; 
endcase 

always @(cb1i_sel1 or cb1i_sel0 or dti) 
case({cb1i_sel1,cb1i_sel0}) 
2'b00: cb1i = dti[7:0]; 
2'b01: cb1i = dti[15:8]; 
2'b10: cb1i = dti[23:16]; 
2'b11: cb1i = dti[31:24]; 
endcase 

always @(cb2i_sel1 or cb2i_sel0 or dti) 
case({cb2i_sel1,cb2i_sel0}) 
2'b00: cb2i = dti[7:0]; 
2'b01: cb2i = dti[15:8]; 
2'b10: cb2i = dti[23:16]; 
2'b11: cb2i = dti[31:24]; 
endcase 

always @(cb3i_sel1 or cb3i_sel0 or dti) 
case({cb3i_sel1,cb3i_sel0}) 
2'b00: cb3i = dti[7:0]; 
2'b01: cb3i = dti[15:8]; 
2'b10: cb3i = dti[23:16]; 
2'b11: cb3i = dti[31:24]; 
endcase 





reg [3:0] cbe_ini,cbe; 
reg ff_cnv_q_vld; 

always @(cv8t32 or cv8t16 or cv16t32) 
case({cv8t32,cv8t16,cv16t32}) 
3'b001: cbe_ini = 4'b0010; 
3'b010: cbe_ini = 4'b0110; 
3'b100: cbe_ini = 4'b0111; 
default: cbe_ini = 4'b1111; 
endcase 



wire cbe0_nx = (cvtp2&~cbe[0])|(cv8t32&cbe[3])|~pack_en; 
wire cbe1_nx = (cvtp2&~cbe[1])|(cv8t32&cbe[0])|~pack_en; 
wire cbe2_nx = (cvtp2&~cbe[2])|(cv8t32&cbe[1])|~pack_en; 
wire cbe3_nx = (cvtp2&~cbe[3])|(cv8t32&cbe[2])|~pack_en; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
cbe <= 4'b0; 
else if(de_ff_ini) 
cbe <= cbe_ini; 
else if(push_qualify) 
cbe <= {cbe3_nx,cbe2_nx,cbe1_nx,cbe0_nx}; 

assign ff_cbe = cbe; 

wire cnv_b0_en = cbe[0] & push_qualify; 
wire cnv_b1_en = cbe[1] & push_qualify; 
wire cnv_b2_en = cbe[2] & push_qualify; 
wire cnv_b3_en = cbe[3] & push_qualify; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
cnv_bt0 <= 'h0; 
else if(cnv_b0_en) 
cnv_bt0 <= cb0i; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
cnv_bt1 <= 'h0; 
else if(cnv_b1_en) 
cnv_bt1 <= cb1i; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
cnv_bt2 <= 'h0; 
else if(cnv_b2_en) 
cnv_bt2 <= cb2i; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
cnv_bt3 <= 'h0; 
else if(cnv_b3_en) 
cnv_bt3 <= cb3i; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
ff_cnv_q_vld <= 0; 
else if(de_ff_ini) 
ff_cnv_q_vld <= 0; 
else if(ram_wr_nx & !ff_wr) 
ff_cnv_q_vld <= 1; 
else if(!ram_wr_nx & ff_wr) 
ff_cnv_q_vld <= 0; 


assign last_bt = cbe[3]; 
assign ram_wr_nx = last_bt&push_qualify; 
always @(posedge HCLK or negedge HRSTn) 
if (~HRSTn) 
ram_wr <= 'b0; 
else 
ram_wr <= ram_wr_nx; 














assign ram_wr_qualify = ram_wr &~clear; 
assign ram_wrq_qualify = ram_wrq&~clear; 











assign ram_wrq_nx = ~clear&(((ram_wr_qualify|flush)&ff_full)|(ram_wrq_qualify&ff_full)); 

always @(posedge HCLK or negedge HRSTn) 
if (~HRSTn) 
ram_wrq <= 'b0; 
else 
ram_wrq <= ram_wrq_nx; 








assign ram_wrx = (ram_wr_qualify|flush|ram_wrq_qualify)&~ff_full; 









wire part_wd_st = ~part_wd&pack_en&push_qualify&!last_bt&!ff_wr; 
wire part_wd_cl = part_wd &(!push_qualify&ff_wr); 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
part_wd <= 'b0; 
else if(clear) 
part_wd <= 'b0; 
else if(part_wd_st) 
part_wd <= 'b1; 
else if(part_wd_cl) 
part_wd <= 'b0; 

/* 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
part_wd <= 'b0; 
else if(part_wd_st) 
part_wd <= 'b1; 
else if(part_wd_cl) 
part_wd <= 'b0; 
*/ 

assign ff_part_wd = part_wd; 






assign ff_wr = ram_wrx; 


wire ff_rd = pop_qualify; 
wire [`DMA_HDATA_WIDTH-1:0] ff_fram_dto = {cnv_bt3,cnv_bt2,cnv_bt1,cnv_bt0}; 
wire [`DMA_FF_ADD_WIDTH-1:0] ff_fram_rado; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
ff_fram_wado <= 'b0; 
else if(clear) 
ff_fram_wado <= 'b0; 
else if(ff_wr) 
ff_fram_wado <= ff_fram_wado + 1; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
ff_fram_radx <= 'b0; 
else if(clear) 
ff_fram_radx <= 'b0; 
else if(ff_rd) 
ff_fram_radx <= ff_fram_radx + 1; 

assign ff_fram_rado = ff_fram_radx + look_ahead; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
ff_cnt <= 'b0; 
else if(clear) 
ff_cnt <= 'b0; 
else if(ff_wr&~ff_rd) 
ff_cnt <= ff_cnt + 1; 
else if(ff_rd&~ff_wr) 
ff_cnt <= ff_cnt - 1; 


wire ff_fram_wr_n = ~ff_wr; 

wire [`DMA_HDATA_WIDTH-1:0] fram_ff_dto; 

ff_ram u_ff_ram ( 
.clk(HCLK), .rst_n(HRSTn), .cs_n(1'b0), .wr_n(ff_fram_wr_n), 
.rd_addr(ff_fram_rado), .wr_addr(ff_fram_wado), 
.data_in(ff_fram_dto), .data_out(fram_ff_dto) ); 



assign ff_dto = ff_empty? {cnv_bt3,cnv_bt2,cnv_bt1,cnv_bt0} : fram_ff_dto; 

endmodule 

module ff_ram 
( 
clk, 
rst_n, 
cs_n, 
wr_n, 
rd_addr, 
wr_addr, 
data_in, 
data_out 
); 

input clk,rst_n; 
input cs_n,wr_n; 
input [`DMA_FF_ADD_WIDTH-1:0] rd_addr; 
input [`DMA_FF_ADD_WIDTH-1:0] wr_addr; 
input [`DMA_HDATA_WIDTH-1:0] data_in; 
output [`DMA_HDATA_WIDTH-1:0] data_out; 

wire we; 

reg [`DMA_HDATA_WIDTH-1:0] ram_dt [`DMA_FF_DEP-1:0]; 

assign we = ~cs_n & ~wr_n; 

always @(posedge clk) 
if(we) 
ram_dt[wr_addr] <= data_in; 

assign data_out = ram_dt[rd_addr]; 
/* 


DW_ram_r_w_s_dff #(`DMA_HDATA_WIDTH, `DMA_FF_DEP, DMA_DWRAM_SYN_RST) 
U_FRAM ( .clk(HCLK), .rst_n(HRSTn), .cs_n(1'b1), .wr_n(ff_fram_wr_n), 
.rd_addr(ff_fram_rado), .wr_addr(ff_fram_wado), 
.data_in(ff_fram_dto), .data_out(fram_ff_dto) ); 
*/ 

endmodule 
