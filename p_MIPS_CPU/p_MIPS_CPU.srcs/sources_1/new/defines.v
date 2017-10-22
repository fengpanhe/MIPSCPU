`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2017 02:34:42 PM
// Design Name: 
// Module Name: defines
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define clk_div 32'h00000004
//  7A120=500000
`define key_delay_count 32'h0000C350            //32'h000061A8
`define disp_clk_div 32'h00001388          
//******************************************************************************
//                             椤圭洰鐨勫叏閮ㄥ畯瀹氫箟
//******************************************************************************

//***************************   鍏ㄥ眬鐨勫畯瀹氫箟   **********************************
`define RstEnable 1'b1              //澶嶄綅淇″彿鏈夋晥
`define RstDisable 1'b0             //澶嶄綅淇″彿鏃犳晥
`define ZeroWord 32'h0000_0000      //32浣嶇殑鏁板??0
`define WriteEnable 1'b1            //浣胯兘鍐?
`define WriteDisable 1'b0           //绂佹鍐?
`define ReadEnable 1'b1             //浣胯兘璇?
`define ReadDisable 1'b0            //绂佹璇?
`define AluOpBus 7:0                //璇戠爜闃舵鐨勮緭鍑篴luop_o鐨勫搴?
`define AluSelBus 2:0               //璇戠爜闃舵鐨勮緭鍑篴lusel_o鐨勫搴?
`define True_v  1'b1                //閫昏緫鈥滅湡鈥?
`define False_v 1'b0                //閫昏緫鈥滃亣鈥?
`define ChipEnable  1'b1            //鑺墖浣胯兘
`define ChipDisable 1'b0            //鑺墖绂佹


//***************************  涓庡叿浣撴寚浠ゆ湁鍏崇殑瀹忓畾涔?  ***************************
//閫昏緫鎿嶄綔鎸囦护SPECIAL绫荤殑鍔熻兘鐮?
`define EXE_AND 6'b100100           //and鎸囦护鍔熻兘鐮?
`define EXE_OR 6'b100101            //or鎸囦护鍔熻兘鐮?
`define EXE_XOR 6'b100110           //xor鎸囦护鍔熻兘鐮?
`define EXE_NOR 6'b100111           //nor鎸囦护鍔熻兘鐮?
//閫昏緫鎿嶄綔鎸囦护鍏朵粬鎸囦护鐮?
`define EXE_ANDI 6'b001100          //andi鎸囦护鐮?
`define EXE_ORI 6'b001101           //ori鎸囦护鐮?
`define EXE_XORI 6'b001110          //xori鎸囦护鐮?
`define EXE_LUI 6'b001111           //lui鎸囦护鐮?

//绉讳綅鎿嶄綔鎸囦护鍔熻兘鐮?
`define EXE_SLL 6'b000000           //sll鎸囦护鍔熻兘鐮?
`define EXE_SLLV 6'b000100          //sllv鎸囦护鍔熻兘鐮?
`define EXE_SRL 6'b000010           //srl鎸囦护鍔熻兘鐮?
`define EXE_SRLV 6'b000110          //srlv鎸囦护鍔熻兘鐮?
`define EXE_SRA 6'b000011           //sra鎸囦护鍔熻兘鐮?
`define EXE_SRAV 6'b000111          //srav鎸囦护鍔熻兘鐮?

//绉诲姩鎿嶄綔鎸囦护鍔熻兘鐮?
`define EXE_MOVZ 6'b001010          //movz鎸囦护鍔熻兘鐮?
`define EXE_MOVN 6'b001011          //movn鎸囦护鍔熻兘鐮?
`define EXE_MFHI 6'b010000          //mfhi鎸囦护鍔熻兘鐮?
`define EXE_MTHI 6'b010001          //mthi鎸囦护鍔熻兘鐮?
`define EXE_MFLO 6'b010010          //mflo鎸囦护鍔熻兘鐮?
`define EXE_MTLO 6'b010011          //mtlo鎸囦护鍔熻兘鐮?

