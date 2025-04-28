module arith_shr_4_2(a, b, c);
  input [3:0] a;
  input [1:0] b;
  output [3:0] c;
  assign c = a >>> b;
endmodule
