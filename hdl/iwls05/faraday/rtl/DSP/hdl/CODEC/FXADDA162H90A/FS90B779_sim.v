
//`include "/home/msd/users/cjm1173/ad/FS90B717_b/src/include/header.v"
`include "header.v"
// DEFINES
`define DEBUG			1	       
`define SIM_ITER	        100           
`define SIM_ITER_128_136        200           
`define DATA_FORMAT             1'b1          
//`define DEL 10
`define test_mode               0
// TOP MODULE
module FS90B779_sim ();

reg     resetb, xti, non_duty_clk;
reg     [10:0]    counter;
reg              slot_clk;
reg              right_clk;
reg              lrcin;
reg              xtwrite ;
reg              xt_en ;
reg              [8:0]  xtdata ;
reg               [6:0]  xtaddr ;
wire 		RESET;
wire             lrcout;
integer          i;
reg    [15:0]    dac_left_data  [0:5199];
reg    [15:0]    dac_right_data [0:5199];
reg    [15:0]    l_d; 
reg    [15:0]    r_d; 

reg    bit_clkb;
wire   xbclk;
wire   xlrcin;
wire   xlrcout;
reg    xdin;
wire   i2s_format_on;
wire   deemphasis_on;
wire   mute;



wire             mode_256 ;
wire             mode_128 ;
wire             mode_272 ;
wire             mode_136 ;
wire             mode_1024 ;
wire             mode_512 ;
wire             mode_1088 ;
wire             mode_544 ;

wire            mclk_mode_2 ;
wire 		mclk_mode_1 ;
wire		mclk_mode_0 ;

assign    RESET= !resetb;
assign    mclk_mode_2=top.MCLK_MODE_2;
assign    mclk_mode_1=top.MCLK_MODE_1;
assign    mclk_mode_0=top.MCLK_MODE_0;

assign mode_256  =  mclk_mode_2 & mclk_mode_1 & mclk_mode_0 ;
assign mode_128  =  mclk_mode_2 & mclk_mode_1 & !mclk_mode_0 ;
assign mode_272  =  mclk_mode_2 & !mclk_mode_1 & mclk_mode_0 ;
assign mode_136  =  mclk_mode_2 & !mclk_mode_1 & !mclk_mode_0 ;
assign mode_1024 = !mclk_mode_2 & mclk_mode_1 & mclk_mode_0 ;
assign mode_512  = !mclk_mode_2 & mclk_mode_1 & !mclk_mode_0 ;
assign mode_1088 = !mclk_mode_2 & !mclk_mode_1 & mclk_mode_0 ;
assign mode_544  = !mclk_mode_2 & !mclk_mode_1 & !mclk_mode_0 ;

always @(negedge resetb or posedge xti)
begin
  if (~resetb)
       counter <= #`DEL 11'd0;
  else begin
       if (mode_256 && (counter == 11'd255))
           counter <= #`DEL 11'd0;
       else if (mode_128 && (counter == 11'd127))
           counter <= #`DEL 11'd0;
       else if (mode_272 && (counter == 11'd271))
           counter <= #`DEL 11'd0;
       else if (mode_136 && (counter == 11'd135))
           counter <= #`DEL 11'd0;
       else if (mode_1024 && (counter == 11'd1023))
           counter <= #`DEL 11'd0;
       else if (mode_512 && (counter == 11'd511))
           counter <= #`DEL 11'd0;
       else if (mode_1088 && (counter == 11'd1087))
           counter <= #`DEL 11'd0;
       else if (mode_544 && (counter == 11'd543))
           counter <= #`DEL 11'd0;
       else
           counter <= #`DEL counter + 1;
  end
end

always @(negedge resetb or posedge xti)
begin
  if (~resetb)
      slot_clk <= #`DEL 1'b0;
  else begin
      if (mode_256 && (counter == 11'd127))
          slot_clk <= #`DEL  1'b1;
      else if (mode_128 && (counter == 11'd63))
          slot_clk <= #`DEL  1'b1;
      else if (mode_272 && (counter == 11'd135))
          slot_clk <= #`DEL  1'b1;
      else if (mode_136 && (counter == 11'd67))
          slot_clk <= #`DEL  1'b1;
      else if (mode_1024 && (counter == 11'd511))
          slot_clk <= #`DEL  1'b1;
      else if (mode_512 && (counter == 11'd255))
          slot_clk <= #`DEL  1'b1;
      else if (mode_1088 && (counter == 11'd543))
          slot_clk <= #`DEL  1'b1;
      else if (mode_544 && (counter == 11'd271))
          slot_clk <= #`DEL  1'b1;
      else
          slot_clk <= #`DEL  1'b0;
  end
end

     
always @(negedge resetb or posedge xti)
begin
  if (~resetb)
      right_clk <= #`DEL 1'b0;
  else begin
       if (mode_256 && (counter == 11'd255))
                 right_clk <= #`DEL 1'b1;
       else if (mode_128 && (counter == 11'd127))
                 right_clk <= #`DEL 1'b1;
       else if (mode_272 && (counter == 11'd271))
                 right_clk <= #`DEL 1'b1;
       else if (mode_136 && (counter == 11'd135))
                 right_clk <= #`DEL 1'b1;
       else if (mode_1024 && (counter == 11'd1023))
                 right_clk <= #`DEL 1'b1;
       else if (mode_512 && (counter == 11'd511))
                 right_clk <= #`DEL 1'b1;
       else if (mode_1088 && (counter == 11'd1087))
                 right_clk <= #`DEL 1'b1;
       else if (mode_544 && (counter == 11'd543))
                 right_clk <= #`DEL 1'b1;
       else
                 right_clk <= #`DEL 1'b0;
  end
end
     

always @(negedge resetb or posedge xti)
begin
  if (~resetb)
      lrcin <= #4 1'b0;
  else begin
      if (slot_clk == 1'b1)
          lrcin <= #`DEL 1'b1;
      else if (right_clk == 1'b1)
          lrcin <= #4 1'b0;
      else
          lrcin <= #4 lrcin;
  end
end

assign xlrcin  = top.MASTER  ? 1'bZ : lrcin;

always @(negedge resetb or posedge xti)
begin
  if (~resetb)
      bit_clkb <= #`DEL 1'b0;
  else
      if (counter[0] == 1'h0) 
          bit_clkb <= #`DEL ~bit_clkb;
      else
          bit_clkb <= #`DEL bit_clkb;
end


assign #200 xbclk = top.MASTER ? 1'bZ :
                    (mode_128 | mode_136) ? ~xti : ~bit_clkb;




wire right_channel, left_channel, common_pin;



FS90B779  top       (.lrcin(xlrcin),
                    .lrcout(xlrcout),
                    .din(xdin),
                    .dout(xdout),
                    .bclk(xbclk),
                    .MCLK(xti),
                    .MASTER(1'b0),
                    .LHM(1'b0),
                    .RHM(1'b0),
                    .INSEL(1'b0),
                    .MICB(1'b0),
                    .MICIN(1'b0),
                    .loopback(1'b0),
                    .VCM(1'b0),
                    .ROUT(ROUT),
                    .LOUT(LOUT),
                    .RESET(RESET),
                    .MCLK_MODE_2  (1'b0) ,
                    .MCLK_MODE_1  (1'b0) ,
                    .MCLK_MODE_0  (1'b1) ,
                    .ADC_PD      (1'b0) ,
                    .DAC_PD      (1'b0) ,
                      .LHV_6 (1'b1),
                                  .LHV_5 (1'b1),
                                  .LHV_4 (1'b1),
                                  .LHV_3 (1'b1),
                                  .LHV_2 (1'b0),
                                  .LHV_1 (1'b0),
                                  .LHV_0 (1'b1),
                                  .RHV_6 (1'b1),
                                  .RHV_5 (1'b1),
                                  .RHV_4 (1'b1),
                                  .RHV_3 (1'b1),
                                  .RHV_2 (1'b0),
                                  .RHV_1 (1'b0),
                                  .RHV_0 (1'b0),
                                  .LIM (1'b1),
                                  .RIM (1'b1),
                                  .LIV_4 (1'b1),
                                  .LIV_3 (1'b0),
                                  .LIV_2 (1'b1),
                                  .LIV_1 (1'b1),
                                  .LIV_0 (1'b1),
                                  .RIV_4 (1'b1),
                                  .RIV_3 (1'b0),
                                  .RIV_2 (1'b1),
                                  .RIV_1 (1'b1),
                                  .RIV_0 (1'b1),
                                  .STE (1'b0),
                                  .STA_1 (1'b0),
                                  .STA_0 (1'b0),
                                  .DAC (1'b1),
                                  .BYP (1'b1),
                    .MICM(1'b1));
                    
                    
                    
                    
                   
                    
                       


integer k;

initial
begin
  k=1;
  non_duty_clk <= 1'b0;
  #`RESET_TIME xti <= 1'b0;
  #`RESET_TIME xti <= 1'b1;
  while (k>0)
    begin
      #`DUTY_HIGH non_duty_clk <= ~non_duty_clk;
      #`DUTY_LOW non_duty_clk <= ~non_duty_clk;
    end
end


initial
begin
  $readmemh("/home/msd/users/cjm1173/ad/FS90B717_b/data/dac_48k_16b_937_3db.in", dac_left_data);
  $readmemh("/home/msd/users/cjm1173/ad/FS90B717_b/data/dac_48k_16b_1875_0db.in", dac_right_data);
end

integer fp_l_slot, fp_r_slot;

initial
begin
  fp_l_slot = $fopen("adc_48k_16b_937_0db.out");
  fp_r_slot = $fopen("adc_48k_16b_937_3db.out");
end


initial
begin
 if ( `test_mode == 1 )
  begin
    xt_en <= 1'b1 ;
    #95000 ;
    xtaddr <= 7'b0000110 ;
    xtdata <= 9'b000000011 ;
    #3000 ;
    xtwrite <= 1'b1 ;
    #5000 ;
    xtwrite <= 1'b0 ;
    #5000 ;
    xtaddr <= 7'b0000111 ;
    xtdata <= 9'b000000010 ;
    #3000 ;
    xtwrite <= 1'b1 ;
    #5000 ;
    xtwrite <= 1'b0 ;
    #500000
    xtaddr <= 7'b0000111 ;
    xtdata <= 9'b001000010 ;
    #3000 ;
    xtwrite <= 1'b1 ;
    #5000 ;
    xtwrite <= 1'b0 ;
  end
 else xt_en <= 1'b0 ;

end


initial 
begin
        resetb  <= 1'b0;
        #`RESET_TIME resetb <= 1'b1;
end

integer j;

initial 
begin
  j=1;
  xti <= 1'b0;
  #`RESET_TIME xti <= 1'b1;
  while (j> 0)
    begin
      #`HALF_SYS_CLOCK_TIME xti <= ~xti;
    end
end



assign xlrcout  = lrcin;


      

assign i2s_format_on = `DATA_FORMAT;


always @(negedge resetb or posedge xlrcin)
begin
  if (~resetb)
      xdin <= #`DEL 1'b0;
  else begin
      dac_send_slot(l_d, r_d);
  end
end

// *****************************************************
// *****************************************************

always @(negedge resetb or posedge xlrcin)
  if (~resetb) begin
      l_d <= #`DEL 16'h0;
      r_d <= #`DEL 16'h0;
  end
  else begin
      l_d <= #`DEL dac_left_data[i];
      r_d <= #`DEL dac_right_data[i];
  end

wire [17:0] left, right;

assign left  = {l_d,2'b0};
assign right = {r_d,2'b0};


reg [17:0] adc_slot_data;

integer adc_i;

always
begin
 // @(posedge xlrcout)
 @(posedge xlrcin)
    begin
      @(posedge xbclk); 
      for (adc_i=17;adc_i >=0; adc_i=adc_i-1)
           @(posedge xbclk) adc_slot_data[adc_i] <= xdout; 
      $fdisplay(fp_l_slot,"%h", adc_slot_data);
     // @(negedge xlrcout); 
     @(negedge xlrcin); 
      @(posedge xbclk); 
      for (adc_i=17;adc_i >=0; adc_i=adc_i-1)
           @(posedge xbclk) adc_slot_data[adc_i] <= xdout; 
      $fdisplay(fp_r_slot,"%h", adc_slot_data);
  end
end

always @(negedge resetb or posedge right_clk)
begin
  if (~resetb)
      i       <= 0;
  else
      begin
        i <= i+1;
       // if (i>`SIM_ITER)
        if (((!mode_128 && !mode_136 ) && (i>`SIM_ITER)) || ((i>`SIM_ITER_128_136) && (mode_128 || mode_136)))
            $finish;
      end
end

initial
  begin
    if (`DEBUG)
        begin
        $fsdbDumpfile("tmp.fsdb");
        $fsdbDumpvars;
        end
  end

// Include Task Package
task dac_send_slot;
  input   [15:0] dac_l_slot;
  input   [15:0] dac_r_slot;
  integer        i;
  integer        found;
  begin
        xdin <= 1'b0; 
        @(posedge xbclk); 
        for (i=15;i >=0; i=i-1)
             @(negedge xbclk)#`DEL xdin <= dac_r_slot[i]; 
        @(negedge xbclk)#`DEL xdin <= 1'b0; 
        @(negedge xlrcin)#`DEL xdin <= 1'b0; 
        @(posedge xbclk); 
        for (i=15;i >=0; i=i-1)
             @(negedge xbclk)#`DEL xdin <= dac_l_slot[i]; 
        @(negedge xbclk)#`DEL xdin <= 1'b0; 
  end
endtask
endmodule    // FS90B717_sim

