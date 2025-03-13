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
   wire [0:31] data_master2slave_0;
   wire [0:31] data_master2slave_1;
   wire [0:29] address;
   wire [0:29] address_0;
   wire [0:29] address_1;
   wire [0:3]  opcode;
   wire [0:3]  opcode_0;
   wire [0:3]  opcode_1;
   
   wire [2:0]    acknowledge;
   wire        read;
   wire        read_0;
   wire        read_1;
   wire        filled;
   wire        data_ready;
   wire        error;
   wire        timeout;
   wire [0:31] data_slave2master;
   wire        select;
   wire        lock;
   wire        lock_0;
   wire        lock_1;
   wire        req_0;
   wire        req_1;
   wire        gnt_0;
   wire        gnt_1;

   assign address = address_0 | address_1;
   assign data_master2slave = data_master2slave_0 | data_master2slave_1;
   assign opcode = opcode_0 | opcode_1;
   assign read = read_0 | read_1;
   assign lock = lock_0 | lock_1;
   
  // reg 	       lock_temp, req_tmp;
  // reg [0:3]	       opc_tmp;
//   initial lock_temp = 1; // change this back
  // initial req_tmp = 1;
   //initial opc_tmp = 4'b0001;
   
   
   pi_state_machine slave_0(clk, data_master2slave, address, acknowledge, opcode, read, filled, data_ready, error, timeout, data_slave2master, select);
   dummyslavedevice d_sl_0( filled,error ,data_ready);
   master_controller M_cnt_0(clk,address_0,opcode_0,data_slave2master,data_master2slave_0,lock_0,read_0,req_0,gnt_0,timeout,acknowledge);
   master_controller M_cnt_1(clk,address_1,opcode_1,data_slave2master,data_master2slave_1,lock_1,read_1,req_1,gnt_1,timeout,acknowledge);
   bus_cont B_cnt(address,opcode,acknowledge,lock,read,select,gnt_0,gnt_1,req_0,req_1,timeout,clk);// cahneg lock_temp back to lock and change req_temp back to request
endmodule

`include "master2.v"
 

			  
   











































































