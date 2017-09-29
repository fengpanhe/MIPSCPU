// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Fri Sep 29 09:15:03 2017
// Host        : ThinkPad-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               E:/MIPS_CPU/p_MIPS_CPU/p_MIPS_CPU.srcs/sources_1/ip/Branch_adder/Branch_adder_sim_netlist.v
// Design      : Branch_adder
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Branch_adder,c_addsub_v12_0_8,{}" *) (* core_generation_info = "Branch_adder,c_addsub_v12_0_8,{x_ipProduct=Vivado 2015.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=c_addsub,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_XDEVICEFAMILY=artix7,C_IMPLEMENTATION=0,C_A_WIDTH=32,C_B_WIDTH=32,C_OUT_WIDTH=32,C_CE_OVERRIDES_SCLR=0,C_A_TYPE=0,C_B_TYPE=0,C_LATENCY=0,C_ADD_MODE=0,C_B_CONSTANT=0,C_B_VALUE=00000000000000000000000000000000,C_AINIT_VAL=0,C_SINIT_VAL=0,C_CE_OVERRIDES_BYPASS=1,C_BYPASS_LOW=0,C_SCLR_OVERRIDES_SSET=1,C_HAS_C_IN=0,C_HAS_C_OUT=0,C_BORROW_LOW=1,C_HAS_CE=0,C_HAS_BYPASS=0,C_HAS_SCLR=0,C_HAS_SSET=0,C_HAS_SINIT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "c_addsub_v12_0_8,Vivado 2015.4" *) 
(* NotValidForBitStream *)
module Branch_adder
   (A,
    B,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [31:0]S;

  wire [31:0]A;
  wire [31:0]B;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
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
  Branch_adder_c_addsub_v12_0_8 U0
       (.A(A),
        .ADD(1'b1),
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

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "32" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "00000000000000000000000000000000" *) 
(* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "32" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_8" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module Branch_adder_c_addsub_v12_0_8
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

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
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
  Branch_adder_c_addsub_v12_0_8_viv xst_addsub
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
JbFVGwkZkxQtc4Q7QRTO5Dd9WdgMYJpa+mOZ8MKJkeoG3HRb0UUYqJ2E0zcQ6e3pk+MFZfnZ4yXk
Cqj3QxJLlRFBhxnpO9S6hD4aj1geOhfrTpIXfxGDm7rLBNLP+s95NJGLlvzmxJkGMd5ERjxX7gly
FlyiS4c1NiUWnnPBngMHHN3oiXCaybkpfNKcOz/+YhlGYXM/2e6QzqiIlh7AsdT2sffaZ+VdpvJN
w7MOtC4Z0CjXLLPI6IpS1DAj2YaUVhiLDWe2C4TZGR3LQFHtWOG189H8ydhnrVAldqm9A/b3hFom
K7aEJCpa+D2rYYY9p7bxkJJQ9+7vml01RGEBIQ==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
uqu7UlYviFAqvLyG2LDppz4FvpFYKCJ7P9AH4reZHgIFwXahV9bAZbwQUdmKK1JkYWriid1aLl/u
xWR0xR/FyEWtg8xrdBn7zx10rar5Z4YIBGa7NApYZ+Yl01XQuVHYi6uVhFQysknwiM4Ov3cDhsId
ckNydn7mHZLFB1FgcDR8LazVL4jQEb7vPcsj9HH0VlPmrtUkpLf0kaBciUycohDI0O5XzIMiKonQ
k9Nf+is86XpX3Ga433I4mlmCDoxvXCVLgptougKJhaHyGKVbftRqjbUOqRnS6ALbFPnOi8xSTQN+
lBjkFhCi2m4v+M/UMpe+JlmFfUrDjy5s6DcVcg==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18592)
`pragma protect data_block
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
x0JXzC6jNPvB2w==
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
