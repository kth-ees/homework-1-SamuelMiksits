`timescale 1ns/1ns

module decoder_tb;

	logic [3:0] tb_binary = '0;
	logic [15:0] tb_one_hot;

	decoder uut(
		.binary(tb_binary),
		.one_hot(tb_one_hot)
	);

	initial begin
		#50 tb_binary = 4'b0000;
		#50 assert(tb_one_hot == 16'b0000000000000001);
		#50 tb_binary = 4'b0001;
		#50 assert(tb_one_hot == 16'b0000000000000010);
		#50 tb_binary = 4'b0010;
		#50 assert(tb_one_hot == 16'b0000000000000100);
		#50 tb_binary = 4'b0011;
		#50 assert(tb_one_hot == 16'b0000000000001000);
		#50 tb_binary = 4'b0100;
		#50 assert(tb_one_hot == 16'b0000000000010000);
		#50 tb_binary = 4'b0101;
		#50 assert(tb_one_hot == 16'b0000000000100000);
		#50 tb_binary = 4'b0110;
		#50 assert(tb_one_hot == 16'b0000000001000000);
		#50 tb_binary = 4'b0111;
		#50 assert(tb_one_hot == 16'b0000000010000000);
		#50 tb_binary = 4'b1000;
		#50 assert(tb_one_hot == 16'b0000000100000000);
		#50 tb_binary = 4'b1001;
		#50 assert(tb_one_hot == 16'b0000001000000000);
		#50 tb_binary = 4'b1010;
		#50 assert(tb_one_hot == 16'b0000010000000000);
		#50 tb_binary = 4'b1011;
		#50 assert(tb_one_hot == 16'b0000100000000000);
		#50 tb_binary = 4'b1100;
		#50 assert(tb_one_hot == 16'b0001000000000000);
		#50 tb_binary = 4'b1101;
		#50 assert(tb_one_hot == 16'b0010000000000000);
		#50 tb_binary = 4'b1110;
		#50 assert(tb_one_hot == 16'b0100000000000000);
		#50 tb_binary = 4'b1111;
		#50 assert(tb_one_hot == 16'b1000000000000000);
		#50 $stop;
	end;

endmodule
