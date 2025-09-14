`timescale 1ns/1ns

module CSA_8_tb ();

	logic [7:0] A_tb = 'b0, B_tb = 'b0, sum_tb;
	logic carry_tb;

	CSA_8 CSA_8_uut(
		.A(A_tb),
		.B(B_tb),
		.sum(sum_tb),
		.carry(carry_tb)
	);

	initial begin

		// Just a couple of sum examples:

		// Simple test
		// carry 00000 0000
		// A:     0000 0000
		// B:     1111 1111
		// sum:   1111 1111
		#50 A_tb = '0; B_tb = '1;
		#50 assert( carry_tb == 0 && sum_tb == 8'b11111111);

		// Check when carry out is 1
		// carry 11111 0110
		// A:     0101 1001
		// B:     1111 1011
		// sum:   0101 0100
		#50 A_tb = 8'b01011001; B_tb = 8'b11111011;
		#50 assert( carry_tb == 1 && sum_tb == 8'b01010100);
		
		// Check when carry out is 0
		// carry 00111 1110
		// A:     0011 1101
		// B:     0010 1011
		// sum:   0110 1000
		#50 A_tb = 8'b00111101; B_tb = 8'b00101011;
		#50 assert( carry_tb == 0 && sum_tb == 8'b01101000);

		#50 $stop;
	end;

endmodule
