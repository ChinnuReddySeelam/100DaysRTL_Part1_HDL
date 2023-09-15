module tb;
reg [7:0] a,b;
reg [3:0] comm;
wire [15:0] out;
ALU DUT(a,b,comm,out);
initial begin 
for (int i=0;i<20;i++) begin 
a=$random();
b=$random();
comm=$random();#10;
$display("a=%b,b=%b,comm=%b,out=%b",a,b,comm,out);
end
#500;
$finish;
end
endmodule