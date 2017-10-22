.DATA
.TEXT 0x1230          #a0-CNT0orCNT1,a1-方式寄存器,a2-初始值
start: beq $a0,$0,cnt0
  j cnt1
cnt0: sh  $a1,0xfc20($0)
  sh  a2,0xfc24($0)
  j exit
cnt1: sh  $a1,0xfc22($0)
  sh  a2,0xfc26($0)
exit: eret
