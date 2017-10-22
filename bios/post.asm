.DATA
.TEXT 0x0000
start: addi  $sp,$0,0xbffc
  addi  $sp,$0,0xbffc
  sll   $sp,$sp,16
  srl   $sp,$sp,16
  addi  $t0,$0,0
  addi  $t1,$0,0xfffc
  sll   $t1,$t1,16
  srl   $t1,$t1,16
  addi  $t2,$0,0x55aa
  addi  $t3,$0,0xaa55
  addi  $s1,$0,0x0300
  addi  $t8,$0,1
  sw $t8,0xfc60($0)
  sll $t8,$t8,1
chkram: addi  $s0,$0,0xe1
  lw $t7,0($t0)
  sw  $t2,0($t0)
  lw  $t4,0($t0)
  bne $t4,$t2,error
  sw  $t3,0($t0)
  lw  $t4,0($t0)
  bne $t4,$t3,error
  sw  $t7,0($t0)
  beq $t0,$t1,chkkey
  addi  $t0,$t0,4
  j   chkram
chkkey: sw $t8,0xfc60($0)
  sll $t8,$t8,1
  addi $s0,$0,0xe2
  lw  $t0,0xfc12($0)
  andi  $t0,$t0,1
  bne $t0,$0,error
chkdisp: sw $t8,0xfc60($0)
  sll $t8,$t8,1
  addi  $s1,$0,0xffff
  andi $t0,$0,0
  addi  $t1,$0,16
  addi  $t5,$0,0
disp: addi $t2,$0,0xffff
  srl $t2,$t2,11
  sw  $t0,0xfc00($0)
  sw  $t0,0xfc02($0)
  sw  $s1,0xfc04($0)
lop: addi  $t2,$t2,-1
  bne $t2,$0,lop
  sw $t8,0xfc60($0)
  sll $t8,$t8,1
  addi  $t0,$t0,0x1111
  addi  $t5,$t5,1
  bne $t5,$t1,disp
  sw  $0,0xfc60($0)
  sw  $0,0xfc00($0)
  sw  $0,0xfc02($0)
  sw  $0,0xfc04($0)
  j loop
error: sw  $s0,0xfc00($0)
  sw  $s1,0xfc04($0)
  addi  $t5,$0,0xffff
  sw $t5,0xfc60($0)
loop: j loop
