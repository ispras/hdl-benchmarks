




































`include "DMA_DEFINE.vh" 

module dma_top 
( 
HCLK, 
HRSTn, 


h0addr, 
h0trans, 
h0write, 
h0size, 
h0prot, 
h0lock, 
h0burst, 
h0wdata, 
h0rdata, 
h0readyin, 
h0resp, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
h1addr, 
h1trans, 
h1write, 
h1size, 
h1prot, 
h1burst, 
h1wdata, 
h1readyin, 

h1sel_dma, 
h1sel_br, 

h1rdt0_dma, 
`ifdef DMA_HAVE_CH1 
h1rdt1_dma, 
`endif 
`ifdef DMA_HAVE_CH2 
h1rdt2_dma, 
`endif 
`ifdef DMA_HAVE_CH3 
h1rdt3_dma, 
`endif 
`ifdef DMA_HAVE_CH4 
h1rdt4_dma, 
`endif 
`ifdef DMA_HAVE_CH5 
h1rdt5_dma, 
`endif 
`ifdef DMA_HAVE_CH6 
h1rdt6_dma, 
`endif 
`ifdef DMA_HAVE_CH7 
h1rdt7_dma, 
`endif 

h1rp0_dma, 

`ifdef DMA_HAVE_CH1 
h1rp1_dma, 
`endif 
`ifdef DMA_HAVE_CH2 
h1rp2_dma, 
`endif 
`ifdef DMA_HAVE_CH3 
h1rp3_dma, 
`endif 
`ifdef DMA_HAVE_CH4 
h1rp4_dma, 
`endif 
`ifdef DMA_HAVE_CH5 
h1rp5_dma, 
`endif 
`ifdef DMA_HAVE_CH6 
h1rp6_dma, 
`endif 
`ifdef DMA_HAVE_CH7 
h1rp7_dma, 
`endif 

h1rdy0_dma, 
`ifdef DMA_HAVE_CH1 
h1rdy1_dma, 
`endif 
`ifdef DMA_HAVE_CH2 
h1rdy2_dma, 
`endif 
`ifdef DMA_HAVE_CH3 
h1rdy3_dma, 
`endif 
`ifdef DMA_HAVE_CH4 
h1rdy4_dma, 
`endif 
`ifdef DMA_HAVE_CH5 
h1rdy5_dma, 
`endif 
`ifdef DMA_HAVE_CH6 
h1rdy6_dma, 
`endif 
`ifdef DMA_HAVE_CH7 
h1rdy7_dma, 
`endif 

h1rdt0_br, 
`ifdef DMA_HAVE_CH1 
h1rdt1_br, 
`endif 
`ifdef DMA_HAVE_CH2 
h1rdt2_br, 
`endif 
`ifdef DMA_HAVE_CH3 
h1rdt3_br, 
`endif 
`ifdef DMA_HAVE_CH4 
h1rdt4_br, 
`endif 
`ifdef DMA_HAVE_CH5 
h1rdt5_br, 
`endif 
`ifdef DMA_HAVE_CH6 
h1rdt6_br, 
`endif 
`ifdef DMA_HAVE_CH7 
h1rdt7_br, 
`endif 

h1rp0_br, 
`ifdef DMA_HAVE_CH1 
h1rp1_br, 
`endif 
`ifdef DMA_HAVE_CH2 
h1rp2_br, 
`endif 
`ifdef DMA_HAVE_CH3 
h1rp3_br, 
`endif 
`ifdef DMA_HAVE_CH4 
h1rp4_br, 
`endif 
`ifdef DMA_HAVE_CH5 
h1rp5_br, 
`endif 
`ifdef DMA_HAVE_CH6 
h1rp6_br, 
`endif 
`ifdef DMA_HAVE_CH7 
h1rp7_br, 
`endif 

h1rdy0_br, 
`ifdef DMA_HAVE_CH1 
h1rdy1_br, 
`endif 
`ifdef DMA_HAVE_CH2 
h1rdy2_br, 
`endif 
`ifdef DMA_HAVE_CH3 
h1rdy3_br, 
`endif 
`ifdef DMA_HAVE_CH4 
h1rdy4_br, 
`endif 
`ifdef DMA_HAVE_CH5 
h1rdy5_br, 
`endif 
`ifdef DMA_HAVE_CH6 
h1rdy6_br, 
`endif 
`ifdef DMA_HAVE_CH7 
h1rdy7_br, 
`endif 

`else 

h1addr, 
h1trans, 
h1write, 
h1size, 
h1prot, 
h1lock, 
h1burst, 
h1wdata, 
h1rdata, 
h1readyin, 
h1resp, 

`endif 
`endif 


haddr, 
hwrite, 
hsize, 
hburst, 
htrans, 
hprot, 
hwdata, 
hreadyin, 
hsel_reg, 
hrdata_reg, 
hreadyout_reg, 
hresp_reg, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
hsel_br, 
hrdata_br, 
hreadyout_br, 
hresp_br, 
`endif 
`endif 


