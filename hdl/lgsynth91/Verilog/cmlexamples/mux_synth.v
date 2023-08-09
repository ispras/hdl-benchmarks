// IWLS benchmark module "mux" printed on Wed May 29 17:27:52 2002
module mux(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v);
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
  g0,
  \[0] ,
  \[1] ,
  \[2] ,
  \[3] ,
  \[4] ,
  b0;
assign
  e0 = (\[4]  & ~j) | ((\[3]  & ~k) | ((\[2]  & ~l) | (\[1]  & ~i))),
  f0 = (\[4]  & ~f) | ((\[3]  & ~g) | ((\[2]  & ~h) | (\[1]  & ~e))),
  g0 = (\[4]  & ~b) | ((\[3]  & ~c) | ((\[2]  & ~d) | (\[1]  & ~a))),
  \[0]  = (~g0 & (u & (r & q))) | ((~f0 & (u & (~r & q))) | ((~e0 & (u & (r & ~q))) | (~b0 & (u & (~r & ~q))))),
  \[1]  = t & s,
  \[2]  = ~t & ~s,
  v = \[0] ,
  \[3]  = t & ~s,
  \[4]  = ~t & s,
  b0 = (\[4]  & ~n) | ((\[3]  & ~o) | ((\[2]  & ~p) | (\[1]  & ~m)));
endmodule

