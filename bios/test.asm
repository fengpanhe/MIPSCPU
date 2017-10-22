.DATA
.TEXT 0x8000
start: addi $a0,$0,0x0c01
  mtc0  $a0,$12,0
  addi  $gp,$0,1
loop: sw $t5,0xfc50($0)
  bne $gp,$0,loop
  sh  $v0,0xfc00($0)
  addi  $t2,$0,0x0100
  sh  $t2,0xfc04($0)
  j loop
