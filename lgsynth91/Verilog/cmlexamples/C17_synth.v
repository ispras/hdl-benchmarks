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
  \[2] ,
  \[0] ,
  \[1] ;
assign
  \22GAT(10)  = \[0] ,
  \[2]  = ~\6GAT(3)  | ~\3GAT(2) ,
  \23GAT(9)  = \[1] ,
  \[0]  = (\[2]  & \2GAT(1) ) | (\3GAT(2)  & \1GAT(0) ),
  \[1]  = (\[2]  & \7GAT(4) ) | (\[2]  & \2GAT(1) );
endmodule

