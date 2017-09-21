`timescale 1ns/1ps
`include "mux_32b_4x1.v"

module tb_8bit2to1mux;
	reg [31:0] INP1, INP2, INP3, INP4;
	reg [1:0] SEL;
	wire [31:0] out;
	mux_4x1 M1(out,INP1,INP2,INP3,INP4,SEL);
	initial begin
		$monitor("inp1=%d, inp2=%d, inp3=%d, inp4=%d, sel=%d, out=%d\n", INP1, INP2, INP3, INP4, SEL, out);
		#0 INP1=32'd1;
		INP2=32'd2;INP3=32'd3;INP4=32'd4;
		SEL=2'b00;
		#10 SEL=2'b10;
		#10 SEL=2'b11;
		#10 SEL=2'b01;
		#1000 $finish;
	end
endmodule
