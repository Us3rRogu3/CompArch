`timescale 1ns/1ps
`include "jkff.v" 

module Testing;
	reg j, k, clk, rst;
	reg en;
	wire q;
	jkff dff (j, k, rst, clk, q);
	always @(posedge clk & en)
		begin
			$display("j=%b, k=%b, clk=%b, rst=%b, q=%b\n", j, k, clk, rst, q);
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
		j=0; k=0; rst=0;
		#10
		j=1; k=0; rst=1;
		#10
		k=1; j=0;
		#10
		k=1; j=1;
		#10
		k=0; j=0;
		#10
		j=1; k=1;
		#10
		#10
		en=0;
	end
endmodule