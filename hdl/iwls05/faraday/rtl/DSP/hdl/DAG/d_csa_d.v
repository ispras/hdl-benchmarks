module CSA_d (/* IN */ INa, INb, INc, 
 SUM, COUT); 

input INa, INb, INc; 
output SUM, COUT; 

wire TMP; 
assign TMP = INa^ INb; 
assign SUM = TMP ^ INc; 
assign COUT = (INa & INb) | (INb & INc) | (INc & INa); 

endmodule 
