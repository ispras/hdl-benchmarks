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
  \[0]  = (h & (i & (j & k))) | ((g & (~i & (j & k))) | ((f & (i & (~j & k))) | ((e & (~i & (~j & k))) | ((d & (i & (j & ~k))) | ((c & (~i & (j & ~k))) | ((~i & (a & (~j & ~k))) | (i & (b & (~j & ~k)))))))));
endmodule

