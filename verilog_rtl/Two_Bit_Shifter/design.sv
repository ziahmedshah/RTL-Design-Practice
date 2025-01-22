module two_bit_shifter (
    input wire CLK,         // Clock signal
    input wire SHL,         // Shift Left control signal
    input wire SHR,         // Shift Right control signal
    input wire Load,        // Load control signal
    input wire [7:0] din,   // 8-bit input data
    output reg [7:0] dout   // 8-bit output data
);

    always @(posedge CLK) begin
        if (Load) begin
            dout <= din;   // Load the value into dout
        end
        else if (SHL) begin
            dout <= dout << 1; // Shift left by 1
        end
        else if (SHR) begin
            dout <= dout >> 1; // Shift right by 1
        end
    end

endmodule
