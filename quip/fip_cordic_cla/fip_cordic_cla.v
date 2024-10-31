
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//--  The Free IP Project
//--  Verilog Free-CORDIC Core
//--  (c) 2000, The Free IP Project and Rohit Sharma (srohit@free-ip.com)
//--
//--
//--  FREE IP GENERAL PUBLIC LICENSE
//--  TERMS AND CONDITIONS FOR USE, COPYING, DISTRIBUTION, AND MODIFICATION
//--
//--  1.  You may copy and distribute verbatim copies of this core, as long
//--      as this file, and the other associated files, remain intact and
//--      unmodified.  Modifications are outlined below.
//--  2.  You may use this core in any way, be it academic, commercial, or
//--      military.  Modified or not.
//--  3.  Distribution of this core must be free of charge.  Charging is
//--      allowed only for value added services.  Value added services
//--      would include copying fees, modifications, customizations, and
//--      inclusion in other products.
//--  4.  If a modified source code is distributed, the original unmodified
//--      source code must also be included (or a link to the Free IP web
//--      site).  In the modified source code there must be clear
//--      identification of the modified version.
//--  5.  Visit the Free IP web site for additional information.
//--      http://www.free-ip.com
//--
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
//

// MH
`include "header.v"

module fip_cordic_cla(CosX,SinX,theta,Sign,clock,reset);

	output [`REG_SIZE+1:0] CosX,SinX;
	input [`REG_SIZE:0] theta;
	input  Sign,clock,reset;

	reg AngleCin,Xsign,Ysign;
	reg [`REG_SIZE:0] X,Y,Angle;
	reg [3:0] iteration;

	wire [`REG_SIZE:0] tanangle;
	wire [`REG_SIZE:0] BS1,BS2;
	wire [`REG_SIZE:0] SumX,SumY,SumAngle;
	wire CarryX,CarryY,AngleCout;



`ifdef SYNTH
MEM pla ( .\iteration[0] (iteration[0]), .\iteration[1] (iteration[1]), .\iteration[2] (iteration[2]), .\iteration[3] (iteration[3]), .\tanangle[0] (tanangle[0]), .\tanangle[1] (tanangle[1]), .\tanangle[2] (tanangle[2]), .\tanangle[3] (tanangle[3]), .\tanangle[4] (tanangle[4]), .\tanangle[5] (tanangle[5]), .\tanangle[6] (tanangle[6]), .\tanangle[7] (tanangle[7]), .\tanangle[8] (tanangle[8]), .\tanangle[9] (tanangle[9]), .\tanangle[10] (tanangle[10]), .\tanangle[11] (tanangle[11]), .\tanangle[12] (tanangle[12]), .\tanangle[13] (tanangle[13]), .\tanangle[14] (tanangle[14]), .\tanangle[15] (tanangle[15]) );
`else
MEM pla ( iteration, tanangle ) ;
`endif


/*********************Data Path******************************************/


        shifter SH1(BS1,Y,iteration); 
        Adder AddX(SumX,CarryX,Xsign,X,BS1,~AngleCin);  
        shifter SH2(BS2,X,iteration);
        Adder AddY(SumY,CarryY,Ysign,Y,BS2,AngleCin);
        Adder Add0(SumAngle,AngleCout,AngleCin,Angle,tanangle,~AngleCin);
        assign CosX={CarryX,SumX};
        assign SinX={CarryY,SumY};

/*********************System FSM******************************************/

	always @ (posedge clock)
		if (reset)
			begin
			iteration<=0;
			Angle <= theta ;
			X<=16'b1001101110000000;             //0.6072
			Y<=16'b0000000000000000;
			Xsign<=0;
			Ysign<=0;
			AngleCin <= Sign ;
			end
		else
			begin
                        iteration <= iteration + 1;
                        Angle <= SumAngle;
                        X <= SumX;
                        Y <= SumY;
                        Xsign <= CarryX;
                        Ysign <= CarryY;
                        AngleCin <= AngleCout;
                        end




endmodule // fip_cordic_cla 
