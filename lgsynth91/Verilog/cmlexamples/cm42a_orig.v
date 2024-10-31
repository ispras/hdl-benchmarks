// IWLS benchmark module "CM42" printed on Wed May 29 16:31:28 2002
module CM42(a, b, c, d, e, f, g, h, i, j, k, l, m, n);
input
  a,
  b,
  c,
  d;
output
  e,
  f,
  g,
  h,
  i,
  j,
  k,
  l,
  m,
  n;
wire
  o0,
  \[7] ,
  p0,
  \[8] ,
  \[9] ,
  \[0] ,
  \[1] ,
  \[2] ,
  \[3] ,
  \[4] ,
  \[5] ,
  n0,
  \[6] ;
assign
  o0 = ~d & ~c,
  \[7]  = ~p0 | (~b | ~a),
  p0 = ~d & ~o0,
  \[8]  = ~n0 | a,
  \[9]  = ~n0 | ~a,
  \[0]  = ~o0 | (b | a),
  \[1]  = ~o0 | (b | ~a),
  e = \[0] ,
  f = \[1] ,
  g = \[2] ,
  h = \[3] ,
  i = \[4] ,
  j = \[5] ,
  k = \[6] ,
  l = \[7] ,
  m = \[8] ,
  n = \[9] ,
  \[2]  = ~o0 | (~b | a),
  \[3]  = ~o0 | (~b | ~a),
  \[4]  = ~p0 | (b | a),
  \[5]  = ~p0 | (b | ~a),
  n0 = d & (~c & ~b),
  \[6]  = ~p0 | (~b | a);
endmodule

