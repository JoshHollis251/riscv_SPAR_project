
`timescale 1 ns / 1 ps

	module axi_adder_32bit_v1_0 #
	(
        parameter integer C_S00_AXI_BASE_ADDR = 32'h0000_0000,

		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 5,
		
		integer OPERAND_A_ADDR = C_S00_AXI_BASE_ADDR + 4'h0,
		integer OPERAND_B_ADDR = C_S00_AXI_BASE_ADDR + 4'h4,
		integer CARRY_IN_ADDR  = C_S00_AXI_BASE_ADDR + 4'h8,
		integer CARRY_OUT_ADDR = C_S00_AXI_BASE_ADDR + 4'hC,
		integer RESULT_ADDR    = C_S00_AXI_BASE_ADDR + 4'h10
	)
	(
		// Users to add ports here
        reg [31:0] operand_a,
        reg [31:0] operand_b,
        reg carry_in,
        reg [31:0] s,
        reg carry_out,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
// Instantiation of Axi Bus Interface S00_AXI
	axi_adder_32bit_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) axi_adder_32bit_v1_0_S00_AXI_inst (
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);
	
	adder_32bit adder (
	   .a(operand_a),
	   .b(operand_b),
	   .cin(carry_in),
	   .s(s),
	   .cout(carry_out)
	); 

	// Add user logic here
    always @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            operand_a <= 0;
            operand_b <= 0;
            carry_in <= 0;
        end else if (S_AXI_WVALID) begin //write
            case (S_AXI_AWADDR)
                OPERAND_A_ADDR: operand_a <= S_AXI_WDATA;
                OPERAND_B_ADDR: operand_b <= S_AXI_WDATA;
                CARRY_IN_ADDR: carry_in <= S_AXI_WDATA[0]; 
            endcase
        end else if (S_AXI_ARVALID) begin //read
            case (S_AXI_ARADDR)
                RESULT_ADDR: S_AXI_RDATA <= adder_result;
                CARRY_OUT_ADDR: S_AXI_RDATA <= {31'b0, adder_carry_out};
            endcase
        end
    end
	// User logic ends

	endmodule
