





































`include "DMA_DEFINE.vh" 

module dma_ahbmst 
( 

HCLK, 
HRSTn, 



arb_chcsr, 
`ifdef DMA_HAVE_LINKLIST 
arb_chllp, 
`endif 
arb_chsad, 
arb_chdad, 

arb_chabt, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
slv_br_req, 
slv_br_ad, 
slv_br_dt, 
slv_br_wr, 
slv_br_sz, 
slv_br_pt, 
br_req_qf, 
`endif 
`endif 

ff_dto, 

bst_eq0,bst_eq1, bst_eq2, 
tsz_eq0,tsz_eq1, tsz_eq2, 
de_st, 

de_err_notify, 


de_err_st, 
`ifdef DMA_HAVE_LINKLIST 
de_mllp, 
`endif 
pack_en, 
pack_end, 
unpack_en, 
upk_cnteq0, 
upk_cnteq1, 
ff_eq1,ff_eq2,ff_1ltfl,ff_2ltfl,ff_geth, 

ff_empty, ff_q_full, 
`ifdef DMA_HAVE_LINKLIST 
st_llp0t3, 
`endif 

dst_m,src_m, 
dst_a,src_a, 
dst_e,src_e, 
dst_wid_wd, src_wid_wd, 
dst_wid_hw, src_wid_hw, 
dst_wid_bt, src_wid_bt, 
mx_is_dst, mx_is_src, 
`ifdef DMA_HAVE_LINKLIST 
mx_is_llp, 
`endif 
mx_arb_src, mx_arb_dst, 

m1_src2br, 

m0_m1_same, 

`ifdef DMA_HAVE_BRIDGE 
mx_arb_br, 
`endif 

fwdtsb0, fwdtsb1, fwdtsb2, fwdtsb3, 
m0endian, 
m1endian, 


mx_ad1t0x, 
mx_updad, 
mx_rdto, 
mx_cp, 
mx_tr_sq, 
mx_rp_err, 
mx_rp_rty, 
mx_dt_st, 

mx_dtp, 
mx_dma_had_a_rty, 

mx_dma_err_ok, 


hrdatai, 
hreadyini, 
hrespi, 


haddro, 
htranso, 
hwriteo, 
hsizeo, 
hproto, 
hbursto, 
hwdatao, 



hgranti, 
hreqo 
); 


input HCLK; 
input HRSTn; 



input [`DMA_CHCSR_WIDTH-1:0] arb_chcsr; 
`ifdef DMA_HAVE_LINKLIST 
input [`DMA_HADDR_WIDTH-1:0] arb_chllp; 
`endif 
input [`DMA_HADDR_WIDTH-1:0] arb_chsad; 
input [`DMA_HADDR_WIDTH-1:0] arb_chdad; 
input arb_chabt; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
input slv_br_req; 
input [`DMA_HADDR_WIDTH-1:0] slv_br_ad; 
input [`DMA_HDATA_WIDTH-1:0] slv_br_dt; 
input slv_br_wr; 
input [`DMA_HSIZE_WIDTH-1:0] slv_br_sz; 
input [`DMA_HPROT_WIDTH-1:0] slv_br_pt; 
input br_req_qf; 
`endif 
`endif 

input [`DMA_HDATA_WIDTH-1:0] ff_dto; 


input bst_eq0,bst_eq1, bst_eq2; 
input tsz_eq0,tsz_eq1, tsz_eq2; 
input [10:0] de_st; 

input de_err_notify; 

