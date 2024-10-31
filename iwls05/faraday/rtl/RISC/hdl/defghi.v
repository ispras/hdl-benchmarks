
module mux32 





































(EN1, DIS1, DIS2, IN, THRU, OUT); 







input EN1; 
input DIS1; 
input DIS2; 
input [31:0] IN; 
input [31:0] THRU; 
output [31:0] OUT; 

wire enable; 

assign enable = ~(DIS2 | DIS1 | ~EN1); 
assign OUT = enable ? IN : THRU; 

endmodule 

