  
module traffic(x,clk,rst,Highway,Country,state);
  input x,clk,rst;
  output [1:0] Highway,Country;
  output reg [1:0] state;
  
  parameter S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;
  parameter green=2'b00, red=2'b01, yellow=2'b10;
  reg [1:0] initial_state;
  reg [1:0] highway,country;
  parameter delay1=2;
  parameter delay2=3;
  
  	 assign Country=country;
     assign Highway=highway;
 

  
  always @ (posedge clk, rst)
    begin
      if (rst==0) begin
        initial_state<=S0;
        highway<=green;
        country<=red; end 
      else   state <= initial_state;
    end
  
  always @ (posedge clk,x,state)
    begin
      case(state)							           // HIGHwy  Country 
        S0:initial_state= x ? S1:S0; 			 //	g	     r
        S1: begin 
          repeat(delay1)@ (posedge clk);
          initial_state= S2;
    	    end							                  // 	y		 y
        S2:initial_state= x ? S2:S3;   		  //    r		 g
        S3:begin 
          repeat(delay2)@ (posedge clk);
          initial_state=S0;
        	end		                    	        //	y		y
      endcase
    end
        
  always @(state,posedge clk)
          begin
            case(state)
              S0: begin highway=green;country=red; end
              S1: begin highway=yellow;country=yellow; end
              S2: begin highway=red;country=green; end
              S3: begin highway=yellow;country=yellow; end	
            endcase
          end  
endmodule