
build/test.elf:     file format elf32-littleriscv


Disassembly of section .init:

00100000 <_start>:
  100000:	c0004137          	lui	sp,0xc0004
  100004:	00010113          	mv	sp,sp
  100008:	7f9000ef          	jal	101000 <main>

Disassembly of section .text:

00101000 <main>:
  101000:	fe010113          	add	sp,sp,-32 # c0003fe0 <_stack_start+0xfe0>
  101004:	00112e23          	sw	ra,28(sp)
  101008:	00812c23          	sw	s0,24(sp)
  10100c:	02010413          	add	s0,sp,32
  101010:	001027b7          	lui	a5,0x102
  101014:	00078793          	mv	a5,a5
  101018:	fef42423          	sw	a5,-24(s0)
  10101c:	00000593          	li	a1,0
  101020:	200007b7          	lui	a5,0x20000
  101024:	00478513          	add	a0,a5,4 # 20000004 <Delay+0x1fefeed8>
  101028:	05c000ef          	jal	101084 <Xil_Out32>
  10102c:	fe042623          	sw	zero,-20(s0)
  101030:	0280006f          	j	101058 <main+0x58>
  101034:	fec42783          	lw	a5,-20(s0)
  101038:	fe842703          	lw	a4,-24(s0)
  10103c:	00f707b3          	add	a5,a4,a5
  101040:	0007c783          	lbu	a5,0(a5)
  101044:	00078513          	mv	a0,a5
  101048:	06c000ef          	jal	1010b4 <uart_write_byte>
  10104c:	fec42783          	lw	a5,-20(s0)
  101050:	00178793          	add	a5,a5,1
  101054:	fef42623          	sw	a5,-20(s0)
  101058:	fec42783          	lw	a5,-20(s0)
  10105c:	fe842703          	lw	a4,-24(s0)
  101060:	00f707b3          	add	a5,a4,a5
  101064:	0007c783          	lbu	a5,0(a5)
  101068:	fc0796e3          	bnez	a5,101034 <main+0x34>
  10106c:	00a00513          	li	a0,10
  101070:	044000ef          	jal	1010b4 <uart_write_byte>
  101074:	009897b7          	lui	a5,0x989
  101078:	68078513          	add	a0,a5,1664 # 989680 <Delay+0x888554>
  10107c:	0b0000ef          	jal	10112c <Delay>
  101080:	fadff06f          	j	10102c <main+0x2c>

00101084 <Xil_Out32>:
  101084:	fe010113          	add	sp,sp,-32
  101088:	00812e23          	sw	s0,28(sp)
  10108c:	02010413          	add	s0,sp,32
  101090:	fea42623          	sw	a0,-20(s0)
  101094:	feb42423          	sw	a1,-24(s0)
  101098:	fec42783          	lw	a5,-20(s0)
  10109c:	fe842703          	lw	a4,-24(s0)
  1010a0:	00e7a023          	sw	a4,0(a5)
  1010a4:	00000013          	nop
  1010a8:	01c12403          	lw	s0,28(sp)
  1010ac:	02010113          	add	sp,sp,32
  1010b0:	00008067          	ret

001010b4 <uart_write_byte>:
  1010b4:	fd010113          	add	sp,sp,-48
  1010b8:	02112623          	sw	ra,44(sp)
  1010bc:	02812423          	sw	s0,40(sp)
  1010c0:	03010413          	add	s0,sp,48
  1010c4:	00050793          	mv	a5,a0
  1010c8:	fcf40fa3          	sb	a5,-33(s0)
  1010cc:	406007b7          	lui	a5,0x40600
  1010d0:	00878793          	add	a5,a5,8 # 40600008 <Delay+0x404feedc>
  1010d4:	fef42623          	sw	a5,-20(s0)
  1010d8:	fec42783          	lw	a5,-20(s0)
  1010dc:	0007a783          	lw	a5,0(a5)
  1010e0:	00078593          	mv	a1,a5
  1010e4:	20000537          	lui	a0,0x20000
  1010e8:	f9dff0ef          	jal	101084 <Xil_Out32>
  1010ec:	00000013          	nop
  1010f0:	fec42783          	lw	a5,-20(s0)
  1010f4:	0007a783          	lw	a5,0(a5)
  1010f8:	0047f793          	and	a5,a5,4
  1010fc:	fe078ae3          	beqz	a5,1010f0 <uart_write_byte+0x3c>
  101100:	406007b7          	lui	a5,0x40600
  101104:	00478793          	add	a5,a5,4 # 40600004 <Delay+0x404feed8>
  101108:	fef42423          	sw	a5,-24(s0)
  10110c:	fdf44703          	lbu	a4,-33(s0)
  101110:	fe842783          	lw	a5,-24(s0)
  101114:	00e7a023          	sw	a4,0(a5)
  101118:	00000013          	nop
  10111c:	02c12083          	lw	ra,44(sp)
  101120:	02812403          	lw	s0,40(sp)
  101124:	03010113          	add	sp,sp,48
  101128:	00008067          	ret

0010112c <Delay>:
  10112c:	fd010113          	add	sp,sp,-48
  101130:	02812623          	sw	s0,44(sp)
  101134:	03010413          	add	s0,sp,48
  101138:	fca42e23          	sw	a0,-36(s0)
  10113c:	fe042623          	sw	zero,-20(s0)
  101140:	0100006f          	j	101150 <Delay+0x24>
  101144:	fec42783          	lw	a5,-20(s0)
  101148:	00178793          	add	a5,a5,1
  10114c:	fef42623          	sw	a5,-20(s0)
  101150:	fec42703          	lw	a4,-20(s0)
  101154:	fdc42783          	lw	a5,-36(s0)
  101158:	fef766e3          	bltu	a4,a5,101144 <Delay+0x18>
  10115c:	00000013          	nop
  101160:	00000013          	nop
  101164:	02c12403          	lw	s0,44(sp)
  101168:	03010113          	add	sp,sp,48
  10116c:	00008067          	ret
