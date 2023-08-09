// IWLS benchmark module "mux_cl" printed on Wed May 29 16:31:28 2002
module mux_cl(a, b, c, d, e, f, g, h, i, j, k, l);
input
  a,
  b,
  c,
  d,
  e,
  f,
  g,
  h,
  i,
  j,
  k;
output
  l;
wire
  \[0] ;
assign
  l = \[0] ,
  \[0]  = (~k & (~j & (~i & a))) | ((~k & (~j & (i & b))) | ((~k & (j & (~i & c))) | ((~k & (j & (i & d))) | ((k & (~j & (~i & e))) | ((k & (~j & (i & f))) | ((k & (j & (~i & g))) | (k & (j & (i & h)))))))));
endmodule

