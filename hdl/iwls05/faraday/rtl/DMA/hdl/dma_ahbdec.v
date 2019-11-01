




































`include "DMA_DEFINE.vh" 

`ifdef DMA_HAVE_AHB1 
`ifdef DMA_HAVE_BRIDGE 

module dma_ahbdec 
( 

haddr, 

c0dmabs, 
`ifdef DMA_HAVE_CH1 
c1dmabs, 
`endif 
`ifdef DMA_HAVE_CH2 
c2dmabs, 
`endif 
`ifdef DMA_HAVE_CH3 
c3dmabs, 
`endif 
`ifdef DMA_HAVE_CH4 
c4dmabs, 
`endif 
`ifdef DMA_HAVE_CH5 
c5dmabs, 
`endif 
`ifdef DMA_HAVE_CH6 
c6dmabs, 
`endif 
`ifdef DMA_HAVE_CH7 
c7dmabs, 
`endif 

c0brbs, 
`ifdef DMA_HAVE_CH1 
c1brbs, 
`endif 
`ifdef DMA_HAVE_CH2 
c2brbs, 
`endif 
`ifdef DMA_HAVE_CH3 
c3brbs, 
`endif 
`ifdef DMA_HAVE_CH4 
c4brbs, 
`endif 
`ifdef DMA_HAVE_CH5 
c5brbs, 
`endif 
`ifdef DMA_HAVE_CH6 
c6brbs, 
`endif 
`ifdef DMA_HAVE_CH7 
c7brbs, 
`endif 

hsel_dma, 
hsel_br 
); 

input [`DMA_HADDR_WIDTH-1:0] haddr; 

input [31:16] c0brbs; 
`ifdef DMA_HAVE_CH1 
input [31:16] c1brbs; 
`endif 
`ifdef DMA_HAVE_CH2 
input [31:16] c2brbs; 
`endif 
`ifdef DMA_HAVE_CH3 
input [31:16] c3brbs; 
`endif 
`ifdef DMA_HAVE_CH4 
input [31:16] c4brbs; 
`endif 
`ifdef DMA_HAVE_CH5 
input [31:16] c5brbs; 
`endif 
`ifdef DMA_HAVE_CH6 
input [31:16] c6brbs; 
`endif 
`ifdef DMA_HAVE_CH7 
input [31:16] c7brbs; 
`endif 

input [31:16] c0dmabs; 
`ifdef DMA_HAVE_CH1 
input [31:16] c1dmabs; 
`endif 
`ifdef DMA_HAVE_CH2 
input [31:16] c2dmabs; 
`endif 
`ifdef DMA_HAVE_CH3 
input [31:16] c3dmabs; 
`endif 
`ifdef DMA_HAVE_CH4 
input [31:16] c4dmabs; 
`endif 
`ifdef DMA_HAVE_CH5 
input [31:16] c5dmabs; 
`endif 
`ifdef DMA_HAVE_CH6 
input [31:16] c6dmabs; 
`endif 
`ifdef DMA_HAVE_CH7 
input [31:16] c7dmabs; 
`endif 

output [`DMA_MAX_CHNO-1:0] hsel_dma; 
output [`DMA_MAX_CHNO-1:0] hsel_br; 



reg [3:0] c0dmamsk; 
`ifdef DMA_HAVE_CH1 
reg [3:0] c1dmamsk; 
`endif 
`ifdef DMA_HAVE_CH2 
reg [3:0] c2dmamsk; 
`endif 
`ifdef DMA_HAVE_CH3 
reg [3:0] c3dmamsk; 
`endif 
`ifdef DMA_HAVE_CH4 
reg [3:0] c4dmamsk; 
`endif 
`ifdef DMA_HAVE_CH5 
reg [3:0] c5dmamsk; 
`endif 
`ifdef DMA_HAVE_CH6 
reg [3:0] c6dmamsk; 
`endif 
`ifdef DMA_HAVE_CH7 
reg [3:0] c7dmamsk; 
`endif 
reg [3:0] c0brmsk; 
`ifdef DMA_HAVE_CH1 
reg [3:0] c1brmsk; 
`endif 
`ifdef DMA_HAVE_CH2 
reg [3:0] c2brmsk; 
`endif 
`ifdef DMA_HAVE_CH3 
reg [3:0] c3brmsk; 
`endif 
`ifdef DMA_HAVE_CH4 
reg [3:0] c4brmsk; 
`endif 
`ifdef DMA_HAVE_CH5 
reg [3:0] c5brmsk; 
`endif 
`ifdef DMA_HAVE_CH6 
reg [3:0] c6brmsk; 
`endif 
`ifdef DMA_HAVE_CH7 
reg [3:0] c7brmsk; 
`endif 



