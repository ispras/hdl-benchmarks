//typedef enum {LOAD,STORE,LOAD2STORE,INC} opcode;
//typedef enum {FETCH,MEM,EXECUTE} stage;
//typedef  enum {IDLE, REQUEST_PHASE, SNOOP_PHASE, RESPONSE_PHASE } transPhase;

`define LOAD        2'd0
`define STORE       2'd1
`define LOAD2STORE  2'd2
`define INC         2'd3

`define FETCH       2'd0
`define MEM         2'd1
`define EXECUTE     2'd2

`define IDLE            2'd0
`define REQUEST_PHASE   2'd1
`define SNOOP_PHASE     2'd2
`define RESPONSE_PHASE  2'd3

/* extMemTrans */
`define NOREQ 3'b000
`define EXT_MR  3'b001
`define EXT_MW  3'b010
`define EXT_MRI_Z  3'b011
`define EXT_MRI 3'b100

/* memTrans */
`define MR 3'b001
`define MW 3'b010
`define MRI 3'b011

/* TAG */
`define INVALID 3'b000
`define SHARED  3'b001
`define EXCLUSIVE  3'b010
`define MODIFIED  3'b011
`define STALL  3'b100

`define ADDRESS_WIDTH 2
`define DATA_WIDTH 1
`define MEM_SIZE 4 
`define CACHE_SIZE 2
`define CACHE_WIDTH 1
`define TAG_WIDTH 3
`define Q_LEN 2
`define Q_BITS 1




module PENTIUM_PRO_SYSTEM(clk);

input clk;

reg[1:0] PID0,PID1,PID2,PID3;
wire BREQ0,BREQ1,BREQ2,BREQ3;
wire[`ADDRESS_WIDTH-1:0] EXT_ADDR_O_0,EXT_ADDR_O_1,EXT_ADDR_O_2,EXT_ADDR_O_3;
wire[`DATA_WIDTH-1:0] EXT_DATA_O_0,EXT_DATA_O_1,EXT_DATA_O_2,EXT_DATA_O_3,EXT_DATA_O_M;
wire ADS_O_0,ADS_O_1,ADS_O_2,ADS_O_3;
wire DRDY_O_0,DRDY_O_1,DRDY_O_2,DRDY_O_3,DRDY_O_M;
wire[1:0] TID_O_0,TID_O_1,TID_O_2,TID_O_3;
wire TRDY;
wire[1:0]HIT_HITM_O_0,HIT_HITM_O_1,HIT_HITM_O_2,HIT_HITM_O_3;

wire[`ADDRESS_WIDTH-1:0] EXT_ADDR_I; 
wire[`DATA_WIDTH-1:0] EXT_DATA_I;
wire ADS_I,DRDY_I;
wire[1:0] TID_I;
wire[1:0] HIT_HITM_I;

wire[2:0] EXT_TRANS_REQ_O_0,EXT_TRANS_REQ_O_1,EXT_TRANS_REQ_O_2,EXT_TRANS_REQ_O_3;
wire[2:0] EXT_TRANS_REQ_I;
/* All four processor */
/*
assign EXT_ADDR_I = ( EXT_ADDR_O_0| EXT_ADDR_O_1| EXT_ADDR_O_2| EXT_ADDR_O_3);
assign EXT_DATA_I = ( EXT_DATA_O_0 | EXT_DATA_O_1 | EXT_DATA_O_2 | EXT_DATA_O_3 | EXT_DATA_O_M);
assign ADS_I = ( ADS_O_0 | ADS_O_1| ADS_O_2| ADS_O_3);
assign DRDY_I = ( DRDY_O_0| DRDY_O_1| DRDY_O_2| DRDY_O_3| DRDY_O_M);
assign TID_I = ( TID_O_0| TID_O_1| TID_O_2| TID_O_3);
assign HIT_HITM_I = ( HIT_HITM_O_0| HIT_HITM_O_1| HIT_HITM_O_2| HIT_HITM_O_3);
assign EXT_TRANS_REQ_I = (EXT_TRANS_REQ_O_0 | EXT_TRANS_REQ_O_1 |
                          EXT_TRANS_REQ_O_2 | EXT_TRANS_REQ_O_3 );
*/
/* Two processor */
assign EXT_ADDR_I = ( EXT_ADDR_O_0| EXT_ADDR_O_1);
assign EXT_DATA_I = ( EXT_DATA_O_0 | EXT_DATA_O_1 |EXT_DATA_O_M);
assign ADS_I = ( ADS_O_0 | ADS_O_1);
assign DRDY_I = ( DRDY_O_0| DRDY_O_1|  DRDY_O_M);
assign TID_I = ( TID_O_0| TID_O_1 );
assign HIT_HITM_I = ( HIT_HITM_O_0| HIT_HITM_O_1);
assign EXT_TRANS_REQ_I = (EXT_TRANS_REQ_O_0 | EXT_TRANS_REQ_O_1 );
assign BREQ2 = 1'b0;
assign BREQ3 = 1'b0;
/* One processor */
/*
assign EXT_ADDR_I = ( EXT_ADDR_O_0);
assign EXT_DATA_I = ( EXT_DATA_O_0 |EXT_DATA_O_M);
assign ADS_I = ( ADS_O_0 );
assign DRDY_I = ( DRDY_O_0 | DRDY_O_M);
assign TID_I = ( TID_O_0 );
assign HIT_HITM_I = ( HIT_HITM_O_0);
assign EXT_TRANS_REQ_I = (EXT_TRANS_REQ_O_0  );
assign BREQ1 = 1'b0;
assign BREQ2 = 1'b0;
assign BREQ3 = 1'b0;
*/

/* assign the ID during the initial boot-up */
initial begin
  PID0 = 2'b00;
  PID1 = 2'b01;
  PID2 = 2'b10;
  PID3 = 2'b11;
end
                          

P6 processor0(PID0,BREQ1,BREQ2,BREQ3,EXT_DATA_I,EXT_ADDR_I,TRDY,
              DRDY_I,ADS_I,TID_I,EXT_TRANS_REQ_I,HIT_HITM_I,TRAN_OVER,
              BREQ0,EXT_DATA_O_0,EXT_ADDR_O_0,DRDY_O_0,ADS_O_0,TID_O_0,EXT_TRANS_REQ_O_0,
              HIT_HITM_O_0);
P6 processor1(PID1,BREQ2,BREQ3,BREQ0,EXT_DATA_I,EXT_ADDR_I,TRDY,
              DRDY_I,ADS_I,TID_I,EXT_TRANS_REQ_I,HIT_HITM_I,TRAN_OVER,
              BREQ1,EXT_DATA_O_1,EXT_ADDR_O_1,DRDY_O_1,ADS_O_1,TID_O_1,EXT_TRANS_REQ_O_1,
              HIT_HITM_O_1);
