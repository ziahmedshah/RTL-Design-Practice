module pwm_generator (
    input wire clk,          // System clock
    input wire rst,          // Reset signal
  input wire [2:0] duty,   // Duty cycle (0-255 for 8-bit resolution)
    output reg pwm_out       // PWM output signal
);
    reg [7:0] counter;       // 8-bit counter

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 8'd0;   // Reset counter
            pwm_out <= 1'b0;   // Reset PWM output
        end else begin
            counter <= counter + 8'd1;  // Increment counter
            if (counter < duty)         // Compare counter with duty cycle
                pwm_out <= 1'b1;        // High if counter < duty
            else
                pwm_out <= 1'b0;        // Low otherwise
        end
    end
endmodule