h0req, 
h0grant, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
`else 
h1req, 
h1grant, 
`endif 
`endif 


dmaint, 
dmaint_tc, 
dmaint_err, 


dma_req, 
dma_ack, 
dma_tc 
); 

input HCLK; 
input HRSTn; 


output [`DMA_HADDR_WIDTH-1:0] h0addr; 
output [`DMA_HTRANS_WIDTH-1:0] h0trans; 
output h0write; 
output [`DMA_HSIZE_WIDTH-1:0] h0size; 
output [`DMA_HPROT_WIDTH-1:0] h0prot; 
output h0lock; 
output [`DMA_HBURST_WIDTH-1:0] h0burst; 
output [`DMA_HDATA_WIDTH-1:0] h0wdata; 
input [`DMA_HDATA_WIDTH-1:0] h0rdata; 
input h0readyin; 
input [`DMA_HRESP_WIDTH-1:0] h0resp; 

`ifdef DMA_HAVE_AHB1 

`ifdef DMA_HAVE_BRIDGE 

output [`DMA_HADDR_WIDTH-1:0] h1addr; 
output [`DMA_HTRANS_WIDTH-1:0] h1trans; 
output h1write; 
output [`DMA_HSIZE_WIDTH-1:0] h1size; 
output [`DMA_HPROT_WIDTH-1:0] h1prot; 
output [`DMA_HBURST_WIDTH-1:0] h1burst; 
output [`DMA_HDATA_WIDTH-1:0] h1wdata; 
output h1readyin; 

output [`DMA_MAX_CHNO-1:0] h1sel_dma; 
output [`DMA_MAX_CHNO-1:0] h1sel_br; 

input [`DMA_HDATA_WIDTH-1:0] h1rdt0_dma; 
`ifdef DMA_HAVE_CH1 
input [`DMA_HDATA_WIDTH-1:0] h1rdt1_dma; 
`endif 
`ifdef DMA_HAVE_CH2 
input [`DMA_HDATA_WIDTH-1:0] h1rdt2_dma; 
`endif 
`ifdef DMA_HAVE_CH3 
input [`DMA_HDATA_WIDTH-1:0] h1rdt3_dma; 
`endif 
`ifdef DMA_HAVE_CH4 
input [`DMA_HDATA_WIDTH-1:0] h1rdt4_dma; 
`endif 
`ifdef DMA_HAVE_CH5 
input [`DMA_HDATA_WIDTH-1:0] h1rdt5_dma; 
`endif 
`ifdef DMA_HAVE_CH6 
input [`DMA_HDATA_WIDTH-1:0] h1rdt6_dma; 
`endif 
`ifdef DMA_HAVE_CH7 
input [`DMA_HDATA_WIDTH-1:0] h1rdt7_dma; 
`endif 

input [`DMA_HRESP_WIDTH-1:0] h1rp0_dma; 
`ifdef DMA_HAVE_CH1 
input [`DMA_HRESP_WIDTH-1:0] h1rp1_dma; 
`endif 
`ifdef DMA_HAVE_CH2 
input [`DMA_HRESP_WIDTH-1:0] h1rp2_dma; 
`endif 
`ifdef DMA_HAVE_CH3 
input [`DMA_HRESP_WIDTH-1:0] h1rp3_dma; 
`endif 
`ifdef DMA_HAVE_CH4 
input [`DMA_HRESP_WIDTH-1:0] h1rp4_dma; 
`endif 
`ifdef DMA_HAVE_CH5 
input [`DMA_HRESP_WIDTH-1:0] h1rp5_dma; 
`endif 
`ifdef DMA_HAVE_CH6 
input [`DMA_HRESP_WIDTH-1:0] h1rp6_dma; 
`endif 
`ifdef DMA_HAVE_CH7 
input [`DMA_HRESP_WIDTH-1:0] h1rp7_dma; 
`endif 

input h1rdy0_dma; 
`ifdef DMA_HAVE_CH1 
input h1rdy1_dma; 
`endif 
`ifdef DMA_HAVE_CH2 
input h1rdy2_dma; 
`endif 
`ifdef DMA_HAVE_CH3 
input h1rdy3_dma; 
`endif 
`ifdef DMA_HAVE_CH4 
input h1rdy4_dma; 
`endif 
`ifdef DMA_HAVE_CH5 
input h1rdy5_dma; 
`endif 
`ifdef DMA_HAVE_CH6 
input h1rdy6_dma; 
`endif 
`ifdef DMA_HAVE_CH7 
input h1rdy7_dma; 
`endif 

input [`DMA_HDATA_WIDTH-1:0] h1rdt0_br; 
`ifdef DMA_HAVE_CH1 
input [`DMA_HDATA_WIDTH-1:0] h1rdt1_br; 
`endif 
`ifdef DMA_HAVE_CH2 
input [`DMA_HDATA_WIDTH-1:0] h1rdt2_br; 
`endif 
`ifdef DMA_HAVE_CH3 
input [`DMA_HDATA_WIDTH-1:0] h1rdt3_br; 
`endif 
`ifdef DMA_HAVE_CH4 
input [`DMA_HDATA_WIDTH-1:0] h1rdt4_br; 
`endif 
`ifdef DMA_HAVE_CH5 
input [`DMA_HDATA_WIDTH-1:0] h1rdt5_br; 
`endif 
`ifdef DMA_HAVE_CH6 
input [`DMA_HDATA_WIDTH-1:0] h1rdt6_br; 
`endif 
`ifdef DMA_HAVE_CH7 
input [`DMA_HDATA_WIDTH-1:0] h1rdt7_br; 
`endif 

input [`DMA_HRESP_WIDTH-1:0] h1rp0_br; 
`ifdef DMA_HAVE_CH1 
input [`DMA_HRESP_WIDTH-1:0] h1rp1_br; 
`endif 
`ifdef DMA_HAVE_CH2 
input [`DMA_HRESP_WIDTH-1:0] h1rp2_br; 
`endif 
`ifdef DMA_HAVE_CH3 
input [`DMA_HRESP_WIDTH-1:0] h1rp3_br; 
`endif 
`ifdef DMA_HAVE_CH4 
input [`DMA_HRESP_WIDTH-1:0] h1rp4_br; 
`endif 
`ifdef DMA_HAVE_CH5 
input [`DMA_HRESP_WIDTH-1:0] h1rp5_br; 
`endif 
`ifdef DMA_HAVE_CH6 
input [`DMA_HRESP_WIDTH-1:0] h1rp6_br; 
`endif 
`ifdef DMA_HAVE_CH7 
input [`DMA_HRESP_WIDTH-1:0] h1rp7_br; 
`endif 

input h1rdy0_br; 
`ifdef DMA_HAVE_CH1 
input h1rdy1_br; 
`endif 
`ifdef DMA_HAVE_CH2 
input h1rdy2_br; 
`endif 
`ifdef DMA_HAVE_CH3 
input h1rdy3_br; 
`endif 
`ifdef DMA_HAVE_CH4 
input h1rdy4_br; 
`endif 
`ifdef DMA_HAVE_CH5 
input h1rdy5_br; 
`endif 
`ifdef DMA_HAVE_CH6 
input h1rdy6_br; 
`endif 
`ifdef DMA_HAVE_CH7 
input h1rdy7_br; 
`endif 

`else 


output [`DMA_HADDR_WIDTH-1:0] h1addr; 
output [`DMA_HTRANS_WIDTH-1:0] h1trans; 
output h1write; 
output [`DMA_HSIZE_WIDTH-1:0] h1size; 
output [`DMA_HPROT_WIDTH-1:0] h1prot; 
output h1lock; 
output [`DMA_HBURST_WIDTH-1:0] h1burst; 
output [`DMA_HDATA_WIDTH-1:0] h1wdata; 
input [`DMA_HDATA_WIDTH-1:0] h1rdata; 
input h1readyin; 
input [`DMA_HRESP_WIDTH-1:0] h1resp; 

`endif 
`endif 


input [`DMA_HADDR_WIDTH-1:0] haddr; 
input hwrite; 
input [`DMA_HSIZE_WIDTH-1:0] hsize; 
input [`DMA_HBURST_WIDTH-1:0] hburst; 
input [`DMA_HTRANS_WIDTH-1:0] htrans; 
input [`DMA_HPROT_WIDTH-1:0] hprot; 
input [`DMA_HDATA_WIDTH-1:0] hwdata; 
input hreadyin; 

input hsel_reg; 
output [`DMA_HDATA_WIDTH-1:0] hrdata_reg; 
output hreadyout_reg; 
output [`DMA_HRESP_WIDTH-1:0] hresp_reg; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
input hsel_br; 
output [`DMA_HDATA_WIDTH-1:0] hrdata_br; 
output hreadyout_br; 
output [`DMA_HRESP_WIDTH-1:0] hresp_br; 
`endif 
`endif 


output h0req; 
input h0grant; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
`else 
output h1req; 
input h1grant; 
`endif 
`endif 


output dmaint; 
output dmaint_tc; 
output dmaint_err;


input [`DMA_MAX_CHNO-1:0] dma_req; 
output [`DMA_MAX_CHNO-1:0] dma_ack; 
output [`DMA_MAX_CHNO-1:0] dma_tc; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire h1grant = 1; 
`else 
assign h1lock = 1'b0; 
`endif 
`else 
wire m1_cp; 
wire m1_tr_sq; 
wire m1_rp_err; 
wire m1_rp_rty; 
`endif 

