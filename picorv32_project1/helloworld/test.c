#define UART_BASE_ADDR 0x40600000
#define TX_FIFO_OFFSET 0x04
#define STATUS_REG_OFFSET 0x08

#define UART_TX_EMPTY (1 << 2)

#define AXI_GPIO_BASE_ADDR 0x20000000
#define AXI_GPIO_REG ((unsigned *) AXI_GPIO_BASE_ADDR)

void Xil_Out32(unsigned *Addr, unsigned int Value);
void uart_write_byte(char byte);
void Delay(unsigned int delay);
unsigned int val = 0x0;

int main() {
    const char *message = "Hello RISC-V";
    Xil_Out32(AXI_GPIO_REG + 1, 0x0);
    while (1)
    {
        for (int i = 0; message[i] != '\0'; ++i) {
            uart_write_byte(message[i]);
        }

        uart_write_byte('\n');
        Delay(10000000);
    }
    return 0;
}

// Function to write to a memory-mapped register
void Xil_Out32(unsigned *Addr, unsigned int Value) {
    *Addr = Value;
}

void uart_write_byte(char byte) {

    volatile unsigned int *status_reg = (unsigned int *)(UART_BASE_ADDR + STATUS_REG_OFFSET);
    //what is in status reg
    Xil_Out32(AXI_GPIO_REG, *status_reg);

    while (!(*status_reg & UART_TX_EMPTY));
    volatile unsigned int *tx_fifo = (unsigned int *)(UART_BASE_ADDR + TX_FIFO_OFFSET);

    *tx_fifo = byte;
}

void Delay(unsigned int delay) {
    unsigned int count = 0;
    while (count < delay){
        count++;
    }
}
