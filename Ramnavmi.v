module test ();
  reg ax;
  reg cx;
  reg c2;
  reg c4;
  reg c5;
  reg clk;
  
  reg ramx;
  reg ram2;
  reg ram3;
  reg ram4;
  reg ram5;
  reg ram6;
  
  reg qx;
  reg q2;
  reg q3;
  reg q4;
  reg q5;
  reg q6;
  reg dx;
  reg d2;
  //always #2 clk=!clk;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    {ax,cx,c2,c5,c4}=0;
    #150 $finish;
  end
  
  always @ (posedge clk)
    begin
    #20;
      #3 {ax,cx,c2,c5,c4}=5'bxxxxx;
      #3 {ax,cx,c2,c5,c4}=5'b00x00;
      #3 {ax,cx,c2,c5,c4}=5'b00x00;
      #3 {ax,cx,c2,c5,c4}=5'bxxxxx;
      #3 {ax,cx,c2,c5,c4}=5'b00000;
      #3 {ax,cx,c2,c5,c4}=5'b00000;
      
      #3 {ax,cx,c2,c5,c4}=5'b0xxxx;
      #3 {ax,cx,c2,c5,c4}=5'bx0x00;
      #3 {ax,cx,c2,c5,c4}=5'bx0x00;
      #3 {ax,cx,c2,c5,c4}=5'b0xxxx;
      #3 {ax,cx,c2,c5,c4}=5'b00000;
      #3 {ax,cx,c2,c5,c4}=5'b00000;
      
      #3 {ax,cx,c2,c5,c4}=5'bxxxxx;
      #3 {ax,cx,c2,c5,c4}=5'bx0x00;
      #3 {ax,cx,c2,c5,c4}=5'bx0x00;
      #3 {ax,cx,c2,c5,c4}=5'b0x000;
      #3 {ax,cx,c2,c5,c4}=5'b00000;
      #3 {ax,cx,c2,c5,c4}=5'b00000;
      
      #3 {ax,cx,c2,c5,c4}=5'bxxxxx;
      #3 {ax,cx,c2,c5,c4}=5'bx0x00;
      #3 {ax,cx,c2,c5,c4}=5'bx0x00;
      #3 {ax,cx,c2,c5,c4}=5'b0x000;
      #3 {ax,cx,c2,c5,c4}=5'b00000;
      #3 {ax,cx,c2,c5,c4}=5'b00000;
      
      
      #3 {ax,cx,c2,c5,c4}=5'bxx000;
      #3 {ax,cx,c2,c5,c4}=5'b00x00;
      #3 {ax,cx,c2,c5,c4}=5'b000xx;
      #3 {ax,cx,c2,c5,c4}=5'b00x00;
      #3 {ax,cx,c2,c5,c4}=5'bxx000;
      #3 {ax,cx,c2,c5,c4}=5'b00000;

      #20
      #3 {ax,cx,c2,c5,c4}=5'bxxxxx;
      #3 {ax,cx,c2,c5,c4}=5'bxxxxx;
      #3 {ax,cx,c2,c5,c4}=5'b0xxx0;
      #3 {ax,cx,c2,c5,c4}=5'b0xxx0;
      #3 {ax,cx,c2,c5,c4}=5'b00x00;
      #3 {ax,cx,c2,c5,c4}=5'b00x00;
    end
  
      initial begin
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=0;
        #20;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'bxxxxxx;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'bx00x00;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'bx00x00;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'b0xx0xx;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'b000000;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'b000000;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'b000000;
        
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'b00xxxx;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'b0x00x0;
        #2 {ramx,ram2,ram3,ram4,ram5,ram6}=6'bx000x0;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'b0x00x0;
        #2 {ramx,ram2,ram3,ram4,ram5,ram6}=6'b00xxxx;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'b000000;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'b000000;
        
        
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'bxxxxxx;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'bxx0000;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'b00x000;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'bxx0000;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'bxxxxxx;
        #4 {ramx,ram2,ram3,ram4,ram5,ram6}=6'b000000;    
  end
  
  initial begin
    #3 {qx,q2,q3,q4,q5,q6}=6'b000000;
    #20;
    #3 {qx,q2,q3,q4,q5,q6}=6'bxxxxxx;
    #3 {qx,q2,q3,q4,q5,q6}=6'b0x0000;
    #3 {qx,q2,q3,q4,q5,q6}=6'b00x000;
    #3 {qx,q2,q3,q4,q5,q6}=6'b000x00;
    #3 {qx,q2,q3,q4,q5,q6}=6'b0000x0;
    #3 {qx,q2,q3,q4,q5,q6}=6'bxxxxxx;
    #3 {qx,q2,q3,q4,q5,q6}=6'b000000;
    #3 {qx,q2,q3,q4,q5,q6}=6'b000000;
    
  
    
    
    #3 {qx,q2,q3,q4,q5,q6}=6'b0xxxxx;
    //#3 {qx,q2,q3,q4,q5,q6}=6'b0x0x00;
    #3 {qx,q2,q3,q4,q5,q6}=6'bx00x00;
    #3 {qx,q2,q3,q4,q5,q6}=6'bx00x00;
    #3 {qx,q2,q3,q4,q5,q6}=6'b0xxxxx;
    #3 {qx,q2,q3,q4,q5,q6}=6'b000000;
    #3 {qx,q2,q3,q4,q5,q6}=6'b000000;
    
    #3 {qx,q2,q3,q4,q5,q6}=6'bxxxx00;
    #3 {qx,q2,q3,q4,q5,q6}=6'b0000x0;
    #3 {qx,q2,q3,q4,q5,q6}=6'b00000x;
    #3 {qx,q2,q3,q4,q5,q6}=6'b0000x0;
    #3 {qx,q2,q3,q4,q5,q6}=6'bxxxx00;
    #3 {qx,q2,q3,q4,q5,q6}=6'b000000;
    #3 {qx,q2,q3,q4,q5,q6}=6'b000000;
    
    
        #4 {qx,q2,q3,q4,q5,q6}=6'bxxxxxx;
        #4 {qx,q2,q3,q4,q5,q6}=6'bxx0000;
        #4 {qx,q2,q3,q4,q5,q6}=6'b00x000;
        #4 {qx,q2,q3,q4,q5,q6}=6'bxx0000;
        #4 {qx,q2,q3,q4,q5,q6}=6'bxxxxxx;
        #4 {qx,q2,q3,q4,q5,q6}=6'b000000;
    
    
    #4 {qx,q2,q3,q4,q5,q6}=6'bx0000x;
    #4 {qx,q2,q3,q4,q5,q6}=6'bxxxxxx;
    #4 {qx,q2,q3,q4,q5,q6}=6'bx0000x;
    #4 {qx,q2,q3,q4,q5,q6}=6'b000000; 
  end
endmodule
  
  
  
