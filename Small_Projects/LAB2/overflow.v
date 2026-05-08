module overflow(
    input  wire s,
    input  wire a,
    input  wire b,
    output wire is_overflow
);

    wire c0;
    wire c1;

    assign c0 = !a & !b & s;
    assign c1 = a & b & !s;

    assign is_overflow = c0|c1;



endmodule