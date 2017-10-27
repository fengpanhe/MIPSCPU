.DATA
.TEXT 0x1280
start: addi $t4,$29,0x-7ffc
  bltz  $t4,over
  addi  $t5,$30,0x-7ffc
  bltz  $t5,over
  jr $ra
over: addi  $t5,$0,0x0300
  addi  $t4,$0,0xe3
  sw  $t4,0xfc00($0)
  sw  $t4,0xfc02($0)
  sw  $t5,0xfc04($0)
loop: sw $t6,0xfc50($0)
  j loop
