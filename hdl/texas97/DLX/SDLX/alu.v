`include "alu.h"
`include "sdlx.h"

module ALU(AIn, BIn, Out, ALUCtrl);

input   [`DATA] AIn, BIn;
output  [`DATA] Out;
input   [`ALUC] ALUCtrl;

reg     [`DATA] Out;
initial Out=4'b00;

reg [3:0] tmp1;
initial tmp1=4'b00;
reg [3:0] tmp2;
initial tmp2=4'b00;

always @(ALUCtrl or AIn or BIn) begin
   case (ALUCtrl)
      `ALUAND: begin
                   Out = AIn & BIn;
               end

      `ALUOR: begin
                  Out = AIn | BIn;
               end

      `ALUSHL: begin
                /*  tmp1[3] = AIn[2]&BIn[0] | AIn[3]&(~BIn[0]);
		 tmp1[2] = AIn[1]&BIn[0] | AIn[2]&(~BIn[0]);
		 tmp1[1] = AIn[0]&BIn[0] | AIn[1]&(~BIn[0]);
		 tmp1[0] =      0&BIn[0] | AIn[0]&(~BIn[0]);
		 
		 tmp2[3] = tmp1[1]&BIn[1] | tmp1[3]&(~BIn[1]);
		 tmp2[2] = tmp1[0]&BIn[1] | tmp1[2]&(~BIn[1]);
		 tmp2[1] =       0&BIn[1] | tmp1[1]&(~BIn[1]);
		 tmp2[0] =       0&BIn[1] | tmp1[0]&(~BIn[1]);
		 
		 Out = tmp2;
*/
               end

      `ALUADD: begin   // add positive numbers
        Out = AIn + BIn;
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
   ALUCtrl = 3'b000;

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

endmodule  /* ALUControl */



