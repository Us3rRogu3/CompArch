`timescale 1ns/1ps

module testbench;
	reg a,b,s;
	wire f;
	mux2to1_gate mux_gate(a,b,s,f);
	initial begin
		$monitor(,$time," a=%b, b=%b, s=%b f=%b",a,b,s,f);
		#0 a=1'b0;b=1'b1;
		#2 s=1'b1;
		#5 s=1'b0;
		#10 a=1'b1;b=1'b0;
		#15 s=1'b1;
		#20 s=1'b0;
		#100 $finish;
		$dumpfile("tb_mux_2x1.vcd");
		$dumpvars;
	end
endmodule