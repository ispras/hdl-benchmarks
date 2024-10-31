





































`include "DMA_DEFINE.vh" 

module dma_engine 
( 

HCLK, 
HRSTn, 


de_st, 

de_err_notify, 
`ifdef DMA_HAVE_LINKLIST 
st_llp0t3, 
`endif 
dst_m,src_m, 
dst_a,src_a, 
dst_e,src_e, 
dst_wid_wd, src_wid_wd, 
dst_wid_hw, src_wid_hw, 
dst_wid_bt, src_wid_bt, 

bst_eq0,bst_eq1, bst_eq2, 
tsz_eq0,tsz_eq1, tsz_eq2, 
cv8t32, 
cv8t16, 
cv16t32, 
cvtp2, 
pack_en, 
pack_end, 
unpack_en, 
upk_cnteq0, 
upk_cnteq1, 


fwdtsb0, 
fwdtsb1, 
fwdtsb2, 
fwdtsb3, 


m0_ad1t0x, 
m0_updad, 
m0_rdy, 
m0_rdt, 
m0_cp, 
m0_tr_sq, 
m0_rp_err, 


m0_rp_rty, 

m0_dt_st, 

m0_dma_err_ok, 


m0_is_dst, 
m0_is_src, 
`ifdef DMA_HAVE_LINKLIST 
m0_is_llp, 
`endif 
m0_arb_src, 
m0_arb_dst, 



`ifdef DMA_HAVE_AHB1 



m1_ad1t0x, 
m1_updad, 
m1_rdy, 
m1_rdt, 
m1_cp, 
m1_tr_sq, 
m1_rp_err, 
m1_rp_rty, 
m1_dt_st, 


m1_dtp, 
m1_dma_had_a_rty, 

m1_dma_err_ok, 


m1_is_dst, 
m1_is_src, 
`ifdef DMA_HAVE_LINKLIST 
m1_is_llp, 
`endif 
m1_arb_src, 
m1_arb_dst, 

m1_src2br, 

m0_m1_same, 


`endif 

`ifdef DMA_HAVE_AHB1 

`ifdef DMA_HAVE_BRIDGE 
m1_arb_br, 



slv_br_req, 


slv_brst_cmd, 
slv_brst_mscd, 



br_req_qf, 
`endif 


`endif 





ff_eq1, 
ff_eq2, 
ff_2ltfl, 
ff_1ltfl, 
ff_part_wd, 
ff_cbe, 
ff_cnv_q_vld, 

ff_wr, 


de_ff_push, 
de_ff_pop, 
de_ff_ahead, 
de_ff_flush, 
de_ff_clear, 
de_ff_ini, 
de_ff_ado, 
de_ff_dto, 



arb_req, 
arb_chcsr, 
`ifdef DMA_HAVE_LINKLIST 
arb_chllp, 
`endif 
arb_chtsz, 
`ifdef DMA_HAVE_LINKLIST 
arb_chllpen, 
`endif 


de_ack, 
de_tc_st, 



rf_cherr, 
arb_chabt, 

arb_abt_any, 


de_sad, 
de_dad, 
`ifdef DMA_HAVE_LINKLIST 
de_llp, 
de_mllp, 
`endif 
de_tsz, 
de_csr, 
`ifdef DMA_HAVE_LINKLIST 
de_llpen, 
`endif 
de_busy, 
de_sad_we, 
de_dad_we, 
de_tsz_we, 
`ifdef DMA_HAVE_LINKLIST 
de_llp_we, 
de_csr_we, 
de_llpen_we, 
`endif 
de_en_clr, 

de_abt_on_idle, 
de_err_st 

); 



input HCLK; 
input HRSTn; 



output [10:0] de_st; 

output de_err_notify; 
`ifdef DMA_HAVE_LINKLIST 
output st_llp0t3; 
`endif 
output dst_m,src_m; 
output dst_a,src_a; 
output dst_e,src_e; 
output dst_wid_wd, src_wid_wd; 
output dst_wid_hw, src_wid_hw; 
output dst_wid_bt, src_wid_bt; 

output bst_eq0,bst_eq1, bst_eq2; 
output tsz_eq0,tsz_eq1, tsz_eq2; 
output cv8t32; 
output cv8t16; 
output cv16t32; 
output cvtp2; 
output pack_en; 
output pack_end; 
output unpack_en; 
output upk_cnteq0; 
output upk_cnteq1; 
output [1:0] fwdtsb0; 
output [1:0] fwdtsb1; 
output [1:0] fwdtsb2; 
output [1:0] fwdtsb3; 



input [1:0] m0_ad1t0x; 
input [`DMA_HADDR_WIDTH-1:0] m0_updad; 
input m0_rdy; 
input [`DMA_HDATA_WIDTH-1:0] m0_rdt; 
input m0_cp; 
input m0_tr_sq; 
input m0_rp_err; 


input m0_rp_rty; 

input m0_dt_st; 

input m0_dma_err_ok; 


output m0_is_dst; 
output m0_is_src; 
`ifdef DMA_HAVE_LINKLIST 
output m0_is_llp; 
`endif 
output m0_arb_src; 
output m0_arb_dst; 



`ifdef DMA_HAVE_AHB1 



input [1:0] m1_ad1t0x; 
input [`DMA_HADDR_WIDTH-1:0] m1_updad; 
input m1_rdy; 
input [`DMA_HDATA_WIDTH-1:0] m1_rdt; 
input m1_cp; 
input m1_tr_sq; 
input m1_rp_err; 
input m1_rp_rty; 
input m1_dt_st; 

input m1_dtp; 
input m1_dma_had_a_rty; 

input m1_dma_err_ok; 


output m1_is_dst; 
output m1_is_src; 
`ifdef DMA_HAVE_LINKLIST 
output m1_is_llp; 
`endif 
output m1_arb_src; 
output m1_arb_dst; 

output m1_src2br; 

output m0_m1_same; 


`ifdef DMA_HAVE_BRIDGE 
output m1_arb_br; 



input slv_br_req; 


input slv_brst_cmd; 
input slv_brst_mscd; 

output br_req_qf; 
`endif 


`endif 





input ff_eq1; 
input ff_eq2; 
input ff_2ltfl; 
input ff_1ltfl; 
input ff_part_wd; 
input [3:0] ff_cbe; 
input ff_cnv_q_vld; 

input ff_wr; 


output de_ff_push; 
output de_ff_pop; 
output de_ff_ahead; 
output de_ff_flush; 
output de_ff_clear; 
output de_ff_ini; 
output [1:0] de_ff_ado; 
output [`DMA_HDATA_WIDTH-1:0] de_ff_dto; 