assign h0lock = 1'b0; 

wire [10:0] de_st; 
wire [1:0] m0_ad1t0x; 
wire [`DMA_HADDR_WIDTH-1:0] m0_updad; 
wire [`DMA_HDATA_WIDTH-1:0] m0_rdt; 
wire m0_dt_st; 

wire [1:0] m1_ad1t0x; 
wire [`DMA_HADDR_WIDTH-1:0] m1_updad; 
wire m1_dt_st; 
wire [`DMA_HDATA_WIDTH-1:0] m1_rdt; 

wire [`DMA_HADDR_WIDTH-1:0] h0addr; 
wire [`DMA_HTRANS_WIDTH-1:0] h0trans; 
wire h0write; 
wire [`DMA_HPROT_WIDTH-1:0] h0prot; 
wire [`DMA_HBURST_WIDTH-1:0] h0burst; 
wire [`DMA_HDATA_WIDTH-1:0] h0wdata; 

wire [`DMA_HADDR_WIDTH-1:0] h1addr; 
wire [`DMA_HTRANS_WIDTH-1:0] h1trans; 
wire h1write; 
wire [`DMA_HPROT_WIDTH-1:0] h1prot; 
wire [`DMA_HBURST_WIDTH-1:0] h1burst; 
wire [`DMA_HDATA_WIDTH-1:0] h1wdata; 

wire [`DMA_HADDR_WIDTH-1:0] de_sad; 
wire [`DMA_HADDR_WIDTH-1:0] de_dad; 
wire [`DMA_CHSZ_WIDTH-1:0] de_tsz; 
`ifdef DMA_HAVE_LINKLIST 
wire [`DMA_HADDR_WIDTH-1:0] de_llp; 
wire [`DMA_HADDR_WIDTH-1:2] de_mllp; 
`endif 
wire [`DMA_HDATA_WIDTH-1:0] de_csr; 



wire [`DMA_HADDR_WIDTH-1:0] haddr; 
wire [`DMA_HDATA_WIDTH-1:0] hwdata; 
wire [`DMA_HTRANS_WIDTH-1:0] htrans; 
wire [`DMA_HSIZE_WIDTH-1:0] hsize; 
wire [`DMA_HBURST_WIDTH-1:0] hburst; 
wire [`DMA_HPROT_WIDTH-1:0] hprot; 
wire [`DMA_HRESP_WIDTH-1:0] hresp_rf; 
wire [`DMA_HRESP_WIDTH-1:0] hresp_br; 
wire [`DMA_HDATA_WIDTH-1:0] hrdata_rf; 
wire [`DMA_HDATA_WIDTH-1:0] hrdata_br; 

wire [`DMA_HDATA_WIDTH-1:0] h1rdata; 
wire h1readyin; 
wire [`DMA_HRESP_WIDTH-1:0] h1resp; 

wire [`DMA_HADDR_WIDTH-1:0] slv_ad; 
wire [`DMA_HADDR_WIDTH-1:0] slv_ad_d1; 
wire [`DMA_HDATA_WIDTH-1:0] slv_dt; 
wire [`DMA_HSIZE_WIDTH-1:0] slv_sz; 
wire [`DMA_HSIZE_WIDTH-1:0] slv_sz_d1; 
wire [`DMA_HPROT_WIDTH-1:0] slv_pt_d1; 

wire [`DMA_HDATA_WIDTH-1:0] slv_br_dt; 


wire [1:0] de_ff_ado; 
wire [`DMA_HDATA_WIDTH-1:0] de_ff_dto; 
wire [`DMA_HDATA_WIDTH-1:0] ff_dto; 
wire [3:0] ff_cbe; 
wire ff_cnv_q_vld; 


wire [`DMA_HDATA_WIDTH-1:0] rf_dto; 
wire [`DMA_CSR_WIDTH-1:0] csr; 
wire [`DMA_MAX_CHNO-1:0] sync; 


wire [`DMA_CHCSR_WIDTH-1:0] c0csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c0cfg; 
wire [`DMA_HADDR_WIDTH-1:0] c0sad; 
wire [`DMA_HADDR_WIDTH-1:0] c0dad; 
wire [`DMA_HADDR_WIDTH-1:0] c0llp; 
wire [`DMA_CHSZ_WIDTH-1:0] c0tsz; 
wire [31:16] c0dmabs; 
wire [31:16] c0brbs; 

wire [`DMA_CHCSR_WIDTH-1:0] c1csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c1cfg; 
wire [`DMA_HADDR_WIDTH-1:0] c1sad; 
wire [`DMA_HADDR_WIDTH-1:0] c1dad; 
wire [`DMA_HADDR_WIDTH-1:0] c1llp; 
wire [`DMA_CHSZ_WIDTH-1:0] c1tsz; 
wire [31:16] c1dmabs; 
wire [31:16] c1brbs; 

wire [`DMA_CHCSR_WIDTH-1:0] c2csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c2cfg; 
wire [`DMA_HADDR_WIDTH-1:0] c2sad; 
wire [`DMA_HADDR_WIDTH-1:0] c2dad; 
wire [`DMA_HADDR_WIDTH-1:0] c2llp; 
wire [`DMA_CHSZ_WIDTH-1:0] c2tsz; 
wire [31:16] c2dmabs; 
wire [31:16] c2brbs; 

wire [`DMA_CHCSR_WIDTH-1:0] c3csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c3cfg; 
wire [`DMA_HADDR_WIDTH-1:0] c3sad; 
wire [`DMA_HADDR_WIDTH-1:0] c3dad; 
wire [`DMA_HADDR_WIDTH-1:0] c3llp; 
wire [`DMA_CHSZ_WIDTH-1:0] c3tsz; 
wire [31:16] c3dmabs; 
wire [31:16] c3brbs; 

wire [`DMA_CHCSR_WIDTH-1:0] c4csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c4cfg; 
wire [`DMA_HADDR_WIDTH-1:0] c4sad; 
wire [`DMA_HADDR_WIDTH-1:0] c4dad; 
wire [`DMA_HADDR_WIDTH-1:0] c4llp; 
wire [`DMA_CHSZ_WIDTH-1:0] c4tsz; 
wire [31:16] c4dmabs; 
wire [31:16] c4brbs; 

wire [`DMA_CHCSR_WIDTH-1:0] c5csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c5cfg; 
wire [`DMA_HADDR_WIDTH-1:0] c5sad; 
wire [`DMA_HADDR_WIDTH-1:0] c5dad; 
wire [`DMA_HADDR_WIDTH-1:0] c5llp; 
wire [`DMA_CHSZ_WIDTH-1:0] c5tsz; 
wire [31:16] c5dmabs; 
wire [31:16] c5brbs; 

