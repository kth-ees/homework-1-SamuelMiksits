`timescale 1ns/1ns

module ArithmeticRightShifter #(parameter N) (
	input	logic [N-1:0] input_data,
	input	logic [1:0] control,
	output	logic [N-1:0] shifted_result
);

	// Start by moving "control" amount of bits (am assuming that if control
	// is 0, move 0 bits, control is 1, shift 1 bit, control 2, shift 2 bits etc)  
	//assign shifted_result[N-1-control:0] = input_data[N-1:control];

	always_comb begin
		for (int i = 0; i < N-control; i++) begin
			shifted_result[N-1-control-i] = input_data[N-1-i];
		end
		// Then copy the MSB into the top spots
		for (int i = 0; i < control; i++) begin
			shifted_result[N-1-i] = input_data[N-1];
		end
	end


endmodule
