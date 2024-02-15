-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Thu Oct 19 01:11:09 2023
-- Host        : tortellini-MS-7B98 running 64-bit Ubuntu 22.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/tortellini/Xilinx_projects/picorv32_project1/picorv32_project1.gen/sources_1/bd/system/ip/system_clk_wiz_0_2/system_clk_wiz_0_2_stub.vhdl
-- Design      : system_clk_wiz_0_2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35ticsg324-1L
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_clk_wiz_0_2 is
  Port ( 
    clk_out_50 : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end system_clk_wiz_0_2;

architecture stub of system_clk_wiz_0_2 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out_50,resetn,locked,clk_in1";
begin
end;
