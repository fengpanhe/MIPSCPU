#!/bin/bash -f
# Vivado (TM) v2015.4 (64-bit)
#
# Filename    : m_multiplier.sh
# Simulator   : Cadence Incisive Enterprise Simulator
# Description : Simulation script for compiling, elaborating and verifying the project source files.
#               The script will automatically create the design libraries sub-directories in the run
#               directory, add the library logical mappings in the simulator setup file, create default
#               'do/prj' file, execute compilation, elaboration and simulation steps.
#
# Generated by Vivado on Tue Sep 26 14:59:56 +0800 2017
# IP Build 1412160 on Tue Nov 17 13:47:24 MST 2015 
#
# usage: m_multiplier.sh [-help]
# usage: m_multiplier.sh [-lib_map_path]
# usage: m_multiplier.sh [-noclean_files]
# usage: m_multiplier.sh [-reset_run]
#
# Prerequisite:- To compile and run simulation, you must compile the Xilinx simulation libraries using the
# 'compile_simlib' TCL command. For more information about this command, run 'compile_simlib -help' in the
# Vivado Tcl Shell. Once the libraries have been compiled successfully, specify the -lib_map_path switch
# that points to these libraries and rerun export_simulation. For more information about this switch please
# type 'export_simulation -help' in the Tcl shell.
#
# You can also point to the simulation libraries by either replacing the <SPECIFY_COMPILED_LIB_PATH> in this
# script with the compiled library directory path or specify this path with the '-lib_map_path' switch when
# executing this script. Please type 'm_multiplier.sh -help' for more information.
#
# Additional references - 'Xilinx Vivado Design Suite User Guide:Logic simulation (UG900)'
#
# ********************************************************************************************************

# Script info
echo -e "m_multiplier.sh - Script generated by export_simulation (Vivado v2015.4 (64-bit)-id)\n"

# Script usage
usage()
{
  msg="Usage: m_multiplier.sh [-help]\n\
Usage: m_multiplier.sh [-lib_map_path]\n\
Usage: m_multiplier.sh [-reset_run]\n\
Usage: m_multiplier.sh [-noclean_files]\n\n\
[-help] -- Print help information for this script\n\n\
[-lib_map_path <path>] -- Compiled simulation library directory path. The simulation library is compiled\n\
using the compile_simlib tcl command. Please see 'compile_simlib -help' for more information.\n\n\
[-reset_run] -- Recreate simulator setup files and library mappings for a clean run. The generated files\n\
from the previous run will be removed. If you don't want to remove the simulator generated files, use the\n\
-noclean_files switch.\n\n\
[-noclean_files] -- Reset previous run, but do not remove simulator generated files from the previous run.\n\n"
  echo -e $msg
  exit 1
}

if [[ ($# == 1 ) && ($1 != "-lib_map_path" && $1 != "-noclean_files" && $1 != "-reset_run" && $1 != "-help" && $1 != "-h") ]]; then
  echo -e "ERROR: Unknown option specified '$1' (type \"./m_multiplier.sh -help\" for more information)\n"
  exit 1
fi

if [[ ($1 == "-help" || $1 == "-h") ]]; then
  usage
fi

# STEP: setup
setup()
{
  case $1 in
    "-lib_map_path" )
      if [[ ($2 == "") ]]; then
        echo -e "ERROR: Simulation library directory path not specified (type \"./m_multiplier.sh -help\" for more information)\n"
        exit 1
      fi
      # precompiled simulation library directory path
     create_lib_mappings $2
     touch hdl.var
    ;;
    "-reset_run" )
      reset_run
      echo -e "INFO: Simulation run files deleted.\n"
      exit 0
    ;;
    "-noclean_files" )
      # do not remove previous data
    ;;
    * )
     create_lib_mappings $2
     touch hdl.var
  esac

  # Add any setup/initialization commands here:-

  # <user specific commands>

}

