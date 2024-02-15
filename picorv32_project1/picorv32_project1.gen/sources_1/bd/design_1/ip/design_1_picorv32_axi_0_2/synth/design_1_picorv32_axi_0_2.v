// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:user:picorv32_axi:1.0
// IP Revision: 4

(* X_CORE_INFO = "picorv32_axi,Vivado 2022.1" *)
(* CHECK_LICENSE_TYPE = "design_1_picorv32_axi_0_2,picorv32_axi,{}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_picorv32_axi_0_2 (
  clk,
  resetn,
  trap,
  mem_axi_awvalid,
  mem_axi_awready,
  mem_axi_awaddr,
  mem_axi_awprot,
  mem_axi_wvalid,
  mem_axi_wready,
  mem_axi_wdata,
  mem_axi_wstrb,
  mem_axi_bvalid,
  mem_axi_bready,
  mem_axi_arvalid,
  mem_axi_arready,
  mem_axi_araddr,
  mem_axi_arprot,
  mem_axi_rvalid,
  mem_axi_rready,
  mem_axi_rdata
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF mem_axi, ASSOCIATED_RESET resetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *)
input wire resetn;
output wire trap;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi AWVALID" *)
output wire mem_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi AWREADY" *)
input wire mem_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi AWADDR" *)
output wire [31 : 0] mem_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi AWPROT" *)
output wire [2 : 0] mem_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi WVALID" *)
output wire mem_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi WREADY" *)
input wire mem_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi WDATA" *)
output wire [31 : 0] mem_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi WSTRB" *)
output wire [3 : 0] mem_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi BVALID" *)
input wire mem_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi BREADY" *)
output wire mem_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi ARVALID" *)
output wire mem_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi ARREADY" *)
input wire mem_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi ARADDR" *)
output wire [31 : 0] mem_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi ARPROT" *)
output wire [2 : 0] mem_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi RVALID" *)
input wire mem_axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi RREADY" *)
output wire mem_axi_rready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME mem_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 0, HAS_RRESP 0, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS\
 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 mem_axi RDATA" *)
input wire [31 : 0] mem_axi_rdata;

  picorv32_axi #(
    .ENABLE_COUNTERS(1'B1),
    .ENABLE_COUNTERS64(1'B1),
    .ENABLE_REGS_16_31(1'B1),
    .ENABLE_REGS_DUALPORT(1'B1),
    .TWO_STAGE_SHIFT(1'B1),
    .BARREL_SHIFTER(1'B0),
    .TWO_CYCLE_COMPARE(1'B0),
    .TWO_CYCLE_ALU(1'B0),
    .COMPRESSED_ISA(1'B0),
    .CATCH_MISALIGN(1'B1),
    .CATCH_ILLINSN(1'B1),
    .ENABLE_PCPI(1'B0),
    .ENABLE_MUL(1'B0),
    .ENABLE_FAST_MUL(1'B0),
    .ENABLE_DIV(1'B0),
    .ENABLE_IRQ(1'B0),
    .ENABLE_IRQ_QREGS(1'B1),
    .ENABLE_IRQ_TIMER(1'B1),
    .ENABLE_TRACE(1'B0),
    .REGS_INIT_ZERO(1'B0),
    .MASKED_IRQ(32'H00000000),
    .LATCHED_IRQ(32'HFFFFFFFF),
    .PROGADDR_RESET(32'H00100000),
    .PROGADDR_IRQ(32'H00000010),
    .STACKADDR(32'HFFFFFFFF)
  ) inst (
    .clk(clk),
    .resetn(resetn),
    .trap(trap),
    .mem_axi_awvalid(mem_axi_awvalid),
    .mem_axi_awready(mem_axi_awready),
    .mem_axi_awaddr(mem_axi_awaddr),
    .mem_axi_awprot(mem_axi_awprot),
    .mem_axi_wvalid(mem_axi_wvalid),
    .mem_axi_wready(mem_axi_wready),
    .mem_axi_wdata(mem_axi_wdata),
    .mem_axi_wstrb(mem_axi_wstrb),
    .mem_axi_bvalid(mem_axi_bvalid),
    .mem_axi_bready(mem_axi_bready),
    .mem_axi_arvalid(mem_axi_arvalid),
    .mem_axi_arready(mem_axi_arready),
    .mem_axi_araddr(mem_axi_araddr),
    .mem_axi_arprot(mem_axi_arprot),
    .mem_axi_rvalid(mem_axi_rvalid),
    .mem_axi_rready(mem_axi_rready),
    .mem_axi_rdata(mem_axi_rdata),
    .pcpi_valid(),
    .pcpi_insn(),
    .pcpi_rs1(),
    .pcpi_rs2(),
    .pcpi_wr(1'B0),
    .pcpi_rd(32'B0),
    .pcpi_wait(1'B0),
    .pcpi_ready(1'B0),
    .irq(32'B0),
    .eoi(),
    .trace_valid(),
    .trace_data()
  );
endmodule
