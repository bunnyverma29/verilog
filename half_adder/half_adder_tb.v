`include "half_adder.v"

module half_adder_tb ();
wire s,c;
reg a,b;

half_adder dut (a,b,s,c);

initial begin
    $dumpfile("mysim.vcd");
    $dumpvars(0);

    a=0;
    b=0;
    #50;

    
    a=0;
    b=1;
    #50;

    
    a=1;
    b=0;
    #50;

    
    a=1;
    b=1;
    #50;

end
    
endmodule