`include "aoc-2025/src/axi_stream_if.svh"

module day10_wrapper #( parameter int unsigned AXI_DATA_WIDTH = 8 )
  ( input var logic clk
  , input var logic rst_n

  , input  var logic [AXI_DATA_WIDTH-1:0] data_in_tdata
  , output var logic [AXI_DATA_WIDTH-1:0] data_out_tdata
  );

  axi_stream_if #( .DATA_WIDTH ( AXI_DATA_WIDTH ) ) data_in();

  logic data_in_tready;

  assign data_in.tvalid = 1'b1;
  assign data_in.tdata  = data_in_tdata;
  assign data_in.tlast  = '0;
  assign data_in_tready = data_in.tready;

  axi_stream_if #( .DATA_WIDTH ( AXI_DATA_WIDTH ) ) data_out();

  assign data_out_tdata  = data_out.tdata;
  assign data_out.tready = 1'b1;

  day10
    #(.MAX_NUM_LIGHTS  ( 7              )
    , .MAX_NUM_BUTTONS ( 7              )
    , .AXI_DATA_WIDTH  ( AXI_DATA_WIDTH )
    )
    u_day10
      ( .clk      ( clk      )
      , .rst_n    ( rst_n    )
      , .data_in  ( data_in  )
      , .data_out ( data_out )
      );

endmodule
