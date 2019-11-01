module ram_32_44( CK,
                  resetb,
                  DI,
                  A,
                  WEB,
                  DO);

// INPUTS
input [43:0] DI;      
input [4:0]   A;      
input                  WEB;    
input                  CK;     
input                  resetb;   

// OUTPUTS
output [43:0] DO;    

reg  [43:0] DO;

// The RAM
wire [43:0] mem0 ;
wire [43:0] mem1 ;
wire [43:0] mem2 ;
wire [43:0] mem3 ;
wire [43:0] mem4 ;
wire [43:0] mem5 ;
wire [43:0] mem6 ;
wire [43:0] mem7 ;
wire [43:0] mem8 ;
wire [43:0] mem9 ;
wire [43:0] mem10 ;
wire [43:0] mem11 ;
wire [43:0] mem12 ;
wire [43:0] mem13 ;
wire [43:0] mem14 ;
wire [43:0] mem15 ;
wire [43:0] mem16 ;
wire [43:0] mem17 ;
wire [43:0] mem18 ;
wire [43:0] mem19 ;
wire [43:0] mem20 ;
wire [43:0] mem21 ;
wire [43:0] mem22 ;
wire [43:0] mem23 ;
wire [43:0] mem24 ;
wire [43:0] mem25 ;
wire [43:0] mem26 ;
wire [43:0] mem27 ;
wire [43:0] mem28 ;
wire [43:0] mem29 ;
wire [43:0] mem30 ;
wire [43:0] mem31 ;

reg [31:0] addr;

always @(A) 
   begin
     casex (A)
       5'h00 : addr <= 32'b00000000000000000000000000000001;
       5'h01 : addr <= 32'b00000000000000000000000000000010;
       5'h02 : addr <= 32'b00000000000000000000000000000100;
       5'h03 : addr <= 32'b00000000000000000000000000001000;
       5'h04 : addr <= 32'b00000000000000000000000000010000;
       5'h05 : addr <= 32'b00000000000000000000000000100000;
       5'h06 : addr <= 32'b00000000000000000000000001000000;
       5'h07 : addr <= 32'b00000000000000000000000010000000;
       5'h08 : addr <= 32'b00000000000000000000000100000000;
       5'h09 : addr <= 32'b00000000000000000000001000000000;
       5'h0a : addr <= 32'b00000000000000000000010000000000;
       5'h0b : addr <= 32'b00000000000000000000100000000000;
       5'h0c : addr <= 32'b00000000000000000001000000000000;
       5'h0d : addr <= 32'b00000000000000000010000000000000;
       5'h0e : addr <= 32'b00000000000000000100000000000000;
       5'h0f : addr <= 32'b00000000000000001000000000000000;
       5'h10 : addr <= 32'b00000000000000010000000000000000;
       5'h11 : addr <= 32'b00000000000000100000000000000000;
       5'h12 : addr <= 32'b00000000000001000000000000000000;
       5'h13 : addr <= 32'b00000000000010000000000000000000;
       5'h14 : addr <= 32'b00000000000100000000000000000000;
       5'h15 : addr <= 32'b00000000001000000000000000000000;
       5'h16 : addr <= 32'b00000000010000000000000000000000;
       5'h17 : addr <= 32'b00000000100000000000000000000000;
       5'h18 : addr <= 32'b00000001000000000000000000000000;
       5'h19 : addr <= 32'b00000010000000000000000000000000;
       5'h1a : addr <= 32'b00000100000000000000000000000000;
       5'h1b : addr <= 32'b00001000000000000000000000000000;
       5'h1c : addr <= 32'b00010000000000000000000000000000;
       5'h1d : addr <= 32'b00100000000000000000000000000000;
       5'h1e : addr <= 32'b01000000000000000000000000000000;
       5'h1f : addr <= 32'b10000000000000000000000000000000;
     default : addr <= 32'b00000000000000000000000000000001;
   endcase
 end

wire  [31:0]   wr_lat;
assign wr_lat = (~CK && ~WEB) ? addr : 32'h0;


