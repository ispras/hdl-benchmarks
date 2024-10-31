





































`include "DMA_DEFINE.vh" 

module dma_chrf 
( 

HCLK, 
HRSTn, 


be_d1, 

chcsr_we, 
chcfg_we, 
chsad_we, 
chdad_we, 
`ifdef DMA_HAVE_LINKLIST 
chllp_we, 
`endif 
chtsz_we, 

slv_wdti, 
de_sad_we, 
de_dad_we, 
`ifdef DMA_HAVE_LINKLIST 
de_llp_we, 
`endif 
de_tsz_we, 
de_en_clr, 
de_csr_we, 
`ifdef DMA_HAVE_LINKLIST 
de_llpen_we, 
`endif 

de_sad, 
de_dad, 
`ifdef DMA_HAVE_LINKLIST 
de_llp, 
`endif 
de_tsz, 
de_csr, 
`ifdef DMA_HAVE_LINKLIST 
de_llpen, 


de_err_notify, 

tsz_eq0, 
`endif 

de_busy, 

de_st_idle, 
de_st_upd, 

de_st_llp0, 
arb_ch_sel, 


chcsr, 
chcfg, 
chsad, 
chdad, 
`ifdef DMA_HAVE_LINKLIST 
chllp, 
`endif 
chtsz, 
chabt, 
`ifdef DMA_HAVE_LINKLIST 
chllpen 
`endif 
); 

input HCLK; 
input HRSTn; 

input [3:0] be_d1; 
input chcsr_we; 
input chcfg_we; 
input chsad_we; 
input chdad_we; 
`ifdef DMA_HAVE_LINKLIST 
input chllp_we; 
`endif 
input chtsz_we; 

input [`DMA_HDATA_WIDTH-1:0] slv_wdti; 
input de_sad_we; 
input de_dad_we; 
`ifdef DMA_HAVE_LINKLIST 
input de_llp_we; 
`endif 
input de_tsz_we; 
input de_en_clr; 
input de_csr_we; 
`ifdef DMA_HAVE_LINKLIST 
input de_llpen_we; 
`endif 

input [`DMA_HADDR_WIDTH-1:0] de_sad; 
input [`DMA_HADDR_WIDTH-1:0] de_dad; 
`ifdef DMA_HAVE_LINKLIST 
input [`DMA_HADDR_WIDTH-1:0] de_llp; 
`endif 
input [`DMA_CHSZ_WIDTH-1:0] de_tsz; 
input [`DMA_HDATA_WIDTH-1:0] de_csr; 
`ifdef DMA_HAVE_LINKLIST 
input de_llpen; 


input de_err_notify; 

input tsz_eq0; 
`endif 
input de_busy; 

input de_st_idle; 
input de_st_upd; 

input de_st_llp0; 
input [`DMA_CHNO_WIDTH-1:0] arb_ch_sel; 

output [`DMA_CHCSR_WIDTH-1:0] chcsr; 
output [`DMA_CHCFG_WIDTH-1:0] chcfg; 
output [`DMA_HADDR_WIDTH-1:0] chsad; 
output [`DMA_HADDR_WIDTH-1:0] chdad; 
`ifdef DMA_HAVE_LINKLIST 
output [`DMA_HADDR_WIDTH-1:0] chllp; 
`endif 
output [`DMA_CHSZ_WIDTH-1:0] chtsz; 
output chabt; 
`ifdef DMA_HAVE_LINKLIST 
output chllpen; 
`endif 

parameter CH_NO = 0; 

wire this_ch; 
wire chabt_set; 

wire chcsr_b0we_qf; 
reg int_tc_msk; 
reg [1:0] chpri; 
reg dreqmode; 
reg prot3, prot2, prot1; 
reg [2:0] src_sz; 
reg autold; 
reg [2:0] swidth; 
reg [2:0] dwidth; 
reg mode; 
reg sad_ctl1, sad_ctl0; 
reg dad_ctl1, dad_ctl0; 
reg src_sel, dst_sel; 
reg ch_en; 

