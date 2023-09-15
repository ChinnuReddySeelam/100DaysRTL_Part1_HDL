module ALU(input [7:0] a,b,input [3:0] comm,output reg [15:0] out);
  parameter ADD  = 4'b0000,INC  = 4'b0001, SUB  = 4'b0010, DEC  = 4'b0011, MUL  = 4'b0100, DIV  = 4'b0101, SHL  = 4'b0110,SHR  = 4'b0111, AND  = 4'b1000;
  parameter OROperation   = 4'b1001,INV  = 4'b1010, NANDOperation = 4'b1011, NOROperation  = 4'b1100,XOROperation  = 4'b1101,XNOROperation = 4'b1110, BUFOperation  = 4'b1111; 
  always @(*) begin
   case(comm)
    4'b0000 : out = a + b;
    4'b0001 : out = a + 1;
    4'b0010 : out = a - b; 
    4'b0011 : out = a - 1;
    4'b0100 : out = a * b;
    4'b0101 : out = a / b;
    4'b0110 : out = a << b; 
    4'b0111 : out = a >> b; 
    4'b1000 : out = a & b;
    4'b1001 : out = a | b;   
    4'b1010 : out = ~a; 
    4'b1011 : out = ~(a & b);
    4'b1100 : out = ~(a | b);
    4'b1101 : out = a ^ b;
    4'b1110 : out = ~(a ^ b);
    4'b1111 : out = a;
    default: out = 16'hzzzz;
    endcase
   end
  endmodule