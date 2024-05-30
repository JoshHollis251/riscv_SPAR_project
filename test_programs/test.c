#include <utilities.h>
#include <parameters.h>

void adder(unsigned int a, unsigned int b, unsigned int *s);

int main() {
    char message[32];
    unsigned int val1 = 1;
    unsigned int val2 = 1;
    unsigned int s;
    Delay(100000);
    while (1)
    {
    	Xil_Out32(AXI_GPIO_REG, val1);
        adder(val1, val2, &s);
        val1 = s < 15 || s == 0 ? s : 0;
        itoa(s, message, BUFFER_SIZE);
        uart_print("count: ");
        uart_print(message);
        Delay(5000000);
    }
    return 0;
}

void adder(unsigned int a, unsigned int b, unsigned int *s) {
    const char *message = "\nentering adder...";
    uart_print(message);
    Xil_Out32((unsigned *) AXI_ADDER_BASE_ADDR, a);
    Xil_Out32((unsigned *) (AXI_ADDER_BASE_ADDR + B_OFFSET), b);
    *s = Xil_In32((unsigned *) (AXI_ADDER_BASE_ADDR + S_OFFSET));
}