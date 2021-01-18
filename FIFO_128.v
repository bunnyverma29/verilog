module FIFO (clk,rst,en,wdata,wr_rd,rdata,valid,full,empty);
  input clk;
  input rst;
  input en;
  input wr_rd;
  input [7:0] wdata;
  output reg [7:0] rdata;
  output valid;
  output full;
  output empty;
  
  // decalre meory ,
  reg [7:0] mem[0:127];
  
  reg [3:0] wr_adress;
  reg [3:0] rd_adress;
  reg [4:0] status_counter;
  
  assign full= (status_counter==16);
  assign empty= (status_counter==0);
  assign valid =en & (!wr_rd);
  
  //write operation 
  always @ (posedge clk) begin 
    if (rst) wr_adress<=0;
    else begin 
      if (en && wr_rd && !full) begin 
        mem[wr_adress]<=wdata;
        wr_adress<=wr_adress+1;
      end
    end
  end
  
  //read operation 
  always @ (posedge clk) begin 
    if (rst) begin 
      rd_adress<=0;
      rdata<=0;
    end
    else begin 
      if (en && !wr_rd && !empty) begin 
        rdata<=mem[rd_adress];
        rd_adress<=rd_adress+1;
      end
    end
  end
    
// status counter 
  always @ (posedge clk) begin 
    if (rst) status_counter<=0;
    else begin 
      if (en && wr_rd && !full) status_counter<=status_counter+1;
      if (en && !wr_rd && !empty) status_counter<=status_counter-1;
    end
  end
endmodule