wire [`DMA_CHCSR_WIDTH-1:0] c6csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c6cfg; 
wire [`DMA_HADDR_WIDTH-1:0] c6sad; 
wire [`DMA_HADDR_WIDTH-1:0] c6dad; 
wire [`DMA_HADDR_WIDTH-1:0] c6llp; 
wire [`DMA_CHSZ_WIDTH-1:0] c6tsz; 
wire [31:16] c6dmabs; 
wire [31:16] c6brbs; 

wire [`DMA_CHCSR_WIDTH-1:0] c7csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c7cfg; 
wire [`DMA_HADDR_WIDTH-1:0] c7sad; 
wire [`DMA_HADDR_WIDTH-1:0] c7dad; 
wire [`DMA_HADDR_WIDTH-1:0] c7llp; 
wire [`DMA_CHSZ_WIDTH-1:0] c7tsz; 
wire [31:16] c7dmabs; 
wire [31:16] c7brbs; 

wire [`DMA_CHCSR_WIDTH-1:0] arb_chcsr; 
wire [`DMA_HADDR_WIDTH-1:0] arb_chsad; 
wire [`DMA_HADDR_WIDTH-1:0] arb_chdad; 
wire [`DMA_HADDR_WIDTH-1:0] arb_chllp; 
wire [`DMA_CHSZ_WIDTH-1:0] arb_chtsz; 

wire [`DMA_CHNO_WIDTH-1:0] arb_ch_sel; 

wire [1:0] fwdtsb0,fwdtsb1,fwdtsb2,fwdtsb3; 

