module clock_divider #(parameter WIDTH = 8) (
    input logic clk,           
    input logic rst,           
    input logic [WIDTH-1:0] div, 
    output logic pwm_out      
);

    logic [WIDTH-1:0] counter; 

    // Counter logic
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            counter <= 0; 
        else if (counter == div - 1)
            counter <= 0; 
        else\par
            counter <= counter + 1; 
    end

    // PWM generation logic
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            pwm_out <= 0;
        else
            pwm_out <= (counter < (div >> 1)); // Toggle PWM at div/2
    end

endmodule
