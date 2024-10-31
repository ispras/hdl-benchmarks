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
  \[0] ,
  \[1] ,
  \[2] ,
  v0,
  \[3] ,
  m0;
assign
  \[0]  = l & (k & (j & (i & (h & (g & (f & (e & (d & (c & (b & a)))))))))),
  \[1]  = ~m0 | p,
  q = \[0] ,
  r = \[1] ,
  s = \[2] ,
  t = \[3] ,
  \[2]  = ~m0 | ~o,
  v0 = (~p & e) | ((o & ~n) | ((n & ~m) | ((m & ~l) | ((l & ~k) | ((k & ~j) | ((j & ~i) | (i & ~h))))))),
  \[3]  = ~p & (~o & (~n & (~m & (~l & (~k & (~j & (~i & (~h & (~g & (~f & ~e)))))))))),
  m0 = (~v0 & (~h & (~g & ~f))) | (~v0 & (g & (f & e)));
endmodule