input de_err_st; 
`ifdef DMA_HAVE_LINKLIST 
input [`DMA_HADDR_WIDTH-1:2] de_mllp; 
`endif 
input pack_en; 
input pack_end; 
input unpack_en; 
input upk_cnteq1; 
input upk_cnteq0; 
input ff_eq1,ff_eq2,ff_1ltfl,ff_2ltfl,ff_geth; 
input ff_empty,ff_q_full; 
`ifdef DMA_HAVE_LINKLIST 
input st_llp0t3; 
`endif 

input dst_m,src_m; 
input dst_a,src_a; 
input dst_e,src_e; 
input dst_wid_wd, src_wid_wd; 
input dst_wid_hw, src_wid_hw; 
input dst_wid_bt, src_wid_bt; 
input mx_is_dst, mx_is_src; 
`ifdef DMA_HAVE_LINKLIST 
input mx_is_llp; 
`endif 
input mx_arb_src, mx_arb_dst; 

input m1_src2br; 

input m0_m1_same; 

`ifdef DMA_HAVE_BRIDGE 
input mx_arb_br; 
`endif 

input [1:0] fwdtsb0,fwdtsb1,fwdtsb2,fwdtsb3; 
input m0endian; 
input m1endian; 


output [1:0] mx_ad1t0x; 
output [`DMA_HADDR_WIDTH-1:0] mx_updad; 
output [`DMA_HDATA_WIDTH-1:0] mx_rdto; 
output mx_cp; 
output mx_tr_sq; 
output mx_rp_err; 
output mx_rp_rty; 
output mx_dt_st; 

output mx_dtp; 
output mx_dma_had_a_rty; 

output mx_dma_err_ok; 



input [`DMA_HDATA_WIDTH-1:0] hrdatai; 
input hreadyini; 
input [`DMA_HRESP_WIDTH-1:0] hrespi; 


output [`DMA_HADDR_WIDTH-1:0] haddro; 
output [`DMA_HTRANS_WIDTH-1:0] htranso; 
output hwriteo; 
output [`DMA_HSIZE_WIDTH-1:0] hsizeo; 
output [`DMA_HPROT_WIDTH-1:0] hproto; 
output [`DMA_HBURST_WIDTH-1:0] hbursto; 
output [`DMA_HDATA_WIDTH-1:0] hwdatao; 


input hgranti; 
output hreqo; 



parameter THIS_IS_M1 = 1; 

parameter MX_ST_IDLE = `DMA_HTRANS_IDLE, 
MX_ST_NS = `DMA_HTRANS_NONSEQ, 
MX_ST_SQ = `DMA_HTRANS_SEQ; 

parameter MX_DT_IDLE = 3'b001, 
MX_DT_DT = 3'b010, 
MX_DT_LT = 3'b100; 

reg mx_dt_st; 
reg m0_m1_diff_tx; 




reg [`DMA_HTRANS_WIDTH-1:0] mx_cmd_st, mx_cmd_ns; 




wire st_idle,st_rd,st_lr,st_rd_end,st_lw,st_update; 
`ifdef DMA_HAVE_LINKLIST 
wire st_llp0,st_llp1,st_llp2,st_llp3,st_llp4; 

`else 
wire mx_is_llp = 1'b0; 
wire st_llp0t3 = 1'b0; 
`endif 
wire mx_tr_idle,mx_tr_ns,mx_tr_sq; 
wire mx_rp_err,mx_rp_rty; 

wire src_is_sgl,dst_is_sgl; 
wire mx_idle2ns; 
wire mx_ns2idle, mx_ns2sq; 
wire mx_sq2idle; 


wire rd2wr, wr2rd; 
wire sel_dst_wid; 
wire sel_src_wid; 
wire sel_br_sz; 

wire [`DMA_HPROT_WIDTH-1:0] mux_prot; 
wire [`DMA_HBURST_WIDTH-1:0] mux_bst; 
wire [`DMA_HDATA_WIDTH-1:0] mux_wdt; 
wire ad_sel_inc, ad_sel_br; 
wire ad_sel_llp; 
wire ad_sel_dst; 
wire ad_sel_src; 

`ifdef DMA_HAVE_BRIDGE 
`else 
wire br_req_qf = 1'b0; 
wire mx_arb_br = 0; 
`endif 

wire sel_adm4, sel_adm2, sel_adm1, sel_adeq; 
wire sel_ada1, sel_ada2, sel_ada4; 
wire [`DMA_HADDR_WIDTH-1:0] ad_inc; 

wire mx_rdy; 
wire cx_1k; 
wire hbsel_sgl; 
wire mx_cmd; 
wire req_bgn, req_end; 
wire src_e_dst; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire br_req_raw; 
`endif 
`endif 



wire [`DMA_HDATA_WIDTH-1:0] mx_rdto; 

wire [`DMA_HTRANS_WIDTH-1:0] htranso; 


wire [`DMA_HSIZE_WIDTH-1:0] hsizeq; 

reg [`DMA_HSIZE_WIDTH-1:0] hsizep; 
reg [`DMA_HSIZE_WIDTH-1:0] hsizeo; 
reg hwriteo; 
reg [`DMA_HBURST_WIDTH-1:0] hbursto; 
reg [`DMA_HPROT_WIDTH-1:0] hproto; 
reg [`DMA_HADDR_WIDTH-1:0] haddro; 
reg [`DMA_HDATA_WIDTH-1:0] hwdatao; 
reg [`DMA_HADDR_WIDTH-1:0] mux_ad; 
reg hreqo; 
reg mx_dtp; 
reg [1:0] mx_ad1t0x; 

assign st_idle = de_st[0]; 
assign st_rd = de_st[1]; 
assign st_lr = de_st[2]; 
assign st_rd_end = de_st[3]; 
assign st_lw = de_st[4]; 
assign st_update = de_st[5]; 

`ifdef DMA_HAVE_LINKLIST 
assign st_llp0 = de_st[6]; 
assign st_llp1 = de_st[7]; 
assign st_llp2 = de_st[8]; 
assign st_llp3 = de_st[9]; 
assign st_llp4 = de_st[10]; 
`endif 

assign mx_tr_idle = (htranso==`DMA_HTRANS_IDLE); 
assign mx_tr_ns = (htranso==`DMA_HTRANS_NONSEQ); 
assign mx_tr_sq = (htranso==`DMA_HTRANS_SEQ); 
assign mx_cp = htranso[1]; 
assign mx_rp_err = (hrespi==`DMA_HRESP_ERROR); 
assign mx_rp_rty = hrespi[1]; 


assign src_is_sgl = (src_m|src_e); 
assign dst_is_sgl = (dst_m|dst_e); 


assign cx_1k = (&haddro[9:2] & 
(hsizeo[1]| 
(~hsizeo[1]&hsizeo[0]&haddro[1])| 
(~hsizeo[1]&~hsizeo[0]&haddro[1]&haddro[0]))); 
























wire cmd_bgn = !mx_dma_err_ok&!(m1_src2br&THIS_IS_M1)& 
((ad_sel_dst&~ff_empty) | 
(ad_sel_src&~tsz_eq0&~bst_eq0&~ff_q_full) 


`ifdef DMA_HAVE_LINKLIST 
| (mx_is_llp & st_llp0t3) 
`endif 
) 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 


| (THIS_IS_M1&br_req_qf&mx_arb_br) 
`endif 
`endif 
; 












assign mx_idle2ns = ~st_update & ~mx_dtp& cmd_bgn & hgranti & ~mx_cp & 
~de_err_st & mx_rdy; 



















wire ns_end = ((mx_arb_dst&mx_is_dst& 
((ff_eq1&upk_cnteq0)|dst_is_sgl)) | 
(mx_arb_src&mx_is_src& 
((bst_eq2|tsz_eq2|ff_1ltfl)|src_is_sgl)) | 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
THIS_IS_M1 & slv_br_req | 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
mx_is_llp & st_llp3 | 
`endif 
cx_1k | 



~hgranti); 







assign mx_ns2idle = ns_end | 
mx_rp_rty | 
mx_rp_err | 

de_err_notify | 
de_err_st; 





assign mx_ns2sq = ~ns_end; 

















wire sq_end = (mx_is_dst & mx_arb_dst & 
((ff_eq2 & ~unpack_en)|(ff_eq1 & upk_cnteq1))) | 
(mx_is_src & mx_arb_src & 
((bst_eq2|tsz_eq2) | 
(ff_2ltfl & ~pack_en)| 


(ff_1ltfl & (pack_end|mx_rdy) ))) | 





`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
THIS_IS_M1 & slv_br_req | 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
(mx_is_llp & st_llp2) | 
`endif 
cx_1k | 



~hgranti; 


assign mx_sq2idle = sq_end | 
mx_rp_rty | 
mx_rp_err | 

de_err_notify | 
de_err_st; 





always @(mx_cmd_st or mx_idle2ns or mx_ns2idle or mx_ns2sq or 
mx_sq2idle ) 
case(mx_cmd_st) 
MX_ST_IDLE: if(mx_idle2ns) 
mx_cmd_ns = MX_ST_NS; 
else 
mx_cmd_ns = MX_ST_IDLE; 
MX_ST_NS: if(mx_ns2idle) 
mx_cmd_ns = MX_ST_IDLE; 
else if(mx_ns2sq) 
mx_cmd_ns = MX_ST_SQ; 
else 
mx_cmd_ns = MX_ST_NS; 
MX_ST_SQ: if(mx_sq2idle) 
mx_cmd_ns = MX_ST_IDLE; 
else 
mx_cmd_ns = MX_ST_SQ; 


default: mx_cmd_ns = mx_cmd_st; 

endcase 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
mx_cmd_st <= MX_ST_IDLE; 
else 
mx_cmd_st <= mx_cmd_ns; 

assign htranso = mx_cmd_st; 



always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
mx_dtp <= 1'b0; 
else if(mx_rdy) 
mx_dtp <= htranso[1]; 



wire dt_stwe = hreadyini&(hrespi[1]|hrespi[0]); 
wire dt_stin = htranso[1]&~(hrespi[1]|hrespi[0]); 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
mx_dt_st <= 1'b0; 
else 
mx_dt_st <= dt_stin & dt_stwe; 

















assign rd2wr = (!(THIS_IS_M1&mx_arb_br) & mx_is_dst & 
((~mx_is_src&m0_m1_diff_tx) | 
st_rd_end)) 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 



| (THIS_IS_M1 & 
mx_arb_br & slv_br_wr) 
`endif 
`endif 
; 





assign wr2rd = (!(THIS_IS_M1&mx_arb_br) & mx_is_src & 
st_rd) 

`ifdef DMA_HAVE_LINKLIST 



| (!(THIS_IS_M1&mx_arb_br) & mx_is_llp & 
st_llp0t3) 
`endif 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 



| (THIS_IS_M1 & 
mx_arb_br & ~slv_br_wr) 
`endif 
`endif 
; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
hwriteo <= `DMA_DRW_READ; 
else if(rd2wr&mx_rdy) 
hwriteo <= `DMA_DRW_WRITE; 
else if(wr2rd&mx_rdy) 
hwriteo <= `DMA_DRW_READ; 











assign sel_dst_wid = ad_sel_dst & mx_is_dst; 
assign sel_src_wid = ad_sel_src & mx_is_src; 







assign sel_br_sz = THIS_IS_M1 & mx_arb_br; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
`else 
wire [`DMA_HSIZE_WIDTH-1:0] slv_br_sz = 0; 
`endif 
`else 
wire [`DMA_HSIZE_WIDTH-1:0] slv_br_sz = 0; 
`endif 





always @(sel_dst_wid or sel_src_wid or mx_is_llp or 
arb_chcsr or hsizeo) 
case({sel_dst_wid, sel_src_wid, mx_is_llp}) 
3'b001: hsizep = `DMA_HSIZE_WORD; 
3'b010: hsizep = arb_chcsr[`DMA_CHCSR_SWID]; 
3'b100: hsizep = arb_chcsr[`DMA_CHCSR_DWID]; 
default: hsizep = hsizeo; 
endcase 
`ifdef DMA_HAVE_BRIDGE 
assign hsizeq = (sel_br_sz) ? slv_br_sz : hsizep; 
`else 
assign hsizeq = hsizep; 
`endif 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
hsizeo <= `DMA_HSIZE_WORD; 
else if(mx_idle2ns) 
hsizeo <= hsizeq; 





























`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 


assign mux_prot = (THIS_IS_M1&mx_arb_br)? slv_br_pt : 
{arb_chcsr[`DMA_CHCSR_PR3], 
arb_chcsr[`DMA_CHCSR_PR2], 
arb_chcsr[`DMA_CHCSR_PR1], 
1'b0}; 
`else 
assign mux_prot = {arb_chcsr[`DMA_CHCSR_PR3], 
arb_chcsr[`DMA_CHCSR_PR2], 
arb_chcsr[`DMA_CHCSR_PR1], 
1'b0}; 
`endif 
`else 
assign mux_prot = {arb_chcsr[`DMA_CHCSR_PR3], 
arb_chcsr[`DMA_CHCSR_PR2], 
arb_chcsr[`DMA_CHCSR_PR1], 
1'b0}; 
`endif 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
hproto <= 4'b0; 
else if(mx_rdy) 
hproto <= mux_prot; 









assign hbsel_sgl = ~st_llp0t3&((mx_arb_src&src_is_sgl) | 
(mx_arb_dst&dst_is_sgl)) 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 


| (THIS_IS_M1&mx_arb_br) 
`endif 
`endif 
; 

assign mux_bst = hbsel_sgl ? `DMA_HBURST_SINGLE : `DMA_HBURST_INCR; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
hbursto <= `DMA_HBURST_INCR; 
else if(mx_idle2ns) 
hbursto <= mux_bst; 










reg [7:0] fxdtb0,fxdtb1,fxdtb2,fxdtb3; 

wire mxendian = (THIS_IS_M1&m1endian)|(~THIS_IS_M1&m0endian); 
wire hsizeo_hw = (hsizeo==3'h1); 
wire hsizeo_bt = (hsizeo==3'h0); 
wire tro_hw = mxendian&hsizeo_hw; 
wire tro_bt = mxendian&hsizeo_bt; 















always @(fwdtsb0 or ff_dto) 
case(fwdtsb0) 
2'b00: fxdtb0 = ff_dto[7:0]; 
2'b01: fxdtb0 = ff_dto[15:8]; 
2'b10: fxdtb0 = ff_dto[23:16]; 
2'b11: fxdtb0 = ff_dto[31:24]; 
endcase 

always @(fwdtsb1 or ff_dto) 
case(fwdtsb1) 
2'b00: fxdtb1 = ff_dto[7:0]; 
2'b01: fxdtb1 = ff_dto[15:8]; 
2'b10: fxdtb1 = ff_dto[23:16]; 
2'b11: fxdtb1 = ff_dto[31:24]; 
endcase 

always @(fwdtsb2 or ff_dto) 
case(fwdtsb2) 
2'b00: fxdtb2 = ff_dto[7:0]; 
2'b01: fxdtb2 = ff_dto[15:8]; 
2'b10: fxdtb2 = ff_dto[23:16]; 
2'b11: fxdtb2 = ff_dto[31:24]; 
endcase 

always @(fwdtsb3 or ff_dto) 
case(fwdtsb3) 
2'b00: fxdtb3 = ff_dto[7:0]; 
2'b01: fxdtb3 = ff_dto[15:8]; 
2'b10: fxdtb3 = ff_dto[23:16]; 
2'b11: fxdtb3 = ff_dto[31:24]; 
endcase 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
assign mux_wdt = (mx_arb_dst? {fxdtb3,fxdtb2,fxdtb1,fxdtb0} : slv_br_dt); 
`else 
assign mux_wdt = {fxdtb3,fxdtb2,fxdtb1,fxdtb0}; 
`endif 
`else 
assign mux_wdt = {fxdtb3,fxdtb2,fxdtb1,fxdtb0}; 
`endif 


assign mx_cmd = mx_cp&mx_rdy; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
hwdatao <= 'h0; 
else if(mx_cmd) 
hwdatao <= mux_wdt; 






assign ad_sel_inc = mx_cp&!ad_sel_br; 

`ifdef DMA_HAVE_BRIDGE 


assign ad_sel_br = (THIS_IS_M1&mx_arb_br); 
`else 
assign ad_sel_br = 1'b0; 
`endif 

`ifdef DMA_HAVE_LINKLIST 
assign ad_sel_llp = (mx_is_llp&st_llp0t3); 
`else 
assign ad_sel_llp = 0; 
`endif 





always@(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
m0_m1_diff_tx <= 0; 
else if(st_update) 
m0_m1_diff_tx <= 0; 
else if(!m0_m1_same&st_rd&(ff_geth|(tsz_eq0|bst_eq0))) 
m0_m1_diff_tx <= 1; 

assign ad_sel_dst = mx_is_dst&(m0_m1_diff_tx|st_rd_end|st_lw); 
assign ad_sel_src = mx_is_src&((!m0_m1_same&st_rd)|(st_rd|st_lr)); 

/* Daniel Modified 7/31/2003 
assign ad_sel_dst = mx_is_dst&((~mx_is_src&ff_geth)| 
st_rd_end|st_lw); 
assign ad_sel_src = mx_is_src&(st_rd|st_lr); 
*/ 



wire [31:0] arb_chsad_masked = {arb_chsad[31:2],arb_chsad[1]&~hsizep[1],arb_chsad[0]&~(hsizep[0]|hsizep[1])}; 
wire [31:0] arb_chdad_masked = {arb_chdad[31:2],arb_chdad[1]&~hsizep[1],arb_chdad[0]&~(hsizep[0]|hsizep[1])}; 
always @(ad_sel_inc 
`ifdef DMA_HAVE_LINKLIST 
or ad_sel_llp 
`endif 
or ad_sel_dst 
or ad_sel_src or ad_inc 
`ifdef DMA_HAVE_LINKLIST 
or de_mllp 
`endif 

or arb_chdad_masked or arb_chsad_masked or haddro 
or ad_sel_br 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
or slv_br_ad 
`endif 
`endif 

) 


casex({ad_sel_inc,ad_sel_br,ad_sel_llp,ad_sel_dst,ad_sel_src}) 
5'b1xxxx: mux_ad = ad_inc; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
5'b01xxx: mux_ad = slv_br_ad; 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
5'b001xx: mux_ad = {de_mllp,2'b0}; 
`endif 

5'b0001x: mux_ad = arb_chdad_masked; 
5'b00001: mux_ad = arb_chsad_masked; 
default: mux_ad = haddro; 
endcase 




always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
haddro <= 32'b0; 
else if(mx_idle2ns & mx_cmd) 
haddro <= mux_ad; 











assign sel_adm4 = (mx_arb_dst & dst_m & dst_wid_wd) | 
(mx_arb_src & src_m & src_wid_wd); 
assign sel_adm2 = (mx_arb_dst & dst_m & dst_wid_hw) | 
(mx_arb_src & src_m & src_wid_hw); 
assign sel_adm1 = (mx_arb_dst & dst_m & dst_wid_bt) | 
(mx_arb_src & src_m & src_wid_bt); 
assign sel_adeq = (mx_arb_dst & dst_e) | 
(mx_arb_src & src_e); 
assign sel_ada1 = (mx_arb_dst & dst_a & dst_wid_bt) | 
(mx_arb_src & src_a & src_wid_bt); 
assign sel_ada2 = (mx_arb_dst & dst_a & dst_wid_hw) | 
(mx_arb_src & src_a & src_wid_hw); 
assign sel_ada4 = (mx_arb_dst & dst_a & dst_wid_wd) | 
(mx_arb_src & src_a & src_wid_wd) 
`ifdef DMA_HAVE_LINKLIST 
| st_llp0t3 
`endif 
; 


reg [2:0] inc_sel, inc_selx; 

always @(sel_adeq or sel_ada1 or sel_ada2 or sel_ada4 or 
sel_adm1 or sel_adm2 or sel_adm4) 
case({sel_adeq,sel_ada1,sel_ada2,sel_ada4, 
sel_adm1,sel_adm2,sel_adm4}) 
7'b100_0000: inc_sel = 0; 
7'b010_0000: inc_sel = 1; 
7'b001_0000: inc_sel = 2; 
7'b000_1000: inc_sel = 3; 
7'b000_0100: inc_sel = 4; 
7'b000_0010: inc_sel = 5; 
7'b000_0001: inc_sel = 6; 
default: inc_sel = 0; 
endcase 




`ifdef DMA_HAVE_LINKLIST 
wire [2:0] inc_sel1 = st_llp0t3 ? 3 : inc_sel; 
`else 
wire [2:0] inc_sel1 = inc_sel; 
`endif 

always @(posedge HCLK) 
inc_selx <= inc_sel1; 







parameter ADD_CENTER = 16; 

wire [ADD_CENTER:0] ad_add_lo; 
wire [31:ADD_CENTER] add_hia1; 
wire [31:ADD_CENTER] add_him1; 
wire [31:ADD_CENTER] add_hi; 
wire ad_add_cf; 
reg [ADD_CENTER:0] ad_addin2; 
reg add_cfx; 
reg adin_is_neg; 

always @(inc_selx) 
case(inc_selx) 
0: ad_addin2 = 0; 
1: ad_addin2 = 1; 
2: ad_addin2 = 2; 
3: ad_addin2 = 4; 
4: ad_addin2 = -1; 
5: ad_addin2 = -2; 
6: ad_addin2 = -4; 
default: ad_addin2 = 0; 
endcase 


assign ad_add_lo = {1'b0, haddro[ADD_CENTER-1:0]} + 
ad_addin2; 
assign ad_add_cf = ad_add_lo[ADD_CENTER]; 

assign ad_inc = {haddro[31:ADD_CENTER], ad_add_lo[ADD_CENTER-1:0]}; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
add_cfx <= 'h0; 
else 
add_cfx <= ad_add_cf & mx_cmd; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
adin_is_neg <= 'h0; 
else if(mx_cmd) 
adin_is_neg <= ad_addin2[ADD_CENTER]; 

assign add_hia1 = haddro[31:ADD_CENTER]+1; 
assign add_him1 = haddro[31:ADD_CENTER]-1; 

assign add_hi = add_cfx ? (adin_is_neg? add_hia1 : add_him1) : 
haddro[31:ADD_CENTER]; 


assign mx_updad = {add_hi,haddro[ADD_CENTER-1:0]}; 



always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
mx_ad1t0x <= 'h0; 
else if(mx_cmd) 
mx_ad1t0x <= haddro[1:0]; 








wire [7:0] mx_rdtb0 = (tro_hw)? hrdatai[23:16] : 
(tro_bt)? hrdatai[31:24] : hrdatai[7:0]; 
wire [7:0] mx_rdtb1 = (tro_hw)? hrdatai[31:24] : 
(tro_bt)? hrdatai[23:16] : hrdatai[15:8]; 
wire [7:0] mx_rdtb2 = (tro_hw)? hrdatai[7:0] : 
(tro_bt)? hrdatai[15:8] : hrdatai[23:16]; 
wire [7:0] mx_rdtb3 = (tro_hw)? hrdatai[15:8] : 
(tro_bt)? hrdatai[7:0] : hrdatai[31:24]; 

assign mx_rdto = {mx_rdtb3,mx_rdtb2,mx_rdtb1,mx_rdtb0}; 



assign mx_rdy = hreadyini; 





assign req_bgn = cmd_bgn; 

assign src_e_dst = mx_is_src & mx_is_dst; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
assign br_req_raw = (slv_br_req&(st_idle|st_update)&htranso[1]); 
`endif 
`endif 

assign req_end = 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
(br_req_raw) | 

`endif 
`endif 


st_update | 




(mx_is_src&~mx_is_dst&(bst_eq0|tsz_eq0)& 
(st_rd|st_rd_end|st_lw)) | 

(mx_is_dst&~mx_is_src&st_update); 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
hreqo <= 1'b0; 
else if(~hreqo&req_bgn) 
hreqo <= 1'b1; 
else if(hreqo&req_end) 
hreqo <= 1'b0; 

















reg mx_dma_had_a_rty; 
reg de_err_notify_d; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
de_err_notify_d <= 0; 
else if(st_update) 
de_err_notify_d <= 0; 
else if(mx_rdy) 
de_err_notify_d <= de_err_notify; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
mx_dma_had_a_rty <= 1'b0; 
else if(!(THIS_IS_M1&mx_arb_br)&mx_dt_st&mx_rp_rty) 
mx_dma_had_a_rty <= 1'b1; 
else if(!(THIS_IS_M1&mx_arb_br)&(mx_dt_st&mx_rdy|mx_rp_err)) 
mx_dma_had_a_rty <= 1'b0; 



wire mx_dma_err1 = de_err_notify&!mx_dma_had_a_rty&!(mx_cp|mx_dtp); 
/* 
reg mx_dma_err1; 
wire mx_err_no_rty = de_err_notify &!mx_arb_br&mx_cp&!(mx_rp_rty|mx_dma_had_a_rty) | 
de_err_notify_d&!mx_arb_br&!(mx_rp_rty|mx_dma_had_a_rty); 
wire mx_err_rty_ok = de_err_notify &mx_dma_had_a_rty&!mx_arb_br&mx_dt_st&mx_rdy; 
wire mx_dma_err1_cl = st_update; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
mx_dma_err1 <= 0; 
else if(mx_dma_err1_cl) 
mx_dma_err1 <= 0; 
else if(mx_err_no_rty | mx_err_rty_ok) 
mx_dma_err1 <= 1; 
*/ 


/* 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
mx_dma_err_occur <= 1'b0; 
else if(!mx_dma_err_occur&mx_dt_st&!(THIS_IS_M1&mx_arb_br)&mx_rp_err) 
mx_dma_err_occur <= 1'b1; 
else if(mx_dma_err_occur&st_update) 
mx_dma_err_occur <= 1'b0; 
assign mx_dma_err_ok = mx_dma_err_occur | mx_dma_err1; 
*/ 

assign mx_dma_err_ok = mx_dma_err1; 

endmodule 
