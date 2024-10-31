module z_sreg_1ton (d, clk, q);
/*   parameter inwidth = 1;*/
   parameter outwidth = 16;

   input clk;
/*   input [inwidth - 1:0] d;*/
   input d;
   output [outwidth-1:0] q;
   reg [outwidth-1:0] 	 q;

   integer index;
   
   always @ (posedge clk)
     begin
	q[0] <= d;
	for (index=1; index<outwidth; index=index+1)
	  begin
	     q[index] <= q[index-1];
	  end
     end
endmodule // z_sreg_1ton

module z_regfile2 (d, clk, q);
   input [4:0] d;
   input       clk;
   output [4:0] q;
   reg [4:0] 	q;

	always @ (posedge clk)
	begin
	   q = d;
	end
endmodule // z_regfile2

module mux32_16bit (clk, sel, a, y);
   input clk ;
   input [4:0] sel;
   input [31:0] a;
   output [15:0] y;
   reg [15:0] 	 y;
	
   wire [15:0] 	    reg_a0,reg_a1,reg_a2,reg_a3,reg_a4,reg_a5,reg_a6,reg_a7,reg_a8,reg_a9,reg_a10,reg_a11,reg_a12,reg_a13,reg_a14,reg_a15,reg_a16,reg_a17,reg_a18,reg_a19,reg_a20,reg_a21,reg_a22,reg_a23,reg_a24,reg_a25,reg_a26,reg_a27,reg_a28,reg_a29,reg_a30,reg_a31;
   wire [4:0] 	    reg_sel; 	    
   
   z_sreg_1ton u0 (.d(a[0]), .clk(clk), .q(reg_a0));
   z_sreg_1ton u1 (.d(a[1]), .clk(clk), .q(reg_a1));
   z_sreg_1ton u2 (.d(a[2]), .clk(clk), .q(reg_a2));
   z_sreg_1ton u3 (.d(a[3]), .clk(clk), .q(reg_a3));
   z_sreg_1ton u4 (.d(a[4]), .clk(clk), .q(reg_a4));
   z_sreg_1ton u5 (.d(a[5]), .clk(clk), .q(reg_a5));
   z_sreg_1ton u6 (.d(a[6]), .clk(clk), .q(reg_a6));
   z_sreg_1ton u7 (.d(a[7]), .clk(clk), .q(reg_a7));
   z_sreg_1ton u8 (.d(a[8]), .clk(clk), .q(reg_a8));
   z_sreg_1ton u9 (.d(a[9]), .clk(clk), .q(reg_a9));
   z_sreg_1ton u10 (.d(a[10]), .clk(clk), .q(reg_a10));
   z_sreg_1ton u11 (.d(a[11]), .clk(clk), .q(reg_a11));
   z_sreg_1ton u12 (.d(a[12]), .clk(clk), .q(reg_a12));
   z_sreg_1ton u13 (.d(a[13]), .clk(clk), .q(reg_a13));
   z_sreg_1ton u14 (.d(a[14]), .clk(clk), .q(reg_a14));
   z_sreg_1ton u15 (.d(a[15]), .clk(clk), .q(reg_a15));
   z_sreg_1ton u16 (.d(a[16]), .clk(clk), .q(reg_a16));
   z_sreg_1ton u17 (.d(a[17]), .clk(clk), .q(reg_a17));
   z_sreg_1ton u18 (.d(a[18]), .clk(clk), .q(reg_a18));
   z_sreg_1ton u19 (.d(a[19]), .clk(clk), .q(reg_a19));
   z_sreg_1ton u20 (.d(a[20]), .clk(clk), .q(reg_a20));
   z_sreg_1ton u21 (.d(a[21]), .clk(clk), .q(reg_a21));
   z_sreg_1ton u22 (.d(a[22]), .clk(clk), .q(reg_a22));
   z_sreg_1ton u23 (.d(a[23]), .clk(clk), .q(reg_a23));
   z_sreg_1ton u24 (.d(a[24]), .clk(clk), .q(reg_a24));
   z_sreg_1ton u25 (.d(a[25]), .clk(clk), .q(reg_a25));
   z_sreg_1ton u26 (.d(a[26]), .clk(clk), .q(reg_a26));
   z_sreg_1ton u27 (.d(a[27]), .clk(clk), .q(reg_a27));
   z_sreg_1ton u28 (.d(a[28]), .clk(clk), .q(reg_a28));
   z_sreg_1ton u29 (.d(a[29]), .clk(clk), .q(reg_a29));
   z_sreg_1ton u30 (.d(a[30]), .clk(clk), .q(reg_a30));
   z_sreg_1ton u31 (.d(a[31]), .clk(clk), .q(reg_a31));

   z_regfile2 u32 (.d(sel), .clk(clk), .q(reg_sel));

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
	  8: y <= reg_a8;
	  9: y <= reg_a9;
	  10: y <= reg_a10;
	  11: y <= reg_a11;
	  12: y <= reg_a12;
	  13: y <= reg_a13;
	  14: y <= reg_a14;
	  15: y <= reg_a15;
	  16: y <= reg_a16;
	  17: y <= reg_a17;
	  18: y <= reg_a18;
	  19: y <= reg_a19;
	  20: y <= reg_a20;
	  21: y <= reg_a21;
	  22: y <= reg_a22;
	  23: y <= reg_a23;
	  24: y <= reg_a24;
	  25: y <= reg_a25;
	  26: y <= reg_a26;
	  27: y <= reg_a27;
	  28: y <= reg_a28;
	  29: y <= reg_a29;
	  30: y <= reg_a30;
	  31: y <= reg_a31;
	  default: y <= reg_a0;
	endcase
     end
endmodule
