`timescale 1ns/1ps

module jkff(j, k, clr, clk, q);
	input j, k, clr, clk;
	output q;
	reg q;

	always @ (posedge clk)
	begin
		if (!clr) q <= 1'b0;
		else 
		begin
			if (j & k) q <= ~q;
			else if (j) q <= 1'b1;
			else if (k) q <= 1'b0;
			else q <= q;
		end
	end
endmodule
