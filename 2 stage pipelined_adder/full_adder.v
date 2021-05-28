`include "half_adder.v"
module full_adder (
    input A,B,Cin,output S,Cout
);
    
    wire w1,w2,w3;
    half_adder dut1 (A,B,w1,w2);
    half_adder dut2 (w1,Cin,S,w3);
    or or1 (Cout,w2,w3);
    

endmodule