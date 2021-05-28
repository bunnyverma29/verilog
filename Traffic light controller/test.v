`include "traffic.v"
module test();
  reg  x,clk,rst;
  wire [1:0] Highway,Country,state;
  
  traffic dut(x,clk,rst,Highway,Country,state);
  
  always begin #5 clk=~clk ; end
  
  initial
    begin
      x=0;
    clk=0;
    rst=1;
    #15;
     repeat(5) begin 
       #2 rst=0;
        #2 rst=1;
     end
    
    x=0;
    rst=0;
    #1;
      x=0;
    rst=1;
    #10;
      x=1;
    rst=1;
    #100;
      x=0;
    rst=1;
    #100;
     x=0;
    rst=1;
    #100;
        x=0;
    rst=0;
    #1;
      x=0;
    rst=1;
    #10;
      x=1;
    rst=1;
    #100;
      x=0;
    rst=1;
    #100;
     x=0;
    rst=1;
    #100;
    $finish;
  end
  
  initial begin
     $dumpfile("file.vcd");
    $dumpvars(1);
  end
endmodule
  