ram_latch umem0( .wr_lat(wr_lat[0]), .DI(DI), .DO(mem0), .resetb(resetb));
ram_latch umem1( .wr_lat(wr_lat[1]), .DI(DI), .DO(mem1), .resetb(resetb));
ram_latch umem2( .wr_lat(wr_lat[2]), .DI(DI), .DO(mem2), .resetb(resetb));
ram_latch umem3( .wr_lat(wr_lat[3]), .DI(DI), .DO(mem3), .resetb(resetb));
ram_latch umem4( .wr_lat(wr_lat[4]), .DI(DI), .DO(mem4), .resetb(resetb));
ram_latch umem5( .wr_lat(wr_lat[5]), .DI(DI), .DO(mem5), .resetb(resetb));
ram_latch umem6( .wr_lat(wr_lat[6]), .DI(DI), .DO(mem6), .resetb(resetb));
ram_latch umem7( .wr_lat(wr_lat[7]), .DI(DI), .DO(mem7), .resetb(resetb));
ram_latch umem8( .wr_lat(wr_lat[8]), .DI(DI), .DO(mem8), .resetb(resetb));
ram_latch umem9( .wr_lat(wr_lat[9]), .DI(DI), .DO(mem9), .resetb(resetb));
ram_latch umem10( .wr_lat(wr_lat[10]), .DI(DI), .DO(mem10), .resetb(resetb));
ram_latch umem11( .wr_lat(wr_lat[11]), .DI(DI), .DO(mem11), .resetb(resetb));
ram_latch umem12( .wr_lat(wr_lat[12]), .DI(DI), .DO(mem12), .resetb(resetb));
ram_latch umem13( .wr_lat(wr_lat[13]), .DI(DI), .DO(mem13), .resetb(resetb));
ram_latch umem14( .wr_lat(wr_lat[14]), .DI(DI), .DO(mem14), .resetb(resetb));
ram_latch umem15( .wr_lat(wr_lat[15]), .DI(DI), .DO(mem15), .resetb(resetb));
ram_latch umem16( .wr_lat(wr_lat[16]), .DI(DI), .DO(mem16), .resetb(resetb));
ram_latch umem17( .wr_lat(wr_lat[17]), .DI(DI), .DO(mem17), .resetb(resetb));
ram_latch umem18( .wr_lat(wr_lat[18]), .DI(DI), .DO(mem18), .resetb(resetb));
ram_latch umem19( .wr_lat(wr_lat[19]), .DI(DI), .DO(mem19), .resetb(resetb));
ram_latch umem20( .wr_lat(wr_lat[20]), .DI(DI), .DO(mem20), .resetb(resetb));
ram_latch umem21( .wr_lat(wr_lat[21]), .DI(DI), .DO(mem21), .resetb(resetb));
ram_latch umem22( .wr_lat(wr_lat[22]), .DI(DI), .DO(mem22), .resetb(resetb));
ram_latch umem23( .wr_lat(wr_lat[23]), .DI(DI), .DO(mem23), .resetb(resetb));
ram_latch umem24( .wr_lat(wr_lat[24]), .DI(DI), .DO(mem24), .resetb(resetb));
ram_latch umem25( .wr_lat(wr_lat[25]), .DI(DI), .DO(mem25), .resetb(resetb));
ram_latch umem26( .wr_lat(wr_lat[26]), .DI(DI), .DO(mem26), .resetb(resetb));
ram_latch umem27( .wr_lat(wr_lat[27]), .DI(DI), .DO(mem27), .resetb(resetb));
ram_latch umem28( .wr_lat(wr_lat[28]), .DI(DI), .DO(mem28), .resetb(resetb));
ram_latch umem29( .wr_lat(wr_lat[29]), .DI(DI), .DO(mem29), .resetb(resetb));
ram_latch umem30( .wr_lat(wr_lat[30]), .DI(DI), .DO(mem30), .resetb(resetb));
ram_latch umem31( .wr_lat(wr_lat[31]), .DI(DI), .DO(mem31), .resetb(resetb));

wire rd_clk ;
assign rd_clk = !(~CK && WEB ) ;

