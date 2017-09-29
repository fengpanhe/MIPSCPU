// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Tue Sep 26 15:01:43 2017
// Host        : ThinkPad-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               E:/MIPS_CPU/p_MIPS_CPU/p_MIPS_CPU.srcs/sources_1/ip/c_addsub/c_addsub_sim_netlist.v
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
a7KWndzq5Y96JWqKY7WpHRtnJkpdBZxw061IvdPo40gy55KwkC+l9Q3zipt7mR7md/cjZ4bG+QDt
eiIDODJyNtLLlT5ITFF3ox5ClUWhbeRfWnc+5Blw17v2m4/0WfbLQR4pDzbyhh0+QUP3VO9sW5d9
PdXGTXvd5vdR/b05Vp3CTjUz9luX2eYDTDxeSQU3/KXrH6lxcwjAZW/DYxfVhIab8tao4n/hqmi+
b+sY38CR3f2wJBgaUOHkK9j7hoAiur93yaSWodctCJcIoS077KFC0SUW0LdhCwzkGnii4KeaTU1y
WF8lhBnFN4Nj5Wm3CDIl1z/RMkY8Ik6Q4SkIqA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
Ax1nSH42fDfOhPmcKs7r7Ffnod9+kO9HExW6K1i9eDj+nj/EXuvzo2E9elt3kI/cPPuP+DUVdoue
JG4deRyzZEzJrfycSyD36/I7bdJTj9oG9Tmc3YAXEMhCtJTpzGZqB0GL7y2/8Lym4taZa3VVjv9B
qfwCvvW9P8caJvbEQ/eQ61PysyAzgc0YQT0cvf3sH5UvjnuRcdEAPtufETpXRUyClOHZn5KCDjTn
6YskObhU6lrjzxmBN7EylZtmLDDmb7hK4IWvg7SebFM3hwxUaTA+cN0JOp49/sCW8lxwUwNhylAc
461fL6iSTndTJBzfEsDgB9JbIkI89qQ8rO/TQg==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19552)
`pragma protect data_block
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
xg==
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
