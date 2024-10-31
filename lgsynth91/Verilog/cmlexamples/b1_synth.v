// IWLS benchmark module "b1" printed on Wed May 29 16:27:40 2002
module b1(a, b, c, d, e, f, g);
input
  a,
  b,
  c;
output
  d,
  e,
  f,
  g;
wire
  \[2] ,
  \[3] ,
  \[1] ;
assign
  \[2]  = (~\[1]  & (~c & b)) | (~\[1]  & (c & ~a)),
  d = c,
  e = \[1] ,
  f = \[2] ,
  g = \[3] ,
  \[3]  = ~c,
  \[1]  = (~b & a) | (b & ~a);
endmodule

