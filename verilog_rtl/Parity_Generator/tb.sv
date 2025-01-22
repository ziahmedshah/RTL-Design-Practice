module test_parity_generator;
    reg [7:0] data_in;
    wire parity;

    // Instantiate the parity generator
    parity_generator uut (
        .data_in(data_in),
        .parity(parity)
    );

    initial begin
        // Test case 1: Even number of 1's
        data_in = 8'b10101010;  // 4 ones
        #10;
        $display("Data: %b, Parity: %b", data_in, parity);  // Expected parity: 0

        // Test case 2: Odd number of 1's
        data_in = 8'b11100000;  // 3 ones
        #10;
        $display("Data: %b, Parity: %b", data_in, parity);  // Expected parity: 1

        // Test case 3: All zeros
        data_in = 8'b00000000;  // 0 ones
        #10;
        $display("Data: %b, Parity: %b", data_in, parity);  // Expected parity: 0

        // Test case 4: All ones
        data_in = 8'b11111111;  // 8 ones
        #10;
        $display("Data: %b, Parity: %b", data_in, parity);  // Expected parity: 0
    end
endmodule
