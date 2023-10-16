module async_fifo (input clk_write,input clk_read,  // Read clock
  input rst,       // Reset signal (asynchronous to both clocks)
  input wr_en,     // Write enable signal
  input rd_en,     // Read enable signal
  input [7:0] data_in,
  output reg [7:0] data_out,
  output  empty,  // Flag indicating FIFO is empty
  output  full    // Flag indicating FIFO is full
);
  parameter DEPTH = 16; // Depth of the FIFO (adjust as needed)
  reg [7:0] memory [0:DEPTH-1];
  reg [4:0] wr_ptr = 0; // Write pointer
  reg [4:0] rd_ptr = 0; // Read pointer
  reg [4:0] count = 0;  // Number of elements in the FIFO
  // Write process (synchronized to write clock)
  always @(posedge clk_write or posedge rst) begin
    if (rst) begin
      wr_ptr <= 0;
      count <= 0;
    end else if (wr_en && !full) begin
      memory[wr_ptr] <= data_in;
      wr_ptr <= (wr_ptr == DEPTH-1) ? 0 : wr_ptr + 1;
      count <= count + 1;
    end
  end
  // Read process (synchronized to read clock)
  always @(posedge clk_read or posedge rst) begin
    if (rst) begin
      rd_ptr <= 0;
      count <= 0;
    end else if (rd_en && !empty) begin
      data_out <= memory[rd_ptr];
      rd_ptr <= (rd_ptr == DEPTH-1) ? 0 : rd_ptr + 1;
      count <= count - 1;
    end
  end
  assign  empty = (count == 0);
  assign  full = (count == DEPTH);
endmodule
