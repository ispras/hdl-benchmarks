`include "fir_8x.v"
`include "MCLK_Delay.v"
`include "decode.v"
`include "ram_32_44.v"

module DAC162H90A_dtop ( RESET, 
                         MCLK, 
                         DATA_LATCH,

                         MCLK_MODE_2,
                         MCLK_MODE_1,
                         MCLK_MODE_0,
                         DAC_PD,
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
                         STE,
                         STA_1,
                         STA_0,
                         DAC,
                         BYP,

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

                         acDACPD,
                         acLHM,
                         acRHM,
                         acLHV6,
                         acLHV5,
                         acLHV4,
                         acLHV3,
                         acLHV2,
                         acLHV1,
                         acLHV0,
                         acRHV6,
                         acRHV5,
                         acRHV4,
                         acRHV3,
                         acRHV2,
                         acRHV1,
                         acRHV0,
                         acSTE,
                         acSTA1,
                         acSTA0,
                         acDAC,
                         acBYP,

                         daY_L,
                         daY_R,
                         daPH1, 
                         daPH1D,
                         daPH2, 
                         daPH2D );

// INPUTS
input           RESET;        
input           MCLK;         
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
input           DATA_LATCH;   
input           MCLK_MODE_2;  
input           MCLK_MODE_1;  
input           MCLK_MODE_0;  
                              
                              
                              
                              
                              
input           DAC_PD;       
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
input           STE;           
input           STA_1;        
input           STA_0;        
                              
                              
input           DAC;          
input           BYP;          

// OUTPUTS

output          acDACPD;
output          acLHM;
output          acRHM;
output          acLHV6;
output          acLHV5;
output          acLHV4;
output          acLHV3;
output          acLHV2;
output          acLHV1;
output          acLHV0;
output          acRHV6;
output          acRHV5;
output          acRHV4;
output          acRHV3;
output          acRHV2;
output          acRHV1;
output          acRHV0;
output          acSTE;
output          acSTA1;
output          acSTA0;
output          acDAC;
output          acBYP;
output          daY_L;
output          daY_R;
output          daPH1;
output          daPH1D;
output          daPH2;
output          daPH2D;

wire    [25:0]  rom_data;
wire    [6:0]   rom_addr;
wire            rom_clk;
wire            addr_a_cycle;

wire    [17:0]	data_l;       
wire    [17:0]	data_r;       

wire    [3:0]   p2_shift;       
wire    [3:0]   p3_shift;       
wire    [3:0]   p4_shift;       
wire            p2_plus;        
wire            p3_plus;        
wire            p4_plus;

wire            ram_clk;
wire    [4:0]   ram_addr;
wire    [43:0]  data_to_ram;
wire    [43:0]  data_from_ram;
wire    [18:0]  filter_out_l;
wire    [18:0]  filter_out_r;
wire    [18:0]  fir_8x_out_l;
wire    [18:0]  fir_8x_out_r;
wire    [18:0]  modulator_in_l;
wire    [18:0]  modulator_in_r;



MCLK_Delay     uMCLK_Delay       ( .MCLK(MCLK),
                                   .MCLK_1delay(MCLK_1delay),
                                   .MCLK_2delay(MCLK_2delay));

clock_ckt      uclock_ckt        ( .reset(RESET),
                                   .MCLK(MCLK),
                                   .MCLK_1delay(MCLK_1delay),
                                   .MCLK_2delay(MCLK_2delay),
                                   .DAC_PD(DAC_PD),
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
                                   .STE(STE),
                                   .STA_1(STA_1),
                                   .STA_0(STA_0),
                                   .DAC(DAC),
                                   .BYP(BYP),
                                   .MCLK_MODE_2(MCLK_MODE_2),
                                   .MCLK_MODE_1(MCLK_MODE_1),
                                   .MCLK_MODE_0(MCLK_MODE_0),
                                   .dac_l_data({LDI_15,
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
                                                LDI_0
                                                } ),
                                   .dac_r_data({RDI_15,
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
                                                RDI_0
                                                } ),
                                   .data_lat(DATA_LATCH),
                                   .data_l(data_l),
                                   .data_r(data_r),
                                   .resetb(resetb),
                                   .rom_clk(rom_clk),
                                   .rom_addr(rom_addr),
                                   .p1(p1),
                                   .p2(p2),
                                   .p3(p3),
                                   .p4(p4),
                                   .addr_a_cycle(addr_a_cycle),
                                   .osr_clk(osr_clk),
                                   .daPH1(daPH1),
                                   .daPH1D(daPH1D),
                                   .daPH2(daPH2),
                                   .daPH2D(daPH2D),
                                   .acDACPD(acDACPD),
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
                                   .acLHM(acLHM),
                                   .acRHM(acRHM));

dac_rom        udac_rom          ( .MCLK_MODE_2(MCLK_MODE_2),
                                   .MCLK_MODE_1(MCLK_MODE_1),
                                   .MCLK_MODE_0(MCLK_MODE_0),
                                   .rom_addr(rom_addr),
                                   .rom_data(rom_data));

codec_decode         udecode           ( .rom_data(rom_data),
                                   .resetb(resetb),
                                   .sys_clk(MCLK_2delay),
                                   .addr_a_cycle(addr_a_cycle),
                                   .p1(p1),
                                   .p2(p2),
                                   .p3(p3),
                                   .p4(p4),
                                   .ram_clk(ram_clk),
                                   .ram_web(ram_web),
                                   .ram_addr(ram_addr),
                                   .p2_shift(p2_shift),
                                   .p3_shift(p3_shift),
                                   .p4_shift(p4_shift),
                                   .p2_plus(p2_plus),
                                   .p3_plus(p3_plus),
                                   .p4_plus(p4_plus),
                                   .p2_t_left(p2_t_left),
                                   .p2_ram_left(p2_ram_left),
                                   .p2_a_right(p2_a_right),
                                   .p2_write_reg_a(p2_write_reg_a),
                                   .p3_t_left(p3_t_left),
                                   .p3_a_right(p3_a_right),
                                   .p3_write_reg_a(p3_write_reg_a),
                                   .p4_ram_left(p4_ram_left),
                                   .p4_t_left(p4_t_left),
                                   .p4_y_left(p4_y_left),
                                   .p4_inport_left(p4_inport_left),
                                   .p4_a_right(p4_a_right),
                                   .p4_y_right(p4_y_right),
                                   .p4_write_reg_t(p4_write_reg_t),
                                   .p4_write_reg_a(p4_write_reg_a),
                                   .p4_write_outport(p4_write_outport),
                                   .p4_write_reg_y(p4_write_reg_y),
                                   .p4_write_memory(p4_write_memory),
                                   .addr_a_only(addr_a_only));


ram_32_44  udac_ram             ( .CK(ram_clk),
                                  .resetb(resetb ),
                                  .WEB(ram_web),
                                  .A(ram_addr),
                                  .DI(data_to_ram),
                                  .DO(data_from_ram));

