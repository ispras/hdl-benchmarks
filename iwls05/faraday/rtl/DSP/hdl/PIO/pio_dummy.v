







module PIO( 
DSPCLK, T_RST, DMD, PIO_IN, 

selPMASK, selPINT, selPFTYPE, selPFDATA, 
PMASK_we, PINT_we, PFTYPE_we, PFDATA_we, 
MMR_web, 
`ifdef FD_DFT 
/* dft */ SCAN_TEST, 
`endif 
PIO_INTn, PIO_DMD, PIO_EN, PIO_OUT); 

input DSPCLK; 
input T_RST; 
input selPMASK; 
input selPINT; 
input selPFTYPE; 
input selPFDATA; 
input PMASK_we; 
input PINT_we; 
input PFTYPE_we; 
input PFDATA_we; 
input [11:0] PIO_IN; 
input [15:0] DMD; 
input MMR_web; 
`ifdef FD_DFT 
input SCAN_TEST; 
`endif 
output PIO_INTn; 
output [15:0] PIO_DMD; 
output [11:0] PIO_OUT; 
output [11:0] PIO_EN; 
/*-----------------------------------------------------*/ 

assign PIO_INTn=1; 
assign PIO_DMD=0; 
assign PIO_OUT=0; 
assign PIO_EN=0; 

endmodule 



