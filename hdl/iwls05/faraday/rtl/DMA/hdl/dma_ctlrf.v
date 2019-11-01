







































`include "DMA_DEFINE.vh" 

module dma_ctlrf 
( 

HCLK, 
HRSTn, 


slv_ad, 
slv_ad_d1, 
slv_wdti, 
slv_sz, 
slv_wr_d1, 
slv_rf_sel, 

de_st_idle, 
de_st_upd, 

de_st_llp0, 
de_sad_we, 
de_dad_we, 
`ifdef DMA_HAVE_LINKLIST 
de_llp_we, 
`endif 
de_tsz_we, 
de_en_clr, 
`ifdef DMA_HAVE_LINKLIST 
de_csr_we, 
de_llpen_we, 
`endif 


de_err_notify, 

tsz_eq0, 
de_tc_st, 

de_sad, 
de_dad, 
`ifdef DMA_HAVE_LINKLIST 
de_llp, 
`endif 
de_tsz, 
de_csr, 
`ifdef DMA_HAVE_LINKLIST 
de_llpen, 
`endif 
de_busy, 
arb_ch_sel, 

rf_cherr, 
rf_dto, 


dmaint, dmaint_tc, dmaint_err, csr, sync, 

err, 

c0csr, c0cfg, c0sad, c0dad, 

`ifdef DMA_HAVE_LINKLIST 
c0llp, 
`endif 
c0tsz, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
c0dmabs, c0brbs, 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
c0llpen, 
`endif 

c0abt 

`ifdef DMA_HAVE_CH1 
,c1csr, c1cfg, c1sad, c1dad, 

`ifdef DMA_HAVE_LINKLIST 
c1llp, 
`endif 

c1tsz, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
c1dmabs, c1brbs, 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
c1llpen, 
`endif 

c1abt 

`endif 

`ifdef DMA_HAVE_CH2 
,c2csr, c2cfg, c2sad, c2dad, 

`ifdef DMA_HAVE_LINKLIST 
c2llp, 
`endif 

c2tsz, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
c2dmabs, c2brbs, 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
c2llpen, 
`endif 

c2abt 

`endif 

`ifdef DMA_HAVE_CH3 
,c3csr, c3cfg, c3sad, c3dad, 
`ifdef DMA_HAVE_LINKLIST 
c3llp, 
`endif 
c3tsz, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
c3dmabs, c3brbs, 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
c3llpen, 
`endif 

c3abt 

`endif 

`ifdef DMA_HAVE_CH4 
,c4csr, c4cfg, c4sad, c4dad, 
`ifdef DMA_HAVE_LINKLIST 
c4llp, 
`endif 
c4tsz, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
c4dmabs, c4brbs, 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
c4llpen, 
`endif 

c4abt 

`endif 

`ifdef DMA_HAVE_CH5 
,c5csr, c5cfg, c5sad, c5dad, 
`ifdef DMA_HAVE_LINKLIST 
c5llp, 
`endif 
c5tsz, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
c5dmabs, c5brbs, 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
c5llpen, 
`endif 

c5abt 

`endif 

`ifdef DMA_HAVE_CH6 
,c6csr, c6cfg, c6sad, c6dad, 

`ifdef DMA_HAVE_LINKLIST 
c6llp, 
`endif 

c6tsz, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
c6dmabs, c6brbs, 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
c6llpen, 
`endif 

c6abt 

`endif 

`ifdef DMA_HAVE_CH7 
,c7csr, c7cfg, c7sad, c7dad, 
`ifdef DMA_HAVE_LINKLIST 
c7llp, 
`endif 
c7tsz, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
c7dmabs, c7brbs, 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
c7llpen, 
`endif 

c7abt 

`endif 
); 


input HCLK; 
input HRSTn; 


input [`DMA_HADDR_WIDTH-1:0] slv_ad; 
input [`DMA_HADDR_WIDTH-1:0] slv_ad_d1; 
input [`DMA_HDATA_WIDTH-1:0] slv_wdti; 
input [`DMA_HSIZE_WIDTH-1:0] slv_sz; 
input slv_wr_d1; 
input slv_rf_sel; 
input de_st_idle; 
input de_st_upd; 

input de_st_llp0; 
input de_sad_we; 
input de_dad_we; 
`ifdef DMA_HAVE_LINKLIST 
input de_llp_we; 
`endif 
input de_tsz_we; 
input de_en_clr; 
`ifdef DMA_HAVE_LINKLIST 
input de_csr_we; 
input de_llpen_we; 
`endif 


input de_err_notify; 

input tsz_eq0; 
input de_tc_st; 

input [`DMA_HADDR_WIDTH-1:0] de_sad; 
input [`DMA_HADDR_WIDTH-1:0] de_dad; 
`ifdef DMA_HAVE_LINKLIST 
input [`DMA_HADDR_WIDTH-1:0] de_llp; 
`endif 
input [`DMA_CHSZ_WIDTH-1:0] de_tsz; 
input [`DMA_HDATA_WIDTH-1:0] de_csr; 
`ifdef DMA_HAVE_LINKLIST 
input de_llpen; 
`endif 
input de_busy; 
input [`DMA_CHNO_WIDTH-1:0] arb_ch_sel; 

output rf_cherr; 
output [`DMA_HDATA_WIDTH-1:0] rf_dto; 


output dmaint; 
output dmaint_tc; 
output dmaint_err; 
output [`DMA_CSR_WIDTH-1:0] csr; 
output [`DMA_MAX_CHNO-1:0] sync; 

output [`DMA_MAX_CHNO-1:0] err; 


output [`DMA_CHCSR_WIDTH-1:0] c0csr; 
output [`DMA_CHCFG_WIDTH-1:0] c0cfg; 
output [`DMA_HADDR_WIDTH-1:0] c0sad; 
output [`DMA_HADDR_WIDTH-1:0] c0dad; 
`ifdef DMA_HAVE_LINKLIST 
output [`DMA_HADDR_WIDTH-1:0] c0llp; 
`endif 
output [`DMA_CHSZ_WIDTH-1:0] c0tsz; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
output [31:16] c0dmabs; 
output [31:16] c0brbs; 
`endif 
`endif 

output c0abt; 
`ifdef DMA_HAVE_LINKLIST 
output c0llpen; 
`endif 


`ifdef DMA_HAVE_CH1 
output [`DMA_CHCSR_WIDTH-1:0] c1csr; 
output [`DMA_CHCFG_WIDTH-1:0] c1cfg; 
output [`DMA_HADDR_WIDTH-1:0] c1sad; 
output [`DMA_HADDR_WIDTH-1:0] c1dad; 
`ifdef DMA_HAVE_LINKLIST 
output [`DMA_HADDR_WIDTH-1:0] c1llp; 
`endif 
output [`DMA_CHSZ_WIDTH-1:0] c1tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
output [31:16] c1dmabs; 
output [31:16] c1brbs; 
`endif 
`endif 
output c1abt; 
`ifdef DMA_HAVE_LINKLIST 
output c1llpen; 
`endif 
`endif 


`ifdef DMA_HAVE_CH2 
output [`DMA_CHCSR_WIDTH-1:0] c2csr; 
output [`DMA_CHCFG_WIDTH-1:0] c2cfg; 
output [`DMA_HADDR_WIDTH-1:0] c2sad; 
output [`DMA_HADDR_WIDTH-1:0] c2dad; 
`ifdef DMA_HAVE_LINKLIST 
output [`DMA_HADDR_WIDTH-1:0] c2llp; 
`endif 
output [`DMA_CHSZ_WIDTH-1:0] c2tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
output [31:16] c2dmabs; 
output [31:16] c2brbs; 
`endif 
`endif 
output c2abt; 
`ifdef DMA_HAVE_LINKLIST 
output c2llpen; 
`endif 

`endif 



`ifdef DMA_HAVE_CH3 
output [`DMA_CHCSR_WIDTH-1:0] c3csr; 
output [`DMA_CHCFG_WIDTH-1:0] c3cfg; 
output [`DMA_HADDR_WIDTH-1:0] c3sad; 
output [`DMA_HADDR_WIDTH-1:0] c3dad; 
`ifdef DMA_HAVE_LINKLIST 
output [`DMA_HADDR_WIDTH-1:0] c3llp; 
`endif 
output [`DMA_CHSZ_WIDTH-1:0] c3tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
output [31:16] c3dmabs; 
output [31:16] c3brbs; 
`endif 
`endif 
output c3abt; 
`ifdef DMA_HAVE_LINKLIST 
output c3llpen; 
`endif 

`endif 


`ifdef DMA_HAVE_CH4 
output [`DMA_CHCSR_WIDTH-1:0] c4csr; 
output [`DMA_CHCFG_WIDTH-1:0] c4cfg; 
output [`DMA_HADDR_WIDTH-1:0] c4sad; 
output [`DMA_HADDR_WIDTH-1:0] c4dad; 
`ifdef DMA_HAVE_LINKLIST 
output [`DMA_HADDR_WIDTH-1:0] c4llp; 
`endif 
output [`DMA_CHSZ_WIDTH-1:0] c4tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
output [31:16] c4dmabs; 
output [31:16] c4brbs; 
`endif 
`endif 
output c4abt; 
`ifdef DMA_HAVE_LINKLIST 
output c4llpen; 
`endif 

`endif 


`ifdef DMA_HAVE_CH5 
output [`DMA_CHCSR_WIDTH-1:0] c5csr; 
output [`DMA_CHCFG_WIDTH-1:0] c5cfg; 
output [`DMA_HADDR_WIDTH-1:0] c5sad; 
output [`DMA_HADDR_WIDTH-1:0] c5dad; 

`ifdef DMA_HAVE_LINKLIST 
output [`DMA_HADDR_WIDTH-1:0] c5llp; 
`endif 

output [`DMA_CHSZ_WIDTH-1:0] c5tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
output [31:16] c5dmabs; 
output [31:16] c5brbs; 
`endif 
`endif 
output c5abt; 
`ifdef DMA_HAVE_LINKLIST 
output c5llpen; 
`endif 

`endif 


`ifdef DMA_HAVE_CH6 
output [`DMA_CHCSR_WIDTH-1:0] c6csr; 
output [`DMA_CHCFG_WIDTH-1:0] c6cfg; 
output [`DMA_HADDR_WIDTH-1:0] c6sad; 
output [`DMA_HADDR_WIDTH-1:0] c6dad; 
`ifdef DMA_HAVE_LINKLIST 
output [`DMA_HADDR_WIDTH-1:0] c6llp; 
`endif 
output [`DMA_CHSZ_WIDTH-1:0] c6tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
output [31:16] c6dmabs; 
output [31:16] c6brbs; 
`endif 
`endif 
output c6abt; 
`ifdef DMA_HAVE_LINKLIST 
output c6llpen; 
`endif 

`endif 


`ifdef DMA_HAVE_CH7 
output [`DMA_CHCSR_WIDTH-1:0] c7csr; 
output [`DMA_CHCFG_WIDTH-1:0] c7cfg; 
output [`DMA_HADDR_WIDTH-1:0] c7sad; 
output [`DMA_HADDR_WIDTH-1:0] c7dad; 

