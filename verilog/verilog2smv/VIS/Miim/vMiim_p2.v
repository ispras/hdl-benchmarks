/*
*
*	Taken from VIS Benchmarks <ftp://vlsi.colorado.edu/pub/vis/vis-verilog-models-1.3.tar.gz>
*	Modified by Ahmed Irfan <irfan@fbk.eu>
*
*/
// Adapted to vl2mv and vis by Fabio Somenzi <Fabio@Colorado.EDU>

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  MII Management Module                                      ////
////                                                             ////
////  Author: Igor Mohor                                         ////
////          igorM@opencores.org                                ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/ethmac/    ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2001 Igor Mohor                               ////
////                    IgorM@opencores.org                      ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

module miim
(
  Clk,
  Reset,
  Divider,
  NoPre,
  ScanIncr,
  CtrlData,
  Rgad,
  Fiad,
  WCtrlData,
  RStat,
  ScanStat,
  Mdi,
  Mdo,
  MdoEn,
  Mdc,
  Busy,
  Prsd,
  ScanPHYAddr,
  ScanPHYAddrValid,
  LinkOK,
  Nvalid
);


// ------------------------------------------------------------------------
// --- Input/ Output Declarations

input         Clk;                // Host Clock
input         Reset;              // General Reset
input   [7:0] Divider;            // Divider for the host clock
input  [15:0] CtrlData;           // Control Data (to be written to the PHY reg.)
input   [4:0] Rgad;               // Register Address (within the PHY)
input   [4:0] Fiad;               // PHY Address
input         NoPre;              // No Preamble (no 32-bit preamble)
input         ScanIncr;           // Scan Increment (PHY address is incremented after each scan)
input         WCtrlData;          // Write Control Data operation
input         RStat;              // Read Status operation
input         ScanStat;           // Scan Status operation
input         Mdi;                // MII Management Data In

output        Mdc;                // MII Management Data Clock
output        Mdo;                // MII Management Data Output
output        MdoEn;              // MII Management Data Output Enable
output        Busy;               // Busy Signal
output        LinkOK;             // Link Integrity Signal
output        Nvalid;             // Invalid Status (qualifier for the valid scan result)

output [15:0] Prsd;               // Read Status Data (data read from the PHY)
output  [4:0] ScanPHYAddr;        // Scan PHY Address (Scan is performed to the PHY with the ScanPHYAddr[4:0] address)
output        ScanPHYAddrValid;   // Qualifier when the ScanPHYAddr[4:0] address is valid


reg           Nvalid;
reg           EndBusy_d;          // Pre-end Busy signal
reg           EndBusy;            // End Busy signal (stops the operation in progress)

reg           WCtrlData_q1;       // Write Control Data operation delayed 1 Clk cycle
reg           WCtrlData_q2;       // Write Control Data operation delayed 2 Clk cycles
reg           WCtrlData_q3;       // Write Control Data operation delayed 3 Clk cycles
reg           WCtrlDataStart;     // Start Write Control Data Command (positive edge detected)
reg           WCtrlDataStart_q1;  // Start Write Control Data Command delayed 1 Mdc cycle
reg           WCtrlDataStart_q2;  // Start Write Control Data Command delayed 2 Mdc cycles

reg           RStat_q1;           // Read Status operation delayed 1 Clk cycle
reg           RStat_q2;           // Read Status operation delayed 2 Clk cycles
reg           RStat_q3;           // Read Status operation delayed 3 Clk cycles
reg           RStatStart;         // Start Read Status Command (positive edge detected)
reg           RStatStart_q1;      // Start Read Status Command delayed 1 Mdc cycle
reg           RStatStart_q2;      // Start Read Status Command delayed 2 Mdc cycles

reg           ScanStat_q1;        // Scan Status operation delayed 1 cycle
reg           ScanStat_q2;        // Scan Status operation delayed 2 cycles
reg           SyncStatMdcEn;      // Scan Status operation delayed at least cycles and synchronized to MdcEn

wire          WriteDataOp;        // Write Data Operation (positive edge detected)
wire          ReadStatusOp;       // Read Status Operation (positive edge detected)
wire          ScanStatusOp;       // Scan Status Operation (positive edge detected)
wire          StartOp;            // Start Operation (start of any of the preceding operations)
wire          EndOp;              // End of Operation

