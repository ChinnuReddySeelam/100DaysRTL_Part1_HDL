module moore(clk, rst, inp, out);
  output out;
  input clk, rst, inp;
  reg out;
  reg [1:0] state;
  always @(posedge clk, posedge rst) begin
    if (rst) begin state <= 2'b00 ; out <= 0; end
    else begin
      case(state)
        2'b00: begin if (inp) state <= 2'b01;
                     else state <= 2'b10;
               end
        2'b01: begin if (inp) state <= 2'b11;
                     else state <= 2'b10;
               end
        2'b10: begin if (inp) state <= 2'b01;
                     else state <= 2'b11;
               end
        2'b11: begin if (inp) state <= 2'b01;
               else state <= 2'b10;
               end
        default:state <= 2'b00;
      endcase
    end
  end
  always @(posedge clk) begin
    if (state == 2'b11)  out <= 1;
    else out <= 0;
  end
endmodule