always @(c0dmabs) 
case(c0dmabs[19:16]) 
'b0000: c0dmamsk = 'b0000; 
'b0001: c0dmamsk = 'b0001; 
'b0010: c0dmamsk = 'b0011; 
'b0011: c0dmamsk = 'b0111; 
default: c0dmamsk = 'b1111; 
endcase 

`ifdef DMA_HAVE_CH1 
always @(c1dmabs) 
case(c1dmabs[19:16]) 
'b0000: c1dmamsk = 'b0000; 
'b0001: c1dmamsk = 'b0001; 
'b0010: c1dmamsk = 'b0011; 
'b0011: c1dmamsk = 'b0111; 
default: c1dmamsk = 'b1111; 
endcase 
`endif 

`ifdef DMA_HAVE_CH2 
always @(c2dmabs) 
case(c2dmabs[19:16]) 
'b0000: c2dmamsk = 'b0000; 
'b0001: c2dmamsk = 'b0001; 
'b0010: c2dmamsk = 'b0011; 
'b0011: c2dmamsk = 'b0111; 
default: c2dmamsk = 'b1111; 
endcase 
`endif 

`ifdef DMA_HAVE_CH3 
always @(c3dmabs) 
case(c3dmabs[19:16]) 
'b0000: c3dmamsk = 'b0000; 
'b0001: c3dmamsk = 'b0001; 
'b0010: c3dmamsk = 'b0011; 
'b0011: c3dmamsk = 'b0111; 
default: c3dmamsk = 'b1111; 
endcase 
`endif 

`ifdef DMA_HAVE_CH4 
always @(c4dmabs) 
case(c4dmabs[19:16]) 
'b0000: c4dmamsk = 'b0000; 
'b0001: c4dmamsk = 'b0001; 
'b0010: c4dmamsk = 'b0011; 
'b0011: c4dmamsk = 'b0111; 
default: c4dmamsk = 'b1111; 
endcase 
`endif 

`ifdef DMA_HAVE_CH5 
always @(c5dmabs) 
case(c5dmabs[19:16]) 
'b0000: c5dmamsk = 'b0000; 
'b0001: c5dmamsk = 'b0001; 
'b0010: c5dmamsk = 'b0011; 
'b0011: c5dmamsk = 'b0111; 
default: c5dmamsk = 'b1111; 
endcase 
`endif 

`ifdef DMA_HAVE_CH6 
always @(c6dmabs) 
case(c6dmabs[19:16]) 
'b0000: c6dmamsk = 'b0000; 
'b0001: c6dmamsk = 'b0001; 
'b0010: c6dmamsk = 'b0011; 
'b0011: c6dmamsk = 'b0111; 
default: c6dmamsk = 'b1111; 
endcase 
`endif 

`ifdef DMA_HAVE_CH7 
always @(c7dmabs) 
case(c7dmabs[19:16]) 
'b0000: c7dmamsk = 'b0000; 
'b0001: c7dmamsk = 'b0001; 
'b0010: c7dmamsk = 'b0011; 
'b0011: c7dmamsk = 'b0111; 
default: c7dmamsk = 'b1111; 
endcase 
`endif 


always @(c0brbs) 
case(c0brbs[19:16]) 
'b0000: c0brmsk = 'b0000; 
'b0001: c0brmsk = 'b0001; 
'b0010: c0brmsk = 'b0011; 
'b0011: c0brmsk = 'b0111; 
default: c0brmsk = 'b1111; 
endcase 

`ifdef DMA_HAVE_CH1 
always @(c1brbs) 
case(c1brbs[19:16]) 
'b0000: c1brmsk = 'b0000; 
'b0001: c1brmsk = 'b0001; 
'b0010: c1brmsk = 'b0011; 
'b0011: c1brmsk = 'b0111; 
default: c1brmsk = 'b1111; 
endcase 
`endif 

