



















































































`include "../include/lxr_symbols.vh"
module fifo_data

  // == lbc/fifo_data.v; version 1.3; LX-4180 release 4.0 ==

  // Copyright 1997-2000, Lexra Inc.
  // ALL RIGHTS RESERVED

  // Generic Side-in, broadside out FIFO datapath

  // Author: Elliot Mednick

  (
  // Outputs
  DATAO, CTLHITO,
  // Inputs
  DATAI, CMPI, CTLLOADI, CTLDOSHIFTI, CLOCKI, RESET_DIS,
  RESET_D1_R_N
  );

  // synopsys template
  parameter
    DEPTH=4,
           WIDTH=32,
           MASK={ `LINE_ADDR_HI+1 { 1'b1 } },
           NDEPTH=DEPTH-1,
           NWIDTH=WIDTH-1;

  input [NWIDTH:0] DATAI;               // Data in
  input [NWIDTH:0] CMPI;                // Comparison, if any
  input [NDEPTH:0] CTLLOADI;            // Actually, this is the valid bits
  input            CTLDOSHIFTI;         // Do a shift
  input            CLOCKI;              // The clock
  input            RESET_DIS;           // test mode
  input            RESET_D1_R_N;        // The reset

  output [NWIDTH:0] DATAO;              // Data out (end of FIFO)
  output [NDEPTH:0] CTLHITO;            // Comparison out (if used)

  reg [NDEPTH:0]    CTLHITO;
  reg [NDEPTH:0]    ctlload;            // One-hot load point
  reg [NDEPTH:0]    ctlshft;            // One load point w/simultaneous shig]ft

  // real registers
  reg [NWIDTH:0]    Fifo [NDEPTH:0];    // Fifo data registers
  reg [NWIDTH:0]    iFifo [NDEPTH:0];   // Fifo input data registers

  // synopsys translate_off
  // verilint 528 OFF // Variable set but not used masking unused input
  wire           NC_RESET_DIS = RESET_DIS;

  // verilint 528 ON  // Variable set but not used masking unused input
  // synopsys translate_on

  // debugging visibility
//        reg [NWIDTH:0]          fifo0, fifo1, fifo2, fifo3;

  assign DATAO = Fifo[0];

  // intermediate variables
  integer           i;                  // Fore: for for loops
  integer           j;                  // Fore: for for loops

  // verilint 521 off  // Not all the bits of the variable are in the sensitivity list: Fifo[i]
  // verilint 122 OFF  // Variable is not in the sensitivity list: Fifo[NDEPTH]
  always @(  CMPI or CTLDOSHIFTI or CTLLOADI
           or DATAI)
    begin

      ctlload = CTLLOADI;
      ctlshft = {1'b0, CTLLOADI [NDEPTH:1]};

      for (i = 0; i < NDEPTH; i = i + 1) begin

        casex ({CTLDOSHIFTI, ctlload[i], ctlshft[i]})// synopsys full_case
          3'b00x, 3'b1x0:
            iFifo [i] = DATAI;          // load if not shift or hold
          3'b01x:
            iFifo [i] = Fifo [i];       // hold if not shift or load
          3'b1x1:
            iFifo [i] = Fifo [i + 1];   // shift

          // synopsys translate_off
          // verilint translate off
          default: begin                // only 4'b1111 is not represented
            $display ("ERROR %t %m: Illegal FIFO mux selection: %b", $time, {CTLDOSHIFTI, ctlload[i], ctlshft[i]});
            $stop;
          end
          // verilint translate on
          // synopsys translate_on
        endcase // casex({CTLDOSHIFTI, ctlload[i], ctlshft[i]})
      end

      if (!ctlload[NDEPTH]) begin
        // load the last entry, maybe with garbage, if it is not valid
        iFifo [NDEPTH] = DATAI;
      end
      else begin
        iFifo [NDEPTH] = Fifo [NDEPTH];
      end

 // make visible for debugging
//fifo0 = Fifo[0];
//fifo1 = Fifo[1];
//fifo2 = Fifo[2];
//fifo3 = Fifo[3];

     // check for comparison
      for (i = 0; i < DEPTH; i = i + 1)
        begin

          // verilint 180 off // Zero extension of extra bits: MASK
          CTLHITO [i] = &((Fifo [i] ~^ CMPI) | MASK);
          // verilint 180 on // Zero extension of extra bits: MASK
        end

    end
  // verilint 122 ON  // Variable is not in the sensitivity list: Fifo[NDEPTH]
  // verilint 521 on  // Not all the bits of the variable are in the sensitivity list: Fifo[i]

  wire RESET_D2_R_N;

  // verilint 336 off // Blocking delay assignment in sequential always block: Fifo[j] = iFifo[j];

  // verilint 396 OFF  // * A flipflop without an asynchronous reset: RESET_X_R_N <= RESET_D1_R_N;
  // verilint 530 OFF  // A flipflop is inferred: RESET_X_R_N


  reg RESET_X_R_N;
  always @(posedge CLOCKI)
    RESET_X_R_N <= RESET_D1_R_N;
  assign RESET_D2_R_N = RESET_X_R_N | RESET_DIS;


  // verilint 396 ON  // * A flipflop without an asynchronous reset: RESET_X_R_N <= RESET_D1_R_N;
  // verilint 530 ON  // A flipflop is inferred: RESET_X_R_N

  always @(posedge CLOCKI `negedge_RESET_D2_R_N_) begin
    if (!`RESET_D2_R_N_) begin
      for (j = 0; j < DEPTH; j = j + 1)
        Fifo [j] <= {WIDTH {1'b0}};
    end
    else begin
      for (j = 0; j < DEPTH; j = j + 1)
        Fifo [j] <= iFifo [j];
    end
  end

  // verilint 336 on // Blocking delay assignment in sequential always block: Fifo[j] = iFifo[j];

endmodule // fifo_data

