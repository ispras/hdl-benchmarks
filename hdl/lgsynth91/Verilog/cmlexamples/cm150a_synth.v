// IWLS benchmark module "CM150" printed on Wed May 29 16:31:28 2002
module CM150(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v);
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
  p,
  q,
  r,
  s,
  t,
  u;
output
  v;
wire
  e0,
  f0,
  \[0] ,
  \[1] ,
  \[2] ,
  \[3] ,
  \[4] ,
  m0,
  n0;
assign
  e0 = (\[4]  & b) | ((\[3]  & c) | ((\[2]  & a) | (\[1]  & d))),
  f0 = (\[4]  & f) | ((\[3]  & g) | ((\[2]  & e) | (\[1]  & h))),
  \[0]  = (~n0 & (t & s)) | ((~m0 & (t & ~s)) | ((~f0 & (~t & s)) | ((~e0 & (~t & ~s)) | u))),
  \[1]  = r & q,
  \[2]  = ~r & ~q,
  v = \[0] ,
  \[3]  = r & ~q,
  \[4]  = ~r & q,
  m0 = (\[4]  & j) | ((\[3]  & k) | ((\[2]  & i) | (\[1]  & l))),
  n0 = (\[4]  & n) | ((\[3]  & o) | ((\[2]  & m) | (\[1]  & p)));
endmodule

