






































`include "DMA_DEFINE.vh" 

module dma_ahbslv 
( 

HCLK, 
HRSTn, 
hreadyin, 


hsel_reg, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
hsel_br, 
`endif 
`endif 

htrans, 
hsize, 
hprot, 
hwrite, 
haddr, 
hwdata, 


hresp_reg, 
hreadyout_reg, 
hrdata_reg, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
hresp_br, 
hreadyout_br, 
hrdata_br, 
`endif 
`endif 


rf_dti, 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
de_arb_br, 
`endif 
`endif 


m0endian, 
m1endian, 

m1_dt_st, 



`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
h1trans, 
h1rdata, 
h1readyin, 
h1resp, 
`endif 
`endif 

slv_ado, 
slv_ad_d1o, 
slv_dto, 
slv_szo, 
slv_sz_d1o, 
slv_pt_d1o, 
slv_wr_d1o, 
slv_rf_req 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
, 
slv_br_req, 


slv_br_dto, 
slv_brst_cmd, 
slv_brst_mscd 



`endif 
`endif 

); 


input HCLK; 
input HRSTn; 
input hreadyin; 


input hsel_reg; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
input hsel_br; 
`endif 
`endif 

input [`DMA_HTRANS_WIDTH-1:0] htrans; 
input [`DMA_HSIZE_WIDTH-1:0] hsize; 
input [`DMA_HPROT_WIDTH-1:0] hprot; 
input hwrite; 
input [`DMA_HADDR_WIDTH-1:0] haddr; 
input [`DMA_HDATA_WIDTH-1:0] hwdata; 


output [`DMA_HRESP_WIDTH-1:0] hresp_reg; 
output hreadyout_reg; 
output [`DMA_HDATA_WIDTH-1:0] hrdata_reg; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
output [`DMA_HRESP_WIDTH-1:0] hresp_br; 
output hreadyout_br; 
output [`DMA_HDATA_WIDTH-1:0] hrdata_br; 
`endif 
`endif 


input [`DMA_HDATA_WIDTH-1:0] rf_dti; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
input de_arb_br; 
`endif 
`endif 


input m0endian; 
input m1endian; 


input m1_dt_st; 
`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 

input [`DMA_HTRANS_WIDTH-1:0] h1trans; 
input [`DMA_HDATA_WIDTH-1:0] h1rdata; 
input h1readyin; 
input [`DMA_HRESP_WIDTH-1:0] h1resp; 
`endif 
`endif 

