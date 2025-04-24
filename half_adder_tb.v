`timescale 1ns/1ps
module half_adder_tb;
	reg a,b;
	wire sum, carry;
	integer f;

	half_adder uut(
	.a(a),
	.b(b),
	.sum(sum),
	.carry(carry)
	);

	initial begin
		$dumpfile("half_adder.vcd");
		$dumpvars(0, half_adder_tb);
		
		f=$fopen("C:/VerilogProjects/verilog-half-adder/monitor_log.txt","w");
		if(!f) begin
			$display("Failed to open file.");	
			$finish;
		end
		$display("File opened.");
	
		a=0;b=0;#10;
		$display("現在寫入中: a=%b b=%b sum=%b carry=%b", a, b, sum, carry);
		$fwrite(f,"a=%b, b=%b, sum=%b, carry=%b @ %0t ns\n", a,b,sum, carry,$time);
		a=0;b=1;#10;
		$display("現在寫入中: a=%b b=%b sum=%b carry=%b", a, b, sum, carry);
		$fwrite(f,"a=%b, b=%b, sum=%b, carry=%b @ %0t ns\n", a,b,sum, carry,$time);
		a=1;b=0;#10;
		$display("現在寫入中: a=%b b=%b sum=%b carry=%b", a, b, sum, carry);
		$fwrite(f,"a=%b, b=%b, sum=%b, carry=%b @ %0t ns\n", a,b,sum, carry,$time);
		a=1;b=1;#10;
		$display("現在寫入中: a=%b b=%b sum=%b carry=%b", a, b, sum, carry);
		$fwrite(f,"a=%b, b=%b, sum=%b, carry=%b @ %0t ns\n", a,b,sum, carry,$time);
		$fclose(f);
		$display("Simulation done.");
		#100;  // 最後補上停留一段時間觀察
		$finish;
	end
endmodule