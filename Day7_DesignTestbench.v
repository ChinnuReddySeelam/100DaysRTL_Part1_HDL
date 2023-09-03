module Testbench();
wire [4:0] result;
reg [3:0] A,B;
CLHA dut(A,B,result);
initial begin
A=4'b1001;B=4'b0010;#10;
$display("A=%b,B=%b,result=%b",A,B,result);#10;
A=4'b1101;B=4'b0110;#10;
$display("A=%b,B=%b,result=%b",A,B,result);#10;
A=4'b0111;B=4'b1110;#10;
$display("A=%b,B=%b,result=%b",A,B,result);#10;
A=4'b1111;B=4'b1111;#10;
$display("A=%b,B=%b,result=%b",A,B,result);#10;
A=4'b1011;B=4'b0010;#10;
$display("A=%b,B=%b,result=%b",A,B,result);#10;
$finish();
end
endmodule