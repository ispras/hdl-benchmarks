//typedef enum {IDLE, WAT, RDM, ERR, RDY, RTR } ack_status;   

`define IDLE  3'd0
`define WAT   3'd1
`define RDM   3'd2
`define ERR   3'd3
`define RDY   3'd4
`define RTR   3'd5

module main (clk);
   input clk;
// THE FOLL WIRES ARE USED FOR INTERCONNECTION
   wire [0:31] data_master2slave;
   wire [0:29] address;
   wire [0:3]  opcode;
   wire [3:0]   acknowledge;
   wire        read;
   wire        filled;
   wire        data_ready;
   wire        error;
   wire        timeout;
   wire [0:31] data_slave2master;
   wire        select;
   wire        lock;
   wire        req;
   wire        gnt;
   
  // reg 	       lock_temp, req_tmp;
  // reg [0:3]	       opc_tmp;
//   initial lock_temp = 1; // change this back
  // initial req_tmp = 1;
   //initial opc_tmp = 4'b0001;
   
   
   pi_state_machine slave_0(clk, data_master2slave, address, acknowledge, opcode, read, filled, data_ready, error, timeout, data_slave2master, select);
   dummyslavedevice d_sl_0( filled,error ,data_ready);
   master_controller M_CONT(clk,address,opcode,data_slave2master,data_master2slave,lock,read,req,gnt,timeout,acknowledge);
   bus_cont B_CONT(address,opcode,acknowledge,lock,read,select,gnt,req,timeout,clk);// cahneg lock_temp back to lock and change req_temp back to request
endmodule

`include "master2.v"
 

			  
   











































































