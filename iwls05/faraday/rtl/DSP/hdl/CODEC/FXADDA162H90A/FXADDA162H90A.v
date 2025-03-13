`include "ADC162H90A_dtop.v"
`include "ADDA162H90A_atop.v"

module FXADDA162H90A ( 
                       // Analog Pads 
                       RLINEIN, LLINEIN, MICIN, 
                       VREFP  , VREFN  , VCM  , 
                       ROUT   , LOUT   ,  
                       RHPOUT   , LHPOUT   ,  
                       // Digital Audio Interface Signals  
                       RESET,
                       MCLK,
                       DATA_LATCH,
                       // Digital Audio Control Signals  
                       MCLK_MODE_2,
                       MCLK_MODE_1,
                       MCLK_MODE_0,
                       DAC_PD,
                       ADC_PD,
                       LHM,
                       RHM,
                       LHV_6,
                       LHV_5,
                       LHV_4,
                       LHV_3,
                       LHV_2,
                       LHV_1,
                       LHV_0,
                       RHV_6,
                       RHV_5,
                       RHV_4,
                       RHV_3,
                       RHV_2,
                       RHV_1,
                       RHV_0,
                       LIM,
                       RIM,
                       LIV_4,
                       LIV_3,
                       LIV_2,
                       LIV_1,
                       LIV_0,
                       RIV_4,
                       RIV_3,
                       RIV_2,
                       RIV_1,
                       RIV_0,
                       STE,
                       STA_1,
                       STA_0,
                       DAC,
                       BYP,
                       INSEL,
                       MICM,
                       MICB,
                       LDI_15,
                       LDI_14,
                       LDI_13,
                       LDI_12,
                       LDI_11,
                       LDI_10,
                       LDI_9,
                       LDI_8,
                       LDI_7,
                       LDI_6,
                       LDI_5,
                       LDI_4,
                       LDI_3,
                       LDI_2,
                       LDI_1,
                       LDI_0,
                       RDI_15,
                       RDI_14,
                       RDI_13,
                       RDI_12,
                       RDI_11,
                       RDI_10,
                       RDI_9,
                       RDI_8,
                       RDI_7,
                       RDI_6,
                       RDI_5,
                       RDI_4,
                       RDI_3,
                       RDI_2,
                       RDI_1,
                       RDI_0,
                       LDO_15,
                       LDO_14,
                       LDO_13,
                       LDO_12,
                       LDO_11,
                       LDO_10,
                       LDO_9,
                       LDO_8,
                       LDO_7,
                       LDO_6,
                       LDO_5,
                       LDO_4,
                       LDO_3,
                       LDO_2,
                       LDO_1,
                       LDO_0,
                       RDO_15,
                       RDO_14,
                       RDO_13,
                       RDO_12,
                       RDO_11,
                       RDO_10,
                       RDO_9,
                       RDO_8,
                       RDO_7,
                       RDO_6,
                       RDO_5,
                       RDO_4,
                       RDO_3,
                       RDO_2,
                       RDO_1,
                       RDO_0
                      );
                       
                       
input           RLINEIN;   
input           LLINEIN;   
input           MICIN;     
input           VCM;       
input           VREFP;     
input           VREFN;     
output          ROUT;      
output          LOUT;      
output          RHPOUT;    
output          LHPOUT;    

input           RESET;
input           MCLK;                    
input           DATA_LATCH;

input           MCLK_MODE_2;                    
input           MCLK_MODE_1;                    
input           MCLK_MODE_0;                    
input           DAC_PD;                    
input           ADC_PD;                    
input           LHM;                    
input           RHM;                    
input           LHV_6;                    
input           LHV_5;                    
input           LHV_4;                    
input           LHV_3;                    
input           LHV_2;                    
input           LHV_1;                    
input           LHV_0;                    
input           RHV_6;                    
input           RHV_5;                    
input           RHV_4;                    
input           RHV_3;                    
input           RHV_2;                    
input           RHV_1;                    
input           RHV_0;                    
input           LIM;                    
input           RIM;                    
input           LIV_4;                    
input           LIV_3;                    
input           LIV_2;                    
input           LIV_1;                    
input           LIV_0;                    
input           RIV_4;                    
input           RIV_3;                    
input           RIV_2;                    
input           RIV_1;                    
input           RIV_0;                    
input           STE;                    
input           STA_1;                    
input           STA_0;                    
input           DAC;                    
input           BYP;                    
input           INSEL;                    
input           MICM;                    
input           MICB;                    

