`include "adder_16bit_piplined.v"
module adder_tb ();

    reg clk;
    reg [7:0] A,B;
    wire  [7:0] SUM;
    wire Cout;
    integer i,j=0;
    reg  CARRYi;
    wire  CARRYo;

    adder_16 dut (clk,A,B,SUM,Cout);

    always  #5 clk=~clk;

    initial begin
        clk=0;
        $dumpfile("adder.vcd");
        $dumpvars(0);

        for(i=0;i<=15;i=i+1) begin
            for(j=0;j<=15;j=j+1) begin
            A<=i;
            B<=j;
            #30;
            end
        end
        B=255;
        A=255;
        #40;
        $finish;
    end   
endmodule