# Toolchain setup
TOOLCHAIN := riscv32-unknown-elf-

# Compilation and linking flags
CFLAGS := -march=rv32i -mabi=ilp32 -c
LFLAGS := -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -T linker.ld

# Build directory
BUILD_DIR := build

# Filenames
SRC ?= test
OBJ_NAME := $(BUILD_DIR)/$(SRC).o
ELF_NAME := $(BUILD_DIR)/$(SRC).elf
BIN_NAME := $(BUILD_DIR)/$(SRC).bin
ASM_NAME := $(BUILD_DIR)/$(SRC).S
COE_NAME := $(BUILD_DIR)/$(SRC).coe

.PHONY: all clean

all: $(BUILD_DIR) $(COE_NAME) $(ASM_NAME)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(OBJ_NAME): $(SRC).c
	@echo "Compiling $<"
	@$(TOOLCHAIN)gcc $(CFLAGS) -o $@ $<

$(ELF_NAME): $(OBJ_NAME) start.S
	@echo "Assembling start.S"
	@$(TOOLCHAIN)as $(CFLAGS) -o $(BUILD_DIR)/start.o start.S
	@echo "Linking $<"
	@$(TOOLCHAIN)gcc $(LFLAGS) -o $@ $(OBJ_NAME) $(BUILD_DIR)/start.o

$(ASM_NAME): $(ELF_NAME)
	@echo "Generating assembly dump $@"
	@$(TOOLCHAIN)objdump -d $< > $@

$(BIN_NAME): $(ELF_NAME)
	@echo "Creating binary $@"
	@$(TOOLCHAIN)objcopy -O binary $< $@

$(COE_NAME): $(BIN_NAME)
	@echo "Generating COE file $@"
	@python3 binToCoe.py $< $@

clean:
	@echo "Cleaning up..."
	@rm -rf $(BUILD_DIR)