input           LDI_15;
input           LDI_14;
input           LDI_13;
input           LDI_12;
input           LDI_11;
input           LDI_10;
input           LDI_9;
input           LDI_8;
input           LDI_7;
input           LDI_6;
input           LDI_5;
input           LDI_4;
input           LDI_3;
input           LDI_2;
input           LDI_1;
input           LDI_0;
input           RDI_15;
input           RDI_14;
input           RDI_13;
input           RDI_12;
input           RDI_11;
input           RDI_10;
input           RDI_9;
input           RDI_8;
input           RDI_7;
input           RDI_6;
input           RDI_5;
input           RDI_4;
input           RDI_3;
input           RDI_2;
input           RDI_1;
input           RDI_0;

output          LDO_15;
output          LDO_14;
output          LDO_13;
output          LDO_12;
output          LDO_11;
output          LDO_10;
output          LDO_9;
output          LDO_8;
output          LDO_7;
output          LDO_6;
output          LDO_5;
output          LDO_4;
output          LDO_3;
output          LDO_2;
output          LDO_1;
output          LDO_0;
output          RDO_15;
output          RDO_14;
output          RDO_13;
output          RDO_12;
output          RDO_11;
output          RDO_10;
output          RDO_9;
output          RDO_8;
output          RDO_7;
output          RDO_6;
output          RDO_5;
output          RDO_4;
output          RDO_3;
output          RDO_2;
output          RDO_1;
output          RDO_0;


ADC162H90A_dtop uADC162H90A_dtop ( .RESET(RESET),
                                   .MCLK(MCLK),
                                   .DATA_LATCH(DATA_LATCH),
                                   .MCLK_MODE_2(MCLK_MODE_2),
                                   .MCLK_MODE_1(MCLK_MODE_1),
                                   .MCLK_MODE_0(MCLK_MODE_0),
                                   .ADC_PD(ADC_PD),
                                   .LIM(LIM),
                                   .RIM(RIM),
                                   .LIV_4(LIV_4),
                                   .LIV_3(LIV_3),
                                   .LIV_2(LIV_2),
                                   .LIV_1(LIV_1),
                                   .LIV_0(LIV_0),
                                   .RIV_4(RIV_4),
                                   .RIV_3(RIV_3),
                                   .RIV_2(RIV_2),
                                   .RIV_1(RIV_1),
                                   .RIV_0(RIV_0),
                                   .INSEL(INSEL),
                                   .MICM(MICM),
                                   .MICB(MICB),
                                   .LDO_15(LDO_15),
                                   .LDO_14(LDO_14),
                                   .LDO_13(LDO_13),
                                   .LDO_12(LDO_12),
                                   .LDO_11(LDO_11),
                                   .LDO_10(LDO_10),
                                   .LDO_9(LDO_9),
                                   .LDO_8(LDO_8),
                                   .LDO_7(LDO_7),
                                   .LDO_6(LDO_6),
                                   .LDO_5(LDO_5),
                                   .LDO_4(LDO_4),
                                   .LDO_3(LDO_3),
                                   .LDO_2(LDO_2),
                                   .LDO_1(LDO_1),
                                   .LDO_0(LDO_0),
                                   .RDO_15(RDO_15),
                                   .RDO_14(RDO_14),
                                   .RDO_13(RDO_13),
                                   .RDO_12(RDO_12),
                                   .RDO_11(RDO_11),
                                   .RDO_10(RDO_10),
                                   .RDO_9(RDO_9),
                                   .RDO_8(RDO_8),
                                   .RDO_7(RDO_7),
                                   .RDO_6(RDO_6),
                                   .RDO_5(RDO_5),
                                   .RDO_4(RDO_4),
                                   .RDO_3(RDO_3),
                                   .RDO_2(RDO_2),
                                   .RDO_1(RDO_1),
                                   .RDO_0(RDO_0),
                                   .acADCPD(acADCPD),  
                                   .acLIM(acLIM),  
                                   .acRIM(acRIM),  
                                   .acLIV4(acLIV4),  
                                   .acLIV3(acLIV3),  
                                   .acLIV2(acLIV2),  
                                   .acLIV1(acLIV1),  
                                   .acLIV0(acLIV0),  
                                   .acRIV4(acRIV4),  
                                   .acRIV3(acRIV3),  
                                   .acRIV2(acRIV2),  
                                   .acRIV1(acRIV1),  
                                   .acRIV0(acRIV0),  
                                   .acINSEL(acINSEL),
                                   .acMICM(acMICM),
                                   .acMICB(acMICB),
                                   .adY1_L(adY1_L),    
                                   .adY2_L(adY2_L),    
                                   .adY1_R(adY1_R),     
                                   .adY2_R(adY2_R),     
                                   .adPH1(adPH1),
                                   .adPH1D(adPH1D),
                                   .adPH2(adPH2),
                                   .adPH2D(adPH2D) );

