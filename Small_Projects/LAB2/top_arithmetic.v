module top_arithmetic(input sw[16:0]
input wire btn1,
input wire btn_2,
input wire SUB,
input  wire clk,
input  wire rst_n,
output leds[5:0])

//reg definitions
wire[7:0] b = sw[15:8];
wire[7:0] a = sw[7:0];

//button wires
wire btn1_out;
wire btn2_out;

//arithmetic 
reg[7:0] s;
wire c_out

//overflow detector
wire overflow_r;


// sub select — btn2 selects subtraction, btn1 selects addition
wire sub_op;
assign sub_op = (btn2_out == 1'b1 && btn1_out != 1'b1) ? 1'b1 : 1'b0;

// b inversion for subtraction
wire [7:0] b_modified;
assign b_modified = (sub_op == 1'b1) ? ~b : b;


//button initilization
debouncer #(
        .CLK_FREQ(50_000_000),
        .DEBOUNCE_TIME_MS(20)
    ) debouncer_btn1 (
        .clk(clk),
        .rst_n(rst_n),
        .button_in(btn1),
        .button_out(btn1_out)
    );

debouncer #(
        .CLK_FREQ(50_000_000),
        .DEBOUNCE_TIME_MS(20)
    ) debouncer_btn1 (
        .clk(clk),
        .rst_n(rst_n),
        .button_in(btn2),
        .button_out(btn2_out)

    );

   
    //arithmetic circut
    eight_bit_binary_adder eight_bit_binary_adder(
        .a(a),
        .b(b),
        .cin(SUB),
        .sum(s),
        .cout(cout),
    );

    



    //overflow detector
    overflow overflow(.s(s[7],
    .a[a[7]],
    .b[b_modified[7]],
    .is_overflow(overflow_r)));

    //output assignments
    assign led[4:0] = s;
    assign led[5] = overflow_r;







endmodule