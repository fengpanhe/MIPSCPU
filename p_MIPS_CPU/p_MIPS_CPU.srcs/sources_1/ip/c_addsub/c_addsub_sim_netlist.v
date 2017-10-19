// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Sun Oct 15 19:47:03 2017
// Host        : DESKTOP-HAEL08M running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/zyc99/Documents/GitHub/MIPSCPU/p_MIPS_CPU/p_MIPS_CPU.srcs/sources_1/ip/c_addsub/c_addsub_sim_netlist.v
// Design      : c_addsub
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub,c_addsub_v12_0_8,{}" *) (* core_generation_info = "c_addsub,c_addsub_v12_0_8,{x_ipProduct=Vivado 2015.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=c_addsub,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_XDEVICEFAMILY=artix7,C_IMPLEMENTATION=0,C_A_WIDTH=32,C_B_WIDTH=32,C_OUT_WIDTH=32,C_CE_OVERRIDES_SCLR=0,C_A_TYPE=1,C_B_TYPE=1,C_LATENCY=0,C_ADD_MODE=2,C_B_CONSTANT=0,C_B_VALUE=00000000000000000000000000000000,C_AINIT_VAL=0,C_SINIT_VAL=0,C_CE_OVERRIDES_BYPASS=1,C_BYPASS_LOW=0,C_SCLR_OVERRIDES_SSET=1,C_HAS_C_IN=0,C_HAS_C_OUT=0,C_BORROW_LOW=1,C_HAS_CE=0,C_HAS_BYPASS=0,C_HAS_SCLR=0,C_HAS_SSET=0,C_HAS_SINIT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "c_addsub_v12_0_8,Vivado 2015.4" *) 
(* NotValidForBitStream *)
module c_addsub
   (A,
    B,
    ADD,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 add_intf DATA" *) input ADD;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [31:0]S;

  wire [31:0]A;
  wire ADD;
  wire [31:0]B;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "2" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* DONT_TOUCH *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_addsub_c_addsub_v12_0_8 U0
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "2" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "1" *) 
(* C_A_WIDTH = "32" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "00000000000000000000000000000000" *) 
(* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "32" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_8" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module c_addsub_c_addsub_v12_0_8
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
  input [31:0]A;
  input [31:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [31:0]S;

  wire [31:0]A;
  wire ADD;
  wire [31:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire C_IN;
  wire C_OUT;
  wire [31:0]S;
  wire SCLR;
  wire SINIT;
  wire SSET;

  (* C_ADD_MODE = "2" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_addsub_c_addsub_v12_0_8_viv xst_addsub
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
WlT4iuPysUH+4Ww9urKahy73GVwl+SkhgOV/qXoG+R24RAj7x89wtlWOeQmpuo0WUWKisU+GLSgc
hdQxxb5z+Fn+W40UoOAN3LFpiOvsn+oTSJNvEaCLVcu7vHM3fsImVblZWUxsGHFuuL9sjiPCTpdN
E1oOWKjF3xFeG3S2RP1Ykp6RH0kKzgyIHdnuIM2Y/TPkIiBvnuZdlmdVv/SXExjmG8JrpO0HfURv
4J13wFIkDEerKBA5lZCBfgQXCovRvdS/5b8wK0xMiuqIxg5U0VybeoSbB83+psufm2xp8PvvW3ev
F+jJMlTNC1jq6lig+fepWBLq4Fx3u6AueeDsMw==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
lXZzOedgf3oFkvP8gzlmqifMzy3P/IiIRxpHURS2nvVnGOrsk9Q2mZPUEAbfO7KgC4LhutMauoYo
xm8WmC13hlShsWgagwT52sKwpEU5VIDmX5EINQyr4pE5Fb/Ev0h30L1a1z/MXvyJmjAXT95MvTso
7ILCW65eezyikPi1DHTkzASurm+BL5FPTCTxtmXrLtkgtUfd5vKvVV5ZBEomkAlUbSSu7ZIU6Ak3
iM2KWKVPmTiSJzLEM7hl13clxft2N6OfYI8yIcr8MYmyzr1oegxrNfM+dstr49Z2WtonMX/cM9BO
aB0wvvckC5tk4ikJEpGb+9THT/L3sEJiDS1I9g==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19552)
`pragma protect data_block
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
Og==
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
