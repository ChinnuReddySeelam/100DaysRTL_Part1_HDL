module testbench;
reg [3:0] A,B;
reg m;
wire [4:0] result;
wire overflow;
A_S DUT(A,B,m,result,overflow);
initial begin
m=1;A=4'b1001;B=4'b1000;#10;
A=4'b1100;B=4'b1110;#10;
A=4'b1111;B=4'b1100;#10;
A=4'b1011;B=4'b1101;#10;
$finish;
end
endmodule