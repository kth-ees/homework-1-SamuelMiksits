`timescale 1ns/1ns

module decoder(
	input	logic [3:0] binary,
	output	logic [15:0] one_hot
);

	// Active high, want to have input function to demux 1 for asserting
	// outputs
	logic f = 1;

	demux16to1 demux(
		.f(f),
		.s(binary),
		.out(one_hot)
	);
	

endmodule


module demux16to1(
	input logic f,
	input logic [3:0] s,
	output logic [15:0] out
);

	always_comb begin
		// Set all outputs to 0 by default
		out = '0;
		// Set selected output to input function
		out[s] = f;
	end

endmodule
