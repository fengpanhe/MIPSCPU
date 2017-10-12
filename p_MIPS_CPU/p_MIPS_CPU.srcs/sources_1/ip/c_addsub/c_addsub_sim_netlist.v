// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Thu Oct 12 22:29:15 2017
// Host        : ThinkPad-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/ThinkPad/Documents/GitHub/MIPSCPU/p_MIPS_CPU/p_MIPS_CPU.srcs/sources_1/ip/c_addsub/c_addsub_sim_netlist.v
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
EQ5Dv9LnX5XkQG57kG6AsUcSsq2q5S70BkGl5K2NBbCYQaeYKNyJGpFkwC/ahWB2WYLVH4r2aZJL
OJz4iNkBgMRIOYzBJ0WcPk+4omIPwH6j5KrQku3kUQC279NWWhDXJmmlC+PMG6JNm1jrocSDMR0W
Y4pUW3Gv+PLS8mCM8GbuaVI2uj+W7bWD0kNWVw8ToBpvrfIrOjyk7b0v9zWLVK0GeIi7C9LAp1uA
ul8HDM7yV+M7a+xX2uZyLgtCGq1NALGRytoijf4Z8BTYcnblWzpg93IniKMaNOG42w6Yp3QR7/re
mscqdSHZ5eX194uz/yOC40Hg/NbFYXEKJbBRaA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
szBEoBVjem7/gvkE4ew00bfAOj3eyGNEfGpP9m6dRE6qbTWK+dtstC8bpO93ZLhrORQfeho19iXi
cydtW5FJ5kdAiB3/UGa7UuSimBtv7CIfr1rJvLjmkjCHHeBh5SyAy7ASSx/1I0L7dHsguIWvOLbn
gxQTN1ThvY6on2ZCfLz+67mqZp8853GGFxe5dj7B4jGvmi3t2dznwB9jFRzUpgwqxre9/T1AleV0
S/K3E17OW35FjJ11foFhFiJEz8kxsx7Ze+aj4Gjc1M9dQqDMOfEG1hlHUWAfMI2cAS9PBWOnKE31
iLAJuyrckunvcwOjqBWeqACdEj/PdylmZHoD0g==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19552)
`pragma protect data_block
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
KQ==
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
