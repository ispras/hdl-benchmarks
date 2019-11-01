

















`ifdef CL0_LbcDisable 
`define LbcDisable 1'b0 
`endif 

`ifdef CL1_LbcDisable 
`define LbcDisable 1'b1 
`endif 

`ifdef CL0_MemSequential 
`define MemSequential 1'b0 
`endif 

`ifdef CL1_MemSequential 
`define MemSequential 1'b1 
`endif 

`ifdef CL0_MemZeroFirst 
`define MemZeroFirst 1'b0 
`endif 

`ifdef CL1_MemZeroFirst 
`define MemZeroFirst 1'b1 
`endif 

`ifdef CL0_MemFullWord 
`define MemFullWord 1'b0 
`endif 

`ifdef CL1_MemFullWord 
`define MemFullWord 1'b1 
`endif 




`ifdef BUSCLK 
`else 
`define BUSCLK (1*`SYSCLK) 
`endif 

`ifdef CLD_BusClkRatio1to1 
`define BUSCLK (1*`SYSCLK) 
`endif 

`ifdef CLD_BusClkRatio1Plus7 
`define BUSCLK (1*`SYSCLK + 7) 
`endif 

`ifdef CLD_BusClkRatio1Minus11 
`define BUSCLK (1*`SYSCLK - 11) 
`endif 

`ifdef CLD_BusClkRatio3to1 
`define BUSCLK (3*`SYSCLK) 
`endif 

`ifdef CLD_BusClkRatio3Plus9 
`define BUSCLK (3*`SYSCLK + 9) 
`endif 

`ifdef CLD_BusClkRatio3Minus9 
`define BUSCLK (3*`SYSCLK - 9) 
`endif 

`ifdef CLD_BusClkRatio5Plus15 
`define BUSCLK (5*`SYSCLK + 15) 
`endif 

`ifdef CLD_BusClkRatio7Minus17 
`define BUSCLK (7*`SYSCLK - 17) 
`endif 

`ifdef CL00_LBA_EB_ADDR28 
`define LBA_EB_ADDR28 2'b00 
`endif 

`ifdef CL01_LBA_EB_ADDR28 
`define LBA_EB_ADDR28 2'b01 
`endif 

`ifdef CL10_LBA_EB_ADDR28 
`define LBA_EB_ADDR28 2'b10 
`endif 

`ifdef CL11_LBA_EB_ADDR28 
`define LBA_EB_ADDR28 2'b11 
`endif 







`ifdef CL00_LBA_EB_ARBGNT 
`define LBA_EB_ARBGNT 2'b00 
`endif 

`ifdef CL01_LBA_EB_ARBGNT 
`define LBA_EB_ARBGNT 2'b01 
`define VPP_POP_EB_TC 
`endif 

`ifdef CL10_LBA_EB_ARBGNT 
`define LBA_EB_ARBGNT 2'b10 
`define VPP_POP_PB_TC 
`endif 

`ifdef CL11_LBA_EB_ARBGNT 
`define LBA_EB_ARBGNT 2'b11 
`define VPP_POP_EB_TC 
`define VPP_POP_PB_TC 
`endif 


`ifdef CL1_EB_AUTORUPT_EN 
`define EB_AUTORUPT_EN 6'b11_1111 
`else 
`ifdef CL0_EB_AUTORUPT_EN 
`define EB_AUTORUPT_EN 6'b00_0000 
`else 
`define EB_AUTORUPT_EN 6'b00_0000 
`endif 
`endif 

`ifdef CL0_LBA_TSTSET_EN 
`define LBA_TSTSET_EN 1'b0 
`endif 

`ifdef CL1_LBA_TSTSET_EN 
`define LBA_TSTSET_EN 1'b1 
`endif 




`ifdef VPP_TST_COPSTUB2 
`else 
`ifdef Ce1ModuleName 
`else 
`define VPP_TST_CE 
`ifdef VPP_TST_CE_NULL 
`define Ce1ModuleName ce_null 
`else 
`define VPP_TST_CE_DVT 
`define Ce1ModuleName ce_dvt 
`ifdef VPP_POP_CE0 
`define VPP_NO_CE_DVT_HL 
`endif 
`ifdef VPP_POP_CE0_HL 
`define VPP_NO_CE_DVT_HL 
`endif 
`endif 
`endif 
`endif 

