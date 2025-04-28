module bitwise_or_3_7s_5(a, b, c);
  input [2:0] a;
  input signed [6:0] b;
  output [4:0] c;
  assign c = a | b;
endmodule
