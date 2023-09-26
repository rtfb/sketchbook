`default_nettype none
`timescale 1ns/1ps

module tb (
    );

    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    /*
    reg  ena;
    reg  [7:0] ui_in;
    reg  [7:0] uio_in;

    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    out_chunks out_chunks (
        .ui_in      (ui_in),    // Dedicated inputs
        .uo_out     (uo_out),   // Dedicated outputs
        .uio_in     (uio_in),   // IOs: Input path
        .uio_out    (uio_out),  // IOs: Output path
        .uio_oe     (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
        .ena        (ena),      // enable - goes high when design is selected
        .clk        (clk),      // clock
        .rst_n      (rst_n)     // not reset
    );
    */

    // wire up inputs and outputs. Use reg for inputs that will be driven by the testbench.
    reg  clk;
    reg  rst_n;
    // wire [7:0] uo_out;

    wire reset = !rst_n;
    wire have_output;
    // wire [3:0] output_bits = uo_out[3:0];
    wire [3:0] output_bits;

    out_chunks out_chunks (
        .clk         (clk),         // clock
        .reset       (reset),       // reset
        .have_output (have_output),
        .out_bits    (output_bits)
    );

endmodule
