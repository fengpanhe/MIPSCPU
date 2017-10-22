.DATA
  jmptable:  .HALF 0x1118,0x1168,0x11b8,0x1208,0x1230,0x1400,0x10c8
.TEXT 0x1000
start: mfc0 $t0,$13,0
  addi  $t1,$t0,0
  addi  $t2,$t0,0
  addi  $t3,$0,0
  addi  $t4,$0,8
  andi   $t1,$t1,0x007c
  srl   $t1,$t1,2
  beq   $t1,$t3,interrupt
  beq   $t1,$t4,exception
  eret
interrupt: srl  $t2,$t2,8
  addi  $t3,$0,1
  addi  $t4,$0,2
  beq $t2,$t3,0x1190
  beq $t2,$t4,0x11e0
  eret
exception: add  $a3,$a3,$a3
  addi  $t5,$a3,jmptable
  lh    $t6,0($t5)
  jr  $t6
  eret
