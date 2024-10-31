// IWLS benchmark module "CM151" printed on Wed May 29 16:31:28 2002
module CM151(a, b, c, d, e, f, g, h, i, j, k, l, m, n);
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
  k,
  l;
output
  m,
  n;
wire
  \[6] ,
  \[7] ,
  \[0] ,
  \[1] ;
assign
  \[6]  = (~j & (~i & e)) | ((~j & (i & f)) | ((j & (~i & g)) | (j & (i & h)))),
  \[7]  = (~j & (~i & a)) | ((~j & (i & b)) | ((j & (~i & c)) | (j & (i & d)))),
  m = \[0] ,
  n = \[1] ,
  \[0]  = (\[7]  & (~l & ~k)) | (\[6]  & (~l & k)),
  \[1]  = ~\[0] ;
endmodule

