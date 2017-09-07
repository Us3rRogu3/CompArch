`timescale 1ns/1ps

module mux2to1(f, s, a, b);
	output f;
	input a,b,s;
	wire c,d,e;
	
	not n1(c, s);
	and a1(d, c, b);
	and a2(e, s, a);
	or o1(f, e, d);
endmodule