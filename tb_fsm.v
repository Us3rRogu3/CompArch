`timescale 1ns/1ps
`include "fsm.v" 

module mealy_test;
	reg clk, rst, inp;
	wire outp;
	reg [15:0] seq;
	integer i;
	fsm duty(clk, rst, inp, outp);
	initial begin
		clk = 0;
		rst = 1;
		seq = 16'b0101_0111_0111_0010;
		#5 rst = 0;
		for( i = 0; i <= 15; i = i + 1)
			begin
			inp = seq[i];
			#2 clk = 1;
			#2 clk = 0;
			$display("State = ", duty.state, " Input = ", inp, ", Output = ", outp);
			end
		testing;
		end
	task testing;
	for( i = 0; i <= 15; i = i + 1)
		begin
			inp = $random % 2;
			#2 clk = 1;
			#2 clk = 0;
			$display("State = ", duty.state, " Input = ", inp, ", Output =", outp);
		end
	endtask
endmodule
