module tb_comparator_rel;

    // Testbench signals
    reg [7:0] a, b;       // 8-bit inputs
    wire EQ, GT, LT;      // Outputs

    // Instantiate the DUT
    comparator_rel dut (
        .a(a),
        .b(b),
        .EQ(EQ),
        .GT(GT),
        .LT(LT)
    );

    // Test sequence
    initial begin
        $monitor("Time = %0t | a = %d, b = %d | EQ = %b, GT = %b, LT = %b", 
                 $time, a, b, EQ, GT, LT);

        // Test Case 1: a == b
        a = 8'd50; b = 8'd50; #10;

        // Test Case 2: a > b
        a = 8'd100; b = 8'd50; #10;

        // Test Case 3: a < b
        a = 8'd25; b = 8'd50; #10;

        // Test Case 4: a == b (max value)
        a = 8'd255; b = 8'd255; #10;

        // Test Case 5: a < b (zero comparison)
        a = 8'd0; b = 8'd10; #10;

        // Test Case 6: Random comparison
        a = 8'd200; b = 8'd199; #10;

        // Finish simulation
        $stop;
    end

endmodule
