#ifndef ASSDEFINE_H
#define ASSDEFINE_H

#define ADD_OP  0x00

#define MFC0_OP 0x10
#define MFC0_RS 0x00
#define MFC0_SH 0x00
#define MFC0_FC 0x00

#define MTC0_OP 0x10
#define MTC0_RS 0x04
#define MTC0_SH 0x00
#define MTC0_FC 0x00

#define XOR_OP 0x00
#define XOR_SH 0x00
#define XOR_FC 0x26

#define NOR_OP 0x00
#define NOR_SH 0x00
#define NOR_FC 0x27

#define SLT_OP 0x00
#define SLT_SH 0x00
#define SLT_FC 0x2a

#define SLTU_OP 0x00
#define SLTU_SH 0x00
#define SLTU_FC 0x2b

#define SLL_OP 0x00
#define SLL_RS 0x00
#define SLL_FC 0x00

#define SRL_OP 0x00
#define SRL_RS 0x00
#define SRL_FC 0x02

#define SRA_OP 0x00
#define SRA_RS 0x00
#define SRA_FC 0x03

#define SLLV_OP 0x00
#define SLLV_SH 0x00
#define SLLV_FC 0x04

#define SRLV_OP 0x00
#define SRLV_SH 0x00
#define SRLV_FC 0x06

#define SRAV_OP 0x00
#define SRAV_SH 0x00
#define SRAV_FC 0x07

#define JR_OP 0x00
#define JR_RT 0x00
#define JR_RD 0x00
#define JR_SH 0x00
#define JR_FC 0x07

#define JALR_OP 0x00
#define JALR_RT 0x00
#define JALR_SH 0x00
#define JALR_FC 0x07

//addi
#define ADDI_OP 0x08
#define ADDIU_OP 0x09
#define ANDI_OP 0x0c
#define ORI_OP 0x0d
#define XORI_OP 0x0e
#define LUI_OP 0x0f
#define LB_OP 0x20
#define LBU_OP 0x24
#define LH_OP 0x21
#define LHU_OP 0x25
#define SB_OP 0x28
#define SH_OP 0x29
#define LW_OP 0x23
#define SW_OP 0x2b
#define BEQ_OP 0x04
#define BNE_OP 0x05
#define BGEZ_OP 0x01
#define BGTZ_OP 0x07
#define BLEZ_OP 0x06
#define BLTZ_OP 0x01
#define BGEZAL_OP 0x01
#define BLTZAL_OP 0x01
#define SLTI_OP 0x0a
#define SLTIU_OP 0x0b
#endif // ASSDEFINE_H
