//Author:- Chinna Venkata Narayana Reddy
//Date:-28/08/2023
module ClockDividerBy2n(
    input rst, clk, en,
    output  div2, div4, div8, div16
);
    reg [3:0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) 
            count <= 0;
        else if (en) begin
            if (count == 4'd15)
                count <= 0;
            else
                count <= count + 1;
        end
    end
    assign div2 = count[0];
    assign div4 = count[1];
    assign div8 = count[2];
    assign div16 = count[3];
endmodule
