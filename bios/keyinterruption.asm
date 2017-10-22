.DATA
.TEXT 0x11e0
start: mfc0 $t5,$12,0
  andi $t5,$t5,0xfffe
  mtc0  $t5,$12,0
  lh $v0,0xfc10($0)
  addi  $gp,$0,0
  mfc0 $t5,$12,0
  ori $t5,$t5,1
  mtc0  $t5,$12,0
  eret
