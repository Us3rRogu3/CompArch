`timescale 1ns/1ps

module testbench;
	reg [0:2] a;
	wire [0:7] f;
	decoder dec(a[0:2],f[0:7]);
	initial begin
		$monitor(,$time," a=%b, f=%b",a[0:2],f[0:7]);
		#0 a[0]=1'b0;a[1]=1'b0;a[2]=1'b0;
		#2 a[0]=1'b0;a[1]=1'b1;a[2]=1'b0;
		#5 a[0]=1'b1;a[1]=1'b0;a[2]=1'b0;
		#10 a[0]=1'b1;a[1]=1'b1;a[2]=1'b1;
		#15 a[0]=1'b0;a[1]=1'b0;a[2]=1'b1;
		#20 a[0]=1'b0;a[1]=1'b1;a[2]=1'b1;
		#100 $finish;
		$dumpfile("tb_decoder_3x8.vcd");
		$dumpvars;
	end
endmodule