input arb_req; 
input [`DMA_CHCSR_WIDTH-1:0] arb_chcsr; 
`ifdef DMA_HAVE_LINKLIST 
input [`DMA_HADDR_WIDTH-1:0] arb_chllp; 
`endif 
input [`DMA_CHSZ_WIDTH-1:0] arb_chtsz; 
`ifdef DMA_HAVE_LINKLIST 
input arb_chllpen; 
`endif 


output de_ack; 
output de_tc_st; 



input rf_cherr; 
input arb_chabt; 

input arb_abt_any; 



output [`DMA_HADDR_WIDTH-1:0] de_sad; 
output [`DMA_HADDR_WIDTH-1:0] de_dad; 
`ifdef DMA_HAVE_LINKLIST 
output [`DMA_HADDR_WIDTH-1:0] de_llp; 
output [`DMA_HADDR_WIDTH-1:2] de_mllp; 
`endif 
output [`DMA_CHSZ_WIDTH-1:0] de_tsz; 
output [`DMA_HDATA_WIDTH-1:0] de_csr; 
`ifdef DMA_HAVE_LINKLIST 
output de_llpen; 
`endif 
output de_busy; 
output de_sad_we; 
output de_dad_we; 
output de_tsz_we; 
`ifdef DMA_HAVE_LINKLIST 
output de_llp_we; 
output de_csr_we; 
output de_llpen_we; 
`endif 
output de_en_clr; 

output de_abt_on_idle; 
output de_err_st; 

parameter 
DE_ST_IDLE = 11'b000_0000_0001, 
DE_ST_RD = 11'b000_0000_0010, 
DE_ST_LR = 11'b000_0000_0100, 
DE_ST_RDEND = 11'b000_0000_1000, 
DE_ST_LW = 11'b000_0001_0000, 
DE_ST_UPDATE = 11'b000_0010_0000, 
DE_ST_LLP0 = 11'b000_0100_0000, 
DE_ST_LLP1 = 11'b000_1000_0000, 
DE_ST_LLP2 = 11'b001_0000_0000, 
DE_ST_LLP3 = 11'b010_0000_0000, 
DE_ST_LLP4 = 11'b100_0000_0000; 



reg [10:0] de_st, de_nx_st; 

reg de_err_notify; 

reg de_ff_flush_d1; 
reg st_ed1s; 

wire st_idle, st_rd, st_rd_end, st_update; 
wire st_lr, st_lw, st_llp0, st_llp1, st_llp2; 
wire st_llp3, st_llp4; 

wire arb_req_qf; 





wire mp_err; 
wire llp_on; 
wire st_llp0t3,st_llp0t4; 
wire st_rd_bgn; 

wire st_ed2lw_s1,st_ed2lw_s20,st_ed2lw_s21; 


wire st_len0_bgn; 

wire st_rd2lr; 
wire st_lr2up; 
wire st_lr2ed; 
wire st_llp_bgn; 
wire st_llp_adv; 
wire m0_vld_dtp; 
wire m1_vld_dtp; 

wire pack_en; 
wire pack_end; 
wire unpack_en; 
wire upk_cnteq0,upk_cnteq1; 
wire uptp8; 
wire cv32t8; 
wire cv32t16; 
wire cv16t8; 
wire cv8t32; 
wire cv8t16; 
wire cv16t32; 
wire m0_is_src; 
wire m1_is_src; 
wire m0_is_dst; 
wire m1_is_dst; 
wire m0_is_id,m0_id_ns; 
wire m1_is_id,m1_id_ns; 

wire m0_m1_same; 

wire m0_isOidOlp, m1_isOidOlp; 


reg m1_is_llp; 



wire m0_src2dst; 
wire m0_dst2src; 
wire m0_arb_src; 
wire m0_arb_dst; 
wire m1_src2dst; 
wire m1_dst2src; 
wire m1_src2br; 
wire m1_dst2br; 





wire m1_brs2src,m1_brs2dst; 
wire m1_brd2src,m1_brd2dst,m1_err_or_rdy; 
wire m1_arb_src; 
wire m1_arb_dst; 
wire m1_arb_brs; 
wire m1_arb_brd; 
wire m1_arb_br; 






wire [`DMA_HDATA_WIDTH-1:0] mp_dt; 
wire tsz_upd; 
wire bst_upd; 
wire sad_upd; 
wire dad_upd; 
wire [`DMA_HADDR_WIDTH-1:0] upd_sad; 
wire [`DMA_HADDR_WIDTH-1:0] upd_dad; 
wire de_ack; 


wire src_wid_wd; 
wire src_wid_hw; 
wire src_wid_bt; 
wire dst_wid_wd; 
wire dst_wid_hw; 
wire dst_wid_bt; 

wire dst_m; 
wire src_m; 
wire dst_a; 
wire src_a; 
wire dst_e; 
wire src_e; 


wire arb_chtsz_eq0; 

wire tsz_eq0; 
wire tsz_eq1; 
wire tsz_eq2; 
wire bst_eq0; 
wire bst_eq1; 
wire bst_eq2; 

wire br_req_qf; 
wire m0_err,m1_err,m1_dma_err; 
wire st_rd_1s; 
wire llp_dprdy; 
wire fsm_end; 



`ifdef DMA_HAVE_AHB1 
`else 
wire [1:0] m1_ad1t0x ='b0; 
wire [`DMA_HADDR_WIDTH-1:0] m1_updad ='b0; 
wire m1_rdy ='b0; 
wire [`DMA_HDATA_WIDTH-1:0] m1_rdt ='b0; 
wire m1_cp ='b0; 
wire m1_tr_sq ='b0; 
wire m1_rp_err ='b0; 
wire m1_rp_rty ='b0; 
wire m1_dt_st ='b0; 
wire slv_br_req ='b0; 
wire slv_brst_cmd ='b0; 
wire slv_brst_mscd ='b0; 
`endif 



reg m0_is_llp; 
reg m0_arb_st; 
reg [1:0] m1_arb_st,m1_arb_ns; 



reg [`DMA_BSTCNT_WIDTH-1:0] bst_cnt; 



reg [`DMA_CHSZ_WIDTH-1:0] tsz_cnt; 

reg [1:0] upk_cnt0,upk_cnt1,upk_cnt_ii; 
wire [1:0] upk_cnt_i; 




assign st_idle = de_st[0]; 
assign st_rd = de_st[1]; 
assign st_lr = de_st[2]; 
assign st_rd_end = de_st[3]; 
assign st_lw = de_st[4]; 
assign st_update = de_st[5]; 
assign st_llp0 = de_st[6]; 
assign st_llp1 = de_st[7]; 
assign st_llp2 = de_st[8]; 
assign st_llp3 = de_st[9]; 
assign st_llp4 = de_st[10]; 



`ifdef DMA_HAVE_LINKLIST 
assign llp_on = (|arb_chllp[31:2]&tsz_eq0); 
`else 
assign llp_on = 0; 
`endif 

`ifdef DMA_HAVE_LINKLIST 
assign st_llp0t3 = st_llp0|st_llp1|st_llp2|st_llp3; 
`endif 

`ifdef DMA_HAVE_LINKLIST 
assign st_llp0t4 = st_llp0t3|st_llp4; 
`else 
assign st_llp0t4 = 0; 
`endif 

`ifdef DMA_HAVE_LINKLIST 
assign de_llpen_we = (st_update); 
assign de_llpen = (llp_on); 

wire de_mllp_we = st_idle&st_llp_bgn; 
wire [`DMA_HADDR_WIDTH-1:2] upd_llp; 
reg [`DMA_HADDR_WIDTH-1:2] de_mllp; 

assign upd_llp = (m0_is_llp? m0_updad[31:2] : m1_updad[31:2]); 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
de_mllp <= 'h0; 
else if(de_mllp_we) 
de_mllp <= arb_chllp[31:2]; 
else if(llp_dprdy) 
de_mllp <= upd_llp; 
`endif 


wire de_err_ok; 





wire md_rdy = (m0_is_dst&m0_rdy)| 
(m1_is_dst&m1_rdy); 



`ifdef DMA_HAVE_BRIDGE 


wire m1_arb_src_dp = m1_arb_src; 
wire m1_arb_dst_dp = m1_arb_dst; 




`else 
wire m1_arb_src_dp = m1_arb_src; 
wire m1_arb_dst_dp = m1_arb_dst; 
`endif 


wire src_dprdy = (m0_is_src&m0_arb_src&m0_vld_dtp&m0_rdy)| 


(m1_is_src&m1_arb_src_dp&m1_vld_dtp&m1_rdy); 




wire dst_dprdy = (m0_is_dst&m0_arb_dst&m0_vld_dtp&m0_rdy)| 


(m1_is_dst&m1_arb_dst_dp&m1_vld_dtp&m1_rdy); 




wire s_d_dprdy = src_dprdy | dst_dprdy; 


wire src_cprdy = (m0_is_src&m0_arb_src&m0_cp&m0_rdy)| 
(m1_is_src&m1_arb_src&m1_cp&m1_rdy); 
wire dst_cprdy = (m0_is_dst&m0_arb_dst&m0_cp&m0_rdy)| 
(m1_is_dst&m1_arb_dst&m1_cp&m1_rdy); 



wire dst_rty = (m0_is_dst&m0_arb_dst&m0_rp_rty&m0_vld_dtp)| 
(m1_is_dst&m1_arb_dst&m1_rp_rty&m1_vld_dtp); 




`ifdef DMA_HAVE_LINKLIST 
assign llp_dprdy = (m0_is_llp&m0_vld_dtp&m0_rdy)| 
(m1_is_llp&~m1_arb_br&m1_vld_dtp&m1_rdy); 
`else 
assign llp_dprdy = 1; 
`endif 


/* 

assign ms_err = (m0_is_src&m0_arb_src&m0_err)| 
(m1_is_src&m1_arb_src&m1_err); 
assign md_err = (m0_is_dst&m0_arb_dst&m0_err)| 
(m1_is_dst&m1_arb_dst&m1_err); 
*/ 

`ifdef DMA_HAVE_LINKLIST 
assign mp_err = (m0_is_llp&m0_err)| 
(m1_is_llp&~m1_arb_br&m1_err); 
`else 
assign mp_err = 0; 
`endif 










assign de_abt_on_idle = st_idle&arb_abt_any; 
assign arb_req_qf = arb_req&~de_abt_on_idle; 



`ifdef DMA_HAVE_LINKLIST 

`else 
wire arb_chllpen = 0; 
`endif 








assign st_llp_bgn = (arb_req_qf&arb_chllpen); 
assign st_rd_bgn = (arb_req_qf&~arb_chllpen); 






assign st_len0_bgn = (arb_req_qf&~arb_chllpen&arb_chtsz_eq0); 
















assign st_rd2lr = m0_m1_same&( 
((bst_eq2|tsz_eq2|(ff_2ltfl&~pack_en))& 
src_dprdy) | 
((bst_eq1|tsz_eq1)&src_cprdy) | 
(ff_1ltfl&(pack_en&ff_cnv_q_vld))); 
/* 
assign st_rd2lr = ((bst_eq2|tsz_eq2|(ff_2ltfl&~pack_en))& 
src_dprdy) | 

((bst_eq1|tsz_eq1)&src_cprdy) | 
(ff_1ltfl&(pack_en&ff_cnv_q_vld)); 
*/ 








assign st_lr2ed = src_dprdy; 












assign st_lr2up = (de_err_ok); 














wire st_rd2up = de_err_ok | 
(!m0_m1_same&(bst_eq0|tsz_eq0)&!de_ff_flush_d1&!ff_wr&st_ed2lw_s20&dst_dprdy); 










wire st_ed1swe = st_lr&st_lr2ed; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
st_ed1s <= 1'b1; 
else if(st_ed1swe) 
st_ed1s <= 1'b0; 
else if(~st_ed1s) 
st_ed1s <= 1'b1; 

assign st_ed2lw_s1 = (((ff_eq1&~unpack_en)|(ff_eq2&upk_cnteq1))&dst_dprdy); 
assign st_ed2lw_s20 = (ff_eq2&(~unpack_en|upk_cnteq0)); 
assign st_ed2lw_s21 = (st_ed2lw_s20&dst_cprdy); 
wire st_ed2lw = st_ed1s & st_ed2lw_s1 & st_ed2lw_s21; 






wire st_ed2up = (de_err_ok); 



wire st_lw2rd = ~(bst_eq0|tsz_eq0) | dst_dprdy; 





assign fsm_end = (bst_eq0|tsz_eq0)&ff_eq2&dst_dprdy; 












wire st_lw2up = fsm_end | 
arb_chabt | 
s_d_dprdy | 
de_err_ok; 


assign m0_vld_dtp = m0_dt_st; 
assign m1_vld_dtp = m1_dt_st; 

`ifdef DMA_HAVE_LINKLIST 
assign st_llp_adv = llp_dprdy; 


wire st_llp2up = (mp_err); 
`endif 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) de_st <= DE_ST_IDLE; 
else de_st <= de_nx_st; 

always @(de_st or st_rd_bgn or st_len0_bgn 
or st_rd2up or st_rd2lr or st_lr2ed 
or st_lr2up or st_lw2rd or st_ed2up 
or st_ed2lw or st_lw2up 
`ifdef DMA_HAVE_LINKLIST 
or st_llp_bgn 
or st_llp2up 
or st_llp_adv 
`endif 
) 
case(de_st) 
DE_ST_IDLE: 


if(st_len0_bgn) 
de_nx_st = DE_ST_UPDATE; 
else if(st_rd_bgn) 
de_nx_st = DE_ST_RD; 




`ifdef DMA_HAVE_LINKLIST 
else if(st_llp_bgn) 
de_nx_st = DE_ST_LLP0; 
`endif 
else 
de_nx_st = DE_ST_IDLE; 
DE_ST_RD: 
if(st_rd2up) 
de_nx_st = DE_ST_UPDATE; 
else if(st_rd2lr) 
de_nx_st = DE_ST_LR; 




else 
de_nx_st = DE_ST_RD; 
DE_ST_LR: 
if(st_lr2up) 
de_nx_st = DE_ST_UPDATE; 
else if(st_lr2ed) 
de_nx_st = DE_ST_RDEND; 
else 
de_nx_st = DE_ST_LR; 
DE_ST_RDEND: 
if(st_ed2up) 
de_nx_st = DE_ST_UPDATE; 
else if(st_ed2lw) 
de_nx_st = DE_ST_LW; 
else 
de_nx_st = DE_ST_RDEND; 
DE_ST_LW: 
if(st_lw2up) 
de_nx_st = DE_ST_UPDATE; 
else if(st_lw2rd) 
de_nx_st = DE_ST_RD; 
else 
de_nx_st = DE_ST_LW; 
DE_ST_UPDATE: 
de_nx_st = DE_ST_IDLE; 
`ifdef DMA_HAVE_LINKLIST 
DE_ST_LLP0: 
if(st_llp2up) 
de_nx_st = DE_ST_UPDATE; 
else if(st_llp_adv) 
de_nx_st = DE_ST_LLP1; 
else 
de_nx_st = DE_ST_LLP0; 
DE_ST_LLP1: 
if(st_llp2up) 
de_nx_st = DE_ST_UPDATE; 
else if(st_llp_adv) 
de_nx_st = DE_ST_LLP2; 
else 
de_nx_st = DE_ST_LLP1; 
DE_ST_LLP2: 
if(st_llp2up) 
de_nx_st = DE_ST_UPDATE; 
else if(st_llp_adv) 
de_nx_st = DE_ST_LLP3; 
else 
de_nx_st = DE_ST_LLP2; 
DE_ST_LLP3: 
if(st_llp2up) 
de_nx_st = DE_ST_UPDATE; 
else if(st_llp_adv) 
de_nx_st = DE_ST_LLP4; 
else 
de_nx_st = DE_ST_LLP3; 
DE_ST_LLP4: 
de_nx_st = DE_ST_RD; 
`endif 
default: 
de_nx_st = DE_ST_IDLE; 

endcase 

assign de_busy = ~st_idle; 


assign cv32t8 = (arb_chcsr[12]&~arb_chcsr[9]&~arb_chcsr[8]); 
assign cv32t16 = (arb_chcsr[12]&arb_chcsr[8]); 
assign cv16t8 = (arb_chcsr[11]&~arb_chcsr[9]&~arb_chcsr[8]); 
assign cv8t32 = (~arb_chcsr[12]&~arb_chcsr[11]&arb_chcsr[9]&~arb_chcsr[5]); 
assign cv8t16 = (~arb_chcsr[12]&~arb_chcsr[11]&arb_chcsr[8]&~arb_chcsr[5]); 
assign cv16t32 = (arb_chcsr[11]&arb_chcsr[9]&~arb_chcsr[5]); 


assign cvtp2 = ((~arb_chcsr[12]&~arb_chcsr[11]&arb_chcsr[8])| 
(arb_chcsr[11]&arb_chcsr[9]))& 
~arb_chcsr[5]; 


assign uptp8 = (arb_chcsr[11]|arb_chcsr[12])&(~arb_chcsr[9]&~arb_chcsr[8]); 

assign pack_en = ((~arb_chcsr[12]&arb_chcsr[9])| 
(~arb_chcsr[12]&~arb_chcsr[11]&arb_chcsr[8]))& 
~arb_chcsr[5]; 

assign pack_end = ((ff_cbe[2]&cv8t32)|(~ff_cbe[3]&cvtp2)); 

assign unpack_en = (arb_chcsr[12]&~arb_chcsr[9])| 
(arb_chcsr[11]&~arb_chcsr[9]&~arb_chcsr[8]); 

assign m0_is_src = ~arb_chcsr[`DMA_CHCSR_SRC]; 
assign m1_is_src = arb_chcsr[`DMA_CHCSR_SRC]; 
assign m0_is_dst = ~arb_chcsr[`DMA_CHCSR_DST]; 
assign m1_is_dst = arb_chcsr[`DMA_CHCSR_DST]; 
assign m0_is_id = m0_is_src&m0_is_dst; 
assign m0_id_ns = m0_is_dst&~m0_is_src; 
assign m1_is_id = m1_is_src&m1_is_dst; 
assign m1_id_ns = m1_is_dst&~m1_is_src; 

`ifdef DMA_HAVE_AHB1 
assign m0_m1_same = (m0_is_src&m0_is_dst)| 
(m1_is_src&m1_is_dst); 
`else 
assign m0_m1_same = 1; 
wire m1_dtp = 0; 
wire m1_dma_had_a_rty = 0; 
`endif 




assign m0_isOidOlp = m0_is_src|m0_is_dst|m0_is_llp; 
assign m1_isOidOlp = m1_is_src|m1_is_dst|m1_is_llp; 

`ifdef DMA_HAVE_LINKLIST 







always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
m0_is_llp <= 'h0; 
else if(st_llp0) 
m0_is_llp <= ~arb_chllp[0]; 




else if(st_llp4|st_update) 
m0_is_llp <= 'h0; 




always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
m1_is_llp <= 'h0; 
else if(st_llp0) 
m1_is_llp <= arb_chllp[0]; 




else if(st_llp4|st_update) 
m1_is_llp <= 'h0; 





`endif 



assign m0_src2dst = (st_rd&m0_id_ns)|(st_lr&m0_vld_dtp&m0_is_id&m0_rdy); 



assign m0_dst2src = (st_lw&m0_vld_dtp&m0_is_id&m0_rdy) | st_update; 


assign m0_arb_src = ~m0_arb_st; 
assign m0_arb_dst = m0_arb_st; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
m0_arb_st <= 1'b0; 
else if(m0_src2dst) 
m0_arb_st <= 1'b1; 
else if(m0_dst2src) 
m0_arb_st <= 1'b0; 




assign m1_src2dst = (st_rd&m1_id_ns)|(st_lr&m1_vld_dtp&m1_is_id&m1_rdy); 




assign m1_dst2src = (st_lw&m1_vld_dtp&m1_is_id&m1_rdy) | st_update; 


`ifdef DMA_HAVE_BRIDGE 








/* 
assign m1_src2br = br_req_qf&((!(m1_cp&!m1_vld_dtp))& 
(!m1_vld_dtp&m1_rdy)); 
assign m1_dst2br = br_req_qf&((!(m1_cp&!m1_vld_dtp))& 
(!m1_vld_dtp&m1_rdy)); 
*/ 

assign m1_src2br = br_req_qf&!(m1_cp|m1_dtp)&!m1_dma_had_a_rty; 
assign m1_dst2br = m1_src2br; 

/* 
assign m1_src2br = br_req_qf&(!(m1_cp&!m1_dtp))& 
((!m1_dtp&m1_rdy)| 
(!m1_cp&!m1_dtp)); 
assign m1_dst2br = br_req_qf&(!(m1_cp&!m1_dtp))& 
((!m1_dtp&m1_rdy)| 
(!m1_cp&!m1_dtp)); 
*/ 



































assign m1_err_or_rdy = (m1_err|(m1_vld_dtp&m1_rdy)); 
assign m1_brd2src = slv_brst_mscd&(st_update|st_idle|st_llp0t4| 
(st_rd&m1_is_src))&m1_err_or_rdy; 
assign m1_brs2dst = slv_brst_mscd&(st_rd&m1_id_ns)&m1_err_or_rdy; 






assign m1_brs2src = slv_brst_mscd&m1_err_or_rdy; 
assign m1_brd2dst = slv_brst_mscd&m1_err_or_rdy; 




`else 
assign m1_src2br = 0; 
assign m1_dst2br = 0; 
assign m1_err_or_rdy = 0; 
assign m1_brs2src = 0; 
assign m1_brd2dst = 0; 


`endif 

assign m1_arb_src = (m1_arb_st == 2'b00); 
assign m1_arb_dst = (m1_arb_st == 2'b01); 

`ifdef DMA_HAVE_BRIDGE 
assign m1_arb_brs = (m1_arb_st == 2'b10); 
assign m1_arb_brd = (m1_arb_st == 2'b11); 
`endif 

`ifdef DMA_HAVE_BRIDGE 
assign m1_arb_br = m1_arb_st[1]; 
`else 
assign m1_arb_br = 0; 
`endif 

/* Daniel Modified 8/19/2003 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
m1_arb_st <= 2'b00; 
`ifdef DMA_HAVE_BRIDGE 
else if(m1_arb_src&m1_src2br) 
m1_arb_st <= 2'b10; 
else if(m1_arb_brs&m1_br2src) 
m1_arb_st <= 2'b00; 
else if(m1_arb_dst&m1_dst2br) 
m1_arb_st <= 2'b11; 
else if(m1_arb_brd&m1_brd2src) 
m1_arb_st <= 2'b00; 
else if(m1_arb_brd&m1_br2dst) 
m1_arb_st <= 2'b01; 
`endif 
else if(m1_arb_src&m1_src2dst) 
m1_arb_st <= 2'b01; 
else if(m1_arb_dst&m1_dst2src) 
m1_arb_st <= 2'b00; 
*/ 

parameter 
M1_ARB_SRC = 2'b00, 
M1_ARB_DST = 2'b01, 
M1_ARB_BS = 2'b10, 
M1_ARB_BD = 2'b11; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
m1_arb_st <= M1_ARB_SRC; 
else 
m1_arb_st <= m1_arb_ns; 

always @(m1_arb_st 
`ifdef DMA_HAVE_BRIDGE 
or m1_src2br or m1_dst2br or m1_brs2dst or m1_brs2src 
or m1_brd2src or m1_brd2dst 
`endif 
or m1_src2dst or m1_dst2src) 

case(m1_arb_st) 
M1_ARB_SRC: begin 
`ifdef DMA_HAVE_BRIDGE 
if(m1_src2br) m1_arb_ns = M1_ARB_BS; 
else 
`endif 
if(m1_src2dst) m1_arb_ns = M1_ARB_DST; 
else m1_arb_ns = M1_ARB_SRC; 
end 
M1_ARB_DST: begin 
`ifdef DMA_HAVE_BRIDGE 
if(m1_dst2br) m1_arb_ns = M1_ARB_BD; 
else 
`endif 
if(m1_dst2src) m1_arb_ns = M1_ARB_SRC; 
else m1_arb_ns = M1_ARB_DST; 
end 
`ifdef DMA_HAVE_BRIDGE 
M1_ARB_BS: begin 
if(m1_brs2dst) m1_arb_ns = M1_ARB_DST; 
else if(m1_brs2src) m1_arb_ns = M1_ARB_SRC; 
else m1_arb_ns = M1_ARB_BS; 
end 
M1_ARB_BD: begin 
if(m1_brd2src) m1_arb_ns = M1_ARB_SRC; 
else if(m1_brd2dst) m1_arb_ns = M1_ARB_DST; 
else m1_arb_ns = M1_ARB_BD; 
end 
`endif 
default: 
m1_arb_ns = M1_ARB_SRC; 
endcase 

`ifdef DMA_HAVE_BRIDGE 









assign br_req_qf = slv_br_req; 













`endif 



assign de_ff_ado = m0_is_src? m0_ad1t0x : m1_ad1t0x; 

assign de_ff_push = ~st_idle&~st_llp0t4&src_dprdy; 







assign de_ff_ahead = (((m0_is_dst&m0_tr_sq)|(m1_is_dst&m1_tr_sq))&upk_cnteq0); 

assign de_ff_dto = (m0_is_src & m0_arb_src)? m0_rdt : m1_rdt; 

assign de_ff_pop = (dst_dprdy&(~unpack_en|upk_cnteq0)); 



assign de_ff_flush = ((m0_m1_same&st_rd_end)|(!m0_m1_same)) 
& (bst_eq0 | tsz_eq0) & ff_part_wd; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
de_ff_flush_d1 <= 1'b0; 
else 
de_ff_flush_d1 <= de_ff_flush; 

assign de_ff_clear = st_update; 

assign de_ff_ini = st_rd_1s; 


assign tsz_upd = src_dprdy; 
assign bst_upd = src_dprdy; 
assign sad_upd = src_dprdy; 
assign dad_upd = dst_dprdy; 
assign upd_sad = (m0_is_src? m0_updad : m1_updad); 
assign upd_dad = (m0_is_dst? m0_updad : m1_updad); 


wire [`DMA_CHSZ_WIDTH-1:0] upd_tsz = (tsz_cnt - 1); 

`ifdef DMA_HAVE_LINKLIST 
assign mp_dt = m0_is_llp? m0_rdt : m1_rdt; 
`endif 

`ifdef DMA_HAVE_LINKLIST 
assign de_csr = mp_dt; 
`endif 

assign de_sad = 
`ifdef DMA_HAVE_LINKLIST 
st_llp0? mp_dt : 
`endif 
upd_sad; 
assign de_dad = 
`ifdef DMA_HAVE_LINKLIST 
st_llp1? mp_dt : 
`endif 
upd_dad; 

`ifdef DMA_HAVE_LINKLIST 
assign de_llp = mp_dt; 
`endif 

assign de_tsz = 
`ifdef DMA_HAVE_LINKLIST 
st_llp3? mp_dt[`DMA_CHSZ_WIDTH-1:0]: 
`endif 
upd_tsz; 

assign de_sad_we = 
`ifdef DMA_HAVE_LINKLIST 
(st_llp0&llp_dprdy)| 
`endif 
(~st_llp0t4&sad_upd); 
assign de_dad_we = 
`ifdef DMA_HAVE_LINKLIST 
(st_llp1&llp_dprdy)| 
`endif 
(~st_llp0t4&dad_upd); 
`ifdef DMA_HAVE_LINKLIST 
assign de_llp_we = (st_llp2&llp_dprdy); 
assign de_csr_we = (st_llp3&llp_dprdy); 
`endif 
assign de_tsz_we = 
`ifdef DMA_HAVE_LINKLIST 
(st_llp3&llp_dprdy)| 
`endif 
(~st_llp0t4&tsz_upd); 

















assign m0_err = m0_vld_dtp&m0_rp_err; 
assign m1_err = m1_vld_dtp&m1_rp_err; 
assign m1_dma_err= m1_err&~m1_arb_br; 


assign de_en_clr = (st_update&(arb_chabt| 



de_err_notify| 
(~de_err_notify&tsz_eq0&~llp_on) 
) 
); 



assign de_tc_st = (st_update&tsz_eq0&~de_err_notify); 
assign de_err_st = m0_err|m1_dma_err; 



always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
de_err_notify <= 1'b0; 
else if(de_err_st) 
de_err_notify <= 1'b1; 
else if(st_update) 
de_err_notify <= 1'b0; 
`ifdef DMA_HAVE_AHB1 
assign de_err_ok = de_err_notify & (!m0_isOidOlp|m0_dma_err_ok) & 
(!m1_isOidOlp|m1_dma_err_ok); 
`else 
assign de_err_ok = de_err_notify & m0_dma_err_ok; 
`endif 




assign de_ack = st_update; 






reg st_rd_msk; 
reg [`DMA_BSTCNT_WIDTH-1:0] bst_cntin; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
st_rd_msk <= 1'b1; 
else if(st_rd_msk&st_rd) 
st_rd_msk <= 1'b0; 
else if(~st_rd_msk&st_update) 
st_rd_msk <= 1'b1; 

assign st_rd_1s = st_rd & st_rd_msk; 

always @(arb_chcsr) 
case(arb_chcsr[`DMA_CHCSR_SSZ]) 
3'b000: bst_cntin = 'b0_0000_0001; 
3'b001: bst_cntin = 'b0_0000_0100; 
3'b010: bst_cntin = 'b0_0000_1000; 
3'b011: bst_cntin = 'b0_0001_0000; 
3'b100: bst_cntin = 'b0_0010_0000; 
3'b101: bst_cntin = 'b0_0100_0000; 
3'b110: bst_cntin = 'b0_1000_0000; 
3'b111: bst_cntin = 'b1_0000_0000; 
endcase 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
bst_cnt <= 0; 
else if(st_rd_1s) 
bst_cnt <= bst_cntin; 
else if(bst_upd) 
bst_cnt <= bst_cnt-1; 






wire tsz_ini = st_rd_1s; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
tsz_cnt <= 0; 
else if(tsz_ini) 
tsz_cnt <= arb_chtsz; 
else if(tsz_upd) 
tsz_cnt <= upd_tsz; 

/* 
When de_st is UPDATE state and total size reach 0, 
DMAEN bit(on the csr register) will clear. 
When terminal count(de_tc), write done register(and asserts INTERRUPT if enabled). 
When burst length is reached, de_ack asserted then DMAC_ACK asserted. 
When error(m0_rp_err|m1_rp_err and not bridge request) occured, latch and go to 
UPDATE state as soon as possible. Set the ERR bit on Cn_Str. Set DMAEN bit 
to 0. 
When channel abort bit(ABT) is set, dma engine enters UPDATE state as soon as 
possible and clear FIFO. 
*/ 










wire cvupt2 = cv32t16|cv16t8; 
wire ld_upk_cnt0 = st_rd_1s; 
wire rl_upk_cnt0 = ((upk_cnt0==0)&dst_cprdy)| 
dst_rty; 
wire upk_cnt0_go = dst_cprdy; 
wire upk_cnt1_go = dst_dprdy; 

assign upk_cnteq0 = (upk_cnt1 == 0); 
assign upk_cnteq1 = (upk_cnt1 == 1); 






wire [1:0] upk_cnt0_fix = {upk_cnt0[1]^dst_m,upk_cnt0[0]^dst_m}; 
wire [1:0] fwdtsb0 = {((cv32t8&~upk_cnt0_fix[1])|(cv32t16&~upk_cnt0_fix[0])), 
((uptp8&~upk_cnt0_fix[0])|~uptp8)}; 
wire [1:0] fwdtsb1 = {(((cv32t8&~upk_cnt0_fix[1])|(cv32t16&~upk_cnt0_fix[0]))|(~(cv32t8|cv32t16)&~cv16t8)), 
(uptp8&~upk_cnt0_fix[0])}; 
wire [1:0] fwdtsb2 = {((cv32t8&~upk_cnt0_fix[1])|(cv32t16&~upk_cnt0_fix[0])), 
(uptp8&~upk_cnt0_fix[0])}; 
wire [1:0] fwdtsb3 = {(((cv32t8&~upk_cnt0_fix[1])|(cv32t16&~upk_cnt0_fix[0]))|(~(cv32t8|cv32t16)&~cv16t8)), 
((uptp8&~upk_cnt0_fix[0])|~uptp8)}; 













always @(cv32t8 or cvupt2) 
case({cv32t8, cvupt2}) 
2'b01: upk_cnt_ii = 'b01; 
2'b10: upk_cnt_ii = 'b11; 
default:upk_cnt_ii = 'b00; 
endcase 






assign upk_cnt_i = dst_rty? upk_cnt1 : upk_cnt_ii; 












always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
upk_cnt0 <= 'b0; 
else if(ld_upk_cnt0) 
upk_cnt0 <= upk_cnt_i; 
else if(rl_upk_cnt0) 
upk_cnt0 <= upk_cnt_i; 
else if(upk_cnt0_go) 
upk_cnt0 <= upk_cnt0 - 1; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
upk_cnt1 <= 'b0; 
else if(ld_upk_cnt0) 
upk_cnt1 <= upk_cnt_i; 
else if(upk_cnt1_go) 
upk_cnt1 <= upk_cnt0; 




assign src_wid_wd = (arb_chcsr[`DMA_CHCSR_SWID] == `DMA_HSIZE_WORD); 
assign src_wid_hw = (arb_chcsr[`DMA_CHCSR_SWID] == `DMA_HSIZE_HALFWORD); 
assign src_wid_bt = (arb_chcsr[`DMA_CHCSR_SWID] == `DMA_HSIZE_BYTE); 
assign dst_wid_wd = (arb_chcsr[`DMA_CHCSR_DWID] == `DMA_HSIZE_WORD); 
assign dst_wid_hw = (arb_chcsr[`DMA_CHCSR_DWID] == `DMA_HSIZE_HALFWORD); 
assign dst_wid_bt = (arb_chcsr[`DMA_CHCSR_DWID] == `DMA_HSIZE_BYTE); 


assign dst_m = (~arb_chcsr[4]& 
arb_chcsr[3]); 
assign src_m = (~arb_chcsr[6]& 
arb_chcsr[5]); 
assign dst_a = (~arb_chcsr[4]& 
~arb_chcsr[3]); 
assign src_a = (~arb_chcsr[6]& 
~arb_chcsr[5]); 
assign dst_e = arb_chcsr[4]; 
assign src_e = arb_chcsr[6]; 



assign arb_chtsz_eq0 = (arb_chtsz == 0); 

assign tsz_eq0 = (tsz_cnt == 0); 
assign tsz_eq1 = (tsz_cnt == 1); 
assign tsz_eq2 = (tsz_cnt == 2); 
assign bst_eq0 = (bst_cnt[`DMA_BSTCNT_WIDTH-1:0] == 0); 
assign bst_eq1 = (bst_cnt[`DMA_BSTCNT_WIDTH-1:0] == 1); 
assign bst_eq2 = (bst_cnt[`DMA_BSTCNT_WIDTH-1:0] == 2); 

endmodule 
