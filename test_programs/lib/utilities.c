//implement itoa in C no library function
#include "../include/utilities.h"
#include "../include/parameters.h"

/// Function to write to a memory-mapped register
void Xil_Out32(unsigned *Addr, unsigned int Value) {
    *Addr = Value;
}

// Function to read from a memory-mapped register
unsigned int Xil_In32(unsigned *Addr) {
    return *(volatile unsigned *) Addr;
}

void uart_write_byte(char byte) {
    volatile unsigned int *status_reg = (unsigned int *)(UART_BASE_ADDR + STATUS_REG_OFFSET);
    while (!(*status_reg & UART_TX_EMPTY));
    volatile unsigned int *tx_fifo = (unsigned int *)(UART_BASE_ADDR + TX_FIFO_OFFSET);
    *tx_fifo = byte;
}

void uart_print(const char *message) {
    for (int i = 0; message[i] != '\0'; ++i) {
        uart_write_byte(message[i]);
    }
}

void Delay(unsigned int delay) {
    unsigned int count = 0;
    while (count < delay){
        count++;
    }
}

static void reverse(char* str, int length)
{
		int start = 0;
		int end = length - 1;
		while (start < end)
		{
				char temp = *(str + start);
				*(str + start) = *(str + end);
				*(str + end) = temp;
				start++;
				end--;
		}
}

int itoa(int num, char* str, int buffSize)
{
    uart_print("\nentering itoa..");
    int i = 0;
    int isNegative = 0;

    if (buffSize < 2){
        *str = '\0';
        return 1;
    }

    // Handle 0
    if (num == 0) {
            str[i++] = '0';
            str[i] = '\0';
            return 0;
    }

    if (num < 0) {
            isNegative = 1;
            return 0;
    }

    // Process individual digits
    while (num != 0 && i < buffSize - 1 - isNegative) {
            int rem = num % 10;
            str[i++] = rem + '0';
            num = num / 10;
    }

    // If number is negative, append '-'
    if (isNegative)
            str[i++] = '-';
    str[i] = '\0'; // Append string terminator


    // Reverse the string
    reverse(str, i);

    return 0;
}