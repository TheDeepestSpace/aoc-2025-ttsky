`include "aoc-2025/src/axi_stream_if.svh"

module day10_wrapper #( parameter int unsigned AXI_DATA_WIDTH = 8 )
  ( input var logic clk
  , input var logic rst_n

  , input  var logic [AXI_DATA_WIDTH-1:0] data_in_tdata
  , input  var logic                      data_in_tvalid
  , input  var logic                      data_in_tlast
  , output var logic                      data_in_tready

  , output var logic [AXI_DATA_WIDTH-1:0] data_out_tdata
  , output var logic                      data_out_tvalid
  , output var logic                      data_out_tlast
  , input  var logic                      data_out_tready
  );

  axi_stream_if #( .DATA_WIDTH ( AXI_DATA_WIDTH ) ) data_in();

  assign data_in.tdata  = data_in_tdata;
  assign data_in.tvalid = data_in_tvalid;
  assign data_in.tlast  = data_in_tlast;
  assign data_in_tready = data_in.tready;

  axi_stream_if #( .DATA_WIDTH ( AXI_DATA_WIDTH ) ) data_out();

  assign data_out_tdata  = data_out.tdata;
  assign data_out_tvalid = data_out.tvalid;
  assign data_out_tlast  = data_out.tlast;
  assign data_out.tready = data_out_tready;

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
