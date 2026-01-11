/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_aoc_2025 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  day10_wrapper u_day10_wrapper
      ( .clk             ( clk        )
      , .rst_n           ( rst_n      )

      , .data_in_tdata   ( ui_in      )
      , .data_in_tvalid  ( uio_in[7]  )
      , .data_in_tlast   ( uio_in[6]  )
      , .data_in_tready  ( uio_out[5] )

      , .data_out_tdata  ( uo_out     )
      , .data_out_tvalid ( uio_out[3] )
      , .data_out_tlast  ( uio_out[2] )
      , .data_out_tready ( uio_in[1]  )
      );

  assign uio_oe = { /* data in */ 4'b0010, /* data out */ 4'b0110 };

  assign {uio_out[7], uio_out[6], uio_out[4], uio_out[1], uio_out[0]} = '0;

  wire _unused =
    &{ ena, clk, rst_n
     ,  uio_in[5],  uio_in[4],  uio_in[3],  uio_in[2],  uio_in[0]
     };

endmodule
