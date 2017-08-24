`timescale 1ns/1ps
`include "addsub_4b.v"

module testbench;
	reg [0:3] a;
	reg [0:3] b;
	reg m;
	wire [0:3] s;
	wire c;
	wire o;
	addsub add(m,a,b,s,c,o);
	initial begin
		$monitor(,$time," a=%b, b=%b, m=%b; s=%b, c=%b, over=%d",a[0:3],b[0:3],m, s[0:3],c,o);
		#0 a=8'd3;b=8'd5;m=1'b0;
		#2 a=8'd7;b=8'd5;
		#5 a=8'd10;b=8'd10;
		#10 a=8'd10;b=8'd10;m=1'b1;
		#15 a=8'd6;b=8'd3;
		#20 a=8'd2;b=8'd7;
		#100 $finish;
		$dumpfile("tb_adder8.vcd");
		$dumpvars;
	end
endmodule