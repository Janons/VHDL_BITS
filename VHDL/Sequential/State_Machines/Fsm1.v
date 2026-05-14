module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out); 

    parameter A=0, B=1; 
    reg state, next_state;

    // 1. Next State Logic (Combinational)
    always @(*) begin
        case (state) // Decide next_state based on current state and input
            B: begin
                if (in == 1'b0) next_state = A;
                else            next_state = B;
            end
            A: begin
                if (in == 1'b0) next_state = B;
                else            next_state = A;
            end
            default: next_state = B;
        endcase
    end

    // 2. State Register (Sequential)
    always @(posedge clk, posedge areset) begin
        if (areset) begin
            state <= B; // Reset to state B
        end else begin
            state <= next_state; // Update current state
        end
    end

    // 3. Output Logic
    assign out = (state == B);

endmodule