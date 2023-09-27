module usr_shift_reg_bl(
input clk,rst,lrbar,lcbar,
input [3:0]i,
output reg [3:0]y);
always @ (posedge clk)
begin
if(rst)
begin
y<=i;
end
else
begin
case({lrbar,lcbar})
2'b00:begin
y<={y[0],y[3:1]};
end
2'b01: begin
y<={1'b0,y[3:1]};
end
2'b10: begin
y<={y[2:0],y[3]};
end
2'b11: begin
y<={y[2:0],1'b0};
end
default: begin end
endcase
end
end
endmodule