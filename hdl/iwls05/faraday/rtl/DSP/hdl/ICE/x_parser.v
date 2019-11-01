
module SPARSER (/* In  */ RSTn, ICK, nSTBx, nAufdx,
                /* Out */ Busy, IMS,
                /* IO  */ PPD[7:0], ID);

//verisureoff

input  RSTn, 			
       ICK, 			
       nSTBx,			
       nAufdx;			

output Busy,			
       IMS;			

inout ID;			
inout [7:0] PPD;		

reg [3:0]  CS, NS;	
reg [7:0]  CMD,		
           WDext0,	
           WDext1,	
           WDext2,	
           WDext3;	
reg [1:0]  WDcnt,	
           RDcnt;	
reg [4:0]  SCNTR;	
reg [31:0] RDext;	
reg Prdy_WA, Prdy_WD, Prdy_RD, 
    Busy, IMS, ID_oe, IDo, Srdy;

wire [31:0] WDexts; 	
wire [7:0]  PPDo;	
wire TRstart, savWD, savWD0, savWD1, 
     savWD2, savWD3, PPD_oe, RDup, 
     Sinc, RST;
     

     IDEBN dnSTB  (ICK, nSTBx,  nSTB);

     IDEBN dnAufd (ICK, nAufdx, nAufd);

     assign #`da RST = !RSTn;




     always @(CS[3:0] or nSTB or nAufd or CMD[7:6] or Srdy) begin

        NS <= #`da 4'h0;
 
        case (CS) 
                4'h0 : NS <= #`da nSTB  ? 4'h0 : 4'h1;
                4'h1 : NS <= #`da nAufd ? 4'h1 : 4'h2;
                4'h2 : casex ({nAufd, CMD[7:6]}) 
                          3'b0xx : NS <= #`da 4'h2;
                          3'b10x : NS <= #`da 4'h3;	
                          3'b110 : NS <= #`da 4'h4;	
                          3'b111 : NS <= #`da 4'h7;	
                       endcase
                4'h3 : NS <= #`da nSTB ? 4'h6 : 4'h3;
                4'h4 : casex ({nSTB, nAufd}) 
                          2'b00 : NS <= #`da 4'h5;
                          2'b01 : NS <= #`da 4'h4;
                          2'b1x : NS <= #`da 4'h6;
                       endcase
                4'h5 : NS <= #`da nAufd ? 4'h4 : 4'h5;
                4'h6 : NS <= #`da Srdy  ? 4'h0 : 4'h6;	
                4'h7 : NS <= #`da Srdy  ? 4'h8 : 4'h7;	
                4'h8 : casex ({nSTB, nAufd}) 
                          2'b00 : NS <= #`da 4'h9;
                          2'b01 : NS <= #`da 4'h8;
                          2'b1x : NS <= #`da 4'h0;
                       endcase
                4'h9 : NS <= #`da nAufd ? 4'h8 : 4'h9;	
        endcase 
     end


/* --- State piping --- */

     always @(posedge ICK or posedge RST) begin
          if (RST) CS <= #`db 4'h0; 
          else     CS <= #`db NS;
     end


