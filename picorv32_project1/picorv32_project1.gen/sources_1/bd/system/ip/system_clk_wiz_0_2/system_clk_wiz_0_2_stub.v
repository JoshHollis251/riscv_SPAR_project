// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Thu Oct 19 01:11:08 2023
// Host        : tortellini-MS-7B98 running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/tortellini/Xilinx_projects/picorv32_project1/picorv32_project1.gen/sources_1/bd/system/ip/system_clk_wiz_0_2/system_clk_wiz_0_2_stub.v
// Design      : system_clk_wiz_0_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module system_clk_wiz_0_2(clk_out_50, resetn, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out_50,resetn,locked,clk_in1" */;
  output clk_out_50;
  input resetn;
  output locked;
  input clk_in1;
endmodule
