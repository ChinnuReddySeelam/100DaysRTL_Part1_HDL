
 module moore_tb;

 wire out;

 reg clk,rst,inp;

 reg [15:0] seq; 

 integer i;

 moore instance22(clk, rst, inp, out);

 initial begin

     clk=0;

     rst=1;

     seq=16'b1010_0001_1100_0101;

     #5 rst=0;

 end

 always begin

     $dumpfile("moore_direct.vcd");

             $dumpvars();

     for( i = 0; i <= 15; i = i+1)

         begin

             inp = seq[i];

             #2 clk=1;

             #2 clk=0;

             $display("state = ",instance22.state,"| input = ",inp,"| output = ",out);

         end

      $finish();   

 end

 endmodule 