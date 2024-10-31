module FS90B779_DAI ( RESET ,   
                      bclk, 
                      MCLK,            
                      bclk_o,
                      din ,            
                      dout ,          
                      lrcin,         
                      lrcin_o,
                      lrcout,       
                      lrcout_o,
                      MASTER,
                      MCLK_MODE_2 ,
                      MCLK_MODE_1 ,
                      MCLK_MODE_0 ,
                      adc_lchdata,   
                      adc_rchdata,   
                      dac_lchdata,  
                      dac_rchdata,
                      loopback, 
                      DATA_LATCH  
                      );

input            MCLK_MODE_2 ;
input            MCLK_MODE_1 ;
input            MCLK_MODE_0 ;
input	      MCLK;	
input         RESET;
input         MASTER ;
input         bclk ;
input         din ;
input         lrcin ;
input         lrcout ;
input	      loopback;
input  [15:0] adc_lchdata ;
input  [15:0] adc_rchdata ;

output [15:0] dac_lchdata ;
output [15:0] dac_rchdata ;
output        DATA_LATCH  ;
output        dout   ;
output        bclk_o   ;
output        lrcin_o  ;
output        lrcout_o ;

reg    [17:0] dac_parallel;
reg    [17:0] dac_lch_data ;
reg    [17:0] dac_rch_data ;
reg           DATA_LATCH_SLAVE ;
reg           delay_lrcin ;
reg           delay_lrcout;
reg    [8:0]  dac_counter;
reg    [8:0]  adc_counter;

wire   [15:0] dac_lchdata;
wire   [15:0] dac_rchdata;
wire   [17:0] adc_lch_data ;
wire   [17:0] adc_rch_data ;
wire          bclk_o   ;
wire          lrcin_o  ;
wire          lrcout_o ;
wire          bclk_ok   ;
wire          lrcin_ok  ;
wire          lrcout_ok ;
reg 		 qua_mclk,half_mclk;
reg     [10:0]   counter ;
reg              slot_clk ;
reg              right_clk ;
wire		 bclko	;

reg              lrcouto ;
wire		 lrcino;		
reg              delay_lrcouto ;
reg              DATA_LATCH_MS ;
reg              resetb ;
reg    [17:0]    adc_parallel;
reg              dout;
reg		 DATA_LATCH;
wire             DATA_LATCH_tmp ;
wire             mode_256 ;
wire             mode_128 ;
wire             mode_272 ;
wire             mode_136 ;
wire             mode_1024 ;
wire             mode_512 ;
wire             mode_1088 ;
wire             mode_544 ;


assign dac_lchdata=dac_lch_data[15:0];
assign dac_rchdata=dac_rch_data[15:0];
assign adc_lch_data=loopback?{dac_lchdata[15:0],2'b0}:{adc_lchdata[15:0],2'b0};
assign adc_rch_data=loopback?{dac_rchdata[15:0],2'b0}:{adc_rchdata[15:0],2'b0};
assign bclk_o = MASTER ? bclko :1'b0;
assign lrcin_o = MASTER ? lrcino :1'b0;
assign lrcout_o = MASTER ? lrcouto :1'b0;
assign  bclk_ok = MASTER ? bclko :bclk;
assign  lrcin_ok = MASTER ? lrcino :lrcin;
assign  lrcout_ok = MASTER ? lrcouto :lrcout;


always @( posedge RESET or posedge bclk_ok )
  if (RESET)
      delay_lrcin <= 1'b0 ;
  else 
      delay_lrcin <= lrcin_ok ;

always @( posedge  RESET or posedge bclk_ok )
  if (RESET)
      dac_counter <= 9'd0;
  else begin 
      if ((lrcin_ok == 1'b1 & delay_lrcin == 1'b0) | ( lrcin_ok == 1'b0 & delay_lrcin == 1'b1))
          dac_counter <= #2 9'd0;
      else
          dac_counter <= #2 dac_counter + 1 ;
  end


always @( posedge  RESET or posedge bclk_ok )
begin
  if (RESET) 
      dac_parallel  <= 18'b0 ;
  else
      dac_parallel <= {dac_parallel[16:0],din};
end

