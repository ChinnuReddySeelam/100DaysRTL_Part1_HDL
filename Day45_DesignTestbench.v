module async_fifo_tb;
  // Parameters
  parameter DEPTH = 16;
  // Clock signals
  reg clk_write = 0;
  reg clk_read = 0;
  // Reset signal
  reg rst = 0;
  // Write and read enable signals
  reg wr_en = 0;
  reg rd_en = 0;
  // Data signals
  reg [7:0] data_in;
  wire [7:0] data_out;
  // Flags
  wire empty;
  wire full;
  // Instantiate the asynchronous FIFO module
  async_fifo dut (
    .clk_write(clk_write),
    .clk_read(clk_read),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .empty(empty),
    .full(full)
  );

  // Clock generation
  always begin
    #5 clk_write = ~clk_write;
  end

  always begin
    #7 clk_read = ~clk_read;
  end

  // Test scenario
  initial begin
    // Initialize signals
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    data_in = 8'b0;
    
    // Release reset
    #10 rst = 0;

    // Test scenario - write data
    wr_en = 1;
    for (int i = 0; i < DEPTH; i = i + 1) begin
      data_in = $random;
      #10;
    end
    wr_en = 0;

    // Test scenario - read data
    rd_en = 1;
    for (int i = 0; i < DEPTH; i = i + 1) begin
      #10;
    end
    rd_en = 0;

    // Finish simulation
    $finish;
  end

endmodule
