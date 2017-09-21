`timescale 1ns/1ps
`include "fa_32b.v"

module tb_8bit2to1mux;
	reg [31:0] INP1, INP2;
	reg cin;
	wire cout;
	wire [31:0] out;
	fa_32b M1(out,INP1,INP2, cin, cout);
	initial begin
		$monitor("inp1=%d, inp2=%d, cin=%b, out=%d, cout=%b\n", INP1, INP2, cin, out, cout);
		#0 INP1=32'd1100;
		INP2=32'd2000;
		cin=1'b0;
		#20 INP1=32'd2100;
		INP2=32'd2500;
		cin=1'b1;
		#1000 $finish;
	end
endmodule
