module shl_2_2(a, b, c);
  input [1:0] a;
  input [1:0] b;
  output [4:0] c;
  assign c = a << b;
endmodule
