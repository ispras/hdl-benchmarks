//======================================================
// Aquarius Project
//    SuperH-2 ISA Compatible RISC CPU
//------------------------------------------------------
// Module      : Top Layer (A Simple MCU)
//------------------------------------------------------
// File        : top.v
// Library     : none
// Description : Top Layer for Aquarius.
//               It is a simple MCU Chip.
// Simulator   : Icarus Verilog (Cygwin)
// Synthesizer : Xilinx XST (Windows XP)
// Author      : Thorn Aitch
//------------------------------------------------------
// Revision Number : 1
// Date of Change  : 15th April 2002
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

//******************************
// Top Module
//******************************
module oc_aquarius (
      CLK_SRC, RST_n,
      LCDRS, LCDRW, LCDE,
	  LCDDBO, LCDDBI,
	  KEYYO, KEYXI,
      RXD, TXD, CTS, RTS
    );

    input  CLK_SRC; // non stop clock
    input  RST_n;
    output LCDRS;
    output LCDRW;
    output LCDE;
    output [7:0] LCDDBO;
    input  [7:0] LCDDBI;
    output [4:0] KEYYO;
    input  [4:0] KEYXI;
    input  RXD;
    output TXD;
    input  CTS;
    output RTS;

//------------------
// Internal Signals
//------------------
    wire   CLK;           // internal system clock, which stops during sleep
    reg    RST;           // 2nd sync reset
    reg    RST1;          // 1st sync reset 
    wire   CYC;           // external bus cycle to be kept
    wire   STB;           // external bus strobe
    reg    ACK;           // external device acknowledge
    wire   [31:0] ADR;    // external address
    reg    [31:0] DATI;   // external data read bus
    wire   [31:0] DATO;   // external data write bus
    wire   WE;            // external write/read
    wire   [3:0] SEL;     // external data valid position
    reg    IF_WIDTH;      // IF_WIDTH : external fetch space width

    reg    CEMEM, CEPIO, CEUART, CESYS;  // chip enable of each device
    wire   [31:0] DATMEM;  // direct memory output
    wire   [31:0] DATPIO;  // direct pio output
    wire   [31:0] DATUART; // direct uart output 
    wire   [31:0] DATSYS ; // direct sys output
    wire   [31:0] PI;  // port input
    wire   [31:0] PO;  // port output

    wire   RXD, TXD, CTS, RTS; //uart signals

    wire   [2:0] EVENT_REQ;   // Hardware Exception Event Request
    wire   EVENT_ACK;         // Hardware Exception Event Acknowledge
    wire   [11:0] EVENT_INFO; // Hardware Exception Event Information

    wire   SLP;       // SLEEP output
 
    assign LCDRS     = PO[8];
    assign LCDRW     = PO[9];
    assign LCDE      = PO[10];
    assign LCDDBO    = PO[7:0];
    assign PI[ 7: 0] = LCDDBI;
    assign KEYYO     = PO[20:16];
    assign PI[20:16] = KEYXI; 
    assign PI[31:21] = 11'b00000000000;
    assign PI[15: 8] =  8'b00000000;

//********
// Modules
//********
    cpu CPU(
        // system signal
        .CLK(CLK), .RST(RST),
        // WISHBONE external bus signal
        .CYC_O(CYC), .STB_O(STB), .ACK_I(ACK),
        .ADR_O(ADR), .DAT_I(DATI), .DAT_O(DATO),
        .WE_O(WE), .SEL_O(SEL),
        .TAG0_I(IF_WIDTH),
        // Exception
        .EVENT_REQ_I(EVENT_REQ),
        .EVENT_ACK_O(EVENT_ACK), 
        .EVENT_INFO_I(EVENT_INFO),
        //SLEEP
        .SLP_O(SLP)
    );

    memory MEMORY(
        .CLK(CLK), .CE(CEMEM), .WE(WE), .SEL(SEL),
        .ADR(ADR[13:0]), .DATI(DATO), .DATO(DATMEM)
    );

    pio PIO(
        .CLK(CLK), .RST(RST), 
        .CE(CEPIO), .WE(WE), .SEL(SEL), 
        .DATI(DATO), .DATO(DATPIO),
        .PI(PI), .PO(PO)
    );

    uart UART(
        .CLK(CLK), .RST(RST), 
        .CE(CEUART), .WE(WE), .SEL(SEL), 
        .DATI(DATO), .DATO(DATUART),
        .RXD(RXD), .TXD(TXD), .CTS(CTS), .RTS(RTS)
    );
    
    sys SYS(
        .CLK_SRC(CLK_SRC), .CLK(CLK), .SLP(SLP), .WAKEUP(~KEYXI[4]), .RST(RST), 
        .CE(CESYS), .WE(WE), .SEL(SEL), .ACK(ACK), 
        .DATI(DATO), .DATO(DATSYS),
        .EVENT_REQ(EVENT_REQ),
        .EVENT_ACK(EVENT_ACK),
        .EVENT_INFO(EVENT_INFO), 
        .STB(STB), .ADR(ADR)
    );

