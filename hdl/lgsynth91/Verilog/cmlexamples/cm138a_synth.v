// IWLS benchmark module "CM138" printed on Wed May 29 16:31:28 2002
module CM138(a, b, c, d, e, f, g, h, i, j, k, l, m, n);
input
  a,
  b,
  c,
  d,
  e,
  f;
output
  g,
  h,
  i,
  j,
  k,
  l,
  m,
  n;
wire
  \[7] ,
  \[8] ,
  \[9] ,
  \[0] ,
  \[1] ,
  j0,
  \[2] ,
  \[3] ,
  \[4] ,
  \[5] ,
  \[6] ;
assign
  \[7]  = \[9]  | (~c | ~b),
  \[8]  = j0 | a,
  \[9]  = j0 | ~a,
  \[0]  = \[8]  | (c | b),
  \[1]  = \[9]  | (c | b),
  g = \[0] ,
  h = \[1] ,
  i = \[2] ,
  j = \[3] ,
  k = \[4] ,
  l = \[5] ,
  m = \[6] ,
  n = \[7] ,
  j0 = ~d | (e | f),
  \[2]  = \[8]  | (c | ~b),
  \[3]  = \[9]  | (c | ~b),
  \[4]  = \[8]  | (~c | b),
  \[5]  = \[9]  | (~c | b),
  \[6]  = \[8]  | (~c | ~b);
endmodule

