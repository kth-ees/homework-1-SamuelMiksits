`timescale 1ns/1ns

module ArithmeticRightShifter_tb (
);


	// Test with 8 bits
	logic [7:0] input_data_tb = '0;
	logic [1:0] control_tb = '0;
	logic [7:0] shifted_result_tb;

	
	// Circuit
	ArithmeticRightShifter #( .N(8) )
	uut (
		.input_data(input_data_tb),
		.control(control_tb),
		.shifted_result(shifted_result_tb)
	);

	initial begin

		// Test all shifts of codewords 00010100
		#50 input_data_tb = 8'b00010100; control_tb = 2'b00;
		#50 assert(shifted_result_tb == 8'b00010100);
		#50 input_data_tb = 8'b00010100; control_tb = 2'b01;
		#50 assert(shifted_result_tb == 8'b00001010);
		#50 input_data_tb = 8'b00010100; control_tb = 2'b10;
		#50 assert(shifted_result_tb == 8'b00000101);
		#50 input_data_tb = 8'b00010100; control_tb = 2'b11;
		#50 assert(shifted_result_tb == 8'b00000010);
		#50;

		// Test all shifts of codewords 10010100,
		// test designed so that sign bit gets copied properly
		#50 input_data_tb = 8'b10010100; control_tb = 2'b00;
		#50 assert(shifted_result_tb == 8'b10010100);
		#50 input_data_tb = 8'b10010100; control_tb = 2'b01;
		#50 assert(shifted_result_tb == 8'b11001010);
		#50 input_data_tb = 8'b10010100; control_tb = 2'b10;
		#50 assert(shifted_result_tb == 8'b11100101);
		#50 input_data_tb = 8'b10010100; control_tb = 2'b11;
		#50 assert(shifted_result_tb == 8'b11110010);

	end

endmodule
