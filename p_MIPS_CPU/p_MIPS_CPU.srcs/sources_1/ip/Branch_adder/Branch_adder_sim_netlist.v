// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4 (win64) Build 1412921 Wed Nov 18 09:43:45 MST 2015
// Date        : Sun Oct 15 20:03:43 2017
// Host        : DESKTOP-HAEL08M running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/Users/zyc99/Documents/GitHub/MIPSCPU/p_MIPS_CPU/p_MIPS_CPU.srcs/sources_1/ip/Branch_adder/Branch_adder_sim_netlist.v
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
alnz5ks148T+7Zz1wlA9fHOiRrW4cvmkn8m3tlS3kPXYSgp2ImVlwCDWxZlkU2TABnKYOeFn+gMN
nVZwCuLLqWlNxyMsM7XaiLA2sof/A/sxAVG5ScNsiUgdNOmWlU+HVjblUhxIXgZDrgjAz3QRdRbI
AUIvchfDS/CGIGYIu0g5HsYPHvWULCbc10f78OoJIk4jCAPIQaER+RoICBTKf35OwyRHefdXkKl9
12eN7QLby5ZDylGue16F+rXGdFbJc7kTEm3cJD8YJ/YFeNn6xxJVgNjriuPekaNvD1xSNXY+o23s
h6LQM4tv7YR8jWJ5crjfp6H90rDrHHcQ3T3/Dw==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
GFJHMoXoH5tWmAIBwyIVIhehDBRMo1PXjVJaJsKhwpA4oaqpDTgQGfzlXCBenJqRKjZheqxKlAmL
JVuR5j+Siwj0WePHUGb/QZrgyryYlJ4GFzZHFS6y3GWBX2lscP31BTwwlpOGPTSEbfU8RtWa9QFm
QO/YjdgTCQLhVuErTqH4cOBRiOigcca4LdI0n6wRXgmOqcKUbrclBwbYyTQQLIxxIgSGrqqL0MnG
9S7UI1pyUp0YnyGDVnhGJf8YkgcEVF1j34FNSHsy1yBYT8x5Q9zY3CJRdytxqPSBXlIY0gly/R5T
ggZys+boeOlraLnp5ni18ngnZae+0MSejKRXRw==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18592)
`pragma protect data_block
3LJ4RYVyQz8TwHZt2kEPvCVBk+d+qiFtkgVpQN4jQdkM/lQY5o30T7+2LBkhjKSS71mQCEDBmlxB
qlz8KrZLqmCG9wZRTtSOWsiAjOacEmXKONI/cyxW4Ub2ljYXwox5tJEBISXEv9Tg5Z82zgxu5h8Q
YL9Hakt1ahhXPg2BfJlENQMTka+YD4PbEN/oE6uqY5Mbdxzzl96u2tFkygjbjKQdufO9DByfTBHR
35ijCYjwNfEL2TTgzD3qzQ6tjy7oKqmOCHzdGZzD0ecqlQ9ejvZDCEHbRGcedSyi5SkxROtIJtQ2
OnoYDzvBmaGjFi7yyMPTYqrKtPPOCP5IdXYqITgxoAjAESuZgu66B5xbLPiHnWTSLTf5FT27uVwN
Bk0qtSJIia8mQAiRgm9exItS5+wl6ZQ3dAgei4cLmB7OFWb893PCSK9ZI9zklxCPamQRXxNYG+Kl
gZf7FkPCaVjR2ZcJv9pfBQvh+x7a/qzOap6BqJy3HoIDWIDNgxhnkCfjhhFJpU6Vz5JG8srQSNwA
x+liU1gs0Jf+WKN0DJzWc7CI8oW3boTpJiQ/wG6ko9/SaHEmnULQ1HnhUmKwXEF9l6iabRjlZ5R4
BZzxmf38cjFVFRhOuMYYYyY8PYeVZW3kXAC7K9WgfEvmtXLxyrMGYysWW8oYkgN86GJwixkKrvBa
pu+kEMLZWar5I611oGi9W+9h/WtthfbLDuoAkDYrbZN5jVEUD2lNoMTxi0nbZ1CvwgWZi4hTayLB
30IpSjdvWT+BkCfPKp/TsoeQxzE4EoeYOps8530Dp/T5q69Kg0HuINXkj8yU/n4B1XCttG2RFjW9
sldB9pdBInak4swU169nErXtsnJ5ex7F0kzocklbiaeEidrMNvdCxICehlJcDrdYEEMAyhdVp+BG
7YgVqQmUKeod6FNUIq+zIqPpug74X/5rHXY2veFLjce3hlNRjXhSnKBb+cTi63ppY+tAKHuCp3Os
piPL3vuKC72qRAnbwo5/HJRS53sBStqwHx42co+3ejXSsGT51ioSpJr4dtMXZMVbUGaIaMUjtQyO
x1XKtR7vCL8UV9IiuopUn3WKIIluCojG5CUg9Qz7nlI3sHlmslUiMo/gaJviNnKEKElSwQdTjFsB
CxZHAAFmr6EVtZW2c7goOpbeyZJkufSKdkYtK9bjlggayxp7yHiat1BRCDqCXb23Uf9cWQYYgVaP
ybo9s/2MnAQr+zlAQVg6skZCmwkW8QTPH0kiNmdGXd5ln2xbrurrnTfMUGiElwd0FM9jz4OHi3xc
BVgVRdntJZlIInW9gXgkP0VL4N73OmZid24ClaxYjznybljttE3FM7tvRvYgqpzsfCPYyLWdESAn
FGfyJhGy3ICiVALDY6/Pz84VBSoWTk4LpQQDi4ITCR4AkrOEB9SFT6BZsMq1XXUZ158QmUcQ/ndI
TaWFoGN+v/m7ZjfsxT0xkGYeEWkM2OWsNe0H0QmqW4HVmTelrntMAGr8LhqaysMbcqTGz/JO4FWB
onEN2q282lqaPwBGanKvkHJrtMdexYR6eWERMdIbSSgRJ+0t5hVBkdJOQpYUSeK1SBL7D9hAV4/F
GyzINbYCF2ruWTQxiEqadlVeEJNBz+rgmnNf4at3a71Ld4MA4MnGnVwUB4IEL7aPTWc2q1e6ue8t
c2qidSBIyOUYw08bij3psNMcU/uVqcnZu5kChEjiA0PfjFZIhJRBtVY0NdPQX/64lPjzqEjOY8UA
lxIzLnsXo8D8Ei2ODMdVtA+CFNlrqHo7+iQabLSAf1i7IupoNc6lkW8XuFJPGJ9ZAGL4Il5CG94n
b4ohFbIZgvbmNGnnov8RyJIDZf0VtemwfDmDOBgxAJAD6ZTr2itVvl6PbSxGAmVrEWO6qE1trcNV
DbouxQ+pnCpBbuadjuzL0+aKtkiRZldL13Jtiw6U1OKrtNxCAVo4CIV761iPXm1LpSf7uV+a8er9
v6TXd1cn78DuliWZ1aYQvUbSQQrkh7VtZ2p4Zng8SNZNE1QwRNE1FCCMsU8nUJamTp9m6WVhuxMD
QtJuet/eSJr/fg8rKo+V1V208tPOZ18+egn0QsEkj1mPzuAcwNgUJHfoCnQN+p8g80zXqZQ8coBP
jE5J7moQMzmqyueaAQa7q4m98h2g8O6utwwWzaqEHcGs21aec78nmGKwZkbYPkbQ+E+/UrMRdrVP
pREvx0osp7w12MPgTynAp5bwQe1wwJab+D3tLU/qSROvACG9ZryPogwQvOT4tgFhhgU8dLPuJ4DT
Bg2fL/MY2c7b0Afm0NDjM/u3XgYvKim/YMjG73eirJrPte+xjXlGIPf7b17QU1Y+Foc7DNEBpeBq
fId41x2V7pkG4CZXublfpV2ikh/BzOS9PVD2krX/3WwcOPS7vjCItMoNOcn5eyTVgvbg3NwN3S+K
WXB4TF3s+06YIWohrrH6ESdWsV/eIr0N3Q+zjlM5NHXI2XchGGQRhmiD1XNU6YJn96CBrHs9/DKR
B4++WLhVM8GhlaT8+FgSaIngL/WGvbrwvSDNMe0cgFJL4kzhUEEzvQmaJf98vaXz/+6VOD+bvK9F
sxTCc5PdEXPZKC3HJZQae2eZmF454vWG4S8EPQU3H37Hqo9L0r1qtLsEmnK78TddLQJ9KNMgkVMv
2z4m0IRYouREYWwE/PTGlYagnLn6Z65Z1a3OCryb32OmE6YZyI0q5ZTCAUaRfI9o/jvIZZzTaUXB
XQ886beLWBFcIPSN5lwOOhjM2Tk0WiNPJ6tdm1nxpxBo+d9nz6dN+ZVZUoqrL0rlUMdRBUUrB2SC
GR4tfDcvW+OPo2u2iT6NmpKeu6Hzzp0FHQBmIHdb6X4+GE/7p/MfE22Tf2IFcTyUpkB7UzDKLaSq
z+YGsRnAM7REhP0iDWTwx7ElvPBz9ncE69VCoZPSOL3EVDxLIiLvJdMESHpLKa1httOmLTcX9qpF
LNJmmPJlz+7eYK9idk41nHxx61negciBKdOreXT/K9/4R6dYcIKnyWMHGMPqg3vJv8FlTIl5g76t
t3sO+6slS7FSnwJtS29p2aBhoB1u+8tLs66OG9gMid1sZ716rANzb16mC1x5A+jB7BCjrjBp08nx
+ipBZW5BOWy/GccKNwU3oNupdWroaEQEGZz5DfNqlWYq5PMiHmJgzwgMlU+PvWtLn8Vge5sNPGvQ
JWkje0IEHyCF82P70s0S4kiaVMLDvlce7BV8qus1n/ZeVlwzO6GQpY5DugKHZgwgyG2YtbJl9ynv
7cE54EYheZ59XaEKMZrHY5XrUl3m92fhU1IDtGFji66CUvuvIGdwTK3k0zvBxTtokit7rkoNaUfM
GANpKqpNS/PbG3v6SkiBaiqBam/gpMV+2C7sMu+rJyN3BlGhQha33nLbKWf3ZeCD+Hx7/QZUrhFL
uMF71MZNt5w9WOogM+Xr1hWUDFrICNucGDgKis1C7IOgO76yVRKQJLebxyRywj6yE81AQU0fmhub
02ywjcoWEXt8SErBeY+I45CieVrB0EdlnZv95Kas2PVMex79/oBlUrVOIZC3o9UDEg33SUOd+gHl
PtL9PlwlWvLtYWGtBe5YpSm8sqtricAuM3TLo1NYqM9sit91QExt2/b2PS5w7foJyaLdt+a3FjRw
34tctQy/ObvG4JIKOvi3x66Jd9XN1zt5oH1tVv5ngIFYm3KGHeskr+e0KcCKHOe68svWdD5nrzPD
3t6IgNzjHWCS7OLAeiUR7aapvfC8EkA1lcF83/xkWdGIWH/EF4n0TKGRi6gcQyZyDoLYQMqLN8LZ
m8a/3DQ4xtCcPONXIEo+oSSOU8izRrQKww3c2AI5bEoWAhs9V0aQcRGb5pWpO2d4dyCy+Oj8K9iN
4Z+LtaucEJ/t9DUgzZc2+sipAJV/zfhmZSwnNFzksAG+08yp4INWNjS1jPWoTcbNBUFUuyJLruyJ
/Lj28uhuHSk06wRGG8CiG+RUP7ggZ4+mbIeGEBiuQS3UXKeDEFg+d+rEuuO4hxdZLDmT7aG48KsN
IoM/hWnqekdjc0MkDoQ948UjVKbpeY5WcoskE+F8CaC3DFZDz0/vEkxlMqyzoEIxlLFYZLkCWE/s
gBgkPsPYaGIzzdOrF2wo4Ch0RS9zY2/jR98bbj769oM0vF8x8t/kwB84YqrFZSjJSYtOAH+gWaBD
9nwxUNndudzQuLwfyrKdQFnP4e7DKMndby02BjpLz2CjaVp+hxDpemA92T8oZGf7OvN76yem2WiK
FKMwn1du8xfKZi7AkMbetKag/OcZg+eaLVmln3L6x5ARhz3qJjI1EjpLqGxDpZ9DTvckzmzRXErU
ZxHvoqyZRu0+lVGLQFeo+l18c1uCBTA75qhk5sljcwaZRFXBzVy39scQtaVurW+YPP2F39ovGkiX
IAtVPN1sfq0V94ZaKe+4ycuWCqa9fc5qpyvlLVwUKpniDGstEQH6YBFoobc8+g2zTo6h7WEVfBGv
BxdHtP2DKYNg6MUz4ahgJySbog8bHWBv4kRBNGcJBLpbGbqosA42nQJljHa//byChAHSQ5AulnC6
BTMKneHWeU9kbXjki4elNMuyAc9UKUmB3kFSVmiR4uVid44zknfsgn+1Op+QvVTB8bZYeWMxXusG
LY0r/Qda3hAwiiS4zKuQwiAKTHU2p+W1ecckAvIzRsdBuQmFIsOEU8IcfZlH+XjuQMwITcXE2x3d
7NAEDiW2m6kFg8HYbsc8WHO4PX4mLqeA+ULDGTID6ER44sEwU+I7Tb+G5zGhUccptluOYIeX6Z22
qAXkfS57K6MILHwXuOoPkXM94+sqt0Ho21ic7KWfXH7zmZ1wZlGVZR1XkbBgNlLDWwPHoueoKV5Q
4smku7hdTmo/sXnu0mzTcWJvHz6kMWDSU1aGG0aYKE4uUVe2d5hLQxQwNYpvsFbbt4T59lTh1pSo
KnUT83vgyy4478ziwaRZgADToBavCypsrJgVdLlBVldRrn+rI2gUm3hOoSTa0oCfWdtM0rJGj5m7
EppijEL7BAKbB2o6KgWgxTGmqqlvlUzxYKRqsGA/TDARxfEqXmDF7OWoQm03nCMlqvXHGLqV07iX
rOj61KMM+9XFdK+gMzgBeUrqHHnsLLPBXRZvmP3+SfBlPgo+tNOfPNRpC3oICyjUD8kpe5NaEuak
LrjlbALEzhuZSh6zjugs5GvfGUXkPS/mCOvfJpFCFU8BBMClNJFSUz6uNyFPktYbyTDIRvTT+eRv
3nAJrglay+BFbY1HTA+QF3i4n6yO3TeKmwi6F9vsUmmdGLYNWZw7ShLEc3dkX1Mkf0BCsL6sep4L
CnN0OgOPgTSqQMYGtwNXDqj/ROkJklXUqTXtmRDs+V9jV1pPkF17Go2qaIiQD4pUDCgsGjec4ia3
TCWVJE29eST++8ggZGqCA8s+vGlCs/2oMInDOn8oMs4+h4R7uzgfcDMEv0TEV8aE5sJkqGJ95qic
mhcB+/CXjsGPzJEmBhH0BJH/WNf6hKA9cNESBWsgbBwnDPmPAmJh36lDPmLy2sLPQCEzhdqmjtG+
6tYGPJi5qIjrEL55B8PSYxOkuf7h/aT63UTRCsOTIL5vKqS1CagYtzE6pEr+l/xXEOYrd31JtZFL
Qk/qSHhRNQkqOQX+gVHBYQXS6KJck91QIsnUMOCPJqu8dBn7RigzKIIA05TF7uA8WJ2B3quwuvcg
ETXIwMzCZ1cl2qrvH2Bx/0FIqkEna7g4MYpOXu10zSflBsWaj3Ki+CvgyXQl0TSmIUmUwAjijSUK
JNt+0IfOes6H9gTAI4Q3qxx0BfA5vA6uxPEWJfLcuHXVfBxeLg7CGszprMZeeYeHuftrXBcyMB2G
/C6lrNxS748FPwRCo8iaTezAz2gzc1SymES7djrU09Tg69vEoSekxPgl+PuI6NKV39vXwSlHYcuq
xW2ae1Mz7sz19RDVVY1+stHze3+RjZaRzqIBKY7OuA/oBlwEsTPSoSd00tGmto09qPx1qQmkfJcw
Wu3H3jh+mhSw7PlIcXh+P/VkXchqwKmcrwvv8Qa7nkwYjrWhr4TYEnuW5p2+wXRGjZg7VT00Q/co
+IxE8/kat+DZG1z+2XPp7uC6N/zUBeJxkMuiUM7LTT/Rhjng+0q6d3yigeXduGDV41cITU88uljh
DDMyvnmSbgUq+sVREZF22qgjwGhssI5R3es1QSvVDYoP47dPKmgMj7rF+yTAkg+15g0ezsLRH3mi
7tr640IE8oBYU9J/A2Flol0mCcyRHjrRrxHivrq6ujaIarR6bJ18RF5I3IX4K13Fr+1ebHuD1m0x
qW/Jw0B21DrY1IdVxzmCBwbe/ntvlIDzaA9Wtc2jGFnwgYR6GQG8Sv4hhtio7CXDRMbp6BHOhphJ
3ne88jI4t+ZemMV3mzGqL7SPkm+acUkljgGTJD/le/x5TMtk7BBfrCMhulxAxlaNA4oSrOobWXrH
Pyc4lj0V3NPKDNwdSpATlhZll++ZfAjgTOl3b25w0RK5CdP2e1QG/7zMpfbc8lWkkg3hIKG5oKr7
Chk+qu6eO+9yAcosldqGVfaNTXh+PsfEVc2hh52ZndoVE1Mj6dWGbc3UVjjuaWhuNM6uUCPzgVhO
0VVvQac06KjvoZ/wyhn6nKwKFa/jL831VRO/nnOehzKIEPRcqjrCYJXnay+SRi+Y4FosAEoaNrwd
FVGHMGX2bw09bvHnqyh2VumhJxi1l0ln6AxrcGnehS93OOaBdQUFUu4wKdn+WV3LDvdH4OH9GsZR
9o6y2dzv3Ka/oSPUN7aKvqZDhZsEbIecihnKeLrakFbuiGoDLjVeRp3+Ot0ReSU8I+myY4aBjxTJ
wK3zDxkkKORwV8BLQnLyPhp3gBJeSlfNQi9PepQgDvPTkMtUk1hFZyiLaPtjksId/vBP9ZJ7i8v3
Ve6MCjTWmt5Q1pPXNemnuwYzYekEClbF4x89pCBpcIUrl2fV5mts/O7gFfIYlzpSZ56PpEpszaUZ
X1yrIGQEUiBBPB5amdgcocidPTwtuzQZ0kuzSQFuDzrOxYNUxefFYOmRvNWX5oIq8yggdOs8lvUl
0r+fMWU8Gr6KOFlNtCmISxzDvqvN8v/Q2bTFZ40hlvvkKNE18o2RZ8RazgOVXtT++X8Wxk+94Yzp
doXTYB9vVsc9y1FRIUBvjjRdIrxRJg1LZb+q+ZrZ5/CDQflAxH1ACkZzNhvO5ODFBAl0oAp57P7q
LbYgzua7lTiutYksoPNgrENmTODqqUaTmqGjTvMwbsC/PwAb+uYAryNVcFFV+ng/0IaCWJ57G86c
SG/kcmBfPbl6XQ2lc/e+ClTxpDQHsik8bQGAjDs77alTNkaRmvZxstGoEUt3ZmOYH1jXWSsmokPW
41tFuBevGVdtCjqvnHhXY03Md/YO9e/cih7aOcZ6x4YEUfe94udS3L+HQ3KQnyLXKpo4EoJJCWLN
GiyxoYtYkq2OK8DyfdZMhL1IX5ZGTG7BIABu+24apNvBqHS5EMHURJXxnqOFIn1+Q8IScwegfB2Y
u3mDnOyglLrcfGr+dsmRPcIlTuLoWcyIA5JD36HHuOKJZ//tiFZt9EjrMsKCVRj2h4/z7XB3TEb0
io+uX9Frp5FL/oUFBF25uA4lvvKgeqebkubLaUo8Zi6oKDX4XYmU/w/PaovtGXttGD1PXKATK3Kg
RH13hBoTQNN10zrwKhmGopDurjWyl7nhPfoVRjdE11YfsmdDC2C+KB/xwmVOqi4XfFk1IYuhkaqV
kCgNAOGpf5zX9RunAUS1nr2Mkdk1kDa933O9rWDPPmSEwNp6X1dUlVxEyEl37CTxaZaRhhZxioda
Zc5mONkTn9I0qXwMog6hw/2bSPE9c7Wxc2VD1jI1zJr0/nqciv2a72FigzSqF4cW/GCJKOC22QMP
NMG6ZY15fbHG+abUC808btX9s7L1smDjCxmTd7MN8y7mK8giDFXneS/NXJK+EHeUzVEEa/8WlNNU
GMr/fg2PB1PRak2p2ynK0EHgNb0zdWX923q26AMl+z2Ybmg527mdMalMHFDr4zqA/ssRM+FS2Njg
nhd7+GioNV4DyglhCoiFWmnzeq7CQ+L9qdo9O8A59TaiuO660+fWough198oZCdwUoLBNN+wUx0d
UmVH0BoDyn8/M9e27pJB773um0HohPZwnXs/Wy8fBbgEYV/nrjHC6gTYzn/b9zpstPaLIlx5zT2F
aq3LBbO2yPoftxanj3NebEUxs/7GLZM6g1lbr/9NizJS3zqwIW0C8NxKncgoeptypdk4YvPmu/Sq
ZSozIJp6QIftD5DHL+0RwZgYkWoLsRv5YQT/sB8DPOb/hwoCe4/F3SW7PGvz4yKd8ZRMlh/lnXlp
KNGazoiGLizAhaDujvvHRWa9kVvG7Erf7N8qsrfa9JhE+pky+vaSMrN9SlMFIotFm8aqQgNxIlZO
K9tbAKyx8VrS+7nJtXqSEcLMzW07b42bECG2t9XHX4gDd++9ud88lFaYMb4UjbYnZSgpiPm1OAQw
emfTEs4w6cvzBdAPHn7onY/lh5erKB/KcYA93a+CN6STsWNvLEG+kfq/41cdVT1Cw4Z94NFPtB0D
JdwCmQJgvrb8fosvTDqjmGC6lhVERvZ2pOPkZ9ORPeeOcgJuOPpvZiQMVstTqFEsx1tPelkCw1V+
ru1WH5kEooCJ+azdlWw01aXHt/Bn2c9msCRbXb41+LgkO+geoERNJpmtifOzY92h/vxoh6z9JmDV
xLMrjq+EvGQ8hh0mjP9vbt9SgOQpMiKaz4+qx6RqnmsJDyKSCCwK7CyqkXpLsQvJ+1Hdze9SepFX
xgeghdrK3NHozf1i8JpASgvytAushDV6hMz+RUuu4DmS9ABRqcwlr07aF5wxlhiaIJDdSbHYnDhv
pPfGJrj+JeIR1B3om1VwoD8NvbgiddBeawXDqZzuyx+/QCH5AfRpYi6M5eT1SF1Hj3RvnPtjG4Fa
6Je+2zAvSpbDB0GGEIwlnEh33PTbDOdVil1XYgBOSY8/g9ldHuoQJxt08rbw4t6PPN6IB6DsM6kd
AfBDnIhwz2jOaAl8yfwbMmKt7QtOg+81BUYfmZV9rWG2wO++qsk0i84tvjPiHwZtjvhtGPl1Rg2E
Ed+o2pP92NHL/pcyuVTbEPVUxCWnTYkrVk7YZJJaGwTb3iVbYAYt7GsBosjpV0cmjGLL1mACyM8n
jwH39pgBgeJ6J2dxC5ilwwVymhsu+5ZRlP7NZdNjFjYxATx6FvTgCOSVLV4qije/c30m4tv5qItm
9Tm6zqek8npseyPAZQVVaVgRXLPhq3pBd3tpQjuKIU1TEz2Zu/oJG+9do84Hmk81kgdm29F7W0hQ
JwsQJz1Tozhtt+Ssqa4MpDn13T+bLhJ2MIUn8AVoFL9bpBtJz6RS1DbsDUfdQYT1ooPt3hy3agu1
PUGwMp6cPSH8ltp/b0B0kfkrGtuPsz2opWop/v1/dB4HS+4Drgpt51rkoq551KTNqolSFlMu1f69
ECowA3SzLhgQITUx6ouEczo1UpRXr9RmwEBY++tZAqpCDgnBZ6LdEHVI6/tAVmjgirB1IbBB8/w9
aMdHuOJ+xrhNer9oeSfwlGO05+N0xHO3E0GXqAiJYZ0GeMVHt/BGTLurAyVpxAz/yKz4NeWkvdsP
jkg539KfFlUf6e2U0Gc2JMYiJ5V26prfcFoeQJYJiBLykc0G5yOmg1F2+VyBtJft3Nna3fcjyWaS
YcVRR6TNdSwgUJlFyK4fbLzEM/zV8GsBGs3M2qacIZnM/B+5gal1ljG1YByY85vhRo7rFkBLId+x
lWS+y4WSmsLhRytJ0w73Nsd5qhlTCwQoPTUmzBuF9jI8ZbsRFTTUl/pEqZ3cI++AaqpVtvLMwyFd
I1aRDPWDUEwdjCjjJ1lw3Md5GVPPCcmP7xjH7ZDZPMbgSTEOXW0NVrxwEA9AgG//LAwlInwOWGb5
0D3+7G/hCm+3hDfyDU/ymzB1gXCJHM+SczL1895w2awLw1Htt0/gB/y+KOLAHvvMpDCDrsekHLhP
eJyXS/xYgOOOrezU3romZNyhbFhC7vzsszoktHhQyfx7J9mRg2y/59qPeAtv0TlnXmJQDtQvW9XA
TCA5pJ+Lvp8OMKeLrYtmCJI1sw+GMqfrAv9Jx1VWCz/Lp39EpgPRAtQpZHjFVcA1LWhHwP/sHSL4
F1MiTz+6s8iM/gbnzV6qFgxkzZtYp19+ulkcuO1qvwPXUbJjMsi8z4T5hPEiWcQtxX67RaSxVFUw
YlMc7C+DAZsjCHw+MR+qYb9tE7Hih0VW3yjoeVbvlEnnppdsm6/aNdc5QduKLg7xOi8yDeCyKCMD
8O9r1WtAgqOoxKLe2IP9uAeg97U+FA+y5Y3SUAXdzXixFOXwmvgkmsUUWRhUKm2LVwyHKYz2aHWO
+IJzzbCxntgPvXew7otrCnc/RZPIIQZN2b4fnvbeuV0PK4lZDylVs89DwNzkhmuAUlu5TDCKbKvV
/bfOxrSbejAXff13zXDuMCefoJTdqDhA+5lLjd9CcPzRLTKzc80WlRTrXoDAXDylc2OvWHsFkRoZ
9uVQ6zJWgx0fu+s6hLvTcCqd8QFwzTBwvgGLbPehlSwaamo60FNLGMTXa3e6bbKoVHaqMXWzDhbN
chPZIxkxNpoQa7x4sxXrq5Sj1eyVVfbNMJIjLbhdpaxSP+2JLyDRbuK9IvfiA6Wz7Sx9RW9MrYQ/
3+dfQNCcLpzbkZv/8gPYelW7S9GOPM37gg1/xQNarf5yEdbMviPVMrMY7O1GtGHxse993tCv+D13
YwVAK+ZYYqgSGF+hoVaHS3kdoFt+LPgLa/fznhEdkSZozRpWpUg5hIdrsdKMvvtwLCqfLfapD/tB
i5kfcKtSJdCcOVNZ3THqB6qGiyfegiPjUdIfPW3G2+aOBrQ8rfUekK6NG8h9q/OfGin7y8703yxG
I7faniV3MhA0avyDglSFTqER6do9/+y8YY0TCQoEgMW6u3HVCL9BI9peISSzbUll1kVJhIx0WW+q
QkpHiEtm8pz8jnRt8s8/pWs9u9Sf+f1sh8uyJ8aZ4ZOVpXRW05JHPUWyZiIFle2h0q+yJIJC2ZCW
uMf84ifkfJvx4X+jy4lG69McYWvvLw6T7vQ47coaic6pSAmQMCCpWoDiUfNVjmGzSLRVXVhfvJM9
VIULJseMWvhWqVkJNcKhIZ7sKtd5m6OpDQEbK+UHtuj+OIM6nmQfsFJgHZPTLeGaByX5kKE3+C89
/qjjDmT7kglRYmajwMOirhBWxPlbylCQVAATimdvCV0imLU/Rli4VYoT/Y6AL7abcP3ySJuLRarZ
THwKP1pED1FOm0gVP7BaiaQuOuOoRKsuAk46FYiT7S/o78zIGmLuakkMYIFZR3aFO2/jX0CKcrHH
A1U1RjqU7IZS2xNxFOcZxya+RdoupGcstPFypnjvksV20YY29mm5/JitGeCasyrsxouluywD9fBT
P5lqRELfjjycI51wOrpCQ3mYVn+4pjDByXFQiKcD4Ozm+Ecdi2TTArPW69VkMvZj4BxREmPVPFdW
YW1GTldZ78YGnTzXypOnQZG7hrQXEogF3DUiLOgVBBUumohkectghgIwIMBmbLzfOK1Q/q66Z+aM
/rnMNQAMmzjSLdDEWDUjaul+qdwyTg3oRRa2mUjNdvUroHV6QVdwd9tAYPFfIxYk/BqWcGalZrii
+ovY02rVJFeTAT7jeZcN3pyMLe34U7OHRSHy/773azdrdkCKJVdQY/TWRnGewtzPmKHczcU1W3Wd
NDt6g+YzVI1lZ3wpM0EGEtWT/ob8Wt6swV21QBnxonwi9oX2JUJ3KCjo6tamfLdnKQOTMsr/8ljZ
ZwwA6UyCGzLvDccDSB1ZqwZjuRZJZkQKifof/xbEB14kn1H0PCHSGURRU1UgsSAYS+Jd06SewaEe
yrgmyYdyacCofABo6+qzIK4Po0osM1I4gBafexRYWlRDNOK3O/D6aPTI5wjZW2W76kn7WukNj0Hs
s762lNRq0yaNJkwdF1v48O2w+tHLOIDGj93+MGtqWIMrr86jOvLYRd9900A+KkvuYzUyFbd0mYQl
S1lCSBEToK3Sw2/CoqoJg0PrVdVxl0ByrpqsQdG1r/ow6HorScnBM4RGbef/cjn7LO+ol3lqoBGo
eVcLjqXka8X8kceCIQiTkqbBrpgrghb+2q6fSFG0avCP+OjMev9bYL596D3HasMlK+WeHaCluSK9
osezToTj4bwBmCVwZPxbLDOKPqHm7x+fv/ltMCh68VaIGDFh5k4uogv3DhscY/nenotpw8tDtFGB
DlgNDyahbSS6nUPjSjYv8vhnbUF12igrvG+8b+P71D8/XszdUpb1/eKNVQHg6dekH2Iwn660pNKi
EyIuLjyGhBjH04bMKkVg0wRDswdDQ9SQ5BCZTA4OIQ83X1R31J7TMDHfKf4f1o7P+U8UMJKzkOIS
617ryzlDHn/J+V62IXdLMVgQqWTBQNYduQeNqOKErK6nU88CGXrpA5to1bx8uvLj2PCsgNb/Z8EV
Z+JMPRv7OZw8jMAbVmzmk+E1au5rrgHra+ulf5JPXW0X61vKEEehXmmILQq2I3EGy0kMTAUX2Gwq
xUH7pxqPhkpgWgjb2ctqUKs6oSD3qRpxxxxuuwQHdv27IeuLVyyTKOs3+drRctbL++q7EgVQNnUZ
/pIbfb6DNvw2glDY26G7XBunMSk607//Z1+EATYdCbZlg2gaFv8hkCDkfVIZU/JoI1M2wwohLeQk
kXFZRqs5KxOvcZyYfhcmrQowWS87RVQyzHiZhM1+DExR5NSoHdqkQd1Jym+MqQHn1GxZ00dTagvz
3S+K50hI3YMSkzOu20dNEztRsrq/dEASiwPD2Ic9NTSBwj5ykPRi11dB/1sIZwm3UMmzcwNjFbWr
ToXVQrnDLiwi0nHkCFG8E6lMKRP82pUMLpqB/02uSwiUQZtuNeQWalcAPKXhstcC4xaRBoDHN6og
gruHSJ0Uiel2Waoco49VHCoUYUdQAMvVPT5nj0wX2Gx3rvjDSqOE3wKoRj4nw+xeh3dciY3eMyWJ
l+VBC9NDOP5CqnlotPDw+sR4lEumBtlPnyW8pkvC7F+VZHFB5rrdq85V6qK4YEDOSxJ6TbTf0v8/
wPuHF7z68cgmDVXOt8AZiMyqPSiyl7ozt7zhbOljebZZVK3Dbft2LuaHtwn++QFdMwH7ewdpyPVb
323nor7nEgtKUC8/3ra2M559+bxPETX+1Zakmr1eI3nSaHgw/GltMhhkFN/5JWcFrZ3NybRMiqoV
dHNIy4cxoGXyT7Qy2xaYex8U3LuWLGAFZLSncj3bhy/UeJJ2D3m/HHtlLgmtrY782pxFEUc6r4Hf
aV5GI+Zu+p//PR/9d4cXM2bYvmTk31guzZahz6Vf7p5RfF6cz2HWItd7tV9OH67jLFRCWA2yDPox
MPMDCLpVETb+eGLGwUwLm/E/nyiIFjIwYvDVyh1VWlzRlSeQVX2z3qPBOGkS3EbWeTkFk6FENl+7
0uVkTA5cVTlZg0rAR+elIjTQXezfTeItgEcWy/fsrTolp/VnCv+LrMscPbcQHYw4PcpBZXVTkeiH
KcNImTND/SExdp5wZzTD60mIF4r5fOU5QCMQge0JaU4xoKKhuLP/taPY701cbcAEZOEddIvsKVpR
o0KPoKFI/QN/U6vJk4lcGu0p0+OufjADeM7p32pflYU1M4gy8ciLe+AOlitfLu3ta9HJjh3SmA7K
a823whrKPGDhCV4VWhyYp/Gq8iWunxpNy+2y3CPTwR1lLk+XAEppqKMaqyVWPu8V+zZjb6j1Qt3k
BFPBqQU3t03FXjm+ziQkUYTl7RjVvCBdSj23Oigj1kek4UqWGE3grJEjNuWEWndEZdzvmlN8G41v
dKyJaegoYjoiPaB03XvM9I7cd/qb+bjuLyRDr22h6dRv1odXXRXD7/shkCUDCfgvV4zQOJ2EYwRA
gUZw9FI/rchabu0ej29Yx+E28lgm+KhjeIrBVsMmpqaufqKCamZrrkseCmTH+2Dr0fXZfW0b6t+D
pWuYhqheZiIUaABiJmKUZpey0sGBbFYeuTOV0p7mYPMDhhGKo5iBYurpZ5DZ5Gdox0mLvYu3xDcf
trTYcO3X51mYeMOHknxBy6o7Mr8ADx8T/JVl4G/M7MlkBWhfOpYnYFxh6b4W+SiUA+84FtxMSy/L
N6YyWJGektAvUxM0EFykKt/1niCSh/wWmOIFdwv8epmMdRq7ksoGM1g42J9kWhAsk5iZW9gv4QPp
KVQC/s/yg3OolsWJvWJLrRbALUoPrtvaOJGAaVA0hdHQiTyaInMaUjwHd497ITsHt680tmLgz7T6
yPe09IPsvpKHn9/UG3Rnwgr96IYBwGq8aG0Ust7vmBmla7k5XpL4NlLTjym1niaGvqLhGnsFuAKI
w1t/REnD48Zj4kTvzTEE90viV+fe0c+nAq+wWlc5X0zuhw5TmgUQSOf32v2c/buGMdzDOV+LKDcj
niKu1trjQC6/ytZJigPRnUsQw1nHNMZ4axrJ1/5FN8apU6skVJbHQ6R9dmElvdlMZ12Z8LSO+DzM
5JTK3t+vb9B2tzqRErNOzDc8fw8/xr0EsBJhz4xk8CbIa6y/4IzCPCafwsGGfbXvbNCixJB6kZoF
GQWO4Tak14GZATym7GWO8dGGSE7MTxggmmB4gmExvq5dciGJ4xwq/2AAXp/ihEv8Wb6fBDAQtHzm
4lAC2f2+oyKaSbj3kuwH15Ifmz7tRDe0zWLVHk1WH1lG8Jad12H2n8fIyhjudW2tBplNGBk97JFo
2ZPfXqgztHPMPXc1cF/YIAsS+JLxSKdVViUPoqMOhf1ZAJqbCjQAs1eeUkVs5u1VkK1lHLqwwplp
BCcxcoktHoWKraTyK7UhPsToTgZHl1BPTRfJbXPtnIyJ+bOQaGdyLWYnMzd2YpoJ5JBYxMgjb2lU
GAoUS30s1Ha2UlTyYBlUnjF7iho0azMetVr5JkQ1nJssgi1zORUs19iDMNqLiCiHRmh3cKRq0CDB
jpap4521TZkmhGJXy3ZZqvSgWo3GJVap2QxMw2CVST2uoJ90XZE2zbATQdEfPAMj3OFkC8RO6rmA
oUuyHuee8h3X3fiWiqBiB3qXDSps4UYj3196Tq2X0K9Af3w2DIjga9epxXni6J0ViTDxv7xcRuT6
ooFe3VyM9YpTCXNWeAH6DUl0KjCcuJaIHVJ0HPtXiaOdbWmSW8fg36Z2f+dlZCaz6u4fJPM5DB1D
UfNCuzB7aS5BS28jVxs8tkALLCysxFbZZDRsOWzHsFCiERLbGU/A7Xq4ASvWhM1ez4ZIfFRY4MVj
IN6wz6TueiRBD+WlV6GicHgHy63iQ88lNfS/OQNYIFGziHvAh/ecCRfhiXU3FMnToziPFqcClAvL
a0ENiPwXqplg4q20FUTvGBw19QyEaYMqfc2dUhQioECAmXNrf+8VZdnat+QqdjQUFSCH3wReTPrM
eEY6WVLFyi+W+m6Cd/4vwa+LuapaukkYvjbFgpz/i1neJtq4t1Nti1yH9mvSuVxbuzeFvSdyGRAP
DlR4b0eEOp1WuA6P+fz1SnJxvoJeK58LvUVEn8Wj6P8CQJutJXmityO1Wpw3P7OeZLk16EcyMQt6
hbq6DFk122Ta8WblZWTpYug0uVvivea2EjYKyap1Xd9aZJAYpv0aJYKTxVcBphB+zFWyZvuyCOGw
MKYJxy2aH0q8kcZHZjZnYfhEbU1q6JGjxOqtLi5aQTtGuQH30XX7EMhFksaEN91p58DCVostjWMD
QRzu+ZEGq9jhUd7wJcjaxhsyHsgT7jNIS2xybjEB3I2jwvP/D5bBOyc2gThO3/4Ov8okS69DNVaY
jf0rRwckrWDs8Dt+jEEdy43910xXyveAp+v5+IhdCzgMiKOpN+Lat14B/nstXqe96NmyIRTFidNs
e9hcLOUWIeDHH1wKg7PBJstyb6znrYtA9LgFQBV4n+dlcfqJWDV+sJxNmUrV7bHS6waUgaP4LOPv
XKkoT7OhXwL7RKAQMoiyJjW0tfMsP7vKYtuVJxyIAXNXEMWLuBBSE+aQ9TolKVUxL/pPnl5+6Zbc
GU5oLo3gmuONxQGUwdyapW+8h6GlQ70i8dEy7ZqHX7pBb4DdF8XYkGLSfjcnGU2FSRuyYsiCcuf5
QiYct1dUKbDP3P4kGn7t6/rjtEbkVTw/u4bT5aO1w6hCJRVA47Psnv/hqU5gjXQxL07RgMkDNGxt
AhmWiFFRub50o7MFp981otsc4V/e/yWTDCRhTUhXb7R/3FjXbDP0x2vKlhJWJ3GM0JNwWVqStipe
0tPjUO5aCGbUtoIy5LH8VwJo31zpGkWfME8R1wcInJtBcEbDn2CxLHV6aUyytUDcaphmqNJ1Du6c
WecUUC5CytwnopSYm/yUR1wfEiZggm4RValCRkQye1QGfqEE8p/o3SfyHjo2aLrBsnc3szjFji34
YwQeyfN4vo21q76qZx1e3x6Ie4/dLXxEr0EO9hs4YBWJhNS4ybqyb24vCubrVFC0ztuflHPpb/qb
bT/wat01FRls7MMno1zp1ec219xu73K0teRgNAIOk4kwpp7b3FXAQwPyPtKl22q05Ya7H/lIHcSt
Bs4KBYJt2DtjetTg+P63H8Kn39SbqfAR41MP/0o/CRraDu/79kox5tmz1AuWe8apLpEYgxJ/W7ux
h9X69IVDtZPwF7CrjY/WKjlxAUWRJ7UzRLOMfcqL9LgBmTb86AHrmuj0xG+yNkfyVsbZicu5/m31
chyzrh9EB9PncAZXrhesSZUkKb4jcDa3R1FrRbg1GJr3eZRSo0bN7C0FAyNJNzSL8cCPWYcAJZhy
cQ+3A1Eba/fq/1epPJRDijMIKbj/2O/gvMzzfW+4WvEpaqRb2B+SKB+6en2FRiFg6ZozPG7+/GIO
vsD2r3HM2ZJ7KQ2BNDgsWa+KzqG/MgIlVuWMTXWpfqcZVC3sL9POy9b6e+pirfSx8gDuaZPcllEk
3d9+M/nSEUgLGAmcu0JGk0Nbsrh2Sq2TArVU4nV82NZ/DJY/RVoUhkB2+6HAO51qhnuTsNy1mVu2
4I5K3/xl/NWy5N8t30DY4Au7YT4XKT6aV1MY/hxCngVLl+O9+cIiaLHRrYIPiN/HvokF7v7ZAL3K
d21p+zetcFbRmG5Aop1dJ2smaL+hOJVTxw3Z1JkeiM48jY7ut6io75ju2YA4xuTFk9Ej5t0KBS4i
R/VZPbyUFilMdKuhVekQhHC8zs83r4tTEyZgHwkoMTuseVCBsb/HRZxeF1/vIQeFDXhk81fKf6Zp
tCq5p9PYB2PdPQe5qICXlTBEBw+PP8PbCM1Gq6egajFkDa9ksEGulthC2W3DNW5HlwR0MNj7Nh0T
tENG1U4Hfgs15gjhk4PGhAbMrQQ72MS1UfWWrPbeSOLVLq0ZTZK05MCl0U0jSrh8HUmSFAiQ5JS0
J74bHy1nzylDThOueeyTTZj4eXeML3H+B64VwqV8/PX3o30MI3OI+oVwxU1YLxNQ6AXAnu+RvXJV
78iU02mXGhWQAvCVHdqzCAyBkgbTpdm867JZNYaK1A7Lr3nxJpG5g2mEXXuKhiKSjBBpm7gzhEmU
KY+RvKtqlk3kVeN5hokRH7ZsVF3kSd7oT3ympknqKZ7qWMT2CEcGylA+tkZWMfLy6lnDqPRnUTrJ
uq6ne883T2CWw2QcqjtfS2zyftZCOn+jYuK0HidDRspDCnRKzU+LFlBUkQR9OSbd6NPF5V6qWxrF
2BWLhYT3C/uwwZqPrHzANyjgtKrG9TsT0kqdj3KXBP6nfajliw2B4s/d/wp5FM1jeQ5NtzI+lEZk
DEIiSR79GSlsABwwxTyjAFnGwNXOMQ24ZjBKqc0XNvfUkLE13IzGjxJmlKrRPc8mT8YPE6Y7Hu4Z
lAwALhHml/tmi86EjEK1FKkFmGfpY+WwbZB8WuDBUiUaJLC6dANcUoTdLkhKr4Nh/V36zNRhs4rG
zUr1aOwckgSIOOaiS1xEHR6Vfk4TaVw3seP0AUZs12HlhasFZk94w8BL/cLOrusBxv0pNuJR9vI+
He7D8HvBiyxbK15qiYUCtUPUtq4lYvyZYEo4UZbSSI03HHomWPfLrtX+wFTyOMM3fRRTi2dtZ6Lz
zNEa0YQrTqlWZ/SK7qJ7PrXL2Ilm/Bh88IPT8lPz7E8YNFO7o6tI8BvMRydUnXaEUExR6cM6rcdc
gjapyP9h358yGUmTAPI/b6O/STnEb+ab7XhLNESj2N+PNo8VqfV7suy3U9QwDB+rtjjgtmhYRr/L
GVQW/xOfXUvSmnmao0mvFx6pBrWggs0E/wOrchc4Fad/yeM67x/rJMitoJXvQFt3ZEiw677b5K8K
D2TByLUi8cI6Y45syhQY3jBLSNTbZdXvi4Fvhv5PT/DHrdyQOgZ2m+oQ7/QY79fWr7/PqZynnvVD
B5Axf509dYcgVdsi0eiOAn86Y34gc0iDJE/8RgUuBqFn5QfZdyE0UED9ODkpVo5aZap7ObVkIHkF
Y+pODTSzXYkc93lk+zmNmhDYM1QTzK+3q7/aUlbN/68fDD9TS0TojzjbTTy++VsHQeIRunFRBPTC
7P7lU9PUj0VmBCU1TcW0J+LcHOu2jf/IDPPjYZlOwF+MAtIinA2GOucOO4eYdwkFUTI2eWRnyGUN
A2Fkcn+jz/X7scxjUQHq/V4csxkMOhFTv7NmeTZbcxL58ZOw5NHgsy2Wree/2hzTK9OPs7xYwnl+
ESxcDpsgH0EzQN+OMhSPBFMCNmLdrfg5y2yGix9iSX56Lk9T4rPu7nDfJO0Mg+XYs2dvQdmR6syV
AwSXjbgMx0Il7XvAxW/KnkPHSDaij0PQR7A4u7+6lL14O91oGNzmMMba0g7NhX5nezIa2tzpwnXA
/lZfkb8MDmdKqGX1QmZ+NSONbe+yt0sLvSLjPkKddqK5992tedV3tffb5xmwBGKlr51KGqX7sMqe
x9Sovyr6DHGe6w0wbryLk1/VJCYScEs25OcvG6iZgF5p15PTFlc9Weezp8YSDrF+7Rn2HMMT9A8J
gZt6L4S+ksIiafMhCNV60UOTqNx0riksLoFriHa14G+hM6cMnELUKkoGBPECorSKZmhtjDLporam
dPdJF8mqdsek2TNggORIgibh2oUs8ftrWcJnDSZPQ5+iWJ8Zx5EYe+rQcMGglmU0hf6dpxICgnIW
L6iqIlDS2ub4syqX7nLiBeAyYzyRj9JhmU4JaVM8+TuF41km7VOqNg2K6AV6RuJ6mgzTTu/JGOCn
3TmZ7iWoYNkWHvlDerCqt9d2XXwg7U+Hd+ZJgIKugZ1Ae2kj1HFh6eQ7tlEigoE/iBZm1j3jL38+
10Xe2t6+JFCYm/iEURh6jRNPw1bYmBUgjZWeu0oZsPcRVYL5Fm7okQKSKI3x4GeyhoiUOkf1p7Db
aQ1iLOBvIE5V9GlZ+uuQkRej7zgweuCfNntK67ubQX+pQKfXuEIl0BlePrPl3IA9OJsX2kL9sUHQ
4n5s231Q3wyDMYoGZ44dxh7MayVvWaZ0CDMAfYn8Vc827aZReDDvZfZasLy4sOIn68inSN3aJ0PP
LA36sdh/vhse7UtdrQ/Sgpx4AAEL6iCJXveqFrw+QKlI/BjqK1LdmdELJj4aRX+J5CDL94bT8ghh
3dVbjDp9IuiN5aHls3Qjr9XX18Y5LE2AYqYLokpqvo3b4I1nAy+tNuZRwj4ncD9vH/zG/GP9vxgQ
MPkcyVx4xaowv7DHpC7TaKw1+4dB2j19o2DAq6dg8r4cdlsLtAnjTypBZxAjXouLjWl4WA5LDJbD
LO0cek3JZzDnaNXeWk9uQhhabwUDCifMs6ZM8dE/0eEDIodUfP1qXaopsyfsCp6gmJDIA38XN48R
sDfyCpnlkkNEZYhqYuMBXvPOsXvEq+mUlBv64sVJqp2PzjYUWpjz95UpfnQ5Lh51LDUks9WaXBwc
2LxW1Rg/nx7//IuUZOmaNfHt9v0yem4U9lMKUin3mEY9pEuRdz/v+ZKBG2pW+RxFfoEUFD6N3oSP
1aaegIqSGp+p69e9Bv8ylJ08dOkmXe7UXQhOxaToo80GGEqGOvzJqLNsrlRv7nIi27sdzm34GMt6
bh+28FP8b+p0Lm8P/R2J2IUe30AO578fvLKXGMjle0K7RlS9wGBlkD/pVt9cAowP7w7ULgvahW1v
wk18SRXidvECmoeeVQ+NWGJmpq61VD8RljcKiMRUn+tu9bHhBPjTGEY9tpfA63QEzFxTbJQUgFIL
d2ahw5zm0OOlC7wPhHGlIR4Z7uWC6cN8G3RAo7lv6ojwq3Mi5CmFbJGATVT/rToyJa1dpBBpthN1
KPZtADonp/RR3IbmxLEbwt+L3d625btNdv0ErvTr3QudjxkNe5yc+NAHA82gi+JcLG+eoP9D88JE
aTCrQ1UcPsMIFjCK9gg4uySmitaHT5D2LW653JubV7Z2gHU4QgAacDiyQJq+koM5CPEi7OsrgAvT
qql3CG2J9wpDGMFCG0leH+LwyBgmfhQ/SvqkSuLEbQqSS+/F9v5nhKeftCyOX4DebVjRy9ha8yko
7W69IhgPdcV2dax0sMT9nmYeabPDJmjMAgKwbL+usLTDPvdv/3OqpJRxet5YZZlz0FXUKYAKEGTt
cIBSGdXL8zHf2MG4Nk+ZrMGF9GljPoQS+W/Q1RVkV0LU1XugffI7vKJ2M8zXFG6kPY6jib4p9ONF
3VyZiDI/7Gepifc8Qd9+GOTDu0HRdwWBJA8PNcIHtVdkjSx7jDtB7TJck2RnwKDr+Ebak3LyVAbg
DaLvwXKdAT9A+GMSwrPV7HOrs6rjkbb7dFq3eK91+YV2x2rd/V/tPNATzqXJ+yLgKLlqQO9Tf0hU
ncDVeZ+XW+3UUcqKddQctFJPU6rtlt6ROAxtrNhblMDGm+XM2P9DPNMV2iP6hodIXByYgADkrpnH
6iyc3CJQiMGsUggZZBxQ96TlSi7YY6LTgN0GAedulzGkDYeQQnPw3Vo645o8Y7ZcuP+jz6tf6i17
zygptr+FOlnOcgiQD1O4dRt8GH2zyX1tnAuIPGxnFHgv/Pm2gIc/RYjUTdm4aspD0GCuFm+Y+PfS
9DOEgH8nCLx05kYIsvmpzYK1j+pWM0JeW2BUHyhA1bB4vx35qm1lfnBn4yxxjYgmKC4fOseme9IQ
OqoYKlpmKPRkGas+krXrbGy+vWlVVw2toVee/zM4Z9uNyj7Zv/T5D45q2kNH1hVzBjrRY5MLF0O5
7Ar90NVOHcM42ZhmIKqa6Z10/wsSxnXq/J3QLcMebbUmMHTl4LO3UDgV3mCxLI7qNBUKOCAu1MgF
W0OwErlcgursVVe7Hx8rHPTEFhSs8JJ56FCi0jfHaB29y6qi8EU2eZIekh5527eoAz2G9QwwwjYE
o2hwX2mouF+0apGWxTNRDM/t4/JeTe5ywdZJy53pYFsn7uJI/ajxUDYEf72TnAkSRKg51dPQCdR0
mHqLNWBb4xvxEg6BELlPCFeg6tQi1tkWmkWWCQhJEAjkWKHNyEDuhFttTz26hWET6KYettq0dLYi
cdy4g4gHz1g/6gG0cP2iUWfkXjMuWnTgbF0Rf1nw/zUgnPnNAxYuPPT+F1TpFuOfOyw3lkItpxDM
sb605s2wmDCBFRgk8UizLBsDM1MFM8H+c/7ZfC1wqIs8ZeRSLD+vsOv5XwyHJQXyJklIAdmS/xS3
XLQ1xHWbNXGS6DuhVkWIuSfR9Dh4DrJl6sj3cOkTu9Y8UGSAfgyu5gOWAixhmZKJzwMeuj1aUeoR
0w/4K5RT66GIYNusePzXfVzo+Nyd38rOd+21tq0zYgMhEs7fxanUny2eK9GnjVLa6S48k6yjqM8x
68TE2lwujYmrGJsTuaqSsyEaky5vQV4Ynj89tosEGqLEKomjzb6hpc4Mt4ti0CrxLLF9jhCrytye
R1fGWwB0kjcKepvNoqt4FNveUAjfWD/FjX6bQ6Xwj5+7uQzqL7Z0OMspJBldf277OHH5vek9g4+5
5VtVtNBDS+KW01RpkxGGC7Iioi1PM2SJzeXcvFnS19ds7IB2eBzpabl1e6CYM/c21IxuJ9BgNy5g
rn17mW/Ux/BV2t8q74eTRnjXvdsfepFDhncNG8R+Rl6bmhf0VcoVZbopFqg4/Wrdnvf2S5ZUiSTg
iBhwKzOUeCf7R5iVHrXLJ1Vx2UUVLvJHlSexcQTokc/sI5UGIaHjcfKtrgqf/BGAVAmVdArNCgYJ
tDyuTVSM8N78Lz9nexZ+PzvWObx/L65O42j/9tcWS7m4ldZiWtVVvxKCdwGXe6by80X/e5oZswp2
eILAE0i7GDZhjWOzF/3cPwN38qYNciHqSti3X0BZRZOne8fH/grDGyadLonrQpcfangaGn+tha9B
OYdhwYuvVb4dOMGudN7QauySSxZuRWcorqIaxIPWkfG6lUsyBCcjdOpeaRCZKYW8Y5o0P9xuFD6I
/gstqxTebnCFdkKfCY6a1QYcbT/Ic656MgP4Di9Zqg4I4pJqYPhlfxE8SoaoBZ1UjWfJisRoAxMe
Cq3/QycePydxJut37hxrFC/3mbEgXKVhsuxEKWiB18KJ4Z7tGG5gFIC5g4YJBHApczgfM+rxTr2C
3QVlTk5u/zSPBOWU/QyGjMjakOrfWe30w1sz8aufmf2rphlY+B1KYtexZXoEByvQ862IbKy4tetf
v/hnDX1kt5qBOcgA9BBx1aWLQvq/0Qti035jIB/4HRvwKEK882mBuFHUOS1S/jsKtwkywCtxexwc
ocaxyRSo7R2yr/ch9KFgP7ESRVw+XevCTzDXS6qEUE9Et5xydgbFEkyvG9W5m5WYgtBM16pbKqDJ
CUY7Us7HnKuq3LgaaVkdXbE6eyQiQbiFnzddNhuotRG5TpSMWSHZyIvdrUxXn9hor8u10IkK75cs
kibZX5k6xCj6r59PR+wxfrZmXKXbxirigFxqMfGYhBEUIFi7eq9hR3tUNLxR4p4xB557f0Ynv8xw
l5wvRroJSGkoAwLq/W+FhkJHXOeKNstK0GSlUWYJF2idIhifvn/LDLWqOm9T6Q4gpDcSRa4/aazC
oZqhmNNHpd1k3LRF1aqggeN89wSODXdpzXgExhlUi1LhULAVQ5O96rb1OlIhzI0mtO2FYL9Ye5EN
uPH4uuEw8QDnMkKI7fAVNZzWPH9SdO+3YKYIEOksLrzeoG2HoFbCg9sn1dxyFMOE1fkMtjs0g759
InWP6NjIytRvO0zSrGkuMzatQaESN4ZZJg+ew5IrU5cfi0sTZFcy2wjgKLP2XmF+avU8H6Bucpb2
+6psZfoo0Sds/BOEmU+eXAlahhXVTq22d1e53iknfKeUkhm4P/F9mP4ix453J8jwXoMcOHXr5IOR
FvISjw1H3irz1hDrXcwS2VaYNyK6lNXsAaZAZQVI8emNhRtWPQxORJoEuyiQdy7aNRBTPve5dZ61
MRTpMdL1LRKdLS/pPH/RkmZ1H/suX43r0lkxy/DrNsc0r0JD7I9ckeUVKvgA+Iw2EtebqWlhu+la
DtNDnlbGeCCAxQbpxcnRlEjpKHdaYuWI4jP0CacKbsLTwa5PE+OjLkNGV4rT26SmHVIczYZMZtY0
tyss70pCTlyPAhELIDMKM1LredRfFxFDIyI4BIgO7aEp/OhYF6Y61guSuEHX48YuQx//rk3o5CjA
WnShniuZRa54qNMkBjXhi2y7i0mRYQlq2Ojl/3FJ8VBXS2m2RnSuvvo1N6FylWXpkNhpCXQG3c/D
uH+wj39GM/jab7bC2gXof4tvlJoTTddNjmCqXCJuSKlone/OvK7zgntNs7jR5aoPqv0xwdVaJFHZ
65kbGNDRllHGnIokfQsUNhNV1Bv31myzLmihH4MKD9WAYnkPPtun6BesVgFhUB34Hbwgy68K+p4y
/dEr+tMfMqbxUncrLyHdvvh8ij+M0VOBUr3xt+8FPndU9ztpCSctjEban6SVS258Ey4sI/EQdSUw
eUWd55geZhURXG76hVcCkdEkmq9gGelO8k3L0j51d9ssDxv+WpVaFVUjMRfb1tSxMfFh1g1FMwzH
suVFtegXGUGcrKd4tAvTtqeSMjI0Guu9OVskmjqGSq6WCBXODJa07NSZawRHd7SF+aYruJMDRHit
er0q7EwT6BRmr6nUArl/aBf6PLmv+p9si1oKFVYa5i6e4w4CIf6DjNRkgovjqxJUcxkNVbdtxbsz
ZbUnej6wOzcZlUeS6rmWQ9IUcqbQHktM0g57CM1XTUKkAAhjX1aEdIQSER8CavZbqFihKPG2fitZ
bGss9SaTBVTAqrNLQUrEC8lUW2HWc/Sm4R58plaZBd/uJm2tlbpSJjpY/DobP7br5v1rsXxhMSe+
DFj5sobwgU94hnqO1g/21JY/dv7fwa3YtTu6/czKSQ9CqNESpod9Wma+Gma8LDkQpuhGHW3/73wF
iBtxvxf9Ej0mrf9W2NhsBCJEnwXI99Iu8+4p8foStvVE8g35vzIFYoA9xW37w5X9DzSrcg0RpYOR
I2sm9/Z2Rt6t414DcHs+p3I82+vXTG2nSGC+g7phbiRIQmAB7sVdf4W+u75ElrAOZDyg7bFQ7WLr
5mMBFkRBg0pUFKm6oJ0dERz6GJxJm07wghxuuzbMUKpUVS7VFoTYV1BInPYmAht/X5MQ24mz4orJ
Z0LoUd5VWmXh4F7DIu0+fmvqZi2XxtB+GQkh5aB/3ODdCWMkTyhekYvb5dIGaFmbmF/1JiqjeVdJ
04hTB6QsINblfQ==
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
