module altsyncram
  #(
    //----------------------------------------------------------------------
    parameter intended_device_family = "Stratix",
	parameter operation_mode = "DUAL_PORT",
    parameter lpm_type = "altsyncram",
    parameter read_during_write_mode_mixed_ports = "DONT_CARE",
    parameter power_up_uninitialized = "TRUE",
    parameter byte_size = 8,
    parameter width_byteena_a = 4,
    parameter numwords_a = 128,
    parameter numwords_b = 128,
    parameter width_a = 32,     // Data Width in bits
    parameter width_b = 32,     // Data Width in bits
    parameter widthad_a = 7,     // Address Width in bits
    parameter widthad_b = 7,     // Address Width in bits
    parameter address_reg_b = "CLOCK0",
    parameter outdata_reg_b = 0,
    parameter indata_aclr_a = "NONE",
    parameter wrcontrol_aclr_a = "NONE",
    parameter address_aclr_a = "NONE",
    parameter address_aclr_b = "NONE",
    parameter outdata_aclr_b = "NONE",
    parameter outdata_reg_a = "NONE",
    parameter outdata_aclr_a = "NONE",
    parameter lpm_hint = "NONE"

    //----------------------------------------------------------------------
    ) (
    input clock0,
	input clock1,
    input wren_a,
    input [width_byteena_a-1:0] byteena_a,
    input [width_a-1:0] data_a,
    input [widthad_a-1:0] address_a,
    output [width_b-1:0] q_b,
    input [widthad_b-1:0] address_b,
    input aclr0,
    input aclr1,
    input byteena_b,
    input rden_b,
    input data_b,
    input wren_b,
    output q_a,
    input clocken0,
    input clocken1,
    input addressstall_a,
    input addressstall_b
       );
endmodule
