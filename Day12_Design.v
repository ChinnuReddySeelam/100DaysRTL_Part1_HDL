module B_G(
input [3:0] data_in,
input en,
output reg [3:0] BinaryCode,GrayCode
);
always @(*) begin
if(en)begin //Gray to Binary Converter
 BinaryCode[3]=data_in[3];
 BinaryCode[2]=BinaryCode[3]^data_in[2];
 BinaryCode[1]=BinaryCode[2]^data_in[1];
 BinaryCode[0]=BinaryCode[1]^data_in[0];
 GrayCode=data_in;
end
else begin //Binary to Gray converter
 GrayCode[3]=data_in[3];
 GrayCode[2]=data_in[3]^data_in[2];
 GrayCode[1]=data_in[2]^data_in[1];
 GrayCode[0]=data_in[1]^data_in[0];
 BinaryCode=data_in;
end
end
endmodule