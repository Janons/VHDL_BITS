module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

    // 1. Logic to drive the counter's inputs
    assign c_enable = enable;
    
    // We want to load '1' if we hit reset OR if we are at 12 and counting
    assign c_load   = reset | (enable && Q == 4'd12);
    
    // The value we load is always 1
    assign c_d      = 4'd1;

    // 2. The ONLY place Q is defined is right here:
    count4 the_counter (
        .clk(clk),
        .enable(c_enable),
        .load(c_load),
        .d(c_d),
        .Q(Q) // The counter drives the output Q
    );

endmodule