reg           InProgress;         // Operation in progress
reg           InProgress_q1;      // Operation in progress delayed 1 Mdc cycle
reg           InProgress_q2;      // Operation in progress delayed 2 Mdc cycles
reg           InProgress_q3;      // Operation in progress delayed 3 Mdc cycles

reg           WriteOp;            // Write Operation Latch (When asserted, write operation is in progress)
reg     [5:0] BitCounter;         // Bit Counter

reg           StatusSampledEnd;   // Status Sampled End (used for generation of the StatusSampled signal)
reg           ScanPHYAddrValid;   // Qualifier when the ScanPHYAddr[4:0] address is valid

wire          StatusSampled;
wire          MdcFrame;           // Frame window for limiting the Mdc
wire    [3:0] ByteSelect;         // Byte Select defines which byte (preamble, data, operation, etc.) is loaded and shifted through the shift register.
wire          MdcEn;              // MII Management Data Clock Enable signal is asserted for one Clk period before Mdc rises.
wire          ShiftedBit;         // This bit is output of the shift register and is connected to the Mdo signal


wire          LatchByte1_d2;
wire          LatchByte0_d2;
reg           LatchByte1_d;
reg           LatchByte0_d;
reg     [1:0] LatchByte;          // Latch Byte selects which part of Read Status Data is updated from the shift register



initial begin
    Nvalid = 0;
    EndBusy_d = 0;
    EndBusy = 0;
    WCtrlData_q1 = 0;
    WCtrlData_q2 = 0;
    WCtrlData_q3 = 0;
    WCtrlDataStart = 0;
    WCtrlDataStart_q1 = 0;
    WCtrlDataStart_q2 = 0;
    RStat_q1 = 0;
    RStat_q2 = 0;
    RStat_q3 = 0;
    RStatStart = 0;
    RStatStart_q1 = 0;
    RStatStart_q2 = 0;
    ScanStat_q1 = 0;
    ScanStat_q2 = 0;
    SyncStatMdcEn = 0;
    InProgress = 0;
    InProgress_q1 = 0;
    InProgress_q2 = 0;
    InProgress_q3 = 0;
    WriteOp = 0;
    BitCounter = 0;
    StatusSampledEnd = 0;
    ScanPHYAddrValid = 0;
    LatchByte1_d = 0;
    LatchByte0_d = 0;
    LatchByte = 0;
end



// --- LCTLD, RSTAT & SCAN Synchronization, START & BUSY Generation

// The rising edge of WCtrlData and RStat are detected and along with ScanStat
// synchronized to mdcg.  Start and Busy are generated.

// Generation of the EndBusy signal. It is used for ending the MII Management operation.
always @ (posedge Clk)
begin
  if(Reset)
    begin
      EndBusy_d <= 1'b0;
      EndBusy <= 1'b0;
    end
  else
    begin
      EndBusy_d <= ~InProgress_q2 & InProgress_q3;
      EndBusy   <= EndBusy_d;
    end
end


// Generation of the delayed signals used for positive edge triggering.
always @ (posedge Clk)
begin
  if(Reset)
    begin
      WCtrlData_q1 <= 1'b0;
      WCtrlData_q2 <= 1'b0;
      WCtrlData_q3 <= 1'b0;
      
      RStat_q1 <= 1'b0;
      RStat_q2 <= 1'b0;
      RStat_q3 <= 1'b0;

      ScanStat_q1   <= 1'b0;
      ScanStat_q2   <= 1'b0;
      SyncStatMdcEn <= 1'b0;
    end
  else
    begin
      WCtrlData_q1 <= WCtrlData;
      WCtrlData_q2 <= WCtrlData_q1;
      WCtrlData_q3 <= WCtrlData_q2;

      RStat_q1 <= RStat;
      RStat_q2 <= RStat_q1;
      RStat_q3 <= RStat_q2;

      ScanStat_q1 <= ScanStat;
      ScanStat_q2 <= ScanStat_q1;
      if(MdcEn)
        SyncStatMdcEn <= ScanStat_q2;
    end
end


