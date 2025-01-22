module counter_8bit (
  input wire clk,              // Clock signal
  input wire rst,              // Reset signal
  input wire [1:0] c,          // 2-bit control input
  input wire [7:0] din,        // 8-bit data input
  output reg [7:0] dout        // 8-bit data output
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      dout <= 8'b0;       
    end else begin
      case (c)
        2'b00: dout <= din;                // Load data
        2'b01: dout <= dout + 8'd1;        // Increment by 1
        2'b10: dout <= dout - 8'd1;        // Decrement by 1
        2'b11: dout <= 8'd0;               // Reset to 0
        default: dout <= dout;             // Hold current value
      endcase
    end
  end

endmodule