//绠楁湳鎿嶄綔鎸囦护
`define EXE_SLT 6'b101010           //slt鎸囦护鍔熻兘鐮?
`define EXE_SLTU 6'b101011          //sltu鎸囦护鍔熻兘鐮?
`define EXE_SLTI 6'b001010          //slti鎸囦护鐮?
`define EXE_SLTIU 6'b001011         //sltiu鎸囦护鐮?
`define EXE_ADD 6'b100000           //add鎸囦护鍔熻兘鐮?
`define EXE_ADDU 6'b100001          //addu鎸囦护鍔熻兘鐮?
`define EXE_SUB 6'b100010           //sub鎸囦护鍔熻兘鐮?
`define EXE_SUBU 6'b100011          //subu鎸囦护鍔熻兘鐮?
`define EXE_ADDI 6'b001000          //addi鎸囦护鐮?
`define EXE_ADDIU 6'b001001         //addiu鎸囦护鐮?
`define EXE_CLZ 6'b100000           //clz鎸囦护鍔熻兘鐮?
`define EXE_CLO 6'b100001           //clo鎸囦护鍔熻兘鐮?

`define EXE_MULT 6'b011000          //mult鎸囦护鍔熻兘鐮?
`define EXE_MULTU 6'b011001         //multu鎸囦护鍔熻兘鐮?
`define EXE_MUL 6'b000010           //mul鎸囦护鍔熻兘鐮?

`define EXE_MADD 6'b000000          //madd鎸囦护鍔熻兘鐮?
`define EXE_MADDU 6'b000001         //maddu鎸囦护鍔熻兘鐮?
`define EXE_MSUB 6'b000100          //msub鎸囦护鍔熻兘鐮?
`define EXE_MSUBU 6'b000101         //msubu鎸囦护鍔熻兘鐮?

`define EXE_DIV 6'b011010           //div鎸囦护鍔熻兘鐮?
`define EXE_DIVU 6'b011011          //divu鎸囦护鍔熻兘鐮?

//鍒嗘敮璺宠浆鎸囦护
`define EXE_J 6'b000010             //j鎸囦护鐮?
`define EXE_JAL 6'b000011           //jal鎸囦护鐮?
`define EXE_JALR 6'b001001          //jalr鍔熻兘鐮?
`define EXE_JR 6'b001000            //jr鍔熻兘鐮?
`define EXE_BEQ 6'b000100           //beq鎸囦护鐮?
`define EXE_BGEZ 5'b00001           //bgez鍔熻兘鐮?2
`define EXE_BGEZAL 5'b10001         //bgezal鍔熻兘鐮?2
`define EXE_BGTZ 6'b000111          //bgtz鎸囦护鐮?
`define EXE_BLEZ 6'b000110          //blez鎸囦护鐮?
`define EXE_BLTZ 5'b00000           //bltz鍔熻兘鐮?2
`define EXE_BLTZAL 5'b10000         //bltzal鍔熻兘鐮?2
`define EXE_BNE 6'b000101           //bne鎸囦护鐮?

//鍔犺浇瀛樺偍鎸囦护
`define EXE_LB 6'b100000            //lb鎸囦护鐮?
`define EXE_LBU 6'b100100           //lbu鎸囦护鐮?
`define EXE_LH 6'b100001            //lh鎸囦护鐮?
`define EXE_LHU 6'b100101           //Lhu鎸囦护鐮?
`define EXE_LW 6'b100011            //lw鎸囦护鐮?
`define EXE_LWL 6'b100010           //lwl鎸囦护鐮?
`define EXE_LWR 6'b100110           //lwr鎸囦护鐮?
`define EXE_SB 6'b101000            //sb鎸囦护鐮?
`define EXE_SH 6'b101001            //sh鎸囦护鐮?
`define EXE_SW 6'b101011            //sw鎸囦护鐮?
`define EXE_SWL 6'b101010           //swl鎸囦护鐮?
`define EXE_SWR 6'b101110           //swr鎸囦护鐮?
`define EXE_LL 6'b110000            //ll鎸囦护鐮?
`define EXE_SC 6'b111000            //sc鎸囦护鐮?

//寮傚父鐩稿叧鎸囦护
//涓嶅寘鍚珛鍗虫暟鐨勮嚜闄锋寚浠?(鎸囦护鐮佷负SPECIAL绫伙紝鏍规嵁鍔熻兘鐮佸尯鍒?)
`define EXE_TEQ 6'b110100
`define EXE_TGE 6'b110000
`define EXE_TGEU 6'b110001
`define EXE_TLT 6'b110010
`define EXE_TLTU 6'b110011
`define EXE_TNE 6'b110110
//鍚珛鍗虫暟鐨勮嚜闄锋寚浠?(鎸囦护鐮佷负REGIMM绫伙紝鏍规嵁20锝?16bit鍖哄垎)
`define EXE_TEQI 5'b01100
`define EXE_TGEI 5'b01000
`define EXE_TGEIU 5'b01001
`define EXE_TLTI 5'b01010
`define EXE_TLTIU 5'b01011
`define EXE_TNEI 5'b01110

`define EXE_SYSCALL 6'b001100
`define EXE_ERET 32'b010000_1_0000_0000_0000_0000_000_011000

//绌烘寚浠?
`define EXE_NOP 6'b000000           //绌烘寚浠ゅ姛鑳界爜
`define SSNOP 32'h0000_0040         //SSNOP鎸囦护

//鍏朵粬鐗规畩鎸囦护
`define EXE_SYNC 6'b001111          //sync鎸囦护鍔熻兘鐮?
`define EXE_PREF 6'b110011          //pref鎸囦护鐮?

`define EXE_SPECIAL_INST 6'b000000  //SPECIAL绫绘寚浠ょ殑鎸囦护鐮?
`define EXE_SPECIAL2_INST 6'b011100 //SPECIAL2绫绘寚浠ょ殑鎸囦护鐮?
`define EXE_REGIMM_INST 6'b000001   //REGIMM绫昏浆绉绘寚浠?

