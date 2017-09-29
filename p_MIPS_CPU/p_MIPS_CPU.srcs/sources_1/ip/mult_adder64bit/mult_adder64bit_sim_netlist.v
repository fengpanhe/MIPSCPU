// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Fri Sep 22 23:11:40 2017
// Host        : ThinkPad-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               e:/XilinxPro/m_EX/m_EX.srcs/sources_1/ip/mult_adder64bit/mult_adder64bit_sim_netlist.v
// Design      : mult_adder64bit
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_adder64bit,c_addsub_v12_0_8,{}" *) (* core_generation_info = "mult_adder64bit,c_addsub_v12_0_8,{x_ipProduct=Vivado 2015.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=c_addsub,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_XDEVICEFAMILY=artix7,C_IMPLEMENTATION=0,C_A_WIDTH=64,C_B_WIDTH=15,C_OUT_WIDTH=64,C_CE_OVERRIDES_SCLR=0,C_A_TYPE=1,C_B_TYPE=1,C_LATENCY=0,C_ADD_MODE=0,C_B_CONSTANT=1,C_B_VALUE=000000000000000,C_AINIT_VAL=0,C_SINIT_VAL=0,C_CE_OVERRIDES_BYPASS=1,C_BYPASS_LOW=0,C_SCLR_OVERRIDES_SSET=1,C_HAS_C_IN=1,C_HAS_C_OUT=0,C_BORROW_LOW=1,C_HAS_CE=0,C_HAS_BYPASS=0,C_HAS_SCLR=0,C_HAS_SSET=0,C_HAS_SINIT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "c_addsub_v12_0_8,Vivado 2015.4" *) 
(* NotValidForBitStream *)
module mult_adder64bit
   (A,
    C_IN,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [63:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_in_intf DATA" *) input C_IN;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [63:0]S;

  wire [63:0]A;
  wire C_IN;
  wire [63:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "64" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "1" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "000000000000000" *) 
  (* C_B_WIDTH = "15" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "1" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "64" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* DONT_TOUCH *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_adder64bit_c_addsub_v12_0_8 U0
       (.A(A),
        .ADD(1'b1),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(1'b0),
        .C_IN(C_IN),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "1" *) 
(* C_A_WIDTH = "64" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "1" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "000000000000000" *) 
(* C_B_WIDTH = "15" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "1" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "64" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_8" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_adder64bit_c_addsub_v12_0_8
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [63:0]A;
  input [14:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [63:0]S;

  wire [63:0]A;
  wire ADD;
  wire [14:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire C_IN;
  wire C_OUT;
  wire [63:0]S;
  wire SCLR;
  wire SINIT;
  wire SSET;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "64" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "1" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "000000000000000" *) 
  (* C_B_WIDTH = "15" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "1" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "64" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_adder64bit_c_addsub_v12_0_8_viv xst_addsub
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(BYPASS),
        .CE(CE),
        .CLK(CLK),
        .C_IN(C_IN),
        .C_OUT(C_OUT),
        .S(S),
        .SCLR(SCLR),
        .SINIT(SINIT),
        .SSET(SSET));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
IlQnRhZZlRHjM00OAmL1PUWxPCSeZfNoGVzfz4DUyExdIw/0afIFveYaji7uNvouy5aOvo41fQaZ
kmnkdwEZ7w==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
aVciHHZk72CDijo2ufRbbiVPQtAEhwLjGFp4SODGeG53ZIujyyC+lscHtlNahsk9+xu77hkIT9bz
Mm0UiViFl3Tapvx/xFhYNOug3ThQ82UgTdwDfmgE3dhz0Pr3Xhzv7arQOU4RkrkaXaZcAj6hEgqH
wBJa1E/WeD25SlrSF20=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
YksH+M/iPO7eqhridfcTVs3S4krIltBxV6DbqECMSH0N/b3JhVH6XMRA9gNLdVnHnT1YNCcuvMc2
8NKmASFpclxjd/Tt6mCJoA+HJwF5IwhvVzKKN1FoWyKxLlvMkl3GE54s98FbVhH5k36AIiXs+0Zm
dB1mqhCv6Bqf/JZsAThca7+Xfp6Vtv01vzjHDtXLrCzEGmG9zoOBshPBDVE4VZwMuIdWaUUwD1pe
/1cfyBcelPrc3Z6RjwfYDBBBWGytZu0EPuvvwfHGIhWetXAWBCCML5deDRn2onOJzgBo6JSt9FiP
uUEiqDDaODGC2YQ8aLfB0NhyypfR1Ka9Ef6GLQ==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
u6sdK8w1kK25hAjjqDJel0oKCmwzDkDr+mdvmXBZdevH8tH6ugtPJ3ueZ+iH6oQZDBIfzRyuYsHQ
sRnDGYqeQaqUI1j8b51zuIIdMDBJxE8Lr64bP9tRHedOB0HRM7X7CccgVoB77OmwY4ZoUIJX3xDC
OD+9mYjo/KjiQ5/Dzcc=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC15_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
d/a3CuYWKE3/Hr315P/lB0kL1BeLjQKyNc23fX/qvyyRKkoRzOFrmaFo7Kgse8pSS8ln9uMwizQG
yEaq4aqAe3GCNmEZJ2P3D3DT5Dyj8+TDGVBUd8u1lGY1qNkPCITfCaVkk7lwH5qqb5umocPS5e5K
IHezeDXYH+4Z1En4uas2fEXxxkDP4As4Md7Q32H2r8yBwlJ7sabvgiK1KQDe258lYPfvXyvdsdEa
nuAY/viz64MC5vZqhEOp4NQ0alUkV29M/cnPiOVK8g+8/C2+PZasE36b64acBs28v2PWmbGdhxSF
O9zZ33PqO8BJjPo0xVe22e3IVSQ57NN7Gt03Ng==


`pragma protect key_keyowner = "ATRENTA", key_keyname= "ATR-SG-2015-RSA-3", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
XpB5KIDvFh1P2GArWtFJdlkDhuk/QauK1kIXIceyhdbRwbHylTHhU+T4CCSm1VIY/SSAlGKbPiiA
UwsP82vAwVW8Us7nmr7etoqLcNhIz/06P8vXnnS/njasXEYN3aXNcGGOnoCMDtuWSorKBkt8C6ey
j6OhkV3DiDOz3regFMUwccNSITNBR1Y0vXo2arZdvlZzMFkTPOIvZPrTOYRgrAzYh8JjKjdl8BXF
HZUDH/gziQfhrH2lIjP+B04cjRUkX7Whbn1apoe3yHEvGmr+MxnStLvyBzJZSgZzod2Yj5R220X+
OLot4JNlDg+Q1uA17r785wHg48aDmyjmJ12pug==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
Ekot5JzVB/axKereGl/4LD+ctujJBrUgSj+ait0GCWQfm+cjtfnHbZF+Jqa65x4HJBPdwWwPa9xs
60DZb/QDRaHi0vHBykkpjQhh023/ZyAA1WTZCNWEcqirbv120vcWGq1TLTlIIlggA9fhVnbdrn9e
ouB8i3TUKpcQGFv/gG+x164mvOWriCvQ612dgRe3BgHgmzMPAP7q0/Eh23gMI4BH3/JoSKJzi6cZ
3YkYKhozIuTQQs1U5xOona6vI0z9so/BN6F+D43wybHsiU7x+opB3aFPJQlERGkYLBOsB4vwGU5z
vIS2MeaftpEuIvE01sRlVSJ4W4CHwDliGDk00A==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
RcwCd0DXeeskrfQG0YEtR4q4E4cneeQaEFCWVzrdOrp7sc7FXFFJ0pZOu1ZmE2mDj9bg5Araw4Br
e+1dcdR82s/YMv/TVlmNEebP6W8bHkPumOVV5vZ8mrtLlHIGBuuTO8OLD+8UFSMj3vWur7n8OhLC
bZ1tSHw9lK1t2A0V8teZtABSFi9grTYB+1/rxpe4byw2oq4jj/SNlj6UwOD20EW0Vru3Z6M7Q6N6
0jbx6OxIFf/DEnQjTtl6yBc/dS38mQ61THcWw8FFjnOsnB76VmXqx2JM3pPDIA+7y0F/bhFvUVds
B9Zp2S/yVJEn2xUj/oXfkyU3uH40eCRftzuXVg==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 15200)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
