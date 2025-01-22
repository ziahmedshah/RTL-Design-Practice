module detect_pattern (
    input wire [31:0] din,   // 32-bit input data
    output reg [3:0] count   // 4-bit count of '010' patterns
);
    integer i;

    always @(*) begin
        count = 4'd0; // Initialize count to 0

        // Loop through the input to detect '010' pattern
        for (i = 0; i <= 29; i = i + 1) begin
            if (din[i+2] == 0 && din[i+1] == 1 && din[i] == 0) begin
                count = count + 1; // Increment count for each pattern
            end
        end
    end
endmodule
