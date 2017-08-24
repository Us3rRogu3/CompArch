`timescale 1ns/1ps
`include "fadder_eq.v"

module adder8(a, b, cin, s, c);
	input [0:7] a;
	input [0:7] b;
	input cin;
	output [0:7] s;
	output c;
	wire c0,c1,c2,c3,c4,c5,c6;
	
	fadder f1({a[7], b[7], cin}, s[7], c0);
	fadder f2({a[6], b[6], c0}, s[6], c1);
	fadder f3({a[5], b[5], c1}, s[5], c2);
	fadder f4({a[4], b[4], c2}, s[4], c3);
	fadder f5({a[3], b[3], c3}, s[3], c4);
	fadder f6({a[2], b[2], c4}, s[2], c5);
	fadder f7({a[1], b[1], c5}, s[1], c6);
	fadder f8({a[0], b[0], c6}, s[0], c);
endmodule