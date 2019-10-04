`include "alu.h"
`include "pdlx.h"

module ALU(AIn, BIn, Out, ALUCtrl);

input   [`DATA] AIn, BIn;
output  [`DATA] Out;
input   [`ALUC] ALUCtrl;


reg     [`DATA] Out;
integer         atmp, btmp;
   initial Out =0;
   

always @(ALUCtrl or AIn or BIn) begin


   case (ALUCtrl)
      `ALUAND: begin

                  Out = AIn & BIn;
               end
      `ALUOR: begin

                  Out = AIn | BIn;
               end
      `ALUSHL: begin

          //        Out = AIn << BIn[10:6];
               end
      `ALUSHR: begin

            //      Out = AIn >> BIn[10:6];
               end
      `ALUADD: begin   // add 2-complement numbers
	 Out = AIn + BIn;
	 

               end
      `ALUSUB: begin   // subtract 2-complement numbers
               /*   if (AIn[`DATAWIDTH-1] == 1)  // negative A
                     atmp = -(~AIn + 1);
                  else
                     atmp = AIn;
                  if (BIn[`DATAWIDTH-1] == 1)  // negative B
                     btmp = -(~BIn + 1);
                  else
                     btmp = BIn;
                  atmp = atmp - btmp;
                  Out = atmp;
                */
               end
      `ALUMUL: begin   // multiply 2-complement numbers
               /*   if (AIn[`DATAWIDTH-1] == 1)  // negative A
                     atmp = -(~AIn + 1);
                  else
                     atmp = AIn;
                  if (BIn[`DATAWIDTH-1] == 1)  // negative B
                     btmp = -(~BIn + 1);
                  else
                     btmp = BIn;
                  atmp = atmp * btmp;
                  Out = atmp;
*/
               end
      default: begin

               end
   endcase
end

endmodule /* ALU */


module ALUControl(ALUop, OPcode, Func, ALUCtrl);

input   [`ALUO] ALUop;
input   [5:0]   OPcode;
input   [5:0]   Func;
output  [`ALUC] ALUCtrl;

reg     [`ALUC] ALUCtrl;

initial
   ALUCtrl = 0;


always @(ALUop or OPcode or Func) begin
   if (ALUop == `ITYPE || ALUop == `BRANCH) begin
      casex ({ALUop,OPcode})
         {`ITYPE,`ADDI}:  ALUCtrl = `ALUADD;   // R-Type: add
         {`BRANCH,6'bx}:  ALUCtrl = `ALUADD;   // J-Type: add
         default: begin

                  end
      endcase
   end
   else begin

      casex ({ALUop,Func})
         {`MEMACC,6'bx}: ALUCtrl = `ALUADD;   // Load / store
         {`RTYPE,`AND}:  ALUCtrl = `ALUAND;   // R-Type: and
         {`RTYPE,`OR}:   ALUCtrl = `ALUOR;    // R-Type: or
         {`RTYPE,`SLL}:  ALUCtrl = `ALUSHL;   // R-Type: shl
         {`RTYPE,`SRL}:  ALUCtrl = `ALUSHR;   // R-Type: shr
         {`RTYPE,`ADD}:  ALUCtrl = `ALUADD;   // R-Type: add
         {`RTYPE,`SUB}:  ALUCtrl = `ALUSUB;   // R-Type: sub
         {`RTYPE,`MUL}:  ALUCtrl = `ALUMUL;   // R-Type: mul
         default: begin

                  end
      endcase
   end
end

endmodule /* ALUControl */



