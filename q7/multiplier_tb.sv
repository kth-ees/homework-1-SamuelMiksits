`timescale 1ns/1ns

module multiplier_tb ();

	localparam N = 8;

	// The input 
	logic signed [N-1:0] a_tb = '0;
	logic signed [N-1:0] b_tb = '0;
	logic signed [2*N-1:0] product_tb;
	
	// Test variables, need to be signed for operator to understand that the
	// result should be signed 
	logic signed [2*N-1:0] a_test;
	logic signed [2*N-1:0] b_test;
	logic signed [2*N-1:0] prod_test;


	multiplier #(.N(8)) uut (
		.a(a_tb),
		.b(b_tb),
		.product(product_tb)
	);

	initial begin
		// More deliberate tests
		#50 a_tb = 8'd37; b_tb = 8'd25;
		#50 assert( product_tb == 16'd925);	
		
		// Very small tests to make manual debugging easier
		// Positive * Positive
		#50 a_tb = 8'b00000111; b_tb = 8'b00000011;
		#50 assert( product_tb == 16'd7*16'd3); 

		// Positive * Positive
		#50 a_tb = 8'b00000010; b_tb = 8'b00000011;
		#50 assert( product_tb == 16'b0000000000000110);


		// Negative * Positive 
		#50 a_tb = 8'b11111011; b_tb = 8'b00000010;
		#50 assert( product_tb == 16'b1111111111110110);	
		
		// Positive * Negative
		#50 b_tb = 8'b11111011; a_tb = 8'b00000010;
		#50 assert( product_tb == 16'b1111111111110110);	
		
		// Negative * Negative
		#50 b_tb = 8'b11111011; a_tb = 8'b11111110;
		#50 assert( product_tb == 16'b0000000000001010);

		// Random testing
		for (int i = 0; i < 100; i++) begin
			#50 a_tb = $random(); b_tb = $random;
		   	a_test = a_tb; b_test = b_tb; prod_test = a_test*b_test;
			#50 assert( product_tb == prod_test);
			if (product_tb != prod_test) begin
				$display("Invalid product 0x%0h, a = 0x%0h, b = 0x%0h, expected 0x%0h", 
					product_tb, a_tb, b_tb, prod_test); 
			end
		end

	end

endmodule
