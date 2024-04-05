import string
import argparse

def bin_to_coe(bin_file_path, coe_file_path, radix=16):
    header = f"; COE file with radix={radix}\nmemory_initialization_radix={radix};\nmemory_initialization_vector=\n"
    
    with open(bin_file_path, 'rb') as bin_file:
        with open(coe_file_path, 'w') as coe_file:
            coe_file.write(header)
            
            four_bytes = bin_file.read(4)
            print(four_bytes[::-1])
            first_group = True
            while four_bytes:
                if not first_group:
                    coe_file.write(",\n")
                else:
                    first_group = False
                
                # Convert the 4 bytes to a single 32-bit integer
                value = int.from_bytes(four_bytes[::-1], 'big')

                coe_file.write(f"{value:08x}")
                
                four_bytes = bin_file.read(4)
            
            coe_file.write(";")

def main(input_file, output_file):
    print(f"Converting {input_file} to {output_file}")
    bin_to_coe(input_file, output_file)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Convert BIN to COE")
    parser.add_argument("input_file", help="Input BIN file path")
    parser.add_argument("output_file", help="Output COE file path")

    args = parser.parse_args()
    main(args.input_file, args.output_file)

