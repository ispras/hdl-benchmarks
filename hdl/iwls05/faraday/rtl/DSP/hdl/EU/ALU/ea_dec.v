






/*--------------------------------------------------------------*/ 
 
 
 
/*--------------------------------------------------------------*/ 

/*--------------------------------------------------------------*/ 
 
/*--------------------------------------------------------------*/ 

module EA_DEC(/* In */ 
DSPCLK, GO_E, GO_C, EX_en, EX_enc, 
condAM_E, DIVQ_E, DIVS_E, SHADOW, 
MTAX0_E, MTAX1_E, MTAY0_E, MTAY1_E, X15, Y15, 
cout, ovf_, satAR, AQ, AC,Xop_D, Xop_E, Yop_E, 
YY_D, CC_D, BO_D, CC_E, BO_E, 
AMF_D, ALU, ALUop_E, updAR_E, updAF_E, 
MTAR_E, ALUop_R, type9, T_RST, DIVQ_R, DIVS_R, 
`ifdef FD_DFT 
 SCAN_TEST, 
`endif 
 
Rstore_AR_D, Rstore_AR_E, updateALU, updateDIV, updateAFr, 
updateAFs, updateARr, updateARs, updateAX0r, updateAX0s, 
updateAX1r, updateAX1s, updateAY0r, updateAY0s, updateAY1r, 
updateAY1s, ABS, zeroAX, invAX, zeroAY, invAY, Cin, selAX, 
selAY, selAF, selCT, K, L, ADD, ASin, AQin, ACin, AVin, ANin, 
AZin, qin, CONST_E); 


/*------------------------------*/ 
 
/*------------------------------*/ 
input DSPCLK, GO_E, GO_C; 
input EX_en, EX_enc; 
input [2:0] Xop_D, Xop_E; 
input [1:0] Yop_E; 
input [1:0] YY_D, CC_D, BO_D; 
input [1:0] CC_E, BO_E; 
input [4:0] AMF_D; 
input condAM_E; 
input DIVQ_E, DIVS_E; 
input SHADOW; 
input MTAX0_E, MTAX1_E; 
input MTAY0_E, MTAY1_E, X15, Y15; 
input [15:0] ALU; 
input cout, ovf_, satAR; 
input AQ, AC; 
input ALUop_E, updAR_E, updAF_E; 
input MTAR_E, ALUop_R; 
input type9, T_RST, DIVQ_R, DIVS_R; 
`ifdef FD_DFT 
input SCAN_TEST; 
`endif 


/*------------------------------*/ 
 
/*------------------------------*/ 
output Rstore_AR_D, Rstore_AR_E; 
output [15:0] CONST_E; 
output updateALU, updateDIV; 
output updateAFr, updateAFs; 
output updateARr, updateARs; 
output updateAX0r, updateAX0s; 
output updateAX1r, updateAX1s; 
output updateAY0r, updateAY0s; 
output updateAY1r, updateAY1s; 
output ABS, zeroAX, invAX; 
output zeroAY, invAY, Cin; 
output selAX, selAY, selAF; 
output selCT, K, L, ADD; 
output ASin, AQin, ACin; 
output AVin, ANin, AZin, qin; 

/*----------------------------------------------*/ 
 
 
 
/*----------------------------------------------*/ 
reg [4:0] AMF_E; 

always @(posedge DSPCLK or posedge T_RST) 
begin 
if (T_RST) AMF_E[4:0] <= #1 5'b0; 
else if (GO_E && (ALUop_R || DIVQ_R || DIVS_R)) 
AMF_E[4:0] <= #1 AMF_D[4:0]; 
end 

/*----------------------------------------------*/ 
 
/*----------------------------------------------*/ 
wire Rstore_AR_D; 
wire Rstore_AR_E; 

