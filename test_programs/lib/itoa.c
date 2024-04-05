//implement itoa in C no library function
#include "../include/utilities.h"
// #include <stdio.h>
// #define BUFFER_SIZE 32

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

// int main() {
//     char buffer[20];

//     // Test with various numbers
//     itoa(12345, buffer, BUFFER_SIZE);
//     printf("12345 as string: %s\n", buffer);

//     itoa(0, buffer, BUFFER_SIZE);
//     printf("0 as string: %s\n", buffer);

//     itoa(10, buffer, BUFFER_SIZE);
//     printf("INT_MAX as string: %s\n", buffer);

//     itoa(50, buffer, BUFFER_SIZE);
//     printf("INT_MIN as string: %s\n", buffer);

//     return 0;
// }