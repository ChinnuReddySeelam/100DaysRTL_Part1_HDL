module tb_ringcounter();

  reg clk;
  reg rst;
  wire [3:0] Count;

  // Instantiate the Ringcounter module
  Ringcounter UUT (
    .Count(Count),
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Stimulus generation
  initial begin
    clk = 0;
    rst = 0;

    // Apply reset
    rst = 1;
    #10 rst = 0;

    // Test various clock cycles
    #10;
    $display("Count: %b", Count);

    #10;
    $display("Count: %b", Count);

    #10;
    $display("Count: %b", Count);

    #10;
    $display("Count: %b", Count);

    // Add more test cases if needed
#200;
    // Finish simulation
    $finish;
  end

endmodule