/*
P6 processor2(PID2,BREQ3,BREQ0,BREQ1,EXT_DATA_I,EXT_ADDR_I,TRDY,
              DRDY_I,ADS_I,TID_I,EXT_TRANS_REQ_I,HIT_HITM_I,TRAN_OVER,
              BREQ2,EXT_DATA_O_2,EXT_ADDR_O_2,DRDY_O_2,ADS_O_2,TID_O_2,EXT_TRANS_REQ_O_2,
              HIT_HITM_O_2);
P6 processor3(PID3,BREQ0,BREQ1,BREQ2,EXT_DATA_I,EXT_ADDR_I,TRDY,
              DRDY_I,ADS_I,TID_I,EXT_TRANS_REQ_I,HIT_HITM_I,TRAN_OVER,
              BREQ3,EXT_DATA_O_3,EXT_ADDR_O_3,DRDY_O_3,ADS_O_3,TID_O_3,EXT_TRANS_REQ_O_3,
              HIT_HITM_O_3);
*/
MEMORY ram (clk, ADS_I,  EXT_TRANS_REQ_I, EXT_ADDR_I,  HIT_HITM_I, EXT_DATA_I,  DRDY_I,
             TRDY, EXT_DATA_O_M,DRDY_O_M,TRAN_OVER);


endmodule

module P6( PID,BREQ1,BREQ2,BREQ3,EXT_DATA_I,EXT_ADDR_I,TRDY,
              DRDY_I,ADS_I,TID_I,EXT_TRANS_REQ_I,HIT_HITM_I,TRAN_OVER,
              BREQ0,EXT_DATA_O,EXT_ADDR_O,DRDY_O,ADS_O,TID_O,EXT_TRANS_REQ_O,
              HIT_HITM_O);

input [1:0] PID;
input [`ADDRESS_WIDTH-1:0] EXT_ADDR_I;
input [1:0] TID_I,HIT_HITM_I;
input [2:0] EXT_TRANS_REQ_I;
input BREQ1,BREQ2,BREQ3,EXT_DATA_I,TRDY,DRDY_I,ADS_I,TRAN_OVER;

output [`ADDRESS_WIDTH-1:0] EXT_ADDR_O;
output [1:0] TID_O,HIT_HITM_O;
input [2:0] EXT_TRANS_REQ_O;
output BREQ0,EXT_DATA_O,DRDY_O,ADS_O;

wire TRAN_OVER;
wire[1:0] PID;
wire BREQ0,BREQ1,BREQ2,BREQ3;
wire[`DATA_WIDTH-1:0] EXT_DATA_I,EXT_DATA_O;
wire[`ADDRESS_WIDTH-1:0] EXT_ADDR_I, EXT_ADDR_O;
wire DRDY_I,DRDY_O;
wire TRDY;
wire ADS_I,ADS_O;
wire[1:0] TID_I,TID_O;
wire[2:0] EXT_TRANS_REQ_I,EXT_TRANS_REQ_O;
wire[1:0] HIT_HITM_I,HIT_HITM_O;


wire DATA_RDY,CACHE_RDY,REQ_GRANTED,SNOOP_REQ;
wire[`DATA_WIDTH-1:0] DATA_1,DATA_2,INT_DATA_1,INT_DATA_2,SNOOP_DATA;
wire[`ADDRESS_WIDTH-1:0] ADDR,INT_ADDR,SNOOP_ADDR;
wire[`TAG_WIDTH-1:0] SNOOP_TAG_1,SNOOP_TAG_2;
wire[2:0] INT_TRANS_REQ;  
wire [1:0] EXE_STAGE;
wire[`TAG_WIDTH-1:0] INT_TAG ;

EU  EU1(clk, PID,DATA_RDY,CACHE_RDY,DATA_2,
          DATA_1,CACHE_REQ,ADDR,EXE_STAGE);

CACHE   CACHE1(clk, CACHE_REQ,ADDR,DATA_1,EXE_STAGE,
	REQ_GRANTED,INT_DATA_1,INT_TAG,
	SNOOP_REQ,SNOOP_ADDR,SNOOP_TAG_1,
	DATA_RDY,CACHE_RDY,DATA_2,
	INT_TRANS_REQ,INT_DATA_2,INT_ADDR,
	SNOOP_DATA,SNOOP_TAG_2);

REQUEST_AGENT REQUEST_AGENT1(clk,
	BREQ1,BREQ2,BREQ3, INT_TRANS_REQ,  PID,  ADS_I,  TID_I, EXT_TRANS_REQ_I, 
        EXT_ADDR_I, SNOOP_TAG_2, SNOOP_DATA,SNOOP_REQ, HIT_HITM_I,   
	EXT_DATA_I, INT_DATA_2,  DRDY_I,TRDY,TRAN_OVER,INT_ADDR,
	ADS_O,  TID_O, EXT_TRANS_REQ_O, BREQ0, EXT_ADDR_O, SNOOP_TAG_1,SNOOP_ADDR,
	HIT_HITM_O, EXT_DATA_O,INT_DATA_1,DRDY_O,INT_TAG,REQ_GRANTED);

endmodule








module EU(clk, PID,DATA_RDY,CACHE_RDY,DATA_I,
          DATA_O,CACHE_REQ,ADDR,EXE_STAGE);
 
input clk;
 input PID;
input DATA_RDY;
input CACHE_RDY;
input DATA_I;
output DATA_O;
output CACHE_REQ;
output ADDR;
output EXE_STAGE;

