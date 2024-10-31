





`define TIMEUNIT "1NS" 
`define CYCLE "100" 
`define FTL_SYSCLK "DNRZ,0" 
`define FTL_BUSCLK "DNRZ,10" 
`define SYSCLK_SIG "DNRZ,10" 
`define BUSCLK_SIG "DNRZ,20" 
`define STROBE_PT "STROBE,90" 

`ifdef EB_SNOP_SLEP_EN 
`define SNOP_SLEP_EN 1'b1 
`else 
`define SNOP_SLEP_EN 1'b0 
`endif 

