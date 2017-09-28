module demux_5b_5x32(sel, out);
	input[4:0] sel;
	output[31:0] out;
	integer i;
	always@(sel) begin
		i = sel;
	end
	assign out = 32'd0;
	assign out[i] = 1'b1;
endmodule
	