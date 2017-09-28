`timescale 1ns/1ps
`include "mux_32b_32x1.v"

module tb_mux;
	reg [31:0][31:0] INP;
	reg [4:0] SEL;
	wire [31:0] out;
	mux_32b_32x1 M1(SEL, INP, out);
	initial begin
		$monitor("sel=%d, out=%d\n", SEL, out);
		#0 INP[0]=32'd1100;
		INP[1]=32'd1101;
		INP[2]=32'd1102;
		INP[3]=32'd1103;
		INP[4]=32'd1104;
		INP[5]=32'd1105;
		INP[6]=32'd1106;
		INP[7]=32'd1107;
		INP[8]=32'd1108;
		INP[9]=32'd1109;
		INP[10]=32'd1110;
		INP[11]=32'd1111;
		SEL=5'd3;
		#10 SEL=5'd5;
		#10 SEL=5'd7;
		#10 SEL=5'd11;
		#10 SEL=5'd2;
		#10 $finish;
	end
endmodule