# Remove generated data from the previous run and re-create setup files/library mappings
reset_run()
{
  files_to_remove=(ncsim.key irun.key ncvlog.log ncvhdl.log compile.log elaborate.log simulate.log run.log waves.shm INCA_libs)
  for (( i=0; i<${#files_to_remove[*]}; i++ )); do
    file="${files_to_remove[i]}"
    if [[ -e $file ]]; then
      rm -rf $file
    fi
  done
}

# Main steps
run()
{
  setup $1 $2
  compile
  elaborate
  simulate
}

# Create design library directory paths and define design library mappings in cds.lib
create_lib_mappings()
{
  libs=(xbip_utils_v3_0_5 xbip_pipe_v3_0_1 xbip_bram18k_v3_0_1 mult_gen_v12_0_10 xil_defaultlib)
  file="cds.lib"
  dir="ies"

  if [[ -e $file ]]; then
    rm -f $file
  fi

  if [[ -e $dir ]]; then
    rm -rf $dir
  fi

  touch $file
  lib_map_path="<SPECIFY_COMPILED_LIB_PATH>"
  if [[ ($1 != "" && -e $1) ]]; then
    lib_map_path="$1"
  else
    echo -e "ERROR: Compiled simulation library directory path not specified or does not exist (type "./top.sh -help" for more information)\n"
  fi
  incl_ref="INCLUDE $lib_map_path/cds.lib"
  echo $incl_ref >> $file

  for (( i=0; i<${#libs[*]}; i++ )); do
    lib="${libs[i]}"
    lib_dir="$dir/$lib"
    if [[ ! -e $lib_dir ]]; then
      mkdir -p $lib_dir
      mapping="DEFINE $lib $dir/$lib"
      echo $mapping >> $file
    fi
  done
}


# RUN_STEP: <compile>
compile()
{
  # Directory path for design sources and include directories (if any) wrt this path
  ref_dir="."
  # Command line options
  opts_ver="-64bit -messages -logfile ncvlog.log -append_log"
  opts_vhd="-64bit -V93 -RELAX -logfile ncvhdl.log -append_log"

  # Compile design files
  ncvhdl -work xbip_utils_v3_0_5 $opts_vhd \
    "$ref_dir/../../../ipstatic/xbip_utils_v3_0_5/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

  ncvhdl -work xbip_pipe_v3_0_1 $opts_vhd \
    "$ref_dir/../../../ipstatic/xbip_pipe_v3_0_1/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
    "$ref_dir/../../../ipstatic/xbip_pipe_v3_0_1/hdl/xbip_pipe_v3_0.vhd" \

  ncvhdl -work xbip_bram18k_v3_0_1 $opts_vhd \
    "$ref_dir/../../../ipstatic/xbip_bram18k_v3_0_1/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
    "$ref_dir/../../../ipstatic/xbip_bram18k_v3_0_1/hdl/xbip_bram18k_v3_0.vhd" \

  ncvhdl -work mult_gen_v12_0_10 $opts_vhd \
    "$ref_dir/../../../ipstatic/mult_gen_v12_0_10/hdl/mult_gen_v12_0_vh_rfs.vhd" \
    "$ref_dir/../../../ipstatic/mult_gen_v12_0_10/hdl/mult_gen_v12_0.vhd" \

  ncvhdl -work xil_defaultlib $opts_vhd \
    "$ref_dir/../../../../p_MIPS_CPU.srcs/sources_1/ip/m_multiplier/sim/m_multiplier.vhd" \


}

# RUN_STEP: <elaborate>
elaborate()
{
  opts="-64bit -relax -access +rwc -messages -logfile elaborate.log -timescale 1ps/1ps"
  libs="-libname secureip -libname xbip_utils_v3_0_5 -libname xbip_pipe_v3_0_1 -libname xbip_bram18k_v3_0_1 -libname mult_gen_v12_0_10 -libname xil_defaultlib"
  ncelab $opts xil_defaultlib.m_multiplier $libs
}

# RUN_STEP: <simulate>
simulate()
{
  opts="-64bit -logfile simulate.log"
  ncsim $opts xil_defaultlib.m_multiplier -input simulate.do
}
# Script usage
usage()
{
  msg="Usage: m_multiplier.sh [-help]\n\
Usage: m_multiplier.sh [-lib_map_path]\n\
Usage: m_multiplier.sh [-reset_run]\n\
Usage: m_multiplier.sh [-noclean_files]\n\n\
[-help] -- Print help information for this script\n\n\
[-lib_map_path <path>] -- Compiled simulation library directory path. The simulation library is compiled\n\
using the compile_simlib tcl command. Please see 'compile_simlib -help' for more information.\n\n\
[-reset_run] -- Recreate simulator setup files and library mappings for a clean run. The generated files\n\
from the previous run will be removed. If you don't want to remove the simulator generated files, use the\n\
-noclean_files switch.\n\n\
[-noclean_files] -- Reset previous run, but do not remove simulator generated files from the previous run.\n\n"
  echo -e $msg
  exit 1
}


# Launch script
run $1 $2
