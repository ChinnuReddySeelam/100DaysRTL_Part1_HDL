module Encoder(
  input [15:0] in, 
  input [1:0] sel,
  output reg [3:0] binary_result
  );
always @(*) begin
  case(sel)
  2'b00:begin //Octal to binary 
  binary_result[3]=0;
  casex(in) 
  16'b0000000000000001:binary_result[2:0]=3'b000;
  16'b000000000000001x:binary_result[2:0]=3'b001;
  16'b00000000000001xx:binary_result[2:0]=3'b010;
  16'b0000000000001xxx:binary_result[2:0]=3'b011;
  16'b000000000001xxxx:binary_result[2:0]=3'b100;
  16'b00000000001xxxxx:binary_result[2:0]=3'b101;
  16'b0000000001xxxxxx:binary_result[2:0]=3'b110;
  16'b000000001xxxxxxx:binary_result[2:0]=3'b111;
  default : binary_result=4'b0000;
  endcase
  end
  2'b10:begin
  casex(in) //HexaDecimal to binary
  16'b0000000000000001:binary_result=4'b0000;
  16'b000000000000001x:binary_result=4'b0001;
  16'b00000000000001xx:binary_result=4'b0010;
  16'b0000000000001xxx:binary_result=4'b0011;
  16'b000000000001xxxx:binary_result=4'b0100;
  16'b00000000001xxxxx:binary_result=4'b0101;
  16'b0000000001xxxxxx:binary_result=4'b0110;
  16'b000000001xxxxxxx:binary_result=4'b0111;
  16'b00000001xxxxxxxx:binary_result=4'b1000;
  16'b0000001xxxxxxxxx:binary_result=4'b1001;
  16'b000001xxxxxxxxxx:binary_result=4'b1010;
  16'b00001xxxxxxxxxxx:binary_result=4'b1011;
  16'b0001xxxxxxxxxxxx:binary_result=4'b1100;
  16'b001xxxxxxxxxxxxx:binary_result=4'b1101;
  16'b01xxxxxxxxxxxxxx:binary_result=4'b1110;
  16'b1xxxxxxxxxxxxxxx:binary_result=4'b1111;
  default : binary_result=4'b0000;
  endcase
  end
  2'b01: begin
  casex(in) //Decimal to binary
  16'b0000000000000001:binary_result=4'b0000;
  16'b000000000000001x:binary_result=4'b0001;
  16'b00000000000001xx:binary_result=4'b0010;
  16'b0000000000001xxx:binary_result=4'b0011;
  16'b000000000001xxxx:binary_result=4'b0100;
  16'b00000000001xxxxx:binary_result=4'b0101;
  16'b0000000001xxxxxx:binary_result=4'b0110;
  16'b000000001xxxxxxx:binary_result=4'b0111;
  16'b000000001xxxxxxx:binary_result=4'b1000;
  16'b000000001xxxxxxx:binary_result=4'b1001;
  default : binary_result=4'b0000;
  endcase
  end
  2'b11:binary_result=0;
 endcase
 end 
endmodule
