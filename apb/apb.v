module apb_slave ( 

                clk,
                preset,
                psel0,
                penable,
                pwrite,
                pwdata,
                paddr, 
                pready,
                pslverr,
                prdata
);

input clk,preset;
input  psel0,penable,pwrite;
input [7:0]  pwdata;
input [7:0] paddr;
output reg pready,pslverr;
output reg [7:0] prdata;

reg [1:0] state, next_state;
reg [7:0]mem[255:0];

parameter   IDLE = 2'b00;
parameter  SETUP = 2'b01;
parameter  ACCESS = 2'b10;

always @ (*)  begin
    if (state==ACCESS) begin
          pready<=0;
            if ( pwrite )begin
              mem [paddr] <= pwdata; 
              prdata <= 8'bx;
            end
            else prdata <= mem [paddr];  
        end
end

always @(posedge clk) begin
  if (preset) begin
     state <= IDLE ;
     pready <=1;
     pslverr <=0;
     prdata <= 8'bx;
  end
  else state <= next_state ;
end

always @(negedge clk)
     case (state)
       IDLE : begin
         next_state= psel0 ?  SETUP : IDLE ;
         pready<=1;
       end 
       SETUP : begin if (psel0 & penable) next_state = ACCESS;
               pready<=1;
               end
       ACCESS : begin
              if (!psel0) next_state = IDLE;                               
              else next_state =  penable ? ACCESS : SETUP ;
            end
    endcase
endmodule
