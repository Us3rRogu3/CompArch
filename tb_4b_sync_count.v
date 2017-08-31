`timescale 1ns/1ps
`include "4b_sync_count.v" 

module Testing;
	reg clk, inp, rst;
	wire [3:0] out;
	reg en;
	sync_count_4b sc(inp, clk, rst, out);
	always @(posedge clk & en)
		begin
			$display($time, "  inp=%b, clk=%b, rst=%b, out=%b\n", inp, clk, rst, out);
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
		#10
		en=1;
		rst=0;
		#10
		rst=1;
		inp=1;
		#10
		#10
		#10
		#10
		inp=0;
		#10
		inp=1;
		#10
		inp=0;
		#10
		#10
		en=0;
	end
endmodule