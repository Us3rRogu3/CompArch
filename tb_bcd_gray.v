`timescale 1ns/1ps

module testbench;
	reg [0:3] i;
	wire [0:3] f;
	bcd_gray bcd_gray(i[0:3], f[0:3]);
	initial begin
		$monitor(,$time," i=%b, f=%b",i[0:3],f[0:3]);
		#0 i=4'd3;
		#2 i=4'd8;
		#5 i=4'd5;
		#10 i=4'd6;
		#20 i=4'd9;
		#100 $finish;
		$dumpfile("tb_bcd_gray.vcd");
		$dumpvars;
	end
endmodule