`ifdef DMA_HAVE_CH2 
always @(c2brbs) 
case(c2brbs[19:16]) 
'b0000: c2brmsk = 'b0000; 
'b0001: c2brmsk = 'b0001; 
'b0010: c2brmsk = 'b0011; 
'b0011: c2brmsk = 'b0111; 
default: c2brmsk = 'b1111; 
endcase 
`endif 

`ifdef DMA_HAVE_CH3 
always @(c3brbs) 
case(c3brbs[19:16]) 
'b0000: c3brmsk = 'b0000; 
'b0001: c3brmsk = 'b0001; 
'b0010: c3brmsk = 'b0011; 
'b0011: c3brmsk = 'b0111; 
default: c3brmsk = 'b1111; 
endcase 
`endif 

`ifdef DMA_HAVE_CH4 
always @(c4brbs) 
case(c4brbs[19:16]) 
'b0000: c4brmsk = 'b0000; 
'b0001: c4brmsk = 'b0001; 
'b0010: c4brmsk = 'b0011; 
'b0011: c4brmsk = 'b0111; 
default: c4brmsk = 'b1111; 
endcase 
`endif 

`ifdef DMA_HAVE_CH5 
always @(c5brbs) 
case(c5brbs[19:16]) 
'b0000: c5brmsk = 'b0000; 
'b0001: c5brmsk = 'b0001; 
'b0010: c5brmsk = 'b0011; 
'b0011: c5brmsk = 'b0111; 
default: c5brmsk = 'b1111; 
endcase 
`endif 

`ifdef DMA_HAVE_CH6 
always @(c6brbs) 
case(c6brbs[19:16]) 
'b0000: c6brmsk = 'b0000; 
'b0001: c6brmsk = 'b0001; 
'b0010: c6brmsk = 'b0011; 
'b0011: c6brmsk = 'b0111; 
default: c6brmsk = 'b1111; 
endcase 
`endif 

`ifdef DMA_HAVE_CH7 
always @(c7brbs) 
case(c7brbs[19:16]) 
'b0000: c7brmsk = 'b0000; 
'b0001: c7brmsk = 'b0001; 
'b0010: c7brmsk = 'b0011; 
'b0011: c7brmsk = 'b0111; 
default: c7brmsk = 'b1111; 
endcase 
`endif 







wire c0dmaen_h = (haddr[31:24] == c0dmabs[31:24]); 
wire c0dmaen_l = ((haddr[23:20]|c0dmamsk[3:0]) == (c0dmabs[23:20]|c0dmamsk[3:0])); 
assign hsel_dma[0] = c0dmaen_h&c0dmaen_l; 

`ifdef DMA_HAVE_CH1 
wire c1dmaen_h = (haddr[31:24] == c1dmabs[31:24]); 
wire c1dmaen_l = ((haddr[23:20]|c1dmamsk[3:0]) == (c1dmabs[23:20]|c1dmamsk[3:0])); 
assign hsel_dma[1] = c1dmaen_h&c1dmaen_l; 
`endif 

`ifdef DMA_HAVE_CH2 
wire c2dmaen_h = (haddr[31:24] == c2dmabs[31:24]); 
wire c2dmaen_l = ((haddr[23:20]|c2dmamsk[3:0]) == (c2dmabs[23:20]|c2dmamsk[3:0])); 
assign hsel_dma[2] = c2dmaen_h&c2dmaen_l; 
`endif 

`ifdef DMA_HAVE_CH3 
wire c3dmaen_h = (haddr[31:24] == c3dmabs[31:24]); 
wire c3dmaen_l = ((haddr[23:20]|c3dmamsk[3:0]) == (c3dmabs[23:20]|c3dmamsk[3:0])); 
assign hsel_dma[3] = c3dmaen_h&c3dmaen_l; 
`endif 

`ifdef DMA_HAVE_CH4 
wire c4dmaen_h = (haddr[31:24] == c4dmabs[31:24]); 
wire c4dmaen_l = ((haddr[23:20]|c4dmamsk[3:0]) == (c4dmabs[23:20]|c4dmamsk[3:0])); 
assign hsel_dma[4] = c4dmaen_h&c4dmaen_l; 
`endif 

