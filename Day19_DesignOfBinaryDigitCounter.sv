module BinaryDigitCounter(
  input [3:0] Data_in,
  output reg [1:0] CountOfOnes,
  output reg [1:0] CountOfZeros,
  output reg [1:0] CountOfXandZ
);
  always @(*) begin
    CountOfOnes = 0;
    CountOfZeros = 0;
    CountOfXandZ=0;
    for (int i = 0; i < 4; i = i + 1) begin
      if (Data_in[i]) // To count the occurence of ones
        CountOfOnes = CountOfOnes + 1;
      else if (~Data_in[i])  // To count the occurence of Zeros
        CountOfZeros = CountOfZeros + 1;
      else // To count the occurence of Unknowns
        CountOfXandZ=CountOfXandZ+1;
    end
   end
endmodule
