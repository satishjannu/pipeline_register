module tb_pipeline_reg;
    parameter W = 8;
    logic clk;
    logic rst_n;
    logic in_valid;
    logic in_ready;
    logic [W-1:0] in_data;
    logic out_valid;
    logic out_ready;
    logic [W-1:0] out_data;
    pipeline_reg #(.W(W)) dut (
        .clk(clk),
        .rst_n(rst_n),
        .in_valid(in_valid),
        .in_ready(in_ready),
        .in_data(in_data),
        .out_valid(out_valid),
        .out_ready(out_ready),
        .out_data(out_data)
    );
    initial clk = 0;
    always #5 clk = ~clk;
    initial begin
        rst_n      = 0;
        in_valid  = 0;
        in_data   = 0;
        out_ready = 0;
        repeat (2) @(posedge clk);
        rst_n = 1;
        repeat (1) @(posedge clk);
        out_ready = 1;
        in_valid  = 1;
        in_data   = 8'h01;
        repeat (1) @(posedge clk);
        in_valid = 0;
        repeat (2) @(posedge clk);
        in_valid  = 1;
        in_data   = 8'h02;
        out_ready = 0;
        repeat (1) @(posedge clk);
        repeat (3) @(posedge clk);
        out_ready = 1;
        repeat (1) @(posedge clk);
        repeat (2) @(posedge clk);
        in_valid = 1;
        in_data  = 8'h03;
        repeat (1) @(posedge clk);
        in_data  = 8'h04;
        repeat (1) @(posedge clk);
        in_valid = 0;
        repeat (2) @(posedge clk);
        in_valid  = 1;
        in_data   = 8'h05;
        out_ready = 0;
        repeat (2) @(posedge clk);
        out_ready = 1;
        repeat (1) @(posedge clk);
        repeat (1) @(posedge clk);
        in_valid  = 1;
        in_data   = 8'h06;
        repeat (1) @(posedge clk);
        in_valid  = 1;
        in_data   = 8'h07;
        repeat (1) @(posedge clk);
        in_valid  = 0;
        repeat (3) @(posedge clk);
        in_valid  = 1;
        in_data   = 8'h08;
        out_ready = 0;
        repeat (1) @(posedge clk);
        out_ready = 1;
        repeat (1) @(posedge clk);
        repeat (2) @(posedge clk);
        in_valid  = 1;
        in_data   = 8'h09;
        repeat (1) @(posedge clk);
        repeat (1) @(posedge clk);
        in_valid  = 1;
        in_data   = 8'h0A;
        repeat (1) @(posedge clk);
        in_valid  = 0;
        repeat (3) @(posedge clk);
        $finish;
    end
endmodule
