`timescale 1ns/1ps

module testbench;
	reg [0:3] a,b;
	wire e, g, l;
	comp_4b comp_4b(a[0:3], b[0:3], g, e, l);
	initial begin
		$monitor(,$time," a=%b, b=%b, greater=%b, lesser=%b, equal=%b",a[0:3],b[0:3], g, l, e);
		#0 a=4'd3;b=4'd8;
		#2 a=4'd8;b=4'd6;
		#5 a=4'd5;b=4'd5;
		#100 $finish;
		$dumpfile("tb_4b_comp.vcd");
		$dumpvars;
	end
endmodule