module mfa 

































(P, 
Q, 
R, 
C, 
S 
); 

input P; 
input Q; 
input R; 

output C; 
output S; 



assign S = ( P & Q & R) | 
(~P & ~Q & R) | 
(~P & Q & ~R) | 
( P & ~Q & ~R) ; 

assign C = (P & Q) | (P & R) | (Q & R); 

endmodule 
