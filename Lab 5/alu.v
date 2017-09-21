`timescale 1ns/1ps
`include "and_32b.v"
`include "or_32b.v"
`include "fa_32b.v"
`include "mux_32b_2x1.v"
`include "not_32b.v"

module ALU(a,b,bin,cin,op,out,cout);
	input [31:0] a, b;
	output [31:0] out;
	reg [31:0] out;
	input cin,bin;
	input [1:0] op;
	output cout;
	reg cout;
	wire [31:0] o1, o2, o3, w, n1;
	wire co;
	not_32b m1(n1, b);
	bit32_2to1mux_loop m2(w, bin, n1, b);	
	and_32b m3(o1, a, w);
	or_32b m4(o2, a, w);
	fa_32b m5(o3, a, w, cin, co);
	always @ (bin or op)
		begin
			if(op == 2'b00) assign out = o1;
			else 
				begin
					if(op == 2'b01) assign out = o2;
					else assign out = o3; assign cout = co;
				end
		end
endmodule