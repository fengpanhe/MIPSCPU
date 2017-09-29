// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Fri Sep 22 19:31:15 2017
// Host        : ThinkPad-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               E:/XilinxPro/m_EX/m_EX.srcs/sources_1/ip/m_addsuber/m_addsuber_sim_netlist.v
// Design      : m_addsuber
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "m_addsuber,c_addsub_v12_0_8,{}" *) (* core_generation_info = "m_addsuber,c_addsub_v12_0_8,{x_ipProduct=Vivado 2015.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=c_addsub,x_ipVersion=12.0,x_ipCoreRevision=8,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_XDEVICEFAMILY=artix7,C_IMPLEMENTATION=0,C_A_WIDTH=32,C_B_WIDTH=32,C_OUT_WIDTH=32,C_CE_OVERRIDES_SCLR=0,C_A_TYPE=1,C_B_TYPE=1,C_LATENCY=0,C_ADD_MODE=0,C_B_CONSTANT=0,C_B_VALUE=00000000000000000000000000000000,C_AINIT_VAL=0,C_SINIT_VAL=0,C_CE_OVERRIDES_BYPASS=1,C_BYPASS_LOW=0,C_SCLR_OVERRIDES_SSET=1,C_HAS_C_IN=1,C_HAS_C_OUT=1,C_BORROW_LOW=1,C_HAS_CE=0,C_HAS_BYPASS=0,C_HAS_SCLR=0,C_HAS_SSET=0,C_HAS_SINIT=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "c_addsub_v12_0_8,Vivado 2015.4" *) 
(* NotValidForBitStream *)
module m_addsuber
   (A,
    B,
    C_IN,
    C_OUT,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_in_intf DATA" *) input C_IN;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_out_intf DATA" *) output C_OUT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [31:0]S;

  wire [31:0]A;
  wire [31:0]B;
  wire C_IN;
  wire C_OUT;
  wire [31:0]S;

  (* C_ADD_MODE = "0" *) 
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
  (* C_HAS_C_IN = "1" *) 
  (* C_HAS_C_OUT = "1" *) 
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
  m_addsuber_c_addsub_v12_0_8 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(1'b0),
        .C_IN(C_IN),
        .C_OUT(C_OUT),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "1" *) 
(* C_A_WIDTH = "32" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "00000000000000000000000000000000" *) 
(* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "1" *) 
(* C_HAS_C_OUT = "1" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "32" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_8" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module m_addsuber_c_addsub_v12_0_8
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
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "1" *) 
  (* C_HAS_C_OUT = "1" *) 
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
  m_addsuber_c_addsub_v12_0_8_viv xst_addsub
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
iReui0OA+quIdE+4jFfC1zdZzEZsEmG1K8ywFj/6UqOcjyEbB114r+8KjZStN+GXk5SuacRdLDWh
nEcWwEsB2MqYnWierhN2U/TgiHAFU+iM3OHmpiF+W/WLThjKzVGFOVtHbtdh0SDM7/aoS343Rm3s
y/p0aBVVcLsxKNypDeISBqGEvCTgGFOnvkyYLTTXwzQDhZIfXOF0pnbhdVFZowtlCtDg/ToCEWhd
9d4Lj7tSGGyN32w8PZw5+6nNURaDmJzldnK88jK/wC4zuQqVzhZU9hZS/VDKHLsM5va2+3AS5YY/
HT/92o1+KtBguhqxB3ftUFlQA64oEbXaLNPdWA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
bleIqOXlWVCIK8kw6IJRF6d/4BCdtkfuoW8EIuqigwsH6+l5kN2YjFUfpzK/RMpZKWWM0Agxv7/1
4V39SnXe55MZkWfTr1/Ft7GpgMKXHo67qeq2YSgJtbO1YW3uJTWWiS3F+K277TR+TU1FtV29vLee
xRb2FCScJ1UkwnqvDfVwL0W+m/Ah7G36K6dJzjsoyPld3Fvq/4AQngCtT8PpoTuqr+femuJr/LuF
kpte1W1GZZcAOHGAh6EZguGzw7eyjY4twiCunGuySxpGyW9Fu3rgLaz1jesO/xSZVLWzr3MoE9Uf
SqkYwJY0DVoyz9IrtZmJs65IYnXgsmRaLNUQcw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18672)
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
