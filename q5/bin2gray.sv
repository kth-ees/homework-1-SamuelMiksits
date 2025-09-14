`timescale 1ns/1ns

module bin2gray(
	input	logic [3:0] binary,
	output	logic [3:0] gray
);

	// Look up table for mux
	logic [15:0][3:0] lut;

	always_comb begin
		lut[4'b0000] = 4'b0000;
		lut[4'b0001] = 4'b0001;
		lut[4'b0010] = 4'b0011;
		lut[4'b0011] = 4'b0010;
		lut[4'b0100] = 4'b0110;
		lut[4'b0101] = 4'b0111;
		lut[4'b0110] = 4'b0101;
		lut[4'b0111] = 4'b0100;
		lut[4'b1000] = 4'b1100;
		lut[4'b1001] = 4'b1101;
		lut[4'b1010] = 4'b1111;
		lut[4'b1011] = 4'b1110;
		lut[4'b1100] = 4'b1010;
		lut[4'b1101] = 4'b1011;
		lut[4'b1110] = 4'b1001;
		lut[4'b1111] = 4'b1000;
	end

	mux16to1x4 mux(
		.a(lut),
		.s(binary),
		.c(gray)
	);

endmodule

// Mux for driving 4 bit inputs/output (reused from task2)
module mux16to1x4 (
	input	logic [15:0][3:0] a,
	input	logic [3:0] s,
	output	logic [3:0] c
);

	assign c = a[s];

endmodule
