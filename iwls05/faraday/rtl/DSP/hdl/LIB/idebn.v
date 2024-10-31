module IDEBN (SCLK, IN, OUT); 


input SCLK, IN; 
output OUT; 

reg IN_syn, OUT; 
wire OUT_di; 

always @(posedge SCLK) 
begin 
IN_syn <= #1 IN; 
OUT <= #1 OUT_di; 
end 

assign OUT_di = OUT ? (IN | IN_syn) : (IN & IN_syn); 


endmodule 
