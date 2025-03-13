/*********************************************************/
// MODULE:	Top Module 

/*********************************************************/

`include "FS90B779_DAI.v"
`include "FXADDA162H90A.v"

module FS90B779 ( bclk, din, dout, lrcin, lrcout,lrcin_o, lrcout_o,bclk_o,
                  MCLK, RESET,
                  RLINEIN, LLINEIN, MICIN,
                  VCM, VREFP, VREFN,
                  ROUT, LOUT,
                  MASTER,
                  MCLK_MODE_2  ,
                  MCLK_MODE_1  ,
                  MCLK_MODE_0  ,
                  ADC_PD      ,
                  DAC_PD  ,
                  loopback,
                  LHM,RHM,INSEL,MICB, RHPOUT,LHPOUT , LHV_6   , LHV_5, LHV_4, LHV_3, LHV_2, LHV_1, LHV_0,
                  RHV_6 , RHV_5, RHV_4, RHV_3, RHV_2, RHV_1,RHV_0, LIM,RIM,LIV_4 ,LIV_3,LIV_2,LIV_1,LIV_0,RIV_4,
                  RIV_3,RIV_2,RIV_1,RIV_0,STE,STA_1,STA_0,DAC,BYP, MICM
                  );

input           loopback;
input           din  ;
output          dout ;
input           bclk ;
input           lrcin;
input           lrcout;
input           RESET ;
input		MCLK;
output          bclk_o ;
output          lrcin_o;
output          lrcout_o ;
input           MASTER ;

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


input		 MCLK_MODE_2 ;
input            MCLK_MODE_1 ;
input            MCLK_MODE_0 ;
input            ADC_PD     ;
input            DAC_PD     ;
input            LHM     ;
input            RHM    ;
input            INSEL ;
input            MICB   ;

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
input           MICM;

wire  [15:0] adc_lchdata;
wire  [15:0] adc_rchdata;
wire  [15:0] dac_lchdata;
wire  [15:0] dac_rchdata;

FS90B779_DAI uFS90B779_DAI (
                      .loopback  (loopback),
                      .RESET       (RESET       ),
                      .MCLK	   (MCLK        ),
                      .bclk        (bclk        ),
                      .din         (din         ),
                      .dout        (dout        ),
                      .lrcin       (lrcin       ),
                      .lrcout      (lrcout  ),
                      .MCLK_MODE_2   (MCLK_MODE_2) ,
                      .MCLK_MODE_1   (MCLK_MODE_1),
                      .MCLK_MODE_0   (MCLK_MODE_0),
                      .MASTER        (MASTER),
                      .adc_lchdata(adc_lchdata),
                      .adc_rchdata(adc_rchdata),
                      .bclk_o        (bclk_o      ),
                      .lrcin_o       (lrcin_o     ),
                      .lrcout_o      (lrcout_o    ),
                      .dac_lchdata(dac_lchdata),
                      .dac_rchdata(dac_rchdata),
                      .DATA_LATCH(DATA_LATCH)
                      );