//*********************AluOp锛氭寚浠よ鎵ц鐨勮繍绠楀瓙绫诲瀷锛圛D杈撳嚭鍒癊X锛?*****************
//閫昏緫鎿嶄綔鎸囦护
`define EXE_AND_OP 8'b0010_0100
`define EXE_OR_OP 8'b0010_0101
`define EXE_XOR_OP 8'b0010_0110
`define EXE_NOR_OP 8'b0010_0111
`define EXE_ANDI_OP 8'b0101_1001
`define EXE_ORI_OP 8'b0101_1010
`define EXE_XORI_OP 8'b0101_1011
`define EXE_LUI_OP 8'b0101_1100

//绉讳綅鎿嶄綔鎸囦护
`define EXE_SLL_OP 8'b0111_1100
`define EXE_SLLV_OP 8'b0000_0100
`define EXE_SRL_OP 8'b0000_0010
`define EXE_SRLV_OP 8'b0000_0110
`define EXE_SRA_OP 8'b0000_0011
`define EXE_SRAV_OP 8'b0000_0111

//绉诲姩鎿嶄綔鎸囦护
`define EXE_MOVZ_OP 8'b0000_1010
`define EXE_MOVN_OP 8'b0000_1011
`define EXE_MFHI_OP 8'b0001_0000
`define EXE_MTHI_OP 8'b0001_0001
`define EXE_MFLO_OP 8'b0001_0010
`define EXE_MTLO_OP 8'b0001_0011

//绠楁湳鎿嶄綔鎸囦护
`define EXE_SLT_OP 8'b0010_1010
`define EXE_SLTU_OP 8'b0010_1011
`define EXE_SLTI_OP 8'b0101_0111
`define EXE_SLTIU_OP 8'b0101_1000
`define EXE_ADD_OP 8'b0010_0000
`define EXE_ADDU_OP 8'b0010_0001
`define EXE_SUB_OP 8'b0010_0010
`define EXE_SUBU_OP 8'b0010_0011
`define EXE_ADDI_OP 8'b0101_0101
`define EXE_ADDIU_OP 8'b0101_0110
`define EXE_CLZ_OP 8'b1011_0000
`define EXE_CLO_OP 8'b1011_0001

