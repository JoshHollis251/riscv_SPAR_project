#ifndef parameters_h
#define parameters_h

#define BUFFER_SIZE 32	

#define UART_BASE_ADDR 0x40600000
#define TX_FIFO_OFFSET 0x04
#define STATUS_REG_OFFSET 0x08

#define UART_TX_EMPTY (1 << 2)

#define AXI_ADDER_BASE_ADDR 0x44A00000

#define B_OFFSET 0x04
#define CIN_OFFSET 0x08
#define COUT_OFFSET 0x0C
#define S_OFFSET 0x10

#define AXI_GPIO_BASE_ADDR 0x20000000
#define AXI_GPIO_REG ((unsigned *) AXI_GPIO_BASE_ADDR)

#endif // parameters_h