wire [`DMA_MAX_CHNO-1:0] err; 

dma_engine de 
( 

.HCLK(HCLK), 
.HRSTn(HRSTn), 


.de_st(de_st), 

.de_err_notify(de_err_notify), 
`ifdef DMA_HAVE_LINKLIST 
.st_llp0t3(st_llp0t3), 
`endif 
.dst_m(dst_m), 
.src_m(src_m), 
.dst_a(dst_a), 
.src_a(src_a), 
.dst_e(dst_e), 
.src_e(src_e), 
.dst_wid_wd(dst_wid_wd), 
.src_wid_wd(src_wid_wd), 
.dst_wid_hw(dst_wid_hw), 
.src_wid_hw(src_wid_hw), 
.dst_wid_bt(dst_wid_bt), 
.src_wid_bt(src_wid_bt), 

.bst_eq0(bst_eq0), 
.bst_eq1(bst_eq1), 
.bst_eq2(bst_eq2), 
.tsz_eq0(tsz_eq0), 
.tsz_eq1(tsz_eq1), 
.tsz_eq2(tsz_eq2), 
.cv8t32(cv8t32), 
.cv8t16(cv8t16), 
.cv16t32(cv16t32), 
.cvtp2(cvtp2), 
.pack_en(pack_en), 
.pack_end(pack_end), 
.unpack_en(unpack_en), 
.upk_cnteq0(upk_cnteq0), 
.upk_cnteq1(upk_cnteq1), 
.fwdtsb0(fwdtsb0), 
.fwdtsb1(fwdtsb1), 
.fwdtsb2(fwdtsb2), 
.fwdtsb3(fwdtsb3), 



.m0_ad1t0x(m0_ad1t0x), 
.m0_updad(m0_updad), 
.m0_rdy(h0readyin), 
.m0_rdt(m0_rdt), 
.m0_cp(m0_cp), 
.m0_tr_sq(m0_tr_sq), 
.m0_rp_err(m0_rp_err), 

.m0_rp_rty(m0_rp_rty), 

.m0_dt_st(m0_dt_st), 

.m0_dma_err_ok(m0_dma_err_ok), 


.m0_is_dst(m0_is_dst), 
.m0_is_src(m0_is_src), 
`ifdef DMA_HAVE_LINKLIST 
.m0_is_llp(m0_is_llp), 
`endif 
.m0_arb_src(m0_arb_src), 
.m0_arb_dst(m0_arb_dst), 




`ifdef DMA_HAVE_AHB1 



.m1_ad1t0x(m1_ad1t0x), 
.m1_updad(m1_updad), 
.m1_rdy(h1readyin), 
.m1_rdt(m1_rdt), 
.m1_cp(m1_cp), 
.m1_tr_sq(m1_tr_sq), 
.m1_rp_err(m1_rp_err), 
.m1_rp_rty(m1_rp_rty), 
.m1_dt_st(m1_dt_st), 

.m1_dtp(m1_dtp), 
.m1_dma_had_a_rty(m1_dma_had_a_rty), 

.m1_dma_err_ok(m1_dma_err_ok), 


.m1_is_dst(m1_is_dst), 
.m1_is_src(m1_is_src), 
`ifdef DMA_HAVE_LINKLIST 
.m1_is_llp(m1_is_llp), 
`endif 
.m1_arb_src(m1_arb_src), 
.m1_arb_dst(m1_arb_dst), 


.m1_src2br(m1_src2br), 

.m0_m1_same(m0_m1_same), 



`endif 


`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
.m1_arb_br(m1_arb_br), 



.slv_br_req(slv_br_req), 


.slv_brst_cmd(slv_brst_cmd), 
.slv_brst_mscd(slv_brst_mscd), 


.br_req_qf(br_req_qf), 
`endif 
`endif 



.ff_eq1(ff_eq1), 
.ff_eq2(ff_eq2), 
.ff_2ltfl(ff_2ltfl), 
.ff_1ltfl(ff_1ltfl), 
.ff_part_wd(ff_part_wd), 
.ff_cbe(ff_cbe), 
.ff_cnv_q_vld(ff_cnv_q_vld), 

.ff_wr(ff_wr), 


.de_ff_push(de_ff_push), 
.de_ff_pop(de_ff_pop), 
.de_ff_ahead(de_ff_ahead), 
.de_ff_flush(de_ff_flush), 
.de_ff_clear(de_ff_clear), 
.de_ff_ini(de_ff_ini), 
.de_ff_ado(de_ff_ado), 
.de_ff_dto(de_ff_dto), 



.arb_req(arb_req), 
.arb_chcsr(arb_chcsr), 
`ifdef DMA_HAVE_LINKLIST 
.arb_chllp(arb_chllp), 
`endif 
.arb_chtsz(arb_chtsz), 
`ifdef DMA_HAVE_LINKLIST 
.arb_chllpen(arb_chllpen), 
`endif 


.de_ack(de_ack), 
.de_tc_st(de_tc_st), 



.rf_cherr(rf_cherr), 
.arb_chabt(arb_chabt), 

.arb_abt_any(arb_abt_any), 

.de_sad(de_sad), 
.de_dad(de_dad), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp(de_llp), 
.de_mllp(de_mllp), 
`endif 
.de_tsz(de_tsz), 
.de_csr(de_csr), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen(de_llpen), 
`endif 
.de_busy(de_busy), 
.de_sad_we(de_sad_we), 
.de_dad_we(de_dad_we), 
.de_tsz_we(de_tsz_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp_we(de_llp_we), 
.de_csr_we(de_csr_we), 
.de_llpen_we(de_llpen_we), 
`endif 
.de_en_clr(de_en_clr), 

.de_abt_on_idle(de_abt_on_idle), 
.de_err_st(de_err_st) 

); 

dma_ahbmst #(0) ahb_mst0 
( 

.HCLK(HCLK), 
.HRSTn(HRSTn), 



.arb_chcsr(arb_chcsr), 
`ifdef DMA_HAVE_LINKLIST 
.arb_chllp(arb_chllp), 
`endif 
.arb_chsad(arb_chsad), 
.arb_chdad(arb_chdad), 

.arb_chabt(arb_chabt), 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
.slv_br_req(1'b0), 
.slv_br_ad(slv_ad_d1), 
.slv_br_dt(slv_br_dt), 
.slv_br_wr(slv_wr_d1), 
.slv_br_sz(slv_sz_d1), 
.slv_br_pt(slv_pt_d1), 
.br_req_qf(br_req_qf), 
`endif 
`endif 

.ff_dto(ff_dto), 

.bst_eq0(bst_eq0), 
.bst_eq1(bst_eq1), 
.bst_eq2(bst_eq2), 
.tsz_eq0(tsz_eq0), 
.tsz_eq1(tsz_eq1), 
.tsz_eq2(tsz_eq2), 
.de_st(de_st), 

.de_err_notify(de_err_notify), 

.de_err_st(de_err_st), 
`ifdef DMA_HAVE_LINKLIST 
.de_mllp(de_mllp), 
`endif 

.pack_en(pack_en), 
.pack_end(pack_end), 
.unpack_en(unpack_en), 
.upk_cnteq0(upk_cnteq0), 
.upk_cnteq1(upk_cnteq1), 
.ff_eq1(ff_eq1), 
.ff_eq2(ff_eq2), 
.ff_1ltfl(ff_1ltfl), 
.ff_2ltfl(ff_2ltfl), 
.ff_geth(ff_geth), 

.ff_q_full(ff_q_full), 
.ff_empty(ff_empty), 
`ifdef DMA_HAVE_LINKLIST 
.st_llp0t3(st_llp0t3), 
`endif 

.dst_m(dst_m), 
.src_m(src_m), 
.dst_a(dst_a), 
.src_a(src_a), 
.dst_e(dst_e), 
.src_e(src_e), 
.dst_wid_wd(dst_wid_wd), 
.src_wid_wd(src_wid_wd), 
.dst_wid_hw(dst_wid_hw), 
.src_wid_hw(src_wid_hw), 
.dst_wid_bt(dst_wid_bt), 
.src_wid_bt(src_wid_bt), 
.mx_is_dst(m0_is_dst), 
.mx_is_src(m0_is_src), 
`ifdef DMA_HAVE_LINKLIST 
.mx_is_llp(m0_is_llp), 
`endif 
.mx_arb_src(m0_arb_src), 
.mx_arb_dst(m0_arb_dst), 


`ifdef DMA_HAVE_AHB1 
.m1_src2br(m1_src2br), 
.m0_m1_same(m0_m1_same), 
`else 
.m1_src2br(1'b0), 
.m0_m1_same(1'b1), 
`endif 

`ifdef DMA_HAVE_BRIDGE 
.mx_arb_br(1'b0), 
`endif 

.fwdtsb0(fwdtsb0), 
.fwdtsb1(fwdtsb1), 
.fwdtsb2(fwdtsb2), 
.fwdtsb3(fwdtsb3), 
.m0endian(csr[1]), 
.m1endian(csr[2]), 


.mx_ad1t0x(m0_ad1t0x), 
.mx_updad(m0_updad), 
.mx_rdto(m0_rdt), 
.mx_cp(m0_cp), 
.mx_tr_sq(m0_tr_sq), 
.mx_rp_err(m0_rp_err), 
.mx_rp_rty(m0_rp_rty), 
.mx_dt_st(m0_dt_st), 

.mx_dtp(), 
.mx_dma_had_a_rty(), 

.mx_dma_err_ok(m0_dma_err_ok), 


.hrdatai(h0rdata), 
.hreadyini(h0readyin), 
.hrespi(h0resp), 


.haddro(h0addr), 
.htranso(h0trans), 
.hwriteo(h0write), 
.hsizeo(h0size), 
.hproto(h0prot), 
.hbursto(h0burst), 
.hwdatao(h0wdata), 



.hgranti(h0grant), 
.hreqo(h0req) 
); 

`ifdef DMA_HAVE_AHB1 

dma_ahbmst #(1) ahb_mst1 
( 

.HCLK(HCLK), 
.HRSTn(HRSTn), 



.arb_chcsr(arb_chcsr), 
`ifdef DMA_HAVE_LINKLIST 
.arb_chllp(arb_chllp), 
`endif 
.arb_chsad(arb_chsad), 
.arb_chdad(arb_chdad), 

.arb_chabt(arb_chabt), 

`ifdef DMA_HAVE_BRIDGE 
.slv_br_req(slv_br_req), 
.slv_br_ad(slv_ad_d1), 
.slv_br_dt(slv_br_dt), 
.slv_br_wr(slv_wr_d1), 
.slv_br_sz(slv_sz_d1), 
.slv_br_pt(slv_pt_d1), 
.br_req_qf(br_req_qf), 
`endif 

.ff_dto(ff_dto), 

.bst_eq0(bst_eq0), 
.bst_eq1(bst_eq1), 
.bst_eq2(bst_eq2), 
.tsz_eq0(tsz_eq0), 
.tsz_eq1(tsz_eq1), 
.tsz_eq2(tsz_eq2), 
.de_st(de_st), 

.de_err_notify(de_err_notify), 

.de_err_st(de_err_st), 
`ifdef DMA_HAVE_LINKLIST 
.de_mllp(de_mllp), 
`endif 
.pack_en(pack_en), 
.pack_end(pack_end), 
.unpack_en(unpack_en), 
.upk_cnteq0(upk_cnteq0), 
.upk_cnteq1(upk_cnteq1), 
.ff_eq1(ff_eq1), 
.ff_eq2(ff_eq2), 
.ff_1ltfl(ff_1ltfl), 
.ff_2ltfl(ff_2ltfl), 
.ff_geth(ff_geth), 

.ff_q_full(ff_q_full), 
.ff_empty(ff_empty), 
`ifdef DMA_HAVE_LINKLIST 
.st_llp0t3(st_llp0t3), 
`endif 

.dst_m(dst_m), 
.src_m(src_m), 
.dst_a(dst_a), 
.src_a(src_a), 
.dst_e(dst_e), 
.src_e(src_e), 
.dst_wid_wd(dst_wid_wd), 
.src_wid_wd(src_wid_wd), 
.dst_wid_hw(dst_wid_hw), 
.src_wid_hw(src_wid_hw), 
.dst_wid_bt(dst_wid_bt), 
.src_wid_bt(src_wid_bt), 
.mx_is_dst(m1_is_dst), 
.mx_is_src(m1_is_src), 
`ifdef DMA_HAVE_LINKLIST 
.mx_is_llp(m1_is_llp), 
`endif 
.mx_arb_src(m1_arb_src), 
.mx_arb_dst(m1_arb_dst), 


`ifdef DMA_HAVE_AHB1 
.m1_src2br(m1_src2br), 
.m0_m1_same(m0_m1_same), 
`else 
.m1_src2br(1'b0), 
.m0_m1_same(1'b1), 
`endif 

`ifdef DMA_HAVE_BRIDGE 
.mx_arb_br(m1_arb_br), 
`endif 

.fwdtsb0(fwdtsb0), 
.fwdtsb1(fwdtsb1), 
.fwdtsb2(fwdtsb2), 
.fwdtsb3(fwdtsb3), 
.m0endian(csr[1]), 
.m1endian(csr[2]), 


.mx_updad(m1_updad), 
.mx_ad1t0x(m1_ad1t0x), 
.mx_rdto(m1_rdt), 
.mx_cp(m1_cp), 
.mx_tr_sq(m1_tr_sq), 
.mx_rp_err(m1_rp_err), 
.mx_rp_rty(m1_rp_rty), 
.mx_dt_st(m1_dt_st), 

.mx_dtp(m1_dtp), 
.mx_dma_had_a_rty(m1_dma_had_a_rty), 

.mx_dma_err_ok(m1_dma_err_ok), 


.hrdatai(h1rdata), 
.hreadyini(h1readyin), 
.hrespi(h1resp), 


.haddro(h1addr), 
.htranso(h1trans), 
.hwriteo(h1write), 
.hsizeo(h1size), 
.hproto(h1prot), 
.hbursto(h1burst), 
.hwdatao(h1wdata), 


.hgranti(h1grant), 
.hreqo(h1req) 

); 

