








module CM8k (datai[23:0], datao[23:0], addr[13:0], cs, web, oe, ck); 

output [23:0] datao; 
input [23:0] datai; 
input [13:0] addr; 
input cs, 
web, 
oe, 
ck; 

SH210018 I( .A0(addr[0]), 
.A1(addr[1]), 
.A2(addr[2]), 
.A3(addr[3]), 
.A4(addr[4]), 
.A5(addr[5]), 
.A6(addr[6]), 
.A7(addr[7]), 
.A8(addr[8]), 
.A9(addr[9]), 
.A10(addr[10]), 
.A11(addr[11]), 
.A12(addr[12]), 
.CK(ck), 
.CS(cs), 
.DI0(datai[0]), 
.DI1(datai[1]), 
.DI2(datai[2]), 
.DI3(datai[3]), 
.DI4(datai[4]), 
.DI5(datai[5]), 
.DI6(datai[6]), 
.DI7(datai[7]), 
.DI8(datai[8]), 
.DI9(datai[9]), 
.DI10(datai[10]), 
.DI11(datai[11]), 
.DI12(datai[12]), 
.DI13(datai[13]), 
.DI14(datai[14]), 
.DI15(datai[15]), 
.DI16(datai[16]), 
.DI17(datai[17]), 
.DI18(datai[18]), 
.DI19(datai[19]), 
.DI20(datai[20]), 
.DI21(datai[21]), 
.DI22(datai[22]), 
.DI23(datai[23]), 
.DO0(datao[0]), 
.DO1(datao[1]), 
.DO2(datao[2]), 
.DO3(datao[3]), 
.DO4(datao[4]), 
.DO5(datao[5]), 
.DO6(datao[6]), 
.DO7(datao[7]), 
.DO8(datao[8]), 
.DO9(datao[9]), 
.DO10(datao[10]), 
.DO11(datao[11]), 
.DO12(datao[12]), 
.DO13(datao[13]), 
.DO14(datao[14]), 
.DO15(datao[15]), 
.DO16(datao[16]), 
.DO17(datao[17]), 
.DO18(datao[18]), 
.DO19(datao[19]), 
.DO20(datao[20]), 
.DO21(datao[21]), 
.DO22(datao[22]), 
.DO23(datao[23]), 
.OE(oe), 
.WEB(web) 
); 

endmodule 