`define EXE_MULT_OP 8'b0001_1000
`define EXE_MULTU_OP 8'b0001_1001
`define EXE_MUL_OP 8'b1010_1001

`define EXE_MADD_OP 8'b1010_0110
`define EXE_MADDU_OP 8'b1010_1000
`define EXE_MSUB_OP 8'b1010_1010
`define EXE_MSUBU_OP 8'b1010_1011

`define EXE_DIV_OP 8'b0001_1010
`define EXE_DIVU_OP 8'b0001_1011

//鍒嗘敮璺宠浆鎸囦护
`define EXE_J_OP 8'b0100_1111
`define EXE_JAL_OP 8'b0101_0000
`define EXE_JALR_OP 8'b0000_1001
`define EXE_JR_OP 8'b0000_1000
`define EXE_BEQ_OP 8'b0101_0001
`define EXE_BGEZ_OP 8'b0100_0001
`define EXE_BGEZAL_OP 8'b0100_1011
`define EXE_BGTZ_OP 8'b0101_0100
`define EXE_BLEZ_OP 8'b0101_0011
`define EXE_BLTZ_OP 8'b0100_0000
`define EXE_BLTZAL_OP 8'b0100_1010
`define EXE_BNE_OP 8'b0101_0010

//鍔犺浇瀛樺偍鎸囦护
`define EXE_LB_OP 8'b1110_0000
`define EXE_LBU_OP 8'b1110_0100
`define EXE_LH_OP 8'b1110_0001
`define EXE_LHU_OP 8'b1110_0101
`define EXE_LW_OP 8'b1110_0011
`define EXE_LWL_OP 8'b1110_0010
`define EXE_LWR_OP 8'b1110_0110
`define EXE_SB_OP 8'b1110_1000
`define EXE_SH_OP 8'b1110_1001
`define EXE_SW_OP 8'b1110_1011
`define EXE_SWL_OP 8'b1110_1010
`define EXE_SWR_OP 8'b1110_1110
`define EXE_LL_OP 8'b1111_0000
`define EXE_SC_OP 8'b1111_1000

//鍗忓鐞嗗櫒璁块棶鎸囦护
`define EXE_MFC0_OP 8'b0101_1101
`define EXE_MTC0_OP 8'b0110_0000

//寮傚父鐩稿叧鎸囦护
`define EXE_TEQ_OP 8'b0011_0100
`define EXE_TGE_OP 8'b0011_0000
`define EXE_TGEU_OP 8'b0011_0001
`define EXE_TLT_OP 8'b0011_0010
`define EXE_TLTU_OP 8'b0011_0011
`define EXE_TNE_OP 8'b0011_0110

`define EXE_TEQI_OP 8'b0100_1000
`define EXE_TGEI_OP 8'b0100_0100
`define EXE_TGEIU_OP 8'b0100_0101
`define EXE_TLTI_OP 8'b0100_0110
`define EXE_TLTIU_OP 8'b0100_0111
`define EXE_TNEI_OP 8'b0100_1001

`define EXE_SYSCALL_OP 8'b0000_1100
`define EXE_ERET_OP 8'b0110_1011

//鍏朵粬鐗规畩鎸囦护
`define EXE_NOP_OP 8'b0000_0000

`define EXE_PREF_OP 8'b1111_0011
`define EXE_SYNC_OP 8'b0000_1111


//*****************AluSel锛氭寚浠よ鎵ц鐨勮繍绠楃被鍨嬶紙ID杈撳嚭鍒癊X锛?**********************
`define EXE_RES_LOGIC 3'b001
`define EXE_RES_SHIFT 3'b010
`define EXE_RES_MOVE 3'b011
`define EXE_RES_ARITHMETIC 3'b100
`define EXE_RES_MUL 3'b101
`define EXE_RES_JUMP_BRANCH 3'b110
`define EXE_RES_LOAD_STORE 3'b111

`define EXE_RES_NOP 3'b000              //鎸囦护鎵ц鍚庢病鏈夐渶瑕佸啓鍏ラ?氱敤瀵勫瓨鍣ㄧ殑缁撴灉


//*************************  涓庢寚浠ゅ瓨鍌ㄥ櫒ROM鏈夊叧鐨勫畯瀹氫箟  ************************
`define InstAddrBus 31:0            //ROM鐨勫湴鍧?鎬荤嚎瀹藉害
`define InstBus 31:0                //ROM鐨勬暟鎹?荤嚎瀹藉害
`define InstMemNum 32768            //ROM鐨勫疄闄呭ぇ灏忎负128KB(32*1024鏉?32浣?(4瀛楄妭)鎸囦护)
`define InstRealAddrBus 17          //ROM瀹為檯浣跨敤鐨勫湴鍧?绾垮搴?


