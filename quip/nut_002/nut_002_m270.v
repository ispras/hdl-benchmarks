// 5 ins 2 outs
module nut_002_m270 (clock,reset,ins,outs);
input clock,reset;
input [4:0] ins;
output [1:0] outs;
cpu_klat_ctrl cpu_klat_ctrl_inst (
  .aRST(!reset),
  .aKMC_SEL(ins[0]),
  .aCPU_PRE_END(ins[1]),
  .aCPU_PRE_DAT(ins[2]),
  .SYS_ADDR2(ins[3]),
  .SCLK(clock),
  .EARLY_SCLK(clock),
  .BOOT_END(ins[4]),
  .aKMCLAT2(outs[0]),
  .aKMCLAT1(outs[1])
);
endmodule

module cpu_klat_ctrl(EARLY_SCLK,SCLK,aRST,BOOT_END,
       aCPU_PRE_DAT,aCPU_PRE_END,aKMC_SEL,SYS_ADDR2,
       aKMCLAT1,aKMCLAT2);
input  EARLY_SCLK,SCLK,aRST,BOOT_END;
input  aCPU_PRE_DAT,aCPU_PRE_END;
input  aKMC_SEL,SYS_ADDR2;
output aKMCLAT1,aKMCLAT2;
reg    aKMCLAT1,aKMCLAT2;
reg    n_mem_dat,n_mem_end;
wire   kmclat1_set,kmclat2_set,kmclat1_clr,kmclat2_clr;
always @(posedge SCLK or negedge aRST)
   
  if (aRST == 1'b0)
    begin
    n_mem_dat     = 1'b1;
    n_mem_end     = 1'b1;
    end
  else
    begin
    n_mem_dat     = aCPU_PRE_DAT;
    n_mem_end     = aCPU_PRE_END;
  end
assign kmclat1_set = !(aCPU_PRE_DAT | aKMC_SEL |  (SYS_ADDR2 ^ BOOT_END));
assign kmclat2_set = !(aCPU_PRE_DAT | aKMC_SEL | !(SYS_ADDR2 ^ BOOT_END)); 
assign kmclat1_clr = !n_mem_end | !(n_mem_dat | aKMC_SEL | !(SYS_ADDR2 ^ BOOT_END));
assign kmclat2_clr = !n_mem_end | !(n_mem_dat | aKMC_SEL |  (SYS_ADDR2 ^ BOOT_END));
always @(posedge EARLY_SCLK or negedge aRST)
   
  if (aRST == 1'b0)
    begin
    aKMCLAT1     = 1'b1;
    aKMCLAT2     = 1'b1;
    end
  else
    begin
    aKMCLAT1     = (kmclat1_clr ? 1'b1 :
                    kmclat1_set ? 1'b0 : aKMCLAT1);
    aKMCLAT2     = (kmclat2_clr ? 1'b1 :
                    kmclat2_set ? 1'b0 : aKMCLAT2);
    end
endmodule
