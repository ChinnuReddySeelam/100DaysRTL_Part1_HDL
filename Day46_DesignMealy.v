module mealy(clk,rst,inp,out);
  input clk, rst, inp;
  output reg out;
  reg [1:0] state;

  always @(posedge clk, posedge rst) begin
    if (rst) begin
      out <= 0;
      state <= 2'b00;
    end
    else begin
      case (state)
        2'b00: begin
          if (inp) begin
            state <= 2'b01;
            out <= 0;
          end
          else begin
            state <= 2'b10;
            out <= 0;
          end
        end
        2'b01: begin
          if (inp) begin
            state <= 2'b00;
            out <= 1;
          end
          else begin
            state <= 2'b10;
            out <= 0;
          end
        end
        2'b10: begin
          if (inp) begin
            state <= 2'b01;
            out <= 0;
          end
          else begin
            state <= 2'b00;
            out <= 1;
          end
        end
        default: begin
          state <= 2'b00;
          out <= 0;
        end
      endcase
    end
  end
endmodule
