module bus(CLK);
//the bus module encapsulates the PCI master and Target
//Along with a rudimentary Arbiter

input 	CLK;
reg 	RST_; //signals followed by _ are asserted low signals
wire 	CLK;
//Both master and target have inout lines which are
//integrated in the top module to have the correct
//data flow and pull up to one if required

//several output enable signals have to be brought out from
//inside to implement the pull up and proper routing
//output enables are for driven signals and all OEs are
//asserted high inside this design

//The AD bus has been scaled to 3 bit wide to reduce the
//number of states  without compromizing the verification
//the CBE_ cannot be scaled down as the commands are encoded
//over 4 bits
wire [2:0]       ADin;
wire [2:0]       ADout;
wire [3:0]       CBEin_;
wire [3:0]       CBEout_;
wire [3:0]       IDSEL;

wire   PARin, PARout, FRAMEin_, FRAMEout_, IRDYin_, IRDYout_, REQ_,
GNT_, TRDYin_, TRDYout_, STOPin_, STOPout_, LOCKin_, LOCKout_,
IDSEL0, DEVSELin_, DEVSELout_, oeframe, oeirdy, oelock, oetrdy,
oestop, oedevsel,frame,irdy,trdy,lock,stop,devsel;
//Instantiate Master
MasterDevice m1( CLK, RST_, ADin, ADout, CBEin_, CBEout_, PARin, PARout,
        FRAMEin_, FRAMEout_, IRDYin_, IRDYout_, REQ_, GNT_, trdy,
        stop, LOCKin_, LOCKout_, IDSEL, devsel, oeframe,
	oeirdy, oelock);
//Instantiate Target
TargetDevice t1( CLK, RST_, ADout, ADin, CBEout_, PARout, PARin, frame,
        irdy, TRDYin_, TRDYout_, STOPin_, STOPout_, lock, IDSEL0,
        DEVSELin_, DEVSELout_, oetrdy, oestop, oedevsel);
//Instantiate Arbiter
arb a(REQ_,GNT_,CLK);
assign IDSEL0 = IDSEL[0];

