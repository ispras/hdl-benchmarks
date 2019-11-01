
module EEPROM ( A[17:0], IO[7:0], CEn, OEn, WEn ); 

input [17:0] A; 
input OEn, CEn, WEn; 

inout [7:0] IO; 

reg [7:0] cells [262143:0]; 
reg [262143:0] Ai; 
reg [7:0] DO; 


assign IO = !(CEn || OEn) ? DO : 8'bz; 

always @( A[17:0] or OEn or CEn) 
if (!(OEn || CEn)) 
DO <= #25 cells[A]; 


always @(posedge WEn) 
if ((OEn == 1'b1) && (CEn == 1'b0)) 
cells[A] <= IO[7:0]; 


wire [7:0] mem0 = cells['h220]; 
wire [7:0] mem1 = cells['h221]; 
wire [7:0] mem2 = cells['h222]; 
wire [7:0] mem3 = cells['h200]; 
wire [7:0] mem4 = cells['h191]; 
wire [7:0] mem5 = cells['h192]; 


endmodule 