DAC162H90A_dtop uDAC162H90A_dtop ( .RESET(RESET),
                                   .MCLK(MCLK),
                                   .DATA_LATCH(DATA_LATCH),
                                   .MCLK_MODE_2(MCLK_MODE_2),
                                   .MCLK_MODE_1(MCLK_MODE_1),
                                   .MCLK_MODE_0(MCLK_MODE_0),
                                   .LHM(LHM),
                                   .RHM(RHM),
                                   .LHV_6(LHV_6),
                                   .LHV_5(LHV_5),
                                   .LHV_4(LHV_4),
                                   .LHV_3(LHV_3),
                                   .LHV_2(LHV_2),
                                   .LHV_1(LHV_1),
                                   .LHV_0(LHV_0),
                                   .RHV_6(RHV_6),
                                   .RHV_5(RHV_5),
                                   .RHV_4(RHV_4),
                                   .RHV_3(RHV_3),
                                   .RHV_2(RHV_2),
                                   .RHV_1(RHV_1),
                                   .RHV_0(RHV_0),
                                   .DAC_PD(DAC_PD),
                                   .STE(STE),
                                   .STA_1(STA_1),
                                   .STA_0(STA_0),
                                   .DAC(DAC),
                                   .BYP(BYP),
                                   .LDI_15(LDI_15),
                                   .LDI_14(LDI_14),
                                   .LDI_13(LDI_13),
                                   .LDI_12(LDI_12),
                                   .LDI_11(LDI_11),
                                   .LDI_10(LDI_10),
                                   .LDI_9(LDI_9),
                                   .LDI_8(LDI_8),
                                   .LDI_7(LDI_7),
                                   .LDI_6(LDI_6),
                                   .LDI_5(LDI_5),
                                   .LDI_4(LDI_4),
                                   .LDI_3(LDI_3),
                                   .LDI_2(LDI_2),
                                   .LDI_1(LDI_1),
                                   .LDI_0(LDI_0),
                                   .RDI_15(RDI_15),
                                   .RDI_14(RDI_14),
                                   .RDI_13(RDI_13),
                                   .RDI_12(RDI_12),
                                   .RDI_11(RDI_11),
                                   .RDI_10(RDI_10),
                                   .RDI_9(RDI_9),
                                   .RDI_8(RDI_8),
                                   .RDI_7(RDI_7),
                                   .RDI_6(RDI_6),
                                   .RDI_5(RDI_5),
                                   .RDI_4(RDI_4),
                                   .RDI_3(RDI_3),
                                   .RDI_2(RDI_2),
                                   .RDI_1(RDI_1),
                                   .RDI_0(RDI_0),
                                   .acDACPD(acDACPD),
                                   .acLHM(acLHM),    
                                   .acRHM(acRHM),    
                                   .acLHV6(acLHV6),  
                                   .acLHV5(acLHV5),  
                                   .acLHV4(acLHV4),  
                                   .acLHV3(acLHV3),  
                                   .acLHV2(acLHV2),  
                                   .acLHV1(acLHV1),  
                                   .acLHV0(acLHV0),  
                                   .acRHV6(acRHV6),  
                                   .acRHV5(acRHV5),  
                                   .acRHV4(acRHV4),  
                                   .acRHV3(acRHV3),  
                                   .acRHV2(acRHV2),  
                                   .acRHV1(acRHV1),  
                                   .acRHV0(acRHV0),  
                                   .acSTE(acSTE),  
                                   .acSTA1(acSTA1),  
                                   .acSTA0(acSTA0),  
                                   .acDAC(acDAC),  
                                   .acBYP(acBYP),   
                                   .daY_L(daY_L),
                                   .daY_R(daY_R),
                                   .daPH1(daPH1),
                                   .daPH1D(daPH1D),
                                   .daPH2(daPH2),
                                   .daPH2D(daPH2D) );

