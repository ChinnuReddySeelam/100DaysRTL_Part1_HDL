module testbench;
reg [3:0] A,B;
wire [7:0] result;
Multiplier_4bit DUT(A,B,result);
initial begin
A=4'b1001;B=4'b1000;#10;
A=4'b1100;B=4'b1110;#10;
A=4'b1111;B=4'b1100;#10;
A=4'b1011;B=4'b1101;#10;
$finish;
end
endmodule