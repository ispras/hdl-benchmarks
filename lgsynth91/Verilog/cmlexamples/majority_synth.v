// IWLS benchmark module "traffic_cl" printed on Wed May 29 17:27:52 2002
module traffic_cl(a, b, c, d, e, f);
input
  a,
  b,
  c,
  d,
  e;
output
  f;
wire
  \[0] ;
assign
  \[0]  = (e & (c & b)) | ((e & (c & a)) | ((e & (b & a)) | ((c & (b & a)) | d))),
  f = \[0] ;
endmodule

