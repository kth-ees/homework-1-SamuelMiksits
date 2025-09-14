`timescale 1ns/1ns

module count_1_tb();
	
	logic [3:0] a_tb = '0;
	logic [2:0] out_tb;

	count_1 count_1_tb(
		.a(a_tb),
		.out(out_tb)
	);

	// Kind of a dumb test, just copy pastes the LUT into the test suite
	initial begin
		#50 a_tb = 4'b0000;
		#50 assert(out_tb == 3'b000);
		#50 a_tb = 4'b0001;
		#50 assert(out_tb == 3'b001);
		#50 a_tb = 4'b0010;
		#50 assert(out_tb == 3'b001);
		#50 a_tb = 4'b0011;
		#50 assert(out_tb == 3'b010);
		#50 a_tb = 4'b0100;
		#50 assert(out_tb == 3'b001);
		#50 a_tb = 4'b0101;
		#50 assert(out_tb == 3'b010);
		#50 a_tb = 4'b0110;
		#50 assert(out_tb == 3'b010);
		#50 a_tb = 4'b0111;
		#50 assert(out_tb == 3'b011);
		#50 a_tb = 4'b1000;
		#50 assert(out_tb == 3'b001);
		#50 a_tb = 4'b1001;
		#50 assert(out_tb == 3'b010);
		#50 a_tb = 4'b1010;
		#50 assert(out_tb == 3'b010);
		#50 a_tb = 4'b1011;
		#50 assert(out_tb == 3'b011);
		#50 a_tb = 4'b1100;
		#50 assert(out_tb == 3'b010);
		#50 a_tb = 4'b1101;
		#50 assert(out_tb == 3'b011);
		#50 a_tb = 4'b1110;
		#50 assert(out_tb == 3'b011);
		#50 a_tb = 4'b1111;
		#50 assert(out_tb == 3'b100);
		#50 $stop;
	end
	
endmodule
