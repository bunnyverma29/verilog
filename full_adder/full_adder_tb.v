module full_adder_tb (
    a,b,c,sum,carry);


output reg a,b,c;
input sum,carry;


full_adder  tb_instance (
                    .A(a),
                    .B(b),
                    .Cin(c),
                    .S(sum),
                    .Cout(carry)
                    );


integer  i;

    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(1);


        for (i=0;i<8;i=i+1) begin
            {a,b,c}=i;
            #10;
        end
        end

    
endmodule