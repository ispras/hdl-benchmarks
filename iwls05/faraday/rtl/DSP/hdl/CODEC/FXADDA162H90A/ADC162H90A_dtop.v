`include "DAC162H90A_dtop.v"

module ADC162H90A_dtop ( RESET,
                         MCLK,
                         DATA_LATCH,
                         MCLK_MODE_2,
                         MCLK_MODE_1,
                         MCLK_MODE_0,
                         ADC_PD,
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
                         INSEL,
                         MICB,
                         MICM,
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
                         RDO_0,
                         acADCPD,
                         acLIM,
                         acRIM,
                         acLIV4,
                         acLIV3,
                         acLIV2,
                         acLIV1,
                         acLIV0,
                         acRIV4,
                         acRIV3,
                         acRIV2,
                         acRIV1,
                         acRIV0,
                         acINSEL,
                         acMICB,
                         acMICM,
                         adY1_L,
                         adY2_L,
                         adY1_R,
                         adY2_R,
                         adPH1, 
                         adPH1D, 
                         adPH2, 
                         adPH2D );

// INPUTS
input           RESET;     
input           MCLK;   
input           DATA_LATCH;
input           MCLK_MODE_2;
input           MCLK_MODE_1;
input           MCLK_MODE_0;
input           ADC_PD;     
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
input           INSEL;     
input           MICB;     
input           MICM;     
input           adY1_L;   
input           adY2_L;   
input           adY1_R;   
input           adY2_R;   

// OUTPUTS

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

output          adPH1; 
output          adPH1D; 
output          adPH2; 
output          adPH2D; 
output          acADCPD;
output          acLIM;
output          acRIM;
output          acLIV4;
output          acLIV3;
output          acLIV2;
output          acLIV1;
output          acLIV0;
output          acRIV4;
output          acRIV3;
output          acRIV2;
output          acRIV1;
output          acRIV0;
output          acINSEL;
output          acMICB;
output          acMICM;



wire  [4:0]     yout_l;
wire  [4:0]     yout_r;

wire  [17:0]    comb_l;
wire  [17:0]    comb_r;


wire    [25:0]  rom_data;
wire    [6:0]   rom_addr;
wire            rom_clk;
wire            addr_a_cycle;

wire            ram_clk;
wire    [4:0]   ram_addr;
wire    [43:0]  data_from_ram;
wire    [43:0]  data_to_ram;
wire    [17:0]  adc_lch_data;
wire    [17:0]  adc_rch_data;

wire    [3:0]                   p2_shift;       
wire    [3:0]                   p3_shift;       
wire    [3:0]                   p4_shift;       
wire                            p2_plus;        
wire                            p3_plus;        
wire                            p4_plus;


MCLK_Delay     uMCLK_Delay       ( .MCLK(MCLK),
                                   .MCLK_1delay(MCLK_1delay),
                                   .MCLK_2delay(MCLK_2delay));

ad_clock_ckt uad_clock_ckt       ( .RESET(RESET),
                                   .MCLK(MCLK),
                                   .MCLK_1delay(MCLK_1delay), 
                                   .MCLK_2delay(MCLK_2delay), 
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
                                   .MICB(MICB),
                                   .MICM(MICM),
                                   .adc_l_data({LDO_15,
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
                                                LDO_0 }),
                                   .adc_r_data({RDO_15,
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
                                                RDO_0 }),
                                   .DATA_LATCH(DATA_LATCH),
                                   .data_l(adc_lch_data[17:2]),
                                   .data_r(adc_rch_data[17:2]),
                                   .resetb(resetb),
                                   .rom_clk(rom_clk),
                                   .rom_addr(rom_addr),
                                   .p1(p1),
                                   .p2(p2),
                                   .p3(p3),
                                   .p4(p4),
                                   .addr_a_cycle(addr_a_cycle),
                                   .osr_clk(osr_clk),
                                   .adPH1(adPH1),
                                   .adPH1D(adPH1D),
                                   .adPH2(adPH2),
                                   .adPH2D(adPH2D),
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
                                   .acADCPD(acADCPD),
                                   .acINSEL(acINSEL),
                                   .acMICM(acMICM),
                                   .acMICB(acMICB));

adc_ec         uadc_ec_l         ( .resetb(resetb),
                                   .osr_clk(osr_clk),
                                   .adc_y({adY1_L,adY2_L}),
                                   .yout(yout_l) );

adc_ec         uadc_ec_r         ( .resetb(resetb),
                                   .osr_clk(osr_clk),
                                   .adc_y({adY1_R,adY2_R}),
                                   .yout(yout_r) );

adc_comb_den   uadc_comb_den_l   ( .resetb(resetb),
                                   .osr_clk(osr_clk),
                                   .yout(yout_l),
                                   .comb_out(comb_l) );

adc_comb_den   uadc_comb_den_r   ( .resetb(resetb),
                                   .osr_clk(osr_clk),
                                   .yout(yout_r), 
                                   .comb_out(comb_r) );

adc_rom        uadc_rom          ( .MCLK_MODE_2(MCLK_MODE_2),
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

ad_filter uad_filter_l           ( .resetb(resetb),
                                   .p1(p1),
                                   .p2(p2),
                                   .p3(p3),
                                   .p4(p4),
                                   .MCLK(MCLK_2delay),
                                   .din(comb_l),
                                   .dout(adc_lch_data),
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

ad_filter uad_filter_r           ( .resetb(resetb),
                                   .p1(p1),
                                   .p2(p2),
                                   .p3(p3),
                                   .p4(p4),
                                   .MCLK(MCLK_2delay),
                                   .din(comb_r),
                                   .dout(adc_rch_data),
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


ram_32_44 uadc_ram  (.CK(ram_clk),
                     .resetb(resetb),
                     .WEB(ram_web),
                     .A(ram_addr),
                     .DI(data_to_ram),
                     .DO(data_from_ram));

endmodule 


// TOP MODULE
module adc_ec ( resetb, osr_clk, adc_y, yout );

// INPUTS
input            resetb;
input            osr_clk;
input  [ 1:  0]  adc_y;

output [ 4:  0]  yout;


reg              del_y1;
reg    [ 3:  0]  na;
reg    [ 3:  0]  del_na;
wire   [ 3:  0]  nb;
reg    [ 4:  0]  del_nb;
wire   [ 4:  0]  nc;
wire   [ 4:  0]  fa;
wire   [ 4:  0]  yout;





always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      del_y1 <=  1'b0;
  else 
      del_y1 <=  adc_y[1];
end

always @(del_y1 or adc_y[0])
begin
  case ({del_y1, adc_y[0]})
	2'b00: // (-1)+2*(-1)=-3
                na <=  4'b1101;
	2'b01: // (-1)+2*(+1)=+1
                na <=  4'b0001;
	2'b10: // (+1)+2*(-1)=-1
                na <=  4'b1111;
	2'b11: // (+1)+2*(+1)=+3
                na <=  4'b0011;
        default:                                        
                na <=  4'b1101; 
  endcase
end

always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      del_na <=  4'b0;
  else 
      del_na <=  na;
end

assign  nb = na - del_na;

always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      del_nb <=  5'b0;
  else 
      del_nb <=  {nb[3],nb};
end

assign  nc = {nb[3],nb} - del_nb;

assign fa = del_y1 ? 5'b00001 : 5'b11111;

assign yout = nc + fa;

endmodule    // adc_ec 


module adc_comb_den ( resetb, osr_clk, yout, comb_out );

// INPUTS
input            resetb;
input            osr_clk;
input  [ 4:  0]  yout;
output [17:  0]  comb_out;

// OUTPUTS

// INOUTS

// SIGNAL DECLARATIONS
reg    [17:  0]  ua, ub, uc, ud;


// PARAMETERS


reg start_1, start_2;

always @(negedge resetb or posedge osr_clk)
  if (resetb==1'b0) 
      start_1 <=  1'b0;
  else 
      start_1 <=  1'b1;

always @(negedge resetb or posedge osr_clk)
  if (resetb==1'b0) 
      start_2 <=  1'b0;
  else 
      start_2 <=  start_1;

always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      ua <=  18'b0;
  else 
      if (start_2)
          ua <=  ua + {yout[4],yout[4],yout[4],yout[4],yout[4],yout[4],yout[4],yout[4],yout[4],yout[4],yout[4],yout[4],yout[4],yout};
end

always @(negedge resetb or posedge osr_clk)
  if (resetb==1'b0) 
      ub <=  18'b0;
  else 
      if (start_2)
          ub <=  ub + ua;

always @(negedge resetb or posedge osr_clk)
  if (resetb==1'b0) 
      uc <=  18'b0;
  else 
      if (start_2)
          uc <=  uc + ub;

always @(negedge resetb or posedge osr_clk)
  if (resetb==1'b0) 
      ud <=  18'b0;
  else 
      if (start_2)
          ud <=  ud + uc;


reg  [3:0] num_cnt;

always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      num_cnt <=  4'b0;
  else begin
      if (num_cnt == 4'b1111)
          num_cnt <=  4'b0;
      else
          num_cnt <=  num_cnt + 1;
  end
end

reg        num_clk;

always @(negedge resetb or posedge osr_clk)
begin
  if (resetb==1'b0) 
      num_clk <=  1'b0;
  else begin 
      if (num_cnt == 4'b1111)
          num_clk <=  1'b1;
      else
          num_clk <=  1'b0;
  end
end

reg  [17:0] xin;

always @(negedge resetb or posedge osr_clk)
  if (resetb==1'b0) 
      xin <=  18'b0;
  else begin
      if (num_clk)
          xin <=  ud;
  end

reg  [17:0] del_xin;

always @(negedge resetb or posedge osr_clk)
  if (resetb==1'b0) 
      del_xin <=  18'b0;
  else begin
      if (num_clk)
          del_xin <=  xin;
  end

wire [17:0] wa;

assign  wa = ud- xin;

reg  [17:0] del_wa;

always @(negedge resetb or posedge osr_clk)
  if (resetb==1'b0) 
      del_wa <=  18'b0;
  else begin
      if (num_clk)
          del_wa <=  wa;
  end

wire [17:0] wb;

assign  wb = wa - del_wa;

reg  [17:0] del_wb;

always @(negedge resetb or posedge osr_clk)
  if (resetb==1'b0) 
      del_wb <=  18'b0;
  else begin
      if (num_clk)
          del_wb <=  wb;
  end

wire [17:0] wc;

assign  wc = wb - del_wb;

reg  [17:0] del_wc;

always @(negedge resetb or posedge osr_clk)
  if (resetb==1'b0) 
      del_wc <=  18'b0;
  else  begin
      if (num_clk)
          del_wc <=  wc;
  end

wire [17:0] wd;

assign  wd = wc - del_wc;

reg  [17:0] comb_out;

always @(negedge resetb or posedge osr_clk)
  if (resetb==1'b0) 
      comb_out <=  18'b0;
  else begin
      if (num_clk)
          comb_out <=  wd;
  end


endmodule    // adc_comb_den


module ad_filter ( resetb,
                   p1,
                   p2,
                   p3,
                   p4,
                   MCLK,
                   din, dout,
                   dout_lat,
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
input 	[17:0]                din; 		
input                         MCLK; 	
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
output	                      dout_lat; 	
output	[17:0]                dout; 		
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
reg     [17:0]	dout; 		

reg             dout_en, dout_lat;




always @(p1 or p2 or p3 or
         p2_t_left or p2_ram_left or
         p3_t_left or
         p4_t_left or p4_ram_left or p4_y_left or p4_inport_left or
         reg_t or data_from_ram or reg_y  or din)
begin
  if (p1 | p2)
      casex ({p2_t_left, p2_ram_left})   // synopsys parallel_case
        2'b1?   : l_operand <=  reg_t;
        2'b?1   : l_operand <=  data_from_ram;
        default : l_operand <=  22'h0;
      endcase
  else if (p3)
      casex (p3_t_left)   // synopsys parallel_case
        1'b1     : l_operand <=  reg_t;
        default  : l_operand <=  22'h0;
      endcase
  else
      casex ({p4_t_left, p4_ram_left, p4_y_left, p4_inport_left}) // synopsys parallel_case
        4'b1??? : l_operand <=  reg_t;
        4'b?1?? : l_operand <=  data_from_ram;
        4'b??1? : l_operand <=  reg_y;
        4'b???1 : l_operand <=  { din[17], din[17], din[17:0],2'b0};
        default : l_operand <=  22'h0;
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
        1'b1     : rounding_in <=  reg_a;
        default  : rounding_in <=  22'h0;
      endcase
  end
  else if (p3) 
      casex (p3_a_right)   // synopsys parallel_case
        1'b1     : rounding_in <=  reg_a;
        default  : rounding_in <=  22'h0;
      endcase
  else begin
      casex ({p4_a_right, p4_y_right})   // synopsys parallel_case
        2'b1?    : rounding_in <=  reg_a;
        2'b?1    : rounding_in <=  reg_y;
        default  : rounding_in <=  22'h0;
      endcase
  end
end

assign  operation = (p1 | p2) ? p2_plus  :
                         p3   ? p3_plus  : p4_plus;

assign  shift     = (p1 | p2) ? p2_shift :
                         p3   ? p3_shift : p4_shift;

                    
rounding   urounding   ( .din(rounding_in),
                         .operation(operation),
                         .shift(shift),
                         .dout(r_operand),
                         .carry(carry_in) );


assign  accumulator = l_operand + r_operand + carry_in;


assign  data_to_ram = resetb ? accumulator : 22'h0;

always @(negedge resetb or posedge MCLK)
  if (~resetb)
      reg_a <=  22'h0;
  else
      if (p2 && p2_write_reg_a)
          reg_a <=  accumulator;
      else if (p3 && p3_write_reg_a)
          reg_a <=  accumulator;
      else if (p4 && p4_write_reg_a)
          reg_a <=  accumulator;
      else
          reg_a <=  reg_a;

always @(negedge resetb or posedge MCLK)
  if (~resetb)
      reg_t <=  22'h0;
  else
      if (p4 && p4_write_reg_t)
          reg_t <=  accumulator;
      else
          reg_t <=  reg_t;

always @(negedge resetb or posedge MCLK)
  if (~resetb)
      reg_y <=  22'h0;
  else
      if (p4 && p4_write_reg_y)
          reg_y <=  accumulator;
      else
          reg_y <=  reg_y;

always @(negedge resetb or posedge MCLK)
  if (~resetb)
      dout <=  18'h0;
  else
      if (p4 && p4_write_outport)
          dout <=  accumulator[18:1];
      else
          dout <=  dout;

always @(negedge resetb or posedge MCLK)
  if (~resetb)
      dout_en <=  1'b0;
  else
      if (p4 && p4_write_outport)
          dout_en <=  1'b1;
      else
          dout_en <=  1'b0; 

always @(negedge resetb or posedge MCLK)
  if (~resetb)
      dout_lat <=  1'b0;
  else
      dout_lat <=  dout_en;

endmodule    // filter 



module ad_clock_ckt ( RESET,
                      MCLK,
                      MCLK_1delay,
                      MCLK_2delay,
                      MCLK_MODE_2,
                      MCLK_MODE_1,
                      MCLK_MODE_0,
                      ADC_PD,
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
                      INSEL,
                      MICB,
                      MICM,
                      adc_l_data,
                      adc_r_data,
                      DATA_LATCH,

                      p1,
                      p2,
                      p3,
                      p4,
                      addr_a_cycle,

                      data_l,
                      data_r,
                      resetb,
                      rom_clk,
                      rom_addr,
                      osr_clk,
                      adPH1,
                      adPH1D,
                      adPH2,
                      adPH2D,
                      acLIM,
                      acRIM,
                      acLIV4,
                      acLIV3,
                      acLIV2,
                      acLIV1,
                      acLIV0,
                      acRIV4,
                      acRIV3,
                      acRIV2,
                      acRIV1,
                      acRIV0,
                      acADCPD,
                      acINSEL,
                      acMICB,
                      acMICM );

// INPUTS
input              RESET;
input              MCLK;
input              MCLK_1delay;
input              MCLK_2delay;
input              MCLK_MODE_2;
input              MCLK_MODE_1;
input              MCLK_MODE_0;
input              DATA_LATCH;
input              ADC_PD;
output  [15:0]     adc_l_data;
output  [15:0]     adc_r_data;
input              LIM;
input              RIM;
input              LIV_4;
input              LIV_3;
input              LIV_2;
input              LIV_1;
input              LIV_0;
input              RIV_4;
input              RIV_3;
input              RIV_2;
input              RIV_1;
input              RIV_0;
input              INSEL;
input              MICB;
input              MICM;

// OUTPUTS
//imp000//
input  [15:0]     data_l;
input  [15:0]     data_r;
output            resetb;
output            p1;
output            p2;
output            p3;
output            p4;
output            addr_a_cycle;
output            rom_clk;
output    [6:0]   rom_addr;
output            osr_clk;
output            adPH1;
output            adPH1D;
output            adPH2;
output            adPH2D;
output            acADCPD;
output            acLIM;
output            acRIM;
output            acLIV4;
output            acLIV3;
output            acLIV2;
output            acLIV1;
output            acLIV0;
output            acRIV4;
output            acRIV3;
output            acRIV2;
output            acRIV1;
output            acRIV0;
output            acMICM;
output            acMICB;
output            acINSEL;
 

// INOUTS

// SIGNAL DECLARATIONS
reg             resetb;

reg             DATA_LATCH_d1;
wire            DATA_LATCH_F;
reg     [15:0]	adc_l_data;	 
reg     [15:0]	adc_r_data;	 
reg	[10:0]	counter;	 
reg             p1;
reg             p2;
reg             p3;
reg             p4;

reg             rom_clk;
reg	[6:0]	rom_addr; 
reg             osr_clk;

wire            acADCPD;
wire            acLIM;
wire            acRIM;
wire            acLIV4;
wire            acLIV3;
wire            acLIV2;
wire            acLIV1;
wire            acLIV0;
wire            acRIV4;
wire            acRIV3;
wire            acRIV2;
wire            acRIV1;
wire            acRIV0;
wire            acINSEL;
wire            acMICB;
wire            acMICM;

reg             addr_a_cycle;

// Operation Decode   
reg     [3:0]   p2_shift;       // Phase 2 Shift Value
reg     [3:0]   p3_shift;       // Phase 3 Shift Value
reg     [3:0]   p4_shift;       // Phase 4 Shift Value
reg             p2_plus;        // Phase 2 +- operation
reg             p3_plus;        // Phase 3 +- operation
reg             p4_plus;        // Phase 4 +- operation

// PARAMETERS


always @(posedge RESET or posedge MCLK_2delay)
  if (RESET)
      resetb <=  1'b0;
  else
      resetb <=  !ADC_PD;

assign acADCPD = ADC_PD;
assign acLIM   = LIM;
assign acRIM   = RIM;
assign acLIV4  = LIV_4;
assign acLIV3  = LIV_3;
assign acLIV2  = LIV_2;
assign acLIV1  = LIV_1;
assign acLIV0  = LIV_0;
assign acRIV4  = RIV_4;
assign acRIV3  = RIV_3;
assign acRIV2  = RIV_2;
assign acRIV1  = RIV_1;
assign acRIV0  = RIV_0;
assign acINSEL = INSEL;
assign acMICB  = MICB;
assign acMICM  = MICM;


always @(negedge resetb or posedge MCLK_2delay)
  if (~resetb)
       DATA_LATCH_d1 <=  1'b0;
  else
       DATA_LATCH_d1 <=  DATA_LATCH;

assign DATA_LATCH_F = (!DATA_LATCH) && DATA_LATCH_d1;

always @(negedge resetb or posedge MCLK_2delay)
  if (~resetb) begin
       adc_l_data <= 16'b0;
       adc_r_data <=  16'b0;
  end
  else begin
       if (DATA_LATCH_F)begin
           adc_l_data <= data_l;
           adc_r_data <= data_r;
       end
  end


always @(negedge resetb or posedge MCLK_2delay)
  if (!resetb)
       counter <=  11'h0;
  else begin
       if (DATA_LATCH_F)
           counter <=  11'h0;
       else
           counter <=  counter + 1;
  end

always @(negedge resetb or posedge MCLK_2delay)
  if (!resetb)
       p1 <=  1'b0;
  else begin
       if (MCLK_MODE_2) begin
           // Divide by 4
           // 256,128,272,136
           p1 <=  (counter[1] && !counter[0]);
       end else if (MCLK_MODE_0) begin
           // Divide by 16
           // 1024, 1088
           if (!counter[3] && !counter[2] && counter[1] && !counter[0])
               p1 <=  1'b1;
           else
               p1 <=  1'b0;
       end else begin
           // Divide by 8
           // 512, 544
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
           // Divide by 4
           // 256,128,272,136
           p2 <=  (counter[1] && counter[0]);
       end else if (MCLK_MODE_0) begin
           // Divide by 16
           // 1024, 1088
           if (!counter[3] && counter[2] && counter[1] && !counter[0])
               p2 <=  1'b1;
           else
               p2 <=  1'b0;
       end else begin
           // Divide by 8
           // 512, 544
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
          // Divide by 4
          // 256,128,272,136
          p3 <=  (!counter[1] && !counter[0]);
       end else if (MCLK_MODE_0) begin
           // Divide by 16
           // 1024, 1088
           if (counter[3] && !counter[2] && counter[1] && !counter[0])
               p3 <=  1'b1;
           else
               p3 <=  1'b0;
       end else begin
           // Divide by 8
           // 512, 544
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
          // Divide by 4
          // 256,128,272,136
          p4 <=  (!counter[1] && counter[0]);
       end else if (MCLK_MODE_0) begin
           // Divide by 16
           // 1024, 1088
           if (counter[3] && counter[2] && counter[1] && !counter[0])
               p4 <=  1'b1;
           else
               p4 <=  1'b0;
       end else begin
           // Divide by 8
           // 512, 544
           if (!counter[2] && !counter[1] && !counter[0])
               p4 <=  1'b1;
           else
               p4 <=  1'b0;
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

assign adPH1  = resetb && !ADC_PD && osr_clk && osr_clk_2pre;
assign adPH1D = resetb && !ADC_PD && osr_clk && osr_clk_1pre;
assign adPH2  = resetb && !ADC_PD && !(osr_clk || osr_clk_2pre);
assign adPH2D = resetb && !ADC_PD && !(osr_clk || osr_clk_1pre);



always @(negedge resetb or posedge MCLK_2delay)
  if (~resetb)
      rom_addr <=   7'b0;
  else begin
      if (MCLK_MODE_2) begin
     // if (MCLK_MODE_2 & !MCLK_MODE_0) begin
          // 128, 256, 272, 136
     //     if (counter[1:0] == 2'b00)
     //         rom_addr <=  {1'b0,counter[7:2]};
     // end else if (MCLK_MODE_2 & MCLK_MODE_0) begin
          // 256, 272
          if (counter[1:0] == 2'b00)
              rom_addr <=  counter[8:2];
      end else if (MCLK_MODE_0) begin
          // 1024, 1088
          if (counter[3:0] == 4'b0000)
              rom_addr <=  counter[10:4];
      end else begin
          // 512, 544
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

endmodule    // ad_clock_ckt 


module adc_rom (MCLK_MODE_2, MCLK_MODE_1, MCLK_MODE_0, rom_addr, rom_data);
                                                 
input         MCLK_MODE_2;                       
input         MCLK_MODE_1;                       
input         MCLK_MODE_0;                       
input  [ 6:0] rom_addr   ;                          
output [25:0] rom_data   ;                          
                                                 
reg    [25:0] rom_data_256_128;
reg    [25:0] rom_data_272_136;
wire   [25:0] rom_data;

wire   mode_128, mode_136;


assign mode_128 = (MCLK_MODE_2 && MCLK_MODE_1 && !MCLK_MODE_0);

always @(rom_addr or mode_128)                
begin                                            
casex (rom_addr)                                 
    7'd00        : rom_data_256_128 <=  26'b10000000000000000000000000; //IN(0)       HB1-0   
    7'd01        : rom_data_256_128 <=  26'b01100000000000000000000000; //CLRY        HB1-0
    7'd02        : rom_data_256_128 <=  26'b00010000000000100000000000; //S2AT(0,8)   HB1-0
    7'd03        : rom_data_256_128 <=  26'b00100000000000001000100010; //            HB1-0
    7'd04        : rom_data_256_128 <=  26'b01000000000000000000110111; //            HB1-0
    7'd05        : rom_data_256_128 <=  26'b00010000110000001000000000; //            HB1-0
    7'd06        : rom_data_256_128 <=  26'b00100000000001001100110010; //            HB1-0
    7'd07        : rom_data_256_128 <=  26'b01000000000011000000110100; //            HB1-0
    7'd08        : rom_data_256_128 <=  26'b00010000001000011100000000; //            HB1-0
    7'd09        : rom_data_256_128 <=  26'b00100000000011010001000010; //            HB1-0
    7'd10        : rom_data_256_128 <=  26'b01000000000000000000100010; //            HB1-0
    7'd11        : rom_data_256_128 <=  26'b00010000100000010000000000; //            HB1-0
    7'd12        : rom_data_256_128 <=  26'b01010000000000000000000010; //            HB1-0
    7'd13        : rom_data_256_128 <=  26'b01110001011000000000000000; //YM(11)      HB1-0    
    7'd14        : if (mode_128)
                      rom_data_256_128 <=  26'b10010001011000000000000000; //MOUT(11)
                   else
                      rom_data_256_128 <=  26'b01100000000000000000000000; //CLRY        HB2
    7'd15        : if (mode_128)
                       rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
                   else
                      rom_data_256_128 <=  26'b00010001011001001000000000; //S2AT        HB2
    7'd16        : if (mode_128)
                       rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
                   else
                      rom_data_256_128 <=  26'b10000001000000000000000000; //IN(8) <--------
    7'd17        : if (mode_128)
                       rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
                   else
                      rom_data_256_128 <=  26'b00110000000101010000110110; //A2Y         HB2
    7'd18        : if (mode_128)
                       rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
                   else
                      rom_data_256_128 <=  26'b00010001100001000100000000; //S2AT        HB2
    7'd19        : if (mode_128)
                      rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
                   else
                      rom_data_256_128 <=  26'b00100000000001001100100100; //A3          HB2
    7'd20        : if (mode_128)
                      rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
                   else
                      rom_data_256_128 <=  26'b01000000000000000000100101; //A1Y         HB2
    7'd21        : if (mode_128)
                      rom_data_256_128 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_256_128 <=  26'b01000000000000000000100101; //A1Y         HB2
    7'd22        : if (mode_128)
                      rom_data_256_128 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_256_128 <=  26'b00100000000000001000110011; //            HB2
    7'd23        : if (mode_128)
                      rom_data_256_128 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_256_128 <=  26'b01000000000011000000100011; //            HB2
    7'd24        : if (mode_128)
                      rom_data_256_128 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_256_128 <=  26'b00010001110000111100000000; //            HB2
    7'd25        : if (mode_128)
                      rom_data_256_128 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_256_128 <=  26'b00100000000010001110010010; //            HB2
    7'd26        : if (mode_128)
                      rom_data_256_128 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_256_128 <=  26'b01010000000000000000000010; //            HB2
    7'd27        : if (mode_128)
                      rom_data_256_128 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_256_128 <=  26'b00010010110001011000000000; //            HB2
    7'd28        : if (mode_128)
                      rom_data_256_128 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_256_128 <=  26'b01010000000000000000000010; //            HB2
    7'd29        : if (mode_128)
                      rom_data_256_128 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_256_128 <=  26'b01110011010000000000000000; //YM(26)      HB2
    7'd30        : if (mode_128)
                       rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
                   else
                       rom_data_256_128 <=  26'b10010011010000000000000000; //MOUT(26)
    7'd31        : if (mode_128)
                       rom_data_256_128 <=  26'b11110000000000000000000000; //DBC
                   else
                       rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
    7'd32        : rom_data_256_128 <=  26'b10000000101000000000000000; //IN(5)       HB1-2
    7'd33        : rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
    7'd34        : rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
    7'd35        : rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
    7'd36        : rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
    7'd37        : rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
    7'd38        : rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
    7'd39        : rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
    7'd40        : rom_data_256_128 <=  26'b01100000000000000000000000; //CLRY        HB1-2
    7'd41        : rom_data_256_128 <=  26'b00010000101000001000000000; //S2AT(5,2)   HB1-2
    7'd42        : rom_data_256_128 <=  26'b00100000000000001000100010; //A3          HB1-2
    7'd43        : rom_data_256_128 <=  26'b01000000000000000000110111; //A1Y         HB1-2
    7'd44        : rom_data_256_128 <=  26'b00010000000000011100000000; //            HB1-2
    7'd45        : rom_data_256_128 <=  26'b00100000000001001100110010; //            HB1-2
    7'd46        : rom_data_256_128 <=  26'b01000000000011000000110100; //            HB1-2
    7'd47        : rom_data_256_128 <=  26'b00010000110000000100000000; //            HB1-2
    7'd48        : rom_data_256_128 <=  26'b10000000010000000000000000; //IN(2) <--------
    7'd49        : rom_data_256_128 <=  26'b00100000000011010001000010; //            HB1-2
    7'd50        : rom_data_256_128 <=  26'b01000000000000000000100010; //            HB1-2
    7'd51        : rom_data_256_128 <=  26'b00010001001000100100000000; //            HB1-2
    7'd52        : rom_data_256_128 <=  26'b01010000000000000000000010; //            HB1-2
    7'd53        : rom_data_256_128 <=  26'b01110010010000000000000000; //YM(18)      HB1-2
    7'd54        : if (mode_128)
                      rom_data_256_128 <=  26'b10010010010000000000000000; //MOUT(18)
                   else
                      rom_data_256_128 <=  26'b00000000000000000000000000; //NOP
    7'd55        : rom_data_256_128 <=  26'b11110000000000000000000000; //DBC
    default      : rom_data_256_128 <=  26'b00000000000000000000000000;
 endcase                                                      
end                                                           

assign mode_136 = MCLK_MODE_2 && !MCLK_MODE_1 && !MCLK_MODE_0;

always @(rom_addr or mode_136)                
begin                                            
casex (rom_addr)                                 
    7'd00        : rom_data_272_136 <=  26'b10000000000000000000000000; //IN(0)       HB1-0
    7'd01        : rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
    7'd02        : rom_data_272_136 <=  26'b01100000000000000000000000; //CLRY        HB1-0
    7'd03        : rom_data_272_136 <=  26'b00010000000000100000000000; //S2AT(0,8)   HB1-0
    7'd04        : rom_data_272_136 <=  26'b00100000000000001000100010; //            HB1-0
    7'd05        : rom_data_272_136 <=  26'b01000000000000000000110111; //            HB1-0
    7'd06        : rom_data_272_136 <=  26'b00010000110000001000000000; //            HB1-0
    7'd07        : rom_data_272_136 <=  26'b00100000000001001100110010; //            HB1-0
    7'd08        : rom_data_272_136 <=  26'b01000000000011000000110100; //            HB1-0
    7'd09        : rom_data_272_136 <=  26'b00010000001000011100000000; //            HB1-0
    7'd10        : rom_data_272_136 <=  26'b00100000000011010001000010; //            HB1-0
    7'd11        : rom_data_272_136 <=  26'b01000000000000000000100010; //            HB1-0
    7'd12        : rom_data_272_136 <=  26'b00010000100000010000000000; //            HB1-0
    7'd13        : rom_data_272_136 <=  26'b01010000000000000000000010; //            HB1-0
    7'd14        : rom_data_272_136 <=  26'b01110001011000000000000000; //YM(11)      HB1-0
    7'd15        : if (mode_136)
                      rom_data_272_136 <=  26'b10010001011000000000000000; //MOUT(11)
                   else
                      rom_data_272_136 <=  26'b01100000000000000000000000; //CLRY        HB2
    7'd16        : if (mode_136)
                       rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
                   else
                      rom_data_272_136 <=  26'b00010001011001001000000000; //S2AT        HB2
    7'd17        : if (mode_136)
                       rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
                   else
                      rom_data_272_136 <=  26'b10000001000000000000000000; //IN(8) <--------
    7'd18        : rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
    7'd19        : if (mode_136)
                       rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
                   else
                      rom_data_272_136 <=  26'b00110000000101010000110110; //A2Y         HB2
    7'd20        : if (mode_136)
                       rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
                   else
                      rom_data_272_136 <=  26'b00010001100001000100000000; //S2AT        HB2
    7'd21        : if (mode_136)
                      rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
                   else
                      rom_data_272_136 <=  26'b00100000000001001100100100; //A3          HB2
    7'd22        : if (mode_136)
                      rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
                   else
                      rom_data_272_136 <=  26'b01000000000000000000100101; //A1Y         HB2
    7'd23        : if (mode_136)
                      rom_data_272_136 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_272_136 <=  26'b01000000000000000000100101; //A1Y         HB2
    7'd24        : if (mode_136)
                      rom_data_272_136 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_272_136 <=  26'b00100000000000001000110011; //            HB2
    7'd25        : if (mode_136)
                      rom_data_272_136 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_272_136 <=  26'b01000000000011000000100011; //            HB2
    7'd26        : if (mode_136)
                      rom_data_272_136 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_272_136 <=  26'b00010001110000111100000000; //            HB2
    7'd27        : if (mode_136)
                      rom_data_272_136 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_272_136 <=  26'b00100000000010001110010010; //            HB2
    7'd28        : if (mode_136)
                      rom_data_272_136 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_272_136 <=  26'b01010000000000000000000010; //            HB2
    7'd29        : if (mode_136)
                      rom_data_272_136 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_272_136 <=  26'b00010010110001011000000000; //            HB2
    7'd30        : if (mode_136)
                      rom_data_272_136 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_272_136 <=  26'b01010000000000000000000010; //            HB2
    7'd31        : if (mode_136)
                      rom_data_272_136 <=  26'b00010001101001000000000000; //            HB2
                   else
                      rom_data_272_136 <=  26'b01110011010000000000000000; //YM(26)      HB2
    7'd32        : if (mode_136)
                       rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
                   else
                       rom_data_272_136 <=  26'b10010011010000000000000000; //MOUT(26)
    7'd33        : if (mode_136)
                       rom_data_272_136 <=  26'b11110000000000000000000000; //DBC
                   else
                       rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
    7'd34        : rom_data_272_136 <=  26'b10000000101000000000000000; //IN(5)       HB1-2
    7'd35        : rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
    7'd36        : rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
    7'd37        : rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
    7'd38        : rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
    7'd39        : rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
    7'd40        : rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
    7'd41        : rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
    7'd42        : rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
    7'd43        : rom_data_272_136 <=  26'b01100000000000000000000000; //CLRY        HB1-2
    7'd44        : rom_data_272_136 <=  26'b00010000101000001000000000; //S2AT(5,2)   HB1-2
    7'd45        : rom_data_272_136 <=  26'b00100000000000001000100010; //A3          HB1-2
    7'd46        : rom_data_272_136 <=  26'b01000000000000000000110111; //A1Y         HB1-2
    7'd47        : rom_data_272_136 <=  26'b00010000000000011100000000; //            HB1-2
    7'd48        : rom_data_272_136 <=  26'b00100000000001001100110010; //            HB1-2
    7'd49        : rom_data_272_136 <=  26'b01000000000011000000110100; //            HB1-2
    7'd50        : rom_data_272_136 <=  26'b00010000110000000100000000; //            HB1-2
    7'd51        : rom_data_272_136 <=  26'b10000000010000000000000000; //IN(2) <--------
    7'd52        : rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
    7'd53        : rom_data_272_136 <=  26'b00100000000011010001000010; //            HB1-2
    7'd54        : rom_data_272_136 <=  26'b01000000000000000000100010; //            HB1-2
    7'd55        : rom_data_272_136 <=  26'b00010001001000100100000000; //            HB1-2
    7'd56        : rom_data_272_136 <=  26'b01010000000000000000000010; //            HB1-2
    7'd57        : rom_data_272_136 <=  26'b01110010010000000000000000; //YM(18)      HB1-2
    7'd58        : if (mode_136)
                      rom_data_272_136 <=  26'b10010010010000000000000000; //MOUT(18)
                   else
                      rom_data_272_136 <=  26'b00000000000000000000000000; //NOP
    7'd59        : rom_data_272_136 <=  26'b11110000000000000000000000; //DBC
    default      : rom_data_272_136 <=  26'b00000000000000000000000000;
 endcase                                                      
end                                                           
                                                              
assign rom_data = MCLK_MODE_1 ? rom_data_256_128 : rom_data_272_136;

endmodule                                                     
