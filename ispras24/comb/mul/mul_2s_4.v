module mul_2s_4(a, b, c);
  input signed [1:0] a;
  input [3:0] b;
  output [5:0] c;
  assign c = a * b;
endmodule
