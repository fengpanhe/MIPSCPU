.DATA
.TEXT 0x1190
start: mfc0 $t5,$12,0
  andi $t5,$t5,0xfffe
  mtc0  $t5,$12,0
  lw $t4,0xfc70($0)
  sw $t4,0xfc60($0)
  mfc0 $t5,$12,0
  ori $t5,$t5,1
  mtc0  $t5,$12,0
  eret
