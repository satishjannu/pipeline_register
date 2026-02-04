module pipeline_reg #(
    parameter int W = 32
) (
    input  logic clk,
    input  logic rst_n,
    input  logic in_valid,
    output logic in_ready,
    input  logic [W-1:0] in_data,
    output logic out_valid,
    input  logic out_ready,
    output logic [W-1:0] out_data
);

    logic [W-1:0] data_r;
    logic valid_r;

    assign in_ready  = ~valid_r || out_ready;
    assign out_valid = valid_r;
    assign out_data  = data_r;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            valid_r <= 1'b0;
            data_r  <= '0;
        end else begin
            if (in_ready) begin
                valid_r <= in_valid;
                if (in_valid) begin
                    data_r <= in_data;
                end
            end
        end
    end

endmodule
