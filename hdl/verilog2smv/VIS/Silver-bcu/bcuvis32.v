/*
*
*	Taken from VIS Benchmarks <ftp://vlsi.colorado.edu/pub/vis/vis-verilog-models-1.3.tar.gz>
*	Modified by Ahmed Irfan <irfan@fbk.eu>
*
*/
`define address_size 32
//`define mem_address 2
`define address [(`address_size-1):0]

`define dataword_size   32
`define dataword [(`dataword_size-1):0]

`define instruction_size 32
`define instruction [(`instruction_size-1):0]

`define memory_bus_size 32
`define memory_bus [(`memory_bus_size-1):0]

`define DEBUG_BCU 0
//`define BCU_DEBUG if(`DEBUG_BCU) $display

// module BCU: the Bus Control Unit for the Silver Group's Alpha-subset.
//
// The BCU has the following interfaces to other modules of the chip:
//	- I-cache misses cause read requests to the BCU.
//	- D-cache misses cause read requests to the BCU.
//	- The D-cache is write-through, so, store instructions
//		case write requests to the BCU.
//
// The I-cache and D-cache groups stated that they wanted a request
//	size which is the (pinout) data bus width. This means that
//	if the cache line length(s) are different from that, it's
//	their  responsibility to perform multiple read requests,
//	in whatever order they choose.
// There is a shared read data path to the Icache and Dcache.
// It has been suggested, for simulation purposes, that offchip memory
//	will take ~~ 7 clocks. However, the BCU does not offer
//	predictable timing. A control line will be asserted during
//	a clock period when read data is available. It is assumed
//	that the read data is consumed during that clock period.
// The write buffers can be filled faster than they can be emptied.
//	So, writes to the BCU involve a full handshake, and the writer
//	must be prepared to stall.
// The start_shutdown event will cause the BCU to abandon any pending
//	read, and finish any pending write. It will then flush any
//	write buffers, and then raise the finished_shutdown event.
//	Will ignore subsequent requests until reset again.
//
// Authors: 
//	Upasani Rajashree Shrikant <Rajashree.Upasani@colorado.edu>
//	Donald Lindsay <lindsay@cs.colorado.edu>
//
// Things punted:
//	- now doing everything on the chip's clock. Should we have
//		a pinout clock (SysClockOut1) ?
//	- `ifdef behavioral, once we have non-behavioral code.
//	- need to think about signal timing relative to other modules
//		(to insure ordering within the simulation)
//---------------------------------------------

module bcu( sys_clk, iResetn, cache_DBUS_reg, iIcache_address, iDcache_address,
	iIcache_request_n, iDcache_request_n, Icache_done_n_reg, Dcache_done_n_reg,
	iwrite_size, iwrite_data, iwrite_request_n, write_accept_n_reg,
	mem_address_reg, imem_busin,mem_busout_reg, mem_control_reg, imem_ack, mem_valid_reg,
	imem_enable_n, imem_data_read_ack
	);


// cache read interfaces
   	output `memory_bus cache_DBUS_reg;	// Data satisfying a read request.
	reg cache_DBUS_reg;

	input `address
		iIcache_address, 	// Assert whenever
		iDcache_address;		//   a request is asserted.
	input 	iIcache_request_n,	// Assert for 1 clk. Do not assert
		iDcache_request_n;	//   again until after get "done".
	
  	reg `address Icache_address, 
			Dcache_address;
	reg Icache_request_n,
		Dcache_request_n;
 
        output	Icache_done_n_reg,	// Asserted ==> cache_DBUS is valid.
		Dcache_done_n_reg;	// Is asserted for 1 clk.
	reg Icache_done_n_reg;
	reg Dcache_done_n_reg;

// Write-data interface
	input	iwrite_size;		// 0==> 4 bit, 1==> 8 bit.
					// Valid while request asserted.
 	reg write_size;
	// address is Dcache_address. Valid while request asserted.
	input `dataword iwrite_data;	// Valid while request asserted.
	reg `dataword write_data;
	input  	iwrite_request_n;	// Assert until write_accept.
        reg write_request_n;	
   	output 	write_accept_n_reg;	// If asserted during same clk as
					//   a write_request, a different
					//   write may be done on next clk.
	reg write_accept_n_reg;


// memory interface

	input `memory_bus imem_busin; 	//input bus
	reg `memory_bus mem_busin;
	input imem_ack;			// (==cAck in 21064)
	reg mem_ack;
	input imem_enable_n;		// (==dOE_l in 21064)
 	reg mem_enable_n;
	input imem_data_read_ack;	// (==dRack in 21064)
	reg mem_data_read_ack;
	output `address mem_address_reg;
	output `memory_bus mem_busout_reg; 	// output of offchip 
	output [2:0] mem_control_reg;	// read,write or NOP
					// (==cReq_h in 21064)
	output [2:0] mem_valid_reg;	// mask over vax-longs in a cache line
					// (==cWMask_h in 21064)
					// Lo 4 bits apply to first bus
					// 	transaction, hi to second,
					// 	all-0 suppresses transaction.
	reg `address mem_address_reg;
	reg `memory_bus mem_busout_reg;
	reg [2:0] mem_control_reg;	
	reg [2:0] mem_valid_reg;

	// Note, dWSel_h isn't relevant, because we always write the lo
	// half, and can't be told to do anything else.
	

// other
	input	sys_clk;
	input	iResetn;
	reg Resetn;
//------------------------------------------

// Internal latches of inputs

//reg `dataword write_data_reg;
//reg write_size_reg;

//------------------------------------------
// Internal state

`define CUST_NONE	2'b00
`define CUST_IFU	2'b01
`define CUST_MAU_READ	2'b10
`define CUST_MAU_WRITE	2'b11

reg [1:0] customer;
reg data_in_next_cycle;
  

initial 
   begin
     customer = `CUST_NONE;
     data_in_next_cycle = 0;
     write_accept_n_reg = 1'b1;
     mem_address_reg = 32'h0000_0000;
     mem_busout_reg = 32'h0000_0000;
     mem_control_reg = 3'b000;	
     mem_valid_reg = 3'b000;
     cache_DBUS_reg = 32'h0000_0000;
     Icache_done_n_reg = 1'b0;
     Dcache_done_n_reg = 1'b0;
      Resetn = 1'b0;
      Icache_address = 32'h0000_0000;
      Dcache_address = 32'h0000_0000;
      Icache_request_n = 0;
      Dcache_request_n = 0;
      write_size = 0;
      write_data = 32'h0000_0000;
      write_request_n = 0;	
      mem_busin = 32'h0000_0000;
      mem_ack = 0;
      mem_enable_n = 0;
      mem_data_read_ack = 0;
end

   always @(posedge sys_clk) begin
      Resetn <= iResetn;
      Icache_address <= iIcache_address;
      Dcache_address <= iDcache_address;
      Icache_request_n <= iIcache_request_n;
      Dcache_request_n <= iDcache_request_n;
      write_size <= iwrite_size;
      write_data <= iwrite_data;
      write_request_n <= iwrite_request_n;	
      mem_busin <= imem_busin;
      mem_ack <= imem_ack;
      mem_enable_n <= imem_enable_n;
      mem_data_read_ack <= imem_data_read_ack;
   
      if( Resetn ) begin 		// not being reset: normal operation.
	 //if( customer != `CUST_MAU_WRITE )
	   //customer = `CUST_NONE;		// cleanliness
	 //else begin
	 if( customer != `CUST_MAU_WRITE ) 
	   write_accept_n_reg <= 1'b1;  // deassert customer's ack
	 casez( customer )
	   `CUST_NONE: begin
	      // look for customers, we're idle.
	      if( !Icache_request_n ) begin
		 customer <= `CUST_IFU;
		 mem_address_reg <= Icache_address 
				   & 32'hFFFF_FFF0;
	      end		// 
	      else if( !Dcache_request_n ) begin
		 customer <= `CUST_MAU_READ;
		 mem_address_reg <= Dcache_address
				   & 32'hFFFF_FFF0;
	      end
	      else if( !write_request_n ) begin
		 customer <= `CUST_MAU_WRITE;
		 mem_address_reg <= Dcache_address;
		 data_in_next_cycle <= 0;
	      end
	   end // case: `CUST_NONE
	   
	   `CUST_IFU: begin
	      if( mem_data_read_ack == 1'b1 ) begin
		 cache_DBUS_reg <= mem_busin;
		 Icache_done_n_reg <= 0;  //tell customer
	      end
	      else if( mem_ack == 1'b0 ) begin
		 customer <= `CUST_NONE;
		 mem_control_reg <= 3'b000; // stop memory
		 Icache_done_n_reg <= 1; 	  // tell customer
	      end
	      else begin
		 mem_control_reg <= 3'b001; // read block
	      end
	   end
	   `CUST_MAU_READ: begin
	      if( mem_data_read_ack == 1'b1 ) begin
		 cache_DBUS_reg <= mem_busin;// 
		 Dcache_done_n_reg <= 0; // tell customer
	      end		// 
	      else if( mem_ack == 3'b000 ) begin
		 customer <= `CUST_NONE;
		 mem_control_reg <= 3'b000; // stop memory
		 Dcache_done_n_reg <= 1; 	  // tell customer
	      end		// 
	      else begin
		 mem_control_reg <= 3'b001; // read block
	      end
	   end
	   `CUST_MAU_WRITE: begin
	      if( mem_enable_n ) begin
		 data_in_next_cycle <= 1;
	      end
	      else if( data_in_next_cycle ) begin
		 data_in_next_cycle <= 0;
		 mem_busout_reg <= cache_DBUS_reg;// data  out
	      end
	      else if( mem_ack == 3'b000 ) begin	// done
		 customer <= `CUST_NONE;
		 mem_control_reg <= 3'b000; 	// stop mem
		 write_accept_n_reg <= 0; 	//tell customer
		 //mem_busout_reg = 32'hzz;
		 
	      end
	      else begin
		 write_accept_n_reg <= 1;
		 mem_control_reg <= 3'b010; //write block
		 control_lanes;
	      end
	   end
	 endcase
      end // if ( Resetn )
   end // always @ (posedge sys_clk)

//-------------------------------------------
// We are writing 8 bits to memory.
// Must steer the data to the correct output pins, and tell the memory
//	where we put it.
// Takes: write_size, mem_address
// Sets: mem_valid_reg, mem_busout_reg
   
   task control_lanes;
      begin
	 if( write_size == 0 ) begin	// 32 bit
	    casez( mem_address_reg[1:0] )
	      2'b11:  begin
		 mem_valid_reg <= 3'b001;
		 mem_busout_reg[7:0] <= write_data[7:0];
	      end
	      2'b10:  begin
		 mem_valid_reg <= 3'b010;
		// mem_busout_reg[63:] = write_data_reg[7:0];
	      end
	      2'b01:  begin
		 mem_valid_reg <= 3'b011;
		// mem_bus_reg[95:64] = write_data_reg[31:0];
	      end
	      2'b00:  begin
		 mem_valid_reg <= 3'b100;
		// mem_bus_reg[127:96]= write_data_reg[31:0];
	      end		// 
	    endcase
	 end
	 else begin			// 64 bit
	    casez( mem_address_reg[3:0] )
	      2'b10:  begin
		 mem_valid_reg <= 3'b101;
		// mem_bus_reg[63:0] = {write_data_reg[31:0],
				 //     write_data_reg[63:32]};
	      end
	      2'b00:  begin
		 mem_valid_reg <= 3'b110;
		// mem_bus_reg[127:64] = {write_data_reg[31:0],
			//		write_data_reg[63:32]};
	      end
	    endcase
	 end
      end
   endtask

//invariant: #Any where in the state when customer is 3 write_accept_n_reg is 1
//customer[1:0]= 3 -> write_accept_n_reg = 1;   
	assert property (	customer!=2'd3 || write_accept_n_reg == 1'd1	);
endmodule // bcu



