always @( posedge rd_clk )
  begin
    casex (A)
       5'h00 : DO <= mem0 ;
       5'h01 : DO <= mem1 ;
       5'h02 : DO <= mem2 ;
       5'h03 : DO <= mem3 ;
       5'h04 : DO <= mem4 ;
       5'h05 : DO <= mem5 ;
       5'h06 : DO <= mem6 ;
       5'h07 : DO <= mem7 ;
       5'h08 : DO <= mem8 ;
       5'h09 : DO <= mem9 ;
       5'h0a : DO <= mem10 ;
       5'h0b : DO <= mem11 ;
       5'h0c : DO <= mem12 ;
       5'h0d : DO <= mem13 ;
       5'h0e : DO <= mem14 ;
       5'h0f : DO <= mem15 ;
       5'h10 : DO <= mem16 ;
       5'h11 : DO <= mem17 ;
       5'h12 : DO <= mem18 ;
       5'h13 : DO <= mem19 ;
       5'h14 : DO <= mem20 ;
       5'h15 : DO <= mem21 ;
       5'h16 : DO <= mem22 ;
       5'h17 : DO <= mem23 ;
       5'h18 : DO <= mem24 ;
       5'h19 : DO <= mem25 ;
       5'h1a : DO <= mem26 ;
       5'h1b : DO <= mem27 ;
       5'h1c : DO <= mem28 ;
       5'h1d : DO <= mem29 ;
       5'h1e : DO <= mem30 ;
       5'h1f : DO <= mem31 ;
     default : DO <= mem0 ;
   endcase
end

endmodule               // dac_ram
     

module ram_latch ( wr_lat , DI , DO , resetb ) ;
input wr_lat ;
input resetb ;
input [ 43 : 0 ] DI ;
output [ 43 : 0 ] DO ;

    QDLHRBN DO_reg_0 ( .Q(DO[0]), .D(DI[0]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_1 ( .Q(DO[1]), .D(DI[1]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_2 ( .Q(DO[2]), .D(DI[2]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_3 ( .Q(DO[3]), .D(DI[3]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_4 ( .Q(DO[4]), .D(DI[4]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_5 ( .Q(DO[5]), .D(DI[5]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_6 ( .Q(DO[6]), .D(DI[6]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_7 ( .Q(DO[7]), .D(DI[7]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_8 ( .Q(DO[8]), .D(DI[8]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_9 ( .Q(DO[9]), .D(DI[9]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_10 ( .Q(DO[10]), .D(DI[10]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_11 ( .Q(DO[11]), .D(DI[11]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_12 ( .Q(DO[12]), .D(DI[12]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_13 ( .Q(DO[13]), .D(DI[13]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_14 ( .Q(DO[14]), .D(DI[14]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_15 ( .Q(DO[15]), .D(DI[15]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_16 ( .Q(DO[16]), .D(DI[16]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_17 ( .Q(DO[17]), .D(DI[17]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_18 ( .Q(DO[18]), .D(DI[18]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_19 ( .Q(DO[19]), .D(DI[19]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_20 ( .Q(DO[20]), .D(DI[20]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_21 ( .Q(DO[21]), .D(DI[21]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_22 ( .Q(DO[22]), .D(DI[22]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_23 ( .Q(DO[23]), .D(DI[23]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_24 ( .Q(DO[24]), .D(DI[24]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_25 ( .Q(DO[25]), .D(DI[25]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_26 ( .Q(DO[26]), .D(DI[26]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_27 ( .Q(DO[27]), .D(DI[27]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_28 ( .Q(DO[28]), .D(DI[28]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_29 ( .Q(DO[29]), .D(DI[29]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_30 ( .Q(DO[30]), .D(DI[30]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_31 ( .Q(DO[31]), .D(DI[31]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_32 ( .Q(DO[32]), .D(DI[32]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_33 ( .Q(DO[33]), .D(DI[33]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_34 ( .Q(DO[34]), .D(DI[34]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_35 ( .Q(DO[35]), .D(DI[35]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_36 ( .Q(DO[36]), .D(DI[36]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_37 ( .Q(DO[37]), .D(DI[37]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_38 ( .Q(DO[38]), .D(DI[38]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_39 ( .Q(DO[39]), .D(DI[39]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_40 ( .Q(DO[40]), .D(DI[40]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_41 ( .Q(DO[41]), .D(DI[41]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_42 ( .Q(DO[42]), .D(DI[42]), .CK(wr_lat), .RB(resetb) );
    QDLHRBN DO_reg_43 ( .Q(DO[43]), .D(DI[43]), .CK(wr_lat), .RB(resetb) );

endmodule // ram_latch