`else 

assign m1_cp = 0; 
assign m1_tr_sq = 0; 
assign m1_rp_err = 0; 
assign m1_rp_rty = 0; 

`endif 



dma_fifo dma_fifo( 



.HCLK(HCLK), 
.HRSTn(HRSTn), 



.push(de_ff_push), 
.pop(de_ff_pop), 
.look_ahead(de_ff_ahead), 
.flush(de_ff_flush), 
.clear(de_ff_clear), 
.de_ff_ini(de_ff_ini), 
.pack_en(pack_en), 
.swid16(arb_chcsr[11]), 
.swid32(arb_chcsr[12]), 
.cvtp2(cvtp2), 
.cv8t16(cv8t16), 
.cv8t32(cv8t32), 
.cv16t32(cv16t32), 
.adi(de_ff_ado), 
.dti(de_ff_dto), 


.ff_dto(ff_dto), 

.ff_empty(ff_empty), 
.ff_eq1(ff_eq1), 
.ff_eq2(ff_eq2), 
.ff_geth(ff_geth), 
.ff_2ltfl(ff_2ltfl), 
.ff_1ltfl(ff_1ltfl), 

.ff_q_full(ff_q_full), 
.ff_part_wd(ff_part_wd), 
.ff_cbe(ff_cbe), 
.ff_cnv_q_vld(ff_cnv_q_vld), 

.ff_wr(ff_wr) 

); 

