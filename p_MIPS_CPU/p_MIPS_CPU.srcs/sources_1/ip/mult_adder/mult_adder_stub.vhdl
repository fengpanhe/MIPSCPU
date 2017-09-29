-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
-- Date        : Mon Sep 25 22:12:21 2017
-- Host        : TR running 64-bit Manjaro Linux
-- Command     : write_vhdl -force -mode synth_stub
--               /home/he/Xilinx/projects/MIPS_CPU/c_EX/c_EX.srcs/sources_1/ip/mult_adder/mult_adder_stub.vhdl
-- Design      : mult_adder
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mult_adder is
  Port ( 
    A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    C_IN : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end mult_adder;

architecture stub of mult_adder is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "A[31:0],C_IN,S[31:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "c_addsub_v12_0_8,Vivado 2015.4";
begin
end;
