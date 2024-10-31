




module lmi_lbc_align( 

DO, 

SXI, SZI, OFFSETI, DI 
); 

input SXI; 
input [1:0] SZI; 
input [1:0] OFFSETI; 
input [31:0] DI; 
output [31:0] DO; 







reg SGN; 
reg HFILL; 
reg HSHIFT; 
reg BFILL; 
reg BSHIFT; 




always @ (OFFSETI or SZI or DI) 
casex ({OFFSETI,SZI}) 

4'b1100: begin SGN = DI[7]; HFILL = 1'b1; HSHIFT = 1'b0; BFILL = 1'b1; BSHIFT = 1'b0; end 
4'b1000: begin SGN = DI[15]; HFILL = 1'b1; HSHIFT = 1'b0; BFILL = 1'b1; BSHIFT = 1'b1; end 
4'b0100: begin SGN = DI[23]; HFILL = 1'b1; HSHIFT = 1'b1; BFILL = 1'b1; BSHIFT = 1'b0; end 
4'b0000: begin SGN = DI[31]; HFILL = 1'b1; HSHIFT = 1'b1; BFILL = 1'b1; BSHIFT = 1'b1; end 
4'b1001: begin SGN = DI[15]; HFILL = 1'b1; HSHIFT = 1'b0; BFILL = 1'b0; BSHIFT = 1'b0; end 
4'b0001: begin SGN = DI[31]; HFILL = 1'b1; HSHIFT = 1'b1; BFILL = 1'b0; BSHIFT = 1'b0; end 
4'b0011: begin SGN = 1'bx; HFILL = 1'b0; HSHIFT = 1'b0; BFILL = 1'b0; BSHIFT = 1'b0; end 

4'b1101: begin SGN = 1'bx; HFILL = 1'bx; HSHIFT = 1'bx; BFILL = 1'bx; BSHIFT = 1'bx; end 
4'b0101: begin SGN = 1'bx; HFILL = 1'bx; HSHIFT = 1'bx; BFILL = 1'bx; BSHIFT = 1'bx; end 
4'b1110: begin SGN = 1'bx; HFILL = 1'bx; HSHIFT = 1'bx; BFILL = 1'bx; BSHIFT = 1'bx; end 
4'b1010: begin SGN = 1'bx; HFILL = 1'bx; HSHIFT = 1'bx; BFILL = 1'bx; BSHIFT = 1'bx; end 
4'b0110: begin SGN = 1'bx; HFILL = 1'bx; HSHIFT = 1'bx; BFILL = 1'bx; BSHIFT = 1'bx; end 
4'b0010: begin SGN = 1'bx; HFILL = 1'bx; HSHIFT = 1'bx; BFILL = 1'bx; BSHIFT = 1'bx; end 
4'b1111: begin SGN = 1'bx; HFILL = 1'bx; HSHIFT = 1'bx; BFILL = 1'bx; BSHIFT = 1'bx; end 
4'b1011: begin SGN = 1'bx; HFILL = 1'bx; HSHIFT = 1'bx; BFILL = 1'bx; BSHIFT = 1'bx; end 
4'b0111: begin SGN = 1'bx; HFILL = 1'bx; HSHIFT = 1'bx; BFILL = 1'bx; BSHIFT = 1'bx; end 

endcase 



wire SF3 = SGN & SXI; 
wire SF2 = SGN & SXI; 
wire SF1 = SGN & SXI; 





reg [7:0] DA3; 
reg [7:0] DA2; 
reg [7:0] DA1; 
reg [7:0] DA0; 

reg [7:0] DB1; 
reg [7:0] DB0; 

always @ (SF3 or SF2 or SF1 or HFILL or HSHIFT or BFILL or BSHIFT or DI) begin 

case (HFILL) 
1'b1: DA3 = {8{SF3}}; 
1'b0: DA3 = DI[31:24]; 
endcase 
case (HFILL) 
1'b1: DA2 = {8{SF2}}; 
1'b0: DA2 = DI[23:16]; 
endcase 
case (HSHIFT) 
1'b1: DA1 = DI[31:24]; 
1'b0: DA1 = DI[15: 8]; 
endcase 
case (HSHIFT) 
1'b1: DA0 = DI[23:16]; 
1'b0: DA0 = DI[ 7: 0]; 
endcase 

case (BFILL) 
1'b1: DB1 = {8{SF1}}; 
1'b0: DB1 = DA1; 
endcase 
case (BSHIFT) 
1'b1: DB0 = DA1; 
1'b0: DB0 = DA0; 
endcase 

end 

assign DO = { DA3, DA2, DB1, DB0 }; 

endmodule 



