module mpcs50
( 

C, S, 

A0, A1, A2 
); 

input [49:0] A0; 
input [49:0] A1; 
input [49:0] A2; 

output [49:0] S; 
output [48:0] C; 


wire DUMMY; 



mfa mfa00 ( 
.S (S [00]), 
.C (C [00]), 
.P (A2[00]), 
.Q (A1[00]), 
.R (A0[00]) 
); 

mfa mfa01 ( 
.S (S [01]), 
.C (C [01]), 
.P (A2[01]), 
.Q (A1[01]), 
.R (A0[01]) 
); 

mfa mfa02 ( 
.S (S [02]), 
.C (C [02]), 
.P (A2[02]), 
.Q (A1[02]), 
.R (A0[02]) 
); 

mfa mfa03 ( 
.S (S [03]), 
.C (C [03]), 
.P (A2[03]), 
.Q (A1[03]), 
.R (A0[03]) 
); 

mfa mfa04 ( 
.S (S [04]), 
.C (C [04]), 
.P (A2[04]), 
.Q (A1[04]), 
.R (A0[04]) 
); 

mfa mfa05 ( 
.S (S [05]), 
.C (C [05]), 
.P (A2[05]), 
.Q (A1[05]), 
.R (A0[05]) 
); 

mfa mfa06 ( 
.S (S [06]), 
.C (C [06]), 
.P (A2[06]), 
.Q (A1[06]), 
.R (A0[06]) 
); 

mfa mfa07 ( 
.S (S [07]), 
.C (C [07]), 
.P (A2[07]), 
.Q (A1[07]), 
.R (A0[07]) 
); 

mfa mfa08 ( 
.S (S [08]), 
.C (C [08]), 
.P (A2[08]), 
.Q (A1[08]), 
.R (A0[08]) 
); 

mfa mfa09 ( 
.S (S [09]), 
.C (C [09]), 
.P (A2[09]), 
.Q (A1[09]), 
.R (A0[09]) 
); 

mfa mfa10 ( 
.S (S [10]), 
.C (C [10]), 
.P (A2[10]), 
.Q (A1[10]), 
.R (A0[10]) 
); 

mfa mfa11 ( 
.S (S [11]), 
.C (C [11]), 
.P (A2[11]), 
.Q (A1[11]), 
.R (A0[11]) 
); 

mfa mfa12 ( 
.S (S [12]), 
.C (C [12]), 
.P (A2[12]), 
.Q (A1[12]), 
.R (A0[12]) 
); 

mfa mfa13 ( 
.S (S [13]), 
.C (C [13]), 
.P (A2[13]), 
.Q (A1[13]), 
.R (A0[13]) 
); 

mfa mfa14 ( 
.S (S [14]), 
.C (C [14]), 
.P (A2[14]), 
.Q (A1[14]), 
.R (A0[14]) 
); 

mfa mfa15 ( 
.S (S [15]), 
.C (C [15]), 
.P (A2[15]), 
.Q (A1[15]), 
.R (A0[15]) 
); 

mfa mfa16 ( 
.S (S [16]), 
.C (C [16]), 
.P (A2[16]), 
.Q (A1[16]), 
.R (A0[16]) 
); 

mfa mfa17 ( 
.S (S [17]), 
.C (C [17]), 
.P (A2[17]), 
.Q (A1[17]), 
.R (A0[17]) 
); 

mfa mfa18 ( 
.S (S [18]), 
.C (C [18]), 
.P (A2[18]), 
.Q (A1[18]), 
.R (A0[18]) 
); 

mfa mfa19 ( 
.S (S [19]), 
.C (C [19]), 
.P (A2[19]), 
.Q (A1[19]), 
.R (A0[19]) 
); 

mfa mfa20 ( 
.S (S [20]), 
.C (C [20]), 
.P (A2[20]), 
.Q (A1[20]), 
.R (A0[20]) 
); 

mfa mfa21 ( 
.S (S [21]), 
.C (C [21]), 
.P (A2[21]), 
.Q (A1[21]), 
.R (A0[21]) 
); 

mfa mfa22 ( 
.S (S [22]), 
.C (C [22]), 
.P (A2[22]), 
.Q (A1[22]), 
.R (A0[22]) 
); 

mfa mfa23 ( 
.S (S [23]), 
.C (C [23]), 
.P (A2[23]), 
.Q (A1[23]), 
.R (A0[23]) 
); 