//CBEin is assigned just as a dummy assignment to take care
//of not being floating
assign CBEin_ = $ND(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
assign FRAMEin_ = (oeframe) ? 1'bz : 1'b1;
assign frame = (oeframe) ? FRAMEout_ : 1'b1;
assign IRDYin_ = (oeirdy) ? 1'bz : 1'b1;
assign irdy = (oeirdy) ? IRDYout_  : 1'b1;


assign LOCKin_ = (oelock) ? 1'bz : 1'b1;
assign lock = (oelock) ? LOCKout_ : 1'b1;
assign TRDYin_ = (oetrdy) ? 1'bz : 1'b1;
assign trdy = (oetrdy) ? TRDYout_ : 1'b1;
assign STOPin_ = (oestop) ? 1'bz : 1'b1;
assign stop = (oestop) ? STOPout_ : 1'b1;
assign DEVSELin_ = (oedevsel) ? 1'bz : 1'b1;
assign devsel = (oedevsel) ? DEVSELout_ : 1'b1;
initial RST_=1;
endmodule

//Below is a Rudimentary arbiter which gives grant when Request is
//raised and removes grant after count reaches a certain value The
//Grant is then held deasserted until Request is removed and then
//reapplied

module arb(req,gnt,clk);
input req;
input clk;
output gnt;
wire req;
wire clk;
reg lreq;//delayed req
reg gnt;
reg flag;//tocheck whether req was deasserted after gnt was removed
reg [0:7] count;
initial begin
gnt = 1;
count=0;
lreq=1;
flag=0;
end
always @ (posedge clk)begin
if(!flag) begin
	gnt=lreq;
	lreq=req;
end
else begin
	gnt=gnt;
	lreq=lreq;
end
end
always @ (posedge clk)begin
if(!req && !gnt & !flag) count = count +1;
if(count == 20 && !gnt & !flag) begin
	count = 0;
	gnt =1;
	flag=1;
end
if(req)begin
flag=0;
count=0;
gnt=1;
lreq=1;
end
end
endmodule
/*
 PCI TARGET MODULE
Description  This module has a state machine which works as a PCI target,
returning all the possible responses from a target to the master.

The register DecodeWait will Simulate fast, Medium, Slow and Bridge decode
conditions by delaying DEVSEL_ assertion from 0 to 3 clocks. In this file
this register is programmed to be 1 which is medium decode

The register PreTermCode will Simulate error conditions of retry Target
Abort  Disconnect with or without transfer conditions on the transactions
PreTermCode acquires a Non Deterministic Value (from 0 to 3) which decides
what type of termination shall occur  Our design cannot force a disconnect
condition as we are setting the value of preterm in the initial block

The register TargetWait adds wait periods of 0 to 7 clocks before assertion
of TRDY_ for every data phase


Further three registers called block registers are available 
which can be set individually as explained below

BlkDecodeWait if set DEVSEL_ is asserted on the very next clock of assertion
of FRAME_ as in the case of a fast decode device

BlkPreTerm if set will block pre-mature transaction termination condition
from  being generated on the target

BlkTrdyWait if set will remove the TRDY_ wait period

The Registers SetWrongParity ForcePerr SerrEnable ForceSerr are used to
check Parity error conditions

SetWrongParity if set will assert wrong parity for every data phase for
a Read transaction till cleared This will be helpful in checking Master
response for a wrong parity data

ForcePerr if set will force data Parity error PERR_ to master for all
Write transaction till it is cleared

SerrEnable bit if set will enable target reporting of address parity errors

ForceSerr if set will force  Parity error SERR_ to master for all Address
phases till it is cleared
*/



module TargetDevice ( CLK, RST_, ADin, ADout, CBE_, PARin, PARout, FRAME_,
        IRDY_, TRDYin_, TRDYout_, STOPin_, STOPout_, LOCK_, IDSEL,
        DEVSELin_, DEVSELout_, OE_TRDY_, OE_STOP_, OE_DEVSEL_);

input					CLK;
input					RST_;
input	[2:0]				ADin;
output	[2:0]				ADout;
input	[3:0]				CBE_;
input					PARin;
output					PARout;
input					FRAME_;
input					IRDY_;
input					TRDYin_;
output					TRDYout_;
input					STOPin_;
output					STOPout_;
input					LOCK_;
input		                        IDSEL;
input					DEVSELin_;
output					DEVSELout_;
output					OE_TRDY_;
output					OE_STOP_;
output					OE_DEVSEL_;
wire					CLK;		
wire					RST_;		
wire	[2:0]				AD;
wire	[2:0]				ADin;
wire	[2:0]				ADout;
wire    [3:0]				CBE_;
wire					PAR;		
wire					PARin;		
wire					PARout;		
wire					FRAME_;		
wire					IRDY_;		
wire					TRDY_;		
wire					TRDYin_;		
wire					TRDYout_;	
wire					STOP_;		
wire					STOPin_;		
wire					STOPout_;	
wire					LOCK_;		
wire                      		IDSEL;		
wire					DEVSEL_;	
wire					DEVSELin_;	
wire					DEVSELout_;	
wire					PERR_;		
wire					PERRin_;		
wire					PERRout_;	
wire					SERR_;          
wire					SERRin_;          
wire					SERRout_;       
reg     [2:0] rAD;
reg                              rPAR;
reg                              rTRDY_;
reg                              rSTOP_;
reg                              rDEVSEL_;
reg                              rPERR_;
reg                              rSERR_;




reg   OE_AD;
reg   OE_CBE_;
reg   OE_PAR;
reg   OE_TRDY_;
reg   OE_STOP_;
reg   OE_DEVSEL_;
reg   OE_SERR_;
reg   OE_PERR_;




`define   PciDataBusWidth  3
`define  TargetStartAddress   3'b000 //range for target address
`define  TargetEndAddress     3'b100 //decoding

assign  ADout    = ( OE_AD  && RST_) ? ( rAD ) : {`PciDataBusWidth{1'bz}};
assign  PARout   =  ( OE_PAR  && RST_) ? ( rPAR )  : 1'bz;
assign  TRDYout_   = ( OE_TRDY_   && RST_)  ? ( rTRDY_ )  : 1'bz;
assign  STOPout_   = ( OE_STOP_   && RST_)  ? ( rSTOP_ )  : 1'bz;
assign  DEVSELout_ = ( OE_DEVSEL_  && RST_)  ? ( rDEVSEL_ ) : 1'bz;
assign  PERRout_   = ( OE_PERR_   && RST_)  ? ( rPERR_ ) : 1'bz;
assign  SERRout_   =  ( OE_SERR_   && RST_)  ? ( rSERR_ ) : 1'bz;

assign  AD    = ( OE_AD  ) ?
		ADout : ADin;
assign  PAR   =  ( OE_PAR  ) ?
		PARout:PARin;
assign  TRDY_   = ( OE_TRDY_   )  ?
		TRDYout_:TRDYin_;
assign  STOP_   = ( OE_STOP_   )  ?
		STOPout_:STOPin_;
assign  DEVSEL_ = ( OE_DEVSEL_  )  ?
		DEVSELout_:DEVSELin_;
assign  PERR_   = ( OE_PERR_   )  ?
		PERRout_:PERRin_;
assign  SERR_   =  ( OE_SERR_   )  ?
		SERRout_:SERRin_;
//the registers below are to force certain error conditions
//but this part has not been verified by putting the suitable
//values
reg   SetWrongParity;   
reg   SetLockforTarget; 
reg   ForcePerr;        
reg   SerrEnable;       
                        
reg   ForceSerr;        

reg   BlkDecodeWait;   //Blocking registers for over riding 
reg   BlkPreTerm;      //contents of decode premature terminate 
reg   BlkTrdyWait;     //and waitcount registers 


reg   lFRAME_;
reg   iFRAME_;
reg   lIRDY_;
reg   lTRDY_;
reg   iTRDY_;
reg   lLOCK_;
reg   lWrite;
reg   lDEVSEL_;

reg   [2:0] MemPtr; //counts the number of Data phases completed 


reg   Hit;    //set when decode is a hit 
reg   DecodeDone;    //set when DecodeWait has counted to zero
		//after the address phase Simulates the Decode Delay 
reg   TargetAbort;//set if TargetAbort condition is true
reg   Term;//Terminate cycle with STOP if set
reg   Ready;//Internal signal indicates ready to transfer data 
                      
reg   ParityError;    //set if mismatch between Calculated Parity
                      //and PAR signal
reg   CalcParity;     
reg   CalcParAddr;    
reg   [3:0] Cmd; //Register for extracting the comand from CBE
reg   Read;           //Internal Read Write registers
reg   Write;          //get set depending on type of cycle
reg   ConfigCycle;    
reg   PerrEnable;
reg   [2:0] ReadData;

reg   [1:0] DecodeWait;//Decode delay set with this
reg   [2:0] TargetWait;//target ready time set with this
reg   [1:0] preterm;//comes up with premature termination code
reg [1:0] PreTermCode;




reg   ForceErr;      
                     

`define ForcePreTerm  0  
reg   [2:0] ForceErrAddr; 



reg [2:0]  State;
`define  IDLE   0
`define BUSY    1
`define SDATA   2
`define BACKOFF 3
`define TURNAR  4
`define ABORT   5
reg  LkState;
`define FREE 0
`define LOCKED 1
`define MemRead 'h6 //cycle defines according to PCI spec
`define MemReadLine 'hE
`define MemReadMult 'hC
`define MemWrite 'h7
`define IoWrite 'h3
`define IoRead  'h2
`define ConfigWrite 'hB
`define ConfigRead 'hA

                      
reg [2:0]  TransStartAddress; //to latch the start address 
assign SERRin_ = $ND(0,1);//dummy assignments signal values not used
assign PERRin_ = $ND(0,1);

initial begin
  State   = 0;  //Initialising all regs to benign states
//initialisation is a must for VIS 
  LkState   =  0;

  TransStartAddress = 0;
  BlkDecodeWait   = 1'b0;
  BlkPreTerm      = 1'b0;
  BlkTrdyWait     = 1'b0;
  SetWrongParity  = 1'b0;
  ForcePerr       = 1'b0;
  SerrEnable      = 1'b1;

  DecodeWait = 1;
  TargetWait = 3;
  preterm = $ND(0,1,2,3);
  PreTermCode = 0;
  SetWrongParity= 0;
  SetLockforTarget= 0;
  ForcePerr= 0;
  SerrEnable= 0;
  ForceSerr= 0;

  BlkDecodeWait= 0;
  BlkPreTerm= 0;
  BlkTrdyWait= 0;

  lFRAME_=1;
  iFRAME_=1;
  lIRDY_=1;
  lTRDY_=1;
  iTRDY_=1;
  lLOCK_=1;
  lWrite=0;
  lDEVSEL_=1;
  MemPtr = 0;
  Hit=0;            
  DecodeDone=0;     
  TargetAbort=0;
  Term=0;
  Ready=0;          
                      
  ParityError=0;    
                      
  CalcParity=0;     
  CalcParAddr=0;    
  Cmd=0;
  Read=0;           
  Write=0;          
  ConfigCycle=0;    
  PerrEnable=0;
  ReadData=0;

  State      =   `IDLE;
  LkState    =   `FREE;
  rAD        =   {`PciDataBusWidth{1'b0}};
  rPAR       =   1'b0;
  rTRDY_     =   1'b1;
  rSTOP_     =   1'b1;
  rDEVSEL_   =   1'b1;
  rPERR_     =   1'b1;
  rSERR_     =   1'b1;
  SetWrongParity  =   1'b0;
  ForcePerr       =   1'b0;
  SerrEnable      =   1'b1;
  BlkDecodeWait   =   1'b0;
  BlkPreTerm      =   1'b0;
  BlkTrdyWait     =   1'b0;
  ForceErr      =  1'b0;
  ForceErrAddr  =  3'b000;
  OE_AD            =  1'b0;
  OE_CBE_            =  1'b0;
  OE_PAR           =  1'b0;
  OE_TRDY_         =  1'b0;
  OE_STOP_         =  1'b0;
  OE_DEVSEL_       =  1'b0;
  OE_PERR_         =  1'b0;
  OE_SERR_         =  1'b0;
end

//this task is invoked whenever Address phase is seen by Target
task LoadNewTranVar;
  begin

    Cmd            = CBE_;
    TransStartAddress = AD;
    MemPtr         =  0;

    Read           =  ( (Cmd == `MemRead) || (Cmd == `IoRead) ||
                        (Cmd == `MemReadMult) || (Cmd == `MemReadLine)); 

    Write          =  ( (Cmd == `MemWrite) || (Cmd == `IoWrite)); 

    ConfigCycle    =  ( (Cmd == `ConfigRead) || (Cmd == `ConfigWrite) );

    DecodeDone     =  ((DecodeWait == 0) || BlkDecodeWait);
    Hit            =  ( ( TransStartAddress >= `TargetStartAddress ) && ( TransStartAddress <= `TargetEndAddress ) );

    if ( ForceErr && ( TransStartAddress == ForceErrAddr)) 
      PreTermCode  =  `ForcePreTerm;
    else PreTermCode  =  (! BlkPreTerm) ? preterm : 0;

    Term           =  (PreTermCode == 1) ;
    TargetAbort    =  (PreTermCode == 2) ;
    TargetAbort    =  (PreTermCode == 3) ;
    Ready          =  ((TargetWait == 0) || BlkTrdyWait);

  end
endtask



always @ ( posedge CLK ) begin
  if ( !RST_);
  else begin

    if ( (!FRAME_) && lFRAME_ ) begin
      CalcParAddr  = ^ { AD,CBE_};
    end

    if ( (!lFRAME_) && iFRAME_) begin
      if (((PAR != CalcParAddr) || ForceSerr) && SerrEnable) begin
        OE_SERR_  =   1'b1;
        rSERR_    =   1'b0;
      end
    end
    else begin
      OE_SERR_  =  1'b0;
      rSERR_    =  1'b1;
    end
  end
end


always @ ( posedge CLK ) begin
  if (!RST_);
  else begin


    if (!IRDY_ && (lWrite || Write)) begin
       CalcParity = ^ { AD,CBE_};
    end


    if ( !lIRDY_ && lWrite && PerrEnable && (!lDEVSEL_ || !rDEVSEL_) ) begin
       OE_PERR_  = 1'b1;
       if ( (PAR != CalcParity) || ForcePerr) begin
         rPERR_ =  1'b0;
       end
       else rPERR_ =  1'b1;
    end  
    else rPERR_    =  1'b1;

    if (lIRDY_ && rDEVSEL_) OE_PERR_  = 1'b0;

    if (Read && !iTRDY_ && !PERR_ && !OE_PERR_) begin
    end

   if ( Read && !TRDY_) begin
      if (SetWrongParity ) rPAR  =  ! (^ { rAD,CBE_}); 
      else  rPAR =   ^ { rAD,CBE_};
   end

   if (Write && !rDEVSEL_ && !IRDY_ && (!rTRDY_ || !rSTOP_)) PerrEnable = 1'b1;
   else if ( lDEVSEL_ &&  lIRDY_) PerrEnable = 1'b0;

    lTRDY_   = rTRDY_;
    iTRDY_   = lTRDY_;
    lIRDY_   = IRDY_;
    lFRAME_  = FRAME_;
    iFRAME_  = lFRAME_;
    lIRDY_   = IRDY_;
    OE_PAR   = OE_AD;
    lWrite   = Write;
    lDEVSEL_ = rDEVSEL_;
  end
end







always @  (posedge CLK)
if (! RST_)  begin
  State      =   `IDLE;
  LkState    =   `FREE;
  rAD        =   {`PciDataBusWidth{1'b0}};
  rPAR       =   1'b0;
  rTRDY_     =   1'b1;
  rSTOP_     =   1'b1;
  rDEVSEL_   =   1'b1;
  rPERR_     =   1'b1;
  rSERR_     =   1'b1;
  SetWrongParity  =   1'b0;
  ForcePerr       =   1'b0;
  SerrEnable      =   1'b1;
  BlkDecodeWait   =   1'b0;
  BlkPreTerm      =   1'b0;
  BlkTrdyWait     =   1'b0;
  ForceErr      =  1'b0;
  ForceErrAddr  =  3'b000;
  OE_AD            =  1'b0;
  OE_PAR           =  1'b0;
  OE_TRDY_         =  1'b0;
  OE_STOP_         =  1'b0;
  OE_DEVSEL_       =  1'b0;
  OE_PERR_         =  1'b0;
  OE_SERR_         =  1'b0;
end

else begin

  case ( State )

    `IDLE     : begin
      if ( (! FRAME_) && lFRAME_ ) begin
         LoadNewTranVar;
        if (!(( AD >= `TargetStartAddress) && (AD <= `TargetEndAddress)));
         else begin
           if ( (! Read) && (! Write) && (!ConfigCycle)) begin 
           end

           else if ( ConfigCycle );
           else if (! DecodeDone)  begin
             if ( DecodeWait <=  3 ) begin
               State   =  `BUSY;
               lLOCK_  =  LOCK_;
             end
           end

           else if ( TargetAbort ) begin
             OE_STOP_    =  1'b1;
             OE_DEVSEL_  =  1'b1;
             OE_TRDY_    =  1'b1;
             lLOCK_      =  LOCK_;
             rDEVSEL_    =  1'b0;
             rTRDY_      =  1'b1;
             rSTOP_      =  1'b1;

             State       =  `ABORT;
           end

           else if ( ( !Term || (Term && Ready)) && 
                     ( LOCK_ || (LkState == `FREE))) begin
             State       = `SDATA;

             OE_STOP_    =  1'b1;
             OE_DEVSEL_  =  1'b1;
             OE_TRDY_    =  1'b1;
             lLOCK_      =  LOCK_;

             if (Read) begin
              rAD        =   3'b101;
              end

             if ( Term && Ready && Write ) rSTOP_  =  1'b0;
             else rSTOP_  =  1'b1;
      
             rDEVSEL_     =   1'b0;
 
             if ( Ready && Write)  rTRDY_  =  1'b0;
             else rTRDY_  =  1'b1; 
           end




           else if ( Term   || ((LkState == `LOCKED) && !LOCK_)) begin
             State     = `BACKOFF;

             OE_STOP_    =  1'b1;
             OE_DEVSEL_  =  1'b1;
             OE_TRDY_    =  1'b1;
             rSTOP_      =  1'b0;
             rDEVSEL_    =  1'b0;
             rTRDY_      =  1'b1;
           end
         end
       end
    end






    `BUSY     : begin
      DecodeWait   =  DecodeWait - 1;
      DecodeDone   =  ((DecodeWait == 0) || BlkDecodeWait) ;
      TargetWait   =  !Ready ? (TargetWait - 1):0;
      Ready        =  ((TargetWait == 0) || BlkTrdyWait);      

      if ( !DecodeDone);
      else if ( FRAME_ && IRDY_) State  =  `IDLE;

      else if ( TargetAbort ) begin
        OE_STOP_    =  1'b1;
        OE_DEVSEL_  =  1'b1;
        OE_TRDY_    =  1'b1;
        lLOCK_      =  LOCK_;
        rDEVSEL_    =  1'b0;
        rTRDY_      =  1'b1;
        rSTOP_      =  1'b1;
        State       =  `ABORT;
      end

      else if ((!Term || (Term && Ready)) && (lLOCK_ ||
                 (LkState == `FREE))) begin
        State       = `SDATA;

        OE_STOP_    =  1'b1;
        OE_DEVSEL_  =  1'b1;
        OE_TRDY_    =  1'b1;
        lLOCK_      =  LOCK_;

        if (Read) begin
        rAD        =   3'b101;
          OE_AD      =   1'b1;
        end

        if ( Term && Ready ) begin
          rSTOP_     =  1'b0;
        end
        else rSTOP_  =  1'b1;

        rDEVSEL_     =  1'b0;

        if ( Ready )  begin
          rTRDY_     =  1'b0;
        end
        else rTRDY_  =  1'b1;
      end




      else if ( Term   || ((LkState == `LOCKED) && !lLOCK_ )) begin
        State     = `BACKOFF;

        OE_STOP_    =  1'b1;
        OE_DEVSEL_  =  1'b1;
        OE_TRDY_    =  1'b1;
        rSTOP_      =  1'b0;
        rDEVSEL_    =  1'b0;
        rTRDY_      =  1'b1;
      end
    end





         
    `SDATA    : begin
     
      if ( !TRDY_ && !IRDY_ ) begin
        if (Write) begin
        end
        
        else if ( Read && !FRAME_) begin
        rAD       =   3'b101;
        end
        if (Read) begin
        end

        MemPtr   = MemPtr + 1;
 
        if (!FRAME_ && STOP_) begin
          if ( ForceErr) begin         

             if (Read && ( (TransStartAddress + ( (MemPtr-1)))
                 == ForceErrAddr)) PreTermCode  =   `ForcePreTerm;

             else if (Write && ( (TransStartAddress + (MemPtr )) 
               == ForceErrAddr)) PreTermCode  =   `ForcePreTerm;

             else PreTermCode = !BlkPreTerm ? preterm : 0;
          end       

          else PreTermCode  = !BlkPreTerm ? preterm : 0;

           if ((Read  && (TransStartAddress + ((MemPtr-1)))) > 
            `TargetEndAddress) begin
            PreTermCode = 2;
          end
          else if ((Write && (TransStartAddress + (MemPtr ))) > 
            `TargetEndAddress) begin
            PreTermCode = 2;
          end
          Term         = (PreTermCode == 1)  ? 1'b1 : 1'b0;
          TargetAbort  = (PreTermCode == 2) ? 1'b1 : 1'b0;
          TargetAbort  = (PreTermCode == 3) ? 1'b1 : 1'b0;
       
          if ((Read && ((TransStartAddress + ((MemPtr-1)))) > 
            `TargetEndAddress)) begin
            TargetWait = 5;
          end
          else if ((Write && ((TransStartAddress + (MemPtr))) > 
            `TargetEndAddress)) begin
            TargetWait = 5;
          end
          Ready        = ((TargetWait == 0) || BlkTrdyWait) ?  1'b1 : 1'b0 ;
          if ( Term )  rSTOP_   = 1'b0;

          if (Ready &&  !TargetAbort) rTRDY_ = 1'b0;
          else rTRDY_ = 1'b1;
          if ( TargetAbort ) begin
            if (Ready) begin
              rDEVSEL_    =  1'b1;
              rSTOP_      =  1'b0;
              State       =  `BACKOFF;
            end
            else State    =  `ABORT;
          end
        end
        else if (FRAME_) begin
          State       =  `TURNAR;
          rTRDY_      =  1'b1;
          OE_AD       =  1'b0;
          rSTOP_      =  1'b1;
          rDEVSEL_    =  1'b1;
        end
        else if (!FRAME_ && !STOP_) begin
          State       =  `BACKOFF;
          rTRDY_      =  1'b1;

        end                          
      end

      else if ( !STOP_ && !IRDY_) begin
        if (FRAME_) begin
          State       =  `TURNAR;
          rTRDY_      =  1'b1;
          OE_AD       =  1'b0;
          rSTOP_      =  1'b1;
          rDEVSEL_    =  1'b1;
        end
        else  begin
          State       =  `BACKOFF;
          rTRDY_      =  1'b1;

        end                        
      end

      else begin
        TargetWait   = !Ready ? (TargetWait - 1):0;
        Ready        = ((TargetWait == 0) || BlkTrdyWait) ?  1'b1 : 1'b0 ;
        if (Term)  rSTOP_ = 1'b0;
        if (Ready && STOP_) rTRDY_ = 1'b0;  
        if (Read)  OE_AD  = 1'b1;
      end
    end


    `TURNAR   : begin
      
      if ( FRAME_) begin
        State       = `IDLE;
        OE_TRDY_    = 1'b0;
        OE_STOP_    = 1'b0;
        OE_DEVSEL_  = 1'b0;
        OE_AD       = 1'b0;
      end
      else if ( (! FRAME_) && lFRAME_ ) begin
        LoadNewTranVar;
        if (! Hit ) begin
          OE_TRDY_    = 1'b0;
          OE_STOP_    = 1'b0;
          OE_DEVSEL_  = 1'b0;
          OE_AD       = 1'b0;
        end

        else begin
          if ( (! Read) && (! Write) && (!ConfigCycle) ) begin
          end
          else if (! DecodeDone)  begin
            if ( DecodeWait <  4 ) begin
              State       =  `BUSY;
              lLOCK_      =  LOCK_;
              OE_TRDY_    =  1'b0;
              OE_STOP_    =  1'b0;
              OE_DEVSEL_  =  1'b0;
              OE_AD       =  1'b0;
            end
          end

          else if ( TargetAbort ) begin
            lLOCK_      =  LOCK_;
            rDEVSEL_    =  1'b0;
            rTRDY_      =  1'b1;
            rSTOP_      =  1'b1;
            OE_AD       =  1'b0;

            State       =  `ABORT;
          end

          else if ( ( !Term || (Term && Ready)) &&
                    ( LOCK_ || (LkState == `FREE))) begin
            State       = `SDATA;

            lLOCK_      =  LOCK_;
            OE_AD       =  1'b0;

            if (Read) begin
            rAD       =   3'b101;
            end

            if ( Term && Ready && Write ) rSTOP_  =  1'b0;
            else rSTOP_  =  1'b1;

            rDEVSEL_     =  1'b0;

            if ( Ready && Write)  rTRDY_  =  1'b0;
            else rTRDY_  =  1'b1;
          end


          else if ( Term || ((LkState == `LOCKED) && !LOCK_)) begin
            State     = `BACKOFF;

            rSTOP_      =  1'b0;
            rDEVSEL_    =  1'b0;
            rTRDY_      =  1'b1;
            OE_AD       =  1'b0;
          end
        end
      end
    end

    `BACKOFF  : begin
      
      if ( FRAME_) begin 
        State       =  `TURNAR;
        rTRDY_      =  1'b1;
        rSTOP_      =  1'b1;
        rDEVSEL_    =  1'b1;
        OE_AD       =  1'b0;
      end
    end

    `ABORT   : begin
      TargetWait   = !Ready ? (TargetWait - 1):0;
      Ready        = ((TargetWait == 0) || BlkTrdyWait) ?  1'b1 : 1'b0 ;
      if ( Ready) begin
        if (FRAME_ && IRDY_) begin
          State    =  `TURNAR;
          rTRDY_   =  1'b1;
          rSTOP_   =  1'b1;
          rDEVSEL_ =  1'b1;
          OE_AD    =  1'b0;
        end
        else  begin
          State      =  `BACKOFF;
          rTRDY_     =  1'b1;
          rSTOP_     =  1'b0;
          rDEVSEL_   =  1'b1;
        end
      end
      else if (Read) OE_AD = 1'b1;
    end

    default : begin
    end
  endcase
