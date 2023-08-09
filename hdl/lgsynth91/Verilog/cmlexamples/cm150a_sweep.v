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
  c0,
  o0,
  e0,
  q0,
  f0,
  h0,
  \[0] ,
  i0,
  j0,
  z,
  k0,
  l0,
  a0,
  m0,
  b0,
  n0;
assign
  c0 = (~q & ~g) | ((q & ~h) | (~h & ~g)),
  o0 = (~n0 & ~m0) | ((~n0 & s) | (~m0 & ~s)),
  e0 = (~a0 & ~z) | ((~a0 & r) | (~z & ~r)),
  q0 = (~o0 & ~h0) | ((~o0 & t) | (~h0 & ~t)),
  f0 = (~c0 & ~b0) | ((~c0 & r) | (~b0 & ~r)),
  h0 = (~f0 & ~e0) | ((~f0 & s) | (~e0 & ~s)),
  \[0]  = u | ~q0,
  i0 = (~q & ~i) | ((q & ~j) | (~j & ~i)),
  j0 = (~q & ~k) | ((q & ~l) | (~l & ~k)),
  v = \[0] ,
  z = (~q & ~a) | ((q & ~b) | (~b & ~a)),
  k0 = (~q & ~m) | ((q & ~n) | (~n & ~m)),
  l0 = (~q & ~o) | ((q & ~p) | (~p & ~o)),
  a0 = (~q & ~c) | ((q & ~d) | (~d & ~c)),
  m0 = (~j0 & ~i0) | ((~j0 & r) | (~i0 & ~r)),
  b0 = (~q & ~e) | ((q & ~f) | (~f & ~e)),
  n0 = (~l0 & ~k0) | ((~l0 & r) | (~k0 & ~r));
endmodule