//************
// Address MAP
//************
// address           size wait width device
// 00000000-0000FFFF 64K  0    32    MEMORY (shadow every 16KB)
// 00010000-0001FFFF 64K  3    32    MEMORY (shadow every 16KB)
// 00020000-0002FFFF 64K  0    16    MEMORY (shadow every 16KB)
// 00030000-0003FFFF 64K  3    16    MEMORY (shadow every 16KB)
// 00040000-ABCCFFFF ................(shadow MEMORY)
// ABCD0000-ABCD00FF 256  3    32    PIO (shadow every 4B)
// ABCD0100-ABCD01FF 256  3    32    UART(shadow every 4B)
// ABCD0200-ABCD02FF 256  3    32    SYS (shadow every 8B)
// ABCD0300-FFFBFFFF ................(shadow MEMORY)
// FFFC0000-FFFCFFFF 64K  0    32    MEMORY (shadow every 16KB)
// FFFD0000-FFFDFFFF 64K  3    32    MEMORY (shadow every 16KB)
// FFFE0000-FFFEFFFF 64K  0    16    MEMORY (shadow every 16KB)
// FFFF0000-FFFFFFFF 64K  3    16    MEMORY (shadow every 16KB)
//
// <MEMORY>
// ****0000-****1FFF  8K  ROM
// ****2000-****3FFF  8K  RAM
// ****4000-****5FFF  8K  ROM (shadow)
// ****6000-****7FFF  8K  RAM (shadow)
// ****8000-****9FFF  8K  ROM (shadow)
// ****A000-****BFFF  8K  RAM (shadow)
// ****C000-****DFFF  8K  ROM (shadow)
// ****E000-****FFFF  8K  RAM (shadow)

    always @(posedge CLK)
    begin
        RST1 <= ~RST_n;
        RST  <= RST1;
    end

    always @(DATMEM or DATPIO or DATUART or DATSYS) begin
       DATI <= DATMEM | DATPIO | DATUART | DATSYS; // read data gathering 
    end

    always @(STB or ADR) 
    begin
        if (STB == 1'b0)
            {CEMEM,CEPIO,CEUART,CESYS} <= 4'b0000;
        else if (ADR[31:8] == 24'hABCD00)
            {CEMEM,CEPIO,CEUART,CESYS} <= 4'b0100;
        else if (ADR[31:8] == 24'hABCD01)
            {CEMEM,CEPIO,CEUART,CESYS} <= 4'b0010;
        else if (ADR[31:8] == 24'hABCD02)
            {CEMEM,CEPIO,CEUART,CESYS} <= 4'b0001;
        else
            {CEMEM,CEPIO,CEUART,CESYS} <= 4'b1000;
    end

//---------------------
// Control Access Cycle
//---------------------
    reg ACK0; // 0 wait device
    reg ACK3; // 3 wait device

    always @(ACK0 or ACK3) begin
        ACK <= ACK0 | ACK3;
    end

    always @(STB or ADR) begin
        if ((STB == 1'b1) && (ADR[16] == 1'b0))
            ACK0 <= 1'b1;
        else
            ACK0 <= 1'b0;
    end

    // S0: ACK3=0
    // S1: ACK3=0
    // S2: ACK3=0
    // S3: ACK3=1
    //
    // S0 -> S0
    // S0 -> S1 if ADR = **8 ~ **F, then wait
    // S2 -> S3
    // S3 -> S0

    reg [1:0] ACK3_STATE;
    reg [1:0] ACK3_NEXT_STATE;
    always @(posedge CLK or posedge RST) begin
        if (RST == 1'b1)
            begin
                ACK3_STATE <= 2'b00;
            end
        else 
            begin
                ACK3_STATE <= ACK3_NEXT_STATE;
            end
    end
    always @(ACK3_STATE or STB or ADR) begin
        case (ACK3_STATE)
           2'b00 : if ((STB & ADR[16])  == 1'b1)
                       ACK3_NEXT_STATE <= 2'b01;
                   else
                       ACK3_NEXT_STATE <= 2'b00;
           2'b01 : ACK3_NEXT_STATE <= 2'b10;
           2'b10 : ACK3_NEXT_STATE <= 2'b11;
           2'b11 : ACK3_NEXT_STATE <= 2'b00;
           default : ACK3_NEXT_STATE <= 2'bxx;
        endcase
    end
    always @(ACK3_STATE)
        ACK3 <= ACK3_STATE[1] & ACK3_STATE[0];

//-------------------
// Control Data Width
//-------------------
    always @(ADR) begin
        if (ADR[17] == 1'b0)
            IF_WIDTH <= 1'b1;
        else
            IF_WIDTH <= 1'b0;
    end

//======================================================
  endmodule
//======================================================