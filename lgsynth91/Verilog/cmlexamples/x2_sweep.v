// IWLS benchmark module "x2" printed on Wed May 29 17:30:37 2002
module x2(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q);
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
  j;
output
  k,
  l,
  m,
  n,
  o,
  p,
  q;
wire
  f0,
  g0,
  h0,
  \[0] ,
  i0,
  \[1] ,
  j0,
  \[2] ,
  \[3] ,
  \[4] ,
  \[5] ,
  \[6] ;
assign
  f0 = i & ~h,
  g0 = j & (~i & h),
  h0 = j & (i & (~h & f)),
  \[0]  = (~j & ~i) | (i0 | (j0 | (f0 | g0))),
  i0 = j & ~h,
  \[1]  = (~j & h) | (i0 | (j0 | f0)),
  k = \[0] ,
  l = \[1] ,
  m = \[2] ,
  n = \[3] ,
  o = \[4] ,
  p = \[5] ,
  q = \[6] ,
  j0 = j & i,
  \[2]  = ~j & (~i & ~h),
  \[3]  = (~j & h) | (b | (a | (c | (i0 | (j0 | (g0 | \[2] )))))),
  \[4]  = ~g | (i0 | (j0 | (f0 | \[2] ))),
  \[5]  = (h & (c & (~b & (~a & (j & i))))) | ((~h & (c & (~b & (~a & ~i)))) | ((~e & (d & (h & ~j))) | ((~j & ~i) | (~g | h0)))),
  \[6]  = (i & (e & (d & (~j & h)))) | ((j & (h & (~c & (~b & ~a)))) | (~g | (g0 | (\[2]  | h0))));
endmodule

