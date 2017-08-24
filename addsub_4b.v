`timescale 1ns/1ps
`include "fadder_bm.v"

module addsub(m, a, b, s, c, o);
	input m;
	input [0:3] a;
	input [0:3] b;
	output [0:3] s;
	output c, o;
	reg [0:3] t;
	wire t1, t2, t3, t4;
	
	always@(m or a or b)
		begin
			if(m==1)
				t=!b;
			else
				t=b;
		end	
	
	fulladder f1(a[3], t[3], m, s[3], t1);
	fulladder f2(a[2], t[2], t1, s[2], t2);
	fulladder f3(a[1], t[1], t2, s[1], t3);
	fulladder f4(a[0], t[0], t3, s[0], c);
	
	assign o = t3 ? !c: c;
endmodule