// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (lin64) Build 1412921 Wed Nov 18 09:44:32 MST 2015
// Date        : Mon Sep 25 22:12:21 2017
// Host        : TR running 64-bit Manjaro Linux
// Command     : write_verilog -force -mode funcsim
//               /home/he/Xilinx/projects/MIPS_CPU/c_EX/c_EX.srcs/sources_1/ip/mult_adder/mult_adder_sim_netlist.v
// Design      : mult_adder
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_adder,c_addsub_v12_0_8,{}" *) (* core_generation_info = "mult_adder,c_addsub_v12_0_8,{x_ipProduct=Vivado 2015.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=c_addsub,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_XDEVICEFAMILY=artix7,C_IMPLEMENTATION=0,C_A_WIDTH=32,C_B_WIDTH=32,C_OUT_WIDTH=32,C_CE_OVERRIDES_SCLR=0,C_A_TYPE=1,C_B_TYPE=1,C_LATENCY=0,C_ADD_MODE=0,C_B_CONSTANT=1,C_B_VALUE=00000000000000000000000000000000,C_AINIT_VAL=0,C_SINIT_VAL=0,C_CE_OVERRIDES_BYPASS=1,C_BYPASS_LOW=0,C_SCLR_OVERRIDES_SSET=1,C_HAS_C_IN=1,C_HAS_C_OUT=0,C_BORROW_LOW=1,C_HAS_CE=0,C_HAS_BYPASS=0,C_HAS_SCLR=0,C_HAS_SSET=0,C_HAS_SINIT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "c_addsub_v12_0_8,Vivado 2015.4" *) 
(* NotValidForBitStream *)
module mult_adder
   (A,
    C_IN,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_in_intf DATA" *) input C_IN;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [31:0]S;

  wire [31:0]A;
  wire C_IN;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "1" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
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
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* DONT_TOUCH *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_adder_c_addsub_v12_0_8 U0
       (.A(A),
        .ADD(1'b1),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
(* C_A_WIDTH = "32" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "1" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "00000000000000000000000000000000" *) 
(* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "1" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "32" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_8" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult_adder_c_addsub_v12_0_8
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
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "1" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
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
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  mult_adder_c_addsub_v12_0_8_viv xst_addsub
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
bzs4DURiPU2cc5oHFZWpL9UtrwSjvm+0Vb1jeUojtaKrcWlJcnlLnuUycyWp3377kcBLzNYkLxhH
YRRkVpPM/yh9Ac3MiOEQE7xYortrsWAp02FZTGzFxwHdCryBUECb+Ro58V5x3nPUNWZcEiRZUKHU
O8xaVZKH7Efr/bCK8PG++AcLh28TAP2W7H/GqDUJnwvR7qdLlQPk9OUtVajERPO1gAky/efsoAkK
MJZ39CiJFbNgsp4xJc7E4XdLW3Hdy8tm/bn1tSKUm8Q9R3WTwtqY1lXoIeSs/WYuk6cBK3Teyek4
Z2Nc4U9A5joH4LifNIANKSZETBAEmhPElFNA8Q==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
N0dLYRRD2UsaYC3SlSZQfeWJ9658DR38GLtRhatwdailkuHrV1Fu6TxXLHsV1dbPVulkfE/XwILy
DWdL+Cv4jxNMEUzfUX3o4yRRPrBwi8XVVIcL8rPJ3nMyuuIVUnqs6cSFnuyoOP95K2/R2TnRHFek
nUpI9towAzGyLx6T0Y4daSFmCgoQt7S+wltcWZAiXQFl1YiLQh/3AdBoqHuv66filPsoKOLJMkpc
pljveDKzqDu5402CaEvk6M5PM/YOrA6/P61tuIBCMhIuuXSgZj6/89nR7dUVz+516hOsvQI/zf5q
g03QyWzELVfPDnZjdOEqsSDbAHMAuJDBl5LecA==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8736)
`pragma protect data_block
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
co5mwq2hR+ed17DQHYpv
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
