module test;
  reg clk;
  reg rst;
  reg en;
  reg wr_rd;
  reg [7:0] wdata;
  reg [7:0] rdata;
  wire valid;
  wire full;
  wire empty;
 
  reg [7:0] mem[0:127];
  
  reg [3:0] wr_adress;
  reg [3:0] rd_adress;
  reg [4:0] status_counter;
  
  
  
  FIFO dut  (clk,rst,en,wdata,wr_rd,rdata,valid,full,empty);
  always #5 clk=!clk;
  
  task initialize;
    begin
      clk=0;
      rst=0;
      en=0;
      rd_adress=0;
      wr_adress=0;
      status_counter=0;
    end
  endtask 
  
  task reset ;
    begin 
      rst=1;
      @ (posedge clk);#2;
      rst=0;
    end
  endtask 
  
  task write ;
    integer i=50;
    begin 
      @ (negedge clk) ;
      i=i+1;
      wdata=i;
      en=1;
      wr_rd=1;
    end
  endtask
  
  task read ;
  
    begin 
      @ (negedge clk) ;
      
      en<=1;
      wr_rd<=0;
      rd_adress<=rd_adress+1;
      status_counter<=status_counter-1;
    end
  endtask
  
  task stimulus;
    begin
      repeat (16) write;
      repeat (20) read;
    end
  endtask
  
  task check;
    begin 
    #2;
      if (wr_rd) $display ("WRITE adress=%d wdata=%d",mem[status_counter],wdata);
      else  $display ("READ adress=%d rdata=%d valid =%d",mem[status_counter],rdata,valid);
      if (valid) begin 
        if( rdata==mem[status_counter]) $display ("design is correct");
      else $display ("design is wrong");
      end
    end
  endtask 
  
  always @ (posedge clk) check;
  
  initial begin 
    $dumpfile ("fifo.vcd"); 
    $dumpvars;
    initialize;
    reset;
    stimulus;
    #10;
    $finish;
    
  end
endmodule
  
