module mem_unit #(
  parameter DataWidth = 32,   // 32-bit data width
  parameter MemDepth  = 256   // Number of memory locations (256 locations for 1KB)
) (
  input                       clk,
  input                       rst_n,
  input  [31:0]               wr_addr,     // Address width based on memory depth
  input                       wr_en,       // Write enable
  input  [DataWidth-1:0]      d_in,        // Data input
  input                       rd_req,      // Read request
  input  [31:0]               rd_addr,     // Read address
  output reg [DataWidth-1:0]  data_out     // Data output
);

  // Memory array declaration
  reg [DataWidth-1:0] tm_mem [0:MemDepth-1];

  // Write and Read Operations
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      data_out <= {DataWidth{1'b0}};
    end else begin
      // write data
      if (wr_en) begin
        tm_mem[wr_addr] <= d_in;
      end

      // read data
      if (rd_req) begin
        data_out <= tm_mem[rd_addr];
      end
    end
  end
endmodule