/* 
   -------- Important control signals of main S.M : --------

   - Prdy_WA : parallel side ready for WRIAR
   - Prdy_WD : parallel side ready for WRIDR
   - Prdy_RD : parallel side ready for RDIDR

   - TRstart : Start of running main S.M,
               the following registers shall be cleared on TRstart : 
               > RDext[31:0], 
               > WDext0[7:0] ~ WDext3[7:0], 
               > SCNTR[4:0] (shift-counter), 
               > WDcnt[1:0] (counting data bytes of WRIDR) 
               > RDcnt[1:0] (counting data bytes of RDIDR) 
*/

     always @(posedge ICK or posedge RST) begin
        if (RST) begin
           Prdy_WA <= #`db 1'b0;
           Prdy_WD <= #`db 1'b0;
           Prdy_RD <= #`db 1'b0;

        end
        else begin
           Prdy_WA <= #`db (CS == 4'h3) && (NS == 4'h6);
           Prdy_WD <= #`db (CS == 4'h4) && (NS == 4'h6);
           Prdy_RD <= #`db (CS == 4'h2) && (NS == 4'h7);
        end
     end

     assign #`da TRstart = (CS == 4'h1) && (NS == 4'h2);




     always @(posedge ICK or posedge RST) begin
        if (RST)                              Busy <= #`db 1'b0;
        else if ((NS == 1) || (NS == 9))      Busy <= #`db 1'b1;
             else if ((NS == 0) || (NS == 8)) Busy <= #`db 1'b0;
     end



     always @(posedge ICK) if (TRstart) CMD[7:0] <= #`db PPD[7:0];


  
     assign #`d0 WDexts = {WDext3, WDext2, WDext1, WDext0};   // total 32-bit

     assign #`da savWD = (CS == 4'h4) && (NS == 4'h5);

     assign #`da savWD0 = savWD && (WDcnt == 2'h0);
     assign #`da savWD1 = savWD && (WDcnt == 2'h1);
     assign #`da savWD2 = savWD && (WDcnt == 2'h2);
     assign #`da savWD3 = savWD && (WDcnt == 2'h3);

     always @(posedge ICK) 
        if (TRstart)     WDext0[7:0] <= #`db 8'h0;
        else if (savWD0) WDext0[7:0] <= #`db PPD[7:0];

     always @(posedge ICK) 
        if (TRstart)     WDext1[7:0] <= #`db 8'h0;
        else if (savWD1) WDext1[7:0] <= #`db PPD[7:0];

     always @(posedge ICK) 
        if (TRstart)     WDext2[7:0] <= #`db 8'h0;
        else if (savWD2) WDext2[7:0] <= #`db PPD[7:0];

     always @(posedge ICK) 
        if (TRstart)     WDext3[7:0] <= #`db 8'h0;
        else if (savWD3) WDext3[7:0] <= #`db PPD[7:0];


     
     always @(posedge ICK) begin
        if (TRstart)    WDcnt[1:0] <= #`db 2'h0;
        else if (savWD) WDcnt[1:0] <= #`db WDcnt +1;
     end



// Parallel data bus (PPD[7:0] :

     assign #`d0 PPD_oe = (CS == 4'h9);

     assign #`da PPDo[7:0] = (RDcnt[1:0] == 2'h0) ? RDext[7:0]   :
                             (RDcnt[1:0] == 2'h1) ? RDext[15:8]  :
                             (RDcnt[1:0] == 2'h2) ? RDext[23:16] : 
                                                    RDext[31:24] ;

     assign #`da PPD[7:0] = PPD_oe? PPDo[7:0] : 8'bz;


     
     assign #`da RDup = (CS == 4'h9) && (NS == 4'h8);

     always @(posedge ICK) begin
        if (TRstart)   RDcnt[1:0] <= #`db 2'h0;
        else if (RDup) RDcnt[1:0] <= #`db RDcnt +1;
     end




     WRIAR uwriar (/* In  */ RST, ICK, Prdy_WA, eqLen,
                   /* Out */ WA_IMSi, WA_SCNTRup, WA_IDoe_h, WA_Srdy_h);
                             

     WRIDR uwridr (/* In  */ RST, ICK, Prdy_WD, eqLen,
                   /* Out */ WD_IMSi, WD_SCNTRup, WD_IDoe_h, WD_Srdy_h);
                             

     RDIDR urdidr (/* In  */ RST, ICK, Prdy_RD, eqLen,
                   /* Out */ RD_IMSi, RD_SCNTRup, savID, RD_Srdy_h);



     assign #`da Sinc = WA_SCNTRup || WD_SCNTRup || RD_SCNTRup;

     always @(posedge ICK) begin
        if (TRstart)   SCNTR[4:0] <= #`db 5'b0;
        else if (Sinc) SCNTR[4:0] <= #`db SCNTR +1;
     end

     assign #`da eqLen = SCNTR[4:0] == (CMD[7] ? CMD[4:0] : 5'h3);


 
     always @(negedge ICK) IMS <= #`db WA_IMSi && WD_IMSi && RD_IMSi;



     always @(posedge ICK) ID_oe <= #`db WA_IDoe_h || WD_IDoe_h;

     always @(negedge ICK) IDo <= #`db CMD[7] ? WDexts[SCNTR]      // !WRIAR
                                              : CMD[SCNTR[1:0]];   //  WRIAR
     assign #`da ID = ID_oe ? IDo : 1'bz;



     always @(posedge ICK) begin
        if (TRstart)    RDext <= #`db 32'b0;
        else if (savID) RDext <= #`db {RDext[30:0], ID};
     end
  
   
// Srdy :

     always @(posedge ICK or posedge RST) begin
        if (RST) Srdy <= #`db 1'b0;
        else     Srdy <= #`db WA_Srdy_h || WD_Srdy_h || RD_Srdy_h;
     end


//verisureon

endmodule

