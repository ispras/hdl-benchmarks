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
  \[0] ,
  \[1] ,
  j0,
  \[2] ,
  \[3] ,
  \[4] ,
  \[5] ,
  \[6] ;
assign
  \[7]  = j0 | (~c | (~b | ~a)),
  \[0]  = j0 | (c | (b | a)),
  \[1]  = j0 | (c | (b | ~a)),
  g = \[0] ,
  h = \[1] ,
  i = \[2] ,
  j = \[3] ,
  k = \[4] ,
  l = \[5] ,
  m = \[6] ,
  n = \[7] ,
  j0 = ~d | (e | f),
  \[2]  = j0 | (c | (~b | a)),
  \[3]  = j0 | (c | (~b | ~a)),
  \[4]  = j0 | (~c | (b | a)),
  \[5]  = j0 | (~c | (b | ~a)),
  \[6]  = j0 | (~c | (~b | a));
endmodule