`ifdef DMA_HAVE_LINKLIST 
output [`DMA_HADDR_WIDTH-1:0] c7llp; 
`endif 

output [`DMA_CHSZ_WIDTH-1:0] c7tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
output [31:16] c7dmabs; 
output [31:16] c7brbs; 
`endif 
`endif 
output c7abt; 

`ifdef DMA_HAVE_LINKLIST 
output c7llpen; 
`endif 

`endif 

wire be0,be1,be2,be3; 
wire dma_chrfsel; 

wire sel_tc_clr; 
wire sel_err_clr; 
wire sel_csr, csr_we; 
wire sel_sync, sync_we; 
wire [`DMA_MAX_CHNO-1:0] tc_clr; 
wire [`DMA_MAX_CHNO-1:0] tc_st; 
wire [`DMA_MAX_CHNO-1:0] err_clr; 

wire [`DMA_MAX_CHNO-1:0] abt_clr; 
wire [`DMA_MAX_CHNO-1:0] err_st; 

wire [`DMA_MAX_CHNO-1:0] abt_st; 
wire [7:0] ch_en; 
wire [7:0] ch_busy; 
wire [`DMA_MAX_CHNO-1:0] int; 
wire [`DMA_MAX_CHNO-1:0] int_tc; 
wire [`DMA_MAX_CHNO-1:0] int_err; 

wire [`DMA_MAX_CHNO-1:0] int_abt; 

wire intin,inttcin,interrin,intabtin; 

wire c0csr_we, c0cfg_we, c0sad_we, c0dad_we; 
`ifdef DMA_HAVE_LINKLIST 
wire c0llp_we; 
`endif 
wire c0tsz_we; 
wire c0abt; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire c0dbs_we; 
wire c0bbs_we; 
`endif 
`endif 

`ifdef DMA_HAVE_CH1 
wire c1csr_we, c1cfg_we, c1sad_we, c1dad_we; 
`ifdef DMA_HAVE_LINKLIST 
wire c1llp_we; 
`endif 
wire c1tsz_we; 
wire c1abt; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire c1dbs_we; 
wire c1bbs_we; 
`endif 
`endif 
`endif 

`ifdef DMA_HAVE_CH2 
wire c2csr_we, c2cfg_we, c2sad_we, c2dad_we; 
`ifdef DMA_HAVE_LINKLIST 
wire c2llp_we; 
`endif 
wire c2tsz_we; 
wire c2abt; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire c2dbs_we; 
wire c2bbs_we; 
`endif 
`endif 
`endif 

`ifdef DMA_HAVE_CH3 
wire c3csr_we, c3cfg_we, c3sad_we, c3dad_we; 
`ifdef DMA_HAVE_LINKLIST 
wire c3llp_we; 
`endif 
wire c3tsz_we; 
wire c3abt; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire c3dbs_we; 
wire c3bbs_we; 
`endif 
`endif 
`endif 

`ifdef DMA_HAVE_CH4 
wire c4csr_we, c4cfg_we, c4sad_we, c4dad_we; 
`ifdef DMA_HAVE_LINKLIST 
wire c4llp_we; 
`endif 
wire c4tsz_we; 
wire c4abt; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire c4dbs_we; 
wire c4bbs_we; 
`endif 
`endif 
`endif 

`ifdef DMA_HAVE_CH5 
wire c5csr_we, c5cfg_we, c5sad_we, c5dad_we; 
`ifdef DMA_HAVE_LINKLIST 
wire c5llp_we; 
`endif 
wire c5tsz_we; 
wire c5abt; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire c5dbs_we; 
wire c5bbs_we; 
`endif 
`endif 
`endif 

`ifdef DMA_HAVE_CH6 
wire c6csr_we, c6cfg_we, c6sad_we, c6dad_we; 
`ifdef DMA_HAVE_LINKLIST 
wire c6llp_we; 
`endif 
wire c6tsz_we; 
wire c6abt; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire c6dbs_we; 
wire c6bbs_we; 
`endif 
`endif 
`endif 

`ifdef DMA_HAVE_CH7 
wire c7csr_we, c7cfg_we, c7sad_we, c7dad_we; 
`ifdef DMA_HAVE_LINKLIST 
wire c7llp_we; 
`endif 
wire c7tsz_we; 
wire c7abt; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire c7dbs_we; 
wire c7bbs_we; 
`endif 
`endif 
`endif 

wire sel_c0csr, sel_c0cfg, sel_c0sad, sel_c0dad; 
`ifdef DMA_HAVE_LINKLIST 
wire sel_c0llp; 
`endif 
wire sel_c0tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire sel_c0dbs; 
wire sel_c0bbs; 
`endif 
`endif 

`ifdef DMA_HAVE_CH1 
wire sel_c1csr, sel_c1cfg, sel_c1sad, sel_c1dad; 
`ifdef DMA_HAVE_LINKLIST 
wire sel_c1llp; 
`endif 
wire sel_c1tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire sel_c1dbs; 
wire sel_c1bbs; 
`endif 
`endif 
`endif 

`ifdef DMA_HAVE_CH2 
wire sel_c2csr, sel_c2cfg, sel_c2sad, sel_c2dad; 
`ifdef DMA_HAVE_LINKLIST 
wire sel_c2llp; 
`endif 
wire sel_c2tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire sel_c2dbs; 
wire sel_c2bbs; 
`endif 
`endif 
`endif 

`ifdef DMA_HAVE_CH3 
wire sel_c3csr, sel_c3cfg, sel_c3sad, sel_c3dad; 
`ifdef DMA_HAVE_LINKLIST 
wire sel_c3llp; 
`endif 
wire sel_c3tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire sel_c3dbs; 
wire sel_c3bbs; 
`endif 
`endif 
`endif 

`ifdef DMA_HAVE_CH4 
wire sel_c4csr, sel_c4cfg, sel_c4sad, sel_c4dad; 
`ifdef DMA_HAVE_LINKLIST 
wire sel_c4llp; 
`endif 
wire sel_c4tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire sel_c4dbs; 
wire sel_c4bbs; 
`endif 
`endif 
`endif 

`ifdef DMA_HAVE_CH5 
wire sel_c5csr, sel_c5cfg, sel_c5sad, sel_c5dad; 
`ifdef DMA_HAVE_LINKLIST 
wire sel_c5llp; 
`endif 
wire sel_c5tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire sel_c5dbs; 
wire sel_c5bbs; 
`endif 
`endif 
`endif 

`ifdef DMA_HAVE_CH6 
wire sel_c6csr, sel_c6cfg, sel_c6sad, sel_c6dad; 
`ifdef DMA_HAVE_LINKLIST 
wire sel_c6llp; 
`endif 
wire sel_c6tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire sel_c6dbs; 
wire sel_c6bbs; 
`endif 
`endif 
`endif 

`ifdef DMA_HAVE_CH7 
wire sel_c7csr, sel_c7cfg, sel_c7sad, sel_c7dad; 
`ifdef DMA_HAVE_LINKLIST 
wire sel_c7llp; 
`endif 
wire sel_c7tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire sel_c7dbs; 
wire sel_c7bbs; 
`endif 
`endif 
`endif 

`ifdef DMA_HAVE_LINKLIST 
`else 
wire de_csr_we = 0; 
`endif 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
reg [31:16] mux_dbs; 
reg [31:16] mux_bbs; 
`endif 
`endif 

reg [31:0] mux_ms; 


reg [31:0] mux_gl; 
reg [`DMA_HDATA_WIDTH-1:0] mux_ch; 

reg [`DMA_HDATA_WIDTH-1:0] mux_c0l,mux_c0h; 

`ifdef DMA_HAVE_CH1 
reg [`DMA_HDATA_WIDTH-1:0] mux_c1l,mux_c1h; 
`endif 

`ifdef DMA_HAVE_CH2 
reg [`DMA_HDATA_WIDTH-1:0] mux_c2l,mux_c2h; 
`endif 

`ifdef DMA_HAVE_CH3 
reg [`DMA_HDATA_WIDTH-1:0] mux_c3l,mux_c3h; 
`endif 

`ifdef DMA_HAVE_CH4 
reg [`DMA_HDATA_WIDTH-1:0] mux_c4l,mux_c4h; 
`endif 

`ifdef DMA_HAVE_CH5 
reg [`DMA_HDATA_WIDTH-1:0] mux_c5l,mux_c5h; 
`endif 

`ifdef DMA_HAVE_CH6 
reg [`DMA_HDATA_WIDTH-1:0] mux_c6l,mux_c6h; 
`endif 

`ifdef DMA_HAVE_CH7 
reg [`DMA_HDATA_WIDTH-1:0] mux_c7l,mux_c7h; 
`endif 

reg dmaint; 
reg dmaint_tc; 
reg dmaint_err; 
reg [`DMA_MAX_CHNO-1:0] err; 

reg [`DMA_MAX_CHNO-1:0] abt; 
reg [`DMA_MAX_CHNO-1:0] tc; 
reg m1end; 
reg m0end; 
reg dmacen; 
reg [`DMA_MAX_CHNO-1:0] sync; 
reg [3:0] be_d1; 
reg rf_sel_d1; 
reg rf_cherr; 

wire [`DMA_CHCSR_WIDTH-1:0] c0csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c0cfg; 
wire [`DMA_HADDR_WIDTH-1:0] c0sad; 
wire [`DMA_HADDR_WIDTH-1:0] c0dad; 
`ifdef DMA_HAVE_LINKLIST 
wire [`DMA_HADDR_WIDTH-1:0] c0llp; 
`endif 
wire [`DMA_CHSZ_WIDTH-1:0] c0tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
reg [31:16] c0dmabs; 
reg [31:16] c0brbs; 
`endif 
`endif 


wire [`DMA_CHCSR_WIDTH-1:0] c1csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c1cfg; 

`ifdef DMA_HAVE_CH1 
wire [`DMA_HADDR_WIDTH-1:0] c1sad; 
wire [`DMA_HADDR_WIDTH-1:0] c1dad; 
`ifdef DMA_HAVE_LINKLIST 
wire [`DMA_HADDR_WIDTH-1:0] c1llp; 
`endif 
wire [`DMA_CHSZ_WIDTH-1:0] c1tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
reg [31:16] c1dmabs; 
reg [31:16] c1brbs; 
`endif 
`endif 
`endif 

wire [`DMA_CHCSR_WIDTH-1:0] c2csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c2cfg; 

