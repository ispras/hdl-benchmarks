`include "pdlx.h"
`include "alu.h"
`define OPCODE  IR[31:26] 


`define FUNC    IR[5:0]

module Control(
        IR,

        EXCtrl,
        MEMCtrl,
        WBCtrl,
        SESel,

        Reset,
        Clk
              );
   reg monitor_lw;
   reg monitor_j;
   reg monitor_reset;
   
   
   input [`DATA1] IR;
  reg [5:0] 	 icnt;
   
// Internal Registers
output  [4:0]   EXCtrl;
output  [2:0]   MEMCtrl;
output  [2:0]   WBCtrl;

// Sign Extension
output          SESel;

input           Reset, Clk;

reg     [4:0]   EXCtrl;
reg     [2:0]   MEMCtrl;
reg     [2:0]   WBCtrl;
wire            SESel   = `OPCODE == `J ? 1 : 0;

initial
   begin
      EXCtrl =0;
      MEMCtrl=0;
      WBCtrl=0;
      icnt=0;
      monitor_j=0;
      monitor_lw=0;
      monitor_reset=0;
      
   end // initial begin
   
      
always @(IR) begin
   if(`OPCODE==`LW)
      monitor_lw=1;
   else
      monitor_lw=0;
   if(`OPCODE==`J)
      monitor_j=1;
   else
      monitor_j=0;
   if(Reset==1)
      monitor_reset=1;
   else
      monitor_reset=0;
   
   
   icnt = icnt + 1;

   if (!Reset) begin
      case (`OPCODE)
         `FSEL: begin
                if (IR == `NOP) begin
                   EXCtrl  = 00000;
                   MEMCtrl = 000;
                   WBCtrl  = 000;
                end
                else begin
                 
                   case (`FUNC)
                      `SLL: begin
                               EXCtrl = {`RTYPE,3'b011};
                               MEMCtrl = 000;
                               WBCtrl  = {3'b111};
                            end
                      `SRL: begin
                               EXCtrl = {`RTYPE,3'b011};
                               MEMCtrl = 000;
                               WBCtrl  = {3'b111};
                            end
                      default: begin
                               EXCtrl = {`RTYPE,3'b010};
                               MEMCtrl = 000;
                               WBCtrl  = 3'b111;
                            end
                   endcase
                end
             end
         `J: begin

	    
                EXCtrl  = {`BRANCH,3'b001};
                MEMCtrl = 3'b010;
                WBCtrl  = 000;
             end
         `BEQZ: begin
                
                EXCtrl  = {`BRANCH,3'b001};
                MEMCtrl = 3'b001;
                WBCtrl  = 000;
             end
         `BNEZ: begin

                EXCtrl  = {`BRANCH,3'b101};
                MEMCtrl = 3'b001;
                WBCtrl  = 000;
             end
         `ADDI: begin

                EXCtrl  = {`ITYPE,3'b011};
                MEMCtrl = 000;
                WBCtrl  = 3'b101;
             end
         `LW: begin

                EXCtrl  = {`MEMACC,3'b011};
                MEMCtrl = 000;
                WBCtrl  = 3'b100;
             end
         `SW: begin

                EXCtrl  = {`MEMACC,3'b011};
                MEMCtrl = 3'b100;
                WBCtrl  = 000;
             end
         `HLT: begin



             end
         default: begin


             end
      endcase
   end
   else begin
     
      EXCtrl  = 00000;
      MEMCtrl = 000;
      WBCtrl  = 000;
   end
end

endmodule /* Control */


