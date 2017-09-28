`timescale 1ns/1ps
`include "regfile.v"

module tb_mux;
	reg clk, rst, regwrite;
	reg [4:0] read1, read2, writer;
	reg [31:0] writed;
	wire [31:0] read_d1, read_d2;
	regFile r1(clk, rst, read1, read2, writed, writer, regwrite, read_d1, read_d2);
	always @(clk)
	#5 clk<=~clk;
	initial begin
		$monitor("clk=%b, rst=%b, read1=%d, read2=%d, writed=%b, writer=%d, regwrite=%b, read_d1=%b, read_d2=%b\n", clk, rst, read1, read2, writed, writer, regwrite, read_d1, read_d2);
		#10 SEL=5'd5;
		#10 SEL=5'd7;
		#10 SEL=5'd11;
		#10 SEL=5'd2;
		#10 $finish;
	end
endmodule
