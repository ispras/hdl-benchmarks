module bitwise_or_3_7s(a, b, c);
  input [2:0] a;
  input signed [6:0] b;
  output [6:0] c;
  assign c = a | b;
endmodule