filter ufilter_l                 ( .resetb(resetb),
                                   .p1(p1),
                                   .p2(p2),
                                   .p3(p3),
                                   .p4(p4),
                                   .MCLK_MODE_2(MCLK_MODE_2),
                                   .MCLK_MODE_1(MCLK_MODE_1),
                                   .MCLK_MODE_0(MCLK_MODE_0),
                                   .sys_clk(MCLK_2delay),
                                   .din(data_l),
                                   .dout(filter_out_l),
                                   .data_from_ram(data_from_ram[21:0]),
                                   .data_to_ram(data_to_ram[21:0]),
                                   .p2_shift(p2_shift),
                                   .p3_shift(p3_shift),
                                   .p4_shift(p4_shift),
                                   .p2_plus(p2_plus),
                                   .p3_plus(p3_plus),
                                   .p4_plus(p4_plus),
                                   .p2_t_left(p2_t_left),
                                   .p2_ram_left(p2_ram_left),
                                   .p2_a_right(p2_a_right),
                                   .p2_write_reg_a(p2_write_reg_a),
                                   .p3_t_left(p3_t_left),
                                   .p3_a_right(p3_a_right),
                                   .p3_write_reg_a(p3_write_reg_a),
                                   .p4_ram_left(p4_ram_left),
                                   .p4_t_left(p4_t_left),
                                   .p4_y_left(p4_y_left),
                                   .p4_inport_left(p4_inport_left),
                                   .p4_a_right(p4_a_right),
                                   .p4_y_right(p4_y_right),
                                   .p4_write_reg_t(p4_write_reg_t),
                                   .p4_write_reg_a(p4_write_reg_a),
                                   .p4_write_outport(p4_write_outport),
                                   .p4_write_reg_y(p4_write_reg_y));

filter ufilter_r                 ( .resetb(resetb),
                                   .p1(p1),
                                   .p2(p2),
                                   .p3(p3),
                                   .p4(p4),
                                   .MCLK_MODE_2(MCLK_MODE_2),
                                   .MCLK_MODE_1(MCLK_MODE_1),
                                   .MCLK_MODE_0(MCLK_MODE_0),
                                   .sys_clk(MCLK),
                                   .din(data_r),
                                   .dout(filter_out_r),
                                   .data_from_ram(data_from_ram[43:22]),
                                   .data_to_ram(data_to_ram[43:22]),
                                   .p2_shift(p2_shift),
                                   .p3_shift(p3_shift),
                                   .p4_shift(p4_shift),
                                   .p2_plus(p2_plus),
                                   .p3_plus(p3_plus),
                                   .p4_plus(p4_plus),
                                   .p2_t_left(p2_t_left),
                                   .p2_ram_left(p2_ram_left),
                                   .p2_a_right(p2_a_right),
                                   .p2_write_reg_a(p2_write_reg_a),
                                   .p3_t_left(p3_t_left),
                                   .p3_a_right(p3_a_right),
                                   .p3_write_reg_a(p3_write_reg_a),
                                   .p4_ram_left(p4_ram_left),
                                   .p4_t_left(p4_t_left),
                                   .p4_y_left(p4_y_left),
                                   .p4_inport_left(p4_inport_left),
                                   .p4_a_right(p4_a_right),
                                   .p4_y_right(p4_y_right),
                                   .p4_write_reg_t(p4_write_reg_t),
                                   .p4_write_reg_a(p4_write_reg_a),
                                   .p4_write_outport(p4_write_outport),
                                   .p4_write_reg_y(p4_write_reg_y));

fir_8x         ufir_8x_l         ( .resetb(resetb),
                                   .fir_8x_bit(rom_data[21:20]),
                                   .p2(p2),
                                   .fir_8x_in(filter_out_l),
                                   .fir_8x_out(fir_8x_out_l) );

fir_8x         ufir_8x_r         ( .resetb(resetb),
                                   .fir_8x_bit(rom_data[21:20]),
                                   .p2(p2),
                                   .fir_8x_in(filter_out_r),
                                   .fir_8x_out(fir_8x_out_r) );

assign modulator_in_l = (!MCLK_MODE_1) ? filter_out_l : fir_8x_out_l;

noise_shaper   unoise_shaper_l   ( .resetb(resetb),
                                   .osr_clk(osr_clk),
                                   .xin(modulator_in_l),
                                   .msb(daY_L) );

assign modulator_in_r = (!MCLK_MODE_1) ? filter_out_r : fir_8x_out_r;

noise_shaper   unoise_shaper_r   ( .resetb(resetb),
                                   .osr_clk(osr_clk),
                                   .xin(modulator_in_r),
                                   .msb(daY_R) );

endmodule // DAC162H90A_dtop


module clock_ckt ( reset,
                   MCLK,
                   MCLK_1delay,
                   MCLK_2delay,
                   dac_l_data,
                   dac_r_data,
                   data_lat,
                   MCLK_MODE_2,
                   MCLK_MODE_1,
                   MCLK_MODE_0,
                   DAC_PD,
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
                   STE,
                   STA_1,
                   STA_0,
                   DAC,
                   BYP,
                   p1,
                   p2,
                   p3,
                   p4,
                   addr_a_cycle,
                   resetb,
                   acDACPD,
                   acLHM,
                   acRHM,
                   acLHV6,
                   acLHV5,
                   acLHV4,
                   acLHV3,
                   acLHV2,
                   acLHV1,
                   acLHV0,
                   acRHV6,
                   acRHV5,
                   acRHV4,
                   acRHV3,
                   acRHV2,
                   acRHV1,
                   acRHV0,
                   acSTE,
                   acSTA1,
                   acSTA0,
                   acDAC,
                   acBYP,
                   data_l,
                   data_r,
                   rom_clk,
                   rom_addr,
                   osr_clk,
                   daPH1,
                   daPH1D,
                   daPH2,
                   daPH2D);

// INPUTS
input              reset;
input              MCLK;
input              MCLK_1delay;
input              MCLK_2delay;
input              data_lat;
input  [15:0]      dac_l_data;
input  [15:0]      dac_r_data;
input              MCLK_MODE_2;
input              MCLK_MODE_1;
input              MCLK_MODE_0;
input              DAC_PD;
input              LHM;
input              RHM;
input              LHV_6;
input              LHV_5;
input              LHV_4;
input              LHV_3;
input              LHV_2;
input              LHV_1;
input              LHV_0;
input              RHV_6;
input              RHV_5;
input              RHV_4;
input              RHV_3;
input              RHV_2;
input              RHV_1;
input              RHV_0;
input              STE;
input              STA_1;
input              STA_0;
input              DAC;
input              BYP;

// OUTPUTS

