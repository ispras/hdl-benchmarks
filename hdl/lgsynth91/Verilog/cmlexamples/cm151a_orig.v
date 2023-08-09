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
  \[0] ,
  \[1] ,
  t,
  u,
  v,
  w,
  y,
  z,
  b0;
assign
  \[0]  = ~l & ~b0,
  \[1]  = ~\[0] ,
  m = \[0] ,
  n = \[1] ,
  t = (~i & ~a) | ((i & ~b) | (~b & ~a)),
  u = (~i & ~c) | ((i & ~d) | (~d & ~c)),
  v = (~i & ~e) | ((i & ~f) | (~f & ~e)),
  w = (~i & ~g) | ((i & ~h) | (~h & ~g)),
  y = (~u & ~t) | ((~u & j) | (~t & ~j)),
  z = (~w & ~v) | ((~w & j) | (~v & ~j)),
  b0 = (~z & ~y) | ((~z & k) | (~y & ~k));
endmodule

