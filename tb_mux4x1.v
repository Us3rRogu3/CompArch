`timescale 1ns/1ps

module testbench;
	reg [0:3] a;
	reg [0:1] b;
	wire f;
	mux4x1_gate mux_gate(a[0:3],f,b[0:1]);
	initial begin
		$monitor(,$time," a=%b, b=%b, f=%b",a[0:3],b[0:1],f);
		#0 a[0]=1'b0;a[1]=1'b0;a[2]=1'b0;a[3]=1'b0;b[0]=1'b0;b[1]=1'b0;
		#2 a[0]=1'b0;a[1]=1'b1;a[2]=1'b0;a[3]=1'b1;b[0]=1'b0;b[1]=1'b0;
		#5 b[0]=1'b1;b[1]=1'b0;
		#10 b[0]=1'b1;b[1]=1'b1;
		#15 b[0]=1'b0;b[1]=1'b1;
		#20 b[0]=1'b0;b[1]=1'b0;
		#100 $finish;
		$dumpfile("tb_mux_4x1.vcd");
		$dumpvars;
	end
endmodule