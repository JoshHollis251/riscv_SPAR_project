reset_hw_axi [get_hw_axis hw_axi_1]
set address 0x00100000
set rt axi_bram_rt
create_hw_axi_txn $rt [get_hw_axis hw_axi_1] -type read -address $address -len 4 -force
run_hw_axi [get_hw_axi_txns $rt]
