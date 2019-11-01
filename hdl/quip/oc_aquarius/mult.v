//======================================================
// Aquarius Project
//    SuperH-2 ISA Compatible RISC CPU
//------------------------------------------------------
// Module      : Multiplier Unit
//------------------------------------------------------
// File        : mult.v
// Library     : none
// Description : Multiplier Unit in CPU.
// Simulator   : Icarus Verilog (Cygwin)
// Synthesizer : Xilinx XST (Windows XP)
// Author      : Thorn Aitch
//------------------------------------------------------
// Revision Number : 1
// Date of Change  : 19th August 2002
// Creator         : Thorn Aitch
// Description     : Initial Design				  
//------------------------------------------------------
// Revision Number : 2
// Date of Change  : 30th April 2003
// Modifier        : Thorn Aitch
// Description     : Release Version 1.0
//======================================================
// Copyright (C) 2002-2003, Thorn Aitch
//
// Designs can be altered while keeping list of
// modifications "the same as in GNU" No money can
// be earned by selling the designs themselves, but
// anyone can get money by selling the implementation
// of the design, such as ICs based on some cores, 
// boards based on some schematics or Layouts, and
// even GUI interfaces to text mode drivers.
// "The same as GPL SW" Any update to the design
// should be documented and returned to the design. 
// Any derivative work based on the IP should be free
// under OpenIP License. Derivative work means any
// update, change or improvement on the design. 
// Any work based on the design can be either made
// free under OpenIP license or protected by any other
// license. Work based on the design means any work uses
// the OpenIP Licensed core as a building black without
// changing anything on it with any other blocks to
// produce larger design.  There is NO WARRANTY on the
// functionality or performance of the design on the
// real hardware implementation.
// On the other hand, the SuperH-2 ISA (Instruction Set
// Architecture) executed by Aquarius is rigidly
// the property of Renesas Corp. Then you have all 
// responsibility to judge if there are not any 
// infringements to Renesas's rights regarding your 
// Aquarius adoption into your design. 
// By adopting Aquarius, the user assumes all 
// responsibility for its use.
// This project may cause any damages around you, for 
// example, loss of properties, data, money, profits,
// life, or business etc. By adopting this source, 
// the user assumes all responsibility for its use.
//======================================================

`include "timescale.v"
`include "defines.v"

//****************************
// Multiply Unit Specification
//****************************
// This unit handles following multiplier related operations. 
//   DMULS.L
//   DMULU.L
//   MAC.L
//   MAC.W
//   MUL.L
//   MULS.W
//   MULU.W
// Physical multiplier size is 32bit*16bit->48bit.
// Then, 32x32 operations are executed in 2 cycles.

//*************************************************
// Module Definition
//*************************************************
module mult(
    // system signal
    CLK, RST,
    // command
    SLOT, MULCOM1, MULCOM2, MAC_S, WRMACH, WRMACL,
    // input data
    MACIN1, MACIN2,
    // output data
    MACH, MACL,
    // busy signal
    MAC_BUSY
    );

//-------------------
// Module I/O Signals
//-------------------
    input  CLK;           // clock
    input  RST;           // reset
    input  SLOT;          // cpu pipe slot
    input  MULCOM1;       // M1 latch command
    input  [7:0] MULCOM2; // M2 latch and mult engage command
                          // NOP      0 0000000 00
                          // DMULS.L  1 0111101 BD
                          // DMULU.L  1 0110101 B5
                          // MAC.L    1 0001111 8F
                          // MAC.W    1 1001111 CF
                          // MUL.L    1 0000111 87
                          // MULS.W   1 0101111 AF
                          // MULU.W   1 0101110 AE
    input  MAC_S;         // S-bit in SR
    input  WRMACH, WRMACL;// write MACH and MACL directly from data path
    input  [31:0] MACIN1; // input data 1
    input  [31:0] MACIN2; // input data 2
    output [31:0] MACH;   // output MACH
    output [31:0] MACL;   // output MACL
    output MAC_BUSY;      // busy signal (negate at final operation state)