always @( posedge  RESET or posedge bclk_ok )
begin
  if (RESET) 
     begin
      dac_lch_data  <= 18'b0 ;
      dac_rch_data  <= 18'b0 ;
     end
  else begin

      if (!lrcin_ok && (dac_counter == 9'd16) )
          
             dac_lch_data <= dac_parallel;
          
     else if (lrcin_ok && (dac_counter == 9'd16) )
          
             dac_rch_data <= dac_parallel;
      end
end

always @( posedge  RESET or posedge bclk_ok )
  if (RESET)
      DATA_LATCH_SLAVE <= 1'b0 ;
  else begin

         if ( lrcin_ok && !delay_lrcin )
               DATA_LATCH_SLAVE <= 1'b1 ;
         else
               DATA_LATCH_SLAVE <= 1'b0 ;
  end


always @( posedge RESET or posedge bclk_ok )
  if (RESET)
      delay_lrcout <= 1'b0 ;
  else 
      delay_lrcout <= lrcout_ok ;

always @( posedge  RESET or posedge bclk_ok )
  if (RESET)
      adc_counter <= 9'd0;
  else begin 
      if ((lrcout_ok == 1'b1 & delay_lrcout == 1'b0) | ( lrcout_ok == 1'b0 & delay_lrcout == 1'b1))
          adc_counter <= 9'd0;
      else
          adc_counter <= adc_counter + 1 ;
  end



always @( posedge  RESET or negedge bclk_ok )
begin
  if (RESET)
      {dout,adc_parallel} <= 19'b0 ;
  else begin
         if (!lrcout_ok && (adc_counter == 9'd0) )
          {dout, adc_parallel} <= {adc_lch_data,1'b0};
      else if (lrcout_ok && (adc_counter == 9'd0) )
          {dout, adc_parallel} <= {adc_rch_data,1'b0};
      else 
          {dout, adc_parallel} <= {adc_parallel,1'b0};
  end
end






assign mode_256  = MCLK_MODE_2 & MCLK_MODE_1 & MCLK_MODE_0 ;
assign mode_128  = MCLK_MODE_2 & MCLK_MODE_1 & !MCLK_MODE_0 ;
assign mode_272  = MCLK_MODE_2 & !MCLK_MODE_1 & MCLK_MODE_0 ;
assign mode_136  = MCLK_MODE_2 & !MCLK_MODE_1 & !MCLK_MODE_0 ;
assign mode_1024 = !MCLK_MODE_2 & MCLK_MODE_1 & MCLK_MODE_0 ;
assign mode_512  = !MCLK_MODE_2 & MCLK_MODE_1 & !MCLK_MODE_0 ;
assign mode_1088 = !MCLK_MODE_2 & !MCLK_MODE_1 & MCLK_MODE_0 ;
assign mode_544  = !MCLK_MODE_2 & !MCLK_MODE_1 & !MCLK_MODE_0 ;

assign DATA_LATCH_tmp = MASTER ? DATA_LATCH_MS : DATA_LATCH_SLAVE ;

always @(posedge RESET or posedge MCLK)
    begin
       if (RESET)
           resetb <= 1'b0 ;
       else resetb <= 1'b1 ;
    end


always @(negedge resetb or posedge MCLK)
begin
  if (~resetb)
       counter <= 11'd0;
  else begin
       if (mode_256 && (counter == 11'd255))
           counter <= 11'd0;
       else if (mode_128 && (counter == 11'd127))
           counter <= 11'd0;
       else if (mode_272 && (counter == 11'd271))
           counter <= 11'd0;
       else if (mode_136 && (counter == 11'd135))
           counter <= 11'd0;
       else if (mode_1024 && (counter == 11'd1023))
           counter <= 11'd0;
       else if (mode_512 && (counter == 11'd511))
           counter <= 11'd0;
       else if (mode_1088 && (counter == 11'd1087))
           counter <= 11'd0;
       else if (mode_544 && (counter == 11'd543))
           counter <= 11'd0;
       else
           counter <= counter + 1;
  end
end


always @(negedge resetb or posedge MCLK)
begin
  if (~resetb)
      slot_clk <= 1'b0;
  else begin
      if (mode_256 && (counter == 11'd127))
          slot_clk <= 1'b1;
      else if (mode_128 && (counter == 11'd63))
          slot_clk <= 1'b1;
      else if (mode_272 && (counter == 11'd135))
          slot_clk <= 1'b1;
      else if (mode_136 && (counter == 11'd67))
          slot_clk <= 1'b1;
      else if (mode_1024 && (counter == 11'd511))
          slot_clk <= 1'b1;
      else if (mode_512 && (counter == 11'd255))
          slot_clk <= 1'b1;
      else if (mode_1088 && (counter == 11'd543))
          slot_clk <= 1'b1;
      else if (mode_544 && (counter == 11'd271))
          slot_clk <= 1'b1;
      else
          slot_clk <= 1'b0;
  end
end


always @(negedge resetb or posedge MCLK)
begin
  if (~resetb)
      right_clk <= 1'b0;
  else begin
       if (mode_256 && (counter == 11'd255))
                 right_clk <= 1'b1;
       else if (mode_128 && (counter == 11'd127))
                 right_clk <= 1'b1;
       else if (mode_272 && (counter == 11'd271))
                 right_clk <= 1'b1;
       else if (mode_136 && (counter == 11'd135))
                 right_clk <= 1'b1;
       else if (mode_1024 && (counter == 11'd1023))
                 right_clk <= 1'b1;
       else if (mode_512 && (counter == 11'd511))
                 right_clk <= 1'b1;
       else if (mode_1088 && (counter == 11'd1087))
                 right_clk <= 1'b1;
       else if (mode_544 && (counter == 11'd543))
                 right_clk <= 1'b1;
       else
                 right_clk <= 1'b0;
  end
end

always @(negedge resetb or posedge MCLK)
begin
  if (~resetb)
      lrcouto <= 1'b0;
  else begin
      if (slot_clk == 1'b1)
          lrcouto <= 1'b1;
      else if (right_clk == 1'b1)
          lrcouto <= 1'b0;
      else
          lrcouto <= lrcouto;
  end
end

assign lrcino=lrcouto;

always @( posedge RESET or posedge bclko )
    if (RESET)
      delay_lrcouto <= 1'b0 ;
  else 
      delay_lrcouto <= lrcouto ;
 

always @( posedge  RESET or posedge bclko )
  if (RESET)
            DATA_LATCH_MS <= 1'b0 ;
  else begin
      if ( lrcouto && !delay_lrcouto )
            DATA_LATCH_MS <= 1'b1 ;
      else
            DATA_LATCH_MS <= 1'b0 ;
       end
           
      
    
always @(posedge MCLK or negedge resetb)
  if (!resetb)
       half_mclk <= 1'b0;
  else
       half_mclk <= ~half_mclk;

always @(posedge MCLK or negedge resetb)
  if (!resetb)
       DATA_LATCH <= 1'b0;
  else
       DATA_LATCH <= DATA_LATCH_tmp;
       

always @(posedge half_mclk or negedge resetb)
  if (!resetb)
       qua_mclk <= 1'b0;
  else
       qua_mclk <= ~qua_mclk;

assign  bclko  = ( mode_128 || mode_136 ) ? MCLK : qua_mclk;

endmodule              
           
      
    