end

always @  (posedge CLK)
if (! RST_) LkState = `FREE;
else begin

  case ( LkState )

    `FREE     : begin
      if ( !FRAME_ && lFRAME_) begin
        if (( AD >= `TargetStartAddress) && (AD <= `TargetEndAddress)) begin
          if ( LOCK_ && ((State == `IDLE) || (State == `TURNAR))) begin 
            LkState = `LOCKED;
          end
        end
      end 
    end
 
    `LOCKED   : begin
 
      if ( FRAME_ && LOCK_ ) begin
         LkState = `FREE;
      end
    end

    default : begin
    end
  endcase
end

endmodule
 
/*
 PCI MASTER MODULE
Description  This module has a PCI master state machine controlled
by some Registers for starting a transaction on the PCI bus.  By
keeping these registers NonDeterminate we can assume the start of
a transaction
*/
/*
the TaskReq register being non-zero makes the master to setup a grant
then the Master initiates the transaction based on the contents of the
transaction registers wheb the Trigger bit is found Set
This implies that the start of the transaction presupposes nonzero
transrequest and set trigger bit 
*/
/*
The Master state machine upon seeing the Trigger bit set will clear the Grant
and  start the transaction by arbitrating for the bus and on getting a bus
grant performs the transaction. Once the transaction is completed with or
without a pre- mature termination the status is loaded in the TransStatus
register and TransDone flag is set by the master.
*/

module MasterDevice( CLK, RST_, ADin, ADout, CBEin_, CBEout_, PARin,
        PARout, FRAMEin_, FRAMEout_, IRDYin_, IRDYout_, REQ_, GNT_,
        TRDY_, STOP_, LOCKin_, LOCKout_, IDSEL, DEVSEL_, OE_FRAME_,
	OE_IRDY_, OE_LOCK_);
input					CLK;
input					RST_;
input	[2:0]				ADin;
output	[2:0]				ADout;
input	[3:0]				CBEin_;
output	[3:0]				CBEout_;
input					PARin;
output					PARout;
input					FRAMEin_;
output					FRAMEout_;
input					IRDYin_;
output					IRDYout_;
input					TRDY_;
input					STOP_;
input					LOCKin_;
output					LOCKout_;
input					DEVSEL_;
input                                   GNT_;
output                                  REQ_;
output  [3:0]                           IDSEL;
output					OE_FRAME_;
output					OE_IRDY_;
output					OE_LOCK_;


wire					CLK;      
wire					RST_;     
wire                                    REQ_;     
wire                                    GNT_;     
wire	[2:0]				AD;
wire	[2:0]				ADin;
wire	[2:0]				ADout;
wire	[3:0]				CBE_;
wire	[3:0]				CBEin_;
wire	[3:0]				CBEout_;
wire					PAR;
wire					PARin;
wire					PARout;
wire					FRAME_;
wire					FRAMEin_;
wire					FRAMEout_;
wire					IRDY_;
wire					IRDYin_;
wire					IRDYout_;
wire					TRDY_;
wire					STOP_;
wire					LOCK_;
wire					LOCKin_;
wire					LOCKout_;
wire					DEVSEL_;
wire					PERR_;
wire					PERRin_;
wire					PERRout_;
wire                                    SERR_;
wire                                    SERRin_;
wire                                    SERRout_;



reg     [2:0] 			rAD;
reg     [3:0]  			rCBE_;
reg                              rPAR;
reg                              rIDSEL;

reg                              rFRAME_;
reg                              rIRDY_;
reg                              rLOCK_;
reg                              rREQ_;
reg                              rSERR_;
reg                              rPERR_;




reg     OE_AD;
reg     OE_CBE_;
reg     OE_PAR;
reg     OE_FRAME_;
reg     OE_IRDY_;
reg     OE_LOCK_;
reg     OE_IDSEL;
reg     OE_REQ_;
reg     OE_SERR_;
reg     OE_PERR_;
assign SERRin_ = $ND(0,1);
assign PERRin_ = $ND(0,1);


assign    ADout   = ( OE_AD  && RST_) ? ( rAD   ) : {3{1'bz}};

assign  CBEout_ = ( OE_CBE_ && RST_) ? ( rCBE_ ) : {4{1'bz}};
assign  PARout   = ( OE_PAR  && RST_) ? ( rPAR  )  : 1'bz;
assign  FRAMEout_  = ( OE_FRAME_  && RST_)  ? ( rFRAME_ ) : 1'bz;
assign  IRDYout_   = ( OE_IRDY_   && RST_)  ? ( rIRDY_  )  : 1'bz;
assign  LOCKout_   = ( OE_LOCK_   && RST_)  ? ( rLOCK_  )  : 1'bz;
assign  IDSEL   = ( OE_IDSEL   && RST_)  ? ( rIDSEL  )  : {1{1'bz}};
assign  REQ_    = ( OE_REQ_    && RST_)  ? ( rREQ_  )  : 1'bz;
assign  PERRout_   = ( OE_PERR_   && RST_)  ?  ( rPERR_ ) : 1'bz;
assign  SERRout_   =  ( OE_SERR_   && RST_)  ? ( rSERR_ ) : 1'b1;


assign    AD   = ( OE_AD  ) ? ADout : ADin;
assign  CBE_ = ( OE_CBE_ ) ? CBEout_ : CBEin_;    
assign  PAR   = ( OE_PAR  ) ? PARout : PARin;    
assign  FRAME_  = ( OE_FRAME_  )  ? FRAMEout_ : FRAMEin_;    
assign  IRDY_   = ( OE_IRDY_   )  ? IRDYout_ : IRDYin_;    
assign  LOCK_   = ( OE_LOCK_   )  ? LOCKout_ : LOCKin_;    
assign  PERR_   = ( OE_PERR_   )  ?  PERRout_ : PERRin_;    
assign  SERR_   =  ( OE_SERR_   )  ? SERRout_ : SERRin_;    

reg   BlkIrdyWait;     //block Initiator Wait if set
reg   SetWrongParity;  
reg   ForcePerr;      





reg   [7:0] TaskReq;  //If any bit in task request is set
		      //it will be given a grant in TaskGnt 
reg   [7:0] TaskGnt;   
reg   Trigger;        //If task request exists and Trigger
		      //is set then a Bus transaction shall
		      //commence starting with the arbitration 
/*the folowing registers have the transaction parameters*/
reg   [3:0]  CycleType;     //which cycle type will be issued 
reg   [2:0] StartAddress;   //what is the start address 
reg   [3:0]  StartBE_;       
reg   [3:0]  LastBE_;        
reg   [2:0]  DataCount;     //number of data phases to perform 
reg   [7:0]  TransStatus;   //Status returned after the transaction 
reg   [2:0]  TransCount;    //number of transactions done 
reg   [2:0] WriteData0;  
reg   [2:0] WriteData1;  
reg   [2:0] ReadDataReg0;   
reg   [2:0] ReadDataReg1;   
reg   TransDone;            //set by master to indicate end of transaction
	 
reg   LockTarget;           //should target be locked 
reg   SameTarget;           //access is to the same target 
reg   LockFailed;            
reg   ReleaseLock;          //free the target from lock 
reg   FastBackTrans;        //whether a Fast Back to Back 
reg   [2:0] FbbAddress;     //transaction is required and the details
reg   [3:0]  FbbCycleType;   
reg   [2:0] WriteFbbDataReg;  
reg   [2:0] ReadFbbDataReg;   


reg   lTRDY_;
reg   lIRDY_;
reg   iIRDY_;
reg   lLOCK_;
reg   lFRAME_;

`define   MemRead          'h 6
`define   IoRead	'h 2
`define   ConfigRead	'h A
`define   ConfigWrite	'h B
`define   MemWrite	'h 7
`define   IoWrite	'h 3
`define   Success          'h 00
`define   Retry            'h 01
`define   TargetAbort      'h 02
`define   DisConnect       'h 03 
`define   DeviceTimeOut    'h 04
`define   MasterPreempted  'h 05
`define   MasterBusy       'h 06
`define   LockFailed       'h 07
`define   Incomplete       'h 08
`define   FastBackFailed   'h 09
`define   LockOnFbb        'h 0A
`define   DeviceReset      'h FF
`define    IDLE         0 
`define    ADDR         1
`define    MDATA        2
`define    STAR         3
`define    TURNAR       4
`define    DRBUS        5
`define    FREE         0
`define    BUSY         1
reg   [2:0] WriteDataReg[0:9];  
reg   [2:0] ReadDataReg[0:9];  
reg   RunBacktoBack;
reg   OwnLock;      
reg   Request;      
reg   Ready;        
reg   DevTimeOut;  
reg   CalcParity;   
reg   [3:0]  Cmd;
reg   Read;
reg   Write;
reg   [3:0] ByteEnable;
reg IdselCode;
reg [2:0] AddressOffset;
reg [3:0] State;
reg LkState;
reg [2:0]  InitiatorWait; 
reg [2:0] DevSelTime;
reg [3:0] TransNum;
reg [2:0] temp1;
initial begin
State     =   0;  
LkState   =   0; 
ByteEnable =  4'b0000;
DataCount = $ND(0,1,2,3,4,5,6,7);
TransNum  = 0;
TransStatus = 'hFF;
TaskGnt   =   8'b0000_0000;
TransDone =   1'b0;
IdselCode =   4'b0000;  
TaskReq   =   $ND (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 
14, 15, 16, 17,
18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33,
34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65,
66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81,
82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97,
98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110,
111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123,
124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 
137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 
150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 
163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 
176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 
189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 
202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 
215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 
228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 
241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255);
LockFailed =  1'b0; 
RunBacktoBack = 1'b0;
OwnLock    =  1'b0;
InitiatorWait  =  1;
temp1          =  4;
Trigger        =  $ND(0,1);
lTRDY_=1;
lIRDY_=1;
iIRDY_=1;
lLOCK_=1;
lFRAME_=1;
rFRAME_ =1;
Read    =0;
Ready    =0;
Request =0;
DevTimeOut =0;
CalcParity=0;
Cmd = 0;
Write = 0;
WriteDataReg[0]=0;
WriteDataReg[1]=1;
WriteDataReg[2]=0;
WriteDataReg[3]=2;
WriteDataReg[4]=0;
WriteDataReg[5]=3;
WriteDataReg[6]=0;
WriteDataReg[7]=4;
WriteDataReg[8]=0;
WriteDataReg[9]=5;
ReadDataReg[0]=0;
ReadDataReg[1]=3;
ReadDataReg[2]=0;
ReadDataReg[3]=4;
ReadDataReg[4]=0;
ReadDataReg[5]=5;
ReadDataReg[6]=0;
ReadDataReg[7]=6;
ReadDataReg[8]=0;
ReadDataReg[9]=7;
ByteEnable =0;
IdselCode =0;
AddressOffset =0;
BlkIrdyWait=0; 
SetWrongParity=0;
ForcePerr=0;    
CycleType= `MemRead; 
StartAddress=$ND(0,1,2,3,4,5,6,7);
StartBE_= 'b 1010;
LastBE_= 'b 0101;
TransCount=0;  
WriteData0=0; 
WriteData1=0;
ReadDataReg0=0;
ReadDataReg1=0;
TransDone=$ND(0,1);         
LockTarget= 0;
SameTarget= 0;
ReleaseLock= 0;
FastBackTrans= 0;
FbbAddress=0;
FbbCycleType= `MemWrite;
WriteFbbDataReg=0;
ReadFbbDataReg=0; 
State =0;
LkState =0;
InitiatorWait =0; 
DevSelTime=0;
TransNum=0;
rAD=0;
rCBE_=0;
rPAR=0;
rIDSEL=0;
rFRAME_=1;
rIRDY_=1;
rLOCK_=1;
rREQ_=1;
rSERR_=1;
rPERR_=1;


  BlkIrdyWait      =   1'b0;
  SetWrongParity   =   1'b0;
  ForcePerr        =   1'b0;
  OE_FRAME_        =  1'b0;
  OE_AD            =  1'b0;
  OE_CBE_          =  1'b0;
  OE_PAR           =  1'b0;
  OE_IRDY_         =  1'b0;
  OE_LOCK_         =  1'b0;
  OE_IDSEL         =  1'b0;
  OE_REQ_          =  1'b0;
  OE_SERR_         =  1'b0;
  OE_PERR_         =  1'b0;

end

integer i;
always @ ( posedge CLK ) begin
  if ( !RST_); 
  else begin
    if ( TransDone && !Trigger) begin
      TransNum = TransNum + 1;
      TransDone  =  1'b0;
    end
    else if (Trigger || Request || TransDone || (TaskGnt != 8'b0000_0000)); 
    else for ( i = 0;  i <= 7; i = i+1) begin 
      TaskGnt[i] = TaskReq[i];
    end
  end
end

always @ ( posedge CLK ) begin
  if ( !RST_);
  else begin

    if (((State == `IDLE) || (State == `DRBUS)) && Trigger && !TransDone 
         && !Request) begin
      if ( OwnLock  && LockTarget && !SameTarget) begin
        LockFailed      =   1'b1;
        TaskGnt         =   8'b0000_0000;
        TransStatus     =   `LockFailed;
        TransCount      =   3'b000;
        TransDone       =   1'b1;
      end   
      else if (( LockTarget || SameTarget) && FastBackTrans) begin
        if ( !SameTarget) LockFailed      =   1'b1;
        TaskGnt         =   8'b0000_0000;
        TransStatus     =   `LockOnFbb;
        TransCount      =   3'b000;
        TransDone       =   1'b1;
      end
      else begin 
        rREQ_           =   1'b0;
        Request         =   1'b1;
        TaskGnt         =   8'b0000_0000;
        LockFailed      =   1'b0;
        TransStatus     =   `Incomplete;
        RunBacktoBack   =   1'b0;
        ByteEnable      =   4'b0000;
      end
    end
    else if (!Request) rREQ_ =   1'b1;
  end
end



task LoadTransVar;
  begin
    AddressOffset   = 0;
    Read           = ( (CycleType == `MemRead) || (CycleType == `IoRead) ||
                       (CycleType == `ConfigRead) );
    Write          = ( (CycleType == `MemWrite) || (CycleType == `IoWrite) ||
                       (CycleType == `ConfigWrite) );
    IdselCode = StartAddress[2];
 
/*    InitiatorWait  = $ND(0,1,2,3,4,5,6,7);*/
    Ready          = ((InitiatorWait == 0) || BlkIrdyWait);
  end
endtask


always @ ( posedge CLK ) begin
  if ( !RST_);
  else begin
    if ((!lFRAME_ || !TRDY_) && Read) begin
       CalcParity = ^ { AD,rCBE_};
    end

    if ( !lTRDY_ && Read ) begin
       OE_PERR_  = 1'b1;
       if ( (PAR != CalcParity) || ForcePerr) begin
         rPERR_ =   1'b0;
       end  
       else rPERR_ =   1'b1;
    end
    else rPERR_    =   1'b1;

    if (lTRDY_ && DEVSEL_) OE_PERR_ = 1'b0;

    if (Write && !iIRDY_ && !PERR_) begin
    end 





    if (SetWrongParity) rPAR  =   !(^ {rAD,rCBE_});
    else  rPAR    =   ^ { rAD,rCBE_};

    OE_REQ_  =   1'b1;
    lTRDY_   =   TRDY_;
    lIRDY_   =   rIRDY_;
    iIRDY_   =   lIRDY_;
    OE_PAR   =   OE_AD;
    lFRAME_  =   rFRAME_;

    if ( Request ) begin
      ReadDataReg0      =   ReadDataReg[0];
      ReadDataReg1      =   ReadDataReg[1];
      WriteDataReg[0]   =   WriteData0; 
      WriteDataReg[1]   =   WriteData1;
/*
      WriteDataReg[2]   =   WriteData0; 
      WriteDataReg[3]   =   WriteData0; 
      WriteDataReg[4]   =   WriteData0; 
      WriteDataReg[5]   =   WriteData0; 
      WriteDataReg[6]   =   WriteData1;
      WriteDataReg[7]   =   WriteData1;
      WriteDataReg[8]   =   WriteData1;
      WriteDataReg[9]   =   WriteData1;
*/
    end
  end
end



always @ (posedge CLK )

if (! RST_)  begin

  if ( Request ) begin
    TransDone       = 1'b1;
    TransStatus     = `DeviceReset;  
    Request         = 1'b0;
  end

  State            = `IDLE;
  LkState          = `FREE;
  TransNum         = 0;

  rAD              = {8{1'b0}};
  rCBE_            = {4{1'b0}};
  rPAR             = 1'b0;

  rFRAME_          = 1'b1;
  rIRDY_           = 1'b1;
  rLOCK_           = 1'b1;
  rIDSEL           = 1'b0;
  rPERR_           = 1'b1;
  rSERR_           = 1'b1;
  rREQ_            = 1'b1;
  TaskGnt          = 8'b0000_0000;
  IdselCode        = 1'b0;
  LockFailed       = 1'b0;
  OwnLock          = 1'b0;
  RunBacktoBack    = 1'b0;
  AddressOffset    = 3'b000;
  Request          = 1'b0;
  TransCount       = 3'b000;
  SetWrongParity   = 1'b0;
  ForcePerr        = 1'b0;

  OE_FRAME_        = 1'b0;
  OE_AD            = 1'b0;
  OE_CBE_          = 1'b0;
  OE_PAR           = 1'b0;
  OE_IRDY_         = 1'b0;
  OE_LOCK_         = 1'b0;
  OE_IDSEL         = 1'b0;
  OE_REQ_          = 1'b0;
  OE_SERR_         = 1'b0;
  OE_PERR_         = 1'b0;

end

else begin

  case ( State )

    `IDLE     : begin
     
      if ( FRAME_ && IRDY_ && Request & !GNT_) begin

        if ( LockTarget &&  !OwnLock && !LOCK_) begin
           LockTarget   =   1'b0;
           LockFailed   =   1'b1;
           TransStatus  =   `LockFailed;
           TransCount   =   3'b000;
           Request      =   1'b0;
           TransDone    =   1'b1;
        end
        else begin
          LoadTransVar;
          rAD          =   StartAddress;
          rCBE_        =   CycleType;
          if ( CycleType[3:1] == 3'b101 ) begin
            rIDSEL     =  IdselCode;
            OE_IDSEL  = 1'b1; 
          end
          rFRAME_      =   1'b0;
          OE_AD        =   1'b1;
          OE_FRAME_    =   1'b1;
          OE_CBE_      =   1'b1;
          if ( SameTarget || LockTarget) begin
            OE_LOCK_    = 1'b1;
            rLOCK_      = 1'b1;
          end
          State     = `ADDR; 
        end
      end
      else if ( !Request && !GNT_ && FRAME_ && IRDY_) begin
        rAD      =   3'b010;
        rCBE_    =   4'b1111;
        OE_AD    =   1'b1;
        OE_CBE_  =   1'b1;
        State    =   `DRBUS;  
      end
    end


 
    `ADDR     : begin

/*      temp1          =  $ND(0,1,2,3);*/
      DevSelTime     = temp1 ; 
      DevTimeOut     = (DevSelTime == 0);
    
      if ( RunBacktoBack) begin
         rCBE_ =    4'b0000;
         if (FbbCycleType[1:0] == 2'b10) OE_AD = 1'b0;
         else begin
           rAD     =   WriteFbbDataReg;
         end
         rIRDY_    =  1'b0;         
         rFRAME_   =  1'b1;
      end
      else begin
        OE_IRDY_   =  1'b1;
        rCBE_      =  StartBE_;
        if (( DataCount == 1) && Ready) rFRAME_  =  1'b1;
        if (Ready) rIRDY_ =  1'b0;
        else rIRDY_  =  1'b1;
        if (Read) begin
          OE_AD  = 1'b0;
          AddressOffset  =  AddressOffset + 1;
        end
        else begin
          rAD   =  WriteDataReg[AddressOffset]; 
          AddressOffset  =  AddressOffset + 1;
        end  
      end
      if (LockTarget || SameTarget) begin
        rLOCK_     =   1'b0;
      end
      rIDSEL       =   1'b0;
      OE_IDSEL     =  1'b0;
      State        =  `MDATA;
    end



    `MDATA    : begin

      if (!FRAME_ || ( FRAME_ && TRDY_ && STOP_ && 
                       !DevTimeOut && !RunBacktoBack)) begin
        if (DEVSEL_ && STOP_) begin
          DevSelTime   = !DevTimeOut ? (DevSelTime - 1):0;
          DevTimeOut   = (DevSelTime == 0);
          if (DevTimeOut) begin 
            TransStatus = `DeviceTimeOut;
            if (LockTarget || (OwnLock && SameTarget)) begin
              LockFailed  =  1'b1;
              rLOCK_     =  1'b1;
            end
            if (!rFRAME_) begin
              rFRAME_     =    1'b1;
              rIRDY_      =    1'b0;
            end
            else begin
              if ( ReleaseLock ||  LockFailed) begin
                rLOCK_     =  1'b1;
                OwnLock    =  1'b0;
              end
              else if ( LockTarget && !LockFailed) OwnLock  = 1'b1;

              TransCount  =  AddressOffset - 1;
              OE_FRAME_   =  1'b0;   
              rIRDY_      =  1'b1;
              OE_AD       =  1'b0;
              OE_CBE_     =  1'b0;
              rREQ_       =  1'b1;
              State       =  `STAR;
            end
          end
          else begin 
            InitiatorWait   = !Ready ? (InitiatorWait - 1):0;
            Ready           = ((InitiatorWait == 0) || BlkIrdyWait);
            if (Ready) rIRDY_  =  1'b0;
            if ((AddressOffset == DataCount) && Ready) rFRAME_ =  1'b1;
          end
        end   
        else if ( !TRDY_ && !IRDY_) begin
          if (LockTarget || SameTarget) LockFailed = 1'b0;
          if (Read) begin
            ReadDataReg[AddressOffset -1] = AD; /*non blocking removed for vl2mv*/
          end   
          if (Write) begin
            rAD     =   WriteDataReg[AddressOffset]; 
            if ( AddressOffset == (DataCount - 1)) ByteEnable = LastBE_;
          end
          
          AddressOffset  =  AddressOffset + 1;
/*          InitiatorWait  = $ND(0,1,2,3,4,5,6,7);*/
          Ready          = ((InitiatorWait == 0) || BlkIrdyWait);
          if (AddressOffset == DataCount) rCBE_ =  LastBE_;
          else rCBE_  =  ByteEnable;
          if (Ready) rIRDY_ =  1'b0;
          else rIRDY_  =   1'b1;
          if (((AddressOffset == DataCount) || GNT_) && Ready) begin
            rFRAME_ =  1'b1;
          end
          if (!STOP_ && Ready && (AddressOffset > 1)) begin
            rFRAME_     =  1'b1;
            TransStatus = `DisConnect;
            LockFailed  = 1'b0;
          end
          if (!STOP_ && Ready && (AddressOffset == 1)) begin
            rFRAME_     =  1'b1;
            TransStatus = `Retry;
            LockFailed  = 1'b0;
          end
        end
        else begin
          InitiatorWait   = !Ready ? (InitiatorWait - 1):0;
          Ready           = ((InitiatorWait == 0) || BlkIrdyWait);
          if (Ready) rIRDY_  =  1'b0;
          if ((AddressOffset == DataCount) && Ready) 
             rFRAME_ =  1'b1;

          if (!STOP_ && Ready ) begin
              rFRAME_  =  1'b1;
              if (!DEVSEL_ && (AddressOffset > 1)) TransStatus = `DisConnect;
              else if (!DEVSEL_ && (AddressOffset == 1)) TransStatus = `Retry;
              else begin 
                TransStatus  =  `TargetAbort;
                LockFailed   =  1'b1;
                rLOCK_       =  1'b1;
              end
          end
        end
      end

      else if (Request && !GNT_ && FRAME_ && !TRDY_ && STOP_ && Write &&
           FastBackTrans && !(LockTarget || SameTarget) && !RunBacktoBack) begin
        RunBacktoBack =  1'b1;
        TransStatus   =  `Success;
        TransCount    =  AddressOffset;
        rIRDY_        =   1'b1;
        rAD       =   FbbAddress;
        rCBE_     =   FbbCycleType;
        rFRAME_   =   1'b0;
        IdselCode = FbbAddress[2];

        State     =   `ADDR;
        if ( FbbCycleType[3:2] == 2'b10 ) begin
          rIDSEL    =  IdselCode;
          OE_IDSEL  = 1'b1;  

        end
        State     = `ADDR;
      end  

      else if ((FRAME_ && !STOP_) || (FRAME_ && DevTimeOut)) begin
        if (!TRDY_) begin
          TransStatus = `DisConnect;
          if (LockTarget || SameTarget) LockFailed = 1'b0;
          if (!RunBacktoBack) begin
             if (Read)  ReadDataReg[AddressOffset -1] = AD; 
             AddressOffset = AddressOffset +1;
          end
          else if (RunBacktoBack && (FbbCycleType[1:0] == 2'b10)) 
             ReadFbbDataReg = AD;
        end   
        else if ( AddressOffset == 1 && !DevTimeOut && !DEVSEL_) begin
          TransStatus = `Retry;
          if (!SameTarget) LockFailed  = 1'b1; 
        end
        else if ( RunBacktoBack && TRDY_) begin
          TransStatus = `FastBackFailed;
        end
        else if (DEVSEL_ && !DevTimeOut) begin
          TransStatus  =  `TargetAbort;
          LockFailed   =  1'b1;
          rLOCK_       = 1'b1;
        end 
        else if ( !DEVSEL_ && (AddressOffset > 1)) TransStatus = `DisConnect;
        
        if ( ReleaseLock ||  LockFailed) begin
          rLOCK_     =  1'b1;
          OwnLock    =  1'b0;
        end
        else if ( LockTarget && !LockFailed) OwnLock  = 1'b1;

        TransCount  =  AddressOffset - 1;
        OE_FRAME_   =  1'b0;   
        rIRDY_      =  1'b1;
        OE_AD       =  1'b0;
        OE_CBE_     =  1'b0;
        rREQ_       =  1'b1;
        State       =  `STAR; 
      end


      else if ( FRAME_ && !TRDY_) begin
        if (!RunBacktoBack) begin
          if (Read)  ReadDataReg[AddressOffset -1] = AD;
        end
        else if (RunBacktoBack && (FbbCycleType[1:0] == 2'b10)) 
          ReadFbbDataReg = AD;

        if ( AddressOffset == DataCount) TransStatus = `Success;
        else  if (GNT_) TransStatus = `MasterPreempted;
        TransCount  = AddressOffset;
        if (LockTarget || SameTarget) LockFailed = 1'b0; 

        if ( ReleaseLock ||  LockFailed) begin
          rLOCK_     =  1'b1;
          OwnLock    =  1'b0;
        end
        else if ( LockTarget && !LockFailed) OwnLock  = 1'b1;

        OE_FRAME_  =  1'b0;   
        rIRDY_     =  1'b1;
        OE_AD      =  1'b0;
        OE_CBE_    =  1'b0;
        rREQ_      =  1'b1;
        State      =  `TURNAR;
      end
    end



    `STAR     : begin
      
      if (OwnLock) OE_LOCK_  =  1'b1;
      else OE_LOCK_   =  1'b0;

      if (!GNT_) begin

        OE_IRDY_  = 1'b0;
        OE_FRAME_ = 1'b0;
        rAD       = 3'b010;
        rCBE_     = 4'b1111;
        OE_AD     =  1'b1;
        OE_CBE_   =  1'b1;
        State     =  `DRBUS;
        Request   =  1'b0;
        TransDone =  1'b1;
      end
      else if (GNT_) begin

        OE_IRDY_   =  1'b0;
        OE_FRAME_  =  1'b0;
        State      =  `IDLE;
        Request    =  1'b0;
        TransDone  =  1'b1;
      end
    end



    `TURNAR   : begin

      if (OwnLock) OE_LOCK_  =  1'b1;
      else OE_LOCK_   =  1'b0;

      if ( !GNT_ ) begin
        OE_IRDY_  =  1'b0;
        OE_FRAME_ =  1'b0;
        rAD       =  3'h010;
        rCBE_     =  4'b1111;
        OE_AD     =  1'b1;
        OE_CBE_   =  1'b1;
        Request   =  1'b0;
        TransDone =  1'b1;
        State     =  `DRBUS;
      end
      else if (GNT_) begin
        OE_IRDY_  =  1'b0;
        OE_FRAME_ =  1'b0;
        Request   =  1'b0;
        TransDone =  1'b1;
        State     =  `IDLE;
      end
    end


    `DRBUS    : begin

      if (Request && !GNT_) begin
        if ( LockTarget &&  !OwnLock && !LOCK_) begin
          LockTarget   =   1'b0;
          LockFailed   =   1'b1;
          TransStatus  =   `LockFailed;
          TransCount   =  3'b000;
          Request      =   1'b0;
          TransDone    =   1'b1;
        end
        else begin
          LoadTransVar;
          rAD        =   StartAddress;
          rCBE_      =   CycleType;
          if ( CycleType[3:2] == 2'b10 ) begin
            rIDSEL    = IdselCode;
            OE_IDSEL  = 1'b1;  
          end
          OE_FRAME_  =  1'b1;
          rFRAME_    =  1'b0;
          if ( SameTarget || LockTarget) begin
            OE_LOCK_    = 1'b1;
            rLOCK_      = 1'b1;
          end
          State      =  `ADDR;
        end
      end
        
      else if (GNT_) begin
        OE_AD      =  1'b0;
        OE_CBE_    =  1'b0;
        State      =  `IDLE;
      end
    end

    default : begin
    end
  endcase
end

endmodule

