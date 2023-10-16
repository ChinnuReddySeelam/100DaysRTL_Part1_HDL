module fsm_bl(input clk,rst,output reg [3:0] y);
reg [2:0] ps,ns;
parameter s1=3'd1,s2=3'd2, s3=3'd3, s4=3'd4, s5=3'd5;
always @(*) begin
case(ps)
s1:ns=s2;
s2:ns=s3;
s3:ns=s4;
s4:ns=s5;
s5:ns=s1;
endcase end
always @(posedge clk or posedge rst) begin
if (rst) ps<=s1;
else
ps<=ns; end
always @(posedge clk) begin
if(rst) y<=2;
else
begin
case(ps)
s1:y<=2;
s2:y<=3;
s3:y<=5;
s4:y<=7;
s5:y<=11;
endcase
end
end
endmodule