// Generation of the Start Commands (Write Control Data or Read Status)
// Generation of the Nvalid signal (indicates when the status is invalid)
always @ (posedge Clk)
begin
  if(Reset)
    begin
      WCtrlDataStart <= 1'b0;
      RStatStart <= 1'b0;
      Nvalid <= 1'b0;
    end
  else
    begin
      if(EndBusy)
        begin
          WCtrlDataStart <= 1'b0;
          RStatStart <= 1'b0;
          Nvalid <= 1'b0;
        end
      else
        begin
          if(WCtrlData_q2 & ~WCtrlData_q3)
            WCtrlDataStart <= 1'b1;
          if(RStat_q2 & ~RStat_q3)
            RStatStart <= 1'b1;
          if(ScanStat_q2  & ~SyncStatMdcEn)
            Nvalid <= 1'b1;
        end
    end
end 


// Signals used for the generation of the Operation signals (positive edge)
always @ (posedge Clk)
begin
  if(Reset)
    begin
      WCtrlDataStart_q1 <= 1'b0;
      WCtrlDataStart_q2 <= 1'b0;

      RStatStart_q1 <= 1'b0;
      RStatStart_q2 <= 1'b0;

      LatchByte[1:0] <= 1'b0;
      LatchByte0_d <= 1'b0;
      LatchByte1_d <= 1'b0;

      InProgress_q1 <= 1'b0;
      InProgress_q2 <= 1'b0;
      InProgress_q3 <= 1'b0;
    end
  else
    begin
      if(MdcEn)
        begin
          WCtrlDataStart_q1 <= WCtrlDataStart;
          WCtrlDataStart_q2 <= WCtrlDataStart_q1;

          RStatStart_q1 <= RStatStart;
          RStatStart_q2 <= RStatStart_q1;

          LatchByte[0] <= LatchByte0_d;
          LatchByte[1] <= LatchByte1_d;

          LatchByte0_d <= LatchByte0_d2;
          LatchByte1_d <= LatchByte1_d2;

          InProgress_q1 <= InProgress;
          InProgress_q2 <= InProgress_q1;
          InProgress_q3 <= InProgress_q2;
        end
    end
end 


// Generation of the Operation signals
assign WriteDataOp  = WCtrlDataStart_q1 & ~WCtrlDataStart_q2;    
assign ReadStatusOp = RStatStart_q1     & ~RStatStart_q2;
assign ScanStatusOp = SyncStatMdcEn     & ~InProgress & ~InProgress_q1 & ~InProgress_q2; // igor !!! Zakaj je tu onemogoceno za 3 cikle?
assign StartOp      = WriteDataOp | ReadStatusOp | ScanStatusOp;

// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Busy :: MII Management Busy
assign Busy = WCtrlDataStart | RStatStart | SyncStatMdcEn | EndBusy | InProgress | InProgress_q3;
// igor !!! EndBusy podira (WCtrlDataStart, RStatStart), zato nima smisla, da je tu. Mogoce je tu zaradi SyncStatMdcEn.
// InProgress_q3 nima smisla ? je tu zato, ker se EndBusy podira na Clk, InProgress_q3 pa ima za pogoj MdcEn.
// Poskusi simualcijo in vrzi InProgress_q3 ven



// Generation of the InProgress signal (indicates when an operation is in progress)
// Generation of the WriteOp signal (indicates when a write is in progress)
always @ (posedge Clk)
begin
  if(Reset)
    begin
      InProgress <= 1'b0;
      WriteOp <= 1'b0;
    end
  else
    begin
      if(MdcEn)
        begin
          if(StartOp)
            begin
              if(~InProgress)
                WriteOp <= WriteDataOp;
              InProgress <= 1'b1;
            end
          else
            begin
              if(EndOp)
                begin
                  InProgress <= 1'b0;
                  WriteOp <= 1'b0;
                end
            end
        end
    end
end



