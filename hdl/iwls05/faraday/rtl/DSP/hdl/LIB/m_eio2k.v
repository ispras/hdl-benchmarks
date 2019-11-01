







module EIO2k (data[15:0], addr[10:0], cs_, we_, oe_); 

inout [15:0] data; 
input [10:0] addr; 
input cs_, 
we_, 
oe_; 

reg [15:0] cells[11'h7ff : 11'h0]; 

wire WR = cs_ | we_; 
wire OE = !(cs_ | oe_); 



initial begin : initialize 
integer i; 
for (i=11'h0; i<=11'h7ff; i=i+1) 
cells[i] = 16'h0; 
end 



always @(posedge WR) cells[addr] = data; 



assign data = OE ? cells[addr] : 16'hz; 


endmodule 

