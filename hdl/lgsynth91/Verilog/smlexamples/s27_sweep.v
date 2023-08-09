// IWLS benchmark module "s27.bench" printed on Wed May 29 21:27:57 2002
module \s27.bench (G0, G1, G2, G3, G17);
input
  G1,
  G2,
  G3,
  G0;
output
  G17;
reg
  G5,
  G6,
  G7;
wire
  \[6] ,
  G8,
  G9,
  \[3] ,
  \[4] ,
  G10,
  G11,
  G12,
  G13,
  G15,
  G16,
  \[5] ;
assign
  \[6]  = G13,
  G8 = G6 & ~G0,
  G9 = ~G15 | ~G16,
  \[3]  = ~G11,
  \[4]  = G10,
  G10 = ~G11 & G0,
  G11 = ~G9 & ~G5,
  G12 = ~G7 & ~G1,
  G13 = ~G12 & ~G2,
  G15 = G8 | G12,
  G16 = G8 | G3,
  G17 = \[3] ,
  \[5]  = G11;
always begin
  G5 = \[4] ;
  G6 = \[5] ;
  G7 = \[6] ;
end
initial begin
  G5 = 0;
  G6 = 0;
  G7 = 0;
end
endmodule

