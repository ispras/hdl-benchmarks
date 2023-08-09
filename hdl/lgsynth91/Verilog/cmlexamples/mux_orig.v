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
  j0,
  b0;
assign
  e0 = (~l & (~k & (~j & ~i))) | ((~t & (~s & ~l)) | ((~t & (s & ~j)) | ((~t & (~l & ~j)) | ((t & (~s & ~k)) | ((t & (s & ~i)) | ((t & (~k & ~i)) | ((~s & (~l & ~k)) | (s & (~j & ~i))))))))),
  f0 = (~h & (~g & (~f & ~e))) | ((~t & (~s & ~h)) | ((~t & (s & ~f)) | ((~t & (~h & ~f)) | ((t & (~s & ~g)) | ((t & (s & ~e)) | ((t & (~g & ~e)) | ((~s & (~h & ~g)) | (s & (~f & ~e))))))))),
  g0 = (~d & (~c & (~b & ~a))) | ((~t & (~s & ~d)) | ((~t & (s & ~b)) | ((~t & (~d & ~b)) | ((t & (~s & ~c)) | ((t & (s & ~a)) | ((t & (~c & ~a)) | ((~s & (~d & ~c)) | (s & (~b & ~a))))))))),
  \[0]  = j0 & u,
  j0 = (~g0 & (~f0 & (~e0 & ~b0))) | ((~g0 & (~f0 & q)) | ((~g0 & (~e0 & r)) | ((~g0 & (r & q)) | ((~f0 & (~b0 & ~r)) | ((~f0 & (~r & q)) | ((~e0 & (~b0 & ~q)) | ((~e0 & (r & ~q)) | (~b0 & (~r & ~q))))))))),
  v = \[0] ,
  b0 = (~p & (~o & (~n & ~m))) | ((~t & (~s & ~p)) | ((~t & (s & ~n)) | ((~t & (~p & ~n)) | ((t & (~s & ~o)) | ((t & (s & ~m)) | ((t & (~o & ~m)) | ((~s & (~p & ~o)) | (s & (~n & ~m)))))))));
endmodule

