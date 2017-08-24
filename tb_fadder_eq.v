`timescale 1ns/1ps

module testbench;
	reg [0:2] a;
	wire s, c;
	fadder fad(a[0:2],s,c);
	initial begin
		$monitor(,$time," a=%b, s=%b, c=%b",a[0:2],s,c);
		#0 a[0]=1'b0;a[1]=1'b0;a[2]=1'b0;
		#2 a[0]=1'b0;a[1]=1'b1;a[2]=1'b0;
		#5 a[0]=1'b1;a[1]=1'b0;a[2]=1'b0;
		#10 a[0]=1'b1;a[1]=1'b1;a[2]=1'b1;
		#15 a[0]=1'b0;a[1]=1'b0;a[2]=1'b1;
		#20 a[0]=1'b0;a[1]=1'b1;a[2]=1'b1;
		#100 $finish;
		$dumpfile("tb_fadder_eq.vcd");
		$dumpvars;
	end
endmodule