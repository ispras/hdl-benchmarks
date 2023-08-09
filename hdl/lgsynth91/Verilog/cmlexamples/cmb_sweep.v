// IWLS benchmark module "cmb" printed on Wed May 29 16:31:29 2002
module cmb(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t);
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
  t;
wire
  o0,
  p0,
  q0,
  r0,
  s0,
  \[0] ,
  t0,
  \[1] ,
  u0,
  \[2] ,
  v0,
  \[3] ,
  m0,
  n0;
assign
  o0 = f & (g & (h & i)),
  p0 = ~o0 | (~n0 | (~a | ~b)),
  q0 = ~g & (~h & ~i),
  r0 = ~j & (~k & (~l & ~m)),
  s0 = ~r0 | (~q0 | (e | f)),
  \[0]  = ~p0 & (j & (k & l)),
  t0 = (~p & e) | ((o & ~n) | ((n & ~m) | (m & ~l))),
  \[1]  = ~m0 | p,
  u0 = (~t0 & k) | (~t0 & ~l),
  q = \[0] ,
  r = \[1] ,
  s = \[2] ,
  t = \[3] ,
  \[2]  = ~m0 | ~o,
  v0 = (k & ~j) | ((j & ~i) | ((i & ~h) | ~u0)),
  \[3]  = ~s0 & (~n & (~o & ~p)),
  m0 = (~v0 & (~h & (~g & ~f))) | ((~v0 & (~h & (~g & e))) | ((~v0 & (~h & (f & e))) | (~v0 & (g & (f & e))))),
  n0 = c & (d & e);
endmodule