output  [17:0]    data_l;
output  [17:0]    data_r;
output            resetb;
output            p1;
output            p2;
output            p3;
output            p4;
output            addr_a_cycle;
output            rom_clk;
output    [6:0]   rom_addr;
output            osr_clk;
output            acDACPD;
output            acLHM;
output            acRHM;
output            acLHV6;
output            acLHV5;
output            acLHV4;
output            acLHV3;
output            acLHV2;
output            acLHV1;
output            acLHV0;
output            acRHV6;
output            acRHV5;
output            acRHV4;
output            acRHV3;
output            acRHV2;
output            acRHV1;
output            acRHV0;
output            acSTE;
output            acSTA1;
output            acSTA0;
output            acDAC;
output            acBYP;
output            daPH1;
output            daPH1D;
output            daPH2;
output            daPH2D;
 

// INOUTS

reg             resetb;

reg             data_lat_d1;
wire            data_lat_F;
reg     [17:0]	data_l;	 
reg     [17:0]	data_r;	 
reg	[10:0]	counter;	 
reg             p1;
reg             p2;
reg             p3;
reg             p4;

reg             rom_clk;
reg	[6:0]	rom_addr; 
reg             osr_clk;

wire            acDACPD;
wire            acLHM;
wire            acRHM;
wire            acLHV6;
wire            acLHV5;
wire            acLHV4;
wire            acLHV3;
wire            acLHV2;
wire            acLHV1;
wire            acLHV0;
wire            acRHV6;
wire            acRHV5;
wire            acRHV4;
wire            acRHV3;
wire            acRHV2;
wire            acRHV1;
wire            acRHV0;
wire            acSTE;
wire            acSTA1;
wire            acSTA0;
wire            acDAC;
wire            acBYP;

reg             addr_a_cycle;

reg     [3:0]   p2_shift;       // Phase 2 Shift Value
reg     [3:0]   p3_shift;       // Phase 3 Shift Value
reg     [3:0]   p4_shift;       // Phase 4 Shift Value
reg             p2_plus;        // Phase 2 +- operation
reg             p3_plus;        // Phase 3 +- operation
reg             p4_plus;        // Phase 4 +- operation



always @(posedge reset or posedge MCLK_2delay)
  if (reset)
      resetb <=  1'b0;
  else
      resetb <=  !DAC_PD;

