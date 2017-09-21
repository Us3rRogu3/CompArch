`timescale 1ns/1ps
`include "mux_8b_2x1.v"

module tb_8bit2to1mux;
	reg [7:0] INP1, INP2;
	reg SEL;
	wire [7:0] out;
	bit8_2to1mux M1(out,SEL,INP1,INP2);
	initial begin
		$monitor("inp1=%b, inp2=%b, sel=%b, out=%b\n", INP1, INP2, SEL, out);
		#0 INP1=8'b10101010;
		INP2=8'b01010101;
		SEL=1'b0;
		#100 SEL=1'b1;
		#1000 $finish;
	end
endmodule
