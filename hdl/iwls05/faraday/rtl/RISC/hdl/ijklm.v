

module lmi_align(BE, SX, DI, DO); 






input SX; 
input [3:0] BE; 
input [31:0] DI; 
output [31:0] DO; 














reg [1:0] SGN_SEL; 

always @ (BE) 
casex (BE) 
4'b000x: SGN_SEL = 2'b00; 
4'b001x: SGN_SEL = 2'b01; 
4'b01xx: SGN_SEL = 2'b10; 
4'b1xxx: SGN_SEL = 2'b11; 
endcase 

reg SGN; 

always @(SGN_SEL or DI) 
case (SGN_SEL) 


(2'b00) : SGN = DI[ 7]; 
(2'b01) : SGN = DI[15]; 
(2'b10) : SGN = DI[23]; 
(2'b11) : SGN = DI[31]; 
endcase 



wire SF3 = SGN & SX; 
wire SF2 = SGN & SX; 
wire SF1 = SGN & SX; 





reg [7:0] DA3; 
reg [7:0] DA2; 
reg [7:0] DA1; 
reg [7:0] DA0; 

reg [7:0] DB1; 
reg [7:0] DB0; 

wire HFILL = ~&BE; 
wire HSHIFT = ~BE[1] & ~BE[0]; 
wire BFILL = ^BE; 
wire BSHIFT = ~BE[2] & ~BE[0]; 

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