assign Rstore_AR_D = (Xop_D[2:0] == 3'b010); 
assign Rstore_AR_E = (Xop_E[2:0] == 3'b010); 

/*----------------------------------------------*/ 
 
/*----------------------------------------------*/ 
wire [1:0] YY_D, CC_D, BO_D; 
reg [15:0] CONST_D; 

always @(YY_D or CC_D or BO_D) 
begin 
case ({YY_D, CC_D, BO_D}) 
6'b00_00_01 : CONST_D[15:0] = 16'h0001; 
6'b00_01_01 : CONST_D[15:0] = 16'h0002; 
6'b00_10_01 : CONST_D[15:0] = 16'h0004; 
6'b00_11_01 : CONST_D[15:0] = 16'h0008; 
6'b01_00_01 : CONST_D[15:0] = 16'h0010; 
6'b01_01_01 : CONST_D[15:0] = 16'h0020; 
6'b01_10_01 : CONST_D[15:0] = 16'h0040; 
6'b01_11_01 : CONST_D[15:0] = 16'h0080; 
6'b10_00_01 : CONST_D[15:0] = 16'h0100; 
6'b10_01_01 : CONST_D[15:0] = 16'h0200; 
6'b10_10_01 : CONST_D[15:0] = 16'h0400; 
6'b10_11_01 : CONST_D[15:0] = 16'h0800; 
6'b11_00_01 : CONST_D[15:0] = 16'h1000; 
6'b11_01_01 : CONST_D[15:0] = 16'h2000; 
6'b11_10_01 : CONST_D[15:0] = 16'h4000; 
6'b11_11_01 : CONST_D[15:0] = 16'h8000; 
6'b00_00_11 : CONST_D[15:0] = 16'hfffe; 
6'b00_01_11 : CONST_D[15:0] = 16'hfffd; 
6'b00_10_11 : CONST_D[15:0] = 16'hfffb; 
6'b00_11_11 : CONST_D[15:0] = 16'hfff7; 
6'b01_00_11 : CONST_D[15:0] = 16'hffef; 
6'b01_01_11 : CONST_D[15:0] = 16'hffdf; 
6'b01_10_11 : CONST_D[15:0] = 16'hffbf; 
6'b01_11_11 : CONST_D[15:0] = 16'hff7f; 
6'b10_00_11 : CONST_D[15:0] = 16'hfeff; 
6'b10_01_11 : CONST_D[15:0] = 16'hfdff; 
6'b10_10_11 : CONST_D[15:0] = 16'hfbff; 
6'b10_11_11 : CONST_D[15:0] = 16'hf7ff; 
6'b11_00_11 : CONST_D[15:0] = 16'hefff; 
6'b11_01_11 : CONST_D[15:0] = 16'hdfff; 
6'b11_10_11 : CONST_D[15:0] = 16'hbfff; 
6'b11_11_11 : CONST_D[15:0] = 16'h7fff; 
default : CONST_D[15:0] = 16'h0000; 
endcase 
end 

wire CLKCTenb; 

assign CLKCTenb = !(AMF_D[4] && type9 && ({CC_D[1:0], BO_D[1:0]} !=4'b0000)); 
`ifdef FD_DFT 
REG16L piconst(DSPCLK, CLKCTenb, GO_E, CONST_D[15:0], CONST_E[15:0], SCAN_TEST); 
`else 
REG16L piconst(DSPCLK, CLKCTenb, GO_E, CONST_D[15:0], CONST_E[15:0]); 
`endif 

/*----------------------------------------------*/ 
 
/*----------------------------------------------*/ 
wire updateALU, updateDIV; 


assign updateAX0r = !SHADOW && MTAX0_E && EX_en; 
assign updateAX0s = SHADOW && MTAX0_E && EX_en; 
assign updateAX1r = !SHADOW && MTAX1_E && EX_en; 
assign updateAX1s = SHADOW && MTAX1_E && EX_en; 
assign updateAY0r = !SHADOW && (MTAY0_E || DIVQ_E || DIVS_E) && EX_en; 
assign updateAY0s = SHADOW && (MTAY0_E || DIVQ_E || DIVS_E) && EX_en; 
assign updateAY1r = !SHADOW && MTAY1_E && EX_en; 
assign updateAY1s = SHADOW && MTAY1_E && EX_en; 
assign updateAFr = !SHADOW && (DIVQ_E || DIVS_E || updAF_E); 
assign updateAFs = SHADOW && (DIVQ_E || DIVS_E || updAF_E); 
assign updateARr = !SHADOW && (MTAR_E || updAR_E); 
assign updateARs = SHADOW && (MTAR_E || updAR_E); 
assign updateALU = ALUop_E && EX_enc; 
assign updateDIV = (DIVQ_E || DIVS_E) & EX_en; 

/*----------------------------------------------*/ 
 
/*----------------------------------------------*/ 


assign ABS = (AMF_E[4:0] == 5'b11111); 

assign zeroAX = (AMF_E[3:0] == 4'h0) 
| (AMF_E[3:0] == 4'h1) 
| (AMF_E[3:0] == 4'h4) 
| (AMF_E[3:0] == 4'h5) 
| (!DIVQ_E && (AMF_E[3:0] == 4'h8)) 
| (!(ALUop_E || DIVQ_E || DIVS_E)); 

`ifdef FD_RTL_SIM 
assign invAX = (DIVQ_E & (!AQ)) 
| (AMF_E[3:0] == 4'hb) 
| (!DIVQ_E & (AMF_E[3:0] == 4'h8)) 
| (AMF_E[3:0] == 4'h9) 
| (AMF_E[3:0] == 4'ha) 
| ((AMF_E[3:0] == 4'hf) && X15) 
| (!(ALUop_E || DIVQ_E || DIVS_E)); 

`else 
wire invAX1, invAX0; 

assign invAX1 = (DIVQ_E & (!AQ)) 
| (AMF_E[3:0] == 4'hb) 
| (!DIVQ_E & (AMF_E[3:0] == 4'h8)) 
| (AMF_E[3:0] == 4'h9) 
| (AMF_E[3:0] == 4'ha) 
| (AMF_E[3:0] == 4'hf) 
| (!(ALUop_E || DIVQ_E || DIVS_E)); 

assign invAX0 = (DIVQ_E & (!AQ)) 
| (AMF_E[3:0] == 4'hb) 
| (!DIVQ_E & (AMF_E[3:0] == 4'h8)) 
| (AMF_E[3:0] == 4'h9) 
| (AMF_E[3:0] == 4'ha) 
| (!(ALUop_E || DIVQ_E || DIVS_E)); 


GTECH_MUX2 invx_sel(.A(invAX0), .B(invAX1), .S(X15), .Z(invAX)); 

`endif 


assign zeroAY = (AMF_E[3:0] == 4'hb) 
| (AMF_E[3:0] == 4'hf) 
| (!(ALUop_E || DIVQ_E || DIVS_E)); 

assign invAY = (AMF_E[3:0] == 4'h5) 
| (AMF_E[3:0] == 4'h6) 
| (AMF_E[3:0] == 4'h7) 
| (AMF_E[3:0] == 4'h4) 
| (!(ALUop_E || DIVQ_E || DIVS_E)); 

`ifdef FD_RTL_SIM 
assign Cin = (DIVQ_E && (!AQ)) 
| (AMF_E[3:0] == 4'h1) 
| ((AMF_E[3:0] == 4'h2) && AC) 
| (AMF_E[3:0] == 4'h5) 
| ((AMF_E[3:0] == 4'h6) && AC) 
| (AMF_E[3:0] == 4'h7) 
| (AMF_E[3:0] == 4'h9) 
| ((AMF_E[3:0] == 4'ha) && AC) 
| ((AMF_E[3:0] == 4'hf) && X15) 
| (!(ALUop_E || DIVQ_E || DIVS_E)); 

`else 




 
wire Cin1, Cin0; 
assign Cin1 = (DIVQ_E && (!AQ)) 
| (AMF_E[3:0] == 4'h1) 
| ((AMF_E[3:0] == 4'h2) && AC) 
| (AMF_E[3:0] == 4'h5) 
| ((AMF_E[3:0] == 4'h6) && AC) 
| (AMF_E[3:0] == 4'h7) 
| (AMF_E[3:0] == 4'h9) 
| ((AMF_E[3:0] == 4'ha) && AC) 
| (AMF_E[3:0] == 4'hf) 
| (!(ALUop_E || DIVQ_E || DIVS_E)); 

assign Cin0 = (DIVQ_E && (!AQ)) 
| (AMF_E[3:0] == 4'h1) 
| ((AMF_E[3:0] == 4'h2) && AC) 
| (AMF_E[3:0] == 4'h5) 
| ((AMF_E[3:0] == 4'h6) && AC) 
| (AMF_E[3:0] == 4'h7) 
| (AMF_E[3:0] == 4'h9) 
| ((AMF_E[3:0] == 4'ha) && AC) 
| (!(ALUop_E || DIVS_E || DIVQ_E)); 

GTECH_MUX2 cin_sel(.A(Cin0), .B(Cin1), .S(X15), .Z(Cin)); 

`endif 


assign selAX = (Xop_E[2:1] == 2'b00); 

assign selAY = (~Yop_E[1]); 

assign selAF = (Yop_E[1:0] == 2'b10); 

assign selCT = (~({CC_E[1:0], BO_E[1:0]} == 4'b0000)) & condAM_E; 

/*------------------------------------------------------*/ 
 
 
 
 
 
 
/*------------------------------------------------------*/ 
reg K, L, ADD; 

wire [3:0] AMF_E_temp = AMF_E[3:0]; 
always @(AMF_E_temp) begin 
case ( AMF_E_temp ) 
4'b1100 : {K, L, ADD} = 3'b000; 
4'b1101 : {K, L, ADD} = 3'b010; 
4'b1110 : {K, L, ADD} = 3'b110; 
default : {K, L, ADD} = 3'b111; 
endcase 
end 

assign ASin = X15; 

/*------------------------------------------------------*/ 
 
 
/*------------------------------------------------------*/ 

assign AQin = DIVS_E ? (X15 ^ Y15) : (X15 ^ ALU[15]); 

/*------------------------------------------------------*/ 
 
 
/*------------------------------------------------------*/ 

assign ACin = ADD && cout; 
assign AVin = ADD && (!ovf_); 

/*------------------------------------------------------*/ 
 
 
/*------------------------------------------------------*/ 

assign ANin = (ALU[15] ^ (satAR && AVin)); 

assign AZin = (ALU[15:0] == 16'h0000); 

assign qin = DIVS_E ? AQin : ~AQin; 

endmodule 


