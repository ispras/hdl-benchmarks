// IWLS benchmark module "CM82" printed on Wed May 29 16:31:28 2002
module CM82(a, b, c, d, e, f, g, h);
input
  a,
  b,
  c,
  d,
  e;
output
  f,
  g,
  h;
wire
  \[2] ,
  o,
  r,
  s,
  \[0] ,
  \[1] ;
assign
  \[2]  = (e & d) | ((e & ~o) | (d & ~o)),
  f = \[0] ,
  g = \[1] ,
  h = \[2] ,
  o = (~c & ~b) | ((~c & ~a) | (~b & ~a)),
  r = (~e & d) | (e & ~d),
  s = (~c & b) | (c & ~b),
  \[0]  = (~s & a) | (s & ~a),
  \[1]  = (~r & ~o) | (r & o);
endmodule