`ifdef DMA_HAVE_CH2 
wire [`DMA_HADDR_WIDTH-1:0] c2sad; 
wire [`DMA_HADDR_WIDTH-1:0] c2dad; 
`ifdef DMA_HAVE_LINKLIST 
wire [`DMA_HADDR_WIDTH-1:0] c2llp; 
`endif 
wire [`DMA_CHSZ_WIDTH-1:0] c2tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
reg [31:16] c2dmabs; 
reg [31:16] c2brbs; 
`endif 
`endif 
`endif 

wire [`DMA_CHCSR_WIDTH-1:0] c3csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c3cfg; 

`ifdef DMA_HAVE_CH3 
wire [`DMA_HADDR_WIDTH-1:0] c3sad; 
wire [`DMA_HADDR_WIDTH-1:0] c3dad; 
`ifdef DMA_HAVE_LINKLIST 
wire [`DMA_HADDR_WIDTH-1:0] c3llp; 
`endif 
wire [`DMA_CHSZ_WIDTH-1:0] c3tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
reg [31:16] c3dmabs; 
reg [31:16] c3brbs; 
`endif 
`endif 
`endif 


wire [`DMA_CHCSR_WIDTH-1:0] c4csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c4cfg; 

`ifdef DMA_HAVE_CH4 
wire [`DMA_HADDR_WIDTH-1:0] c4sad; 
wire [`DMA_HADDR_WIDTH-1:0] c4dad; 
`ifdef DMA_HAVE_LINKLIST 
wire [`DMA_HADDR_WIDTH-1:0] c4llp; 
`endif 
wire [`DMA_CHSZ_WIDTH-1:0] c4tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
reg [31:16] c4dmabs; 
reg [31:16] c4brbs; 
`endif 
`endif 
`endif 

wire [`DMA_CHCSR_WIDTH-1:0] c5csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c5cfg; 

`ifdef DMA_HAVE_CH5 
wire [`DMA_HADDR_WIDTH-1:0] c5sad; 
wire [`DMA_HADDR_WIDTH-1:0] c5dad; 
`ifdef DMA_HAVE_LINKLIST 
wire [`DMA_HADDR_WIDTH-1:0] c5llp; 
`endif 
wire [`DMA_CHSZ_WIDTH-1:0] c5tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
reg [31:16] c5dmabs; 
reg [31:16] c5brbs; 
`endif 
`endif 
`endif 

wire [`DMA_CHCSR_WIDTH-1:0] c6csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c6cfg; 

`ifdef DMA_HAVE_CH6 
wire [`DMA_HADDR_WIDTH-1:0] c6sad; 
wire [`DMA_HADDR_WIDTH-1:0] c6dad; 
`ifdef DMA_HAVE_LINKLIST 
wire [`DMA_HADDR_WIDTH-1:0] c6llp; 
`endif 
wire [`DMA_CHSZ_WIDTH-1:0] c6tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
reg [31:16] c6dmabs; 
reg [31:16] c6brbs; 
`endif 
`endif 
`endif 


wire [`DMA_CHCSR_WIDTH-1:0] c7csr; 
wire [`DMA_CHCFG_WIDTH-1:0] c7cfg; 

`ifdef DMA_HAVE_CH7 
wire [`DMA_HADDR_WIDTH-1:0] c7sad; 
wire [`DMA_HADDR_WIDTH-1:0] c7dad; 
`ifdef DMA_HAVE_LINKLIST 
wire [`DMA_HADDR_WIDTH-1:0] c7llp; 
`endif 
wire [`DMA_CHSZ_WIDTH-1:0] c7tsz; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
reg [31:16] c7dmabs; 
reg [31:16] c7brbs; 
`endif 
`endif 
`endif 




assign be0 = ((slv_sz == `DMA_HSIZE_BYTE)&~slv_ad[1]&~slv_ad[0]) | 
((slv_sz == `DMA_HSIZE_HALFWORD)&~slv_ad[1]) | 
(slv_sz == `DMA_HSIZE_WORD); 
assign be1 = ((slv_sz == `DMA_HSIZE_BYTE)&~slv_ad[1]&slv_ad[0]) | 
((slv_sz == `DMA_HSIZE_HALFWORD)&~slv_ad[1]) | 
(slv_sz == `DMA_HSIZE_WORD); 
assign be2 = ((slv_sz == `DMA_HSIZE_BYTE)&slv_ad[1]&~slv_ad[0]) | 
((slv_sz == `DMA_HSIZE_HALFWORD)&slv_ad[1]) | 
(slv_sz == `DMA_HSIZE_WORD); 
assign be3 = ((slv_sz == `DMA_HSIZE_BYTE)&slv_ad[1]&slv_ad[0]) | 
((slv_sz == `DMA_HSIZE_HALFWORD)&slv_ad[1]) | 
(slv_sz == `DMA_HSIZE_WORD); 




assign dma_chrfsel = (slv_ad[8]); 

assign rf_dto = dma_chrfsel? mux_ch : mux_ms; 



























always @(slv_ad or mux_gl 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
or mux_dbs or mux_bbs 
`endif 
`endif 
) 
case(slv_ad[7:6]) 


2'b00: mux_ms = {mux_gl}; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
2'b01: mux_ms = {mux_dbs,16'b0}; 
2'b10: mux_ms = {mux_bbs,16'b0}; 
`endif 
`endif 

default: mux_ms = 32'bx; 
endcase 


always @(slv_ad or int or int_tc or int_err or tc or 
err or ch_en or ch_busy or csr or sync or int_abt or abt) 
case(slv_ad[5:2]) 
4'h0: mux_gl = {{{32-`DMA_MAX_CHNO}{1'b0}},int}; 
4'h1: mux_gl = {{{32-`DMA_MAX_CHNO}{1'b0}},int_tc}; 
4'h3: mux_gl = {{{16-`DMA_MAX_CHNO}{1'b0}},int_abt,{{16-`DMA_MAX_CHNO}{1'b0}},int_err}; 
4'h5: mux_gl = {{{32-`DMA_MAX_CHNO}{1'b0}},tc}; 
4'h6: mux_gl = {{{16-`DMA_MAX_CHNO}{1'b0}},abt, {{16-`DMA_MAX_CHNO}{1'b0}},err}; 
4'h7: mux_gl = {24'b0,ch_en}; 
4'h8: mux_gl = {24'b0,ch_busy}; 
4'h9: mux_gl = {{{32-`DMA_CSR_WIDTH}{1'b0}},csr}; 
4'ha: mux_gl = {{{32-`DMA_MAX_CHNO}{1'b0}},sync}; 
default: mux_gl = 'hx; 
endcase 


`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
always @(slv_ad or c0dmabs 
`ifdef DMA_HAVE_CH1 
or c1dmabs 
`endif 

`ifdef DMA_HAVE_CH2 
or c2dmabs 
`endif 

`ifdef DMA_HAVE_CH3 
or c3dmabs 
`endif 

`ifdef DMA_HAVE_CH4 
or c4dmabs 
`endif 

`ifdef DMA_HAVE_CH5 
or c5dmabs 
`endif 

`ifdef DMA_HAVE_CH6 
or c6dmabs 
`endif 

`ifdef DMA_HAVE_CH7 
or c7dmabs 
`endif 
) 
case(slv_ad[4:2]) 
3'h0: mux_dbs = c0dmabs; 
`ifdef DMA_HAVE_CH1 
3'h1: mux_dbs = c1dmabs; 
`endif 

`ifdef DMA_HAVE_CH2 
3'h2: mux_dbs = c2dmabs; 
`endif 

`ifdef DMA_HAVE_CH3 
3'h3: mux_dbs = c3dmabs; 
`endif 

`ifdef DMA_HAVE_CH4 
3'h4: mux_dbs = c4dmabs; 
`endif 

`ifdef DMA_HAVE_CH5 
3'h5: mux_dbs = c5dmabs; 
`endif 

`ifdef DMA_HAVE_CH6 
3'h6: mux_dbs = c6dmabs; 
`endif 

`ifdef DMA_HAVE_CH7 
3'h7: mux_dbs = c7dmabs; 
`endif 

default: mux_dbs = 'hx; 
endcase 


always @(slv_ad or c0brbs 
`ifdef DMA_HAVE_CH1 
or c1brbs 
`endif 

`ifdef DMA_HAVE_CH2 
or c2brbs 
`endif 

`ifdef DMA_HAVE_CH3 
or c3brbs 
`endif 

`ifdef DMA_HAVE_CH4 
or c4brbs 
`endif 

`ifdef DMA_HAVE_CH5 
or c5brbs 
`endif 

`ifdef DMA_HAVE_CH6 
or c6brbs 
`endif 

`ifdef DMA_HAVE_CH7 
or c7brbs 
`endif 

) 
case(slv_ad[4:2]) 

3'h0: mux_bbs = c0brbs; 

`ifdef DMA_HAVE_CH1 
3'h1: mux_bbs = c1brbs; 
`endif 

`ifdef DMA_HAVE_CH2 
3'h2: mux_bbs = c2brbs; 
`endif 

`ifdef DMA_HAVE_CH3 
3'h3: mux_bbs = c3brbs; 
`endif 

`ifdef DMA_HAVE_CH4 
3'h4: mux_bbs = c4brbs; 
`endif 

`ifdef DMA_HAVE_CH5 
3'h5: mux_bbs = c5brbs; 
`endif 

`ifdef DMA_HAVE_CH6 
3'h6: mux_bbs = c6brbs; 
`endif 

`ifdef DMA_HAVE_CH7 
3'h7: mux_bbs = c7brbs; 
`endif 

default: mux_bbs = 'hx; 
endcase 
`endif 
`endif 


always @(slv_ad or mux_c0l or mux_c0h 

`ifdef DMA_HAVE_CH1 
or mux_c1l or mux_c1h 
`endif 

`ifdef DMA_HAVE_CH2 
or mux_c2l or mux_c2h 
`endif 

`ifdef DMA_HAVE_CH3 
or mux_c3l or mux_c3h 
`endif 

`ifdef DMA_HAVE_CH4 
or mux_c4l or mux_c4h 
`endif 

`ifdef DMA_HAVE_CH5 
or mux_c5l or mux_c5h 
`endif 

`ifdef DMA_HAVE_CH6 
or mux_c6l or mux_c6h 
`endif 

`ifdef DMA_HAVE_CH7 
or mux_c7l or mux_c7h 
`endif 
) 
case(slv_ad[7:4]) 
4'h0: mux_ch = mux_c0l; 
4'h1: mux_ch = mux_c0h; 

`ifdef DMA_HAVE_CH1 
4'h2: mux_ch = mux_c1l; 
4'h3: mux_ch = mux_c1h; 
`endif 

`ifdef DMA_HAVE_CH2 
4'h4: mux_ch = mux_c2l; 
4'h5: mux_ch = mux_c2h; 
`endif 

`ifdef DMA_HAVE_CH3 
4'h6: mux_ch = mux_c3l; 
4'h7: mux_ch = mux_c3h; 
`endif 

`ifdef DMA_HAVE_CH4 
4'h8: mux_ch = mux_c4l; 
4'h9: mux_ch = mux_c4h; 
`endif 

`ifdef DMA_HAVE_CH5 
4'ha: mux_ch = mux_c5l; 
4'hb: mux_ch = mux_c5h; 
`endif 

`ifdef DMA_HAVE_CH6 
4'hc: mux_ch = mux_c6l; 
4'hd: mux_ch = mux_c6h; 
`endif 

`ifdef DMA_HAVE_CH7 
4'he: mux_ch = mux_c7l; 
4'hf: mux_ch = mux_c7h; 
`endif 

default: mux_ch = 'hx; 
endcase 




always @(slv_ad or c0csr or c0cfg or c0sad or c0dad) 
case(slv_ad[3:2]) 
2'h0: mux_c0l = c0csr; 
2'h1: mux_c0l = c0cfg; 
2'h2: mux_c0l = c0sad; 
2'h3: mux_c0l = c0dad; 
endcase 

always @(slv_ad 
`ifdef DMA_HAVE_LINKLIST 
or c0llp 
`endif 
or c0tsz) 
case(slv_ad[3:2]) 
`ifdef DMA_HAVE_LINKLIST 
2'h0: mux_c0h = c0llp; 
`endif 
2'h1: mux_c0h = c0tsz; 
default: mux_c0h = 'hx; 
endcase 

`ifdef DMA_HAVE_CH1 

