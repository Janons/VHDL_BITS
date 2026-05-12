module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire C0,C1,C2;
    
    FA FA1(.a(x[0]), .b(y[0]), .cin(1'b0), .sum(sum[0]), .cout(C0));
    FA FA2(.a(x[1]), .b(y[1]), .cin(C0),   .sum(sum[1]), .cout(C1));
    FA FA3(.a(x[2]), .b(y[2]), .cin(C1),   .sum(sum[2]), .cout(C2));
    FA FA4(.a(x[3]), .b(y[3]), .cin(C2),   .sum(sum[3]), .cout(sum[4]));
    

endmodule




module FA( 
    input a, b, cin,
    output cout, sum );
    
	assign cout = a&b | b&cin | a&cin;
	assign sum  = a^b^cin;
endmodule

