
/* ***********************************************************************
  The Free IP Project
  Free-RISC8 -- Verilog 8-bit Microcontroller
  (c) 1999, The Free IP Project and Thomas Coonan


  FREE IP GENERAL PUBLIC LICENSE
  TERMS AND CONDITIONS FOR USE, COPYING, DISTRIBUTION, AND MODIFICATION

  1.  You may copy and distribute verbatim copies of this core, as long
      as this file, and the other associated files, remain intact and
      unmodified.  Modifications are outlined below.  
  2.  You may use this core in any way, be it academic, commercial, or
      military.  Modified or not.  
  3.  Distribution of this core must be free of charge.  Charging is
      allowed only for value added services.  Value added services
      would include copying fees, modifications, customizations, and
      inclusion in other products.
  4.  If a modified source code is distributed, the original unmodified
      source code must also be included (or a link to the Free IP web
      site).  In the modified source code there must be clear
      identification of the modified version.
  5.  Visit the Free IP web site for additional information.
      http://www.free-ip.com

*********************************************************************** */
module alu (
   op,
   a,
   b,
   y,
   cin,
   cout,
   zout
);

input  [3:0]	op;	// ALU Operation
input  [7:0]	a;	// 8-bit Input a
input  [7:0]	b;	// 8-bit Input b
output [7:0]	y;	// 8-bit Output
input		cin;
output		cout;
output		zout;

// Reg declarations for outputs
reg		cout;
reg		zout;
reg [7:0]	y;

// Internal declarations
reg		addercout; // Carry out straight from the adder itself.
 
parameter ALUOP_ADD  = 4'b0000;
parameter ALUOP_SUB  = 4'b1000;
parameter ALUOP_AND  = 4'b0001;
parameter ALUOP_OR   = 4'b0010;
parameter ALUOP_XOR  = 4'b0011;
parameter ALUOP_COM  = 4'b0100;
parameter ALUOP_ROR  = 4'b0101;
parameter ALUOP_ROL  = 4'b0110;
parameter ALUOP_SWAP = 4'b0111;


always @(a or b or cin or op) begin
   case (op) // synopsys parallel_case
      ALUOP_ADD:  {addercout,  y}  = a + b;
      ALUOP_SUB:  {addercout,  y}  = a - b; // Carry out is really "borrow"
      ALUOP_AND:  {addercout,  y}  = {1'b0, a & b};
      ALUOP_OR:   {addercout,  y}  = {1'b0, a | b};
      ALUOP_XOR:  {addercout,  y}  = {1'b0, a ^ b};
      ALUOP_COM:  {addercout,  y}  = {1'b0, ~a};
      ALUOP_ROR:  {addercout,  y}  = {a[0], cin, a[7:1]};
      ALUOP_ROL:  {addercout,  y}  = {a[7], a[6:0], cin};
      ALUOP_SWAP: {addercout,  y}  = {1'b0, a[3:0], a[7:4]};
      default:    {addercout,  y}  = {1'b0, 8'h00};
   endcase
end

always @(y)
   zout = (y == 8'h00);

always @(addercout or op)
   if (op == ALUOP_SUB) cout = ~addercout; // Invert adder's carry to get borrow
   else                 cout =  addercout;
      
endmodule
