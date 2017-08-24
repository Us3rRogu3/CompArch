`timescale 1ns/1ps

module fulladder(x, y, cin, s, c);
	input x, y, cin;
	output reg s, c;
	
	always@(x or y or cin)
		begin
		{c, s} = x+y+cin;
		end
endmodule