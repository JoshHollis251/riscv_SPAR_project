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

void Xil_Out32(unsigned *Addr, unsigned int Value);
unsigned int Xil_In32(unsigned *Addr);
void adder(unsigned int a, unsigned int b, unsigned int *s);
void uart_write_byte(char byte);
void uart_print(const char *message);
void Delay(unsigned int delay);

int main() {
    const char *message = "working...";
    char message2[32];
    unsigned int val1 = 1;
    unsigned int val2 = 1;
    unsigned int s;
    Delay(100000);
    while (1)
    {
        Xil_Out32(AXI_GPIO_REG + 1, 0x0);
        uart_print(message);
        adder(val1, val2, &s);
        val1 = s < 15 || s == 0 ? s : 0;
    	Xil_Out32(AXI_GPIO_REG, val1);
        uart_write_byte('\n');
        Delay(10000000);
    }
    return 0;
}

// Function to write to a memory-mapped register
void Xil_Out32(unsigned *Addr, unsigned int Value) {
    *Addr = Value;
}

// Function to read from a memory-mapped register
unsigned int Xil_In32(unsigned *Addr) {
    return *(volatile unsigned *) Addr;
}

void uart_write_byte(char byte) {

    volatile unsigned int *status_reg = (unsigned int *)(UART_BASE_ADDR + STATUS_REG_OFFSET);
    //what is in status reg
    // Xil_Out32(AXI_GPIO_REG, *status_reg);

    while (!(*status_reg & UART_TX_EMPTY));
    volatile unsigned int *tx_fifo = (unsigned int *)(UART_BASE_ADDR + TX_FIFO_OFFSET);

    *tx_fifo = byte;
}

void uart_print(const char *message) {
    for (int i = 0; message[i] != '\0'; ++i) {
        uart_write_byte(message[i]);
    }
}

void adder(unsigned int a, unsigned int b, unsigned int *s) {
    const char *message = "entering adder...";
    uart_print(message);
    Xil_Out32((unsigned *) AXI_ADDER_BASE_ADDR, a);
    Xil_Out32((unsigned *) (AXI_ADDER_BASE_ADDR + B_OFFSET), b);
    *s = Xil_In32((unsigned *) (AXI_ADDER_BASE_ADDR + S_OFFSET));
}

void Delay(unsigned int delay) {
    unsigned int count = 0;
    while (count < delay){
        count++;
    }
}
