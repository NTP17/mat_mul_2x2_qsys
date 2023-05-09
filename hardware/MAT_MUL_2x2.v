// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Tue Nov 29 20:30:05 2022"

module MAT_MUL_2x2(
	clock,
	resetn,
	byteenable,
	D,
	Q
);


input wire	clock;
input wire	resetn;
input wire	[3:0] byteenable;
input wire	[31:0] D;
output wire	[31:0] Q;

wire	[31:0] outs;

four_bit_2x2_matrix_multiplier	b2v_inst2(
	.M1_R1C1(D[31:28]),
	.M1_R1C2(D[27:24]),
	.M1_R2C1(D[23:20]),
	.M1_R2C2(D[19:16]),
	.M2_R1C1(D[15:12]),
	.M2_R1C2(D[11:8]),
	.M2_R2C1(D[7:4]),
	.M2_R2C2(D[3:0]),
	.MX_R1C1(outs[31:24]),
	.MX_R1C2(outs[23:16]),
	.MX_R2C1(outs[15:8]),
	.MX_R2C2(outs[7:0]));


reg32	b2v_inst3(
	.clock(clock),
	.resetn(resetn),
	.byteenable(byteenable),
	.D(outs),
	.Q(Q));

endmodule
