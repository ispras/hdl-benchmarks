






module EM4K (data[15:0], addr[11:0], cs_, we_, oe_); 

inout [15:0] data; 
input [11:0] addr; 
input cs_, 
we_, 
oe_; 

reg [15:0] cells[14'h0fff:14'h0]; 

wire WR = cs_ | we_; 
wire OE = !(cs_ | oe_); 



initial begin : initialize 
integer i; 
for (i=14'h0; i<=14'hfff; i=i+1) 
cells[i] = 16'h0; 
end 



always @(posedge WR) cells[addr] = data; 



assign data = OE ? cells[addr] : 16'hz; 



wire [15:0] epm0 = cells[14'h30]; 
wire [15:0] epm1 = cells[14'h31]; 
wire [15:0] epm2 = cells[14'h32]; 
wire [15:0] epm3 = cells[14'h33]; 


endmodule 

