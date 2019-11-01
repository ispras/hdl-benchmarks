

module SICE (/* ------------ Inputs : ------------- */
             /* glob */ T_PWRONn, ICK, IMS, DSPCLK, CM_rd[23:0],
                        DMD[15:0], T_GOICE, PM_bdry_sel,
             /* clkc */ enTRAP_RL,
             /* psq  */ GO_F, GO_E, GO_C, ICE_ST, DRA[13:0], 
                        EXA[13:0], HALTclr_h, 
                        GOICEclr_h, GOICEdis,
                        PMOVL_dsp[7:0], DMOVL_dsp[3:0],
             /* dec  */ IR[23:0], Dummy_R, nNOP_Eg, MTIDR_Eg, 
                        SBP_R, readCM_E,
             /* memc */ BGn, PMA[13:0], DMA[13:0], EXTC_Eg,
                        accPM_Eg, accDM_Eg,
             /* emc  */ eRDY, 
             /* dma  */ BRST, IACKn,
`ifdef FD_DFT
	     /* for DFT */ SCAN_TEST,
`endif           
             /* ------------ Outputs : ------------ */
             /* glob */ GRST, GO_Fx, GO_Ex, GO_Cx, HALT_E,
	     /* psq  */ IRR[13:0], IDR[23:0], GOICE, GOICE_syn,
                        ICE_wakeup,
             /* dec  */ Upd_IR, SPC[23:0], SBP_EN, enTYP3, 
   
             /* ------------ Inouts : ------------- */
             /* glob */ T_ID, IDo, IDoe,
             /* for CPI */
              EX_en, selIVER,
              SICEmmio[15:0]);


input  [15:0] DMD;	
input  [13:0] DRA,		
              EXA,		
              PMA,		
              DMA;		
input  [23:0] IR,		
              CM_rd;		

input  [7:0] PMOVL_dsp; 
input  [3:0] DMOVL_dsp;
input BRST, IACKn;

input  T_ID,			
       T_PWRONn,		
       T_GOICE,
       PM_bdry_sel,
       DSPCLK,			
       ICK,			
       IMS,			
       GO_F,			
       GO_E,			
       GO_C,			
       Dummy_R,			
       HALTclr_h, 		
       GOICEclr_h,		
       GOICEdis,		
       ICE_ST,			
       nNOP_Eg,			
       SBP_R,			
       readCM_E,		
       MTIDR_Eg,		
       BGn,			
       EXTC_Eg,			
       eRDY,			
       accPM_Eg,		
       accDM_Eg,		
       enTRAP_RL;		
                                
input  EX_en, selIVER;
`ifdef FD_DFT
input SCAN_TEST;
`endif

output [15:0] SICEmmio;       
output [23:0] SPC;		
output [13:0] IRR;		
output [23:0] IDR;		
output IDo,			
       IDoe,			
       GRST,			
       GO_Fx,			
       GO_Ex,			
       GO_Cx,			
       HALT_E,			
       GOICE,		
       GOICE_syn,	
       ICE_wakeup,
       SBP_EN,			
       Upd_IR,			
       enTYP3;			

assign SPC=0;
assign IRR=0;
assign IDR=0;
assign IDo=0;
assign IDoe=0;
assign GO_Fx = GO_F; 
assign GO_Ex = GO_E;
assign GO_Cx = GO_C;
assign HALT_E=0;
assign GOICE=0;
assign GOICE_syn=0;
assign SBP_EN=0;
assign Upd_IR=0;
assign enTYP3=1;
assign SICEmmio=0;
assign ICE_wakeup=0;


// Reset State Machine =>

reg [1:0] RCS, RNS;
reg  PRST_syn;
reg  RST_req;
wire RST_gnt, PRST,
     GRST;


parameter  R_IDLE     = 2'b00,       
           R_WAIT_GNT = 2'b01,       
           R_RST_1    = 2'b10,       
           R_RST_2    = 2'b11;       

        
        assign  PRST = !T_PWRONn;

        always @(posedge DSPCLK) begin       
                PRST_syn <=  #`db PRST;
        end

        always @(posedge DSPCLK or posedge GRST)
           if(GRST) RST_req <=  #`db 1'b0;
           else     RST_req <=  #`db BRST;

        assign RST_gnt = !IACKn;

        always @(RCS or RST_req or RST_gnt) begin
        case(RCS)
            R_IDLE     : if(RST_req)
                             RNS = R_WAIT_GNT;
                          else
                             RNS = R_IDLE;
            R_WAIT_GNT : if(RST_gnt)
                             RNS = R_RST_1;
                          else
                             RNS = R_WAIT_GNT;
            R_RST_1    :     RNS = R_RST_2;
            R_RST_2    :     RNS = R_IDLE;
            default    :     RNS = R_IDLE;
        endcase
        end

        always @(posedge DSPCLK or posedge PRST)
           if(PRST) RCS <=  #`db 2'b0;
           else     RCS <=  #`db RNS;

        assign GRST = (RCS==R_RST_1) || (RCS==R_RST_2) || PRST_syn;



endmodule