//********************  涓庨?氱敤瀵勫瓨鍣ㄥ爢Regfile鏈夊叧鐨勫畯瀹氫箟  ***********************
`define RegAddrBus 4:0              //Regfile妯″潡鐨勫湴鍧?绾垮搴?
`define RegBus 31:0                 //Regfile妯″潡鐨勬暟鎹嚎瀹藉害
`define RegWidth 32                 //閫氱敤瀵勫瓨鍣ㄧ殑瀹藉害
`define DoubleRegWidth 64           //涓ゅ?嶇殑閫氱敤瀵勫瓨鍣ㄧ殑瀹藉害
`define DoubleRegBus 63:0           //涓ゅ?嶇殑閫氱敤瀵勫瓨鍣ㄧ殑鏁版嵁绾垮搴?
`define RegNum 32                   //閫氱敤瀵勫瓨鍣ㄧ殑鏁伴噺
`define RegNumLog2 5                //瀵诲潃閫氱敤瀵勫瓨鍣ㄤ娇鐢ㄧ殑鍦板潃浣嶆暟
`define NOPRegAddr 5'b00000         //$0瀵勫瓨鍣ㄥ湴鍧?


//*******************  涓庢祦姘寸嚎鏆傚仠鏈哄埗妯″潡ctrl鏈夊叧鐨勫畯瀹氫箟  **********************
`define Stop 1'b1                   //娴佹按绾挎殏鍋?
`define NoStop 1'b0                 //娴佹按绾跨户缁?


//************************   涓庨櫎娉曟ā鍧楃浉鍏崇殑瀹忓畾涔?    ***************************
`define DivFree 2'b00
`define DivByZero 2'b01
`define DivOn 2'b10
`define DivEnd 2'b11
`define DivResultReady 1'b1
`define DivResultNotReady 1'b0
`define DivStart 1'b1
`define DivStop 1'b0


//**************************    杞Щ鎸囦护鐩稿叧瀹忓畾涔?   *****************************
`define Branch 1'b1                 //杞Щ
`define NotBranch 1'b0              //涓嶈浆绉?
`define InDelaySlot 1'b1            //鍦ㄥ欢杩熸Ы涓?
`define NotInDelaySlot 1'b0         //涓嶅湪寤惰繜妲戒腑


//***********************    鏁版嵁瀛樺偍鍣≧AM鐩稿叧瀹忓畾涔?    **************************
`define DataAddrBus 31:0            //鍦板潃鎬荤嚎瀹藉害
`define DataBus 31:0                //鏁版嵁鎬荤嚎瀹藉害
`define DataMemNum 131072           //RAM澶у皬锛屽崟浣嶆槸瀛楋紝姝ゅ鏄?128K word(4瀛楄妭)
`define DataMemNumLog2 19           //瀹為檯浣跨敤鐨勫湴鍧?瀹藉害
`define ByteWidth 7:0               //瀛楄妭瀹藉害


//******************************    寮傚父鐩稿叧    *********************************
`define InstValid 1'b0              //鎸囦护鏈夋晥锛屾棤鏁堟寚浠ゅ紓甯竔nstvalid鏍囪涓?0
`define InstInvalid 1'b1            //鎸囦护鏃犳晥锛屾棤鏁堟寚浠ゅ紓甯竔nstvalid鏍囪涓?1
`define InterruptAssert 1'b1
`define InterruptNotAssert 1'b0
`define TrapAssert 1'b1
`define TrapNotAssert 1'b0


//**********************    瀹氫箟CP0涓悇涓瘎瀛樺櫒鐨勫湴鍧?    *************************
`define CP0_REG_COUNT 5'b01001      //鏍囧彿9
`define CP0_REG_COMPARE 5'b01011    //鏍囧彿11
`define CP0_REG_STATUS 5'b01100     //鏍囧彿12
`define CP0_REG_CAUSE 5'b01101      //鏍囧彿13
`define CP0_REG_EPC 5'b01110        //鏍囧彿14
`define CP0_REG_PRId 5'b01111       //鏍囧彿15
`define CP0_REG_CONFIG 5'b10000     //鏍囧彿16


//****************************Wishbone鎬荤嚎鎺ュ彛鐩稿叧*******************************
`define WB_IDLE 2'b00               //绌洪棽鐘舵??
`define WB_BUSY 2'b01               //鎬荤嚎蹇欑姸鎬?
`define WB_WAIT_FOR_FLUSHING 2'b10
`define WB_WAIT_FOR_STALL 2'b11     //绛夊緟鏆傚仠缁撴潫鐘舵??
