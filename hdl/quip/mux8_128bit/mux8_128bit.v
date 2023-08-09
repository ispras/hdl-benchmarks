module z_sreg_1ton (d, clk, q);
/*   parameter inwidth = 1;*/
   parameter outwidth = 128;

   input clk;
/*   input [inwidth - 1:0] d;*/
   input d;
   output [outwidth-1:0] q;
   reg [outwidth-1:0] 	 q;

   integer index;
   
   always @ (posedge clk)
     begin
	q[0] <= d;
	for (index=1; index<(outwidth/2); index=index+1)
	  begin
	     q[index] <= q[index-1];
	  end

	for (index=(outwidth/2); index<(outwidth); index=index+1)
	  begin
	     q[index] <= q[index-1];
	  end
     end
endmodule // z_sreg_1ton

module z_regfile2 (d, clk, q);
   input [2:0] d;
   input       clk;
   output [2:0] q;
   reg [2:0] 	q;

	always @ (posedge clk)
	begin
	   q = d;
	end
endmodule // z_regfile2

module mux8_128bit (clk, sel, a, y);
   input clk ;
   input [2:0] sel;
   input [7:0] a;
   output [127:0]    y;
   reg [127:0] 	    y;
	
   wire [127:0]     reg_a0,reg_a1,reg_a2,reg_a3,reg_a4,reg_a5,reg_a6,reg_a7;
   wire [2:0] 	    reg_sel; 	    

   z_sreg_1ton u0 (.d(a[0]), .clk(clk), .q(reg_a0));
   z_sreg_1ton u1 (.d(a[1]), .clk(clk), .q(reg_a1));
   z_sreg_1ton u2 (.d(a[2]), .clk(clk), .q(reg_a2));
   z_sreg_1ton u3 (.d(a[3]), .clk(clk), .q(reg_a3));
   z_sreg_1ton u4 (.d(a[4]), .clk(clk), .q(reg_a4));
   z_sreg_1ton u5 (.d(a[5]), .clk(clk), .q(reg_a5));
   z_sreg_1ton u6 (.d(a[6]), .clk(clk), .q(reg_a6));
   z_sreg_1ton u7 (.d(a[7]), .clk(clk), .q(reg_a7));

   z_regfile2 u8 (.d(sel), .clk(clk), .q(reg_sel));

   always @(posedge clk)
     begin
	case(reg_sel)
	  0: y <= reg_a0;
	  1: y <= reg_a1;
	  2: y <= reg_a2;
	  3: y <= reg_a3;
	  4: y <= reg_a4;
	  5: y <= reg_a5;
	  6: y <= reg_a6;
	  7: y <= reg_a7;
	  default: y <= reg_a0;
	endcase
     end
endmodule

