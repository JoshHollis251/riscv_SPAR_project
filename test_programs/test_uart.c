#define UART_BASE_ADDR 0x40600000
#define TX_FIFO_OFFSET 0x04
#define STATUS_REG_OFFSET 0x08

#define UART_TX_EMPTY (1 << 2)

void Xil_Out32(unsigned *Addr, unsigned int Value);
void uart_write_byte(char byte);

int main() {
	const char *message = "working...";
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

void Xil_Out32(unsigned *Addr, unsigned int Value) {
    *Addr = Value;
}

void uart_write_byte(char byte) {

    volatile unsigned int *status_reg = (unsigned int *)(UART_BASE_ADDR + STATUS_REG_OFFSET);
    //what is in status reg
    // Xil_Out32(AXI_GPIO_REG, *status_reg);

    while (!(*status_reg & UART_TX_EMPTY));
    volatile unsigned int *tx_fifo = (unsigned int *)(UART_BASE_ADDR + TX_FIFO_OFFSET);

    *tx_fifo = byte;
}