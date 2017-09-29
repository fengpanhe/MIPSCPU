-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
-- Date        : Fri Sep 22 23:11:40 2017
-- Host        : ThinkPad-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/XilinxPro/m_EX/m_EX.srcs/sources_1/ip/mult_adder64bit/mult_adder64bit_stub.vhdl
-- Design      : mult_adder64bit
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mult_adder64bit is
  Port ( 
    A : in STD_LOGIC_VECTOR ( 63 downto 0 );
    C_IN : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );

end mult_adder64bit;

architecture stub of mult_adder64bit is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "A[63:0],C_IN,S[63:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "c_addsub_v12_0_8,Vivado 2015.4";
begin
end;
