#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2015.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim CPU_TEST2_behav -key {Behavioral:sim_1:Functional:CPU_TEST2} -tclbatch CPU_TEST2.tcl -log simulate.log
