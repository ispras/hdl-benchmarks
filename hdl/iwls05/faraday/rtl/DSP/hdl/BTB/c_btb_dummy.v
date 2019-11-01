


module  BTB  (/* ------------ Inputs : ------------- */
              /* glob */ /*T_RST,*/ DSPCLK,
              /* psq  */ PPclr_h, GO_F, GO_D, GO_E, GO_C, IFA_nx[4:0],
                         IFA[13:0], EXA[13:0], Bterr_E, Taddr_E[13:0],
              /* dec  */ RTS_R, RTS_Ed, BR_Ed,  
              /* eu   */ Ctrue,
              /* memc */ TB_EN,
               BTB_rd[25:0],
               RTB_rd[11:0],
`ifdef FD_DFT
              /* dft  */ SCAN_TEST,
`endif            
              
               BTB_ra[4:0], BTB_wa[4:0], BTB_wd[25:0], BTB_web, 
               /*RTB_wd[11:0],*/ RTB_web,
               BTaken_I, RTaken_I, PTaken_R, PTaken_E);

        
input [25:0] BTB_rd;		
input [4:0]  IFA_nx;		
input [13:0] IFA,		
             EXA,		
             Taddr_E;		
input [11:0] RTB_rd;		
input /*T_RST,*/		
      DSPCLK,			
      PPclr_h,			
      GO_F,			
      GO_D,			
      GO_E,			
      GO_C,			
      Bterr_E,			
      Ctrue,			
      RTS_R, RTS_Ed,	
      BR_Ed,			
      TB_EN;			
`ifdef FD_DFT
input SCAN_TEST;
`endif

output [4:0]  BTB_wa,		
              BTB_ra;		
output [25:0] BTB_wd;		
output BTB_web,			
       RTB_web,			
       BTaken_I,
       RTaken_I,	
       PTaken_R, 		
       PTaken_E; 		



assign BTB_wa=0;
assign BTB_ra=0;
assign BTB_wd=0;
assign BTB_web=1;	
assign RTB_web=1;	
assign BTaken_I=0;
assign RTaken_I=0;
assign PTaken_R=0;
assign PTaken_E=0;

endmodule
