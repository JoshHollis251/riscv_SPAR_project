TOOLCHAIN := riscv32-unknown-elf-
CFLAGS := -march=rv32im -mabi=ilp32 -c
LFLAGS := -march=rv32im -mabi=ilp32 -ffreestanding -nostdlib -T linker.ld

BUILD_DIR := build
LIB_DIR := lib

# Default source file if none is specified
SRC ?= test

# Derived filenames based on the specified source
MAIN_SRC := $(SRC).c
OBJ_NAME := $(BUILD_DIR)/$(SRC).o
ELF_NAME := $(BUILD_DIR)/$(SRC).elf
BIN_NAME := $(BUILD_DIR)/$(SRC).bin
ASM_NAME := $(BUILD_DIR)/$(SRC).S
COE_NAME := $(BUILD_DIR)/$(SRC).coe

# Find library source files and specify object file names
LIB_SOURCES := $(wildcard $(LIB_DIR)/*.c)
LIB_OBJECTS := $(patsubst %,$(BUILD_DIR)/%,$(notdir $(LIB_SOURCES:.c=.o)))

.PHONY: all clean directories

all: directories $(ELF_NAME) $(ASM_NAME) $(COE_NAME)

directories:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(BUILD_DIR)/$(LIB_DIR)

$(OBJ_NAME): $(MAIN_SRC)
	@echo "Compiling $(MAIN_SRC)"
	@$(TOOLCHAIN)gcc $(CFLAGS) -o $@ $<

$(BUILD_DIR)/%.o: $(LIB_DIR)/%.c
	@echo "Compiling library $<"
	@$(TOOLCHAIN)gcc $(CFLAGS) -o $@ $<

$(ELF_NAME): $(OBJ_NAME) $(LIB_OBJECTS) start.S
	@echo "Assembling start.S"
	@$(TOOLCHAIN)gcc $(CFLAGS) -o $(BUILD_DIR)/start.o start.S
	@echo "Linking $@"
	@$(TOOLCHAIN)gcc $(LFLAGS) -o $@ $(OBJ_NAME) $(LIB_OBJECTS) $(BUILD_DIR)/start.o

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

