`timescale 1ns / 1ps
module FA(
    output cout,
    output s,
    input a,
    input b,
    input c
    );
wire t1,t2,t3;

xor #(5,3) a1(t1,a,b) ;
and #9 a3(t2,a,b);

xor #(5,3) a2(s,c,t1);
and #(5,3) a4(t3,c,t1);

or #(5:6:7) a5(cout,t2,t3);

endmodule
