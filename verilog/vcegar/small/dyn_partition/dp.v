module main (i, clock);
input i,clock;
reg [2:0]x,y;
reg b0, b1;

initial b0 = 0;
initial b1 = 0;
initial x = 0;
initial y = 0;

always @ (posedge clock) begin
  b0 <= ~b1;
  b1 <= b0;
  if (b0 == b1) begin
     x <= x + 1;
   end
  else begin
     y <= y + 1;
  end	   	   
end
endmodule