//-----------------
// Internal Signals
//-----------------
    reg  [31:0] M1;   // input data1 latch
    reg  [31:0] M2;   // input data2 latch
    reg  [31:0] MB;   // input data 2 buffer to implement continuous MAC.L instruction
    reg  SELA;        // 0:A=M1, 1:A=MB
    reg  [31:0] A;    // A=M1 or A=MB (selected by SELA)
    reg  [31:0] B;    // B=M2
    reg  SHIFT;       // use lower(0)/upper(1) 16bit of B; use unshifted(0)/16bit-shifted(1) PM
    reg  SIGN;        // 0:unsigned, 1:signed (multipier operation)
    reg  SIZE;        // if 32*32 then 1, 16*16 then 0
    reg  [30:0] AH;   // lower 31bit of A
    reg  [15:0] BH;   // upper 16bit of B(0) or lower 16bit of B(1)
    reg  [46:0] ABH;  // output of Multiplier(31x16) (=A * BH) (calculated as unsigned)
    reg  [32:0] ABH2; // modified ABH
    reg  [31:0] P2;   // if signed32*32, ~SHIFT&A[31]&B[31:0], if signed16*16, ~SHIFT&A[31]&{B[15:0]:16'h0000}
    reg  [31:0] P3;   // if signed32*32, ~SHIFT&B[31]&A[31:0], if signed16*16, ~SHIFT&B[15]&A[31:0]
    reg  [31:0] P23;  // P2 + P3
    reg  [32:0] P23S; // if SIGN, ~P23, else P23
    reg  [47:0] PM;   // multiplier output (partial result) with sign
    reg  [63:0] C;    // one of the adder inputs
    reg  ZH;          // if final result is 16bit, adder input from MACH is forced to zero 
    reg  [1:0] ADD;   // 00:ADD, 10:ADDS48, 11:ADDS32 (adder functions regarding saturation)
    reg  [63:0] ADDRESULT;  // pure adder result
    reg  [63:0] ADDRESULT2; // saturated result
    reg  SAT;         // whether saturation has occured or not (to or 0001 to MACH)
    reg  LATMACH;     // latch signal of MACH by state machine
    reg  LATMACL;     // latch signal of MACL by state machine
    reg  [31:0] MACH; // actual MACH
    reg  [31:0] MACL; // actual MACL
    reg  MAC_BUSY;    // busy signal (negate at final operation state)
    reg  [3:0] STATE;     // control state
    reg  [3:0] NEXTSTATE; // next state
    reg  MAC_DISPATCH;    // mult can accept next new operation

//-------------------
// Main State Machine
//-------------------
    // state machine F/F
    always @(posedge CLK or posedge RST)
    begin
        if (RST == 1'b1)
            STATE <= `NOP;
        else if (MAC_DISPATCH & SLOT)
            begin                
                case(MULCOM2)
                    8'h00   : STATE <= `NOP;
                    8'hBD   : STATE <= `DMULSL;
                    8'hB5   : STATE <= `DMULUL;
                    8'h8F   : if (MAC_S == 1'b0)
                                  STATE <= `MACL0;
                              else
                                  STATE <= `MACLS;
                    8'hCF   : if (MAC_S == 1'b0)
                                  STATE <= `MACW;
                              else
                                  STATE <= `MACWS;
                    8'h87   : STATE <= `MULL;
                    8'hAF   : STATE <= `MULSW;
                    8'hAE   : STATE <= `MULUW;
                    default : STATE <= `NOP;
                endcase
            end
        else if (MAC_DISPATCH & ~SLOT)
            STATE <= `NOP;
        else if (~MAC_DISPATCH)
            STATE <= NEXTSTATE;
    end

//------------------
// State Transistion
//------------------
// NOP     : A=M1, BH=LowerB, unsign MULT, C=PM,                > NOP
//
// DMULSL  : A=M1, BH=LowerB, signed MULT, C=PM,       MAC<=ADD > DMULSL2
// DMULSL2 : A=M1, BH=upperB, signed MULT, C=(PM<<16), MAC<=ADD > NOP
//
// DMULUL  : A=M1, BH=LowerB, unsign MULT, C=PM,       MAC<=ADD > DMULUL2
// DMULUL2 : A=M1, BH=upperB, unsign MULT, C=(PM<<16), MAC<=ADD > NOP
//
// MACL0   : A=MB, BH=LowerB, signed MULT, C=PM,       MAC<=ADD > MACL2
// MACL2   : A=MB, BH=upperB, signed MULT, C=(PM<<16), MAC<=ADD > NOP