mfa mfa24 ( 
.S (S [24]), 
.C (C [24]), 
.P (A2[24]), 
.Q (A1[24]), 
.R (A0[24]) 
); 

mfa mfa25 ( 
.S (S [25]), 
.C (C [25]), 
.P (A2[25]), 
.Q (A1[25]), 
.R (A0[25]) 
); 

mfa mfa26 ( 
.S (S [26]), 
.C (C [26]), 
.P (A2[26]), 
.Q (A1[26]), 
.R (A0[26]) 
); 

mfa mfa27 ( 
.S (S [27]), 
.C (C [27]), 
.P (A2[27]), 
.Q (A1[27]), 
.R (A0[27]) 
); 

mfa mfa28 ( 
.S (S [28]), 
.C (C [28]), 
.P (A2[28]), 
.Q (A1[28]), 
.R (A0[28]) 
); 

mfa mfa29 ( 
.S (S [29]), 
.C (C [29]), 
.P (A2[29]), 
.Q (A1[29]), 
.R (A0[29]) 
); 

mfa mfa30 ( 
.S (S [30]), 
.C (C [30]), 
.P (A2[30]), 
.Q (A1[30]), 
.R (A0[30]) 
); 

mfa mfa31 ( 
.S (S [31]), 
.C (C [31]), 
.P (A2[31]), 
.Q (A1[31]), 
.R (A0[31]) 
); 

mfa mfa32 ( 
.S (S [32]), 
.C (C [32]), 
.P (A2[32]), 
.Q (A1[32]), 
.R (A0[32]) 
); 

mfa mfa33 ( 
.S (S [33]), 
.C (C [33]), 
.P (A2[33]), 
.Q (A1[33]), 
.R (A0[33]) 
); 

mfa mfa34 ( 
.S (S [34]), 
.C (C [34]), 
.P (A2[34]), 
.Q (A1[34]), 
.R (A0[34]) 
); 

mfa mfa35 ( 
.S (S [35]), 
.C (C [35]), 
.P (A2[35]), 
.Q (A1[35]), 
.R (A0[35]) 
); 

mfa mfa36 ( 
.S (S [36]), 
.C (C [36]), 
.P (A2[36]), 
.Q (A1[36]), 
.R (A0[36]) 
); 

mfa mfa37 ( 
.S (S [37]), 
.C (C [37]), 
.P (A2[37]), 
.Q (A1[37]), 
.R (A0[37]) 
); 

mfa mfa38 ( 
.S (S [38]), 
.C (C [38]), 
.P (A2[38]), 
.Q (A1[38]), 
.R (A0[38]) 
); 

mfa mfa39 ( 
.S (S [39]), 
.C (C [39]), 
.P (A2[39]), 
.Q (A1[39]), 
.R (A0[39]) 
); 

mfa mfa40 ( 
.S (S [40]), 
.C (C [40]), 
.P (A2[40]), 
.Q (A1[40]), 
.R (A0[40]) 
); 

mfa mfa41 ( 
.S (S [41]), 
.C (C [41]), 
.P (A2[41]), 
.Q (A1[41]), 
.R (A0[41]) 
); 

mfa mfa42 ( 
.S (S [42]), 
.C (C [42]), 
.P (A2[42]), 
.Q (A1[42]), 
.R (A0[42]) 
); 

mfa mfa43 ( 
.S (S [43]), 
.C (C [43]), 
.P (A2[43]), 
.Q (A1[43]), 
.R (A0[43]) 
); 

mfa mfa44 ( 
.S (S [44]), 
.C (C [44]), 
.P (A2[44]), 
.Q (A1[44]), 
.R (A0[44]) 
); 

mfa mfa45 ( 
.S (S [45]), 
.C (C [45]), 
.P (A2[45]), 
.Q (A1[45]), 
.R (A0[45]) 
); 

mfa mfa46 ( 
.S (S [46]), 
.C (C [46]), 
.P (A2[46]), 
.Q (A1[46]), 
.R (A0[46]) 
); 

mfa mfa47 ( 
.S (S [47]), 
.C (C [47]), 
.P (A2[47]), 
.Q (A1[47]), 
.R (A0[47]) 
); 

mfa mfa48 ( 
.S (S [48]), 
.C (C [48]), 
.P (A2[48]), 
.Q (A1[48]), 
.R (A0[48]) 
); 

mfa mfa49 ( 
.S (S [49]), 
.C (DUMMY ), 
.P (A2[49]), 
.Q (A1[49]), 
.R (A0[49]) 
); 


endmodule 