assign acDACPD   = DAC_PD;
assign acLHM     = ({LHV_6,LHV_5,LHV_4,LHV_3,LHV_2,LHV_1,LHV_0} == 7'b0110000) ? 1'b1 :
                   ({LHV_6,LHV_5,LHV_4} == 3'b001)                             ? 1'b1 :
                   ({LHV_6,LHV_5,LHV_4} == 3'b010)                             ? 1'b1 :
                   LHM;
assign acRHM     = ({RHV_6,RHV_5,RHV_4,RHV_3,RHV_2,RHV_1,RHV_0} == 7'b0110000) ? 1'b1 :
                   ({RHV_6,RHV_5,RHV_4} == 3'b001)                             ? 1'b1 :
                   ({RHV_6,RHV_5,RHV_4} == 3'b010)                             ? 1'b1 :
                   RHM;
assign acLHV6    = LHV_6;
assign acLHV5    = LHV_5;
assign acLHV4    = LHV_4;
assign acLHV3    = LHV_3;
assign acLHV2    = LHV_2;
assign acLHV1    = LHV_1;
assign acLHV0    = LHV_0;
assign acRHV6    = RHV_6;
assign acRHV5    = RHV_5;
assign acRHV4    = RHV_4;
assign acRHV3    = RHV_3;
assign acRHV2    = RHV_2;
assign acRHV1    = RHV_1;
assign acRHV0    = RHV_0;
assign acSTE     = STE;
assign acSTA1    = STA_1;
assign acSTA0    = STA_0;
assign acDAC     = DAC;
assign acBYP     = BYP;


always @(negedge resetb or posedge MCLK_2delay)
  if (~resetb)
       data_lat_d1 <=  1'b0;
  else
       data_lat_d1 <=  data_lat;

assign data_lat_F = (!data_lat) && data_lat_d1;

always @(negedge resetb or posedge MCLK_2delay)
  if (~resetb) begin
       data_l <=  18'b0;
       data_r <=  18'b0;
  end
  else begin
       if (data_lat_F) begin
           data_l <=  {dac_l_data,2'b0};
           data_r <=  {dac_r_data,2'b0};
       end
  end


always @(negedge resetb or posedge MCLK_2delay)
  if (!resetb)
       counter <=  11'h0;
  else begin
       if (data_lat_F)
           counter <=  11'h0;
       else
           counter <=  counter + 1;
  end



always @(negedge resetb or posedge MCLK_2delay)
  if (!resetb)
       p1 <=  1'b0;
  else begin
       if (MCLK_MODE_2) begin
           p1 <=  (counter[1] && !counter[0]);
       end else if (MCLK_MODE_0) begin 
           if (!counter[3] && !counter[2] && counter[1] && !counter[0])
               p1 <=  1'b1;
           else 
               p1 <=  1'b0;
       end else begin
           if (!counter[2] && counter[1] && !counter[0])
               p1 <=  1'b1;
           else 
               p1 <=  1'b0;
       end
  end

always @(negedge resetb or posedge MCLK_2delay)
  if (!resetb)
       p2 <=  1'b0;
  else begin
       if (MCLK_MODE_2) begin
           p2 <=  (counter[1] && counter[0]);
       end else if (MCLK_MODE_0) begin 
           if (!counter[3] && counter[2] && counter[1] && !counter[0])
               p2 <=  1'b1;
           else 
               p2 <=  1'b0;
       end else begin
           if (counter[2] && !counter[1] && !counter[0])
               p2 <=  1'b1;
           else
               p2 <=  1'b0;
       end
  end

always @(negedge resetb or posedge MCLK_2delay)
  if (!resetb)
       p3 <=   1'b0;
  else begin
       if (MCLK_MODE_2) begin
          p3 <=  (!counter[1] && !counter[0]);
       end else if (MCLK_MODE_0) begin 
           if (counter[3] && !counter[2] && counter[1] && !counter[0])
               p3 <=  1'b1;
           else 
               p3 <=  1'b0;
       end else begin
           if (counter[2] && counter[1] && !counter[0])
               p3 <=  1'b1;
           else 
               p3 <=  1'b0;
       end
  end

always @(negedge resetb or posedge MCLK_2delay)
  if (!resetb)
       p4 <=   1'b0;
  else begin
       if (MCLK_MODE_2) begin
          p4 <=  (!counter[1] && counter[0]);
       end else if (MCLK_MODE_0) begin 
           if (counter[3] && counter[2] && counter[1] && !counter[0])
               p4 <=  1'b1;
           else 
               p4 <=  1'b0;
       end else begin
           if (!counter[2] && !counter[1] && !counter[0])
               p4 <=  1'b1;
           else
               p4 <=  1'b0;
       end
  end



always @(negedge resetb or posedge MCLK_2delay)
  if (~resetb)
      rom_clk <=  1'b0;
  else begin
      if (counter == 11'h0)
          rom_clk <=  1'b0;
      else if (MCLK_MODE_2) begin
           if (counter[0]) 
               rom_clk <=  ~rom_clk;
      end else if (MCLK_MODE_0) begin 
           if (counter[2] && counter[1] && counter[0])
               rom_clk <=  ~rom_clk;
      end else begin
           if (counter[1] && counter[0])
               rom_clk <=  ~rom_clk;
      end            
  end


always @(negedge resetb or posedge MCLK_2delay)
  if (~resetb)
      osr_clk <=  1'b0;
  else begin
      if (counter == 11'h0)
          osr_clk <=  1'b0;
      else if (counter[0])
          osr_clk <=  ~osr_clk;
  end


reg     osr_clk_2pre, osr_clk_1pre;

reg     osr_clk_sys_d1;

always @(negedge resetb or posedge MCLK)
  if (~resetb)
      osr_clk_sys_d1 <=   1'b0;
  else
      osr_clk_sys_d1 <=   osr_clk;

always @(negedge resetb or posedge MCLK)
  if (~resetb)
      osr_clk_2pre <=   1'b0;
  else begin
      if (osr_clk_sys_d1 && osr_clk)
          osr_clk_2pre <=   1'b0;
      else if (!osr_clk && !osr_clk_sys_d1)
          osr_clk_2pre <=   1'b1;
  end

reg   osr_clk_sys_1delay_d1;

always @(negedge resetb or posedge MCLK_1delay)
  if (~resetb)
      osr_clk_sys_1delay_d1 <=   1'b0;
  else
      osr_clk_sys_1delay_d1 <=   osr_clk;

always @(negedge resetb or posedge MCLK_1delay)
  if (~resetb)
      osr_clk_1pre <=   1'b0;
  else begin
      if (osr_clk_sys_1delay_d1 && osr_clk)
          osr_clk_1pre <=   1'b0;
      else if (!osr_clk && !osr_clk_sys_1delay_d1)
          osr_clk_1pre <=   1'b1;
  end

assign daPH1  = resetb && !DAC_PD && osr_clk && osr_clk_2pre;
assign daPH1D = resetb && !DAC_PD && osr_clk && osr_clk_1pre;
assign daPH2  = resetb && !DAC_PD && !(osr_clk || osr_clk_2pre);
assign daPH2D = resetb && !DAC_PD && !(osr_clk || osr_clk_1pre);



always @(negedge resetb or posedge MCLK_2delay)
  if (~resetb)
      rom_addr <=   7'b0;
  else begin
      if (MCLK_MODE_2 & !MCLK_MODE_0) begin
          if (counter[1:0] == 2'b00)
              rom_addr <=  {1'b0,counter[7:2]};
      end else if (MCLK_MODE_2 & MCLK_MODE_0) begin
          if (counter[1:0] == 2'b00)
              rom_addr <=  counter[8:2];
      end else if (MCLK_MODE_0) begin
          if (counter[3:0] == 4'b0000)
              rom_addr <=  counter[10:4];
      end else begin
          if (counter[2:0] == 3'b000)
              rom_addr <=  counter[9:3];
      end
  end


always @(negedge resetb or negedge MCLK_2delay)
  if (~resetb)
      addr_a_cycle <=   1'b0;
  else begin
      if (p1)
          addr_a_cycle <=   1'b1;
      else if (p3)
          addr_a_cycle <=   1'b0;
  end

endmodule     


module dac_rom (MCLK_MODE_2, MCLK_MODE_1, MCLK_MODE_0, rom_addr, rom_data);

input         MCLK_MODE_2;
input         MCLK_MODE_1;
input         MCLK_MODE_0;
input  [6:0]  rom_addr;
output [25:0] rom_data;

reg    [25:0] rom_data_256_128;
reg    [25:0] rom_data_272_136;
wire   [25:0] rom_data;

wire   mode_128, mode_136;


assign mode_128 = (MCLK_MODE_2 && MCLK_MODE_1 && !MCLK_MODE_0);

always @(rom_addr or mode_128)
begin
  casex (rom_addr)
    7'd0        : if (mode_128)
                      rom_data_256_128 <= 26'b10011110011000000000000000; // Out M(19)
                  else
                      rom_data_256_128 <= 26'b10011111001000000000000000; // Out M(25)
    7'd1        : rom_data_256_128 <= 26'b01100000000000000000000000;
    7'd2        : rom_data_256_128 <= 26'b10000000000000000000000000;
    7'd3        : rom_data_256_128 <= 26'b00010000000001000100000000;
    7'd4        : rom_data_256_128 <= 26'b00110000000110001000111011;
    7'd5        : rom_data_256_128 <= 26'b00010000001001000000000000;
    7'd6        : rom_data_256_128 <= 26'b00110000000111001100101001;
    7'd7        : rom_data_256_128 <= 26'b00010000010000111100000000;
    7'd8        : rom_data_256_128 <= 26'b00111000000010001101011000;
    7'd9        : rom_data_256_128 <= 26'b00010000011000111000000000;
    7'd10       : rom_data_256_128 <= 26'b00110000000001001101010111;
    7'd11       : rom_data_256_128 <= 26'b00010000100000110100000000;
    7'd12       : rom_data_256_128 <= 26'b00110000000110001001100110;
    7'd13       : rom_data_256_128 <= 26'b00010000101000110000000000;
    7'd14       : rom_data_256_128 <= 26'b00100000000101001000100011;
    7'd15       : rom_data_256_128 <= 26'b01000000000011000000110101;
    7'd16       : if (mode_128)
                      rom_data_256_128 <= 26'b10011110101000000000000000; // Out M(21)
                  else
                      rom_data_256_128 <= 26'b10011111010000000000000000; // Out M(26)
    7'd17       : rom_data_256_128 <= 26'b00010000110000101100000000;
    7'd18       : rom_data_256_128 <= 26'b00100000000111001000100010;
    7'd19       : rom_data_256_128 <= 26'b01010000000000000000000100;
    7'd20       : rom_data_256_128 <= 26'b00010000111000101000000000;
    7'd21       : rom_data_256_128 <= 26'b00100000000111001100110011;
    7'd22       : rom_data_256_128 <= 26'b01000000000011000000100011;
    7'd23       : rom_data_256_128 <= 26'b00010001000000100100000000;
    7'd24       : rom_data_256_128 <= 26'b00101000000010001000100100;
    7'd25       : rom_data_256_128 <= 26'b01000000000000000000100010;
    7'd26       : rom_data_256_128 <= 26'b01110010010000000000000000;
    7'd27       : rom_data_256_128 <= 26'b10100001000000000000000000;
    7'd28       : rom_data_256_128 <= 26'b01110010100000000000000001;
    7'd29       : rom_data_256_128 <= 26'b01100000000000000000000000;
    7'd30       : rom_data_256_128 <= 26'b00010010010001011000000000;
    7'd31       : if (mode_128)
                      rom_data_256_128 <= 26'b11110000000000000000000000;
                  else
                      rom_data_256_128 <= 26'b00100000000110001000110010;
    7'd32       : rom_data_256_128 <= 26'b10011111011000000000000000;    // Out M(27)
    7'd33       : rom_data_256_128 <= 26'b01000000000001000000100101;
    7'd34       : rom_data_256_128 <= 26'b00010010101001001100000000;
    7'd35       : rom_data_256_128 <= 26'b00100000000000001101100010;
    7'd36       : rom_data_256_128 <= 26'b01000000000000000000110010;
    7'd37       : rom_data_256_128 <= 26'b01110010111000000000000000;
    7'd38       : rom_data_256_128 <= 26'b10100010101000000000000000;
    7'd39       : rom_data_256_128 <= 26'b01110011000000000000000001;
    7'd40       : rom_data_256_128 <= 26'b01101000000000000000000000;
    7'd41       : rom_data_256_128 <= 26'b00010010100001001100000000;
    7'd42       : rom_data_256_128 <= 26'b00100000000110001000110010;
    7'd43       : rom_data_256_128 <= 26'b01000000000001000000100101;
    7'd44       : rom_data_256_128 <= 26'b00010010010001010100000000;
    7'd45       : rom_data_256_128 <= 26'b00100000000000001101100010;
    7'd46       : rom_data_256_128 <= 26'b01000000000000000000110010;
    7'd47       : rom_data_256_128 <= 26'b01110011001000000000000000;
    7'd48       : rom_data_256_128 <= 26'b10011110111000000000000000;   // Out M(23)
    7'd49       : rom_data_256_128 <= 26'b10100010010000000000000000;
    7'd50       : rom_data_256_128 <= 26'b01110011010000000000000001;
    7'd51       : rom_data_256_128 <= 26'b00000000000000000000000000;
    7'd52       : rom_data_256_128 <= 26'b00000000000000000000000000;
    7'd53       : rom_data_256_128 <= 26'b00000000000000000000000000;
    7'd54       : rom_data_256_128 <= 26'b00000000000000000000000000;
    7'd55       : rom_data_256_128 <= 26'b00000000000000000000000000;
    7'd56       : rom_data_256_128 <= 26'b00001000000000000000000000;
    7'd57       : rom_data_256_128 <= 26'b00000000000000000000000000;
    7'd58       : rom_data_256_128 <= 26'b00000000000000000000000000;
    7'd59       : rom_data_256_128 <= 26'b00000000000000000000000000;
    7'd60       : rom_data_256_128 <= 26'b00000000000000000000000000;
    7'd61       : rom_data_256_128 <= 26'b00000000000000000000000000;
    7'd62       : rom_data_256_128 <= 26'b00000000000000000000000000;
    7'd63       : rom_data_256_128 <= 26'b11110000000000000000000000;
    default	: rom_data_256_128 <= 26'b00000000000000000000000000;
 endcase
end

assign mode_136 = MCLK_MODE_2 && !MCLK_MODE_1 && !MCLK_MODE_0;

always @(rom_addr or mode_136)
begin
  casex (rom_addr)
    7'd0        : if (mode_136)
                      rom_data_272_136 <= 26'b10010010011000000000000000; // Out M(19)
                  else
                      rom_data_272_136 <= 26'b10010011001000000000000000; // Out M(25)
    7'd1        : rom_data_272_136 <= 26'b00000000000000000000000000; // Added Idle
    7'd2        : rom_data_272_136 <= 26'b01100000000000000000000000;
    7'd3        : rom_data_272_136 <= 26'b10000000000000000000000000;
    7'd4        : rom_data_272_136 <= 26'b00010000000001000100000000;
    7'd5        : rom_data_272_136 <= 26'b00110000000110001000111011;
    7'd6        : rom_data_272_136 <= 26'b00010000001001000000000000;
    7'd7        : rom_data_272_136 <= 26'b00110000000111001100101001;
    7'd8        : rom_data_272_136 <= 26'b00010000010000111100000000;
    7'd9        : rom_data_272_136 <= 26'b00110000000010001101011000;
    7'd10       : rom_data_272_136 <= 26'b00010000011000111000000000;
    7'd11       : rom_data_272_136 <= 26'b00110000000001001101010111;
    7'd12       : rom_data_272_136 <= 26'b00010000100000110100000000;
    7'd13       : rom_data_272_136 <= 26'b00110000000110001001100110;
    7'd14       : rom_data_272_136 <= 26'b00010000101000110000000000;
    7'd15       : rom_data_272_136 <= 26'b00100000000101001000100011;
    7'd16       : rom_data_272_136 <= 26'b01000000000011000000110101;
    7'd17       : if (mode_136)
                      rom_data_272_136 <= 26'b10010010101000000000000000; // Out M(21)
                  else
                      rom_data_272_136 <= 26'b10010011010000000000000000; // Out M(26)
    7'd18       : rom_data_272_136 <= 26'b00000000000000000000000000; // Added Idle
    7'd19       : rom_data_272_136 <= 26'b00010000110000101100000000;
    7'd20       : rom_data_272_136 <= 26'b00100000000111001000100010;
    7'd21       : rom_data_272_136 <= 26'b01010000000000000000000100;
    7'd22       : rom_data_272_136 <= 26'b00010000111000101000000000;
    7'd23       : rom_data_272_136 <= 26'b00100000000111001100110011;
    7'd24       : rom_data_272_136 <= 26'b01000000000011000000100011;
    7'd25       : rom_data_272_136 <= 26'b00010001000000100100000000;
    7'd26       : rom_data_272_136 <= 26'b00100000000010001000100100;
    7'd27       : rom_data_272_136 <= 26'b01000000000000000000100010;
    7'd28       : rom_data_272_136 <= 26'b01110010010000000000000000;
    7'd29       : rom_data_272_136 <= 26'b10100001000000000000000000;
    7'd30       : rom_data_272_136 <= 26'b01110010100000000000000001;
    7'd31       : rom_data_272_136 <= 26'b01100000000000000000000000;
    7'd32       : rom_data_272_136 <= 26'b00010010010001011000000000;
    7'd33       : if (mode_136)
                      rom_data_272_136 <= 26'b11110000000000000000000000;  //DBC
                  else
                      rom_data_272_136 <= 26'b00100000000110001000110010;
    7'd34       : rom_data_272_136 <= 26'b10010011011000000000000000;  // Out M(27)
    7'd35       : rom_data_272_136 <= 26'b00000000000000000000000000; // Added Idle
    7'd36       : rom_data_272_136 <= 26'b01000000000001000000100101;
    7'd37       : rom_data_272_136 <= 26'b00010010101001001100000000;
    7'd38       : rom_data_272_136 <= 26'b00100000000000001101100010;
    7'd39       : rom_data_272_136 <= 26'b01000000000000000000110010;
    7'd40       : rom_data_272_136 <= 26'b01110010111000000000000000;
    7'd41       : rom_data_272_136 <= 26'b10100010101000000000000000;
    7'd42       : rom_data_272_136 <= 26'b01110011000000000000000001;
    7'd43       : rom_data_272_136 <= 26'b01100000000000000000000000;
    7'd44       : rom_data_272_136 <= 26'b00010010100001001100000000;
    7'd45       : rom_data_272_136 <= 26'b00100000000110001000110010;
    7'd46       : rom_data_272_136 <= 26'b01000000000001000000100101;
    7'd47       : rom_data_272_136 <= 26'b00010010010001010100000000;
    7'd48       : rom_data_272_136 <= 26'b00100000000000001101100010;
    7'd49       : rom_data_272_136 <= 26'b01000000000000000000110010;
    7'd50       : rom_data_272_136 <= 26'b01110011001000000000000000;
    7'd51       : rom_data_272_136 <= 26'b10010010111000000000000000; // Out M(23)
    7'd52       : rom_data_272_136 <= 26'b00000000000000000000000000; // Added Idle
    7'd53       : rom_data_272_136 <= 26'b10100010010000000000000000;
    7'd54       : rom_data_272_136 <= 26'b01110011010000000000000001;
    7'd55       : rom_data_272_136 <= 26'b00000000000000000000000000;
    7'd56       : rom_data_272_136 <= 26'b00000000000000000000000000;
    7'd57       : rom_data_272_136 <= 26'b00000000000000000000000000;
    7'd58       : rom_data_272_136 <= 26'b00000000000000000000000000;
    7'd59       : rom_data_272_136 <= 26'b00000000000000000000000000;
    7'd60       : rom_data_272_136 <= 26'b00000000000000000000000000;
    7'd61       : rom_data_272_136 <= 26'b00000000000000000000000000;
    7'd62       : rom_data_272_136 <= 26'b00000000000000000000000000;
    7'd63       : rom_data_272_136 <= 26'b00000000000000000000000000;
    7'd64       : rom_data_272_136 <= 26'b00000000000000000000000000;
    7'd65       : rom_data_272_136 <= 26'b00000000000000000000000000;
    7'd66       : rom_data_272_136 <= 26'b00000000000000000000000000;
    7'd67       : rom_data_272_136 <= 26'b11110000000000000000000000;
    default	: rom_data_272_136 <= 26'b00000000000000000000000000;
 endcase
end

assign rom_data = MCLK_MODE_1 ? rom_data_256_128 : rom_data_272_136;

endmodule // dac_rom



module filter ( resetb,
                p1,
                p2,
                p3,
                p4,
                sys_clk,
                MCLK_MODE_2,
                MCLK_MODE_1,
                MCLK_MODE_0,
                din, dout,
                data_from_ram,
                data_to_ram,
                p2_shift,
                p3_shift,
                p4_shift,
                p2_plus,
                p3_plus,
                p4_plus,
                p2_t_left,
                p2_ram_left,
                p2_a_right,
                p2_write_reg_a,
                p3_t_left,
                p3_a_right,
                p3_write_reg_a,
                p4_ram_left,
                p4_t_left,
                p4_y_left,
                p4_inport_left,
                p4_a_right,
                p4_y_right,
                p4_write_reg_t,
                p4_write_reg_a,
                p4_write_outport,
                p4_write_reg_y
                );

// INPUTS
input                         resetb;
input 	      		      p1;  
input 	      		      p2;  
input 	      		      p3;  
input 	      		      p4;  
input 	      		      MCLK_MODE_2;  
input 	      		      MCLK_MODE_1;  
input 	      		      MCLK_MODE_0;  
input 	[17:0]                din; 		
input                         sys_clk; 	
input 	[21:0]                data_from_ram; 	

input   [3:0]                 p2_shift;
input   [3:0]                 p3_shift;
input   [3:0]                 p4_shift;
input                         p2_plus;
input                         p3_plus;
input                         p4_plus;
input                         p2_t_left;
input                         p2_ram_left;
input                         p2_a_right;
input                         p2_write_reg_a;
input                         p3_t_left;
input                         p3_a_right;
input                         p3_write_reg_a;
input                         p4_ram_left;
input                         p4_t_left;
input                         p4_y_left;
input                         p4_inport_left;
input                         p4_a_right;
input                         p4_y_right;
input                         p4_write_reg_t;
input                         p4_write_reg_a;
input                         p4_write_outport;
input                         p4_write_reg_y;


// OUTPUTS
output	[18:0]                dout; 	
output	[21:0]                data_to_ram; 	

// INOUTS

wire    [21:0]                data_to_ram; 

wire    [3:0]		      p2_shift;      
wire    [3:0]		      p3_shift;      
wire    [3:0]		      p4_shift;      
wire         		      p2_plus;      
wire         		      p3_plus;      
wire         		      p4_plus;     
wire         		      operation;   
wire    [3:0]		      shift;   

wire            p2_t_left;
wire            p2_ram_left; 
wire            p2_a_right;
wire            p2_write_reg_a; 
wire            p3_t_left; 
wire            p3_a_right; 
wire            p3_write_reg_a;
wire            p4_ram_left;
wire            p4_t_left;
wire            p4_y_left;
wire            p4_inport_left;
wire            p4_a_right;
wire            p4_y_right;
wire            p4_write_reg_t;
wire            p4_write_reg_a;
wire            p4_write_outport;
wire            p4_write_reg_y;

reg 	[21:0]	reg_a;	
reg 	[21:0]	reg_t;	
reg 	[21:0]	reg_y;	
reg     [21:0]	l_operand;
reg     [21:0]	rounding_in;	
wire				carry_in;
wire    [21:0]	r_operand;	
wire	[21:0]	accumulator;
reg     [18:0]	dout; 	




always @( p1 or p2 or p3 or
         p2_t_left or p2_ram_left or
         p3_t_left or
         p4_t_left or p4_ram_left or p4_y_left or p4_inport_left or
         reg_t or data_from_ram or reg_y  or din)
begin
  if (p1 | p2)
      casex ({p2_t_left, p2_ram_left})   // synopsys parallel_case
        2'b1?   : l_operand <=   reg_t;
        2'b?1   : l_operand <=   data_from_ram;
        default : l_operand <=   22'h0;
      endcase
  else if (p3)
      casex (p3_t_left)   // synopsys parallel_case
        1'b1     : l_operand <=   reg_t;
        default  : l_operand <=   22'h0;
      endcase
  else
      casex ({p4_t_left, p4_ram_left, p4_y_left, p4_inport_left}) // synopsys parallel_case
        4'b1??? : l_operand <=   reg_t;
        4'b?1?? : l_operand <=   data_from_ram;
        4'b??1? : l_operand <=   reg_y;
        4'b???1 : if (MCLK_MODE_2 && !MCLK_MODE_0)
                      l_operand <=  { din[17], din[17], din[15], din, 1'b0};
                  else
                      l_operand <=  { din[17], din[17], din, 2'b0};
        default : l_operand <=   22'h0;
  endcase
end


always @(p1 or p2 or p3 or
         p2_a_right or
         p3_a_right or
         p4_a_right or
         p4_y_right or
         reg_a or reg_y )
begin
  if (p1 | p2) begin
      casex (p2_a_right)   // synopsys parallel_case
        1'b1     : rounding_in <=   reg_a;
        default  : rounding_in <=   22'h0;
      endcase
  end
  else if (p3) 
      casex (p3_a_right)   // synopsys parallel_case
        1'b1     : rounding_in <=   reg_a;
        default  : rounding_in <=   22'h0;
      endcase
  else begin
      casex ({p4_a_right, p4_y_right})   // synopsys parallel_case
        2'b1?    : rounding_in <=   reg_a;
        2'b?1    : rounding_in <=   reg_y;
        default  : rounding_in <=   22'h0;
      endcase
  end
end

assign   operation = (p1 | p2) ? p2_plus  :
                         p3    ? p3_plus  : p4_plus;

assign   shift     = (p1 | p2) ? p2_shift :
                         p3    ? p3_shift : p4_shift;

                    
rounding   urounding   ( .din(rounding_in),
                         .operation(operation),
                         .shift(shift),
                         .dout(r_operand),
                         .carry(carry_in) );


assign  accumulator = l_operand + r_operand + carry_in;


assign   data_to_ram = resetb ? accumulator : 22'h0;

always @(negedge resetb or posedge sys_clk)
  if (~resetb)
      reg_a <=   22'h0;
  else
      if (p2 && p2_write_reg_a)
          reg_a <=   accumulator;
      else if (p3 && p3_write_reg_a)
          reg_a <=   accumulator;
      else if (p4 && p4_write_reg_a)
          reg_a <=   accumulator;
      else
          reg_a <=   reg_a;

always @(negedge resetb or posedge sys_clk)
  if (~resetb)
      reg_t <=   22'h0;
  else
      if (p4 && p4_write_reg_t)
          reg_t <=   accumulator;
      else
          reg_t <=   reg_t;

always @(negedge resetb or posedge sys_clk)
  if (~resetb)
      reg_y <=   22'h0;
  else
      if (p4 && p4_write_reg_y)
          reg_y <=   accumulator;
      else
          reg_y <=   reg_y;


always @(negedge resetb or posedge sys_clk)
  if (~resetb)
      dout <=  19'h0;
  else begin
      if (p4 && p4_write_outport)
          casex (accumulator[18:17])   // synopsys parallel_case
            2'b00    : dout <=   {accumulator[17:0],1'b0};
            2'b01    : dout <=   19'b0111111111111111111;
            2'b10    : dout <=   19'b1000000000000000000;
            2'b11    : dout <=   {accumulator[17:0],1'b0};
            default  : dout <=   {accumulator[17:0],1'b0};
          endcase
      else
          dout <=   dout;
  end

endmodule    // filter 


module rounding ( operation, din, shift, dout, carry ); 

// INPUTS
input                           operation; 
input 	[21:0]			din; 	   
input 	[3:0]	                shift; 	   

// OUTPUTS
output	[21:0]	                dout;    
output	                      	carry; 	

// INOUTS

reg    [21:0]                  din_shift;
wire   [21:0]                  dout;

reg      pos_carry;
reg      neg_carry;
reg      carry;	               


always @(din or shift)
begin
  case (shift) // synthesis parallel_case
        4'h0 : begin
               din_shift  <=  din;
               neg_carry  <=  1'b1;
               pos_carry  <=  1'b0;
               end
        4'h1 : begin
               din_shift  <=  {din[21],din[21:1]};
               neg_carry  <=  1'b1;
               pos_carry  <=  din[0];
               end
        4'h2 : begin
               din_shift  <=  {din[21],din[21],din[21:2]};
               neg_carry  <=  din[1]&din[0];
               pos_carry  <=  din[1];
               end
        4'h3 : begin
               din_shift  <=  {din[21],din[21],din[21],din[21:3]};
               neg_carry  <=  din[2]&(din[1]|din[0]);
               pos_carry  <=  din[2];
               end
        4'h4 : begin
               din_shift  <=  {din[21],din[21],din[21],
                                    din[21],din[21:4]};
	       neg_carry  <=  din[3]&(din[2]|din[1]|din[0]);
               pos_carry  <=  din[3];
               end
        4'h5 : begin
               din_shift  <=  {din[21],din[21],din[21],
                                    din[21],din[21],din[21:5]};
	       neg_carry  <=  din[4]&(din[3]|din[2]|din[1]|din[0]);
	       pos_carry  <=  din[4];
               end
        4'h6 : begin
               din_shift  <=  {din[21],din[21],din[21],
                                    din[21],din[21],din[21],din[21:6]};
               neg_carry  <=  din[5]&(din[4]|din[3]|din[2]|din[1]|din[0]);
               pos_carry  <=  din[5];
               end
        4'h7 : begin
               din_shift  <=  {din[21],din[21],din[21],
                                    din[21],din[21],din[21],din[21],
                                    din[21:7]};
               neg_carry  <=  din[6]&(din[5]|din[4]|din[3]|din[2]|din[1]|din[0]);
               pos_carry  <=  din[6];
               end
        4'h8 : begin
               din_shift  <=  {din[21],din[21],din[21],
                                    din[21],din[21],din[21],din[21],
                                    din[21],din[21:8]};
               neg_carry  <=  din[7]&(din[6]|din[5]|din[4]|din[3]|din[2]|din[1]|din[0]);
               pos_carry  <=  din[7];
               end
        4'h9 : begin
               din_shift  <=  {din[21],din[21],din[21],
                                    din[21],din[21],din[21],din[21],
                                    din[21],din[21],din[21:9]};
               neg_carry  <=  din[8]&(din[7]|din[6]|din[5]|din[4]|din[3]|din[2]|din[1]|din[0]);
               pos_carry  <=  din[8];
               end
        4'ha : begin
               din_shift  <=  {din[21],din[21],din[21],
                                    din[21],din[21],din[21],din[21],
                                    din[21],din[21],din[21],din[21:10]};
               neg_carry  <=  din[9]&(din[8]|din[7]|din[6]|din[5]|din[4]|din[3]|din[2]|
                                           din[1]|din[0]);
               pos_carry  <=  din[9];
               end
        4'hb : begin
               din_shift  <=  {din[21],din[21],din[21],
                                    din[21],din[21],din[21],din[21],
                                    din[21],din[21],din[21],din[21],
                                    din[21:11]};
               neg_carry  <=  din[10]&(din[9]|din[8]|din[7]|din[6]|din[5]|din[4]|din[3]|
                                            din[2]|din[1]|din[0]);
               pos_carry  <=  din[10];
               end
        default : begin
                din_shift  <=  {din[21],din[21],din[21],
                                    din[21],din[21],din[21],din[21],
                                    din[21],din[21],din[21],din[21],
                                    din[21],din[21:12]};
               neg_carry  <=  din[11]&(din[10]|din[9]|din[8]|din[7]|din[6]|din[5]|din[4]|din[3]|
                                            din[2]|din[1]|din[0]);
               pos_carry  <=  din[11];
               end
  endcase
end

assign  dout = operation ? ~din_shift : din_shift;

always @(operation or din[21] or pos_carry or neg_carry)
case ({operation,din[21]})
  2'd0 : carry  <= pos_carry; 
  2'd1 : carry  <= neg_carry;
  2'd2 : carry  <= ~pos_carry;
  2'd3 : carry  <= ~neg_carry;
endcase

endmodule    // rounding

module noise_shaper ( resetb, osr_clk, xin, msb );

// INPUTS
input            resetb;
input            osr_clk;
input  [ 18 : 0] xin;

// OUTPUTS
output           msb;

// INOUTS

// SIGNAL DECLARATIONS
reg    [ 18:  0] latch_xin;

reg    [  3:  0] fa_sum;
wire   [ 22:  0] sa;
reg    [ 23:  0] ua;

reg    [  2:  0] fb_sum;
wire   [ 24:  0] sb;
reg    [ 25:  0] ub;

reg    [  1:  0] fc_sum;
wire   [ 27:  0] dbl_sc;
wire   [ 27:  0] dbl_dac;
wire   [ 26:  0] sc;
reg              del_q_c;
reg    [ 27:  0] uc;

reg    [  1:  0] fd_sum;
wire   [ 27:  0] sd;
wire             ud_cout;
wire   [ 28:  0] ud;
reg    [ 28:  0] wd;

reg              msb;
wire             qa;
reg              qb;
reg              qc;
reg              qd;

always @(qd or qc or qb)
begin
  case ({qd, qc, qb})
        // 16 is the BIT_RESOLUTION
	3'b111: // 3(+1)-2(+1)-2(+1)=-1, -1*2^N
                fa_sum <=  4'b1111;
	3'b110: // 3(+1)-2(+1)-2(-1)=+3, +3*2^N
                fa_sum <=  4'b0011; 
	3'b101: // 3(+1)-2(-1)-2(+1)=+3, +3*2^N
                fa_sum <=  4'b0011; 
	3'b100: // 3(+1)-2(-1)-2(-1)=+7, +7*2^N
                fa_sum <=  4'b0111; 
	3'b011: // 3(-1)-2(+1)-2(+1)=-7, -7*2^N
                fa_sum <=  4'b1001; 
	3'b010: // 3(-1)-2(+1)-2(-1)=-3, -3*2^N
                fa_sum <=  4'b1101; 
	3'b001: // 3(-1)-2(-1)-2(+1)=-3, -3*2^N
                fa_sum <=  4'b1101; 
	3'b000: // 3(-1)-2(-1)-2(-1)=+1, +1*2^N
                fa_sum <=  4'b0001; 
        default: // Default case all register out as 0
                fa_sum <=  4'b0001; 
  endcase
end

always @(negedge resetb or negedge osr_clk)
begin
  if (resetb==1'b0) 
      latch_xin <=  19'b0;
  else 
      latch_xin <=  xin;
end

assign  sa[22:19] = {latch_xin[18],
                     latch_xin[18],
                     latch_xin[18],
                     latch_xin[18]} + fa_sum;
assign  sa[18: 0] = latch_xin;

always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      ua <=  24'b0;
  else 
      ua <=  ua + {sa[22],sa};
end


always @(qc or qb)
begin
  case ({qc, qb})
        // 16 is the BIT_RESOLUTION , -24 to +24, 6-bits more
	2'b11: // 8(+1)-16(+1)=-8,   -8*2^N
                fb_sum <=  3'b111;
	2'b10: // 8(+1)-16(-1)=+24, +24*2^N
                fb_sum <=  3'b011; 
	2'b01: // 8(-1)-16(+1)=-24, -24*2^N
                fb_sum <=  3'b101; 
	2'b00: // 8(-1)-16(-1)=+8,   +8*2^N
                fb_sum <=  3'b001; 
        default: // Default case all register out as 0
                fb_sum <=  3'b000; 
  endcase
end

assign  sb[24:22] = {ua[23],ua[23:22]} + fb_sum;
assign  sb[21: 0] = ua[21:0];

always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      ub <=  26'b0;
  else 
      ub <=  ub + {sb[24],sb};
end


always @(qb)
begin
  case ({qb})
        // 16 is the BIT_RESOLUTION , -64 to +64, -128 to +128, 8-bits more
	1'b1: // -64(+1)=-64, -64*2^N
                fc_sum <=  2'b11;
	1'b0: // -64(-1)=+64, +64*2^N
                fc_sum <=  2'b01; 
        default: // Default case all register out as 0
                fc_sum <=  2'b00; 
  endcase
end

always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      del_q_c <=  1'b1;
  else 
      del_q_c <=  !(uc[27] ^ ud[28]);
end

assign dbl_dac = del_q_c ? 28'h0000001 : 28'hfffffff;

assign  sc[26:25] = {ub[25],ub[25]} + fc_sum;
assign  sc[24: 0] = ub[24:0];
assign  dbl_sc = {sc[26],sc} + dbl_dac;

always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      uc <=  28'b0;
  else 
      uc <=  uc + dbl_sc;
end


always @(qb)
begin
  case ({qb})
        // 16 is the BIT_RESOLUTION , -128 to +128, -256 to +256, 9-bits more
	1'b1: // -128(+1)=-128, -128*2^N
                fd_sum <=  2'b11;
	1'b0: // -128(-1)=+128, +128*2^N
                fd_sum <=  2'b01; 
        default: // Default case all register out as 0
                fd_sum <=  2'b00; 
  endcase
end

assign  sd[27:26] = uc[27:26] + fd_sum;
assign  sd[25: 0] = uc[25:0];

assign  {ud_cout,ud} = {sd[27],sd} + wd;

always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      wd <=  28'b0;
  else 
      wd <=  ud;
end


assign  qa = ~ud[28];

always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      msb <=  1'b1;
  else 
      msb <=  qb;
end

always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      qb <=  1'b1;
  else 
      qb <=  qa;
end

always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      qc <=  1'b1;
  else 
      qc <=  qb;
end

always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      qd <=  1'b1;
  else 
      qd <=  qc;
end

endmodule    // noise_shaper
