module mcsa6 

































( 

COUT, C, S, 

A, CIN 
); 

input [5:0] A; 
input [2:0] CIN; 

output [2:0] COUT; 
output C; 
output S; 

wire S00; 
wire S01; 
wire S1; 


























mfa mfa00 ( 
.P (A[5]), 
.Q (A[4]), 
.R (A[3]), 
.S (S00), 
.C (COUT[0]) 
); 

mfa mfa01 ( 
.P (A[2]), 
.Q (A[1]), 
.R (A[0]), 
.S (S01), 
.C (COUT[1]) 
); 

mfa mfa1 ( 
.P (CIN[0]), 
.Q (S00), 
.R (CIN[1]), 
.S (S1), 
.C (COUT[2]) 
); 

mfa mfa2 ( 
.P (CIN[2]), 
.Q (S1), 
.R (S01), 
.S (S), 
.C (C) 
); 

endmodule 
