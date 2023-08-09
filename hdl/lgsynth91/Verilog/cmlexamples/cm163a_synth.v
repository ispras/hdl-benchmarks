// IWLS benchmark module "CM163" printed on Wed May 29 16:31:28 2002
module CM163(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u);
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
  l,
  m,
  n,
  o,
  p;
output
  q,
  r,
  s,
  t,
  u;
wire
  \[7] ,
  \[8] ,
  g0,
  \[0] ,
  i0,
  \[1] ,
  j0,
  \[2] ,
  \[3] ,
  \[4] ,
  \[5] ,
  n0,
  \[6] ;
assign
  \[7]  = j0 | l,
  \[8]  = n0 | m,
  g0 = ~e,
  \[0]  = (~i0 & ~g0) | ((~e & ~a) | ~f),
  i0 = (~\[5]  & j) | (\[5]  & ~j),
  \[1]  = (~j0 & ~g0) | ((~e & ~b) | ~f),
  q = \[0] ,
  r = \[1] ,
  s = \[2] ,
  j0 = (~\[6]  & l) | (\[6]  & ~l),
  t = \[3] ,
  \[2]  = (~n0 & ~g0) | ((~g & ~e) | ~f),
  u = \[4] ,
  \[3]  = (~\[8]  & (~g0 & ~n)) | ((\[8]  & (~g0 & n)) | ((~h & ~e) | ~f)),
  \[4]  = p & (o & (k & (i & d))),
  \[5]  = ~d | ~c,
  n0 = (~\[7]  & m) | (\[7]  & ~m),
  \[6]  = i0 | j;
endmodule

