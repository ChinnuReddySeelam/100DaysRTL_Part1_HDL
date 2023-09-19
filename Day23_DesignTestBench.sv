module MajorityInputCircuit_tb();
reg [4:0] A;
wire Y;
MajorityInputCircuit DUT(A,Y);
initial begin 
for(int i=0;i<9;i++) begin 
A=$random();#10;
$display("A=%b,Y=%b",A,Y);
end
$finish();
end
endmodule