`timescale 1ns/1ps
`include "fadder_bm.v"

module testbench;
	reg a;
	reg b;
	reg cin;
	wire s;
	wire c;
	fulladder add(a,b,cin,s,c);
	initial begin
		$monitor(,$time," a=%b, b=%b, cin=%b; s=%b, c=%b",a,b,cin, s,c);
		#0 a=1'b1;b=1'b0;cin=1'b0;
		#2 a=1'b1;b=1'b1;cin=1'b0;
		#5 a=1'b1;b=1'b0;cin=1'b1;
		#10 a=1'b1;b=1'b1;cin=1'b1;
		#15 a=1'b0;b=1'b0;cin=1'b0;
		#20 
		#100 $finish;
		$dumpfile("tb_adder8.vcd");
		$dumpvars;
	end
endmodule