always @(slv_ad or c1csr or c1cfg or c1sad or c1dad) 
case(slv_ad[3:2]) 
2'h0: mux_c1l = c1csr; 
2'h1: mux_c1l = c1cfg; 
2'h2: mux_c1l = c1sad; 
2'h3: mux_c1l = c1dad; 
endcase 

always @(slv_ad 
`ifdef DMA_HAVE_LINKLIST 
or c1llp 
`endif 
or c1tsz) 
case(slv_ad[3:2]) 
`ifdef DMA_HAVE_LINKLIST 
2'h0: mux_c1h = c1llp; 
`endif 
2'h1: mux_c1h = c1tsz; 
default: mux_c1h = 'hx; 
endcase 
`endif 

`ifdef DMA_HAVE_CH2 

always @(slv_ad or c2csr or c2cfg or c2sad or c2dad) 
case(slv_ad[3:2]) 
2'h0: mux_c2l = c2csr; 
2'h1: mux_c2l = c2cfg; 
2'h2: mux_c2l = c2sad; 
2'h3: mux_c2l = c2dad; 
endcase 

always @(slv_ad 
`ifdef DMA_HAVE_LINKLIST 
or c2llp 
`endif 
or c2tsz) 
case(slv_ad[3:2]) 
`ifdef DMA_HAVE_LINKLIST 
2'h0: mux_c2h = c2llp; 
`endif 
2'h1: mux_c2h = c2tsz; 
default: mux_c2h = 'hx; 
endcase 
`endif 

`ifdef DMA_HAVE_CH3 

always @(slv_ad or c3csr or c3cfg or c3sad or c3dad) 
case(slv_ad[3:2]) 
2'h0: mux_c3l = c3csr; 
2'h1: mux_c3l = c3cfg; 
2'h2: mux_c3l = c3sad; 
2'h3: mux_c3l = c3dad; 
endcase 

always @(slv_ad 
`ifdef DMA_HAVE_LINKLIST 
or c3llp 
`endif 
or c3tsz) 
case(slv_ad[3:2]) 
`ifdef DMA_HAVE_LINKLIST 
2'h0: mux_c3h = c3llp; 
`endif 
2'h1: mux_c3h = c3tsz; 
default: mux_c3h = 'hx; 
endcase 
`endif 

`ifdef DMA_HAVE_CH4 

always @(slv_ad or c4csr or c4cfg or c4sad or c4dad) 
case(slv_ad[3:2]) 
2'h0: mux_c4l = c4csr; 
2'h1: mux_c4l = c4cfg; 
2'h2: mux_c4l = c4sad; 
2'h3: mux_c4l = c4dad; 
endcase 

always @(slv_ad 
`ifdef DMA_HAVE_LINKLIST 
or c4llp 
`endif 
or c4tsz) 
case(slv_ad[3:2]) 
`ifdef DMA_HAVE_LINKLIST 
2'h0: mux_c4h = c4llp; 
`endif 
2'h1: mux_c4h = c4tsz; 
default: mux_c4h = 'hx; 
endcase 
`endif 

`ifdef DMA_HAVE_CH5 

always @(slv_ad or c5csr or c5cfg or c5sad or c5dad) 
case(slv_ad[3:2]) 
2'h0: mux_c5l = c5csr; 
2'h1: mux_c5l = c5cfg; 
2'h2: mux_c5l = c5sad; 
2'h3: mux_c5l = c5dad; 
endcase 

always @(slv_ad 
`ifdef DMA_HAVE_LINKLIST 
or c5llp 
`endif 
or c5tsz) 
case(slv_ad[3:2]) 
`ifdef DMA_HAVE_LINKLIST 
2'h0: mux_c5h = c5llp; 
`endif 
2'h1: mux_c5h = c5tsz; 
default: mux_c5h = 'hx; 
endcase 
`endif 

`ifdef DMA_HAVE_CH6 

always @(slv_ad or c6csr or c6cfg or c6sad or c6dad) 
case(slv_ad[3:2]) 
2'h0: mux_c6l = c6csr; 
2'h1: mux_c6l = c6cfg; 
2'h2: mux_c6l = c6sad; 
2'h3: mux_c6l = c6dad; 
endcase 

always @(slv_ad 
`ifdef DMA_HAVE_LINKLIST 
or c6llp 
`endif 
or c6tsz) 
case(slv_ad[3:2]) 
`ifdef DMA_HAVE_LINKLIST 
2'h0: mux_c6h = c6llp; 
`endif 
2'h1: mux_c6h = c6tsz; 
default: mux_c6h = 'hx; 
endcase 
`endif 

`ifdef DMA_HAVE_CH7 

always @(slv_ad or c7csr or c7cfg or c7sad or c7dad) 
case(slv_ad[3:2]) 
2'h0: mux_c7l = c7csr; 
2'h1: mux_c7l = c7cfg; 
2'h2: mux_c7l = c7sad; 
2'h3: mux_c7l = c7dad; 
endcase 

