module parity_generator (
    input [7:0] data_in,  // 8-bit input data
    output parity         // Parity bit
);
  assign parity = ^data_in;  // XOR all bits together (consider odd 1s)
endmodule
