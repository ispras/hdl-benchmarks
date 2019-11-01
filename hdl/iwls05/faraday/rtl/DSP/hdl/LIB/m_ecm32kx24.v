







module ECM32kx24 (data[23:0], addr[14:0], cs_, we_, oe_); 

inout [23:0] data; 
input [14:0] addr; 
input cs_, 
we_, 
oe_; 

parameter taa=10; 

reg [23:0] cells['h7fff:0]; 

wire WR = cs_ | we_; 
wire OE = !(cs_ | oe_); 


initial begin : initialize 
integer i; 
for (i=0; i<='h7fff; i=i+1) 
cells[i] = 24'h0; 
end 



always @(posedge WR) cells[addr] = data; 


assign #taa data = OE ? cells[addr] : 24'hz; 



wire [23:0] ecm000 = cells[0]; 
wire [23:0] ecm001 = cells[1]; 
wire [23:0] ecm002 = cells[2]; 
wire [23:0] ecm003 = cells[3]; 


endmodule 

