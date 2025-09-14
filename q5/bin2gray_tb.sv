`timescale 1ns/1ns

module bin2gray_tb();
	
	logic [3:0] binary_tb = '0;
	logic [3:0] gray_tb;

	bin2gray bin2gray_tb(
		.binary(binary_tb),
		.gray(gray_tb)
	);

	// Kind of a dumb test, just copy pastes the LUT into the test suite
	initial begin
		#50 binary_tb = 4'b0000;
		#50 assert(gray_tb == 4'b0000);
		#50 binary_tb = 4'b0001;
		#50 assert(gray_tb == 4'b0001);
		#50 binary_tb = 4'b0010;
		#50 assert(gray_tb == 4'b0011);
		#50 binary_tb = 4'b0011;
		#50 assert(gray_tb == 4'b0010);
		#50 binary_tb = 4'b0100;
		#50 assert(gray_tb == 4'b0110);
		#50 binary_tb = 4'b0101;
		#50 assert(gray_tb == 4'b0111);
		#50 binary_tb = 4'b0110;
		#50 assert(gray_tb == 4'b0101);
		#50 binary_tb = 4'b0111;
		#50 assert(gray_tb == 4'b0100);
		#50 binary_tb = 4'b1000;
		#50 assert(gray_tb == 4'b1100);
		#50 binary_tb = 4'b1001;
		#50 assert(gray_tb == 4'b1101);
		#50 binary_tb = 4'b1010;
		#50 assert(gray_tb == 4'b1111);
		#50 binary_tb = 4'b1011;
		#50 assert(gray_tb == 4'b1110);
		#50 binary_tb = 4'b1100;
		#50 assert(gray_tb == 4'b1010);
		#50 binary_tb = 4'b1101;
		#50 assert(gray_tb == 4'b1011);
		#50 binary_tb = 4'b1110;
		#50 assert(gray_tb == 4'b1001);
		#50 binary_tb = 4'b1111;
		#50 assert(gray_tb == 4'b1000);
		#50 $stop;
	end
	
endmodule
