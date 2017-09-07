`timescale 1ns/1ps
`include "mux_8b_2x1.v"

module bit32_2to1mux(out,sel,in1,in2);
	input [31:0] in1,in2;
	output [31:0] out;
	input sel;
	bit8_2to1mux m0(out[7:0],sel,in1[7:0],in2[7:0]);
	bit8_2to1mux m1(out[15:8],sel,in1[15:8],in2[15:8]);
	bit8_2to1mux m2(out[23:16],sel,in1[23:16],in2[23:16]);
	bit8_2to1mux m3(out[31:24],sel,in1[31:24],in2[31:24]);
endmodule 

module bit32_2to1mux_loop(out,sel,in1,in2);
	input [31:0] in1,in2;
	output [31:0] out;
	input sel;
	genvar i;
	generate
		for(i=0;i<32; i=i+1) begin: mux_loop
			mux2to1 temp(out[i], sel, in1[i], in2[i]);
		end
	endgenerate
endmodule 
