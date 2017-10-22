.DATA
.TEXT 0x1118                #入口参数a0——要显示的数字，如0xffccddee,a1——高8位表示要显示的数码管，低8为表示要显示的小数点
start:addi  $t0,$a0,0
  addi  $t1,$a0,0
  srl $t1,$t1,16
  sh  $t0,0xfc00($0)
  sh  $t1,0xfc02($0)
  sh  $a1,0xfc04($0)
  eret
