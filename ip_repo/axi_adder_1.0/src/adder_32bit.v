`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 10:12:49 PM
// Design Name: 
// Module Name: adder_32bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//adder (its very beautiful I know)
module adder_32bit(
    input [31:0] a,
    input [31:0] b,
    output reg[31:0] s
    );
    always @ (*) begin
        s = a + b;
    end
endmodule
