module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

    wire [3:0] q0, q1, q2; // Internal wires to "catch" the count values
    
    assign c_enable[0] = 1;

    bcdcount counter0 (
        .clk(clk),
        .reset(reset),
        .enable(c_enable[0]),
        .Q(q0) // Plug the wire here
    );
    
    
    assign c_enable[1] = (q0 == 9);
        
   
    bcdcount counter1(   
    .clk(clk),
        .reset(reset),
        .enable(c_enable[1]),
        .Q(q1) // Plug the wire here
    );
    
    
    assign c_enable[2] = (q0 == 9 && q1 == 9);
        
   
    
     bcdcount counter2(   
    .clk(clk),
        .reset(reset),
         .enable(c_enable[2]),
        .Q(q2) // Plug the wire here
    );
    
    
    assign OneHertz = (q0 == 4'b1001 && q1 ==  4'b1001 && q2 ==  4'b1001);
    
    
    
    
    

endmodule
