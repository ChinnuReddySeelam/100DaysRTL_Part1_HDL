module Decoder(
  input [3:0] in, 
  input [1:0] sel,
output reg [7:0] Octal_result,
output reg [9:0] Decimal_result,
output reg [15:0] HexaDecimal_result);
always @(*) begin
  case(sel)
    2'b00: begin // Binary to Octal conversion
      Decimal_result=0;
      HexaDecimal_result=0;
      case(in)
        4'd0: Octal_result = {7'b0, 1};
        4'd1: Octal_result = {6'b0, 1, 0};
        4'd2: Octal_result = {5'b0, 1, 2'b0};
        4'd3: Octal_result = {4'b0, 1, 3'b0};
        4'd4: Octal_result = {3'b0, 1, 4'b0};
        4'd5: Octal_result = {2'b0, 1, 5'b0};
        4'd6: Octal_result = {0,1 ,6'b0};
        4'd7: Octal_result = {1, 7'b0};
        default: Octal_result = 8'b0;
      endcase
    end
    2'b01: begin //Binary to decimal
      HexaDecimal_result=0;
      Octal_result=0;
      case(in)
        4'd0: Decimal_result = {9'b0, 1};
        4'd1: Decimal_result = {8'b0, 1, 0};
        4'd2: Decimal_result = {7'b0, 1, 2'b0};
        4'd3: Decimal_result = {6'b0, 1, 3'b0};
        4'd4: Decimal_result = {5'b0, 1, 4'b0};
        4'd5: Decimal_result = {4'b0, 1, 5'b0};
        4'd6: Decimal_result = {3'b0, 1, 6'b0};
        4'd7: Decimal_result = {2'b0, 1, 7'b0};
        4'd8: Decimal_result = {1'b0, 1, 8'b0};
        4'd9: Decimal_result = {1, 9'b0};
        default: Decimal_result = 10'b0;
      endcase
    end
    2'b10: begin //binary to hexadecimal
      Decimal_result=0;
      Octal_result=0;
      case(in)
        4'd0: HexaDecimal_result = {15'b0, 1};
        4'd1: HexaDecimal_result = {14'b0, 1, 0};
        4'd2: HexaDecimal_result = {13'b0, 1, 2'b0};
        4'd3: HexaDecimal_result = {12'b0, 1, 3'b0};
        4'd4: HexaDecimal_result = {11'b0, 1, 4'b0};
        4'd5: HexaDecimal_result = {10'b0, 1, 5'b0};
        4'd6: HexaDecimal_result = {9'b0, 1, 6'b0};
        4'd7: HexaDecimal_result = {8'b0, 1, 7'b0};
        4'd8: HexaDecimal_result = {7'b0, 1, 8'b0};
        4'd9: HexaDecimal_result = {6'b0, 1, 9'b0};
        4'd10: HexaDecimal_result = {5'b0, 1, 10'b0};
        4'd11: HexaDecimal_result = {4'b0, 1, 11'b0};
        4'd12: HexaDecimal_result = {3'b0, 1, 12'b0};
        4'd13: HexaDecimal_result = {2'b0, 1, 13'b0};
        4'd14: HexaDecimal_result = {1'b0,1,14'b0};
        4'd15: HexaDecimal_result = {1, 15'b0};
        default: HexaDecimal_result = 16'b0;
      endcase
    end
    2'b11: begin
      Decimal_result=0;
      HexaDecimal_result=0;
      Octal_result=0;
    end
  endcase
end
endmodule