// Bit Counter counts from 0 to 63 (from 32 to 63 when NoPre is asserted)
always @ (posedge Clk)
begin
  if(Reset)
    BitCounter[5:0] <= 6'h0;
  else
    begin
      if(MdcEn)
        begin
          if(~InProgress_q1)
            BitCounter[5:0] <= 6'h0;
          else
            begin
              if(NoPre & ( BitCounter == 6'h0 ))
                BitCounter[5:0] <= 6'h21;
              else
                BitCounter[5:0] <= BitCounter[5:0] + 1'b1;
            end
        end
    end
end


// Operation ends when the Bit Counter reaches 63
assign EndOp = &BitCounter[5:0];


// Byte Select defines which byte (preamble, data, operation, etc.) is loaded and shifted through the shift register.
assign ByteSelect[0] = InProgress & ((NoPre & (BitCounter == 6'h0)) | (~NoPre & (BitCounter == 6'h20)));
assign ByteSelect[1] = InProgress & (BitCounter == 6'h28);
assign ByteSelect[2] = InProgress & WriteOp & (BitCounter == 6'h30);
assign ByteSelect[3] = InProgress & WriteOp & (BitCounter == 6'h38);

// Latch Byte selects which part of Read Status Data is updated from the shift register
assign LatchByte1_d2 = InProgress & ~WriteOp & BitCounter == 6'h37;
assign LatchByte0_d2 = InProgress & ~WriteOp & BitCounter == 6'h3F;


// StatusSampledEnd
always @ (posedge Clk)
begin
  if(Reset)
    StatusSampledEnd <= 1'b0;
  else
    StatusSampledEnd <= LatchByte[0];
end     


// StatusSampled is used for ScanPHYAddrValid generation
assign StatusSampled = ~StatusSampledEnd & LatchByte[0];


// Generation of the ScanPHYAddrValid
always @ (posedge Clk)
begin
  if(Reset)
    ScanPHYAddrValid <= 1'b0;
  else
    begin
      if(StatusSampled)
        ScanPHYAddrValid <= 1'b1;
      else
        ScanPHYAddrValid <= 1'b0;
    end
end


// Connecting the Clock Generator Module
ClockGen ClkGen(.Clk(Clk), .Reset(Reset), .Divider(Divider[7:0]), .MdoEn(MdoEn), .MdcEn(MdcEn), .Mdc(Mdc), 
                .MdcFrame(MdcFrame));

// Connecting the Shift Register Module
ShiftReg ShftRg(.Clk(Clk), .Reset(Reset), .MdcEn(MdcEn), .Mdi(Mdi), .Fiad(Fiad), .Rgad(Rgad), .CtrlData(CtrlData), 
                .WriteOp(WriteOp), .ScanIncr(ScanIncr), .SyncStatMdcEn(SyncStatMdcEn), .ByteSelect(ByteSelect), 
                .LatchByte(LatchByte), .ShiftedBit(ShiftedBit), .ScanPHYAddr(ScanPHYAddr), .Prsd(Prsd), .LinkOK(LinkOK)
               );

// Connecting the Output Control Module
OutputControl OutCtrl(.Clk(Clk), .Reset(Reset), .MdcEn(MdcEn), .InProgress(InProgress), .ShiftedBit(ShiftedBit), 
                      .BitCounter(BitCounter), .WriteOp(WriteOp), .NoPre(NoPre), .Mdo(Mdo), .MdoEn(MdoEn), 
                      .MdcFrame(MdcFrame)
                     );

//invariant property: MdoEn=1 -> Busy=1;
//invariant property: Busy=1 -> MdoEn=1;
	assert property (	!Busy || MdoEn	);
endmodule


/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Clock Generator                                            ////
////  Generates MII Management Data Clock from the Host Clock    ////
////                                                             ////
////  Author: Igor Mohor                                         ////
////          igorM@opencores.org                                ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/ethmac/    ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2001 Igor Mohor                               ////
////                    IgorM@opencores.org                      ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

module ClockGen(Clk, Reset, Divider, MdoEn, MdcEn, Mdc, MdcFrame);

input       Clk;              // Input clock (Host clock)
input       Reset;            // Reset signal
input [7:0] Divider;          // Divider (input clock will be divided by the Divider[7:0])
input       MdoEn;            // MII Management Data Output Enable
input       MdcFrame;         // Frame window for limiting the Mdc

output      Mdc;              // Output clock
output      MdcEn;            // Enable signal is asserted for one Clk period before Mdc rises.

reg         Mdc;
reg   [7:0] Counter;

wire        CountEq0;
wire  [7:0] CounterPreset;
wire  [7:0] TempDivider;


initial begin
    Mdc = 0;
    Counter = 0;
end

assign TempDivider[7:0]   = (Divider[7:0]<2)? 8'h02 : Divider[7:0]; // If smaller than 2
assign CounterPreset[7:0] = {1'b0,TempDivider[7:1]} -1;               // We are counting half of period


// Counter counts half period
always @ (posedge Clk)
begin
  if(Reset)
    Counter[7:0] <= 8'h1;
  else
    begin
      if(CountEq0)
        begin
          Counter[7:0] <= CounterPreset[7:0];
        end
      else
        Counter[7:0] <= Counter - 8'h1;
    end
end


// Mdc is asserted every other half period
always @ (posedge Clk)
begin
  if(Reset)
    Mdc <= 1'b0;
  else
    begin
      if(CountEq0 & MdcFrame)
        Mdc <= ~Mdc;
    end
end


assign CountEq0 = Counter == 8'h0;
assign MdcEn = CountEq0 & ~Mdc;


endmodule


/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Output Control Block                                       ////
////  Output Control for the MII Management Data Signals         ////
////  (Mdc, Mdo, MdoEn)                                          ////
////                                                             ////
////  Author: Igor Mohor                                         ////
////          igorM@opencores.org                                ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/ethmac/    ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2001 Igor Mohor                               ////
////                    IgorM@opencores.org                      ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

module OutputControl(Clk, Reset, InProgress, ShiftedBit, BitCounter, WriteOp, NoPre, MdcEn, Mdo, MdoEn, MdcFrame);

input         Clk;                // Host Clock
input         Reset;              // General Reset
input         WriteOp;            // Write Operation Latch (When asserted, write operation is in progress)
input         NoPre;              // No Preamble (no 32-bit preamble)
input         InProgress;         // Operation in progress
input         ShiftedBit;         // This bit is output of the shift register and is connected to the Mdo signal
input   [5:0] BitCounter;         // Bit Counter
input         MdcEn;              // MII Management Data Clock Enable signal is asserted for one Clk period before Mdc rises.

output        Mdo;                // MII Management Data Output
output        MdoEn;              // MII Management Data Output Enable
output        MdcFrame;           // Frame window for limiting the Mdc

wire          SerialEn;
reg           SerialEn_q;

reg           MdoEn_d2;
reg           MdoEn_d;
reg           MdoEn;

reg           Mdo_d;
reg           Mdo;                // MII Management Data Output

reg           MdcFrame_d2;
reg           MdcFrame_d1;
reg           MdcFrame;


initial begin
    SerialEn_q = 0;
    MdoEn_d2 = 0;
    MdoEn_d = 0;
    MdoEn = 0;
    Mdo_d = 0;
    Mdo = 0;
    MdcFrame_d2 = 0;
    MdcFrame_d1 = 0;
    MdcFrame = 0;
end

// Generation of the Serial Enable signal (enables the serialization of the data)
assign SerialEn =  WriteOp & InProgress & ( BitCounter[5] | ( ( BitCounter == 0 ) & NoPre ) )
                | ~WriteOp & InProgress & (( BitCounter[5] & ~BitCounter[4] & ~&BitCounter[3:1] ) | ( ( BitCounter == 0 ) & NoPre ));


// Generation of the delayed SerialEn signal
// Generation of the pre-MdoEn signal (MdoEn_d2)
always @ (posedge Clk)
begin
  if(Reset)
    begin
      SerialEn_q <= 1'b0;
      MdoEn_d2 <= 1'b0;
      MdcFrame_d2 <= 1'b0;
    end
  else
    begin
      if(MdcEn)
        begin
          SerialEn_q <= SerialEn;
          MdoEn_d2 <= SerialEn | InProgress & ~BitCounter[5];
          MdcFrame_d2 <= InProgress;
        end
    end
end 


// Generation of the MdoEn signal
always @ (posedge Clk)
begin
  if(Reset)
    begin
      MdoEn_d <= 1'b0;
      MdoEn <= 1'b0;
      MdcFrame_d1 <= 1'b0;
      MdcFrame <= 1'b0;
    end
  else
    begin
      MdoEn_d <= MdoEn_d2;
      MdoEn <= MdoEn_d;
      MdcFrame_d1 <= MdcFrame_d2;
      MdcFrame <= MdcFrame_d1;
    end
end


// Generation of the Mdo signal.
always @ (posedge Clk)
begin
  if(Reset)
    begin
      Mdo_d <= 1'b0;
      Mdo <= 1'b0;
    end
  else
    begin
      Mdo_d <= ShiftedBit | ~SerialEn_q;
      Mdo <= Mdo_d;
    end
end


endmodule


/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Shift Register                                             ////
////                                                             ////
////  Author: Igor Mohor                                         ////
////          igorM@opencores.org                                ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/ethmac/    ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2001 Igor Mohor                               ////
////                    IgorM@opencores.org                      ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

module ShiftReg(Clk, Reset, MdcEn, Mdi, Fiad, Rgad, CtrlData, WriteOp, ScanIncr, SyncStatMdcEn, ByteSelect, 
                LatchByte, ShiftedBit, ScanPHYAddr, Prsd, LinkOK);

input       Clk;              // Input clock (Host clock)
input       Reset;            // Reset signal
input       MdcEn;            // Enable signal is asserted for one Clk period before Mdc rises.
input       Mdi;              // MII input data
input [4:0] Fiad;             // PHY address
input [4:0] Rgad;             // Register address (within the selected PHY)
input [15:0]CtrlData;         // Control data (data to be written to the PHY)
input       WriteOp;          // The current operation is a PHY register write operation
input       ScanIncr;         // Automatically increment PHY address
input       SyncStatMdcEn;    // Synchronized ???
input [3:0] ByteSelect;       // Byte select
input [1:0] LatchByte;        // Byte select for latching (read operation)

output      ShiftedBit;       // Bit shifted out of the shift register
output[4:0] ScanPHYAddr;      // Scan PHY Address (Scan is performed to the PHY with the ScanPHYAddr[4:0] address)
output[15:0]Prsd;             // Read Status Data (data read from the PHY)
output      LinkOK;           // Link Integrity Signal

reg   [7:0] ShiftReg;         // Shift register for shifting the data in and out
reg   [4:0] FiadReg;          // PHY address can be incremented
reg   [15:0]Prsd;
reg         LinkOK;

initial begin
    ShiftReg = 0;
    FiadReg = 0;
    Prsd = 0;
    LinkOK = 0;
end


// ShiftReg[7:0] :: Shift Register Data
always @ (posedge Clk) 
begin
  if(Reset)
    ShiftReg[7:0] <= 8'h0;
  else
    begin
      if(MdcEn)
        begin 
          if(|ByteSelect)
            begin
              case (ByteSelect[3:0])
                4'h1 :    ShiftReg[7:0] <= {2'b01, ~WriteOp, WriteOp, FiadReg[4:1]};
                4'h2 :    ShiftReg[7:0] <= {FiadReg[0], Rgad[4:0], 2'b10};
                4'h4 :    ShiftReg[7:0] <= CtrlData[15:8];
                4'h8 :    ShiftReg[7:0] <= CtrlData[7:0];
                default : ShiftReg[7:0] <= 8'h0;
              endcase
            end 
          else
            ShiftReg[7:0] <= {ShiftReg[6:0], Mdi};
        end
    end
end


assign ShiftedBit = ShiftReg[7];



// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// Read Status Data: The data in the shift reg. can be loaded to Prsd[7:0] or Prsd[15:8]
// Generation of LinkOK
always @ (posedge Clk)
begin
  if(Reset)
    begin
      Prsd[15:0] <= 16'h0;
      LinkOK <= 1'b0;
    end
  else
    begin
      if(LatchByte[0])
        begin
          Prsd[7:0] <= ShiftReg[7:0];
          if(Rgad == 5'h01)
            LinkOK <= ShiftReg[2];
        end
      else
        begin
          if(LatchByte[1])
            Prsd[15:8] <= ShiftReg[7:0];
        end
    end
end      


// IncrementAddr is used for incrementing the PHY address
wire IncrementAddr = SyncStatMdcEn & ByteSelect[1] & MdcEn;


// Generation of the Phy address FiadReg[4:0] 
always @ (posedge Clk)
begin
  if(Reset)
    FiadReg <= Fiad;
  else
    begin
      if(~ScanIncr | ScanIncr & IncrementAddr & (FiadReg == 5'h1F))
        FiadReg <= Fiad;
      else
        begin
          if(ScanIncr & IncrementAddr)
            FiadReg <= FiadReg + 1;
        end
    end
end

assign ScanPHYAddr = FiadReg;

endmodule
