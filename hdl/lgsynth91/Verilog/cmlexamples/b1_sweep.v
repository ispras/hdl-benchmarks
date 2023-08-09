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
  n,
  \[3] ,
  p,
  \[1] ;
assign
  \[2]  = ~p,
  d = c,
  e = \[1] ,
  f = \[2] ,
  g = \[3] ,
  n = (~b & ~a) | (b & a),
  \[3]  = ~c,
  p = (~c & ~b) | ((~c & ~a) | ((c & b) | ((c & a) | ((~b & a) | (b & ~a))))),
  \[1]  = ~n;
endmodule

