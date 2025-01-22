module mux_tb;

    // Testbench signals
    reg a;
    reg b;
    reg sel;
    wire x;

    // Instantiate the DUT (Device Under Test)
    mux dut (
        .a(a),
        .b(b),
        .sel(sel),
        .x(x)
    );

    // Test sequence
    initial begin
        // Monitor signals for debugging
        $monitor("Time = %0t | a = %b, b = %b, sel = %b, x = %b", $time, a, b, sel, x);

        // Initialize signals
        a = 0; b = 0; sel = 0;

        // Test case 1: sel = 0, expect x = b
        #10; // Wait for 10 time units
        a = 1; b = 0; sel = 0;
        #10;

        // Test case 2: sel = 1, expect x = a
        a = 1; b = 0; sel = 1;
        #10;

        // Test case 3: sel = 0, expect x = b
        a = 0; b = 1; sel = 0;
        #10;

        // Test case 4: sel = 1, expect x = a
        a = 0; b = 1; sel = 1;
        #10;

        // Finish simulation
        $stop;
    end

endmodule
