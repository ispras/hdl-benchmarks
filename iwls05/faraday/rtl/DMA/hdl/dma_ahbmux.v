





































`include "DMA_DEFINE.vh" 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 

module dma_ahbmux 
( 
HCLK, 
HRSTn, 

htrans, 

hsel_dma, 
hsel_br, 



hrdt0_dma, 
hrp0_dma, 
hrdy0_dma, 

`ifdef DMA_HAVE_CH1 
hrdt1_dma, 
hrp1_dma, 
hrdy1_dma, 
`endif 
`ifdef DMA_HAVE_CH2 
hrdt2_dma, 
hrp2_dma, 
hrdy2_dma, 
`endif 
`ifdef DMA_HAVE_CH3 
hrdt3_dma, 
hrp3_dma, 
hrdy3_dma, 
`endif 
`ifdef DMA_HAVE_CH4 
hrdt4_dma, 
hrp4_dma, 
hrdy4_dma, 
`endif 
`ifdef DMA_HAVE_CH5 
hrdt5_dma, 
hrp5_dma, 
hrdy5_dma, 
`endif 
`ifdef DMA_HAVE_CH6 
hrdt6_dma, 
hrp6_dma, 
hrdy6_dma, 
`endif 
`ifdef DMA_HAVE_CH7 
hrdt7_dma, 
hrp7_dma, 
hrdy7_dma, 
`endif 

hrdt0_br, 
hrp0_br, 
hrdy0_br, 
`ifdef DMA_HAVE_CH1 
hrdt1_br, 
hrp1_br, 
hrdy1_br, 
`endif 
`ifdef DMA_HAVE_CH2 
hrdt2_br, 
hrp2_br, 
hrdy2_br, 
`endif 
`ifdef DMA_HAVE_CH3 
hrdt3_br, 
hrp3_br, 
hrdy3_br, 
`endif 
`ifdef DMA_HAVE_CH4 
hrdt4_br, 
hrp4_br, 
hrdy4_br, 
`endif 
`ifdef DMA_HAVE_CH5 
hrdt5_br, 
hrp5_br, 
hrdy5_br, 
`endif 
`ifdef DMA_HAVE_CH6 
hrdt6_br, 
hrp6_br, 
hrdy6_br, 
`endif 
`ifdef DMA_HAVE_CH7 
hrdt7_br, 
hrp7_br, 
hrdy7_br, 
`endif 
hrdata, 
hresp, 
hreadyin 
); 

input HCLK; 
input HRSTn; 

input [`DMA_HTRANS_WIDTH-1:0] htrans; 

input [`DMA_MAX_CHNO-1:0] hsel_dma; 
input [`DMA_MAX_CHNO-1:0] hsel_br; 


input [`DMA_HDATA_WIDTH-1:0] hrdt0_dma; 
input [`DMA_HRESP_WIDTH-1:0] hrp0_dma; 
input hrdy0_dma; 

