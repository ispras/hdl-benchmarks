module logical_xor_1_1_2(a, b, c);
  input a;
  input b;
  output [1:0] c;
  assign c = a ^^ b;
endmodule
