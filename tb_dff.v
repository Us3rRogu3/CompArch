`timescale 1ns/1ps
`include "dff.v" 

module Testing;
	reg d, clk, rst;
	reg en;
	wire q, q2;
	dff_sync_clear dff (d, rst, clk, q);
	dff_async_clear dff2 (d, rst, clk, q2);
	always @(posedge clk & en)
		begin
			$display("d=%b, clk=%b, rst=%b, dff_sync_q=%b, dff_async_q=%b\n", d, clk, rst, q, q2);
		end
	
	initial begin
		forever begin
			clk=0;
			#5
			clk=1;
			#5
			clk=0;
		end
	end
	initial begin
		#0
		en=1;
		d=0; rst=1;
		#10
		d=1; rst=0;
		#10
		d=1; rst=1;
		#10
		d=0; rst=0;
		#10
		d=0; rst=1;
		#10
		d=1; rst=1;
		#10
		en=0;
	end
endmodule