always @(slv_ad 
`ifdef DMA_HAVE_LINKLIST 
or c7llp 
`endif 
or c7tsz) 
case(slv_ad[3:2]) 
`ifdef DMA_HAVE_LINKLIST 
2'h0: mux_c7h = c7llp; 
`endif 
2'h1: mux_c7h = c7tsz; 
default: mux_c7h = 'hx; 
endcase 
`endif 





always @(posedge HCLK) 
be_d1 <= {be3, be2, be1, be0}; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
rf_sel_d1 <= 1'b0; 
else 
rf_sel_d1 <= slv_rf_sel; 

assign sel_tc_clr = (slv_ad_d1[8:2] == 7'h2)&rf_sel_d1; 
assign sel_err_clr = (slv_ad_d1[8:2] == 7'h4)&rf_sel_d1; 
assign sel_csr = (slv_ad_d1[8:2] == 7'h9)&rf_sel_d1; 
assign sel_sync = (slv_ad_d1[8:2] == 7'ha)&rf_sel_d1; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 

assign sel_c0dbs = (slv_ad_d1[8:2] == 7'h10)&rf_sel_d1; 
assign sel_c0bbs = (slv_ad_d1[8:2] == 7'h20)&rf_sel_d1; 
assign c0dbs_we = (slv_wr_d1&sel_c0dbs); 
assign c0bbs_we = (slv_wr_d1&sel_c0bbs); 

`ifdef DMA_HAVE_CH1 
assign sel_c1dbs = (slv_ad_d1[8:2] == 7'h11)&rf_sel_d1; 
assign sel_c1bbs = (slv_ad_d1[8:2] == 7'h21)&rf_sel_d1; 
assign c1dbs_we = (slv_wr_d1&sel_c1dbs); 
assign c1bbs_we = (slv_wr_d1&sel_c1bbs); 
`endif 

`ifdef DMA_HAVE_CH2 
assign sel_c2dbs = (slv_ad_d1[8:2] == 7'h12)&rf_sel_d1; 
assign sel_c2bbs = (slv_ad_d1[8:2] == 7'h22)&rf_sel_d1; 
assign c2dbs_we = (slv_wr_d1&sel_c2dbs); 
assign c2bbs_we = (slv_wr_d1&sel_c2bbs); 
`endif 

`ifdef DMA_HAVE_CH3 
assign sel_c3dbs = (slv_ad_d1[8:2] == 7'h13)&rf_sel_d1; 
assign sel_c3bbs = (slv_ad_d1[8:2] == 7'h23)&rf_sel_d1; 
assign c3dbs_we = (slv_wr_d1&sel_c3dbs); 
assign c3bbs_we = (slv_wr_d1&sel_c3bbs); 
`endif 

`ifdef DMA_HAVE_CH4 
assign sel_c4dbs = (slv_ad_d1[8:2] == 7'h14)&rf_sel_d1; 
assign sel_c4bbs = (slv_ad_d1[8:2] == 7'h24)&rf_sel_d1; 
assign c4dbs_we = (slv_wr_d1&sel_c4dbs); 
assign c4bbs_we = (slv_wr_d1&sel_c4bbs); 
`endif 

`ifdef DMA_HAVE_CH5 
assign sel_c5dbs = (slv_ad_d1[8:2] == 7'h15)&rf_sel_d1; 
assign sel_c5bbs = (slv_ad_d1[8:2] == 7'h25)&rf_sel_d1; 
assign c5dbs_we = (slv_wr_d1&sel_c5dbs); 
assign c5bbs_we = (slv_wr_d1&sel_c5bbs); 
`endif 

`ifdef DMA_HAVE_CH6 
assign sel_c6dbs = (slv_ad_d1[8:2] == 7'h16)&rf_sel_d1; 
assign sel_c6bbs = (slv_ad_d1[8:2] == 7'h26)&rf_sel_d1; 
assign c6dbs_we = (slv_wr_d1&sel_c6dbs); 
assign c6bbs_we = (slv_wr_d1&sel_c6bbs); 
`endif 

`ifdef DMA_HAVE_CH7 
assign sel_c7dbs = (slv_ad_d1[8:2] == 7'h17)&rf_sel_d1; 
assign sel_c7bbs = (slv_ad_d1[8:2] == 7'h27)&rf_sel_d1; 
assign c7dbs_we = (slv_wr_d1&sel_c7dbs); 
assign c7bbs_we = (slv_wr_d1&sel_c7bbs); 
`endif 

`endif 
`endif 

assign sel_c0csr = (slv_ad_d1[8:2] == 7'h40)&rf_sel_d1; 
assign sel_c0cfg = (slv_ad_d1[8:2] == 7'h41)&rf_sel_d1; 
assign sel_c0sad = (slv_ad_d1[8:2] == 7'h42)&rf_sel_d1; 
assign sel_c0dad = (slv_ad_d1[8:2] == 7'h43)&rf_sel_d1; 
`ifdef DMA_HAVE_LINKLIST 
assign sel_c0llp = (slv_ad_d1[8:2] == 7'h44)&rf_sel_d1; 
`endif 
assign sel_c0tsz = (slv_ad_d1[8:2] == 7'h45)&rf_sel_d1; 

assign c0csr_we = (slv_wr_d1&sel_c0csr); 
assign c0cfg_we = (slv_wr_d1&sel_c0cfg); 
assign c0sad_we = (slv_wr_d1&sel_c0sad); 
assign c0dad_we = (slv_wr_d1&sel_c0dad); 
`ifdef DMA_HAVE_LINKLIST 
assign c0llp_we = (slv_wr_d1&sel_c0llp); 
`endif 
assign c0tsz_we = (slv_wr_d1&sel_c0tsz); 

`ifdef DMA_HAVE_CH1 
assign sel_c1csr = (slv_ad_d1[8:2] == 7'h48)&rf_sel_d1; 
assign sel_c1cfg = (slv_ad_d1[8:2] == 7'h49)&rf_sel_d1; 
assign sel_c1sad = (slv_ad_d1[8:2] == 7'h4a)&rf_sel_d1; 
assign sel_c1dad = (slv_ad_d1[8:2] == 7'h4b)&rf_sel_d1; 
`ifdef DMA_HAVE_LINKLIST 
assign sel_c1llp = (slv_ad_d1[8:2] == 7'h4c)&rf_sel_d1; 
`endif 
assign sel_c1tsz = (slv_ad_d1[8:2] == 7'h4d)&rf_sel_d1; 


assign c1csr_we = (slv_wr_d1&sel_c1csr); 
assign c1cfg_we = (slv_wr_d1&sel_c1cfg); 
assign c1sad_we = (slv_wr_d1&sel_c1sad); 
assign c1dad_we = (slv_wr_d1&sel_c1dad); 
`ifdef DMA_HAVE_LINKLIST 
assign c1llp_we = (slv_wr_d1&sel_c1llp); 
`endif 
assign c1tsz_we = (slv_wr_d1&sel_c1tsz); 
`endif 

`ifdef DMA_HAVE_CH2 
assign sel_c2csr = (slv_ad_d1[8:2] == 7'h50)&rf_sel_d1; 
assign sel_c2cfg = (slv_ad_d1[8:2] == 7'h51)&rf_sel_d1; 
assign sel_c2sad = (slv_ad_d1[8:2] == 7'h52)&rf_sel_d1; 
assign sel_c2dad = (slv_ad_d1[8:2] == 7'h53)&rf_sel_d1; 
`ifdef DMA_HAVE_LINKLIST 
assign sel_c2llp = (slv_ad_d1[8:2] == 7'h54)&rf_sel_d1; 
`endif 
assign sel_c2tsz = (slv_ad_d1[8:2] == 7'h55)&rf_sel_d1; 

assign c2csr_we = (slv_wr_d1&sel_c2csr); 
assign c2cfg_we = (slv_wr_d1&sel_c2cfg); 
assign c2sad_we = (slv_wr_d1&sel_c2sad); 
assign c2dad_we = (slv_wr_d1&sel_c2dad); 
`ifdef DMA_HAVE_LINKLIST 
assign c2llp_we = (slv_wr_d1&sel_c2llp); 
`endif 
assign c2tsz_we = (slv_wr_d1&sel_c2tsz); 
`endif 

`ifdef DMA_HAVE_CH3 
assign sel_c3csr = (slv_ad_d1[8:2] == 7'h58)&rf_sel_d1; 
assign sel_c3cfg = (slv_ad_d1[8:2] == 7'h59)&rf_sel_d1; 
assign sel_c3sad = (slv_ad_d1[8:2] == 7'h5a)&rf_sel_d1; 
assign sel_c3dad = (slv_ad_d1[8:2] == 7'h5b)&rf_sel_d1; 
`ifdef DMA_HAVE_LINKLIST 
assign sel_c3llp = (slv_ad_d1[8:2] == 7'h5c)&rf_sel_d1; 
`endif 
assign sel_c3tsz = (slv_ad_d1[8:2] == 7'h5d)&rf_sel_d1; 

assign c3csr_we = (slv_wr_d1&sel_c3csr); 
assign c3cfg_we = (slv_wr_d1&sel_c3cfg); 
assign c3sad_we = (slv_wr_d1&sel_c3sad); 
assign c3dad_we = (slv_wr_d1&sel_c3dad); 
`ifdef DMA_HAVE_LINKLIST 
assign c3llp_we = (slv_wr_d1&sel_c3llp); 
`endif 
assign c3tsz_we = (slv_wr_d1&sel_c3tsz); 
`endif 

`ifdef DMA_HAVE_CH4 
assign sel_c4csr = (slv_ad_d1[8:2] == 7'h60)&rf_sel_d1; 
assign sel_c4cfg = (slv_ad_d1[8:2] == 7'h61)&rf_sel_d1; 
assign sel_c4sad = (slv_ad_d1[8:2] == 7'h62)&rf_sel_d1; 
assign sel_c4dad = (slv_ad_d1[8:2] == 7'h63)&rf_sel_d1; 
`ifdef DMA_HAVE_LINKLIST 
assign sel_c4llp = (slv_ad_d1[8:2] == 7'h64)&rf_sel_d1; 
`endif 
assign sel_c4tsz = (slv_ad_d1[8:2] == 7'h65)&rf_sel_d1; 

assign c4csr_we = (slv_wr_d1&sel_c4csr); 
assign c4cfg_we = (slv_wr_d1&sel_c4cfg); 
assign c4sad_we = (slv_wr_d1&sel_c4sad); 
assign c4dad_we = (slv_wr_d1&sel_c4dad); 
`ifdef DMA_HAVE_LINKLIST 
assign c4llp_we = (slv_wr_d1&sel_c4llp); 
`endif 
assign c4tsz_we = (slv_wr_d1&sel_c4tsz); 
`endif 

`ifdef DMA_HAVE_CH5 
assign sel_c5csr = (slv_ad_d1[8:2] == 7'h68)&rf_sel_d1; 
assign sel_c5cfg = (slv_ad_d1[8:2] == 7'h69)&rf_sel_d1; 
assign sel_c5sad = (slv_ad_d1[8:2] == 7'h6a)&rf_sel_d1; 
assign sel_c5dad = (slv_ad_d1[8:2] == 7'h6b)&rf_sel_d1; 
`ifdef DMA_HAVE_LINKLIST 
assign sel_c5llp = (slv_ad_d1[8:2] == 7'h6c)&rf_sel_d1; 
`endif 
assign sel_c5tsz = (slv_ad_d1[8:2] == 7'h6d)&rf_sel_d1; 

assign c5csr_we = (slv_wr_d1&sel_c5csr); 
assign c5cfg_we = (slv_wr_d1&sel_c5cfg); 
assign c5sad_we = (slv_wr_d1&sel_c5sad); 
assign c5dad_we = (slv_wr_d1&sel_c5dad); 
`ifdef DMA_HAVE_LINKLIST 
assign c5llp_we = (slv_wr_d1&sel_c5llp); 
`endif 
assign c5tsz_we = (slv_wr_d1&sel_c5tsz); 
`endif 

`ifdef DMA_HAVE_CH6 
assign sel_c6csr = (slv_ad_d1[8:2] == 7'h70)&rf_sel_d1; 
assign sel_c6cfg = (slv_ad_d1[8:2] == 7'h71)&rf_sel_d1; 
assign sel_c6sad = (slv_ad_d1[8:2] == 7'h72)&rf_sel_d1; 
assign sel_c6dad = (slv_ad_d1[8:2] == 7'h73)&rf_sel_d1; 
`ifdef DMA_HAVE_LINKLIST 
assign sel_c6llp = (slv_ad_d1[8:2] == 7'h74)&rf_sel_d1; 
`endif 
assign sel_c6tsz = (slv_ad_d1[8:2] == 7'h75)&rf_sel_d1; 

assign c6csr_we = (slv_wr_d1&sel_c6csr); 
assign c6cfg_we = (slv_wr_d1&sel_c6cfg); 
assign c6sad_we = (slv_wr_d1&sel_c6sad); 
assign c6dad_we = (slv_wr_d1&sel_c6dad); 
`ifdef DMA_HAVE_LINKLIST 
assign c6llp_we = (slv_wr_d1&sel_c6llp); 
`endif 
assign c6tsz_we = (slv_wr_d1&sel_c6tsz); 
`endif 

`ifdef DMA_HAVE_CH7 
assign sel_c7csr = (slv_ad_d1[8:2] == 7'h78)&rf_sel_d1; 
assign sel_c7cfg = (slv_ad_d1[8:2] == 7'h79)&rf_sel_d1; 
assign sel_c7sad = (slv_ad_d1[8:2] == 7'h7a)&rf_sel_d1; 
assign sel_c7dad = (slv_ad_d1[8:2] == 7'h7b)&rf_sel_d1; 
`ifdef DMA_HAVE_LINKLIST 
assign sel_c7llp = (slv_ad_d1[8:2] == 7'h7c)&rf_sel_d1; 
`endif 
assign sel_c7tsz = (slv_ad_d1[8:2] == 7'h7d)&rf_sel_d1; 

assign c7csr_we = (slv_wr_d1&sel_c7csr); 
assign c7cfg_we = (slv_wr_d1&sel_c7cfg); 
assign c7sad_we = (slv_wr_d1&sel_c7sad); 
assign c7dad_we = (slv_wr_d1&sel_c7dad); 
`ifdef DMA_HAVE_LINKLIST 
assign c7llp_we = (slv_wr_d1&sel_c7llp); 
`endif 
assign c7tsz_we = (slv_wr_d1&sel_c7tsz); 
`endif 

assign tc_clr = (slv_wr_d1&be_d1[0]&sel_tc_clr) ? slv_wdti[7:0] : 8'b0; 
assign err_clr = (slv_wr_d1&be_d1[0]&sel_err_clr) ? slv_wdti[7:0] : 8'b0; 

assign abt_clr = (slv_wr_d1&be_d1[2]&sel_err_clr) ? slv_wdti[23:16] : 8'b0; 
assign csr_we = (slv_wr_d1&be_d1[0]&sel_csr); 
assign sync_we = (slv_wr_d1&be_d1[0]&sel_sync); 




always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dmaint <= 'h0; 
else 
dmaint <= intin; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dmaint_tc <= 'h0; 
else 
dmaint_tc <= inttcin; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dmaint_err <= 'h0; 
else 
dmaint_err <= interrin; 

assign intin = inttcin | interrin | intabtin; 
assign inttcin = | int_tc; 
assign interrin = | int_err; 

assign intabtin = | int_abt; 

assign int = int_tc | int_err | int_abt; 

assign int_tc[0] = ~c0cfg[`DMA_CHCFG_INTTC]&tc[0]; 
assign int_err[0] = ~c0cfg[`DMA_CHCFG_INTERR]&err[0]; 

assign int_abt[0] = ~c0cfg[`DMA_CHCFG_INTABT]&abt[0]; 

`ifdef DMA_HAVE_CH1 
assign int_tc[1] = ~c1cfg[`DMA_CHCFG_INTTC]&tc[1]; 
assign int_err[1] = ~c1cfg[`DMA_CHCFG_INTERR]&err[1]; 

assign int_abt[1] = ~c1cfg[`DMA_CHCFG_INTABT]&abt[1]; 
`endif 

`ifdef DMA_HAVE_CH2 
assign int_tc[2] = ~c2cfg[`DMA_CHCFG_INTTC]&tc[2]; 
assign int_err[2] = ~c2cfg[`DMA_CHCFG_INTERR]&err[2]; 

assign int_abt[2] = ~c2cfg[`DMA_CHCFG_INTABT]&abt[2]; 
`endif 

`ifdef DMA_HAVE_CH3 
assign int_tc[3] = ~c3cfg[`DMA_CHCFG_INTTC]&tc[3]; 
assign int_err[3] = ~c3cfg[`DMA_CHCFG_INTERR]&err[3]; 

assign int_abt[3] = ~c3cfg[`DMA_CHCFG_INTABT]&abt[3]; 
`endif 

`ifdef DMA_HAVE_CH4 
assign int_tc[4] = ~c4cfg[`DMA_CHCFG_INTTC]&tc[4]; 
assign int_err[4] = ~c4cfg[`DMA_CHCFG_INTERR]&err[4]; 

assign int_abt[4] = ~c4cfg[`DMA_CHCFG_INTABT]&abt[4]; 
`endif 

`ifdef DMA_HAVE_CH5 
assign int_tc[5] = ~c5cfg[`DMA_CHCFG_INTTC]&tc[5]; 
assign int_err[5] = ~c5cfg[`DMA_CHCFG_INTERR]&err[5]; 

assign int_abt[5] = ~c5cfg[`DMA_CHCFG_INTABT]&abt[5]; 
`endif 

`ifdef DMA_HAVE_CH6 
assign int_tc[6] = ~c6cfg[`DMA_CHCFG_INTTC]&tc[6]; 
assign int_err[6] = ~c6cfg[`DMA_CHCFG_INTERR]&err[6]; 

assign int_abt[6] = ~c6cfg[`DMA_CHCFG_INTABT]&abt[6]; 
`endif 

`ifdef DMA_HAVE_CH7 
assign int_tc[7] = ~c7cfg[`DMA_CHCFG_INTTC]&tc[7]; 
assign int_err[7] = ~c7cfg[`DMA_CHCFG_INTERR]&err[7]; 

assign int_abt[7] = ~c7cfg[`DMA_CHCFG_INTABT]&abt[7]; 
`endif 







assign tc_st[0] = (arb_ch_sel == 0)&de_tc_st&~c0csr[`DMA_CHCSR_INTTC]; 

`ifdef DMA_HAVE_CH1 
assign tc_st[1] = (arb_ch_sel == 1)&de_tc_st&~c1csr[`DMA_CHCSR_INTTC]; 
`endif 

`ifdef DMA_HAVE_CH2 
assign tc_st[2] = (arb_ch_sel == 2)&de_tc_st&~c2csr[`DMA_CHCSR_INTTC]; 
`endif 

`ifdef DMA_HAVE_CH3 
assign tc_st[3] = (arb_ch_sel == 3)&de_tc_st&~c3csr[`DMA_CHCSR_INTTC]; 
`endif 

`ifdef DMA_HAVE_CH4 
assign tc_st[4] = (arb_ch_sel == 4)&de_tc_st&~c4csr[`DMA_CHCSR_INTTC]; 
`endif 

`ifdef DMA_HAVE_CH5 
assign tc_st[5] = (arb_ch_sel == 5)&de_tc_st&~c5csr[`DMA_CHCSR_INTTC]; 
`endif 

`ifdef DMA_HAVE_CH6 
assign tc_st[6] = (arb_ch_sel == 6)&de_tc_st&~c6csr[`DMA_CHCSR_INTTC]; 
`endif 

`ifdef DMA_HAVE_CH7 
assign tc_st[7] = (arb_ch_sel == 7)&de_tc_st&~c7csr[`DMA_CHCSR_INTTC]; 
`endif 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
tc[0] <= 1'b0; 
else if(tc_st[0]) 
tc[0] <= 1'b1; 
else if(tc_clr[0]) 
tc[0] <= 1'b0; 

`ifdef DMA_HAVE_CH1 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
tc[1] <= 1'b0; 
else if(tc_st[1]) 
tc[1] <= 1'b1; 
else if(tc_clr[1]) 
tc[1] <= 1'b0; 
`endif 

`ifdef DMA_HAVE_CH2 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
tc[2] <= 1'b0; 
else if(tc_st[2]) 
tc[2] <= 1'b1; 
else if(tc_clr[2]) 
tc[2] <= 1'b0; 
`endif 

`ifdef DMA_HAVE_CH3 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
tc[3] <= 1'b0; 
else if(tc_st[3]) 
tc[3] <= 1'b1; 
else if(tc_clr[3]) 
tc[3] <= 1'b0; 
`endif 

`ifdef DMA_HAVE_CH4 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
tc[4] <= 1'b0; 
else if(tc_st[4]) 
tc[4] <= 1'b1; 
else if(tc_clr[4]) 
tc[4] <= 1'b0; 
`endif 

`ifdef DMA_HAVE_CH5 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
tc[5] <= 1'b0; 
else if(tc_st[5]) 
tc[5] <= 1'b1; 
else if(tc_clr[5]) 
tc[5] <= 1'b0; 
`endif 

`ifdef DMA_HAVE_CH6 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
tc[6] <= 1'b0; 
else if(tc_st[6]) 
tc[6] <= 1'b1; 
else if(tc_clr[6]) 
tc[6] <= 1'b0; 
`endif 

`ifdef DMA_HAVE_CH7 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
tc[7] <= 1'b0; 
else if(tc_st[7]) 
tc[7] <= 1'b1; 
else if(tc_clr[7]) 
tc[7] <= 1'b0; 
`endif 




/* 
always @(arb_ch_sel or err) 
case(arb_ch_sel) 
0: rf_cherr = err[0]; 
`ifdef DMA_HAVE_CH1 
1: rf_cherr = err[1]; 
`endif 

`ifdef DMA_HAVE_CH2 
2: rf_cherr = err[2]; 
`endif 

`ifdef DMA_HAVE_CH3 
3: rf_cherr = err[3]; 
`endif 

`ifdef DMA_HAVE_CH4 
4: rf_cherr = err[4]; 
`endif 

`ifdef DMA_HAVE_CH5 
5: rf_cherr = err[5]; 
`endif 

`ifdef DMA_HAVE_CH6 
6: rf_cherr = err[6]; 
`endif 

`ifdef DMA_HAVE_CH7 
7: rf_cherr = err[7]; 
`endif 
default: 
rf_cherr = 0; 
endcase 
*/ 















assign err_st[0] = (arb_ch_sel == 0)&(de_err_notify&de_st_upd); 
assign abt_st[0] = (arb_ch_sel == 0)&(c0abt&de_st_upd) | 
c0abt&((arb_ch_sel != 0) | de_st_idle); 

`ifdef DMA_HAVE_CH1 










assign err_st[1] = (arb_ch_sel == 1)&(de_err_notify&de_st_upd); 
assign abt_st[1] = (arb_ch_sel == 1)&(c1abt&de_st_upd) | 
c1abt&((arb_ch_sel != 1) | de_st_idle); 

`endif 

`ifdef DMA_HAVE_CH2 










assign err_st[2] = (arb_ch_sel == 2)&(de_err_notify&de_st_upd); 
assign abt_st[2] = (arb_ch_sel == 2)&(c2abt&de_st_upd) | 
c2abt&((arb_ch_sel != 2) | de_st_idle); 

`endif 

`ifdef DMA_HAVE_CH3 










assign err_st[3] = (arb_ch_sel == 3)&(de_err_notify&de_st_upd); 
assign abt_st[3] = (arb_ch_sel == 3)&(c3abt&de_st_upd) | 
c3abt&((arb_ch_sel != 3) | de_st_idle); 

`endif 

`ifdef DMA_HAVE_CH4 











assign err_st[4] = (arb_ch_sel == 4)&(de_err_notify&de_st_upd); 
assign abt_st[4] = (arb_ch_sel == 4)&(c4abt&de_st_upd) | 
c4abt&((arb_ch_sel != 4) | de_st_idle); 

`endif 

`ifdef DMA_HAVE_CH5 










assign err_st[5] = (arb_ch_sel == 5)&(de_err_notify&de_st_upd); 
assign abt_st[5] = (arb_ch_sel == 5)&(c5abt&de_st_upd) | 
c5abt&((arb_ch_sel != 5) | de_st_idle); 
`endif 

`ifdef DMA_HAVE_CH6 










assign err_st[6] = (arb_ch_sel == 6)&(de_err_notify&de_st_upd); 
assign abt_st[6] = (arb_ch_sel == 6)&(c6abt&de_st_upd) | 
c6abt&((arb_ch_sel != 6) | de_st_idle); 
`endif 

`ifdef DMA_HAVE_CH7 










assign err_st[7] = (arb_ch_sel == 7)&(de_err_notify&de_st_upd); 
assign abt_st[7] = (arb_ch_sel == 7)&(c7abt&de_st_upd) | 
c7abt&((arb_ch_sel != 7) | de_st_idle); 
`endif 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
err[0] <= 1'b0; 
else if(err_st[0]) 
err[0] <= 1'b1; 
else if(err_clr[0]) 
err[0] <= 1'b0; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
abt[0] <= 1'b0; 
else if(abt_st[0]) 
abt[0] <= 1'b1; 
else if(abt_clr[0]) 
abt[0] <= 1'b0; 

`ifdef DMA_HAVE_CH1 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
err[1] <= 1'b0; 
else if(err_st[1]) 
err[1] <= 1'b1; 
else if(err_clr[1]) 
err[1] <= 1'b0; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
abt[1] <= 1'b0; 
else if(abt_st[1]) 
abt[1] <= 1'b1; 
else if(abt_clr[1]) 
abt[1] <= 1'b0; 

`endif 

`ifdef DMA_HAVE_CH2 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
err[2] <= 1'b0; 
else if(err_st[2]) 
err[2] <= 1'b1; 
else if(err_clr[2]) 
err[2] <= 1'b0; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
abt[2] <= 1'b0; 
else if(abt_st[2]) 
abt[2] <= 1'b1; 
else if(abt_clr[2]) 
abt[2] <= 1'b0; 

`endif 

`ifdef DMA_HAVE_CH3 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
err[3] <= 1'b0; 
else if(err_st[3]) 
err[3] <= 1'b1; 
else if(err_clr[3]) 
err[3] <= 1'b0; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
abt[3] <= 1'b0; 
else if(abt_st[3]) 
abt[3] <= 1'b1; 
else if(abt_clr[3]) 
abt[3] <= 1'b0; 

`endif 

`ifdef DMA_HAVE_CH4 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
err[4] <= 1'b0; 
else if(err_st[4]) 
err[4] <= 1'b1; 
else if(err_clr[4]) 
err[4] <= 1'b0; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
abt[4] <= 1'b0; 
else if(abt_st[4]) 
abt[4] <= 1'b1; 
else if(abt_clr[4]) 
abt[4] <= 1'b0; 

`endif 

`ifdef DMA_HAVE_CH5 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
err[5] <= 1'b0; 
else if(err_st[5]) 
err[5] <= 1'b1; 
else if(err_clr[5]) 
err[5] <= 1'b0; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
abt[5] <= 1'b0; 
else if(abt_st[5]) 
abt[5] <= 1'b1; 
else if(abt_clr[5]) 
abt[5] <= 1'b0; 

`endif 

`ifdef DMA_HAVE_CH6 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
err[6] <= 1'b0; 
else if(err_st[6]) 
err[6] <= 1'b1; 
else if(err_clr[6]) 
err[6] <= 1'b0; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
abt[6] <= 1'b0; 
else if(abt_st[6]) 
abt[6] <= 1'b1; 
else if(abt_clr[6]) 
abt[6] <= 1'b0; 

`endif 

`ifdef DMA_HAVE_CH7 
always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
err[7] <= 1'b0; 
else if(err_st[7]) 
err[7] <= 1'b1; 
else if(err_clr[7]) 
err[7] <= 1'b0; 


always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
abt[7] <= 1'b0; 
else if(abt_st[7]) 
abt[7] <= 1'b1; 
else if(abt_clr[7]) 
abt[7] <= 1'b0; 

`endif 



assign ch_en = {c7csr[0],c6csr[0],c5csr[0],c4csr[0],c3csr[0], 
c2csr[0],c1csr[0],c0csr[0]}; 



assign ch_busy = {c7cfg[`DMA_CHBUSY],c6cfg[`DMA_CHBUSY], 
c5cfg[`DMA_CHBUSY],c4cfg[`DMA_CHBUSY], 
c3cfg[`DMA_CHBUSY],c2cfg[`DMA_CHBUSY], 
c1cfg[`DMA_CHBUSY],c0cfg[`DMA_CHBUSY]}; 



wire csr_b0we = csr_we & be_d1[0]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
m1end <= 1'b0; 
else if(csr_b0we) 
m1end <= slv_wdti[2]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
m0end <= 1'b0; 
else if(csr_b0we) 
m0end <= slv_wdti[1]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
dmacen <= 1'b0; 
else if(csr_b0we) 
dmacen <= slv_wdti[0]; 

assign csr = { m1end, m0end, dmacen}; 



wire sync_b0we = sync_we & be_d1[0]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
sync <= 'b0; 
else if(sync_b0we) 
sync <= slv_wdti[`DMA_MAX_CHNO-1:0]; 




`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 

wire c0dbs_b2we = c0dbs_we & be_d1[2]; 
wire c0dbs_b3we = c0dbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c0dmabs[23:16] <= 'h0; 
else if(c0dbs_b2we) 
c0dmabs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c0dmabs[31:24] <= 'h0; 
else if(c0dbs_b3we) 
c0dmabs[31:24] <= slv_wdti[31:24]; 

`ifdef DMA_HAVE_CH1 
wire c1dbs_b2we = c1dbs_we & be_d1[2]; 
wire c1dbs_b3we = c1dbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c1dmabs[23:16] <= 'h0; 
else if(c1dbs_b2we) 
c1dmabs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c1dmabs[31:24] <= 'h0; 
else if(c1dbs_b3we) 
c1dmabs[31:24] <= slv_wdti[31:24]; 
`endif 

`ifdef DMA_HAVE_CH2 
wire c2dbs_b2we = c2dbs_we & be_d1[2]; 
wire c2dbs_b3we = c2dbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c2dmabs[23:16] <= 'h0; 
else if(c2dbs_b2we) 
c2dmabs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c2dmabs[31:24] <= 'h0; 
else if(c2dbs_b3we) 
c2dmabs[31:24] <= slv_wdti[31:24]; 
`endif 

`ifdef DMA_HAVE_CH3 
wire c3dbs_b2we = c3dbs_we & be_d1[2]; 
wire c3dbs_b3we = c3dbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c3dmabs[23:16] <= 'h0; 
else if(c3dbs_b2we) 
c3dmabs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c3dmabs[31:24] <= 'h0; 
else if(c3dbs_b3we) 
c3dmabs[31:24] <= slv_wdti[31:24]; 
`endif 

`ifdef DMA_HAVE_CH4 
wire c4dbs_b2we = c4dbs_we & be_d1[2]; 
wire c4dbs_b3we = c4dbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c4dmabs[23:16] <= 'h0; 
else if(c4dbs_b2we) 
c4dmabs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c4dmabs[31:24] <= 'h0; 
else if(c4dbs_b3we) 
c4dmabs[31:24] <= slv_wdti[31:24]; 
`endif 

`ifdef DMA_HAVE_CH5 
wire c5dbs_b2we = c5dbs_we & be_d1[2]; 
wire c5dbs_b3we = c5dbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c5dmabs[23:16] <= 'h0; 
else if(c5dbs_b2we) 
c5dmabs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c5dmabs[31:24] <= 'h0; 
else if(c5dbs_b3we) 
c5dmabs[31:24] <= slv_wdti[31:24]; 
`endif 

`ifdef DMA_HAVE_CH6 
wire c6dbs_b2we = c6dbs_we & be_d1[2]; 
wire c6dbs_b3we = c6dbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c6dmabs[23:16] <= 'h0; 
else if(c6dbs_b2we) 
c6dmabs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c6dmabs[31:24] <= 'h0; 
else if(c6dbs_b3we) 
c6dmabs[31:24] <= slv_wdti[31:24]; 
`endif 

`ifdef DMA_HAVE_CH7 
wire c7dbs_b2we = c7dbs_we & be_d1[2]; 
wire c7dbs_b3we = c7dbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c7dmabs[23:16] <= 'h0; 
else if(c7dbs_b2we) 
c7dmabs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c7dmabs[31:24] <= 'h0; 
else if(c7dbs_b3we) 
c7dmabs[31:24] <= slv_wdti[31:24]; 
`endif 




wire c0bbs_b2we = c0bbs_we & be_d1[2]; 
wire c0bbs_b3we = c0bbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c0brbs[23:16] <= 'h0; 
else if(c0bbs_b2we) 
c0brbs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c0brbs[31:24] <= 'h0; 
else if(c0bbs_b3we) 
c0brbs[31:24] <= slv_wdti[31:24]; 

`ifdef DMA_HAVE_CH1 
wire c1bbs_b2we = c1bbs_we & be_d1[2]; 
wire c1bbs_b3we = c1bbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c1brbs[23:16] <= 'h0; 
else if(c1bbs_b2we) 
c1brbs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c1brbs[31:24] <= 'h0; 
else if(c1bbs_b3we) 
c1brbs[31:24] <= slv_wdti[31:24]; 
`endif 

`ifdef DMA_HAVE_CH2 
wire c2bbs_b2we = c2bbs_we & be_d1[2]; 
wire c2bbs_b3we = c2bbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c2brbs[23:16] <= 'h0; 
else if(c2bbs_b2we) 
c2brbs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c2brbs[31:24] <= 'h0; 
else if(c2bbs_b3we) 
c2brbs[31:24] <= slv_wdti[31:24]; 
`endif 

`ifdef DMA_HAVE_CH3 
wire c3bbs_b2we = c3bbs_we & be_d1[2]; 
wire c3bbs_b3we = c3bbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c3brbs[23:16] <= 'h0; 
else if(c3bbs_b2we) 
c3brbs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c3brbs[31:24] <= 'h0; 
else if(c3bbs_b3we) 
c3brbs[31:24] <= slv_wdti[31:24]; 
`endif 

`ifdef DMA_HAVE_CH4 
wire c4bbs_b2we = c4bbs_we & be_d1[2]; 
wire c4bbs_b3we = c4bbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c4brbs[23:16] <= 'h0; 
else if(c4bbs_b2we) 
c4brbs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c4brbs[31:24] <= 'h0; 
else if(c4bbs_b3we) 
c4brbs[31:24] <= slv_wdti[31:24]; 
`endif 

`ifdef DMA_HAVE_CH5 
wire c5bbs_b2we = c5bbs_we & be_d1[2]; 
wire c5bbs_b3we = c5bbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c5brbs[23:16] <= 'h0; 
else if(c5bbs_b2we) 
c5brbs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c5brbs[31:24] <= 'h0; 
else if(c5bbs_b3we) 
c5brbs[31:24] <= slv_wdti[31:24]; 
`endif 

`ifdef DMA_HAVE_CH6 
wire c6bbs_b2we = c6bbs_we & be_d1[2]; 
wire c6bbs_b3we = c6bbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c6brbs[23:16] <= 'h0; 
else if(c6bbs_b2we) 
c6brbs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c6brbs[31:24] <= 'h0; 
else if(c6bbs_b3we) 
c6brbs[31:24] <= slv_wdti[31:24]; 
`endif 

`ifdef DMA_HAVE_CH7 
wire c7bbs_b2we = c7bbs_we & be_d1[2]; 
wire c7bbs_b3we = c7bbs_we & be_d1[3]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c7brbs[23:16] <= 'h0; 
else if(c7bbs_b2we) 
c7brbs[23:16] <= slv_wdti[23:16]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
c7brbs[31:24] <= 'h0; 
else if(c7bbs_b3we) 
c7brbs[31:24] <= slv_wdti[31:24]; 
`endif 

`endif 
`endif 







dma_chrf #(0) c0_rf( 

.HCLK(HCLK), 
.HRSTn(HRSTn), 


.be_d1(be_d1), 

.chcsr_we(c0csr_we), 
.chcfg_we(c0cfg_we), 
.chsad_we(c0sad_we), 
.chdad_we(c0dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.chllp_we(c0llp_we), 
`endif 
.chtsz_we(c0tsz_we), 

.slv_wdti(slv_wdti), 
.de_sad_we(de_sad_we), 
.de_dad_we(de_dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp_we(de_llp_we), 
`endif 
.de_tsz_we(de_tsz_we), 
.de_en_clr(de_en_clr), 
.de_csr_we(de_csr_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen_we(de_llpen_we), 
`endif 

.de_sad(de_sad), 
.de_dad(de_dad), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp(de_llp), 
`endif 
.de_tsz(de_tsz), 
.de_csr(de_csr), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen(de_llpen), 



.de_err_notify(de_err_notify), 

.tsz_eq0(tsz_eq0), 

`endif 
.de_busy(de_busy), 
.de_st_idle(de_st_idle), 
.de_st_upd(de_st_upd), 

.de_st_llp0(de_st_llp0), 

.arb_ch_sel(arb_ch_sel), 


.chcsr(c0csr), 
.chcfg(c0cfg), 
.chsad(c0sad), 
.chdad(c0dad), 
`ifdef DMA_HAVE_LINKLIST 
.chllp(c0llp), 
`endif 
.chtsz(c0tsz), 
`ifdef DMA_HAVE_LINKLIST 
.chllpen(c0llpen), 
`endif 
.chabt(c0abt) 

); 

`ifdef DMA_HAVE_CH1 


dma_chrf #(1) c1_rf( 

.HCLK(HCLK), 
.HRSTn(HRSTn), 


.be_d1(be_d1), 

.chcsr_we(c1csr_we), 
.chcfg_we(c1cfg_we), 
.chsad_we(c1sad_we), 
.chdad_we(c1dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.chllp_we(c1llp_we), 
`endif 
.chtsz_we(c1tsz_we), 

.slv_wdti(slv_wdti), 
.de_sad_we(de_sad_we), 
.de_dad_we(de_dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp_we(de_llp_we), 
`endif 
.de_tsz_we(de_tsz_we), 
.de_en_clr(de_en_clr), 
.de_csr_we(de_csr_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen_we(de_llpen_we), 
`endif 

.de_sad(de_sad), 
.de_dad(de_dad), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp(de_llp), 
`endif 
.de_tsz(de_tsz), 
.de_csr(de_csr), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen(de_llpen), 



.de_err_notify(de_err_notify), 

.tsz_eq0(tsz_eq0), 
`endif 
.de_busy(de_busy), 
.de_st_idle(de_st_idle), 
.de_st_upd(de_st_upd), 

.de_st_llp0(de_st_llp0), 

.arb_ch_sel(arb_ch_sel), 


.chcsr(c1csr), 
.chcfg(c1cfg), 
.chsad(c1sad), 
.chdad(c1dad), 
`ifdef DMA_HAVE_LINKLIST 
.chllp(c1llp), 
`endif 
.chtsz(c1tsz), 
`ifdef DMA_HAVE_LINKLIST 
.chllpen(c1llpen), 
`endif 
.chabt(c1abt) 
); 

`else 

assign c1csr[0] = 0; 
assign c1cfg[`DMA_CHBUSY] = 0; 

`endif 

`ifdef DMA_HAVE_CH2 



dma_chrf #(2) c2_rf( 

.HCLK(HCLK), 
.HRSTn(HRSTn), 


.be_d1(be_d1), 

.chcsr_we(c2csr_we), 
.chcfg_we(c2cfg_we), 
.chsad_we(c2sad_we), 
.chdad_we(c2dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.chllp_we(c2llp_we), 
`endif 
.chtsz_we(c2tsz_we), 

.slv_wdti(slv_wdti), 
.de_sad_we(de_sad_we), 
.de_dad_we(de_dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp_we(de_llp_we), 
`endif 
.de_tsz_we(de_tsz_we), 
.de_en_clr(de_en_clr), 
.de_csr_we(de_csr_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen_we(de_llpen_we), 
`endif 

.de_sad(de_sad), 
.de_dad(de_dad), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp(de_llp), 
`endif 
.de_tsz(de_tsz), 
.de_csr(de_csr), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen(de_llpen), 



.de_err_notify(de_err_notify), 

.tsz_eq0(tsz_eq0), 
`endif 
.de_busy(de_busy), 
.de_st_idle(de_st_idle), 
.de_st_upd(de_st_upd), 

.de_st_llp0(de_st_llp0), 

.arb_ch_sel(arb_ch_sel), 


.chcsr(c2csr), 
.chcfg(c2cfg), 
.chsad(c2sad), 
.chdad(c2dad), 
`ifdef DMA_HAVE_LINKLIST 
.chllp(c2llp), 
`endif 
.chtsz(c2tsz), 
`ifdef DMA_HAVE_LINKLIST 
.chllpen(c2llpen), 
`endif 
.chabt(c2abt) 
); 

`else 

assign c2csr[0] = 0; 
assign c2cfg[`DMA_CHBUSY] = 0; 

`endif 



`ifdef DMA_HAVE_CH3 

dma_chrf #(3) c3_rf( 

.HCLK(HCLK), 
.HRSTn(HRSTn), 


.be_d1(be_d1), 

.chcsr_we(c3csr_we), 
.chcfg_we(c3cfg_we), 
.chsad_we(c3sad_we), 
.chdad_we(c3dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.chllp_we(c3llp_we), 
`endif 
.chtsz_we(c3tsz_we), 

.slv_wdti(slv_wdti), 
.de_sad_we(de_sad_we), 
.de_dad_we(de_dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp_we(de_llp_we), 
`endif 
.de_tsz_we(de_tsz_we), 
.de_en_clr(de_en_clr), 
.de_csr_we(de_csr_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen_we(de_llpen_we), 
`endif 

.de_sad(de_sad), 
.de_dad(de_dad), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp(de_llp), 
`endif 
.de_tsz(de_tsz), 
.de_csr(de_csr), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen(de_llpen), 



.de_err_notify(de_err_notify), 

.tsz_eq0(tsz_eq0), 
`endif 

.de_busy(de_busy), 
.de_st_idle(de_st_idle), 
.de_st_upd(de_st_upd), 

.de_st_llp0(de_st_llp0), 

.arb_ch_sel(arb_ch_sel), 


.chcsr(c3csr), 
.chcfg(c3cfg), 
.chsad(c3sad), 
.chdad(c3dad), 
`ifdef DMA_HAVE_LINKLIST 
.chllp(c3llp), 
`endif 
.chtsz(c3tsz), 

`ifdef DMA_HAVE_LINKLIST 
.chllpen(c3llpen), 
`endif 

.chabt(c3abt) 
); 

`else 

assign c3csr[0] = 0; 
assign c3cfg[`DMA_CHBUSY] = 0; 

`endif 



`ifdef DMA_HAVE_CH4 

dma_chrf #(4) c4_rf( 

.HCLK(HCLK), 
.HRSTn(HRSTn), 


.be_d1(be_d1), 

.chcsr_we(c4csr_we), 
.chcfg_we(c4cfg_we), 
.chsad_we(c4sad_we), 
.chdad_we(c4dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.chllp_we(c4llp_we), 
`endif 
.chtsz_we(c4tsz_we), 

.slv_wdti(slv_wdti), 
.de_sad_we(de_sad_we), 
.de_dad_we(de_dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp_we(de_llp_we), 
`endif 
.de_tsz_we(de_tsz_we), 
.de_en_clr(de_en_clr), 
.de_csr_we(de_csr_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen_we(de_llpen_we), 
`endif 

.de_sad(de_sad), 
.de_dad(de_dad), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp(de_llp), 
`endif 
.de_tsz(de_tsz), 
.de_csr(de_csr), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen(de_llpen), 



.de_err_notify(de_err_notify), 

.tsz_eq0(tsz_eq0), 
`endif 
.de_busy(de_busy), 
.de_st_idle(de_st_idle), 
.de_st_upd(de_st_upd), 

.de_st_llp0(de_st_llp0), 

.arb_ch_sel(arb_ch_sel), 


.chcsr(c4csr), 
.chcfg(c4cfg), 
.chsad(c4sad), 
.chdad(c4dad), 
`ifdef DMA_HAVE_LINKLIST 
.chllp(c4llp), 
`endif 
.chtsz(c4tsz), 
`ifdef DMA_HAVE_LINKLIST 
.chllpen(c4llpen), 
`endif 
.chabt(c4abt) 
); 

`else 

assign c4csr[0] = 0; 
assign c4cfg[`DMA_CHBUSY] = 0; 

`endif 

`ifdef DMA_HAVE_CH5 


dma_chrf #(5) c5_rf( 

.HCLK(HCLK), 
.HRSTn(HRSTn), 


.be_d1(be_d1), 

.chcsr_we(c5csr_we), 
.chcfg_we(c5cfg_we), 
.chsad_we(c5sad_we), 
.chdad_we(c5dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.chllp_we(c5llp_we), 
`endif 
.chtsz_we(c5tsz_we), 

.slv_wdti(slv_wdti), 
.de_sad_we(de_sad_we), 
.de_dad_we(de_dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp_we(de_llp_we), 
`endif 
.de_tsz_we(de_tsz_we), 
.de_en_clr(de_en_clr), 
.de_csr_we(de_csr_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen_we(de_llpen_we), 
`endif 

.de_sad(de_sad), 
.de_dad(de_dad), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp(de_llp), 
`endif 
.de_tsz(de_tsz), 
.de_csr(de_csr), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen(de_llpen), 



.de_err_notify(de_err_notify), 

.tsz_eq0(tsz_eq0), 
`endif 
.de_busy(de_busy), 
.de_st_idle(de_st_idle), 
.de_st_upd(de_st_upd), 

.de_st_llp0(de_st_llp0), 

.arb_ch_sel(arb_ch_sel), 


.chcsr(c5csr), 
.chcfg(c5cfg), 
.chsad(c5sad), 
.chdad(c5dad), 
`ifdef DMA_HAVE_LINKLIST 
.chllp(c5llp), 
`endif 
.chtsz(c5tsz), 
`ifdef DMA_HAVE_LINKLIST 
.chllpen(c5llpen), 
`endif 
.chabt(c5abt) 
); 

`else 

assign c5csr[0] = 0; 
assign c5cfg[`DMA_CHBUSY] = 0; 

`endif 

`ifdef DMA_HAVE_CH6 


dma_chrf #(6) c6_rf( 

.HCLK(HCLK), 
.HRSTn(HRSTn), 


.be_d1(be_d1), 

.chcsr_we(c6csr_we), 
.chcfg_we(c6cfg_we), 
.chsad_we(c6sad_we), 
.chdad_we(c6dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.chllp_we(c6llp_we), 
`endif 
.chtsz_we(c6tsz_we), 

.slv_wdti(slv_wdti), 
.de_sad_we(de_sad_we), 
.de_dad_we(de_dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp_we(de_llp_we), 
`endif 
.de_tsz_we(de_tsz_we), 
.de_en_clr(de_en_clr), 
.de_csr_we(de_csr_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen_we(de_llpen_we), 
`endif 

.de_sad(de_sad), 
.de_dad(de_dad), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp(de_llp), 
`endif 
.de_tsz(de_tsz), 
.de_csr(de_csr), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen(de_llpen), 



.de_err_notify(de_err_notify), 

.tsz_eq0(tsz_eq0), 
`endif 
.de_busy(de_busy), 
.de_st_idle(de_st_idle), 
.de_st_upd(de_st_upd), 

.de_st_llp0(de_st_llp0), 

.arb_ch_sel(arb_ch_sel), 


.chcsr(c6csr), 
.chcfg(c6cfg), 
.chsad(c6sad), 
.chdad(c6dad), 
`ifdef DMA_HAVE_LINKLIST 
.chllp(c6llp), 
`endif 
.chtsz(c6tsz), 

`ifdef DMA_HAVE_LINKLIST 
.chllpen(c6llpen), 
`endif 

.chabt(c6abt) 
); 

`else 

assign c6csr[0] = 0; 
assign c6cfg[`DMA_CHBUSY] = 0; 

`endif 

`ifdef DMA_HAVE_CH7 


dma_chrf #(7) c7_rf( 

.HCLK(HCLK), 
.HRSTn(HRSTn), 


.be_d1(be_d1), 

.chcsr_we(c7csr_we), 
.chcfg_we(c7cfg_we), 
.chsad_we(c7sad_we), 
.chdad_we(c7dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.chllp_we(c7llp_we), 
`endif 
.chtsz_we(c7tsz_we), 

.slv_wdti(slv_wdti), 
.de_sad_we(de_sad_we), 
.de_dad_we(de_dad_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp_we(de_llp_we), 
`endif 
.de_tsz_we(de_tsz_we), 
.de_en_clr(de_en_clr), 
.de_csr_we(de_csr_we), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen_we(de_llpen_we), 
`endif 

.de_sad(de_sad), 
.de_dad(de_dad), 
`ifdef DMA_HAVE_LINKLIST 
.de_llp(de_llp), 
`endif 
.de_tsz(de_tsz), 
.de_csr(de_csr), 
`ifdef DMA_HAVE_LINKLIST 
.de_llpen(de_llpen), 



.de_err_notify(de_err_notify), 

.tsz_eq0(tsz_eq0), 
`endif 
.de_busy(de_busy), 
.de_st_idle(de_st_idle), 
.de_st_upd(de_st_upd), 

.de_st_llp0(de_st_llp0), 

.arb_ch_sel(arb_ch_sel), 


.chcsr(c7csr), 
.chcfg(c7cfg), 
.chsad(c7sad), 
.chdad(c7dad), 
`ifdef DMA_HAVE_LINKLIST 
.chllp(c7llp), 
`endif 
.chtsz(c7tsz), 
`ifdef DMA_HAVE_LINKLIST 
.chllpen(c7llpen), 
`endif 
.chabt(c7abt) 
); 

`else 

assign c7csr[0] = 0; 
assign c7cfg[`DMA_CHBUSY] = 0; 

`endif 


endmodule 