dma_ctlrf ctl_rf 
( 

.HCLK(HCLK), 
.HRSTn(HRSTn), 


.slv_ad(slv_ad), 
.slv_ad_d1(slv_ad_d1), 
.slv_wdti(slv_dt), 
.slv_sz(slv_sz), 
.slv_wr_d1(slv_wr_d1), 
.slv_rf_sel(slv_rf_req), 

.de_st_idle(de_st[0]), 
.de_st_upd(de_st[5]), 

.de_st_llp0(de_st[6]), 
.de_sad_we(de_sad_we), 
.de_dad_we(de_dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp_we(de_llp_we), 
`endif 
.de_tsz_we(de_tsz_we), 
.de_en_clr(de_en_clr), 
`ifdef DMA_HAVE_LINKLIST 
.de_csr_we(de_csr_we), 
.de_llpen_we(de_llpen_we), 
`endif 


.de_err_notify(de_err_notify), 

.tsz_eq0(tsz_eq0), 
.de_tc_st(de_tc_st), 

.de_sad(de_sad), 
.de_dad(de_dad), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp(de_llp), 
`endif 
.de_tsz(de_tsz), 
.de_csr(de_csr), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen(de_llpen), 
`endif 
.de_busy(de_busy), 
.arb_ch_sel(arb_ch_sel), 

.rf_cherr(rf_cherr), 
.rf_dto(rf_dto), 


.dmaint(dmaint), 
.dmaint_tc(dmaint_tc), 
.dmaint_err(dmaint_err), 
.csr(csr), 
.sync(sync), 

.err(err), 
.c0csr(c0csr), 
.c0cfg(c0cfg), 
.c0sad(c0sad), 
.c0dad(c0dad), 
`ifdef DMA_HAVE_LINKLIST 
.c0llp(c0llp), 
`endif 
.c0tsz(c0tsz), 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
.c0dmabs(c0dmabs), 
.c0brbs(c0brbs), 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
.c0llpen(c0llpen), 
`endif 
.c0abt(c0abt) 

`ifdef DMA_HAVE_CH1 
,.c1csr(c1csr), 
.c1cfg(c1cfg), 
.c1sad(c1sad), 
.c1dad(c1dad), 
`ifdef DMA_HAVE_LINKLIST 
.c1llp(c1llp), 
`endif 
.c1tsz(c1tsz), 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
.c1dmabs(c1dmabs), 
.c1brbs(c1brbs), 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
.c1llpen(c1llpen), 
`endif 
.c1abt(c1abt) 
`endif 

`ifdef DMA_HAVE_CH2 
,.c2csr(c2csr), 
.c2cfg(c2cfg), 
.c2sad(c2sad), 
.c2dad(c2dad), 
`ifdef DMA_HAVE_LINKLIST 
.c2llp(c2llp), 
`endif 
.c2tsz(c2tsz), 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
.c2dmabs(c2dmabs), 
.c2brbs(c2brbs), 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
.c2llpen(c2llpen), 
`endif 

.c2abt(c2abt) 

`endif 

`ifdef DMA_HAVE_CH3 
,.c3csr(c3csr), 
.c3cfg(c3cfg), 
.c3sad(c3sad), 
.c3dad(c3dad), 
`ifdef DMA_HAVE_LINKLIST 
.c3llp(c3llp), 
`endif 
.c3tsz(c3tsz), 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
.c3dmabs(c3dmabs), 
.c3brbs(c3brbs), 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
.c3llpen(c3llpen), 
`endif 

.c3abt(c3abt) 

`endif 

`ifdef DMA_HAVE_CH4 
,.c4csr(c4csr), 
.c4cfg(c4cfg), 
.c4sad(c4sad), 
.c4dad(c4dad), 
`ifdef DMA_HAVE_LINKLIST 
.c4llp(c4llp), 
`endif 
.c4tsz(c4tsz), 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
.c4dmabs(c4dmabs), 
.c4brbs(c4brbs), 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
.c4llpen(c4llpen), 
`endif 

.c4abt(c4abt) 

`endif 

`ifdef DMA_HAVE_CH5 
,.c5csr(c5csr), 
.c5cfg(c5cfg), 
.c5sad(c5sad), 
.c5dad(c5dad), 
`ifdef DMA_HAVE_LINKLIST 
.c5llp(c5llp), 
`endif 
.c5tsz(c5tsz), 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
.c5dmabs(c5dmabs), 
.c5brbs(c5brbs), 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
.c5llpen(c5llpen), 
`endif 

.c5abt(c5abt) 

`endif 

`ifdef DMA_HAVE_CH6 
,.c6csr(c6csr), 
.c6cfg(c6cfg), 
.c6sad(c6sad), 
.c6dad(c6dad), 
`ifdef DMA_HAVE_LINKLIST 
.c6llp(c6llp), 
`endif 
.c6tsz(c6tsz), 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
.c6dmabs(c6dmabs), 
.c6brbs(c6brbs), 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
.c6llpen(c6llpen), 
`endif 

.c6abt(c6abt) 

`endif 

`ifdef DMA_HAVE_CH7 
,.c7csr(c7csr), 
.c7cfg(c7cfg), 
.c7sad(c7sad), 
.c7dad(c7dad), 
`ifdef DMA_HAVE_LINKLIST 
.c7llp(c7llp), 
`endif 
.c7tsz(c7tsz), 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
.c7dmabs(c7dmabs), 
.c7brbs(c7brbs), 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
.c7llpen(c7llpen), 
`endif 

.c7abt(c7abt) 
`endif 
); 


dma_chsel ch_sel( 
.HCLK(HCLK), 
.HRSTn(HRSTn), 


.dma_req(dma_req), 
.dma_ack(dma_ack), 
.dma_tc(dma_tc), 


.csr(csr), .sync(sync), 


.de_err_notify(de_err_notify), 
.c0csr(c0csr), .c0cfg(c0cfg), .c0sad(c0sad), 
.c0dad(c0dad), 
`ifdef DMA_HAVE_LINKLIST 
.c0llp(c0llp), 
`endif 
.c0tsz(c0tsz), 
.c0abt(c0abt), 
`ifdef DMA_HAVE_LINKLIST 
.c0llpen(c0llpen), 
`endif 

`ifdef DMA_HAVE_CH1 
.c1csr(c1csr), .c1cfg(c1cfg), .c1sad(c1sad), 
.c1dad(c1dad), 
`ifdef DMA_HAVE_LINKLIST 
.c1llp(c1llp), 
`endif 
.c1tsz(c1tsz), 
.c1abt(c1abt), 
`ifdef DMA_HAVE_LINKLIST 
.c1llpen(c1llpen), 
`endif 
`endif 
`ifdef DMA_HAVE_CH2 
.c2csr(c2csr), .c2cfg(c2cfg), .c2sad(c2sad), 
.c2dad(c2dad), 
`ifdef DMA_HAVE_LINKLIST 
.c2llp(c2llp), 
`endif 
.c2tsz(c2tsz), 
.c2abt(c2abt), 
`ifdef DMA_HAVE_LINKLIST 
.c2llpen(c2llpen), 
`endif 
`endif 
`ifdef DMA_HAVE_CH3 
.c3csr(c3csr), .c3cfg(c3cfg), .c3sad(c3sad), 
.c3dad(c3dad), 
`ifdef DMA_HAVE_LINKLIST 
.c3llp(c3llp), 
`endif 
.c3tsz(c3tsz), 
.c3abt(c3abt), 
`ifdef DMA_HAVE_LINKLIST 
.c3llpen(c3llpen), 
`endif 
`endif 
`ifdef DMA_HAVE_CH4 
.c4csr(c4csr), .c4cfg(c4cfg), .c4sad(c4sad), 
.c4dad(c4dad), 
`ifdef DMA_HAVE_LINKLIST 
.c4llp(c4llp), 
`endif 
.c4tsz(c4tsz), 
.c4abt(c4abt), 
`ifdef DMA_HAVE_LINKLIST 
.c4llpen(c4llpen), 
`endif 
`endif 
`ifdef DMA_HAVE_CH5 
.c5csr(c5csr), .c5cfg(c5cfg), .c5sad(c5sad), 
.c5dad(c5dad), 
`ifdef DMA_HAVE_LINKLIST 
.c5llp(c5llp), 
`endif 
.c5tsz(c5tsz), 
.c5abt(c5abt), 
`ifdef DMA_HAVE_LINKLIST 
.c5llpen(c5llpen), 
`endif 
`endif 
`ifdef DMA_HAVE_CH6 
.c6csr(c6csr), .c6cfg(c6cfg), .c6sad(c6sad), 
.c6dad(c6dad), 
`ifdef DMA_HAVE_LINKLIST 
.c6llp(c6llp), 
`endif 
.c6tsz(c6tsz), 
.c6abt(c6abt), 
`ifdef DMA_HAVE_LINKLIST 
.c6llpen(c6llpen), 
`endif 
`endif 
`ifdef DMA_HAVE_CH7 
.c7csr(c7csr), .c7cfg(c7cfg), .c7sad(c7sad), 
.c7dad(c7dad), 
`ifdef DMA_HAVE_LINKLIST 
.c7llp(c7llp), 
`endif 
.c7tsz(c7tsz), 
.c7abt(c7abt), 
`ifdef DMA_HAVE_LINKLIST 
.c7llpen(c7llpen), 
`endif 
`endif 

.arb_ch_sel(arb_ch_sel), 
.arb_chcsr(arb_chcsr), 
.arb_chsad(arb_chsad), 
.arb_chdad(arb_chdad), 
`ifdef DMA_HAVE_LINKLIST 
.arb_chllp(arb_chllp), 
`endif 
.arb_chtsz(arb_chtsz), 
.arb_chabt(arb_chabt), 
`ifdef DMA_HAVE_LINKLIST 
.arb_chllpen(arb_chllpen), 
`endif 

.arb_abt_any(arb_abt_any), 



.de_ack(de_ack), 


.de_stup(de_st[5]), 
.de_st_idle(de_st[0]), 

.de_abt_on_idle(de_abt_on_idle), 

.tsz_eq0(tsz_eq0), 
.arb_req(arb_req) 
); 

dma_ahbslv ahb_slv( 

.HCLK(HCLK), 
.HRSTn(HRSTn), 
.hreadyin(hreadyin), 


.hsel_reg(hsel_reg), 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
.hsel_br(hsel_br), 
`endif 
`endif 

.htrans(htrans), 
.hsize(hsize), 
.hprot(hprot), 
.hwrite(hwrite), 
.haddr(haddr), 
.hwdata(hwdata), 


.hresp_reg(hresp_reg), 
.hreadyout_reg(hreadyout_reg), 
.hrdata_reg(hrdata_reg), 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
.hresp_br(hresp_br), 
.hreadyout_br(hreadyout_br), 
.hrdata_br(hrdata_br), 
`endif 
`endif 



.rf_dti(rf_dto), 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
.de_arb_br(m1_arb_br), 
`endif 
`endif 


.m0endian(csr[1]), 
.m1endian(csr[2]), 

.m1_dt_st(m1_dt_st), 


`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
.h1trans(h1trans), 
.h1rdata(h1rdata), 
.h1readyin(h1readyin), 
.h1resp(h1resp), 
`endif 
`endif 

.slv_ado(slv_ad), 
.slv_ad_d1o(slv_ad_d1), 
.slv_dto(slv_dt), 
.slv_szo(slv_sz), 
.slv_sz_d1o(slv_sz_d1), 
.slv_pt_d1o(slv_pt_d1), 
.slv_wr_d1o(slv_wr_d1), 
.slv_rf_req(slv_rf_req) 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
, 
.slv_br_req(slv_br_req), 


.slv_br_dto(slv_br_dt), 
.slv_brst_cmd(slv_brst_cmd), 
.slv_brst_mscd(slv_brst_mscd) 



`endif 
`endif 

); 


`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 

dma_ahbdec m1_decoder( 

.haddr(h1addr), 


.c0dmabs(c0dmabs), 

`ifdef DMA_HAVE_CH1 
.c1dmabs(c1dmabs), 
`endif 
`ifdef DMA_HAVE_CH2 
.c2dmabs(c2dmabs), 
`endif 
`ifdef DMA_HAVE_CH3 
.c3dmabs(c3dmabs), 
`endif 
`ifdef DMA_HAVE_CH4 
.c4dmabs(c4dmabs), 
`endif 
`ifdef DMA_HAVE_CH5 
.c5dmabs(c5dmabs), 
`endif 
`ifdef DMA_HAVE_CH6 
.c6dmabs(c6dmabs), 
`endif 
`ifdef DMA_HAVE_CH7 
.c7dmabs(c7dmabs), 
`endif 

.c0brbs(c0brbs), 
`ifdef DMA_HAVE_CH1 
.c1brbs(c1brbs), 
`endif 
`ifdef DMA_HAVE_CH2 
.c2brbs(c2brbs), 
`endif 
`ifdef DMA_HAVE_CH3 
.c3brbs(c3brbs), 
`endif 
`ifdef DMA_HAVE_CH4 
.c4brbs(c4brbs), 
`endif 
`ifdef DMA_HAVE_CH5 
.c5brbs(c5brbs), 
`endif 
`ifdef DMA_HAVE_CH6 
.c6brbs(c6brbs), 
`endif 
`ifdef DMA_HAVE_CH7 
.c7brbs(c7brbs), 
`endif 

.hsel_dma(h1sel_dma), 
.hsel_br (h1sel_br) 
); 

dma_ahbmux m1_mux( 

.HCLK(HCLK), 
.HRSTn(HRSTn), 

.htrans(h1trans), 

.hsel_dma(h1sel_dma), 
.hsel_br (h1sel_br), 

.hrdt0_dma(h1rdt0_dma), 
`ifdef DMA_HAVE_CH1 
.hrdt1_dma(h1rdt1_dma), 
`endif 
`ifdef DMA_HAVE_CH2 
.hrdt2_dma(h1rdt2_dma), 
`endif 
`ifdef DMA_HAVE_CH3 
.hrdt3_dma(h1rdt3_dma), 
`endif 
`ifdef DMA_HAVE_CH4 
.hrdt4_dma(h1rdt4_dma), 
`endif 
`ifdef DMA_HAVE_CH5 
.hrdt5_dma(h1rdt5_dma), 
`endif 
`ifdef DMA_HAVE_CH6 
.hrdt6_dma(h1rdt6_dma), 
`endif 
`ifdef DMA_HAVE_CH7 
.hrdt7_dma(h1rdt7_dma), 
`endif 

.hrp0_dma(h1rp0_dma), 
`ifdef DMA_HAVE_CH1 
.hrp1_dma(h1rp1_dma), 
`endif 
`ifdef DMA_HAVE_CH2 
.hrp2_dma(h1rp2_dma), 
`endif 
`ifdef DMA_HAVE_CH3 
.hrp3_dma(h1rp3_dma), 
`endif 
`ifdef DMA_HAVE_CH4 
.hrp4_dma(h1rp4_dma), 
`endif 
`ifdef DMA_HAVE_CH5 
.hrp5_dma(h1rp5_dma), 
`endif 
`ifdef DMA_HAVE_CH6 
.hrp6_dma(h1rp6_dma), 
`endif 
`ifdef DMA_HAVE_CH7 
.hrp7_dma(h1rp7_dma), 
`endif 

.hrdy0_dma(h1rdy0_dma), 
`ifdef DMA_HAVE_CH1 
.hrdy1_dma(h1rdy1_dma), 
`endif 
`ifdef DMA_HAVE_CH2 
.hrdy2_dma(h1rdy2_dma), 
`endif 
`ifdef DMA_HAVE_CH3 
.hrdy3_dma(h1rdy3_dma), 
`endif 
`ifdef DMA_HAVE_CH4 
.hrdy4_dma(h1rdy4_dma), 
`endif 
`ifdef DMA_HAVE_CH5 
.hrdy5_dma(h1rdy5_dma), 
`endif 
`ifdef DMA_HAVE_CH6 
.hrdy6_dma(h1rdy6_dma), 
`endif 
`ifdef DMA_HAVE_CH7 
.hrdy7_dma(h1rdy7_dma), 
`endif 

.hrdt0_br(h1rdt0_br), 
`ifdef DMA_HAVE_CH1 
.hrdt1_br(h1rdt1_br), 
`endif 
`ifdef DMA_HAVE_CH2 
.hrdt2_br(h1rdt2_br), 
`endif 
`ifdef DMA_HAVE_CH3 
.hrdt3_br(h1rdt3_br), 
`endif 
`ifdef DMA_HAVE_CH4 
.hrdt4_br(h1rdt4_br), 
`endif 
`ifdef DMA_HAVE_CH5 
.hrdt5_br(h1rdt5_br), 
`endif 
`ifdef DMA_HAVE_CH6 
.hrdt6_br(h1rdt6_br), 
`endif 
`ifdef DMA_HAVE_CH7 
.hrdt7_br(h1rdt7_br), 
`endif 

.hrp0_br(h1rp0_br), 
`ifdef DMA_HAVE_CH1 
.hrp1_br(h1rp1_br), 
`endif 
`ifdef DMA_HAVE_CH2 
.hrp2_br(h1rp2_br), 
`endif 
`ifdef DMA_HAVE_CH3 
.hrp3_br(h1rp3_br), 
`endif 
`ifdef DMA_HAVE_CH4 
.hrp4_br(h1rp4_br), 
`endif 
`ifdef DMA_HAVE_CH5 
.hrp5_br(h1rp5_br), 
`endif 
`ifdef DMA_HAVE_CH6 
.hrp6_br(h1rp6_br), 
`endif 
`ifdef DMA_HAVE_CH7 
.hrp7_br(h1rp7_br), 
`endif 

.hrdy0_br(h1rdy0_br), 
`ifdef DMA_HAVE_CH1 
.hrdy1_br(h1rdy1_br), 
`endif 
`ifdef DMA_HAVE_CH2 
.hrdy2_br(h1rdy2_br), 
`endif 
`ifdef DMA_HAVE_CH3 
.hrdy3_br(h1rdy3_br), 
`endif 
`ifdef DMA_HAVE_CH4 
.hrdy4_br(h1rdy4_br), 
`endif 
`ifdef DMA_HAVE_CH5 
.hrdy5_br(h1rdy5_br), 
`endif 
`ifdef DMA_HAVE_CH6 
.hrdy6_br(h1rdy6_br), 
`endif 
`ifdef DMA_HAVE_CH7 
.hrdy7_br(h1rdy7_br), 
`endif 

.hrdata(h1rdata), 
.hresp(h1resp), 
.hreadyin(h1readyin) 
); 

`endif 
`endif 

endmodule 
