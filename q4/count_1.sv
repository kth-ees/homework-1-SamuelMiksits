`timescale 1ns/1ns

module count_1(
	input	logic [3:0] a,
	output	logic [2:0] out
);

	// Look up table for mux
	logic [15:0][2:0] lut;

	always_comb begin
		lut[4'b0000] = 3'b000;
		lut[4'b0001] = 3'b001;
		lut[4'b0010] = 3'b001;
		lut[4'b0011] = 3'b010;
		lut[4'b0100] = 3'b001;
		lut[4'b0101] = 3'b010;
		lut[4'b0110] = 3'b010;
		lut[4'b0111] = 3'b011;
		lut[4'b1000] = 3'b001;
		lut[4'b1001] = 3'b010;
		lut[4'b1010] = 3'b010;
		lut[4'b1011] = 3'b011;
		lut[4'b1100] = 3'b010;
		lut[4'b1101] = 3'b011;
		lut[4'b1110] = 3'b011;
		lut[4'b1111] = 3'b100;
	end

	mux16to1x3 mux(
		.a(lut),
		.s(a),
		.c(out)
	);

endmodule

// Mux for driving 3 bit inputs/output (reused from task2)
module mux16to1x3 (
	input	logic [15:0][2:0] a,
	input	logic [3:0] s,
	output	logic [2:0] c
);

	assign c = a[s];

endmodule
