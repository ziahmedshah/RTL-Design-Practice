`timescale 1ns / 1ps

module detect_pattern_tb;
    reg [31:0] din;           // 32-bit input data
    wire [3:0] count;         // 4-bit output count

    // Instantiate the module
    detect_pattern uut (
        .din(din),
        .count(count)
    );

    initial begin
        // Test case 1: No pattern
        din = 32'b11111111111111111111111111111111;
        #10 $display("din = %b, count = %d", din, count);

        // Test case 2: One pattern
        din = 32'b00000000000000000000000000000100;
        #10 $display("din = %b, count = %d", din, count);

        // Test case 3: Overlapping patterns
        din = 32'b00000000000000000000000001010101;
        #10 $display("din = %b, count = %d", din, count);

        // Test case 4: Multiple non-overlapping patterns
        din = 32'b01001001001001001001001001001001;
        #10 $display("din = %b, count = %d", din, count);

        // Test case 5: Continuous pattern
        din = 32'b01010101010101010101010101010101;
        #10 $display("din = %b, count = %d", din, count);

        $stop; // End simulation
    end
endmodule
