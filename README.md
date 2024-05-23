## Description 
this project was used to test the functionality of the picorv32 risc-v microprocessor. This project provides a script to build a vivado 2022.1 project that contains the picorv32 processor connected via axi to a UART, GPIO, and a custom IP. The project also includes two BRAM controllers. The single port BRAM is used as a ROM that is initialized with a coefficient file. The coefficient file is the compiled form of a C program. The dual port BRAM is used as a standard RAM. 

To generate the coefficient file, a series of build tools as well as test programs has been provided. Start.S is used to initialize the stack before the main program is run. the linker script defines the address location of the RAM and the ROM and allocates each section accordingly. 
>[!NOTE] 
> If you change the address locations of the RAM and the ROM in the vivado project, you will need to manually change them in the linker script accordingly
binToCoe.py is a small python script that will convert a .bin file to the .coe format so it can be used by the vivado project. 

Finally, the Makefile utilizes all of the aforementioned files to generate a coefficient file from a C program. 
## Dependencies
In order to compile programs to be run on the picorv32 processor, you must install the official risc-V toolchain from the following github link `https://github.com/riscv-collab/riscv-gnu-toolchain`

follow instructions in their readme to install the **32-bit** version of the toolchain
## Installation
1. ensure you have Vivado 2022.1 installed. If you know what you are doing, feel free to use a different version.
2. clone this git repository onto your local machine
3. launch vivado
4. Navigate to Tools>Run TCL Script 
5. navigate to and run picorv32_project.tcl, this should generate the project with the block diagram with no errors
6. open single port BRAM controller and navigate to options. 
7. check the Load init file box and select the coe file you wish to run on the design.
8. generate bitstream and launch on hardware

## Usage
By using a 3rd party microprocessor, we lose access to a lot of the tools vivado provides. This includes standard C libraries and build tools. The build tools created in this project have been sufficient for small test programs however, they may require changes to be used for larger programs. The standard C libraries and xilinx libraries are not available for this design. If you wish to use one of those functions, you must implement it yourself. However, a basic print function that sends data over the UART has been included for debugging purposes.

the usage of the Makefile is `make SRC=<filename>`. Do not include the file extension in the argument 
