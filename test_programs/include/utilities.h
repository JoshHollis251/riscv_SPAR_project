// utilities.h
#ifndef UTILITIES_H
#define UTILITIES_H

void Xil_Out32(unsigned *Addr, unsigned int Value);
unsigned int Xil_In32(unsigned *Addr);
void uart_write_byte(char byte);
void uart_print(const char *message);
void Delay(unsigned int delay);
int itoa(int num, char* str, int buffSize);
static void reverse(char* str, int length);

// Add other function prototypes and macros here

#endif // UTILITIES_H
