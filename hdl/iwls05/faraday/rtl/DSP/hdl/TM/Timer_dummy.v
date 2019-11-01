







module TM(
TMCLK, DSPCLK, T_RST, TMODE, DMD[15:0], 

selTSR, selTCR, selTPR, TSR_we, TCR_we, 
TPR_we, MSTAT5, TMOUT[15:0], MMR_web, 
ICE_ST, 
`ifdef FD_DFT 
/* dft */ SCAN_TEST, 
`endif 
TINT); 


input [15:0] DMD; 
input TMCLK; 
input DSPCLK; 
input T_RST; 
input selTSR; 
input selTCR; 
input selTPR; 
input MSTAT5; 
input TSR_we; 
input TCR_we; 
input TPR_we; 
input TMODE; 
input MMR_web; 
input ICE_ST; 
`ifdef FD_DFT 
input SCAN_TEST; 
`endif 
output [15:0] TMOUT; 
output TINT; 

assign TMOUT=0; 
assign TINT=0; 

endmodule 
