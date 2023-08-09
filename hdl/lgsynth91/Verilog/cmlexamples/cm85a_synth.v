// IWLS benchmark module "CM85" printed on Wed May 29 16:31:29 2002
module CM85(a, b, c, d, e, f, g, h, i, j, k, l, m, n);
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
  k;
output
  l,
  m,
  n;
wire
  \[2] ,
  f0,
  v0,
  h0,
  \[0] ,
  \[1] ;
assign
  \[2]  = (h0 & (~i & h)) | ((~f0 & (~g & f)) | ((~v0 & (~k & j)) | ((~e & (d & b)) | c))),
  f0 = (~e & d) | ((e & ~d) | ~b),
  l = \[0] ,
  m = \[1] ,
  n = \[2] ,
  v0 = (~i & h) | ((i & ~h) | ~h0),
  h0 = (~f0 & (~g & ~f)) | (~f0 & (g & f)),
  \[0]  = (h0 & (i & ~h)) | ((~f0 & (g & ~f)) | ((~v0 & (k & ~j)) | ((e & (~d & b)) | a))),
  \[1]  = (~v0 & (~k & ~j)) | (~v0 & (k & j));
endmodule

