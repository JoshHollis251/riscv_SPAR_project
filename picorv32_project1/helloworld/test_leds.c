#define AXI_GPIO_BASE_ADDR 0x20000000
#define AXI_GPIO_REG ((unsigned *) AXI_GPIO_BASE_ADDR)

void Xil_Out32(unsigned *Addr, unsigned int Value);
void Delay(unsigned int delay);

int main() {
    unsigned int val = 0x0;
    while (1) {
        Delay(100000);
        val = val < 15 ? val + 1 : 0;
    	// Set the GPIO pins as outputs
    	Xil_Out32(AXI_GPIO_REG + 1, 0x0);
    	//*(AXI_GPIO_REG + 1) = 0x0;

    	// Turn on all 4 LEDs (set the 4LSBs to 1)
    	Xil_Out32(AXI_GPIO_REG, val);
    	// *(AXI_GPIO_REG) = 0xF;
    }
        return 0;
}


// Function to write to a memory-mapped register
void Xil_Out32(unsigned *Addr, unsigned int Value) {
    *Addr = Value;
}

void Delay(unsigned int delay) {
    unsigned int count = 0;
    while (count < delay){
        count++;
    }
}
