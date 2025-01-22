module mux_8to1 (
    input wire [7:0] d0,     
    input wire [7:0] d1,     
    input wire [7:0] d2,    
    input wire [7:0] d3,     
    input wire [7:0] d4,     
    input wire [7:0] d5,     
    input wire [7:0] d6,     
    input wire [7:0] d7,    
    input wire [2:0] sel,   
    output reg [7:0] out     
);

    always @(*) begin
        case(sel)
            3'b000: out = d0; 
            3'b001: out = d1; 
            3'b010: out = d2; 
            3'b011: out = d3; 
            3'b100: out = d4; 
            3'b101: out = d5; 
            3'b110: out = d6; 
            3'b111: out = d7; 
            default: out = 8'b00000000;
        endcase
    end

endmodule
