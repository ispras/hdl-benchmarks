`include "abcde.v"

module lmi_lbc_cbi

  // == lmi/lmi_lbc_cbi.v; version 1.6; LX-4180 release 4.0 ==

  // Copyright 1997-2000, Lexra Inc.
  // ALL RIGHTS RESERVED


  // An important use of the naming convention:
  //
  // This module registers ALL incoming information, and uses
  // it to kick off a request one or more cycles after the
  // info is received.  Thus, the computation part is one
  // cycle behind the normal core pipeline.  Typically that
  // is one cycle behind the M stage.
  //
  // To maintain sanity with respect pipeline stages, and
  // to keep track of where a request is relative to the
  // core pipeline, some signal names include both a pipeline
  // stage descriptor and a delay number.
  //
  // For example CDSign_E_D1 is an E stage signal delayed by
  // one cycle.  Note that this is not the same as CDSign_M,
  // because the computation of CDSign_M from CDSign_E must
  // involve the use of busy and exception.
  //
  // The strange looking name CDBe_M_D1_P is the input to
  // the register CDBe_M_D1_R, which is is the M stage
  // value of CDBe delayed by one cycle.  Thus, in the
  // name CDBe_M_D1_P, the D1 refers to the fact the
  // the _R signal is delayed by one cycle.  Normally,
  // one would expect D1 and P to cancel each other out.
  // Instead, they are preserved to emphasize that CDBe_M_D1_P
  // in this module is not the same as CDBe_M.

  (
  // Outputs
  DSysReq, DSysRW, DSysLine, DSysSz, DSysBE, DSysSign, ISysReq,
  ISysAddr, IDM, DDM, DSysAddr, DCmpAddr, ISysUC, DSysUC, PBI_EJHOLD,
  PBI_EJJPTHOLD,
  // Inputs
  IDCLOCKI, RESET_D1_R_N, TMODE, CFG_MEMFULLWORD, CFG_MEMZEROFIRST,
  CFG_LINEADDRFILTER, CFG_DCOFF, CFG_ICOFF, C_DREAD_E, C_DWRITE_E,
  C_DSIGN_E, C_DBE_E, C_DADDR_E, DR_ACK_M, DW_ACK_M, DC_MISS_W_R,
  DC_WRITE_W, C_ISTALL_I, C_IADDR_B, IC_MISS_S_R, IW_MISS_S_R,
  C_EXCEPTION_M, CP0_IEJORDM_I, CP0_JCTRLDM_M_R, X_HALT_R
  );

`include "../include/lxr_symbols.vh"
`include "../include/core_symbols.vh"

  input         IDCLOCKI;
  input         RESET_D1_R_N;
  input         TMODE;              // test mode

  input         CFG_MEMFULLWORD;    // 1 - memory support full word writes only, 0 - byte write
  input         CFG_MEMZEROFIRST;   // 1 - zero word first line fill; 0 - desired first
  input         CFG_LINEADDRFILTER; // 0 - line read address unmodified, 1 - zero low bits if CFG_MEMZEROFIRST

  input         CFG_DCOFF;       // all data references treated as uncached
  input         CFG_ICOFF;       // all inst references treated as uncached
  input         C_DREAD_E;       // core initates D read op
  input         C_DWRITE_E;      // core initiates D write op
  input         C_DSIGN_E;       // Sign extend flag
  input   [3:0] C_DBE_E;         // byte enables for D op
  input  [31:0] C_DADDR_E;       // D cache address

  input         DR_ACK_M;        // ROM ack for D op
  input         DW_ACK_M;        // SPAD ack for D op
  input         DC_MISS_W_R;     // D cache miss
  input         DC_WRITE_W;      // asserted when D cache is in WBUS state for partial write

  input         C_ISTALL_I;      // core initiates I fetch op (active low)
  input  [31:0] C_IADDR_B;       // I cache address

  input         IC_MISS_S_R;     // I cache miss
  input         IW_MISS_S_R;     // I RAM miss

  input         C_EXCEPTION_M;   // exception signal from core, squashes DreadEX or DwriteEX

  input         CP0_IEJORDM_I;        // I stage debug mode
//  input         CP0_JCTRLDM_I_R;        // I stage debug mode
  input         CP0_JCTRLDM_M_R;        // M stage debug mode
  input  [`HALT_SIG_RANGE] X_HALT_R;       // halt lines from all modules

  output        DSysReq;         // D request to system bus
  output        DSysRW;          // D read/write (1/0) control to system bus
  output        DSysLine;        // D line/single (1/0) control to system bus
  output  [1:0] DSysSz;          // D size (0:1 byte; 1:2 bytes, etc)
  output  [3:0] DSysBE;          // D byte enables (alternative to DSysSz[1:0] and DSysAddr[1:0]
  output        DSysSign;        // D sign extend
  output        ISysReq;         // I request to system bus
  output [31:0] ISysAddr;        // I cache address after translation
  output        IDM;             // I Cache access is in debug mode
  output        DDM;             // D Cache access is in debug mode
  output [31:0] DSysAddr;        // D cache address after translation
  output [31:0] DCmpAddr;        // D cache address used for read compares

  output        ISysUC;          // Uncached reference
  output        DSysUC;          // Uncached reference

  output        PBI_EJHOLD;      // Hold line for EJTAG
  output        PBI_EJJPTHOLD;   // Hold line for EJTAG

  reg           DRAck_M_D1_R;       // ROM ack for D op
  reg           DWAck_M_D1_R;       // SPAD ack for D op
  reg           CException_M_D1_R;  // exception from core
  reg           DCWrite_W_D1_R;     // asserted when D cache is in WBUS state for partial write
  reg           CIStall_I_D1_R;     // core initiates I fetch op (active low)

  reg [`HALT_SIG_RANGE] X_HALT_D1_R;    // halt lines from all modules, delayed one cycle

  reg           INIT_D1_R;          // asserted until 1 cycle after reset
  reg           INIT_D2_R;          // asserted until 2 cycles after reset
  reg           INIT_D3_R;          // asserted until 3 cycles after reset
  reg           INIT_D4_R;          // asserted until 4 cycles after reset

  reg    [31:0] CIAddr_I_R;         // I stage IADDR
  reg    [31:0] CIAddr_I_P;

  reg    [31:0] CDAddr_E_D1_R;
  reg    [31:0] CDAddr_M_D1_R, CDAddr_M_D1_P;
  reg    [31:0] DAddr_W_D1_R,  DAddr_W_D1_P;
  reg    [31:0] CIAddr_I_D1_R, CIAddr_I_D1_P;

  // For data side, ultimate need is for M stage signals delayed by one cycle.
  // First, delay the E stage by one cycle, then compute the M stage
  // signals based on the delayed E stage signals.

  reg     [3:0] CDBe_E_D1_R,    CDBe_M_D1_R,    CDBe_M_D1_P;
  reg           CDSign_E_D1_R,  CDSign_M_D1_R,  CDSign_M_D1_P;
  reg           CDRead_E_D1_R,  CDRead_M_D1_R,  CDRead_M_D1_P;
  reg           CDWrite_E_D1_R, CDWrite_M_D1_R, CDWrite_M_D1_P;
  reg           CDUnc_M_D1_R,   CDUnc_M_D1_P;
  reg           DUnc_W_D1_R,    DUnc_W_D1_P;
  reg           Idm_I_D1_R;
  reg           Ddm_M_D1_R;

  // Signals for request formation.
  // At this point, stage names loose significance.

  reg    [31:0] IAddrPhy;  // physical instruction address
  reg           IUnc;      // instruction address is in kseg1 or uncacheble kseg2

  reg    [31:0] DAddrPhy;  // physical data address
  reg           DUnc;      // data address is in kseg1 or uncacheable kseg2
  reg     [1:0] DSize;     // effective data transfer size
  reg     [3:0] DBe;       // effective data transfer byte enables

  // synopsys translate_off
  // verilint 528 OFF // Variable set but not used masking unused input
  wire                  NC_FOO = TMODE;
  // verilint 528 ON  // Variable set but not used masking unused input
  // synopsys translate_on

  // Generate reset at level 2

  wire          RESET_D2_R_N;


  // verilint 396 OFF // A flipflop without an async reset
  // verilint 530 OFF // A flipflop is inferred
  reg RESET_X_R_N;
  always @(posedge IDCLOCKI)
    RESET_X_R_N <= RESET_D1_R_N;
  assign RESET_D2_R_N = RESET_X_R_N | TMODE;
  // verilint 396 ON // A flipflop without an async reset
  // verilint 530 ON // A flipflop is inferred



  wire anyIBusy_D1 = |  X_HALT_D1_R;
  wire anyDBusy_D1 = | (X_HALT_D1_R & ~`RALU_HALT_E_MASK);
  wire PBI_EJHOLD = | X_HALT_R;
  wire PBI_EJJPTHOLD = | (X_HALT_R & `JPT_HALT_M_MASK);

  wire          anyDAck_M_D1 = DRAck_M_D1_R | DWAck_M_D1_R;

  wire          wrPartial_M_D1 = CDWrite_M_D1_R & ~(CDBe_M_D1_R[3] & CDBe_M_D1_R[1]);

  assign DSysReq  = (
                     (
                        (CDRead_M_D1_R & DC_MISS_W_R)
                      | (CDWrite_M_D1_R & ~wrPartial_M_D1 & ~anyDAck_M_D1)
                      | (wrPartial_M_D1 & (DC_MISS_W_R | (~CFG_MEMFULLWORD & ~anyDAck_M_D1) ) )
                     )
                     & ~anyDBusy_D1 & ~CException_M_D1_R
                    )
                    | DCWrite_W_D1_R;

  assign DCmpAddr = CDAddr_M_D1_P;
  assign DSysAddr = DAddrPhy;
  assign DSysUC   = DUnc;
  assign DSysRW   = (CDRead_M_D1_R|wrPartial_M_D1&DC_MISS_W_R&CFG_MEMFULLWORD&~DUnc) & (~DCWrite_W_D1_R);
  assign DSysLine = (CDRead_M_D1_R|(wrPartial_M_D1&DC_MISS_W_R&CFG_MEMFULLWORD)) & ~DUnc & ~DCWrite_W_D1_R;
  assign DSysSign = CDSign_M_D1_R;
  assign DSysSz   = DSize;
  assign DSysBE   = DBe;

  assign ISysReq  = ~CIStall_I_D1_R & ~anyIBusy_D1 & (IC_MISS_S_R | IW_MISS_S_R);
  assign ISysAddr = IAddrPhy;
  assign ISysUC   = IUnc;
  assign IDM      = Idm_I_D1_R;
  assign DDM      = Ddm_M_D1_R;

  always @(posedge IDCLOCKI `negedge_RESET_D2_R_N_)

    if (!`RESET_D2_R_N_)

      begin

      INIT_D1_R         <= 1'b1;
      INIT_D2_R         <= 1'b1;
      INIT_D3_R         <= 1'b1;
      INIT_D4_R         <= 1'b1;

      CDAddr_E_D1_R     <= 32'd0;
      CDRead_E_D1_R     <= 1'b0;
      CDWrite_E_D1_R    <= 1'b0;
      CDBe_E_D1_R       <= 4'b0000;
      CDSign_E_D1_R     <= 1'b0;

      CException_M_D1_R <= 1'b0;

      X_HALT_D1_R       <= { `HALT_SIG_COUNT { 1'b0 } };

      DRAck_M_D1_R      <= 1'b0;
      DWAck_M_D1_R      <= 1'b0;

      DCWrite_W_D1_R    <= 1'b0;

      CDRead_M_D1_R     <= 1'b0;
      CDWrite_M_D1_R    <= 1'b0;
      CDBe_M_D1_R       <= 4'b0000;
      CDSign_M_D1_R     <= 1'b0;
      CDAddr_M_D1_R     <= 32'd0;
      CDUnc_M_D1_R      <= 1'b0;
      DAddr_W_D1_R      <= 32'd0;
      DUnc_W_D1_R       <= 1'd0;

      CIStall_I_D1_R    <= 1'b0;
      CIAddr_I_D1_R     <= 32'd0;
      CIAddr_I_R        <= 32'd0;
      Idm_I_D1_R        <= 1'b0;
      Ddm_M_D1_R        <= 1'b0;

      end

    else

      begin

      INIT_D1_R         <= 1'b0;
      INIT_D2_R         <= INIT_D1_R;
      INIT_D3_R         <= INIT_D2_R;
      INIT_D4_R         <= INIT_D3_R;

      CDAddr_E_D1_R     <= C_DADDR_E;
      CDRead_E_D1_R     <= C_DREAD_E;      // core initates D read op
      CDWrite_E_D1_R    <= C_DWRITE_E;     // core initiates D write op
      CDBe_E_D1_R       <= C_DBE_E;        // byte enables for D op
      CDSign_E_D1_R     <= C_DSIGN_E;

      CException_M_D1_R <= C_EXCEPTION_M;

      X_HALT_D1_R       <= X_HALT_R;

      DRAck_M_D1_R      <= DR_ACK_M;
      DWAck_M_D1_R      <= DW_ACK_M;

      DCWrite_W_D1_R    <= DC_WRITE_W;

      CDRead_M_D1_R     <= CDRead_M_D1_P;
      CDWrite_M_D1_R    <= CDWrite_M_D1_P;
      CDBe_M_D1_R       <= CDBe_M_D1_P;
      CDSign_M_D1_R     <= CDSign_M_D1_P;
      CDAddr_M_D1_R     <= CDAddr_M_D1_P;
      CDUnc_M_D1_R      <= CDUnc_M_D1_P;
      DAddr_W_D1_R      <= DAddr_W_D1_P;
      DUnc_W_D1_R       <= DUnc_W_D1_P;

      CIStall_I_D1_R    <= C_ISTALL_I;
      CIAddr_I_R        <= CIAddr_I_P;
      CIAddr_I_D1_R     <= CIAddr_I_D1_P;

      Idm_I_D1_R        <= CP0_IEJORDM_I;
      Ddm_M_D1_R        <= CP0_JCTRLDM_M_R;

      end

  always @(CDAddr_E_D1_R or CDAddr_M_D1_R or CDBe_E_D1_R
           or CDBe_M_D1_R or CDRead_E_D1_R or CDRead_M_D1_R
           or CDSign_E_D1_R or CDSign_M_D1_R or CDUnc_M_D1_R
           or CDWrite_E_D1_R or CDWrite_M_D1_R or CException_M_D1_R
           or CFG_DCOFF or CFG_ICOFF or CFG_LINEADDRFILTER
           or CFG_MEMFULLWORD or CFG_MEMZEROFIRST or CIAddr_I_D1_R
           or CIAddr_I_R or C_IADDR_B or DAddr_W_D1_R or DCWrite_W_D1_R
           or DSysLine or DSysRW or DUnc_W_D1_R or INIT_D1_R
           or INIT_D4_R or IW_MISS_S_R or anyDBusy_D1 or anyIBusy_D1) begin




    if (INIT_D1_R)
      CIAddr_I_P     = CIAddr_I_R;
    else
      CIAddr_I_P     = C_IADDR_B;

//    if (anyIBusy_D1&~INIT_D4_R)
    if (anyIBusy_D1&~INIT_D4_R)
      CIAddr_I_D1_P  = CIAddr_I_D1_R;
    else
      CIAddr_I_D1_P  = CIAddr_I_R;

    if (anyDBusy_D1)
      begin
      CDAddr_M_D1_P  = CDAddr_M_D1_R;
      CDRead_M_D1_P  = CDRead_M_D1_R;
      CDWrite_M_D1_P = CDWrite_M_D1_R;
      CDBe_M_D1_P    = CDBe_M_D1_R;
      CDSign_M_D1_P  = CDSign_M_D1_R;
      CDUnc_M_D1_P   = CDUnc_M_D1_R;
      end
    else
      begin
      CDRead_M_D1_P  = CDRead_E_D1_R  & ~CException_M_D1_R;
      CDWrite_M_D1_P = CDWrite_E_D1_R & ~CException_M_D1_R;
      CDBe_M_D1_P    = CDBe_E_D1_R;
      CDSign_M_D1_P  = CDSign_E_D1_R;
      CDUnc_M_D1_P   = (CDAddr_E_D1_R [31:29] == 3'b101)  // kseg1
                     | (CDAddr_E_D1_R [`KSEG2_UC_BITS] == `KSEG2_UC_VALUE)
                     | CFG_DCOFF;

      CDAddr_M_D1_P [28:0]  = CDAddr_E_D1_R [28:0];

        // Do logical-to-physical address translation early
        case (CDAddr_E_D1_R [31:29])  // synopsys parallel_case
          3'b000: CDAddr_M_D1_P [31:29] = 3'b010;// kuseg cached
          3'b001: CDAddr_M_D1_P [31:29] = 3'b011;
          3'b010: CDAddr_M_D1_P [31:29] = 3'b100;
          3'b011: CDAddr_M_D1_P [31:29] = 3'b101;
          3'b100: CDAddr_M_D1_P [31:29] = 3'b000;// kseg0 cached
          3'b101: CDAddr_M_D1_P [31:29] = 3'b000;// kseg1 uncached
          3'b110: CDAddr_M_D1_P [31:29] = 3'b110;// kseg2 cached (mostly)
          3'b111: CDAddr_M_D1_P [31:29] = 3'b111;
        endcase

      end

    // For partial writes, we need the W stage data address

    if (anyDBusy_D1)
      begin
      DAddr_W_D1_P = DAddr_W_D1_R;
      DUnc_W_D1_P  = DUnc_W_D1_R;
      end
    else
      begin
      DAddr_W_D1_P  = CDAddr_M_D1_R;
      DUnc_W_D1_P   = CDUnc_M_D1_R;
      end





    if (DCWrite_W_D1_R)
      begin
      DAddrPhy = DAddr_W_D1_R;
      DUnc     = DUnc_W_D1_R;
      end
    else
      begin
      DAddrPhy = CDAddr_M_D1_R;
      DUnc     = CDUnc_M_D1_R;
      end

    IUnc = (CIAddr_I_D1_R[31:29] == 3'b101)
         | (CIAddr_I_D1_R[`KSEG2_UC_BITS] == `KSEG2_UC_VALUE)
         | CFG_ICOFF & ~IW_MISS_S_R;

    // verilint 531 OFF // Truncating leading zeros (or x's or z's)
    DAddrPhy[31:`LINE_ADDR_HI+1] = DAddrPhy[31:`LINE_ADDR_HI+1];
    DAddrPhy[`LINE_ADDR_HI:2]    = DAddrPhy[`LINE_ADDR_HI:2] & { `LINE_ADDR_HI-1 {~CFG_MEMZEROFIRST | ~CFG_LINEADDRFILTER | ~DSysLine} };  // mask word part of addr
    DAddrPhy[1:0]  = DAddrPhy[1:0] & { 2 {DUnc | (~CFG_MEMFULLWORD & ~DSysRW)} };                  // mask byte part of addr

    // verilint 531 ON // Truncating leading zeros (or x's or z's)
    DBe = CDBe_M_D1_R | {4 {~DUnc & (CFG_MEMFULLWORD | DSysRW)}};

    // Do logical-to-physical address translation
    IAddrPhy[28:`LINE_ADDR_HI+1] = CIAddr_I_D1_R[28:`LINE_ADDR_HI+1];
    IAddrPhy[`LINE_ADDR_HI:2]  = CIAddr_I_D1_R[`LINE_ADDR_HI:2] & { `LINE_ADDR_HI-1 {~CFG_MEMZEROFIRST | ~CFG_LINEADDRFILTER | IUnc} };  // mask word part of addr
    IAddrPhy[1:0]  = CIAddr_I_D1_R[1:0];
    case (CIAddr_I_D1_R[31:29])  // synopsys parallel_case
      3'b000: IAddrPhy[31:29] = 3'b010;  // kuseg cached
      3'b001: IAddrPhy[31:29] = 3'b011;
      3'b010: IAddrPhy[31:29] = 3'b100;
      3'b011: IAddrPhy[31:29] = 3'b101;
      3'b100: IAddrPhy[31:29] = 3'b000;  // kseg0 cached
      3'b101: IAddrPhy[31:29] = 3'b000;  // kseg1 uncached
      3'b110: IAddrPhy[31:29] = 3'b110;  // kseg2 cached (mostly)
      3'b111: IAddrPhy[31:29] = 3'b111;
    endcase //

    case (DBe)

      4'b0001,
      4'b0010,
      4'b0100,
      4'b1000: DSize = 0;

      4'b0011,
      4'b1100: DSize = 1;

      4'b1111: DSize = 3;

      default:
        begin
        DSize = 0;
        end

    endcase // case(DBe)

    end // always @ (anyDBusy_D1 or anyIBusy_D1 or...

// synopsys translate_off
// verilint translate off

always @ (posedge IDCLOCKI) begin
  if ((DSysBE[3] + DSysBE[2] + DSysBE[1] + DSysBE[0] - 3'b1 != DSysSz) & DSysReq)
    begin
      $display ("ERROR %t %m: (sum of DSysBE - 1) != DSysSz", $time);
      $stop;
    end

  // Stop if invalid byte enables occurs during a valid transaction
  if (DSysReq &
      (DBe == 4'b0101 || DBe == 4'b0110 || DBe == 4'b0111 || DBe == 4'b1001 ||
       DBe == 4'b1010 || DBe == 4'b1011 || DBe == 4'b1101 || DBe == 4'b1110))
    begin
      $display ("ERROR %t %m: Illegal byte enable encountered in lmi_lbc_cmi, DBe=0",$time,DBe);
      $stop;
    end
end
// verilint translate on
// synopsys translate_on

endmodule // lmi_lbc_cbi
