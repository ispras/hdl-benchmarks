






module EDM8k (data[15:0], addr[12:0], cs_, we_, oe_); 

inout [15:0] data; 
input [12:0] addr; 
input cs_, 
we_, 
oe_; 

reg [15:0] cells[13'h1fff:13'h0]; 

wire WR = cs_ | we_; 
wire OE = !(cs_ | oe_); 



initial begin : initialize 
integer i; 
for (i=13'h0; i<=13'h1fff; i=i+1) 
cells[i] = 16'h0; 
end 



always @(posedge WR) cells[addr] = data; 



assign data = OE ? cells[addr] : 16'hz; 



wire [15:0] edm1000 = cells[13'h0bd0]; 
wire [15:0] edm1001 = cells[13'h0bd1]; 
wire [15:0] edm1002 = cells[13'h0bd2]; 
wire [15:0] edm1003 = cells[13'h0bd3]; 


endmodule 

