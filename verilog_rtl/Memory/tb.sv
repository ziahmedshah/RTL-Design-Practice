module tb_mem();
  logic clk, rst_n, wr_en, rd_req;
  logic [31:0] wr_addr, rd_addr, data_out, d_in;

  // Instantiate the DUT (Design Under Test)
  mem_unit #(32, 256) dut (
    .clk(clk),
    .rst_n(rst_n),
    .wr_addr(wr_addr),
    .wr_en(wr_en),
    .d_in(d_in),
    .rd_req(rd_req),
    .rd_addr(rd_addr),
    .data_out(data_out)
  );

  // Clock generation
  always #5 clk = ~clk;  // Generate a clock with a period of 10 time units

  initial begin
    // Initialize signals
    clk = 0;
    rst_n = 0;
    wr_en = 0;
    rd_req = 0;
    wr_addr = 0;
    rd_addr = 0;
    d_in = 0;

    // Apply reset
    #10;
    rst_n = 1;  // Release reset

    // Write operation
    @(posedge clk);
    wr_en = 1;
    wr_addr = 32'h54;
    d_in = 32'hAAAA_5678;  // Example data to write
    $display("//////======data = %d =======////////", d_in);
    @(posedge clk);  // Wait for some time
    wr_en = 0;  // Disable write
    
        // Write operation
    @(posedge clk);
    wr_en = 1;
    wr_addr = 32'h55;
    d_in = 32'hBBBB_5678;  // Example data to write
    $display("//////======data = %d =======////////", d_in);
    @(posedge clk);  // Wait for some time
    wr_en = 0;  // Disable write
    
        // Write operation
    @(posedge clk);
    wr_en = 1;
    wr_addr = 32'h56;
    d_in = 32'hCCCC_5678;  // Example data to write
    $display("//////======data = %d =======////////", d_in);
    @(posedge clk);  // Wait for some time
    wr_en = 0;  // Disable write
    
        // Write operation
    @(posedge clk);
    wr_en = 1;
    wr_addr = 32'h57;
    d_in = 32'hDDDD_5678;  // Example data to write
    $display("//////======data = %d =======////////", d_in);
    @(posedge clk);  // Wait for some time
    wr_en = 0;  // Disable write

    #20;
    @(posedge clk);
    // Read operation
    rd_req = 1;
    rd_addr = 32'h54;
//     @(posedge clk);  // Wait for some time
//     rd_req = 0;  // Disable read request
    
    @(posedge clk);
    // Read operation
    rd_req = 1;
    rd_addr = 32'h55;
//     @(posedge clk);  // Wait for some time
//     rd_req = 0;  // Disable read request

    @(posedge clk);
    // Read operation
    rd_req = 1;
    rd_addr = 32'h56;
//     @(posedge clk);  // Wait for some time
//     rd_req = 0;  // Disable read request

    @(posedge clk);
    // Read operation
    rd_req = 1;
    rd_addr = 32'h57;
    @(posedge clk);  // Wait for some time
    rd_req = 0;  // Disable read request

    

    // End of simulation
    #10;
    $finish;
  end

  // VCD waveform dumping
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule

