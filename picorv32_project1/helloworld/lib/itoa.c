//implement itoa in C no library function

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
				num = -num;
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