`ifdef DMA_HAVE_CH1 
input [`DMA_HDATA_WIDTH-1:0] hrdt1_dma; 
input [`DMA_HRESP_WIDTH-1:0] hrp1_dma; 
input hrdy1_dma; 
`endif 

`ifdef DMA_HAVE_CH2 
input [`DMA_HDATA_WIDTH-1:0] hrdt2_dma; 
input [`DMA_HRESP_WIDTH-1:0] hrp2_dma; 
input hrdy2_dma; 
`endif 

`ifdef DMA_HAVE_CH3 
input [`DMA_HDATA_WIDTH-1:0] hrdt3_dma; 
input [`DMA_HRESP_WIDTH-1:0] hrp3_dma; 
input hrdy3_dma; 
`endif 

`ifdef DMA_HAVE_CH4 
input [`DMA_HDATA_WIDTH-1:0] hrdt4_dma; 
input [`DMA_HRESP_WIDTH-1:0] hrp4_dma; 
input hrdy4_dma; 
`endif 

`ifdef DMA_HAVE_CH5 
input [`DMA_HDATA_WIDTH-1:0] hrdt5_dma; 
input [`DMA_HRESP_WIDTH-1:0] hrp5_dma; 
input hrdy5_dma; 
`endif 

`ifdef DMA_HAVE_CH6 
input [`DMA_HDATA_WIDTH-1:0] hrdt6_dma; 
input [`DMA_HRESP_WIDTH-1:0] hrp6_dma; 
input hrdy6_dma; 
`endif 

`ifdef DMA_HAVE_CH7 
input [`DMA_HDATA_WIDTH-1:0] hrdt7_dma; 
input [`DMA_HRESP_WIDTH-1:0] hrp7_dma; 
input hrdy7_dma; 
`endif 

input [`DMA_HDATA_WIDTH-1:0] hrdt0_br; 
input [`DMA_HRESP_WIDTH-1:0] hrp0_br; 
input hrdy0_br; 

`ifdef DMA_HAVE_CH1 
input [`DMA_HDATA_WIDTH-1:0] hrdt1_br; 
input [`DMA_HRESP_WIDTH-1:0] hrp1_br; 
input hrdy1_br; 
`endif 

`ifdef DMA_HAVE_CH2 
input [`DMA_HDATA_WIDTH-1:0] hrdt2_br; 
input [`DMA_HRESP_WIDTH-1:0] hrp2_br; 
input hrdy2_br; 
`endif 

`ifdef DMA_HAVE_CH3 
input [`DMA_HDATA_WIDTH-1:0] hrdt3_br; 
input [`DMA_HRESP_WIDTH-1:0] hrp3_br; 
input hrdy3_br; 
`endif 

`ifdef DMA_HAVE_CH4 
input [`DMA_HDATA_WIDTH-1:0] hrdt4_br; 
input [`DMA_HRESP_WIDTH-1:0] hrp4_br; 
input hrdy4_br; 
`endif 

`ifdef DMA_HAVE_CH5 
input [`DMA_HDATA_WIDTH-1:0] hrdt5_br; 
input [`DMA_HRESP_WIDTH-1:0] hrp5_br; 
input hrdy5_br; 
`endif 

`ifdef DMA_HAVE_CH6 
input [`DMA_HDATA_WIDTH-1:0] hrdt6_br; 
input [`DMA_HRESP_WIDTH-1:0] hrp6_br; 
input hrdy6_br; 
`endif 

`ifdef DMA_HAVE_CH7 
input [`DMA_HDATA_WIDTH-1:0] hrdt7_br; 
input [`DMA_HRESP_WIDTH-1:0] hrp7_br; 
input hrdy7_br; 
`endif 

output [`DMA_HDATA_WIDTH-1:0] hrdata; 
output [`DMA_HRESP_WIDTH-1:0] hresp; 
output hreadyin; 

wire htr_idle; 
wire mux_sel_dma; 
wire [`DMA_M1SNO_WIDTH-1:0] mux_noi; 
wire mux_no_we; 

reg [`DMA_M1SNO_WIDTH-2:0] muxd_noi, muxb_noi; 
reg [`DMA_M1SNO_WIDTH-1:0] mux_no; 
reg [`DMA_HDATA_WIDTH-1:0] hrdti; 
reg [`DMA_HRESP_WIDTH-1:0] hrpi; 
reg hrdyi; 

assign htr_idle = (htrans == `DMA_HTRANS_IDLE); 

always @(hsel_dma) 
case(hsel_dma) 
'b00000001: muxd_noi = 0; 
`ifdef DMA_HAVE_CH1 
'b00000010: muxd_noi = 1; 
`endif 
`ifdef DMA_HAVE_CH2 
'b00000100: muxd_noi = 2; 
`endif 
`ifdef DMA_HAVE_CH3 
'b00001000: muxd_noi = 3; 
`endif 
`ifdef DMA_HAVE_CH4 
'b00010000: muxd_noi = 4; 
`endif 
`ifdef DMA_HAVE_CH5 
'b00100000: muxd_noi = 5; 
`endif 
`ifdef DMA_HAVE_CH6 
'b01000000: muxd_noi = 6; 
`endif 
`ifdef DMA_HAVE_CH7 
'b10000000: muxd_noi = 7; 
`endif 
default: muxd_noi = 0; 
endcase 

always @(hsel_br) 
case(hsel_br) 
'b00000001: muxb_noi = 0; 
`ifdef DMA_HAVE_CH1 
'b00000010: muxb_noi = 1; 
`endif 
`ifdef DMA_HAVE_CH2 
'b00000100: muxb_noi = 2; 
`endif 
`ifdef DMA_HAVE_CH3 
'b00001000: muxb_noi = 3; 
`endif 
`ifdef DMA_HAVE_CH4 
'b00010000: muxb_noi = 4; 
`endif 
`ifdef DMA_HAVE_CH5 
'b00100000: muxb_noi = 5; 
`endif 
`ifdef DMA_HAVE_CH6 
'b01000000: muxb_noi = 6; 
`endif 
`ifdef DMA_HAVE_CH7 
'b10000000: muxb_noi = 7; 
`endif 
default: muxb_noi = 0; 
endcase 

assign mux_sel_dma = |hsel_dma; 




assign mux_noi = mux_sel_dma? {1'b0,muxd_noi} : {1'b1,muxb_noi}; 


assign mux_no_we = ~htr_idle&hreadyin; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
mux_no <= 0; 
else if(mux_no_we) 
mux_no <= mux_noi; 






reg hrmxnof; 


wire hsel_df = ~((|hsel_dma) | (|hsel_br)); 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
hrmxnof <= 1'b1; 
else if(hreadyin) 
hrmxnof <= hsel_df; 


wire df_cmd = ~htr_idle&hsel_df; 

wire [`DMA_HRESP_WIDTH-1:0] hrp_dfi = df_cmd? `DMA_HRESP_ERROR : `DMA_HRESP_OK; 



reg hrdy_df; 
reg [`DMA_HRESP_WIDTH-1:0] hrp_df; 

always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
hrdy_df <= 1'b1; 
else if(hreadyin) 
hrdy_df <= ~df_cmd; 
else if(~hrdy_df) 
hrdy_df <= 1'b1; 





always @(posedge HCLK or negedge HRSTn) 
if(~HRSTn) 
hrp_df <= `DMA_HRESP_OK; 
else if(hreadyin) 
hrp_df <= hrp_dfi; 



always @(mux_no or hrdt0_dma 
`ifdef DMA_HAVE_CH1 
or hrdt1_dma 
`endif 
`ifdef DMA_HAVE_CH2 
or hrdt2_dma 
`endif 
`ifdef DMA_HAVE_CH3 
or hrdt3_dma 
`endif 
`ifdef DMA_HAVE_CH4 
or hrdt4_dma 
`endif 
`ifdef DMA_HAVE_CH5 
or hrdt5_dma 
`endif 
`ifdef DMA_HAVE_CH6 
or hrdt6_dma 
`endif 
`ifdef DMA_HAVE_CH7 
or hrdt7_dma 
`endif 
or hrdt0_br 
`ifdef DMA_HAVE_CH1 
or hrdt1_br 
`endif 
`ifdef DMA_HAVE_CH2 
or hrdt2_br 
`endif 
`ifdef DMA_HAVE_CH3 
or hrdt3_br 
`endif 
`ifdef DMA_HAVE_CH4 
or hrdt4_br 
`endif 
`ifdef DMA_HAVE_CH5 
or hrdt5_br 
`endif 
`ifdef DMA_HAVE_CH6 
or hrdt6_br 
`endif 
`ifdef DMA_HAVE_CH7 
or hrdt7_br 
`endif 
) 
case(mux_no) 
'h0: hrdti = hrdt0_dma; 
`ifdef DMA_HAVE_CH1 
'h1: hrdti = hrdt1_dma; 
`endif 
`ifdef DMA_HAVE_CH2 
'h2: hrdti = hrdt2_dma; 
`endif 
`ifdef DMA_HAVE_CH3 
'h3: hrdti = hrdt3_dma; 
`endif 
`ifdef DMA_HAVE_CH4 
'h4: hrdti = hrdt4_dma; 
`endif 
`ifdef DMA_HAVE_CH5 
'h5: hrdti = hrdt5_dma; 
`endif 
`ifdef DMA_HAVE_CH6 
'h6: hrdti = hrdt6_dma; 
`endif 
`ifdef DMA_HAVE_CH7 
'h7: hrdti = hrdt7_dma; 
`endif 

'h8: hrdti = hrdt0_br; 

`ifdef DMA_HAVE_CH1 
'h9: hrdti = hrdt1_br; 
`endif 
`ifdef DMA_HAVE_CH2 
'ha: hrdti = hrdt2_br; 
`endif 
`ifdef DMA_HAVE_CH3 
'hb: hrdti = hrdt3_br; 
`endif 
`ifdef DMA_HAVE_CH4 
'hc: hrdti = hrdt4_br; 
`endif 
`ifdef DMA_HAVE_CH5 
'hd: hrdti = hrdt5_br; 
`endif 
`ifdef DMA_HAVE_CH6 
'he: hrdti = hrdt6_br; 
`endif 
`ifdef DMA_HAVE_CH7 
'hf: hrdti = hrdt7_br; 
`endif 
default: hrdti = hrdt0_dma; 
endcase 

assign hrdata = hrdti; 


always @(mux_no or hrp0_dma 
`ifdef DMA_HAVE_CH1 
or hrp1_dma 
`endif 
`ifdef DMA_HAVE_CH2 
or hrp2_dma 
`endif 
`ifdef DMA_HAVE_CH3 
or hrp3_dma 
`endif 
`ifdef DMA_HAVE_CH4 
or hrp4_dma 
`endif 
`ifdef DMA_HAVE_CH5 
or hrp5_dma 
`endif 
`ifdef DMA_HAVE_CH6 
or hrp6_dma 
`endif 
`ifdef DMA_HAVE_CH7 
or hrp7_dma 
`endif 

or hrp0_br 

`ifdef DMA_HAVE_CH1 
or hrp1_br 
`endif 
`ifdef DMA_HAVE_CH2 
or hrp2_br 
`endif 
`ifdef DMA_HAVE_CH3 
or hrp3_br 
`endif 
`ifdef DMA_HAVE_CH4 
or hrp4_br 
`endif 
`ifdef DMA_HAVE_CH5 
or hrp5_br 
`endif 
`ifdef DMA_HAVE_CH6 
or hrp6_br 
`endif 
`ifdef DMA_HAVE_CH7 
or hrp7_br 
`endif 
) 
case(mux_no) 
'h0: hrpi = hrp0_dma; 
`ifdef DMA_HAVE_CH1 
'h1: hrpi = hrp1_dma; 
`endif 
`ifdef DMA_HAVE_CH2 
'h2: hrpi = hrp2_dma; 
`endif 
`ifdef DMA_HAVE_CH3 
'h3: hrpi = hrp3_dma; 
`endif 
`ifdef DMA_HAVE_CH4 
'h4: hrpi = hrp4_dma; 
`endif 
`ifdef DMA_HAVE_CH5 
'h5: hrpi = hrp5_dma; 
`endif 
`ifdef DMA_HAVE_CH6 
'h6: hrpi = hrp6_dma; 
`endif 
`ifdef DMA_HAVE_CH7 
'h7: hrpi = hrp7_dma; 
`endif 

'h8: hrpi = hrp0_br; 

`ifdef DMA_HAVE_CH1 
'h9: hrpi = hrp1_br; 
`endif 
`ifdef DMA_HAVE_CH2 
'ha: hrpi = hrp2_br; 
`endif 
`ifdef DMA_HAVE_CH3 
'hb: hrpi = hrp3_br; 
`endif 
`ifdef DMA_HAVE_CH4 
'hc: hrpi = hrp4_br; 
`endif 
`ifdef DMA_HAVE_CH5 
'hd: hrpi = hrp5_br; 
`endif 
`ifdef DMA_HAVE_CH6 
'he: hrpi = hrp6_br; 
`endif 
`ifdef DMA_HAVE_CH7 
'hf: hrpi = hrp7_br; 
`endif 
default: hrpi = hrp0_dma; 
endcase 


assign hresp = hrmxnof ? hrp_df : hrpi; 



always @(mux_no or hrdy0_dma 
`ifdef DMA_HAVE_CH1 
or hrdy1_dma 
`endif 
`ifdef DMA_HAVE_CH2 
or hrdy2_dma 
`endif 
`ifdef DMA_HAVE_CH3 
or hrdy3_dma 
`endif 
`ifdef DMA_HAVE_CH4 
or hrdy4_dma 
`endif 
`ifdef DMA_HAVE_CH5 
or hrdy5_dma 
`endif 
`ifdef DMA_HAVE_CH6 
or hrdy6_dma 
`endif 
`ifdef DMA_HAVE_CH7 
or hrdy7_dma 
`endif 

or hrdy0_br 

`ifdef DMA_HAVE_CH1 
or hrdy1_br 
`endif 
`ifdef DMA_HAVE_CH2 
or hrdy2_br 
`endif 
`ifdef DMA_HAVE_CH3 
or hrdy3_br 
`endif 
`ifdef DMA_HAVE_CH4 
or hrdy4_br 
`endif 
`ifdef DMA_HAVE_CH5 
or hrdy5_br 
`endif 
`ifdef DMA_HAVE_CH6 
or hrdy6_br 
`endif 
`ifdef DMA_HAVE_CH7 
or hrdy7_br 
`endif 
) 
case(mux_no) 
'h0: hrdyi = hrdy0_dma; 
`ifdef DMA_HAVE_CH1 
'h1: hrdyi = hrdy1_dma; 
`endif 
`ifdef DMA_HAVE_CH2 
'h2: hrdyi = hrdy2_dma; 
`endif 
`ifdef DMA_HAVE_CH3 
'h3: hrdyi = hrdy3_dma; 
`endif 
`ifdef DMA_HAVE_CH4 
'h4: hrdyi = hrdy4_dma; 
`endif 
`ifdef DMA_HAVE_CH5 
'h5: hrdyi = hrdy5_dma; 
`endif 
`ifdef DMA_HAVE_CH6 
'h6: hrdyi = hrdy6_dma; 
`endif 
`ifdef DMA_HAVE_CH7 
'h7: hrdyi = hrdy7_dma; 
`endif 
'h8: hrdyi = hrdy0_br; 
`ifdef DMA_HAVE_CH1 
'h9: hrdyi = hrdy1_br; 
`endif 
`ifdef DMA_HAVE_CH2 
'ha: hrdyi = hrdy2_br; 
`endif 
`ifdef DMA_HAVE_CH3 
'hb: hrdyi = hrdy3_br; 
`endif 
`ifdef DMA_HAVE_CH4 
'hc: hrdyi = hrdy4_br; 
`endif 
`ifdef DMA_HAVE_CH5 
'hd: hrdyi = hrdy5_br; 
`endif 
`ifdef DMA_HAVE_CH6 
'he: hrdyi = hrdy6_br; 
`endif 
`ifdef DMA_HAVE_CH7 
'hf: hrdyi = hrdy7_br; 
`endif 

default: hrdyi = hrdy0_dma; 
endcase 


assign hreadyin = hrmxnof ? hrdy_df : hrdyi; 

endmodule 

`endif 
`endif 
