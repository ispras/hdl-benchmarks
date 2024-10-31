






/*--------------------------------------------------------------*/ 
 
 
 
 
 
/*--------------------------------------------------------------*/ 

/*--------------------------------------------------------------*/ 
 
 
/*--------------------------------------------------------------*/ 

`define del 1 

module ES_EXP (/* IN */ 
SINdi, SB, DBE, HIX, LO, 
SS, AV, SHTop_E, SF_E, 
 
EXP, SSin, EXPGTSB); 

/*----------------------------------------------*/ 
 
/*----------------------------------------------*/ 
input [15:0] SINdi; 
input [4:0] SB; 
input DBE; 
input HIX, LO; 
input SS, AV; 
input SHTop_E; 
input [3:2] SF_E; 
/************************************************/ 
 
/************************************************/ 
output [5:0] EXP; 
output SSin; 
output EXPGTSB; 


/************************************************/ 
 
 
 
/************************************************/ 

wire egts; 

assign egts = (EXP[3:0] > SB[3:0]); 
assign #`del EXPGTSB = DBE && (((~EXP[4]) && SB[4]) || 
(( EXP[4] == SB[4] ) && egts)); 


/************************************************/ 
 
 
 
 
 
/************************************************/ 
wire LOin; 
wire CASEA, CASEB, CASEC; 
wire [13:0] TMP; 
wire [15:0] SIN; 

assign SIN[15:0] = SINdi[15:0] & {16{SHTop_E && (SF_E[3:2] == 2'b11)}}; 
assign SSin = ((AV && HIX) != SINdi[15]); 
assign LOin = LO && SHTop_E && (SF_E[3:2] == 2'b11); 
assign CASEA = AV && HIX && SHTop_E && (SF_E[3:2] == 2'b11); 
assign CASEB = (SS != SIN[15]) && LOin; 
assign CASEC = (SIN[15] != SIN[14]); 
assign TMP[13:0] = SIN[15] ? (~SIN[13:0]) : SIN[13:0]; 

reg [5:0] EXPin; 
wire [5:0] EXP; 
assign #`del EXP[5:0] = CASEA ? 6'b000001 : 
CASEB ? 6'b110001 : EXPin[5:0]; 

always @(CASEA or CASEB or CASEC or TMP or LOin) 
begin 
casex ({LOin, CASEC, TMP[13:0]}) 
/********************************************************/ 
 
/********************************************************/ 
16'b11xxxxxxxxxxxxxx : EXPin[5:0] = 6'b110000; 
16'b01xxxxxxxxxxxxxx : EXPin[5:0] = 6'b000000; 
16'b101xxxxxxxxxxxxx : EXPin[5:0] = 6'b101111; 
16'b1001xxxxxxxxxxxx : EXPin[5:0] = 6'b101110; 
16'b10001xxxxxxxxxxx : EXPin[5:0] = 6'b101101; 
16'b100001xxxxxxxxxx : EXPin[5:0] = 6'b101100; 
16'b1000001xxxxxxxxx : EXPin[5:0] = 6'b101011; 
16'b10000001xxxxxxxx : EXPin[5:0] = 6'b101010; 
16'b100000001xxxxxxx : EXPin[5:0] = 6'b101001; 
16'b1000000001xxxxxx : EXPin[5:0] = 6'b101000; 
16'b10000000001xxxxx : EXPin[5:0] = 6'b100111; 
16'b100000000001xxxx : EXPin[5:0] = 6'b100110; 
16'b1000000000001xxx : EXPin[5:0] = 6'b100101; 
16'b10000000000001xx : EXPin[5:0] = 6'b100100; 
16'b100000000000001x : EXPin[5:0] = 6'b100011; 
16'b1000000000000001 : EXPin[5:0] = 6'b100010; 
16'b1000000000000000 : EXPin[5:0] = 6'b100001; 
16'b001xxxxxxxxxxxxx : EXPin[5:0] = 6'b111111; 
16'b0001xxxxxxxxxxxx : EXPin[5:0] = 6'b111110; 
16'b00001xxxxxxxxxxx : EXPin[5:0] = 6'b111101; 
16'b000001xxxxxxxxxx : EXPin[5:0] = 6'b111100; 
16'b0000001xxxxxxxxx : EXPin[5:0] = 6'b111011; 
16'b00000001xxxxxxxx : EXPin[5:0] = 6'b111010; 
16'b000000001xxxxxxx : EXPin[5:0] = 6'b111001; 
16'b0000000001xxxxxx : EXPin[5:0] = 6'b111000; 
16'b00000000001xxxxx : EXPin[5:0] = 6'b110111; 
16'b000000000001xxxx : EXPin[5:0] = 6'b110110; 
16'b0000000000001xxx : EXPin[5:0] = 6'b110101; 
16'b00000000000001xx : EXPin[5:0] = 6'b110100; 
16'b000000000000001x : EXPin[5:0] = 6'b110011; 
16'b0000000000000001 : EXPin[5:0] = 6'b110010; 
16'b0000000000000000 : EXPin[5:0] = 6'b110001; 

endcase 
end 
endmodule 
