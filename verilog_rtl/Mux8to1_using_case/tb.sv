`timescale 1ns / 1ps

module mux_8to1_tb;

    reg [7:0] d0, d1, d2, d3, d4, d5, d6, d7; // 8-bit data inputs
    reg [2:0] sel;                            // 3-bit selector
    wire [7:0] out;                           // 8-bit output

    // Instantiate the mux_8to1 module
    mux_8to1 uut (
        .d0(d0), .d1(d1), .d2(d2), .d3(d3), .d4(d4),
        .d5(d5), .d6(d6), .d7(d7), .sel(sel), .out(out)
    );

    initial begin
        // Test case 1: Select d0
        d0 = 8'b00000001; d1 = 8'b00000010; d2 = 8'b00000100; d3 = 8'b00001000;
        d4 = 8'b00010000; d5 = 8'b00100000; d6 = 8'b01000000; d7 = 8'b10000000;
        sel = 3'b000; // sel = 000 selects d0
        #10;
        $display("sel = %b, out = %b", sel, out);

        // Test case 2: Select d3
        sel = 3'b011; // sel = 011 selects d3
        #10;
        $display("sel = %b, out = %b", sel, out);

        // Test case 3: Select d7
        sel = 3'b111; // sel = 111 selects d7
        #10;
        $display("sel = %b, out = %b", sel, out);

        // Test case 4: Select d5
        sel = 3'b101; // sel = 101 selects d5
        #10;
        $display("sel = %b, out = %b", sel, out);

        $stop; // Stop simulation
    end
endmodule
