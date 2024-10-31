






/*--------------------------------------------------------------*/ 
 
 
/*--------------------------------------------------------------*/ 

/*--------------------------------------------------------------*/ 
 
 
/*--------------------------------------------------------------*/ 

`define del 1 

module ES_DEC(/* IN */ 
GO_C, EX_en, EX_enc, EXPGTSB, SEf1, 
SHADOW, SF_E, MTSI_E, MTSB_E, MTSE_E, updSR0_Eg, 
updSR1_Eg, SIN15, AC, AV, SHTop_E, MTSR0_E, MTSR1_E, updSR_E, 
 
updateSIr, updateSIs, updateSBr, updateSBs, updateSEr, 
updateSEs, updateSR0r, updateSR0s, updateSR1r, updateSR1s, 
updateSS, DBE, HIX, LO, XI, NORM); 

/*--------------------------------------*/ 
 
/*--------------------------------------*/ 
input GO_C, EX_en , EX_enc; 
input EXPGTSB, SEf1, SHADOW; 
input [3:0] SF_E; 
input MTSI_E, MTSB_E, MTSE_E, updSR0_Eg; 
input updSR1_Eg, SIN15, AC, AV; 
input SHTop_E, MTSR0_E, MTSR1_E; 
input updSR_E; 

/*--------------------------------------*/ 
 
/*--------------------------------------*/ 
output updateSIr, updateSIs, updateSBr, updateSBs; 
output updateSEr, updateSEs, updateSR0r, updateSR0s; 
output updateSR1r, updateSR1s, updateSS; 
output DBE, HIX, LO, XI, NORM; 

/*------------------------------------------------------*/ 
 
 
 
/*------------------------------------------------------*/ 
wire updateSHT, updateSB, updateSE; 

assign updateSHT = SHTop_E & EX_enc; 

assign #`del updateSB = updateSHT & DBE & EXPGTSB; 

assign #`del updateSE = updateSHT & ((SF_E[3:1] == 3'b110) 
| ((SF_E[3:0] == 4'b1110) & SEf1)); 

assign #`del updateSS = updateSHT && (SF_E[3:1] == 3'b110); 

/*------------------------------------------------------*/ 
 
 
/*------------------------------------------------------*/ 
wire updateSIr, updateSIs, updateSBr, updateSBs; 
wire updateSEr, updateSEs, updateSR0r, updateSR0s; 
wire updateSR1r, updateSR1s; 

assign updateSIr = !SHADOW && MTSI_E && EX_en; 
assign updateSIs = SHADOW && MTSI_E && EX_en; 


assign updateSBr = !SHADOW && (MTSB_E && EX_en || updateSB) && GO_C; 
assign updateSBs = SHADOW && (MTSB_E && EX_en || updateSB) && GO_C; 

assign updateSEr = !SHADOW && (MTSE_E || (SHTop_E && 
((SF_E[3:1] == 3'b110) || ((SF_E[3:0] == 4'b1110) && SEf1)))); 
assign updateSEs = SHADOW && (MTSE_E || (SHTop_E && 
((SF_E[3:1] == 3'b110) || ((SF_E[3:0] == 4'b1110) && SEf1)))); 
assign updateSR0r = !SHADOW && (MTSR0_E || updSR_E); 
assign updateSR0s = SHADOW && (MTSR0_E || updSR_E); 
assign updateSR1r = !SHADOW && (MTSR1_E || updSR_E); 
assign updateSR1s = SHADOW && (MTSR1_E || updSR_E); 

/*--------------------------------------*/ 
 
 
/*--------------------------------------*/ 

assign HIX = (SF_E[1:0] == 2'b01); 
assign LO = (SF_E[1:0] == 2'b10); 

/*--------------------------------------*/ 
 
 
 
/*--------------------------------------*/ 

wire ASHIFT; 

assign #`del DBE = (SF_E[3:0] == 4'hf) ; 
assign #`del NORM = (SF_E[3:2] == 2'b10); 
assign #`del ASHIFT = (SF_E[3:2] == 2'b01); 

/****************************************/ 
 
 
 
 
 
 
 
 
/****************************************/ 

assign XI = (SIN15 && ASHIFT) || 
(AC && AV && NORM && (~SF_E[1])); 

endmodule 