output [`DMA_HADDR_WIDTH-1:0] slv_ado; 
output [`DMA_HADDR_WIDTH-1:0] slv_ad_d1o; 
output [`DMA_HDATA_WIDTH-1:0] slv_dto; 
output [`DMA_HSIZE_WIDTH-1:0] slv_szo; 
output [`DMA_HSIZE_WIDTH-1:0] slv_sz_d1o; 
output [`DMA_HPROT_WIDTH-1:0] slv_pt_d1o; 
output slv_wr_d1o; 
output slv_rf_req; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
output slv_br_req; 
output [`DMA_HDATA_WIDTH-1:0] slv_br_dto; 


output slv_brst_cmd; 
output slv_brst_mscd; 

`endif 
`endif 

wire slv_rf_req; 
wire ad_d1_we; 
wire reg_rdy_wait; 
reg [`DMA_HADDR_WIDTH-1:0] slv_ad_d1o; 
reg [`DMA_HSIZE_WIDTH-1:0] slv_sz_d1o; 
reg [`DMA_HPROT_WIDTH-1:0] slv_pt_d1o; 
reg slv_wr_d1o; 
reg hreadyout_reg; 
reg [`DMA_HDATA_WIDTH-1:0] hrdata_reg; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 
wire brst_cmd,brst_ms_cmd; 
wire br_rdy0_p; 
reg slv_br_req; 
reg hreadyout_br; 
reg [`DMA_HRESP_WIDTH-1:0] hresp_br; 
reg [`DMA_HDATA_WIDTH-1:0] hrdata_br; 
`endif 
`endif 


wire hrdy_to_1,hrp_br_err,hrp_br_rty; 
wire m1_br_end; 

wire htr_ns = (htrans == `DMA_HTRANS_NONSEQ); 
wire htr_sq = (htrans == `DMA_HTRANS_SEQ); 


assign slv_rf_req = (hsel_reg & hreadyin & htrans[1]); 
assign slv_ado = haddr; 



`ifdef DMA_HAVE_AHB1 

`ifdef DMA_HAVE_BRIDGE 
assign ad_d1_we = (hsel_br|hsel_reg) & htrans[1] & hreadyin; 
`else 
assign ad_d1_we = hsel_reg & htrans[1] & hreadyin; 
`endif 

`else 
assign ad_d1_we = hsel_reg & htrans[1] & hreadyin; 
`endif 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
begin 
slv_ad_d1o <= 'h0; 
slv_sz_d1o <= 'h0; 
slv_pt_d1o <= 'h0; 
end 
else if(ad_d1_we) 
begin 
slv_ad_d1o <= haddr; 
slv_sz_d1o <= hsize; 
slv_pt_d1o <= hprot; 
end 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
slv_wr_d1o <= 0; 
else if(ad_d1_we) 
slv_wr_d1o <= hwrite; 




wire hsize_l_hw = (slv_sz_d1o==3'h1); 
wire hsize_l_bt = (slv_sz_d1o==3'h0); 
wire tr_l_hw = m0endian&hsize_l_hw; 
wire tr_l_bt = m0endian&hsize_l_bt; 

wire [7:0] s_rgdtb0 = (tr_l_hw)? hwdata[23:16] : 
(tr_l_bt)? hwdata[31:24] : hwdata[7:0]; 
wire [7:0] s_rgdtb1 = (tr_l_hw)? hwdata[31:24] : 
(tr_l_bt)? hwdata[23:16] : hwdata[15:8]; 
wire [7:0] s_rgdtb2 = (tr_l_hw)? hwdata[7:0] : 
(tr_l_bt)? hwdata[15:8] : hwdata[23:16]; 
wire [7:0] s_rgdtb3 = (tr_l_hw)? hwdata[15:8] : 
(tr_l_bt)? hwdata[7:0] : hwdata[31:24]; 






assign slv_dto = {s_rgdtb3,s_rgdtb2,s_rgdtb1,s_rgdtb0}; 

assign slv_szo = hsize; 






assign reg_rdy_wait = slv_rf_req & hwrite & ( haddr[8:2] == slv_ad_d1o[8:2] ); 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
hreadyout_reg <= 1'b1; 
else if(reg_rdy_wait) 
hreadyout_reg <= 1'b0; 
else 
hreadyout_reg <= 1'b1; 


assign hresp_reg = `DMA_HRESP_OK; 



wire hrdt_we = hsel_reg&htrans[1]; 

wire hsize_hw = (hsize==3'h1); 
wire hsize_bt = (hsize==3'h0); 
wire tr_hw = m0endian&hsize_hw; 
wire tr_bt = m0endian&hsize_bt; 





wire [7:0] hrdtgb0 = (tr_hw)? rf_dti[23:16] : 
(tr_bt)? rf_dti[31:24] : rf_dti[7:0]; 
wire [7:0] hrdtgb1 = (tr_hw)? rf_dti[31:24] : 
(tr_bt)? rf_dti[23:16] : rf_dti[15:8]; 
wire [7:0] hrdtgb2 = (tr_hw)? rf_dti[7:0] : 
(tr_bt)? rf_dti[15:8] : rf_dti[23:16]; 
wire [7:0] hrdtgb3 = (tr_hw)? rf_dti[15:8] : 
(tr_bt)? rf_dti[7:0] : rf_dti[31:24]; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
hrdata_reg <= 'h0; 
else if(hrdt_we) 
hrdata_reg <= {hrdtgb3,hrdtgb2,hrdtgb1,hrdtgb0}; 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 






wire h1rp_err = (h1resp==`DMA_HRESP_ERROR); 
wire br_req_bgn = hsel_br & htr_ns & hreadyin; 
wire br_req_end = brst_ms_cmd | m1_br_end; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
slv_br_req <= 1'b0; 
else if(br_req_bgn) 
slv_br_req <= 1'b1; 
else if(br_req_end) 
slv_br_req <= 1'b0; 










wire m1_tr_ns = (h1trans == `DMA_HTRANS_NONSEQ); 
wire m1_br_cmd = de_arb_br&m1_tr_ns&h1readyin&slv_br_req; 


assign m1_br_end = (m1_dt_st&h1readyin)|h1rp_err; 

parameter BR_IDLE = 3'b001, 
BR_CMD = 3'b010, 
BR_MS_CMD = 3'b100; 

reg [2:0] br_st, br_ns; 

assign brst_cmd = br_st[1]; 
assign brst_ms_cmd = br_st[2]; 

always @(br_st or br_req_bgn or m1_br_cmd or m1_br_end) 
case(br_st) 
BR_IDLE: if(br_req_bgn) br_ns = BR_CMD; 
else br_ns = BR_IDLE; 
BR_CMD: if(m1_br_cmd) br_ns = BR_MS_CMD; 
else br_ns = BR_CMD; 
BR_MS_CMD:if(m1_br_end) br_ns = BR_IDLE; 
else br_ns = BR_MS_CMD; 
default: br_ns = BR_IDLE; 
endcase 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
br_st <= BR_IDLE; 
else 
br_st <= br_ns; 




wire bst_rty = hsel_br&htr_sq&hreadyout_br; 


assign br_rdy0_p = br_req_bgn | brst_cmd | bst_rty; 

assign hrp_br_err = (hresp_br == `DMA_HRESP_ERROR); 

assign hrp_br_rty = (hresp_br == `DMA_HRESP_RETRY); 

assign hrdy_to_1 = (((hrp_br_err|hrp_br_rty)&!hreadyout_br)| 
(brst_ms_cmd&(m1_dt_st&h1readyin))); 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
hreadyout_br <= 1'b1; 
else if(br_rdy0_p) 
hreadyout_br <= 1'b0; 
else if(brst_ms_cmd) 
hreadyout_br <= h1readyin; 

else if(hrdy_to_1) 
hreadyout_br <= 1'b1; 
else 
hreadyout_br <= hreadyout_br; 



always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
hresp_br <= `DMA_HRESP_OK; 
else if(bst_rty) 
hresp_br <= `DMA_HRESP_RETRY; 

else if(brst_ms_cmd) 
hresp_br <= h1resp; 
else if(hreadyout_br) 
hresp_br <= `DMA_HRESP_OK; 



wire cv_endn = m0endian^m1endian; 






wire cv_endn_l_hw = cv_endn&hsize_l_hw; 
wire cv_endn_l_bt = cv_endn&hsize_l_bt; 
wire [7:0] s_brdtb0 = (cv_endn_l_hw)? hwdata[23:16] : 
(cv_endn_l_bt)? hwdata[31:24] : hwdata[7:0]; 
wire [7:0] s_brdtb1 = (cv_endn_l_hw)? hwdata[31:24] : 
(cv_endn_l_bt)? hwdata[23:16] : hwdata[15:8]; 
wire [7:0] s_brdtb2 = (cv_endn_l_hw)? hwdata[7:0] : 
(cv_endn_l_bt)? hwdata[15:8] : hwdata[23:16]; 
wire [7:0] s_brdtb3 = (cv_endn_l_hw)? hwdata[15:8] : 
(cv_endn_l_bt)? hwdata[7:0] : hwdata[31:24]; 

assign slv_br_dto = {s_brdtb3,s_brdtb2,s_brdtb1,s_brdtb0}; 



wire [7:0] h1rdtib0 = (cv_endn_l_hw)? h1rdata[23:16] : 
(cv_endn_l_bt)? h1rdata[31:24] : h1rdata[7:0]; 
wire [7:0] h1rdtib1 = (cv_endn_l_hw)? h1rdata[31:24] : 
(cv_endn_l_bt)? h1rdata[23:16] : h1rdata[15:8]; 
wire [7:0] h1rdtib2 = (cv_endn_l_hw)? h1rdata[7:0] : 
(cv_endn_l_bt)? h1rdata[15:8] : h1rdata[23:16]; 
wire [7:0] h1rdtib3 = (cv_endn_l_hw)? h1rdata[15:8] : 
(cv_endn_l_bt)? h1rdata[7:0] : h1rdata[31:24]; 






always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
hrdata_br <= 'h0; 
else if(brst_ms_cmd) 
hrdata_br <= {h1rdtib3,h1rdtib2,h1rdtib1,h1rdtib0}; 



assign slv_brst_mscd = brst_ms_cmd; 
assign slv_brst_cmd = brst_cmd; 


`endif 
`endif 

endmodule 
