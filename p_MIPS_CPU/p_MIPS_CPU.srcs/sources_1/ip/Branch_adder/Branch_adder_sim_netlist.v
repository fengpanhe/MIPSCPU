// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Thu Oct 12 22:29:15 2017
// Host        : ThinkPad-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/ThinkPad/Documents/GitHub/MIPSCPU/p_MIPS_CPU/p_MIPS_CPU.srcs/sources_1/ip/Branch_adder/Branch_adder_sim_netlist.v
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
LN403tUbuLBCIMp9T3vIduiLsxo+lEq9GMyTjXyz+5z3H4AD4LQlC/W5+Zz8t7eyUESh/9QFhWRT
oD53QaeHESh5GZz6xl0KbJnXJItMTRnEsgTCXa61wbl5Wf7DyMPdCwFIMpdmhLVpTot16eFMJC8c
ZXRZlFvudLHduk+kRskx3Ekb8Bwm2rukWTvrOUy78usJ65TR1zzhMAK/7+wc1xqYpUvICyyDENli
mTFz/n/6PS4SugzLKsOWN5Ci7KWNIYI4qclFOA8nNxq5VJzal5EQFqMS+1dht6EEDRnb2X9vcR7Q
5BTDUfxqtXt+agE+f75XylbG78WcXB0k/YeawA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
C2gyOaOqk/nn3apCF0CDajZ9PWvkLW/GeKHh7Fc3Q5oWeaKrwBlD7fFLfGNYqD/9s0kYNiTH66pM
XnQLSUhgq4E42lP9+zwt2eRvp5tapclz4WJ0unTiYolI9IOuonKDMlwHfzvCOBnOAz9dcDFt81gF
+j14UwQ7cUsnGF7uiT8Z8DeFAOEsAct5U08N44KPxwfFp7Cl64RNJV0mf0tOASSmctKo/dLproTi
BxqhNtkgOTipFmWUQCauc3NZBvCKL5Rzu2O2jVEC7hnvKDwOMqOO91dn34Ly7cVSSIKwqWYnG7jl
WOpbb5YSrpDiiuRJtz6oelVPY+AzH64foYBZDg==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18592)
`pragma protect data_block
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
Vb56q+uKHDbkWg==
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
