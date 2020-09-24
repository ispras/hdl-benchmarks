



















































































module  macfile


  (
  // Outputs
  ACC2DIVLO, ACC2SrcA_C, ACC2SrcB_C, ACC2RES_E,
  // Inputs
  CLK, RESET_D1_R_N, RESET_DIS, DDATAHI, Res2HI, DDATALO, Res2LO,
  Dest_Acc, SrcA_C_R, SrcB_C_R, DivDest_C1, DivDest_C2, Res_E_R_C0,
  Res_E_R_C1, ResSh_E_R_C0, ResSh_E_R_C1, Rhold, Xcpn
  );


  `include "lxr_symbols.vh"
  `include "core_symbols.vh"


  input           CLK;
  input           RESET_D1_R_N;
  input           RESET_DIS;

  // Data inputs

  // To HI registers
  input [39:0]    DDATAHI;
  input [39:0]    Res2HI;

  // To LO registers
  input [39:0]    DDATALO;
  input [39:0]    Res2LO;

  // Input Control Signals

  input [3:0]     Dest_Acc;
  input [3:0]     SrcA_C_R;
  input [3:0]     SrcB_C_R;

  input [3:0]     DivDest_C1;
  input [3:0]     DivDest_C2;



  input [3:0]     Res_E_R_C0;
  input [3:2]     Res_E_R_C1;
  input [3:0]     ResSh_E_R_C0;
  input [3:0]     ResSh_E_R_C1;


  input           Rhold;
  input           Xcpn;


  output [31:0]   ACC2DIVLO;  // D* - read aMl


  output [39:0]   ACC2SrcA_C;
  output [39:0]   ACC2SrcB_C;



  output [31:0]   ACC2RES_E;  // E - read aM[h|l] or aMh[high],aMl[high]


  reg [31:0]      AccFileH_R[0:0];
  reg [31:0]      AccFileL_R[0:0];



  wire RESET_D2_R_N;


  // Regs for Outputs
  reg    [31:0]   ACC2RES_E;  // E - read aM[h|l] or aMh[high],aMl[high]


  reg    [31:0]   ACC2DIVLO;  // D* - read aMl

  reg  [39:0]   ACC2SrcA_C; // A - read aM[h|l]
  reg  [39:0]   ACC2SrcB_C; // A - read aM[h|l]

  // Internal Registers ************************************
  reg    [39:0]   RESH_E;  // E - read aM[h|l] or aMh[high],aMl[high]
  reg    [39:0]   RESL_E;  // E - read aM[h|l] or aMh[high],aMl[high]

  // Intermediate variables ************************************
  reg   [31:0]   RESHSh_E;  // E - read aM[h|l] or aMh[high],aMl[high]
  reg   [31:0]   RESLSh_E;  // E - read aM[h|l] or aMh[high],aMl[high]

  wire [39:0]      AccFileH_R_0;
  wire [39:0]      AccFileH_R_1;
  wire [39:0]      AccFileH_R_2;
  wire [39:0]      AccFileH_R_3;
  wire [39:0]      AccFileL_R_0;
  wire [39:0]      AccFileL_R_1;
  wire [39:0]      AccFileL_R_2;
  wire [39:0]      AccFileL_R_3;


  assign AccFileH_R_0 = {8'h00, AccFileH_R[0]};
  assign AccFileH_R_1 = 40'h00_0000_0000;
  assign AccFileH_R_2 = 40'h00_0000_0000;
  assign AccFileH_R_3 = 40'h00_0000_0000;
  assign AccFileL_R_0 = {8'h00, AccFileL_R[0]};
  assign AccFileL_R_1 = 40'h00_0000_0000;
  assign AccFileL_R_2 = 40'h00_0000_0000;
  assign AccFileL_R_3 = 40'h00_0000_0000;



  always @(AccFileH_R_0 or AccFileL_R_0 or SrcA_C_R
           or SrcB_C_R) begin
    case ( SrcA_C_R[1:0] )
      2'b01:   ACC2SrcA_C = AccFileL_R_0;
      2'b10:   ACC2SrcA_C = AccFileH_R_0;
      default: ACC2SrcA_C = 40'h00_0000_0000;
    endcase // case( SrcA_C_R[1:0] )
    case ( SrcB_C_R[1:0] )
      2'b01:   ACC2SrcB_C = AccFileL_R_0;
      2'b10:   ACC2SrcB_C = AccFileH_R_0;
      default: ACC2SrcB_C = 40'h00_0000_0000;
    endcase // case( SrcB_C_R[1:0] )
  end


   always @(AccFileL_R_0 or AccFileL_R_1 or AccFileL_R_2
            or AccFileL_R_3 or DivDest_C1 or DivDest_C2) begin
     casex ( DivDest_C1 )
       4'b00x1: ACC2DIVLO[31:16] = AccFileL_R_0[31:16];
       4'b01x1: ACC2DIVLO[31:16] = AccFileL_R_1[31:16];
       4'b10x1: ACC2DIVLO[31:16] = AccFileL_R_2[31:16];
       4'b11x1: ACC2DIVLO[31:16] = AccFileL_R_3[31:16];
       4'bxxx0: ACC2DIVLO[31:16] = 16'h0000;
     endcase // casex( DivDest_C1 )
     casex ( DivDest_C2 )
       4'b00x1: ACC2DIVLO[15:0] = AccFileL_R_0[15:0];
       4'b01x1: ACC2DIVLO[15:0] = AccFileL_R_1[15:0];
       4'b10x1: ACC2DIVLO[15:0] = AccFileL_R_2[15:0];
       4'b11x1: ACC2DIVLO[15:0] = AccFileL_R_3[15:0];
       4'bxxx0: ACC2DIVLO[15:0] = 16'h0000;
     endcase // casex( DivDest_C2 )
  end

  always @(AccFileH_R_0 or AccFileH_R_1 or AccFileH_R_2
           or AccFileH_R_3 or AccFileL_R_0 or AccFileL_R_1
           or AccFileL_R_2 or AccFileL_R_3 or Res_E_R_C0 or Res_E_R_C1) begin
    case ( {Res_E_R_C0[3:2]} )
      2'b00: RESH_E = AccFileH_R_0;
      2'b01: RESH_E = AccFileH_R_1;
      2'b10: RESH_E = AccFileH_R_2;
      2'b11: RESH_E = AccFileH_R_3;
    endcase // case( {Res_E_R_C0[3:2]} )
    case ( {Res_E_R_C1[3:2]} )
      2'b00: RESL_E = AccFileL_R_0;
      2'b01: RESL_E = AccFileL_R_1;
      2'b10: RESL_E = AccFileL_R_2;
      2'b11: RESL_E = AccFileL_R_3;
    endcase // case( {Res_E_R_C1[3:2]} )
  end

  always @(RESH_E or RESL_E or ResSh_E_R_C0
           or ResSh_E_R_C1) begin
    casex ( ResSh_E_R_C0 )
      4'b0000: RESHSh_E = RESH_E[31:0];
      4'bx001: RESHSh_E = RESH_E[32:1];
      4'bx010: RESHSh_E = RESH_E[33:2];
      4'bx011: RESHSh_E = RESH_E[34:3];
      4'bx100: RESHSh_E = RESH_E[35:4];
      4'bx101: RESHSh_E = RESH_E[36:5];
      4'bx110: RESHSh_E = RESH_E[37:6];
      4'bx111: RESHSh_E = RESH_E[38:7];
      4'b1000: RESHSh_E = RESH_E[39:8];
    endcase // casex( ResSh_E_R_C0 )
    casex ( ResSh_E_R_C1 )
      4'b0000: RESLSh_E = RESL_E[31:0];
      4'bx001: RESLSh_E = RESL_E[32:1];
      4'bx010: RESLSh_E = RESL_E[33:2];
      4'bx011: RESLSh_E = RESL_E[34:3];
      4'bx100: RESLSh_E = RESL_E[35:4];
      4'bx101: RESLSh_E = RESL_E[36:5];
      4'bx110: RESLSh_E = RESL_E[37:6];
      4'bx111: RESLSh_E = RESL_E[38:7];
      4'b1000: RESLSh_E = RESL_E[39:8];
    endcase // casex( ResSh_E_R_C1 )
  end

  always @(RESHSh_E or RESLSh_E or Res_E_R_C0) begin
    casex (Res_E_R_C0[1:0])
      2'b11: ACC2RES_E = {RESHSh_E[31:16], RESLSh_E[31:16]};
      2'b01: ACC2RES_E = RESLSh_E[31:0];
      2'b10: ACC2RES_E = RESHSh_E[31:0];
      2'b00: ACC2RES_E = 32'h0000_0000; // for low power
    endcase // casex(Res_E_R_C0[1:0])
  end


  // Accumulator Input muxes & flops
  always @(posedge CLK `negedge_RESET_D2_R_N_) begin


    // verilint 19 OFF // Truncation of extra bits


    if (~`RESET_D2_R_N_) begin
      AccFileL_R[0]  <= 40'h00_0000_0000;
    end
    else begin
      casex ({Dest_Acc, DivDest_C1})
          8'b00x1_xxx0: AccFileL_R[0]  <= Res2LO;
          8'bxxx0_00x1: AccFileL_R[0]  <= DDATALO;
        default:      AccFileL_R[0]  <= AccFileL_R_0;
      endcase // casex({Dest_Acc, DivDest_C1})
    end


    // verilint 19 ON  // Truncation of extra bits


  end // always @ (posedge CLK `negedge_RESET_R_N_)






    // verilint 19 OFF // Truncation of extra bits


  always @(posedge CLK `negedge_RESET_D2_R_N_) begin

    if (~`RESET_D2_R_N_) begin
      AccFileH_R[0]  <= 40'h00_0000_0000;
    end
    else begin
      casex ({Dest_Acc, DivDest_C1})
          8'b001x_xx0x: AccFileH_R[0]  <= Res2HI;
          8'bxx0x_001x: AccFileH_R[0]  <= DDATAHI;
        default:      AccFileH_R[0]  <= AccFileH_R_0;
      endcase // casex({Dest_Acc, DivDest_C1})
    end

  end // always @ (posedge CLK `negedge_RESET_R_N_)





  reg RESET_X_R_N;
  always @ (posedge CLK)
    RESET_X_R_N <= RESET_D1_R_N;
  assign RESET_D2_R_N = RESET_X_R_N | RESET_DIS;





  // synopsys translate_off
  // verilint translate off

  wire [39:0] HI_R;
  wire [39:0] LO_R;
  wire [39:0] ACC0H;
  wire [39:0] ACC0L;
  wire [39:0] ACC1H;
  wire [39:0] ACC1L;
  wire [39:0] ACC2H;
  wire [39:0] ACC2L;
  wire [39:0] ACC3H;
  wire [39:0] ACC3L;

  assign HI_R = AccFileH_R_0;
  assign LO_R = AccFileL_R_0;
  assign ACC0H = AccFileH_R_0;
  assign ACC0L = AccFileL_R_0;
  assign ACC1H = AccFileH_R_1;
  assign ACC1L = AccFileL_R_1;
  assign ACC2H = AccFileH_R_2;
  assign ACC2L = AccFileL_R_2;
  assign ACC3H = AccFileH_R_3;
  assign ACC3L = AccFileL_R_3;

  always @(posedge CLK) begin
    if (`RESET_D2_R_N_) begin



      casex ( SrcA_C_R )
        4'b1xxx,
        4'bx1xx,
        4'b0011: begin
          $display ("ERROR %t %m: Invalid SrcA_C_R in UNIMAC case.", $time);
          $stop;
        end
      endcase

      casex ( SrcB_C_R )
        4'b1xxx,
        4'bx1xx,
        4'b0011: begin
          $display ("ERROR %t %m: Invalid SrcB_C_R in UNIMAC case.", $time);
          $stop;
        end
      endcase

      casex ( Dest_Acc )
        4'b1xxx,
        4'bx1xx: begin
          $display ("ERROR %t %m: Invalid Dest_Acc in UNIMAC case.", $time);
          $stop;
        end
      endcase

      casex ( Res_E_R_C0[3:2] )
        2'b1x,
        2'bx1: begin
          $display ("ERROR %t %m: Invalid Res_E_R in UNIMAC case.", $time);
          $stop;
        end
      endcase



      casex ( SrcA_C_R )
        4'bxx11: begin
          $display ("ERROR %t %m: Invalid SrcA_C_R.", $time);
          $stop;
        end
      endcase

      casex ( SrcB_C_R )
        4'bxx11: begin
          $display ("ERROR %t %m: Invalid SrcB_C_R.", $time);
          $stop;
        end
      endcase

      casex ( ResSh_E_R_C0 ) // synopsys parallel_case
        4'b0xxx,
        4'b1000: ;
        default: begin
          $display ("ERROR %t %m: Shift Amount not in range 0-8.", $time);
          $stop;
      end
    endcase // case( ResSh_E_R )

      casex ({Dest_Acc, DivDest_C1})
        8'b00x1_00x1,
        8'b01x1_01x1,
        8'b10x1_10x1,
        8'b11x1_11x1,
        8'b001x_001x,
        8'b011x_011x,
        8'b101x_101x,
        8'b111x_111x: begin
        $display ("ERROR %t %m: Dest_Acc and DivDest write same register.", $time);
        $stop;
      end
  endcase


//  endcase // casex( ArSrcA_A_R )
  end // if (`RESET_D2_R_N_)
  end // always @ (posedge CLK)

  // synopsys translate_on
  // verilint translate on

endmodule

