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
  \[0] ,
  h;
assign
  \[0]  = ~h,
  f = \[0] ,
  h = (~e & (~c & ~d)) | ((~e & (~b & ~d)) | ((~e & (~a & ~d)) | ((~c & (~b & ~d)) | ((~c & (~a & ~d)) | (~b & (~a & ~d))))));
endmodule

