/*
*
*	Taken from VIS Benchmarks <ftp://vlsi.colorado.edu/pub/vis/vis-verilog-models-1.3.tar.gz>
*	Modified by Ahmed Irfan <irfan@fbk.eu>
*
*/
module am2901(I,Aadd,Badd,D,Y,RAM0in,RAM0out,RAM3in,RAM3out,
	      Q0in,Q0out,Q3in,Q3out,CLK,C0,OEbar,C4,Gbar,Pbar,OVR,F3,F30);
    input [8:0]	 I;
    input [3:0]	 Aadd;
    input [3:0]	 Badd;
    input [3:0]	 D;
    output [3:0] Y;
    input	 RAM0in;
    output	 RAM0out;
    input	 RAM3in;
    output	 RAM3out;
    input	 Q0in;
    output	 Q0out;
    input	 Q3in;
    output	 Q3out;
    input	 CLK;
    input	 C0;
    input	 OEbar;
    output	 C4;
    output	 Gbar;
    output	 Pbar;
    output	 OVR;
    output	 F3;
    output	 F30;

    reg [3:0]	 RAM[15:0];
    wire [3:0]	 RE;
    wire [3:0]	 S;
    wire [3:0]	 A;
    wire [3:0]	 B;
    reg [3:0]	 Q;
    wire [3:0]	 F;

    wire [4:0]	 R_ext;
    wire [4:0]	 S_ext;
    wire [4:0]	 result;
    wire [4:0]	 temp_p;
    wire [4:0]	 temp_g;

    integer	 i;
	
    initial begin
	Q = 4'd0;
        for (i = 0; i < 16; i = i + 1)
	  RAM[i] = 0;
    end  


    // ALU inputs.
    assign A = RAM[Aadd];
    assign B = RAM[Badd];

    assign RE = (I[2:1] == 2'd0) ? A :
	(I[2] == 1'd1 && I[1:0] != 2'd0) ? D : 4'd0;

    assign S = (I[2:1] == 2'd2) ? A :
	(I[2] == 1'd0 && I[0] == 1'd1) ? B :
	(I[2:0] == 3'd7) ? 4'd0 : Q;

    // ALU

    // To facilitate computation of carry-out "C4", we extend the chosen 
    // ALU operands "RE" and "S" (4 bit operands) by 1 bit in the MSB 
    // position. 

    // Thus the extended operands "R_EXT" and "S_EXT" (5 bit operands) are
    // formed and are used in the ALU operation. The extra bit is set to '0' 
    // initially. The ALU's extended output (5 bits long) is "result".

    assign R_ext = (I[5:3] == 3'd1) ? {1'd0,~RE} : {1'd0,RE};
    assign S_ext = (I[5:3] == 3'd2) ? {1'd0,~S} : {1'd0,S};

    // Select the ALU function.

    // In the add/subtract operations, the carry-input "C0" (1 bit) is extended
    // bits (all '0') in the more significant bits to match its length to
    // "R_ext" and "S_ext". Then, these three operands are added.

    // Add/subtract operations are done in 2's complement.

    assign result = 
	(I[5] == 1'd0 && I[4:3] != 2'd3) ? R_ext + S_ext + {4'd0,C0} :
	(I[5:3] == 3'd3) ? R_ext | S_ext :
	(I[5:3] == 3'd4) ? R_ext & S_ext :
	(I[5:3] == 3'd5) ? ~R_ext & S_ext :
	(I[5:3] == 3'd6) ? R_ext ^ S_ext : ~R_ext ^ S_ext;

    // Evaluate other ALU outputs.

    // From extended output "result" (5 bits), we obtain the normal ALU output,
    // "F" (4 bits) by leaving out the MSB (which corresponds to carry-out
    // "C4").

    // To facilitate computation of carry lookahead terms "Pbar" and "Gbar", we
    // compute intermediate terms "temp_p" and "temp_g".

    assign F = result[3:0];
    assign OVR = ~(R_ext[3] ^ S_ext[3]) & (R_ext[3] ^ result[3]);
    assign C4 = result[4];
    assign temp_p = R_ext | S_ext; // R or S may get inverted (sub)
    assign temp_g = R_ext & S_ext;
    assign Pbar = ~(&temp_p[3:0]);
    assign Gbar = ~(temp_g[3] |
		    (temp_p[3] & temp_g[3]) |
		    (&temp_p[3:2] & temp_g[1]) |
		    (&temp_p[3:1] & temp_g[0]));
    assign F3 = result[3];
    assign F30 = ~(|result[3:0]);

    always @ (posedge CLK) begin
	// RAM block.
	// Write to RAM with/without shifting. RAM destinations are 
	// addressed by "Badd".
	if (I[8:7] == 2'd1)
	    RAM[Badd] <= F;
	else if (I[8:7] == 2'd2)
	    RAM[Badd] <= {RAM3in,F[3:1]};
	else if (I[8:7] == 2'd3)
	    RAM[Badd] <= {F[2:0],RAM0in};

	// Q register.
	// Write to Q register with/without shifting.
	if (I[8:6] == 3'd0)
	    Q <= F;
	else if (I[8:6] == 3'd4)
	    Q <= {Q3in,Q[3:1]};
	else if (I[8:6] == 3'd6)
	    Q <= {Q[2:0],Q0in};
    end // always @ (posedge CLK)


    // Output and shifter block. We leave out the tri-state buffers.

    assign Y = (I[8:6] == 3'd2) ? A : F;
    assign RAM0out = F[0];
    assign RAM3out = F[3];
    assign Q3out = Q[3];
    assign Q0out = Q[0];

    //property
   /* 
    !(RAM<*15*><3>=1 * RAM<*14*><3>=1 * RAM<*13*><3>=1 * RAM<*12*><3>=1 *
    RAM<*11*><3>=1 * RAM<*10*><3>=1 * RAM<*9*><3>=1 * RAM<*8*><3>=1 *
    RAM<*7*><3>=1 * RAM<*6*><3>=1 * RAM<*5*><3>=1 * RAM<*4*><3>=1 *
    RAM<*3*><3>=1 * RAM<*2*><3>=1 * RAM<*1*><3>=1 * RAM<*0*><3>=1 * Q<3>=1);
    */
   assert property ( !(RAM[0]>=8 && RAM[1]>=8 && RAM[2]>=8 && RAM[3]>=8 && RAM[4]>=8 && RAM[5]>=8 && RAM[6]>=8 && RAM[7]>=8 && RAM[8]>=8 && RAM[9]>=8 && RAM[10]>=8 && RAM[11]>=8 && RAM[12]>=8 && RAM[13]>=8 && RAM[14]>=8 && RAM[15]>=8 && Q[3]==1)); 

endmodule // am2901
