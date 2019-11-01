

module WRIAR (/* In  */ RST, ICK, Prdy, eqLen,
              /* Out */ IMSi, SCNTRup, IDoe_h, Srdy_h);

input  RST, 	
       ICK, 	
       Prdy,	
       eqLen;   

output IMSi,      
       SCNTRup,   
       IDoe_h,	
       Srdy_h;	

reg  [2:0] CS, NS;



parameter Idle   = 3'b0,
          Start  = 3'h1,
          Sel_D  = 3'h2,
          Sel_A  = 3'h3,
          Sht_Ai = 3'h4,
          Shtend = 3'h5,
          DWR    = 3'h6,
          DRD    = 3'h7;

     always @(CS[2:0] or Prdy or eqLen) begin

        NS <= #`da Idle; 
        case (CS) 
                Idle   : NS <= #`da Prdy ? Start : Idle;
                Start  : NS <= #`da Sel_D;
                Sel_D  : NS <= #`da Sel_A;
                Sel_A  : NS <= #`da Sht_Ai;
                Sht_Ai : NS <= #`da eqLen ? Shtend : Sht_Ai;
                Shtend : NS <= #`da DWR;
                DWR    : NS <= #`da DRD;
                DRD    : NS <= #`da Idle;
        endcase 
     end

     assign #`da Srdy_h  = (NS == DRD);
     assign #`da IMSi    = !((CS == Start) || (CS == Sel_A) || (CS == Sht_Ai));
//   assign #`da Sht_en  = (NS == Sel_A) || (NS == Sht_Ai);
     assign #`da IDoe_h  = (NS == Sel_A) || (NS == Sht_Ai) || (NS == Shtend);

//   assign #`da ldSCNTR = (NS == Start);  
     assign #`da SCNTRup = (NS == Sht_Ai); 



     always @(posedge ICK or posedge RST) begin
          if (RST) begin
          // wrIARcyc <= #`db 1'b0;
             CS       <= #`db 3'b0; 
          end
          else begin
          // wrIARcyc <= #`db NS != Idle;
             CS       <= #`db NS;
          end
     end

endmodule





module WRIDR (/* In  */ RST, ICK, Prdy, eqLen,
              /* Out */ IMSi, SCNTRup, IDoe_h, Srdy_h);

input  RST, 	
       ICK, 	
       Prdy,	
       eqLen;   

output IMSi,     
       SCNTRup,   
       IDoe_h,	
       Srdy_h;	

reg  [2:0] CS, NS;



parameter Idle   = 3'b0,
          Start  = 3'h1,
          Sel_D  = 3'h2,
          DWR    = 3'h3,
          Sht_Di = 3'h4,
          Shtend = 3'h5;

     always @(CS[2:0] or Prdy or eqLen) begin

        NS <= #`da Idle; 
        case (CS) 
                Idle   : NS <= #`da Prdy ? Start : Idle;
                Start  : NS <= #`da Sel_D;
                Sel_D  : NS <= #`da DWR;
                DWR    : NS <= #`da Sht_Di;
                Sht_Di : NS <= #`da eqLen ? Shtend : Sht_Di;
                Shtend : NS <= #`da Idle;
        endcase 
     end

     assign #`da Srdy_h  = (CS == Shtend);
     assign #`da IMSi    = (CS == Idle) || (CS == Shtend);
//   assign #`da Sht_en  = (NS == DWR)  || (NS == Sht_Di);
     assign #`da IDoe_h  = (NS == DWR ) || (NS == Sht_Di) || (NS == Shtend);

//   assign #`da ldSCNTR = (NS == Start);  
     assign #`da SCNTRup = (NS == Sht_Di); 


/* --- State piping --- */

     always @(posedge ICK or posedge RST) begin
          if (RST) begin
          // wrIDRcyc <= #`db 1'b0;
             CS       <= #`db 3'b0; 
          end
          else begin
          // wrIDRcyc <= #`db NS != Idle;
             CS       <= #`db NS;
          end
     end

endmodule





module RDIDR (/* In  */ RST, ICK, Prdy, eqLen,
              /* Out */ IMSi, SCNTRup, savID, Srdy_h);

input  RST, 	
       ICK, 	
       Prdy,	
       eqLen;   

output IMSi,      
       savID,   
       SCNTRup,    
       Srdy_h;	

reg  [2:0] CS, NS;



parameter Idle   = 3'b0,
          Start  = 3'h1,
          Sel_D  = 3'h2,
          DWR    = 3'h3,
          DRD1   = 3'h4,
          Sht_Do = 3'h5,
          Shtend = 3'h6,
          DRD2   = 3'h7;

     always @(CS[2:0] or Prdy or eqLen) begin

        NS <= #`da Idle; 
        case (CS) 
                Idle   : NS <= #`da Prdy ? Start : Idle;
                Start  : NS <= #`da Sel_D;
                Sel_D  : NS <= #`da DWR;
                DWR    : NS <= #`da DRD1;
                DRD1   : NS <= #`da Sht_Do;
                Sht_Do : NS <= #`da eqLen ? Shtend : Sht_Do;
                Shtend : NS <= #`da DRD2;
                DRD2   : NS <= #`da Idle;
        endcase 
     end

     assign #`da Srdy_h = (NS == DRD2);
     assign #`da IMSi   = !((CS == Start) || (CS == Sel_D) || 
                            (CS == DRD1)  || (CS == Sht_Do));
     assign #`da savID  = (NS == Sht_Do) || (NS == Shtend);

//   assign #`da ldSCNTR = (NS == Start);  
     assign #`da SCNTRup = (NS == Sht_Do); 



     always @(posedge ICK or posedge RST) begin
          if (RST) begin
          // rdIDRcyc <= #`db 1'b0;
             CS       <= #`db 3'b0; 
          end
          else begin
          // rdIDRcyc <= #`db NS != Idle;
             CS       <= #`db NS;
          end
     end

endmodule
