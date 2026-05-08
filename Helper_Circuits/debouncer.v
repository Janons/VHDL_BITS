module debouncer #(
    parameter CLK_FREQ 50_000_000,
    parameter DEBOUNCE_TIME_MS 20

)
(
    input wire clk,
    input wire rst_n,
    input wire button_in,
    output reg button_out,
)

    localparam COUNTER_MAX = (CLK_FREQ / 1000) * DEBOUNCE_TIME_MS;
    localparam COUNTER_WIDTH = $clog2(COUNTER_MAX + 1);

    //INTERNAL REGISTERS    
    reg [COUNTER_WIDTH-1:0] counter;
    reg button_sync_0, button_sync_1;

    //metastability avoidance
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            button_sync_0 <= 1'b0;
            button_sync_1 <= 1'b0;
        end else begin
            button_sync_0 <= button_in;
            button_sync_1 <= button_sync_0;
        end
    end

    //debounce logic
    always @(posedge clk or rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            button_out <= 1'b0;
        end else begin

            if (button_sync_1 != button_out)begin
                counter <= counter +1;
                if(counter >= COUNTER_MAX) begin
                    button_out <= button_sync_1;
                    counter <= 0;

            end
            end else begin
                counter <= 0;

            end
        end


    end


endmodule