// IWLS benchmark module "C17.iscas" printed on Wed May 29 16:27:48 2002
module \C17.iscas (\1GAT(0) , \2GAT(1) , \3GAT(2) , \6GAT(3) , \7GAT(4) , \22GAT(10) , \23GAT(9) );
input
  \2GAT(1) ,
  \7GAT(4) ,
  \3GAT(2) ,
  \1GAT(0) ,
  \6GAT(3) ;
output
  \22GAT(10) ,
  \23GAT(9) ;
wire
  \19GAT(7) ,
  \10GAT(6) ,
  \11GAT(5) ,
  \[0] ,
  \16GAT(8) ,
  \[1] ;
assign
  \22GAT(10)  = \[0] ,
  \19GAT(7)  = ~\7GAT(4)  | ~\11GAT(5) ,
  \23GAT(9)  = \[1] ,
  \10GAT(6)  = ~\3GAT(2)  | ~\1GAT(0) ,
  \11GAT(5)  = ~\6GAT(3)  | ~\3GAT(2) ,
  \[0]  = ~\16GAT(8)  | ~\10GAT(6) ,
  \16GAT(8)  = ~\11GAT(5)  | ~\2GAT(1) ,
  \[1]  = ~\19GAT(7)  | ~\16GAT(8) ;
endmodule