wire DATA_RDY;
wire CACHE_RDY;
wire[`DATA_WIDTH-1:0] DATA_I;
reg[`DATA_WIDTH-1:0] DATA_O;
reg[2:0] CACHE_REQ;
wire[`ADDRESS_WIDTH-1:0] ADDR;
wire [1:0] EXE_STAGE;

reg [1:0] instruction;
reg [1:0] executionStage;
reg[`ADDRESS_WIDTH-1:0] memoryAddress;
reg[`DATA_WIDTH-1:0] regA;
reg multStage;


//wire [1:0] NDopcode;


wire addr_0,addr_1,addr_2,addr_3;
/* ,addr_4,addr_5,addr_6,addr_7; */


assign ADDR =  memoryAddress;
assign EXE_STAGE =  executionStage;


//assign NDopcode = $ND(`LOAD,`STORE,`LOAD2STORE,`INC);      
//assign addr_0 = $ND(0,1);
assign addr_1 = $ND(0,1);
//assign addr_2 = $ND(0,1);   
initial begin
  executionStage = `FETCH;
  CACHE_REQ = `NOREQ;
  regA = 0;
  multStage = 0;
 // instruction = NDopcode;
  instruction = `LOAD;
  DATA_O = 0;
 // memoryAddress =  {addr_1,addr_0};
  memoryAddress =  2'b11;
end

   
always @(posedge clk)
begin

  if (executionStage == `FETCH )
  begin
/* `LOAD , `LOAD , variable mem */
    //instruction = NDopcode;
     
     if (!PID) begin
      instruction = `STORE;
      regA = 0;
     end
     else begin
      regA = 1;
      instruction = `LOAD;
     end
     
//    memoryAddress = 2'b11;
//    memoryAddress = {addr_1,addr_0};
     // to use only one cache line
     if ( addr_1 )
       memoryAddress = 2;
     else
       memoryAddress = 0;


    executionStage = `EXECUTE ;
  end  
  else begin
    CACHE_REQ = `NOREQ;
    case ( instruction ) 
      `LOAD:       begin
                    if (executionStage == `EXECUTE) begin
                      executionStage = `MEM; 
                      CACHE_REQ = `MR ;
                    end
                    else if (CACHE_RDY || DATA_RDY) begin
                       executionStage = `FETCH;
                       regA = DATA_I ;
                    end
                  end

      `STORE:      begin
                    if (executionStage == `EXECUTE) begin
                      executionStage = `MEM; 
                      CACHE_REQ = `MW ;
                      DATA_O = regA;
                    end
                    else if (CACHE_RDY|| DATA_RDY) begin
                       executionStage = `FETCH;
                    end
                  end

      `LOAD2STORE: begin
                    if (executionStage == `EXECUTE) begin
                      executionStage = `MEM; 
                      CACHE_REQ = `MRI ;
                    end
                    else if (DATA_RDY || CACHE_RDY) begin
                       executionStage = `FETCH;
                       regA = DATA_I ;
                    end
                  end

      `INC:        begin
                    executionStage = `FETCH;
                    regA = regA + 1;
                  end
                
    endcase

  end                   

end

endmodule









module CACHE(clk, CACHE_REQ,ADDR,DATA_I,EXE_STAGE,
	REQ_GRANTED,INT_DATA_I,INT_TAG,
	SNOOP_REQ,SNOOP_ADDR,SNOOP_TAG_I,
	DATA_RDY,CACHE_RDY,DATA_O,
	INT_TRANS_REQ,INT_DATA_O,INT_ADDR,
	SNOOP_DATA,SNOOP_TAG_O);

input clk;
input [2:0] CACHE_REQ;
input [`ADDRESS_WIDTH-1:0] ADDR;
input [1:0] EXE_STAGE;
input DATA_I;
input [`TAG_WIDTH-1:0] INT_TAG;
input REQ_GRANTED,INT_DATA_I;
input [`ADDRESS_WIDTH-1:0] SNOOP_ADDR;
input SNOOP_REQ;
input [`TAG_WIDTH-1:0] SNOOP_TAG_I;

output DATA_RDY,CACHE_RDY,DATA_O;
output [2:0] INT_TRANS_REQ;
output [`ADDRESS_WIDTH-1:0] INT_ADDR;
output INT_DATA_O;
output [`TAG_WIDTH-1:0] SNOOP_TAG_O;
output SNOOP_DATA;

wire[2:0] CACHE_REQ;
wire[`ADDRESS_WIDTH-1:0] ADDR;
wire[`DATA_WIDTH-1:0] DATA_I;

wire [1:0] EXE_STAGE;

wire REQ_GRANTED;
wire[`DATA_WIDTH-1:0] INT_DATA_I;
wire[`TAG_WIDTH-1:0] INT_TAG;

wire SNOOP_REQ;
wire[`ADDRESS_WIDTH-1:0] SNOOP_ADDR;
wire[`TAG_WIDTH-1:0] SNOOP_TAG_I;

reg DATA_RDY;
reg CACHE_RDY;
reg[`DATA_WIDTH-1:0] DATA_O;

reg[2:0] INT_TRANS_REQ;
reg[`DATA_WIDTH-1:0] INT_DATA_O;
reg[`ADDRESS_WIDTH-1:0] INT_ADDR;

reg[`DATA_WIDTH-1:0] SNOOP_DATA;
reg[`TAG_WIDTH-1:0] SNOOP_TAG_O;

reg[`DATA_WIDTH-1:0] cacheMemory0;
reg[`DATA_WIDTH-1:0] cacheMemory1;
reg[`TAG_WIDTH-1:0] processorTag0; 
reg[`TAG_WIDTH-1:0] processorTag1; 
reg [`ADDRESS_WIDTH-1:0] snoopTagAddress;
reg [`ADDRESS_WIDTH-1:0] tagAddress;
   
   
reg[`ADDRESS_WIDTH-1:0] cacheTlb0;
reg[`ADDRESS_WIDTH-1:0] cacheTlb1;
reg[`CACHE_WIDTH-1:0] tlbPointer;
reg[`CACHE_WIDTH-1:0] snoopTlbPointer;

reg transReqPending ;
reg[`DATA_WIDTH-1:0] buffer;
reg[2:0] cacheOperRequested ;
reg[`TAG_WIDTH-1:0] lState;
reg writeBackRequired ;
reg[`ADDRESS_WIDTH-1:0] requestAddress ; 

   

initial begin
  DATA_RDY = 0;
  DATA_O = 0;
  transReqPending = 0;
  cacheOperRequested=`NOREQ ;
  lState = `INVALID;
  writeBackRequired =0;
  snoopTlbPointer=0;
  tlbPointer=0;
  requestAddress =0;
  buffer = 0;
  cacheMemory0 = 0;
  cacheTlb0 = 0;
  processorTag0 = `INVALID;
  cacheMemory1 = 0;
  cacheTlb1 = 0;
  processorTag1 = `INVALID;


/*
  cacheMemory[3] = 2'b11;
  cacheTlb[3] = 3'b111;
  processorTag[3] = `SHARED;
*/
     
  CACHE_RDY=0;
  INT_TRANS_REQ=0;
  INT_DATA_O=0;
  INT_ADDR=0;

  SNOOP_DATA=0;
  SNOOP_TAG_O=0;
  snoopTagAddress=0;
  tagAddress=0;

end


always @(posedge clk) begin
  if (( EXE_STAGE == `MEM )&&
        ( SNOOP_ADDR == ADDR)&&(!transReqPending)) begin
        SNOOP_TAG_O = `STALL;
  end 
  else if (SNOOP_REQ) begin
      /* Deque the transition and make the cache post a new external transaction */
      if (( SNOOP_ADDR == ADDR)&&(transReqPending) )
         transReqPending = 0; 
      snoopTlbPointer = SNOOP_ADDR[`CACHE_WIDTH-1:0];
      snoopTagAddress = (snoopTlbPointer) ? cacheTlb1 : cacheTlb0 ;

      if ( snoopTagAddress == SNOOP_ADDR ) begin
        if ( snoopTlbPointer ) begin
          if (( processorTag1 == `SHARED ) || 
              ( processorTag1 == `EXCLUSIVE )) begin
            processorTag1 = SNOOP_TAG_I;
            SNOOP_DATA = cacheMemory1;
            SNOOP_TAG_O = `SHARED ; 
          end
          else if ( processorTag1 == `MODIFIED) begin
            processorTag1 = SNOOP_TAG_I;
            SNOOP_DATA = cacheMemory1;
            SNOOP_TAG_O = `MODIFIED ;
          end
          else
            SNOOP_TAG_O = processorTag1 ;  
        end
        else begin
          if (( processorTag0 == `SHARED ) ||                
              ( processorTag0 == `EXCLUSIVE )) begin
            processorTag0 = SNOOP_TAG_I;
            SNOOP_DATA = cacheMemory0;
            SNOOP_TAG_O = `SHARED ;
          end
          else if ( processorTag0 == `MODIFIED) begin
            processorTag0 = SNOOP_TAG_I;
            SNOOP_DATA = cacheMemory0;
            SNOOP_TAG_O = `MODIFIED ;
          end
          else
            SNOOP_TAG_O = processorTag0 ;                

        end
      end 
      else  begin
        if ( snoopTlbPointer ) begin
          if ( processorTag1 == `SHARED ) 
            processorTag1 = `INVALID;
        end                           
        else begin
          if ( processorTag0 == `SHARED ) 
            processorTag0 = `INVALID; // some proc acquires the same cache line
        end                           // in E state
        SNOOP_TAG_O = `INVALID ;                  
      end
        
  end 
end

always @(posedge clk) begin
  DATA_RDY = 0;
  CACHE_RDY = 0;
  INT_TRANS_REQ = `NOREQ;

  if (CACHE_REQ != `NOREQ ) begin
    cacheOperRequested = CACHE_REQ;
    buffer = DATA_I; /* valid only if MW */
    requestAddress = ADDR;
  end

  /* execute this every time. Snooper can change the tag of the */
  /* line for which this agent is waiting. */
 

  tlbPointer = requestAddress[`CACHE_WIDTH-1:0];
  tagAddress = (tlbPointer) ? cacheTlb1 : cacheTlb0;
  if ( tagAddress == requestAddress ) 
    lState = (tlbPointer) ? processorTag1 : processorTag0;
  else begin 
    lState = `INVALID;
    if ( tlbPointer ) begin 
      if (( cacheOperRequested != `MW ) && 
        (processorTag1 == `MODIFIED )) begin 
        writeBackRequired = 1;
        buffer = cacheMemory1; /* valid only if MR or MRI */
      end
    end
    else begin
      if (( cacheOperRequested != `MW ) && 
        (processorTag0 == `MODIFIED )) begin 
        writeBackRequired = 1;
        buffer = cacheMemory0; /* valid only if MR or MRI */
      end
    end
  end


  case (cacheOperRequested) 
  `MR: 
      case(lState)

        `SHARED   : begin
                   CACHE_RDY = 1;
                   DATA_O = (tlbPointer) ? cacheMemory1 : cacheMemory0;
                   cacheOperRequested = `NOREQ;
                   end

        `MODIFIED : begin
                   CACHE_RDY = 1;
                   DATA_O = (tlbPointer) ? cacheMemory1 : cacheMemory0;
                   cacheOperRequested = `NOREQ;
                   end

        `EXCLUSIVE: begin
                   CACHE_RDY = 1;
                   DATA_O = (tlbPointer) ? cacheMemory1 : cacheMemory0;
                   cacheOperRequested = `NOREQ;
                   end

        `INVALID : begin 
                   if (( transReqPending )&&(!writeBackRequired)) begin
                      if  ( REQ_GRANTED )  begin
                        transReqPending = 0;
                        if (tlbPointer) begin
                          cacheMemory1 = INT_DATA_I;
                          cacheTlb1 = requestAddress;
                          processorTag1 = INT_TAG;
                        end
                        else begin
                          cacheMemory0 = INT_DATA_I;
                          cacheTlb0 = requestAddress;
                          processorTag0 = INT_TAG;
                        end
                        cacheOperRequested = `NOREQ;
                        DATA_RDY = 1;
                        DATA_O = (tlbPointer) ? cacheMemory1 : cacheMemory0;
                     end 
                   end
                   else  if (writeBackRequired) begin
                           if ( transReqPending) begin
                              if  ( REQ_GRANTED) begin
                                transReqPending = 0;
                                writeBackRequired =0; 
                              end
                              else begin
                                transReqPending = 1 ;
                                INT_ADDR = tagAddress;
                                INT_DATA_O = buffer;
                                INT_TRANS_REQ =  `EXT_MW;
                              end
                           end
                    end 
                    else begin
                      transReqPending = 1 ;
                      INT_ADDR = requestAddress;
                      INT_TRANS_REQ = `EXT_MR;
                   end
                   end
      endcase
   `MW:
      case(lState)
        `EXCLUSIVE:
                     begin
                     CACHE_RDY = 1;
                     if ( tlbPointer ) begin
                       cacheMemory1 = buffer;
                       processorTag1 = `MODIFIED;
                     end
                     else  begin
                       cacheMemory0 = buffer;
                       processorTag0 = `MODIFIED;
                     end
 
                     cacheOperRequested = `NOREQ;
                     end
        `MODIFIED:
                     begin
                     if ( tlbPointer ) begin
                       cacheMemory1 = buffer;
                     end
                     else  begin
                       cacheMemory0 = buffer;
                     end
                     CACHE_RDY = 1;
                     cacheOperRequested = `NOREQ;
                     end

        `SHARED:
                     if ( transReqPending) begin
                       if ( REQ_GRANTED) begin
                        transReqPending = 0;
                       if ( tlbPointer ) begin
                         cacheMemory1 = buffer;
                         processorTag1 = `MODIFIED;
                       end
                       else  begin
                         cacheMemory0 = buffer;
                         processorTag0 = `MODIFIED;
                       end
                        cacheOperRequested = `NOREQ;
                        DATA_RDY = 1;
                      end
                    end
                    else  begin
                        transReqPending = 1 ;
                        INT_ADDR = requestAddress;
                        INT_TRANS_REQ =  `EXT_MRI_Z;
                    end
         `INVALID:
                     if ( transReqPending) begin
                       if  ( REQ_GRANTED) begin
                         transReqPending = 0;
                         DATA_RDY = 1;
                         cacheOperRequested = `NOREQ;
                       end
                     end
                     else begin
                         transReqPending = 1 ;
                         INT_DATA_O = buffer;
                         INT_ADDR = requestAddress;
                         INT_TRANS_REQ =  `EXT_MW;
                     end
                   
         default:;
                   
         endcase
    
    `MRI:
      case(lState)
        `MODIFIED:
                   begin
                    CACHE_RDY = 1;
                     DATA_O = (tlbPointer) ? cacheMemory1 : cacheMemory0;
                     cacheOperRequested = `NOREQ;
                   end
        `EXCLUSIVE:
                   begin
                     CACHE_RDY = 1;
                     DATA_O = (tlbPointer) ? cacheMemory1 : cacheMemory0;
                     cacheOperRequested = `NOREQ;
                   end
        `SHARED: 

                   if ( transReqPending ) begin
                     if  ( REQ_GRANTED  ) begin
                       transReqPending = 0;
                       DATA_RDY = 1;
                       if ( tlbPointer ) begin
                         cacheMemory1 = INT_DATA_I;
                         cacheTlb1 = tagAddress;
                         processorTag1 = `EXCLUSIVE;
                       end
                       else begin
                         cacheMemory0 = INT_DATA_I;
                         cacheTlb0 = tagAddress;
                         processorTag0 = `EXCLUSIVE;
                       end
                       cacheOperRequested = `NOREQ;
                       DATA_O = (tlbPointer) ? cacheMemory1 : cacheMemory0;
                     end
                   end
                   else begin
                      transReqPending = 1 ;
                      INT_ADDR = requestAddress;
                      INT_TRANS_REQ = `EXT_MRI;
                   end


        `INVALID : 

                   if ( transReqPending ) begin
                     if  ( REQ_GRANTED  ) begin
                       transReqPending = 0;
                       DATA_RDY = 1;
                       if ( tlbPointer ) begin
                         cacheMemory1 = INT_DATA_I;
                         cacheTlb1 = requestAddress;
                         processorTag1 = `EXCLUSIVE;
                       end
                       else begin
                         cacheMemory0 = INT_DATA_I;
                         cacheTlb0 = requestAddress;
                         processorTag0 = `EXCLUSIVE;
                       end
                       cacheOperRequested = `NOREQ;
                       DATA_O = (tlbPointer) ? cacheMemory1 : cacheMemory0;
                     end
                   end
                   else  if (writeBackRequired) begin
                           if ( transReqPending) begin
                              if  ( REQ_GRANTED) begin
                                transReqPending = 0;
                                writeBackRequired =0;
                              end
                              else begin
                                transReqPending = 1 ;
                                INT_ADDR = tagAddress;
                                INT_DATA_O = buffer;
                                INT_TRANS_REQ =  `EXT_MW;
                              end
                           end
                   end

                   else begin
                      transReqPending = 1 ;
                      INT_ADDR = requestAddress;
                      INT_TRANS_REQ = `EXT_MRI;
                   end

      endcase

    endcase
          
end

endmodule


module REQUEST_AGENT(clk,
	BR1,BR2,BR3, INT_TRANS_REQ,  PID,  ADS_I,  TID_I, EXT_TRANS_REQ_I, 
        EXT_ADDR_I, SNOOP_TAG_I, SNOOP_DATA,SNOOP_REQ, HIT_HITM_I,   
	EXT_DATA_I, INT_DATA_I,  DRDY_I,TRDY,TRAN_OVER,INT_ADDR,
	ADS_O,  TID_O, EXT_TRANS_REQ_O, BR0, EXT_ADDR_O, SNOOP_TAG_O,SNOOP_ADDR,  
	HIT_HITM_O, EXT_DATA_O,INT_DATA_O,DRDY_O,INT_TAG, REQ_GRANTED);

input clk;
input  BR1,BR2,BR3;
input [2:0] INT_TRANS_REQ;
input [1:0] PID;
input ADS_I;
input [1:0] TID_I;
input [2:0] EXT_TRANS_REQ_I;
input [`ADDRESS_WIDTH-1:0] EXT_ADDR_I;
input [`TAG_WIDTH-1:0] SNOOP_TAG_I;
input [`DATA_WIDTH-1:0] SNOOP_DATA;

input [1:0] HIT_HITM_I;

input [`DATA_WIDTH-1:0] EXT_DATA_I;
input [`DATA_WIDTH-1:0] INT_DATA_I;
input DRDY_I,TRDY;
input TRAN_OVER;
input [`ADDRESS_WIDTH-1:0] INT_ADDR;

output REQ_GRANTED;
output SNOOP_REQ;
output ADS_O;
output [1:0] TID_O;
output [2:0] EXT_TRANS_REQ_O;
output BR0;
output [`ADDRESS_WIDTH-1:0] EXT_ADDR_O;
output [`TAG_WIDTH-1:0] SNOOP_TAG_O;
output [`ADDRESS_WIDTH-1:0] SNOOP_ADDR;
output [1:0] HIT_HITM_O;
output [`DATA_WIDTH-1:0] EXT_DATA_O,INT_DATA_O;
output DRDY_O;
output [`TAG_WIDTH-1:0] INT_TAG;
   

wire BR1,BR2,BR3;
wire[2:0] INT_TRANS_REQ;
wire[1:0] PID;
wire ADS_I;
wire[1:0] TID_I;
wire[2:0] EXT_TRANS_REQ_I;
wire[`ADDRESS_WIDTH-1:0] EXT_ADDR_I;
wire[`ADDRESS_WIDTH-1:0] INT_ADDR;
wire[`TAG_WIDTH-1:0] SNOOP_TAG_I;

wire[`DATA_WIDTH-1:0] SNOOP_DATA;
wire[1:0] HIT_HITM_I;

wire[`DATA_WIDTH-1:0] EXT_DATA_I;
wire[`DATA_WIDTH-1:0] INT_DATA_I;
wire DRDY_I, TRDY,TRAN_OVER;

reg REQ_GRANTED;
reg ADS_O;
reg[1:0] TID_O;
reg[2:0] EXT_TRANS_REQ_O;
reg BR0;
reg[`ADDRESS_WIDTH-1:0] EXT_ADDR_O;
reg[`ADDRESS_WIDTH-1:0] SNOOP_ADDR;
reg SNOOP_REQ;
reg[`TAG_WIDTH-1:0] SNOOP_TAG_O;
reg[1:0]  HIT_HITM_O;

reg[`DATA_WIDTH-1:0] EXT_DATA_O,INT_DATA_O;

reg DRDY_O;

reg requestPending;

/* to track 1nd transaction phase */
reg[1:0] fifoTid0;
reg [1:0] fifoPhase0;
reg[2:0] fifoReqType0;
reg[`ADDRESS_WIDTH-1:0] fifoAddr0;
reg[`DATA_WIDTH-1:0] fifoWBInt0;
reg[`TAG_WIDTH-1:0] fifoMRTag0;
reg[`DATA_WIDTH-1:0]  writeBackBuf0;

/* to track 2nd tran phase */
reg[1:0] fifoTid1;
reg [1:0] fifoPhase1;
reg[2:0] fifoReqType1;
reg[`ADDRESS_WIDTH-1:0] fifoAddr1;
reg[`DATA_WIDTH-1:0] fifoWBInt1;
reg[`TAG_WIDTH-1:0] fifoMRTag1;
reg[`DATA_WIDTH-1:0]  writeBackBuf1;


reg[`Q_BITS:0] emptySlotPtr;

reg[2:0] cacheRequestedReqType;
reg[`ADDRESS_WIDTH-1:0] cacheRequestedAddr;


reg[1:0] rid;
reg[`Q_BITS-1:0] index_1;
reg[`Q_BITS-1:0] index_2;
reg[`Q_BITS-1:0] index_3;
reg cacheReadOver;
reg writeBackOver ;
reg reqSentOver ;
reg [`DATA_WIDTH-1:0] writeReqBuf;
reg[`TAG_WIDTH-1:0] INT_TAG;
reg SELF_SNOOP_SKIP;

reg[2:0] tempReqType;
reg found_1;
reg found_2;
reg found_3;
   
   

initial begin
  emptySlotPtr = 0;
  rid = 3; 
 
  BR0 = 0;
  ADS_O = 0;
  TID_O = 0;
  requestPending =0;
  cacheReadOver=0;

  writeReqBuf = 0;
  
    fifoTid0 = 0;
    fifoPhase0 = `IDLE;
    fifoReqType0 = `NOREQ;
    fifoAddr0 = 0;
    fifoWBInt0 = 0;
    fifoMRTag0 = `INVALID;
    writeBackBuf0 = 0;
    fifoTid1 = 0;
    fifoPhase1 = `IDLE;
    fifoReqType1 = `NOREQ;
    fifoAddr1 = 0;
    fifoWBInt1 = 0;
    fifoMRTag1 = `INVALID;
    writeBackBuf1 = 0;

  cacheRequestedAddr=0;
  cacheRequestedReqType=0;

  HIT_HITM_O = 2'b00;
  index_1 =0;
  index_2 =0;
  index_3 =0;

  cacheReadOver = 0;

  EXT_ADDR_O = 0;
  SNOOP_REQ = 0;
  SNOOP_TAG_O = `INVALID;
  HIT_HITM_O = 0;
  EXT_DATA_O = 0;
  INT_DATA_O = 0;
  DRDY_O = 0;
  writeBackOver = 0;
  reqSentOver = 0;
  EXT_TRANS_REQ_O=0;
  REQ_GRANTED = 0;
  INT_TAG = 0 ;
  SNOOP_ADDR = 0 ;
  SELF_SNOOP_SKIP = 0;
  tempReqType=0;
  found_1=1;
  found_2=1;
  found_3=1;
   
   
end

always @(posedge clk) begin
  if ( INT_TRANS_REQ != `NOREQ ) begin
    if (( emptySlotPtr <= `Q_LEN ) )  begin

      cacheRequestedReqType = INT_TRANS_REQ;
      cacheRequestedAddr = INT_ADDR;
      writeReqBuf = INT_DATA_I;

      BR0 = 1;

    end
  end
end 
   
always @(posedge clk) begin
   
  

  if ( !TRAN_OVER ) begin
  ADS_O = 0;
  TID_O = 0;
  EXT_TRANS_REQ_O = 0;
  EXT_ADDR_O = 0;

  if ( BR0 ) begin

    if ((!ADS_I)&& // other condtions may be true when ADS_I is asserted
        ((!emptySlotPtr)|| // empty slot ptr :-)
         ((cacheRequestedAddr[`CACHE_WIDTH-1:0] != fifoAddr0[`CACHE_WIDTH-1:0])&& 
          // some transaction in progress; don't disturb ; address should not map  to same cache line
          (fifoPhase0 != `REQUEST_PHASE) // two transaction cannot be in request phase
         )
        )
       )begin
	
      if (( rid == (PID-1) )||
          (( rid == (PID-2) )&&(!BR3))||
          (( rid == (PID-3) )&&(!BR2)&&(!BR3))||      
          ((!BR1)&&(!BR2)&&(!BR3))) begin

        BR0 = 0; 


        ADS_O = 1;
        EXT_TRANS_REQ_O = cacheRequestedReqType;
        EXT_ADDR_O = cacheRequestedAddr;
        TID_O = PID;

      end
    end
  end

  end /*  of if !TRAN_OVER */
end




always @(posedge clk) begin

  if ( !TRAN_OVER ) begin
  if (ADS_I) begin


    if ( emptySlotPtr == 0 ) begin
      fifoTid0 = TID_I;
      fifoPhase0 = `REQUEST_PHASE;
      fifoReqType0 = EXT_TRANS_REQ_I;
      fifoAddr0 = EXT_ADDR_I;
    end
    else begin
      fifoTid1 = TID_I;
      fifoPhase1 = `REQUEST_PHASE;
      fifoReqType1 = EXT_TRANS_REQ_I;
      fifoAddr1 = EXT_ADDR_I;
    end 
    emptySlotPtr = emptySlotPtr+1;
    rid = TID_I ;


    if ( rid != PID ) begin
      SNOOP_REQ = 1;
      SNOOP_ADDR=EXT_ADDR_I;

      if ( EXT_TRANS_REQ_I == `EXT_MR )
        SNOOP_TAG_O = `SHARED;
      else 
        SNOOP_TAG_O = `INVALID;
    end  
    else begin
      SELF_SNOOP_SKIP = 1;
    end
   
    
  end
  else begin 
    SELF_SNOOP_SKIP = 0;
  end
  
  end /* if ( !TRAN_OVER ) */

end


always @(posedge clk) begin

  if ( !TRAN_OVER ) begin

  found_1 = 1;
  if (emptySlotPtr != 0 && fifoPhase0 == `REQUEST_PHASE) index_1 = 0;
  else if (emptySlotPtr != 1 && fifoPhase1 == `REQUEST_PHASE) index_1 = 1 ;
  else found_1 = 0;

  if (found_1) begin
    if ((SNOOP_REQ)||(SELF_SNOOP_SKIP))  begin
      if ( index_1 == 0 )
        fifoPhase0=`SNOOP_PHASE;
      else 
        fifoPhase1=`SNOOP_PHASE;
    end
  end

  end // if ( !TRAN_OVER ) 

end



always @(posedge clk) begin
  if ( ! TRAN_OVER ) begin
    HIT_HITM_O = 2'b00;

  found_2 = 1;
  if (emptySlotPtr != 0 && fifoPhase0 == `SNOOP_PHASE) index_2 = 0;
  else if (emptySlotPtr != 1 && fifoPhase1 == `SNOOP_PHASE) index_2 = 1 ;
  else found_2 = 0;

  if (found_2) begin

    if (!cacheReadOver)  begin
      cacheReadOver = 1;
      if ( ((!index_2)&& ( fifoTid0 != PID )) || 
           ((index_2)&& ( fifoTid1 != PID )) ) begin
        /* no more snoop request */
        SNOOP_REQ = 0;
         
        if ( index_2 ) 
          fifoWBInt1 = 0;
        else 
          fifoWBInt0 = 0;
        case(SNOOP_TAG_I) 
          `INVALID:    HIT_HITM_O = 2'b00;
          `SHARED:     HIT_HITM_O = 2'b10;
          `MODIFIED:   begin 
                        HIT_HITM_O = 2'b01;
                        if ( !index_2 ) begin 
                          writeBackBuf0 = SNOOP_DATA; 
                          fifoWBInt0 = 1;
                        end
                        else  begin
                          writeBackBuf1 = SNOOP_DATA; 
                          fifoWBInt1 = 1;
                        end
                      end 
          `STALL:      begin
                        SNOOP_REQ =1 ; // require snoop result
                        cacheReadOver =0;
                        HIT_HITM_O = 2'b11;
                      end 
	endcase 
	 
      end
      else
        HIT_HITM_O = 2'b00;

    end
    else if (HIT_HITM_I != 2'b11) begin

      if ( !index_2 ) begin
      case(HIT_HITM_I)
       2'b00:      fifoMRTag0 = `EXCLUSIVE;
       2'b01:      fifoMRTag0 = `SHARED;
       2'b10:      fifoMRTag0 = `SHARED;
      endcase
      fifoPhase0 = `RESPONSE_PHASE;
      end


      else begin
      case(HIT_HITM_I)
       2'b00:      fifoMRTag1 = `EXCLUSIVE;
       2'b01:      fifoMRTag1 = `SHARED;
       2'b10:      fifoMRTag1 = `SHARED;
      endcase
      fifoPhase1 = `RESPONSE_PHASE;
      end

      cacheReadOver = 0;
 
    end 
  end
  end // if (!TRAN_OVER ) 
end


always @(posedge clk) begin
  if ( !TRAN_OVER ) begin
  REQ_GRANTED = 0;
  EXT_DATA_O = 0;
   
  found_3=1;
  if (emptySlotPtr != 0 && fifoPhase0 == `RESPONSE_PHASE) index_3 = 0;
  else if (emptySlotPtr != 1 && fifoPhase1 == `RESPONSE_PHASE) index_3 = 1 ;
  else found_3=0;

     
    if ( found_3 ) begin

    tempReqType = (index_3) ? fifoReqType1 : fifoReqType0 ;
    case (tempReqType) 


       `EXT_MRI_Z: begin
                   if (((!index_3)&&( fifoTid0 == PID )) || 
                      ((index_3)&&( fifoTid1 == PID )) ) 
                       REQ_GRANTED =1;
                   end
       `EXT_MR:
                 begin


                   if (((!index_3)&&( fifoTid0 == PID )) || 
                      ((index_3)&&( fifoTid1 == PID )) ) begin
                    if (DRDY_I) begin
                       INT_DATA_O = EXT_DATA_I;
                       REQ_GRANTED =1;
                       INT_TAG = (index_3) ? fifoMRTag1 : fifoMRTag0;
                    end // if (DRDY_I)

                  end 




                   if (((!index_3)&&( fifoTid0 != PID )&&(fifoWBInt0)) || 
                      ((index_3)&&( fifoTid1 != PID )&&(fifoWBInt1) )) begin

                    if ((TRDY)&&(!writeBackOver)) begin
                      DRDY_O = 1;
                      EXT_DATA_O  = (index_3) ? writeBackBuf1 : writeBackBuf0;
                      writeBackOver = 1;
                    end // if ((TRDY)&&(!writeBackOver))

                    else if ( writeBackOver ) begin
                      DRDY_O=0;
                      writeBackOver =0;
                    end // if ( writeBackOver )

                  end // if (fifoTid[index_3] != PID && fifoWBInt[index_3])


                end

       `EXT_MRI:   
                 begin

                   if (((!index_3)&&( fifoTid0 == PID )) ||
                      ((index_3)&&( fifoTid1 == PID )) ) begin
                    if (DRDY_I) begin
                       INT_DATA_O = EXT_DATA_I;
                       REQ_GRANTED =1;
                       INT_TAG = (index_3) ? fifoMRTag1 : fifoMRTag0;
                    end // if (DRDY_I)
                  end




                   if (((!index_3)&&( fifoTid0 != PID )&&(fifoWBInt0)) ||
                      ((index_3)&&( fifoTid1 != PID )&&(fifoWBInt1) )) begin

                    if ((TRDY)&&(!writeBackOver)) begin
                      DRDY_O = 1;
                      EXT_DATA_O  = (index_3) ? writeBackBuf1 : writeBackBuf0;
                      writeBackOver = 1;
                    end // if ((TRDY)&&(!writeBackOver))

                    else if ( writeBackOver ) begin
                      DRDY_O=0;
                      writeBackOver =0;
                    end // if ( writeBackOver )

                  end // if (fifoTid[index_3] != PID && fifoWBInt[index_3])


                end


      `EXT_MW:   begin

                   if (((!index_3)&&( fifoTid0 == PID )) ||
                      ((index_3)&&( fifoTid1 == PID )) ) begin
                    if((TRDY)&&(!reqSentOver)) begin
                      DRDY_O = 1;
                      EXT_DATA_O = writeReqBuf;
                      reqSentOver = 1;
                    end
                    else if ( reqSentOver ) begin
                      REQ_GRANTED =1;
                      DRDY_O=0; 
                      reqSentOver = 0;
                    end
                  end


                   if (((!index_3)&&( fifoTid0 != PID )&&(fifoWBInt0)) ||
                      ((index_3)&&( fifoTid1 != PID )&&(fifoWBInt1) )) begin
                    if (( TRDY ) && ( !reqSentOver)) begin
                       reqSentOver = 1;
                    end
                    else begin
                    if ((TRDY)&&(!writeBackOver)&&(reqSentOver)) begin
                      DRDY_O = 1;
                      EXT_DATA_O  = (index_3) ? writeBackBuf1 : writeBackBuf0;
                      writeBackOver = 1;
                    end 
                    else if ( writeBackOver ) begin
                      DRDY_O=0;
                      writeBackOver =0;
                      reqSentOver = 0;
                    end 
                    end 
                  end
               
               end 
    endcase

    end // if ( found_3) 
    end // if (!TRAN_OVER ) 
    else begin
       if ( emptySlotPtr >= 1 ) begin  
         fifoTid0 = fifoTid1;
         fifoWBInt0 = fifoWBInt1;
         fifoMRTag0 = fifoMRTag1;
         fifoPhase0 = fifoPhase1;
         fifoAddr0 = fifoAddr1;
         fifoReqType0 = fifoReqType1;
         writeBackBuf0 = writeBackBuf1;
       end               
       emptySlotPtr = emptySlotPtr-1;

       fifoPhase1 = `IDLE;
       fifoAddr1 = 0;
       fifoReqType1 = `NOREQ;
       fifoTid1 = 0;
       fifoWBInt1 = 0;
       fifoMRTag1 = `INVALID;
       writeBackBuf1 = 0;
       
    end 
     
 
end
 
endmodule





module MEMORY(clk, ADS_I,   EXT_TRANS_REQ_I,
        EXT_ADDR_I,  HIT_HITM_I,  
        EXT_DATA_I,  DRDY_I,
        TRDY, EXT_DATA_O,DRDY_O,TRAN_OVER);


input ADS_I;
input [2:0] EXT_TRANS_REQ_I;
input [`ADDRESS_WIDTH-1:0] EXT_ADDR_I;
input [1:0] HIT_HITM_I;
input [`DATA_WIDTH-1:0] EXT_DATA_I;
input DRDY_I;
output TRDY;
output DRDY_O;
output [`DATA_WIDTH-1:0] EXT_DATA_O;
output TRAN_OVER;

input clk;

integer i;


wire ADS_I,DRDY_I;
wire[`ADDRESS_WIDTH-1:0] EXT_ADDR_I;
wire[`DATA_WIDTH-1:0] EXT_DATA_I;
wire[1:0] TID_I,HIT_HITM_I;
wire[2:0]  EXT_TRANS_REQ_I;

reg TRDY,DRDY_O;
reg[`DATA_WIDTH-1:0] EXT_DATA_O;

reg [1:0] fifoPhase0;
reg[2:0] fifoReqType0;
reg[`ADDRESS_WIDTH-1:0] fifoAddr0;
reg fifoWriteToReq0;
reg fifoReadFromReq0;
reg fifoReadFromSnoop0;

reg [1:0] fifoPhase1;
reg[2:0] fifoReqType1;
reg[`ADDRESS_WIDTH-1:0] fifoAddr1;
reg fifoWriteToReq1;
reg fifoReadFromReq1;
reg fifoReadFromSnoop1;

reg[`Q_BITS:0] emptySlotPtr;

reg[`Q_BITS-1:0] index_1;
reg[`Q_BITS-1:0] index_2;
reg[`Q_BITS-1:0] index_3;
reg waitWhileSnooperBusy;
reg[`ADDRESS_WIDTH-1:0] address;

reg[`DATA_WIDTH-1:0] memory[`MEM_SIZE-1:0];


reg TRAN_OVER;
reg waitForOneClk;
reg found_1;
reg found_2;
reg found_3;

initial begin

  waitForOneClk =0;
  TRDY = 0;
  DRDY_O=0;
  EXT_DATA_O=0;
  waitWhileSnooperBusy=0;
  emptySlotPtr = 0;
  index_1=0;
  index_2=0;
  index_3=0;
  TRAN_OVER =0;
  address = 0;

    fifoPhase0 = `IDLE;
    fifoAddr0 = 0;
    fifoReqType0 = `NOREQ;
    fifoWriteToReq0=0;
    fifoReadFromReq0=0;
    fifoReadFromSnoop0=0;

    fifoPhase1 = `IDLE;
    fifoAddr1 = 0;
    fifoReqType1 = `NOREQ;
    fifoWriteToReq1=0;
    fifoReadFromReq1=0;
    fifoReadFromSnoop1=0;

  for(i=0;i<`MEM_SIZE;i=i+1) begin
    memory[i] = 1'b1;
  end
  found_1=1;
  found_2=1;
  found_3=1;

end



/*request phase*/
always @(posedge clk) begin
  if ( !TRAN_OVER ) begin

  if (ADS_I) begin

    /*grab the packet*/
    if ( emptySlotPtr == 0 ) begin
      fifoPhase0 = `REQUEST_PHASE;
      fifoReqType0 = EXT_TRANS_REQ_I;
      fifoAddr0 = EXT_ADDR_I;
    end
    else begin
      fifoPhase1 = `REQUEST_PHASE;
      fifoReqType1 = EXT_TRANS_REQ_I;
      fifoAddr1 = EXT_ADDR_I;
    end
    emptySlotPtr = emptySlotPtr+1;

    waitWhileSnooperBusy=1;

  end
  end 

end

/*wait for query granted*/
always @(posedge clk) begin

  if ( !TRAN_OVER ) begin 
 
  found_1 = 1;
  if (emptySlotPtr != 0 && fifoPhase0 == `REQUEST_PHASE) index_1 = 0;
  else if (emptySlotPtr != 1 && fifoPhase1 == `REQUEST_PHASE) index_1 = 1 ;
  else found_1 = 0;

  if (found_1) begin
    if (waitWhileSnooperBusy) begin
      if (index_1)
       fifoPhase1=`SNOOP_PHASE;
      else
       fifoPhase0=`SNOOP_PHASE;
      waitWhileSnooperBusy =0;
    end
  end

  end
end

/*snoop phase*/
always @(posedge clk) begin
  
  if (!TRAN_OVER ) begin

  found_2=1;
  if (emptySlotPtr != 0 && fifoPhase0 == `SNOOP_PHASE) index_2 = 0;
  else if (emptySlotPtr != 1 && fifoPhase1 == `SNOOP_PHASE) index_2 = 1 ;
  else found_2=0;

  if (found_2) begin
    

    if (waitForOneClk) begin 
        if( HIT_HITM_I != 2'b11) begin
          waitForOneClk = 0;
          if ( index_2 ) begin

          fifoWriteToReq1=0;
          fifoReadFromReq1=0;
          fifoReadFromSnoop1=0;
          fifoPhase1 = `RESPONSE_PHASE;
          
          end
          else begin

          fifoWriteToReq0=0;
          fifoReadFromReq0=0;
          fifoReadFromSnoop0=0;
          fifoPhase0 = `RESPONSE_PHASE;
          end

          if ( !index_2) begin
          if (( fifoReqType0 == `EXT_MR )|| ( fifoReqType0 == `EXT_MRI )) begin
             if ( HIT_HITM_I[0] )
               fifoReadFromSnoop0  = 1;
             else
               fifoWriteToReq0  = 1;
          end
          else begin 
             if ( fifoReqType0 == `EXT_MW ) begin
               fifoReadFromReq0 = 1;
               if ( HIT_HITM_I[0] )
                 fifoReadFromSnoop0  = 1;
             end
          end

          end
          else  begin
          if (( fifoReqType1 == `EXT_MR )|| ( fifoReqType1 == `EXT_MRI )) begin
             if ( HIT_HITM_I[0] )
               fifoReadFromSnoop1  = 1;
             else 
               fifoWriteToReq1  = 1;
          end
          else begin 
             if ( fifoReqType1 == `EXT_MW ) begin
               fifoReadFromReq1 = 1;
               if ( HIT_HITM_I[0] )
                 fifoReadFromSnoop1  = 1;
             end
          end
 
          end

 
        end
    end
    else
     waitForOneClk = 1 ;

  end

  end /* if TRAN_OVER */
end

/*response phase*/     
always @(posedge clk) begin
  if ( !TRAN_OVER ) begin
  EXT_DATA_O = 0;
  found_3=1;
  if (emptySlotPtr != 0 && fifoPhase0 == `RESPONSE_PHASE) index_3 = 0;
  else if (emptySlotPtr != 1 && fifoPhase1 == `RESPONSE_PHASE) index_3 = 1 ;
  else found_3=0;

  if (found_3) begin


      if ( index_3 ) begin 
      if ( fifoReadFromReq1 ) begin
         if (!DRDY_I)
            TRDY =1;
         else begin
            TRDY =0;
            address = fifoAddr1;
            memory[address] = EXT_DATA_I;
            fifoReadFromReq1=0;
            if ( !fifoReadFromSnoop1 ) begin
              TRAN_OVER = 1;
            end
         end
      end
      else if  ( fifoReadFromSnoop1 ) begin
          if (!DRDY_I)
            TRDY =1;
          else begin
            TRDY =0;
            fifoReadFromSnoop1=0;
            TRAN_OVER = 1;
          end
       end
       else if (fifoWriteToReq1) begin
         if ( !DRDY_I) begin
           DRDY_O = 1;
           address = fifoAddr1;
           EXT_DATA_O = memory[address];
         end
         else begin
           fifoWriteToReq1 =0;
           DRDY_O = 0;
           TRAN_OVER = 1;
         end
      end
      else
           TRAN_OVER = 1;

      end
      else begin
      if ( fifoReadFromReq0 ) begin
         if (!DRDY_I)  
            TRDY =1;
         else begin
            TRDY =0;
            address = fifoAddr0;
            memory[address] = EXT_DATA_I;
            fifoReadFromReq0=0;
            if ( !fifoReadFromSnoop0 ) begin
              TRAN_OVER = 1;
            end
         end
      end
      else if  ( fifoReadFromSnoop0 ) begin
          if (!DRDY_I)
            TRDY =1;
          else begin
            TRDY =0;
            fifoReadFromSnoop0=0;
            TRAN_OVER = 1;
          end
       end
       else if (fifoWriteToReq0) begin
         if ( !DRDY_I) begin
           DRDY_O = 1;
           address = fifoAddr0;
           EXT_DATA_O = memory[address];
         end 
         else begin 
           fifoWriteToReq0 =0;
           DRDY_O = 0;
           TRAN_OVER = 1;
         end
      end 
      else 
           TRAN_OVER = 1;
    end
   end

  end

end

always @(posedge clk) begin

  

     /* deque transaction */
     if ( TRAN_OVER ) begin
        TRAN_OVER = 0;
         fifoPhase0 = fifoPhase1;
         fifoAddr0 = fifoAddr1;
         fifoReqType0 = fifoReqType1;
         fifoWriteToReq0=fifoWriteToReq1;
         fifoReadFromReq0=fifoReadFromReq1;
         fifoReadFromSnoop0=fifoReadFromSnoop1;

       emptySlotPtr = emptySlotPtr-1;

       fifoPhase1 = `IDLE;
       fifoAddr1 = 0;
       fifoReqType1 = `NOREQ;
       fifoWriteToReq1=0;
       fifoReadFromReq1=0;
       fifoReadFromSnoop1=0;

     end
end


endmodule