// MACLS   : A=MB, BH=LowerB, signed MULT, C=PM,       MAC<=ADDS48 > MACL2
// MACLS2  : A=MB, BH=upperB, signed MULT, C=(PM<<16), MAC<=ADDS48 > NOP

// MACW    : A=M1, BH=LowerB, signed MULT, C=PM,       MAC<=ADD > NOP

// MACWS   : A=M1, BH=LowerB, signed MULT, C=PM,       MACL<=ADDS32 > NOP
//                                                               if saturate, MACH|=0001

// MULL    : A=M1, BH=LowerB, signed MULT, C=PM,       MACL<=ADD > MULL2
// MULL2   : A=M1, BH=upperB, signed MULT, C=(PM<<16), MACL<=ADD > NOP

// MULSW   : A=M1, BH=LowerB, signed MULT, C=PM,       MACL<=ADD > NOP

// MULUW   : A=M1, BH=LowerB, unsign MULT, C=PM,       MACL<=ADD > NOP

    always @(STATE or SLOT or MULCOM2 or MAC_S)
    begin 
        case (STATE)
            `NOP    :begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b0_000_00_000;
                      MAC_BUSY <= 1'b0;
                      MAC_DISPATCH <= 1'b1;
                      NEXTSTATE <= `NOP;
                     end
            `DMULSL :begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b0_011_00_110;
                      MAC_BUSY <= 1'b1;
                      MAC_DISPATCH <= 1'b0;
                      NEXTSTATE <= `DMULSL2;
                     end
            `DMULSL2:begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b0_111_00_110;
                      MAC_BUSY <= 1'b0;
                      MAC_DISPATCH <= 1'b1;
                      NEXTSTATE <= `NOP;
                     end
            `DMULUL :begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b0_001_00_110;
                      MAC_BUSY <= 1'b1;
                      MAC_DISPATCH <= 1'b0;
                      NEXTSTATE <= `DMULUL2;
                     end
            `DMULUL2:begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b0_101_00_110;
                      MAC_BUSY <= 1'b0;    
                      MAC_DISPATCH <= 1'b1;
                      NEXTSTATE <= `NOP;
                     end
            `MACL0  :begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b1_011_00_110;
                      MAC_BUSY <= 1'b1;     
                      MAC_DISPATCH <= 1'b0;
                      NEXTSTATE <= `MACL2;
                     end
            `MACL2  :begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b1_111_00_110;
                      MAC_BUSY <= 1'b0;    
                      MAC_DISPATCH <= 1'b1;
                      NEXTSTATE <= `NOP;
                     end
            `MACLS  :begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b1_011_10_110;
                      MAC_BUSY <= 1'b1;     
                      MAC_DISPATCH <= 1'b0;
                      NEXTSTATE <= `MACLS2;
                     end
            `MACLS2 :begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b1_111_10_110;
                      MAC_BUSY <= 1'b0;    
                      MAC_DISPATCH <= 1'b1;
                      NEXTSTATE <= `NOP;
                     end
            `MACW   :begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b0_010_00_110;
                      MAC_BUSY <= 1'b1;    
                      MAC_DISPATCH <= 1'b1;
                      NEXTSTATE <= `NOP;
                     end
            `MACWS  :begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b0_010_11_011;
                      MAC_BUSY <= 1'b0;     
                      MAC_DISPATCH <= 1'b1;
                      NEXTSTATE <= `NOP;
                     end
            `MULL   :begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b0_011_00_011;
                      MAC_BUSY <= 1'b1;     
                      MAC_DISPATCH <= 1'b0;
                      NEXTSTATE <= `MULL2;
                     end
            `MULL2  :begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b0_111_00_011;
                      MAC_BUSY <= 1'b0;    
                      MAC_DISPATCH <= 1'b1;
                      NEXTSTATE <= `NOP;
                     end
            `MULSW  :begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b0_010_00_011;
                      MAC_BUSY <= 1'b0;     
                      MAC_DISPATCH <= 1'b1;
                      NEXTSTATE <= `NOP;
                     end
            `MULUW  :begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b0_000_00_011;
                      MAC_BUSY <= 1'b0;     
                      MAC_DISPATCH <= 1'b1;
                      NEXTSTATE <= `NOP;
                     end
            default : begin
                      {SELA,SHIFT,SIGN,SIZE,ADD,LATMACH,LATMACL,ZH}<=9'b0_000_00_000;
                      MAC_BUSY <= 1'b0;     
                      MAC_DISPATCH <= 1'b1;
                      NEXTSTATE <= `NOP;
                     end
        endcase
    end

//-----------------------------------------
// Data Path
//-----------------------------------------

//---
// M1
//---
    always @(posedge CLK)
    begin
        if (SLOT & MULCOM1)
	   begin
            M1 <= MACIN1;
        end
    end

//-------
// M2
// B (=M2)
//-------
    always @(posedge CLK)
    begin
        if (SLOT & MULCOM2[7])
	   begin
            M2 <= MACIN2;
        end
    end

    always @(M2) B <= M2;

//---
// MB
//---
// if SLOT and MULCOM2=MACL, do latch M1.
    always @(posedge CLK)
    begin
        if (SLOT & MULCOM2[7] & (MULCOM2[5:0] == 6'b001111))
	   begin
            MB <= M1;
        end
    end

//--------
//Select A
//--------
    always @(SELA or M1 or MB)
    begin
        if (SELA)
            A <= MB;
         else
            A <= M1;
    end

//---------------------------------------
// lower 31bit of A	(input to Multiplier)
//---------------------------------------
    always @(A or SIZE)
    begin
	   if (SIZE == 1'b0)
	       AH <= {16'h0000,A[14:0]};
	   else
	       AH <= A[30:0];
    end

//---------------------------------------
// upper/lower of B (input to Multiplier)
//---------------------------------------
    always @(B or SHIFT or SIZE)
    begin
        if (SIZE == 1'b0)
		  BH <= {1'b0,B[14:0]};
        else if (SHIFT == 1'b0)
            BH <= B[15:0];
        else
            BH <= {1'b0,B[30:16]};
    end

//-----------
// Multiplier
//----------
    always @(AH or BH)
    begin
        ABH[46:0] <= AH[30:0] * BH[15:0]; // 31bit * 16bit -> 47bit
    end

//---
// PM
//---
    always @(SHIFT or SIZE or A or B)
    begin
        if (SHIFT)
	       begin
			 P2 <= {1'b0, (A[31])? B[30:0]:31'h00000000};
			 P3 <= {1'b0, (B[31])? A[30:0]:31'h00000000};
		  end
	   else if(~SIZE)
	       begin
			 P2 <= {17'h00000, (A[15])? B[14:0]:15'h0000};
			 P3 <= {17'h00000, (B[15])? A[14:0]:15'h0000};
		  end
	   else
	       begin
			 P2 <= 32'h00000000;
			 P3 <= 32'h00000000;
		  end
    end

    always @(P2 or P3)
    begin
        P23 <= P2 + P3;
    end

    always @(ABH or SHIFT or SIZE or A or B)
    begin
        if (SIZE == 1'b0)
	       ABH2 <= {17'h00000,(A[15] & B[15]),ABH[29:15]};
        else if (SHIFT == 1'b0)
            ABH2 <= {1'b0, ABH[46:15]};
	   else
	       ABH2 <= {1'b0,(A[31] & B[31]),ABH[45:15]};
    end

    always @(P23 or SIGN)
    begin
        if (SIGN == 1'b0)
	       P23S <= {1'b0, P23};
	   else
	       P23S <= {1'b1,~P23};
    end

    always @(P23S or ABH or ABH2 or SIGN)
    begin
	   PM[47:15] <= ABH2[32:0] + P23S + SIGN;
	   PM[14: 0] <= ABH[14: 0];
    end

//---------
// Select C
//---------
    always @(PM or SHIFT or SIZE)
    begin
        if (SHIFT == 1'b0)
            if (~SIZE & PM[47])
                C <= {16'hffff, PM};
            else 
                C <= {16'h0000, PM};
        else
            C <= {PM, 16'h0000};
    end

//-------------------------------------
// 64bit ADDER with Satulating function
//-------------------------------------
//
// Essential of Saturate Operation [ MAC[64] + C[64] ]
//
//   +S     |             Left plane shows value of MAC.
//     \    |             "+S" is + side saturate value (ex.00007FFF).
//      \  <P>            "-S" is - side saturate value (ex.FFFF8000).
//  <P'> \  |             Addition of plus C rotates MAC value counterclockwise.
//        \ |             Addition of minus C rotates MAC value clockwise.                                                     
// 7F..    \|     00..
// -------------------    Region<M'> : MAC=80000000~FFFF7FFF
// 80..    /|     FF..    Region<M > : MAC=FFFF8000~FFFFFFFF
//        / |             Region<P > : MAC=00000000~00007FFF
//  <M'> /  |             Region<P'> : MAC=00008000~7FFFFFFF
//      /  <M>  
//     /    |             Note that initial MAC value may be in any region.
//   -S     |             And value C may also be 00000000~FFFFFFFF.
//                                            
// ===========================================
// Initial_MAC  Rotation(C)  MAC+C  Result_MAC
// ===========================================
//     P            +          P     OK      
//     P            +          P'    00007FFF
//     P            +          M'    00007FFF
//     P            +          M     00007FFF 
// -------------------------------------------
//     P'           +          P     00007FFF Impossible      
//     P'           +          P'    00007FFF
//     P'           +          M'    00007FFF
//     P'           +          M     00007FFF 
// -------------------------------------------
//     M'           +          P     OK      
//     M'           +          P'    00007FFF Imposible
//     M'           +          M'    FFFF8000
//     M'           +          M     OK       
// -------------------------------------------
//     M            +          P     OK      
//     M            +          P'    00007FFF
//     M            +          M'    00007FFF Impossible
//     M            +          M     OK       
// ===========================================
//     P            -          P     OK      
//     P            -          P'    FFFF8000 Impossible
//     P            -          M'    FFFF8000
//     P            -          M     OK 
// -------------------------------------------
//     P'           -          P     OK      
//     P'           -          P'    00007FFF
//     P'           -          M'    FFFF8000 Impossible
//     P'           -          M     OK 
// -------------------------------------------
//     M'           -          P     FFFF8000      
//     M'           -          P'    FFFF8000
//     M'           -          M'    FFFF8000
//     M'           -          M     FFFF8000 Impossible       
// -------------------------------------------
//     M            -          P     FFFF8000      
//     M            -          P'    FFFF8000
//     M            -          M'    FFFF8000
//     M            -          M     OK       
// ===========================================

// Again, Compactly...                               
// ===========================================
// Initial_MAC  Rotation(C)  MAC+C  Result_MAC
// ===========================================
//     P /M        +/-        P /M  OK      
//     P /M        +/-        P'/M' 00007FFF/FFFF8000
//     P /M        +/-        M'/P' 00007FFF/FFFF8000
//     P /M        +/-        M /P  00007FFF/FFFF8000
// -------------------------------------------
//     P'/M'       +/-        P /M  Impossible = Don't care      
//     P'/M'       +/-        P'/M' 00007FFF/FFFF8000
//     P'/M'       +/-        M'/P' 00007FFF/FFFF8000
//     P'/M'       +/-        M /P  00007FFF/FFFF8000
// -------------------------------------------
//     M'/P'       +/-        P /M  OK      
//     M'/P'       +/-        P'/M' Impossible = Don't care
//     M'/P'       +/-        M'/P' FFFF8000/00007FFF <--caution !
//     M'/P'       +/-        M /P  OK       
// -------------------------------------------
//     M /P        +/-        P /M  OK      
//     M /P        +/-        P'/M' 00007FFF/FFFF8000
//     M /P        +/-        M'/P' Impossible = Don't care
//     M /P        +/-        M /P  OK       
// ===========================================

// Again, Much Compactly...                                  
// ===========================================
// Initial_MAC  Rotation(C)  MAC+C  Result_MAC
// ===========================================
//     P /M        +/-        P /M  OK      
//     P /M        +/-        P'/M' 00007FFF/FFFF8000
//     P /M        +/-        - /+  00007FFF/FFFF8000
// -------------------------------------------
//     P'/M'       +/-        P /M  Impossible = Don't care      
//     P'/M'       +/-        P'/M' 00007FFF/FFFF8000
//     P'/M'       +/-        - /+  00007FFF/FFFF8000
// -------------------------------------------
//     M'/P'       +/-        P /M  OK 
//     - /+        +/-        M'/P' FFFF8000/00007FFF <--caution !
//     M'/P'       +/-        M /P  OK       
// -------------------------------------------
//     M /P        +/-        P /M  OK      
//     - /+        +/-        P'/M' 00007FFF/FFFF8000
//     M /P        +/-        M /P  OK       
// ===========================================

// Again, Much Compactly...                                  
// ===========================================
// Initial_MAC  Rotation(C)  MAC+C  Result_MAC
// ===========================================
//     + /-        +/-        P /M  OK      
//     + /-        +/-        P'/M' 00007FFF/FFFF8000
//     + /-        +/-        - /+  00007FFF/FFFF8000
// -------------------------------------------
//     - /+        +/-        P /M  OK 
//     - /+        +/-        M'/P' FFFF8000/00007FFF <--caution !
//     - /+        +/-        M /P  OK       
//     - /+        +/-        P'/M' 00007FFF/FFFF8000
// ===========================================

// Again, Much Compactly...                                  
// ===========================================
// Initial_MAC  Rotation(C)  MAC+C  Result_MAC
// ===========================================
//     * /*        +/-        P /M  OK      
//     * /*        +/-        P'/M' 00007FFF/FFFF8000
//     + /-        +/-        - /+  00007FFF/FFFF8000
//     - /+        +/-        M'/P' FFFF8000/00007FFF <--caution !
//     - /+        +/-        M /P  OK       
// ===========================================

    always @(C or MACH or MACL or ZH)
    begin
        ADDRESULT <= C + {((ZH == 1'b0) ? MACH : 32'h00000000), MACL};
    end

    reg [1:0] RESULT_REGION48; //00:P, 01:P', 10:M, 11:M'
    reg       RESULT_REGION32; //0:P, 1:M, No P'/M' region in case of 32bit saturation.
    always @(ADDRESULT)
    begin
        RESULT_REGION48[1] <=  ADDRESULT[63];
        RESULT_REGION32    <=  ADDRESULT[31];
        if (ADDRESULT[63] == 1'b0)
          //RESULT_REGION48[0] <= (ADDRESULT[63:47] >= 17'h00001);
		  RESULT_REGION48[0] <= (ADDRESULT[63:47] != 17'h00000);
        else
          //RESULT_REGION48[0] <= (ADDRESULT[63:47] <= 17'hFFFFE);
		  RESULT_REGION48[0] <= (ADDRESULT[63:47] != 17'hFFFFF);
    end

    always @(ADDRESULT or C or MACH or MACL or ADD or RESULT_REGION48 or RESULT_REGION32)
    begin
        case(ADD)
            2'b00   : begin // ADD
                          ADDRESULT2 <= ADDRESULT;
                          SAT <= 1'b0;
                      end
            2'b10   : begin // ADDS48
                          if (~C[63]) // + rotation
                              case ({MACH[31], RESULT_REGION48})
                                  3'b000 : {ADDRESULT2,SAT} <= {ADDRESULT,1'b0};            //+,P
                                  3'b001 : {ADDRESULT2,SAT} <= {64'h00007FFFFFFFFFFF,1'b1}; //+,P'
                                  3'b010 : {ADDRESULT2,SAT} <= {64'h00007FFFFFFFFFFF,1'b1}; //+,M
                                  3'b011 : {ADDRESULT2,SAT} <= {64'h00007FFFFFFFFFFF,1'b1}; //+,M'
                                  3'b100 : {ADDRESULT2,SAT} <= {ADDRESULT,1'b0};            //-,P
                                  3'b101 : {ADDRESULT2,SAT} <= {64'h00007FFFFFFFFFFF,1'b1}; //-,P'
                                  3'b110 : {ADDRESULT2,SAT} <= {ADDRESULT,1'b0};            //-,M
                                  3'b111 : {ADDRESULT2,SAT} <= {64'hFFFF800000000000,1'b1}; //-,M'
                                  default: {ADDRESULT2,SAT} <= {64'hxxxxxxxxxxxxxxxx,1'bx};
                              endcase
                          else        // - rotation
                              case ({MACH[31], RESULT_REGION48})
                                  3'b000 : {ADDRESULT2,SAT} <= {ADDRESULT,1'b0};            //+,P
                                  3'b001 : {ADDRESULT2,SAT} <= {64'h00007FFFFFFFFFFF,1'b1}; //+,P'
                                  3'b010 : {ADDRESULT2,SAT} <= {ADDRESULT,1'b0};            //+,M
                                  3'b011 : {ADDRESULT2,SAT} <= {64'hFFFF800000000000,1'b1}; //+,M'
                                  3'b100 : {ADDRESULT2,SAT} <= {64'hFFFF800000000000,1'b1}; //-,P
                                  3'b101 : {ADDRESULT2,SAT} <= {64'hFFFF800000000000,1'b1}; //-,P'
                                  3'b110 : {ADDRESULT2,SAT} <= {ADDRESULT,1'b0};            //-,M
                                  3'b111 : {ADDRESULT2,SAT} <= {64'hFFFF800000000000,1'b1}; //-,M'
                                  default: {ADDRESULT2,SAT} <= {64'hxxxxxxxxxxxxxxxx,1'bx};
                              endcase
                      end
            2'b11   : begin // ADDS32
                          if (~C[31]) // + rotation
                              case ({MACL[31], RESULT_REGION32})
                                  2'b00  : {ADDRESULT2,SAT} <= {ADDRESULT,1'b0};            //+,P
                                  2'b01  : {ADDRESULT2,SAT} <= {64'h000000007FFFFFFF,1'b1}; //+,M
                                  2'b10  : {ADDRESULT2,SAT} <= {ADDRESULT,1'b0};            //-,P
                                  2'b11  : {ADDRESULT2,SAT} <= {ADDRESULT,1'b0};            //-,M
                                  default: {ADDRESULT2,SAT} <= {64'hxxxxxxxxxxxxxxxx,1'bx};
                              endcase
                          else        // - rotation
                              case ({MACL[31], RESULT_REGION32})
                                  2'b00  : {ADDRESULT2,SAT} <= {ADDRESULT,1'b0};            //+,P
                                  2'b01  : {ADDRESULT2,SAT} <= {ADDRESULT,1'b0};            //+,M
                                  2'b10  : {ADDRESULT2,SAT} <= {64'hFFFFFFFF80000000,1'b1}; //-,P
                                  2'b11  : {ADDRESULT2,SAT} <= {ADDRESULT,1'b0};            //-,M
                                  default: {ADDRESULT2,SAT} <= {64'hxxxxxxxxxxxxxxxx,1'bx};
                              endcase
                      end
            default : begin 
                          ADDRESULT2 <= 64'hxxxxxxxxxxxxxxxx;
                          SAT <= 1'b0;
                      end
        endcase
    end

//-----
// MACH
//-----
// Clear condition of MACH: following command do not clear MACH
                          // MAC.L    1 0001111 8F
                          // MAC.W    1 1001111 CF
                          // MUL.L    1 0000111 87
                          // MULS.W   1 0101111 AF
                          // MULU.W   1 0101110 AE
// Should do saturating operation 
    always @(posedge CLK)
    begin
        if (SLOT & WRMACH)
            MACH <= MACIN1;
        else if (SLOT & MULCOM2[7] 
                 & (MULCOM2[5:0] != 6'b001111) 
                 & (MULCOM2[6:0] != 7'b0000111)
                 & (MULCOM2[6:0] != 7'b0101111) 
                 & (MULCOM2[6:0] != 7'b0101110)
           )
            begin
                MACH <= 32'h00000000;
            end
        else if ((STATE == `MACWS) && (SAT == 1'b1))
            begin
                MACH <= MACH | 32'h00000001;
            end
        else if (LATMACH == 1'b1)
            begin
                MACH <= ADDRESULT2[63:32];
            end
    end

//-----
// MACL
//-----
// Clear condition of MACL: following command do not clear MACL
                          // MAC.L    1 0001111 8F
                          // MAC.W    1 1001111 CF
    always @(posedge CLK)
    begin
        if (SLOT & WRMACL)
            MACL <= MACIN2;
        else if (SLOT & MULCOM2[7] & (MULCOM2[5:0] != 6'b001111))
            begin
                MACL <= 32'h00000000;
            end
        else if (LATMACL == 1'b1)
            begin
                MACL <= ADDRESULT2[31:0];
            end
    end

//======================================================
  endmodule
//======================================================