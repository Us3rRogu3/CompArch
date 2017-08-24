`timescale 1ns/1ps
`include "adder_8b.v"

module testbench;
	reg [0:7] a;
	reg [0:7] b;
	reg cin;
	wire [0:7] s;
	wire c;
	adder8 add(a,b,cin,s,c);
	initial begin
		$monitor(,$time," a=%b, b=%b, cin=%b; s=%b, c=%b",a[0:7],b[0:7],cin, s[0:7],c);
		#0 a=8'd3;b=8'd5;cin=1'b0;
		#2 a=8'd8;b=8'd5;
		#5 a=8'd200;b=8'd100;cin=1'b1;
		#10
		#15 
		#20 
		#100 $finish;
		$dumpfile("tb_adder8.vcd");
		$dumpvars;
	end
endmodule