`ifdef DMA_HAVE_CH5 
wire c5dmaen_h = (haddr[31:24] == c5dmabs[31:24]); 
wire c5dmaen_l = ((haddr[23:20]|c5dmamsk[3:0]) == (c5dmabs[23:20]|c5dmamsk[3:0])); 
assign hsel_dma[5] = c5dmaen_h&c5dmaen_l; 
`endif 

`ifdef DMA_HAVE_CH6 
wire c6dmaen_h = (haddr[31:24] == c6dmabs[31:24]); 
wire c6dmaen_l = ((haddr[23:20]|c6dmamsk[3:0]) == (c6dmabs[23:20]|c6dmamsk[3:0])); 
assign hsel_dma[6] = c6dmaen_h&c6dmaen_l; 
`endif 

`ifdef DMA_HAVE_CH7 
wire c7dmaen_h = (haddr[31:24] == c7dmabs[31:24]); 
wire c7dmaen_l = ((haddr[23:20]|c7dmamsk[3:0]) == (c7dmabs[23:20]|c7dmamsk[3:0])); 
assign hsel_dma[7] = c7dmaen_h&c7dmaen_l; 
`endif 


wire c0bren_h = (haddr[31:24] == c0brbs[31:24]); 
wire c0bren_l = ((haddr[23:20]|c0brmsk[3:0]) == (c0brbs[23:20]|c0brmsk[3:0])); 
assign hsel_br[0] = c0bren_h&c0bren_l; 

`ifdef DMA_HAVE_CH1 
wire c1bren_h = (haddr[31:24] == c1brbs[31:24]); 
wire c1bren_l = ((haddr[23:20]|c1brmsk[3:0]) == (c1brbs[23:20]|c1brmsk[3:0])); 
assign hsel_br[1] = c1bren_h&c1bren_l; 
`endif 

`ifdef DMA_HAVE_CH2 
wire c2bren_h = (haddr[31:24] == c2brbs[31:24]); 
wire c2bren_l = ((haddr[23:20]|c2brmsk[3:0]) == (c2brbs[23:20]|c2brmsk[3:0])); 
assign hsel_br[2] = c2bren_h&c2bren_l; 
`endif 

`ifdef DMA_HAVE_CH3 
wire c3bren_h = (haddr[31:24] == c3brbs[31:24]); 
wire c3bren_l = ((haddr[23:20]|c3brmsk[3:0]) == (c3brbs[23:20]|c3brmsk[3:0])); 
assign hsel_br[3] = c3bren_h&c3bren_l; 
`endif 

`ifdef DMA_HAVE_CH4 
wire c4bren_h = (haddr[31:24] == c4brbs[31:24]); 
wire c4bren_l = ((haddr[23:20]|c4brmsk[3:0]) == (c4brbs[23:20]|c4brmsk[3:0])); 
assign hsel_br[4] = c4bren_h&c4bren_l; 
`endif 

`ifdef DMA_HAVE_CH5 
wire c5bren_h = (haddr[31:24] == c5brbs[31:24]); 
wire c5bren_l = ((haddr[23:20]|c5brmsk[3:0]) == (c5brbs[23:20]|c5brmsk[3:0])); 
assign hsel_br[5] = c5bren_h&c5bren_l; 
`endif 

`ifdef DMA_HAVE_CH6 
wire c6bren_h = (haddr[31:24] == c6brbs[31:24]); 
wire c6bren_l = ((haddr[23:20]|c6brmsk[3:0]) == (c6brbs[23:20]|c6brmsk[3:0])); 
assign hsel_br[6] = c6bren_h&c6bren_l; 
`endif 

`ifdef DMA_HAVE_CH7 
wire c7bren_h = (haddr[31:24] == c7brbs[31:24]); 
wire c7bren_l = ((haddr[23:20]|c7brmsk[3:0]) == (c7brbs[23:20]|c7brmsk[3:0])); 
assign hsel_br[7] = c7bren_h&c7bren_l; 
`endif 

endmodule 

`endif 
`endif 