reg int_abt_msk; 
reg int_err_msk; 
reg int_tc1_msk; 
reg [`DMA_HADDR_WIDTH-1:0] chsad,chdad; 
`ifdef DMA_HAVE_LINKLIST 
reg [`DMA_HADDR_WIDTH-1:0] chllp; 
`endif 
reg [`DMA_CHSZ_WIDTH-1:0] chtsz; 
reg chabt; 
`ifdef DMA_HAVE_LINKLIST 
reg chllpen; 
`endif 


assign this_ch = (arb_ch_sel == CH_NO); 

`ifdef DMA_HAVE_LINKLIST 
wire chllp_on_set,chllp_on_clr,chllp_cnt_clr,chllp_cnt_inc; 
reg chllp_on; 

reg [3:0] chllp_cnt; 





wire chllpen_clr = (this_ch&(de_err_notify|chabt)&de_st_upd) | 
(chabt&(de_st_idle|(!de_st_idle&!this_ch))); 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chllpen <= 'b0; 









else if(this_ch&ch_en&de_llpen_we&~(de_err_notify|chabt)) 
chllpen <= de_llpen; 


else if(chllpen_clr) 
chllpen <= 1'b0; 


















assign chllp_on_set = !chllp_on & ch_en & (|chllp[31:2]); 
assign chllp_on_clr = chllp_on & !ch_en; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chllp_on <= 1'b0; 
else if(chllp_on_set) 
chllp_on <= 1'b1; 
else if(chllp_on_clr) 
chllp_on <= 1'b0; 

assign chllp_cnt_clr = !ch_en&chcsr_b0we_qf&slv_wdti[0]; 
assign chllp_cnt_inc = chllp_on&de_st_upd&this_ch& 
(tsz_eq0|de_err_notify|chabt); 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chllp_cnt <= 0; 
else if(chllp_cnt_clr) 
chllp_cnt <= 0; 
else if(chllp_cnt_inc) 
chllp_cnt <= chllp_cnt + 1; 

`else 
wire chllp_cnt; 
assign chllp_cnt = 0; 
`endif 




wire chcsr_b0we = chcsr_we & be_d1[0]; 
wire chcsr_b1we = chcsr_we & be_d1[1]; 
wire chcsr_b2we = chcsr_we & be_d1[2]; 
wire chcsr_b3we = chcsr_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
begin 
if(~HRSTn) 
int_tc_msk <= 1'b0; 
else 
begin 


if(chcsr_b3we&~chabt_set) 
int_tc_msk <= slv_wdti[31]; 
else if(this_ch&de_csr_we) 
int_tc_msk <= de_csr[28]; 
end 
end 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chpri <= 2'b0; 


else if(chcsr_b2we&~chabt_set) 
chpri <= slv_wdti[23:22]; 



always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dreqmode <= 1'b0; 


else if(chcsr_b3we&~chabt_set) 
dreqmode <= slv_wdti[24]; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
begin 
prot3 <= 1'b0; 
prot2 <= 1'b0; 
prot1 <= 1'b0; 
end 


else if(chcsr_b2we&~chabt_set) 
begin 
prot3 <= slv_wdti[21]; 
prot2 <= slv_wdti[20]; 
prot1 <= slv_wdti[19]; 
end 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
src_sz <= 3'b0; 


else if(chcsr_b2we&~chabt_set) 
src_sz <= slv_wdti[18:16]; 












wire chabt_clr = 
chabt&((!de_st_idle&((this_ch&de_st_upd)| !this_ch)) | 
de_st_upd | 
de_st_idle); 













assign chabt_set = chcsr_b2we & slv_wdti[15]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chabt <= 1'b0; 
else if(chcsr_b2we) 
chabt <= slv_wdti[15]; 
else if(chabt_clr) 
chabt <= 1'b0; 



always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
autold <= 1'b0; 


else if(chcsr_b1we&~chabt_set) 
autold <= slv_wdti[14]; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
swidth <= 3'b010; 


else if(chcsr_b1we&~chabt_set) 
swidth <= slv_wdti[13:11]; 
else if(this_ch&de_csr_we) 
swidth <= de_csr[27:25]; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dwidth <= 3'b010; 


else if(chcsr_b1we&~chabt_set) 
dwidth <= slv_wdti[10:8]; 
else if(this_ch&de_csr_we) 
dwidth <= de_csr[24:22]; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
mode <= 1'b0; 


else if(chcsr_b0we_qf) 
mode <= slv_wdti[7]; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
begin 
sad_ctl1 <= 1'b0; 
sad_ctl0 <= 1'b0; 
dad_ctl1 <= 1'b0; 
dad_ctl0 <= 1'b0; 
src_sel <= 1'b0; 
dst_sel <= 1'b0; 
end 


else if(chcsr_b0we_qf) 
begin 
sad_ctl1 <= slv_wdti[6]; 
sad_ctl0 <= slv_wdti[5]; 
dad_ctl1 <= slv_wdti[4]; 
dad_ctl0 <= slv_wdti[3]; 
src_sel <= slv_wdti[2]; 
dst_sel <= slv_wdti[1]; 
end 
else if(this_ch&de_csr_we) 
begin 
sad_ctl1 <= de_csr[21]; 
sad_ctl0 <= de_csr[20]; 
dad_ctl1 <= de_csr[19]; 
dad_ctl0 <= de_csr[18]; 
src_sel <= de_csr[17]; 
dst_sel <= de_csr[16]; 
end 



wire chen_declr = ((this_ch&de_en_clr) | 
(chabt&(de_st_idle|(!de_st_idle&!this_ch)))); 

assign chcsr_b0we_qf = chcsr_b0we&~chabt_set; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
ch_en <= 1'b0; 


else if(chcsr_b0we_qf) 
ch_en <= slv_wdti[0]; 
else if(chen_declr) 
ch_en <= 1'b0; 



wire chcfg_b0we = chcfg_we & be_d1[0]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
begin 

int_abt_msk <= 1'b1; 
int_err_msk <= 1'b1; 
int_tc1_msk <= 1'b1; 
end 
else if(chcfg_b0we) 
begin 

int_abt_msk <= slv_wdti[2]; 
int_err_msk <= slv_wdti[1]; 
int_tc1_msk <= slv_wdti[0]; 
end 



wire chsad_b0we = chsad_we & be_d1[0]; 
wire chsad_b1we = chsad_we & be_d1[1]; 
wire chsad_b2we = chsad_we & be_d1[2]; 
wire chsad_b3we = chsad_we & be_d1[3]; 
wire chsad_dewe = this_ch & de_sad_we; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chsad[7:0] <= 'h0; 
else if(chsad_b0we) 
chsad[7:0] <= slv_wdti[7:0]; 
else if(chsad_dewe) 
chsad[7:0] <= de_sad[7:0]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chsad[15:8] <= 'h0; 
else if(chsad_b1we) 
chsad[15:8] <= slv_wdti[15:8]; 
else if(chsad_dewe) 
chsad[15:8] <= de_sad[15:8]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chsad[23:16] <= 'h0; 
else if(chsad_b2we) 
chsad[23:16] <= slv_wdti[23:16]; 
else if(chsad_dewe) 
chsad[23:16] <= de_sad[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chsad[31:24] <= 'h0; 
else if(chsad_b3we) 
chsad[31:24] <= slv_wdti[31:24]; 
else if(chsad_dewe) 
chsad[31:24] <= de_sad[31:24]; 



wire chdad_b0we = chdad_we & be_d1[0]; 
wire chdad_b1we = chdad_we & be_d1[1]; 
wire chdad_b2we = chdad_we & be_d1[2]; 
wire chdad_b3we = chdad_we & be_d1[3]; 
wire chdad_dewe = this_ch & de_dad_we; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chdad[7:0] <= 'h0; 
else if(chdad_b0we) 
chdad[7:0] <= slv_wdti[7:0]; 
else if(chdad_dewe) 
chdad[7:0] <= de_dad[7:0]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chdad[15:8] <= 'h0; 
else if(chdad_b1we) 
chdad[15:8] <= slv_wdti[15:8]; 
else if(chdad_dewe) 
chdad[15:8] <= de_dad[15:8]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chdad[23:16] <= 'h0; 
else if(chdad_b2we) 
chdad[23:16] <= slv_wdti[23:16]; 
else if(chdad_dewe) 
chdad[23:16] <= de_dad[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chdad[31:24] <= 'h0; 
else if(chdad_b3we) 
chdad[31:24] <= slv_wdti[31:24]; 
else if(chdad_dewe) 
chdad[31:24] <= de_dad[31:24]; 

`ifdef DMA_HAVE_LINKLIST 


wire chllp_b0we = chllp_we & be_d1[0]; 
wire chllp_b1we = chllp_we & be_d1[1]; 
wire chllp_b2we = chllp_we & be_d1[2]; 
wire chllp_b3we = chllp_we & be_d1[3]; 
wire chllp_dewe = this_ch & de_llp_we; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chllp[7:0] <= 8'b0; 
else if(chllp_b0we) 
chllp[7:0] <= slv_wdti[7:0]; 
else if(chllp_dewe) 
chllp[7:0] <= de_llp[7:0]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chllp[15:8] <= 8'b0; 
else if(chllp_b1we) 
chllp[15:8] <= slv_wdti[15:8]; 
else if(chllp_dewe) 
chllp[15:8] <= de_llp[15:8]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chllp[23:16] <= 8'b0; 
else if(chllp_b2we) 
chllp[23:16] <= slv_wdti[23:16]; 
else if(chllp_dewe) 
chllp[23:16] <= de_llp[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chllp[31:24] <= 8'b0; 
else if(chllp_b3we) 
chllp[31:24] <= slv_wdti[31:24]; 
else if(chllp_dewe) 
chllp[31:24] <= de_llp[31:24]; 
`endif 



wire chtsz_b0we = chtsz_we & be_d1[0]; 
wire chtsz_b1we = chtsz_we & be_d1[1]; 
wire chtsz_dewe = this_ch & de_tsz_we; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chtsz[7:0] <= 'h0; 
else if(chtsz_b0we) 
chtsz[7:0] <= slv_wdti[7:0]; 
else if(chtsz_dewe) 
chtsz[7:0] <= de_tsz[7:0]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
chtsz[`DMA_CHSZ_WIDTH-1:8] <= 'h0; 
else if(chtsz_b1we) 
chtsz[`DMA_CHSZ_WIDTH-1:8] <= slv_wdti[`DMA_CHSZ_WIDTH-1:8]; 
else if(chtsz_dewe) 
chtsz[`DMA_CHSZ_WIDTH-1:8] <= de_tsz[`DMA_CHSZ_WIDTH-1:8]; 


assign chcsr = {int_tc_msk, 6'b0, dreqmode, 
chpri, prot3, prot2, prot1, src_sz, 


chabt, autold, swidth, dwidth, 
mode, sad_ctl1, sad_ctl0, dad_ctl1, dad_ctl0, 
src_sel, dst_sel, ch_en}; 

wire chbusy = this_ch & de_busy; 

assign chcfg = {8'b0, 4'b0, chllp_cnt, 7'b0, chbusy, 
5'b0, int_abt_msk, int_err_msk, int_tc1_msk}; 

endmodule 
