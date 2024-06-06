# PicoRV32 RISC-V Soft Processor Project

This project tests the functionality of the PicoRV32 RISC-V Soft Processor. It provides a script to build a Vivado 2022.1 project containing the PicoRV32 processor connected via AXI to a UART, GPIO, and custom IP. The project also includes two BRAM controllers. The single-port BRAM is used as a ROM initialized with a coefficient file, which is the compiled form of a C program. The dual-port BRAM is used as standard RAM.

To generate the coefficient file, a series of build tools as well as a test program has been provided. 
- **Start.S** is used to initialize the stack before the main program is run. 
- **linker.ld** defines the address location of the RAM and the ROM and allocates each section accordingly. If the address of the ROM or RAM change, ensure you update here aswell
- **binToCoe.py** is a small python script that will convert a .bin file to the .coe format so it can be used by the vivado project. 
- **The Makefile** utilizes all of the aforementioned files to generate a coefficient or .coe file from a C program. 

## Test Program and Libraries
A test program test.c is provided. This program is a simple LED counter that utilizes all of the components of the SoC. This includes writing messages through the UART, sending data to the GPIO, and performing addition using a custom IP. This test program has already been compiled and the build files are located in the build directory.

Parameters.h contains register locations and offsets that are needed in the test program. Additional parameters can be added as needed. 

The utilities library contains helpful functions for general use. This currently includes
- Xil_Out32(unsigned *Addr, unsigned int Value);
- Xil_In32(unsigned *Addr);
- uart_write_byte(char byte);
- uart_print(const char *message);
- Delay(unsigned int delay);
- itoa(int num, char* str, int buffSize);
- reverse(char* str, int length);

## Dependencies
1. Vivado 2022.1
2. 32-bit GNU toolchain for riscv found [here](https://github.com/riscv-collab/riscv-gnu-toolchain)
3. python 

## Installation and Setup
1. ensure you have Vivado 2022.1 installed. If you know what you are doing, feel free to use a different version.
2. ensure you have the 32-bit GNU riscv toolchain installed. follow the guide [here](https://github.com/riscv-collab/riscv-gnu-toolchain) to install the toolchain
3. clone this git repository onto your local machine
4. launch vivado
5. navigate to Tools>Run TCL Script 
6. navigate to and run picorv32_project.tcl, this should generate the project with the block diagram with no errors
7. open single port BRAM controller and navigate to options. 
8. check the Load init file box and select the test.coe to run on the design.
9. open picorv32_axi_0 and check the "enable div" and "enable Mul" boxes
10. generate bitstream and launch on hardware

To test that the toolchain is functional, launch a terminal and navigate to the test_programs directory. Here, invoke the makefile using ``make SRC=<filename>`` and do not include the file extension. If no errors appear, then the make file was able to find the toolchain. If there are errors, there is likely an issue with your toolchain installation or installation of this project. 

## Usage
By using a 3rd party soft processor, we lose access to a lot of the tools the xilinx suite provides. This includes standard C libraries and build tools from vitis. With a large amount of effort, third party soft processors should be able to be used with vitis, however the build tools created in this project have been sufficient for small test programs. This may need to change to be used for larger programs. 

The standard C libraries and xilinx libraries are not available for this design. If you wish to use one of those functions, you must implement it yourself. However, a basic print function that sends data over the UART has been included for debugging purposes. Also included is an ITOA function so that integers may be sent over uart

If you wish to change the test program running on the processor, follow setup steps 7 and 8 for your desired .coe file. This will require you to regenerate the bitstream. If you wish to load a new program after the bitstream is generated, you will need to design a bootloader.

