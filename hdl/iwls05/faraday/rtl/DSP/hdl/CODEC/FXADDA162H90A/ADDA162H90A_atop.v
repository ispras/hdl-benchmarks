//`timescale 10ps / 1ps
module ADDA162H90A_atop ( acDACPD, acLHM, acRHM, daY_L, daY_R,
                          acLIM, acRIM, 
                          acLIV4, acLIV3, acLIV2, acLIV1, acLIV0,
                          acRIV4, acRIV3, acRIV2, acRIV1, acRIV0,
                          acLHV6, acLHV5, acLHV4, acLHV3, acLHV2, acLHV1, acLHV0,
                          acRHV6, acRHV5, acRHV4, acRHV3, acRHV2, acRHV1, acRHV0,
                          acSTE, acSTA1, acSTA0, acDAC, acBYP,
                          acADCPD, acINSEL, acMICB, acMICM, adY1_L, adY2_L, adY1_R, adY2_R, 
                          daPH1, daPH1D, daPH2, daPH2D,
                          adPH1, adPH1D, adPH2, adPH2D,
                          VCM, VREFP, VREFN, LOUT, ROUT, RHPOUT, LHPOUT, RLINEIN, LLINEIN, MICIN );

// INPUTS
input   acDACPD;       
input   acADCPD;       
input   acLHM;         
input   acRHM;        
input   acLHV6;       
input   acLHV5;      
input   acLHV4;     
input   acLHV3;    
input   acLHV2;      
input   acLHV1;      
input   acLHV0;     
input   acRHV6;     
input   acRHV5;     
input   acRHV4;     
input   acRHV3;    
input   acRHV2;      
input   acRHV1;      
input   acRHV0;      
input   acLIM;      
input   acRIM;      
input   acLIV4;     
input   acLIV3;     
input   acLIV2;     
input   acLIV1;    
input   acLIV0;    
input   acRIV4;       
input   acRIV3;       
input   acRIV2;       
input   acRIV1;       
input   acRIV0;       
input   acDAC;        
input   acBYP;        
input   acSTE;        
input   acSTA1;       
input   acSTA0;       
input   acINSEL;      
input   acMICB;      
input   acMICM;      
input   daY_L;       
input   daY_R;       
input   daPH1;       
input   daPH1D;      
input   daPH2;       
input   daPH2D;      
input   adPH1;       
input   adPH1D;      
input   adPH2;       
input   adPH2D;      

input   RLINEIN;    
input   LLINEIN;    
input   MICIN;      
// OUTPUTS
output  LOUT;         
output  ROUT;         
output  LHPOUT;       
output  RHPOUT;       
output  VCM;          
output  VREFP;        
output  VREFN;        

output  adY1_L;       
output  adY2_L;       
output  adY1_R;       
output  adY2_R;       

//  synopsys translate_off

reg [15:0] analog_vout_l;
reg [15:0] analog_vout_r;


initial analog_vout_l = 16'h0;
initial analog_vout_r = 16'h0;

wire    reset;
assign  reset = acDACPD || acLHM || acRHM;

always @(posedge reset or posedge daPH2)
  if (reset)
      analog_vout_l <= #1 16'd0;
  else begin
      if (daY_L)
          analog_vout_l <= #1 analog_vout_l + 16'd13;
      else
          analog_vout_l <= #1 analog_vout_l - 16'd13;
  end

always @(posedge reset or posedge daPH2)
  if (reset)
      analog_vout_r <= #1 16'd0;
  else begin
      if (daY_R)
          analog_vout_r <= #1 analog_vout_r + 16'd13;
      else
          analog_vout_r <= #1 analog_vout_r - 16'd13;
  end


wire   dac_phase_check;
reg    n_flag_dac_phase_overlape;

assign dac_phase_check = !(daPH1D | daPH2D) ;

specify
   $width     ( posedge dac_phase_check, 400.00:500.00:900.00,  0,  n_flag_dac_phase_overlape );
endspecify

always @(n_flag_dac_phase_overlape)
       $display("** DAC Phase_overlaping_Error: Abnormal transition occurred (%t) in Clock of %m",$time);



reg     [1:0]   adc_left_y  [0:65536];
reg     [1:0]   adc_right_y [0:65536];

initial
begin
  $readmemb("/home/msd/users/cjm1173/codec/FS90B717_c/SIM/pre_sim/adc_48k_937_6db.in", adc_left_y);
  $readmemb("/home/msd/users/cjm1173/codec/FS90B717_c/SIM/pre_sim/adc_48k_937_6db.in", adc_right_y);
end

integer k;

initial k=0;

reg adY1_L, adY2_L, adY1_R, adY2_R;

always @(posedge adPH2)
  begin
      {adY1_L, adY2_L} <= adc_left_y[k];
      {adY1_R, adY2_R} <= adc_right_y[k];
      k=k+1;
  end


wire   adc_phase_check;
reg    n_flag_adc_phase_overlape;

assign adc_phase_check = !(adPH1D | adPH2D) ;

specify
   $width     ( posedge adc_phase_check, 400.00:500.00:900.00,  0,  n_flag_adc_phase_overlape );
endspecify

always @(n_flag_adc_phase_overlape)
       $display("** ADC Phase_overlaping_Error: Abnormal transition occurred (%t) in Clock of %m",$time);

//  synopsys translate_on

endmodule // FS90B717_atop 
