module d_flip_flop_4bit (
  input clk,
  input [3:0] d,
  output reg [3:0] q
);

  always @(posedge clk) begin
    q <= d;
  end

endmodule


module register_4bit (
  input clk,
  input [3:0] d,
  input reset,
  output reg [3:0] q
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      q <= 4'b0;
    end else begin
      q <= d;
    end
  end

endmodule
