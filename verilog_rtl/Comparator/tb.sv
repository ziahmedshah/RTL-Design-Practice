module comparator_tb;

    // Testbench signals
    reg a, b, c; // Inputs
    wire greater, less, equal; // Outputs

    // Instantiate the DUT
    comparator dut (
        .a(a),
        .b(b),
        .c(c),
        .greater(greater),
        .less(less),
        .equal(equal)
    );

    // Test sequence
    initial begin
        $monitor("Time = %0t | a = %b, b = %b | greater = %b, less = %b, equal = %b", 
                 $time, a, b, greater, less, equal);

        // Test Case 1: a > b
        a = 1; b = 0; c = 0; // 'c' is unused
        #10;

        // Test Case 2: a < b
        a = 0; b = 1; c = 0;
        #10;

        // Test Case 3: a == b
        a = 0; b = 0; c = 0;
        #10;

        // Test Case 4: a == b with c = 1 (check for unused input)
        a = 1; b = 1; c = 1;
        #10;

        // Finish simulation
        $stop;
    end

endmodule
