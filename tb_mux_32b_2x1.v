`timescale 1ns/1ps
`include "mux_32b_2x1.v"

module tb_8bit2to1mux;
	reg [31:0] INP1, INP2;
	reg SEL;
	wire [31:0] out;
	bit32_2to1mux_loop M1(out,SEL,INP1,INP2);
	initial begin
		$monitor("inp1=%b, inp2=%b, sel=%b, out=%b\n", INP1, INP2, SEL, out);
		#0 INP1=32'd1100;
		INP2=32'd2000;
		SEL=1'b0;
		#100 SEL=1'b1;
		#1000 $finish;
	end
endmodule
