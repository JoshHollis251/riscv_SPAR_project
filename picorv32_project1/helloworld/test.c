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

int itoa(int num, char* str, int buffSize);
void Xil_Out32(unsigned *Addr, unsigned int Value);
unsigned int Xil_In32(unsigned *Addr);
void adder(unsigned int a, unsigned int b, unsigned int cin, unsigned int *cout, unsigned int *s);
void uart_write_byte(char byte);
void Delay(unsigned int delay);
int main() {
    const char *message = "working...";
    unsigned int val1 = 0x0;
    unsigned int val2 = 0x1;
    unsigned int cin = 0x0;
    unsigned int cout, s;
    Xil_Out32(AXI_GPIO_REG + 1, 0x0);
    while (1)
    {
        for (int i = 0; message[i] != '\0'; ++i) {
            uart_write_byte(message[i]);
        }
        adder(val1, val2, cin, &cout, &s);
        val1 = s < 15 ? s : 0;

    	// send the value to the GPIO
    	Xil_Out32(AXI_GPIO_REG, val1);
        uart_write_byte('\n');
        Delay(10000000);
    }
    return 0;
}

// Function to write to a memory-mapped register
void Xil_Out32(unsigned *Addr, unsigned int Value) {
    volatile unsigned *LocalAddr = (volatile unsigned *)Addr;
	*LocalAddr = Value;
}

// Function to read from a memory-mapped register
unsigned int Xil_In32(unsigned *Addr) {
    return *(volatile unsigned *) Addr;
}

void uart_write_byte(char byte) {

    volatile unsigned int *status_reg = (unsigned int *)(UART_BASE_ADDR + STATUS_REG_OFFSET);
    //what is in status reg
    Xil_Out32(AXI_GPIO_REG, *status_reg);

    while (!(*status_reg & UART_TX_EMPTY));
    volatile unsigned int *tx_fifo = (unsigned int *)(UART_BASE_ADDR + TX_FIFO_OFFSET);

    *tx_fifo = byte;
}

void adder(unsigned int a, unsigned int b, unsigned int cin, unsigned int *cout, unsigned int *s) {
    Xil_Out32((unsigned *) AXI_ADDER_BASE_ADDR, a);
    Xil_Out32((unsigned *) (AXI_ADDER_BASE_ADDR + B_OFFSET), b);
    Xil_Out32((unsigned *) (AXI_ADDER_BASE_ADDR + CIN_OFFSET), cin);
    *cout = Xil_In32((unsigned *) (AXI_ADDER_BASE_ADDR + COUT_OFFSET));
    *s = Xil_In32((unsigned *) (AXI_ADDER_BASE_ADDR + S_OFFSET));
}

void Delay(unsigned int delay) {
    unsigned int count = 0;
    while (count < delay){
        count++;
    }
}