FXADDA162H90A uFXADDA162H90A (
                            .LLINEIN    (LLINEIN) ,
                            .RLINEIN    (RLINEIN) ,
                            .MICIN      (MICIN  ) ,
                            .LDI_15       (dac_lchdata[15]) ,
                            .LDI_14       (dac_lchdata[14]) ,
                            .LDI_13        (dac_lchdata[13]) ,
                            .LDI_12        (dac_lchdata[12]) ,
                            .LDI_11        (dac_lchdata[11]) ,
                            .LDI_10        (dac_lchdata[10]) ,
                            .LDI_9        (dac_lchdata[9]) ,
                            .LDI_8        (dac_lchdata[8]) ,
                            .LDI_7        (dac_lchdata[7]) ,
                            .LDI_6       (dac_lchdata[6]) ,
                            .LDI_5        (dac_lchdata[5]) ,
                            .LDI_4        (dac_lchdata[4]) ,
                            .LDI_3       (dac_lchdata[3]) ,
                            .LDI_2        (dac_lchdata[2]) ,
                            .LDI_1        (dac_lchdata[1]) ,
                            .LDI_0        (dac_lchdata[0]) ,


                            .RDI_15       (dac_rchdata[15]) ,
                            .RDI_14       (dac_rchdata[14]) ,
                            .RDI_13        (dac_rchdata[13]) ,
                            .RDI_12        (dac_rchdata[12]) ,
                            .RDI_11        (dac_rchdata[11]) ,
                            .RDI_10        (dac_rchdata[10]) ,
                            .RDI_9        (dac_rchdata[9]) ,
                            .RDI_8        (dac_rchdata[8]) ,
                            .RDI_7        (dac_rchdata[7]) ,
                            .RDI_6       (dac_rchdata[6]) ,
                            .RDI_5        (dac_rchdata[5]) ,
                            .RDI_4        (dac_rchdata[4]) ,
                            .RDI_3       (dac_rchdata[3]) ,
                            .RDI_2        (dac_rchdata[2]) ,
                            .RDI_1        (dac_rchdata[1]) ,
                            .RDI_0        (dac_rchdata[0]) ,
                            .LHM	(LHM),
                            .RHM	(RHM),
                            .INSEL	(INSEL),

                            .MICB	(MICB),
                            .ADC_PD	(ADC_PD),
                            .DAC_PD	(DAC_PD),
                            .DATA_LATCH (DATA_LATCH),
                            .MCLK	(MCLK),
                            .RESET	(RESET),

                            .LDO_15       (adc_lchdata[15]) ,
                            .LDO_14       (adc_lchdata[14]) ,
                            .LDO_13        (adc_lchdata[13]) ,
                            .LDO_12        (adc_lchdata[12]) ,
                            .LDO_11        (adc_lchdata[11]) ,
                            .LDO_10        (adc_lchdata[10]) ,
                            .LDO_9        (adc_lchdata[9]) ,
                            .LDO_8        (adc_lchdata[8]) ,
                            .LDO_7        (adc_lchdata[7]) ,
                            .LDO_6       (adc_lchdata[6]) ,
                            .LDO_5        (adc_lchdata[5]) ,
                            .LDO_4        (adc_lchdata[4]) ,
                            .LDO_3       (adc_lchdata[3]) ,
                            .LDO_2        (adc_lchdata[2]) ,
                            .LDO_1        (adc_lchdata[1]) ,
                            .LDO_0        (adc_lchdata[0]) ,

                            .RDO_15       (adc_rchdata[15]) ,
                            .RDO_14       (adc_rchdata[14]) ,
                            .RDO_13        (adc_rchdata[13]) ,
                            .RDO_12        (adc_rchdata[12]) ,
                            .RDO_11        (adc_rchdata[11]) ,
                            .RDO_10        (adc_rchdata[10]) ,
                            .RDO_9        (adc_rchdata[9]) ,
                            .RDO_8        (adc_rchdata[8]) ,
                            .RDO_7        (adc_rchdata[7]) ,
                            .RDO_6       (adc_rchdata[6]) ,
                            .RDO_5        (adc_rchdata[5]) ,
                            .RDO_4        (adc_rchdata[4]) ,
                            .RDO_3       (adc_rchdata[3]) ,
                            .RDO_2        (adc_rchdata[2]) ,
                            .RDO_1        (adc_rchdata[1]) ,
                            .RDO_0        (adc_rchdata[0]) ,
                            .MCLK_MODE_2  (MCLK_MODE_2),
                            .MCLK_MODE_1  (MCLK_MODE_1),
                            .MCLK_MODE_0  (MCLK_MODE_0),
                            .RHPOUT (RHPOUT),
                            .LHPOUT (LHPOUT),
                                  .LHV_6 (LHV_6),
                                  .LHV_5 (LHV_5),
                                  .LHV_4 (LHV_4),
                                  .LHV_3 (LHV_3),
                                  .LHV_2 (LHV_2),
                                  .LHV_1 (LHV_1),
                                  .LHV_0 (LHV_0),
                                  .RHV_6 (RHV_6),
                                  .RHV_5 (RHV_5),
                                  .RHV_4 (RHV_4),
                                  .RHV_3 (RHV_3),
                                  .RHV_2 (RHV_2),
                                  .RHV_1 (RHV_1),
                                  .RHV_0 (RHV_0),
                                  .LIM (LIM),
                                  .RIM (RIM),
                                  .LIV_4 (LIV_4),
                                  .LIV_3 (LIV_3),
                                  .LIV_2 (LIV_2),
                                  .LIV_1 (LIV_1),
                                  .LIV_0 (LIV_0),
                                  .RIV_4 (RIV_4),
                                  .RIV_3 (RIV_3),
                                  .RIV_2 (RIV_2),
                                  .RIV_1 (RIV_1),
                                  .RIV_0 (RIV_0),
                                  .STE (STE),
                                  .STA_1 (STA_1),
                                  .STA_0 (STA_0),
                                  .DAC (DAC),
                                  .BYP (BYP),

                                  .MICM (MICM),

                            .LOUT	 (LOUT),
                            .ROUT	 (ROUT),
                            .VCM	 (VCM),

                            .VREFP       (VREFP ),
                            .VREFN       (VREFN));



endmodule // FS90B717 

