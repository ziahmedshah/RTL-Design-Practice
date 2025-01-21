
module tb;
	reg a, b;                                  
	reg clk;                       
  pos_n_neg_edge_det dut (  .a(a),.b(b),           
    					 .clk(clk),
                     .out(out));

	// Generate a clock of 100MHz
	always #5 clk = ~clk;           
	

	initial begin
		clk <= 0;
		a <= 0;
      b <= 0;
		#15 a <= 1;
		#20 a <= 0;
		#15 a <= 1;
		#10 a <= 0;
      		#15 b <= 1;
		#20 b <= 0;
		#15 b <= 1;
		#10 b <= 0;
		#20 $finish;
	end	
  
  	initial begin
      	$dumpvars;
      $dumpfile("dump.vcd");
    end
endmodule