ADDA162H90A_atop uADDA162H90A_atop ( 
                                   .RLINEIN(RLINEIN),
                                   .LLINEIN(LLINEIN),  
                                   .MICIN(MICIN),    
                                   .VCM(VCM),      
                                   .VREFP(VREFP),      
                                   .VREFN(VREFN),      
                                   .ROUT(ROUT),     
                                   .LOUT(LOUT),     
                                   .RHPOUT(RHPOUT),     
                                   .LHPOUT(LHPOUT),     
                                   .acADCPD(acADCPD),  
                                   .acLIM(acLIM),  
                                   .acRIM(acRIM),  
                                   .acLIV4(acLIV4),  
                                   .acLIV3(acLIV3),  
                                   .acLIV2(acLIV2),  
                                   .acLIV1(acLIV1),  
                                   .acLIV0(acLIV0),  
                                   .acRIV4(acRIV4),  
                                   .acRIV3(acRIV3),  
                                   .acRIV2(acRIV2),  
                                   .acRIV1(acRIV1),  
                                   .acRIV0(acRIV0),  
                                   .acINSEL(acINSEL),
                                   .acMICM(acMICM),
                                   .acMICB(acMICB),
                                   .adY1_L(adY1_L),    
                                   .adY2_L(adY2_L),    
                                   .adY1_R(adY1_R),     
                                   .adY2_R(adY2_R),     
                                   .adPH1(adPH1),
                                   .adPH1D(adPH1D),
                                   .adPH2(adPH2),
                                   .adPH2D(adPH2D),
                                   .acDACPD(acDACPD),
                                   .acLHM(acLHM),    
                                   .acRHM(acRHM),    
                                   .acLHV6(acLHV6),  
                                   .acLHV5(acLHV5),  
                                   .acLHV4(acLHV4),  
                                   .acLHV3(acLHV3),  
                                   .acLHV2(acLHV2),  
                                   .acLHV1(acLHV1),  
                                   .acLHV0(acLHV0),  
                                   .acRHV6(acRHV6),  
                                   .acRHV5(acRHV5),  
                                   .acRHV4(acRHV4),  
                                   .acRHV3(acRHV3),  
                                   .acRHV2(acRHV2),  
                                   .acRHV1(acRHV1),  
                                   .acRHV0(acRHV0),  
                                   .acSTE(acSTE),  
                                   .acSTA1(acSTA1),  
                                   .acSTA0(acSTA0),  
                                   .acDAC(acDAC),  
                                   .acBYP(acBYP),   
                                   .daY_L(daY_L),
                                   .daY_R(daY_R),
                                   .daPH1(daPH1),
                                   .daPH1D(daPH1D),
                                   .daPH2(daPH2),
                                   .daPH2D(daPH2D)
                                   );

endmodule 
