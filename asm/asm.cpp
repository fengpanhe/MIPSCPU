#include<iostream>
#include<stdio.h>
#include<memory.h>
#include<cstring>
#include<fstream>
#include<iomanip>
#include<cstdlib>
#include<stdlib.h>

#include "asmdefine.h"
using namespace std;
//修正了addu 和 立即数的符号问题
int N=0;
int getReg(char* arg){
    int reg = 0;
    int sign = 1;
    char *p = arg;
    while (*p == ' ') p++;
    if (*p == '$') p++;
    if (*p == '-') {
        sign = -1;
        p++;
    }

    if (p[0] == '0' && p[1] == 'x'){    //16进制数
        p += 2;
        while(*p != '\0'){
            if(*p >= '0' && *p <= '9'){
                reg = 16 * reg + (*p - '0');
            } else if (*p >= 'a' && *p <= 'f') {
                reg = 16 * reg + (*p - 'a' + 10);
            }
            *p++;
        }
    } else {        //非16进制
        while(*p >= '0' && *p <= '9'){
            reg = 10 * reg + (*p - '0');
            p++;
        }
    }
    return reg * sign;
}
void printBin(int num, int digi, ostream& os){
    char *bin = new char[digi+1];
    for(int i=0;i<digi;i++)bin[i]='0';

    char *p = bin + (digi - 1);
    char *pp=(bin+digi);*pp='\0';
    int sign = (num >= 0)? 1: -1;
    num = num * sign;

    while (num > 0){
        if (num & 1) *p = '1';
        num >>= 1;
        p--;
    }
    if (sign == -1){
        p = bin + (strlen(bin) - 1);
        while (p >= bin && *p != '1') p--;      // Find the last '1'
        if (p >= bin && *p == '1') p--;         // Skip the last '1'
        while (p >= bin) {
            *p = ('0' + '1') - *p;
            p--;
        }
    }
    os << bin;
    delete bin;
}
int main(int argc, char** argv){
    if (argc != 2)exit(-1);
    ifstream code(argv[1]);
    char *objname = new char[strlen(argv[1]) + 10];
    strcpy(objname, argv[1]);

    int i;
    for (i = strlen(objname) - 1; i >= 0; i--) if (objname[i] == '.') break;
    if (objname[i] == '.'){
        objname[i + 1] = '\0';
        strcat(objname, "coe");
    }
    else strcat(objname, ".coe");
    ofstream obj(objname);
    delete objname;
    obj<<"memory_initialization_radix = 2;"<<endl;
    obj<<"memory_initialization_vector = "<<endl;
    char command[20], arg1[20], arg2[20], arg3[20];
    while (code >> command){
        if (!strcmp(command, "add")){   // ADD $rd, $rs, $rt
            printBin(ADD_OP, 6, obj);
            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int rt = getReg(arg3);

            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(0, 5, obj);       // shamt
            printBin(0x20, 6, obj);    // funct
        }
        else if (!strcmp(command, "addu")){   // ADDU $rd, $rs, $rs
            printBin(0, 6, obj);
            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int rt = getReg(arg3);

            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(0, 5, obj);       // shamt
            printBin(0x21, 6, obj);    // funct
        }
        else if (!strcmp(command, "sub")){    // SUB $rd, $rs, $rt
            printBin(0, 6, obj);       // OpCode

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int rt = getReg(arg3);

            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(0, 5, obj);       // shamt
            printBin(0x22, 6, obj);    // funct
        }
        else if (!strcmp(command, "subu")){    // SUB $rd, $rs, $rt
            printBin(0, 6, obj);       // OpCode

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int rt = getReg(arg3);

            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(0, 5, obj);       // shamt
            printBin(0x23, 6, obj);    // funct
        }
        else if (!strcmp(command, "and")){ // AND $rd, $rs, $rt
            printBin(0, 6, obj);       // OpCode

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int rt = getReg(arg3);

            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(0, 5, obj);       // shamt
            printBin(0x24, 6, obj);    // funct
        }
        else if (!strcmp(command, "mult")){
            printBin(0, 6, obj);       // OpCode

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20);
            int rs = getReg(arg2);

            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(0, 10, obj);       // shamt
            printBin(0x18, 6, obj);    // funct
        }
        else if (!strcmp(command, "multu")){
            printBin(0, 6, obj);       // OpCode

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20);
            int rs = getReg(arg2);

            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(0, 10, obj);       // shamt
            printBin(0x19, 6, obj);    // funct
        }
        else if (!strcmp(command, "div")){
            printBin(0, 6, obj);       // OpCode

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20);
            int rs = getReg(arg2);

            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(0, 10, obj);       // shamt
            printBin(0x1a, 6, obj);    // funct
        }
        else if (!strcmp(command, "divu")){
            printBin(0, 6, obj);       // OpCode

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20);
            int rs = getReg(arg2);

            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(0, 10, obj);       // shamt
            printBin(0x1b, 6, obj);    // funct
        }
        else if (!strcmp(command, "mfhi")){

            code.getline(arg1, 20);
            int rd = getReg(arg1);

            printBin(0, 6, obj);       // OpCode
            printBin(0, 10, obj);
            printBin(rd, 5, obj);
            printBin(0, 5, obj);       // shamt
            printBin(0x10, 6, obj);    // funct
        }
        else if (!strcmp(command, "mflo")){

            code.getline(arg1, 20);
            int rd = getReg(arg1);

            printBin(0, 6, obj);       // OpCode
            printBin(0, 10, obj);
            printBin(rd, 5, obj);
            printBin(0, 5, obj);       // shamt
            printBin(0x12, 6, obj);    // funct
        }
        else if (!strcmp(command, "mthi")){

            code.getline(arg1, 20);
            int rs = getReg(arg1);

            printBin(0, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(0, 15, obj);       // shamt
            printBin(0x11, 6, obj);    // funct
        }
        else if (!strcmp(command, "mtlo")){

            code.getline(arg1, 20);
            int rs = getReg(arg1);

            printBin(0, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(0, 15, obj);       // shamt
            printBin(0x13, 6, obj);    // funct
        }
        else if (!strcmp(command, "mfc0")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rd = getReg(arg2);

            code.getline(arg3, 20);
            int zero = getReg(arg3);

            printBin(MFC0_OP, 6, obj);       // OpCode
            printBin(MFC0_RS, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(MFC0_SH, 5, obj);       // shamt
            printBin(MFC0_FC, 6, obj);    // funct
        }
        else if (!strcmp(command, "mtc0")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rd = getReg(arg2);

            code.getline(arg3, 20);
            int zero = getReg(arg3);

            printBin(MTC0_OP, 6, obj);       // OpCode
            printBin(MTC0_RS, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(MTC0_SH, 5, obj);       // shamt
            printBin(MTC0_FC, 6, obj);    // funct
        }
        else if (!strcmp(command, "or")){// OR $rd, $rs, $rt
            printBin(0, 6, obj);       // OpCode

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int rt = getReg(arg3);

            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(0, 5, obj);       // shamt
            printBin(0x25, 6, obj);    // funct
        }
        else if (!strcmp(command, "xor")){

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int rt = getReg(arg3);

            printBin(XOR_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(XOR_SH, 5, obj);       // shamt
            printBin(XOR_FC, 6, obj);    // funct
        }
        else if (!strcmp(command, "nor")){

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int rt = getReg(arg3);

            printBin(NOR_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(NOR_SH, 5, obj);       // shamt
            printBin(NOR_FC, 6, obj);    // funct
        }
        else if (!strcmp(command, "slt")){// SLT $rd, $rs, $rt

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int rt = getReg(arg3);

            printBin(SLT_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(SLT_SH, 5, obj);       // shamt
            printBin(SLT_FC, 6, obj);    // funct
        }
        else if (!strcmp(command, "sltu")){// SLTU $rd, $rs, $rt

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int rt = getReg(arg3);

            printBin(SLTU_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(SLTU_SH, 5, obj);       // shamt
            printBin(SLTU_FC, 6, obj);    // funct
        }
        else if (!strcmp(command, "sll")){

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rt = getReg(arg2);

            code.getline(arg3, 20);
            int sh = getReg(arg3);

            printBin(SLL_OP, 6, obj);       // OpCode
            printBin(SLL_RS, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(sh, 5, obj);       // shamt
            printBin(SLL_FC, 6, obj);    // funct
        }
        else if (!strcmp(command, "srl")){

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rt = getReg(arg2);

            code.getline(arg3, 20);
            int sh = getReg(arg3);

            printBin(SRL_OP, 6, obj);       // OpCode
            printBin(SRL_RS, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(sh, 5, obj);       // shamt
            printBin(SRL_FC, 6, obj);    // funct
        }
        else if (!strcmp(command, "sra")){

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rt = getReg(arg2);

            code.getline(arg3, 20);
            int sh = getReg(arg3);

            printBin(SRA_OP, 6, obj);       // OpCode
            printBin(SRA_RS, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(sh, 5, obj);       // shamt
            printBin(SRA_FC, 6, obj);    // funct
        }
        else if (!strcmp(command, "sllv")){

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rt = getReg(arg2);

            code.getline(arg3, 20);
            int rs = getReg(arg3);

            printBin(SLLV_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(SLLV_SH, 5, obj);       // shamt
            printBin(SLLV_FC, 6, obj);    // funct
        }
        else if (!strcmp(command, "srlv")){

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rt = getReg(arg2);

            code.getline(arg3, 20);
            int rs = getReg(arg3);

            printBin(SRLV_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(SRLV_SH, 5, obj);       // shamt
            printBin(SRLV_FC, 6, obj);    // funct
        }
        else if (!strcmp(command, "srav")){

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rt = getReg(arg2);

            code.getline(arg3, 20);
            int rs = getReg(arg3);

            printBin(SRAV_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(rd, 5, obj);
            printBin(SRAV_SH, 5, obj);       // shamt
            printBin(SRAV_FC, 6, obj);    // funct
        }
        else if (!strcmp(command, "jr")){

            code.getline(arg3, 20);
            int rs = getReg(arg3);

            printBin(JR_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(JR_RT, 5, obj);
            printBin(JR_RD, 5, obj);
            printBin(JR_SH, 5, obj);       // shamt
            printBin(JR_FC, 6, obj);    // funct
        }
        else if (!strcmp(command, "jalr")){

            code.getline(arg1, 20, ',');
            int rd = getReg(arg1);

            code.getline(arg3, 20);
            int rs = getReg(arg3);

            printBin(JALR_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(JALR_RT, 5, obj);
            printBin(rd, 5, obj);
            printBin(JALR_SH, 5, obj);       // shamt
            printBin(JALR_FC, 6, obj);    // funct
        }
        else if (!strcmp(command, "break")){

        }
        else if (!strcmp(command, "syscall")){

        }
        else if (!strcmp(command, "eret")){

        }
        else if (!strcmp(command, "addi")){   // ADDI $rt, $rs, 100

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int im = getReg(arg3);

            printBin(ADDI_OP, 6, obj);
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(im, 16, obj);
        }
        else if (!strcmp(command, "addiu")){   // ADDIU $rt, $rs, 100
            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int im = getReg(arg3);

            printBin(ADDIU_OP, 6, obj);
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(im, 16, obj);
        }
        else if (!strcmp(command, "andi")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int im = getReg(arg3);

            printBin(ANDI_OP, 6, obj);
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(im, 16, obj);
        }
        else if (!strcmp(command, "ori")){// OR $rd, $rs, num

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int im = getReg(arg3);

            printBin(ORI_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(im, 16, obj);
        }
        else if (!strcmp(command, "xori")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int im = getReg(arg3);

            printBin(XORI_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(im, 16, obj);
        }
        else if (!strcmp(command, "lui")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg3, 20);
            int im = getReg(arg3);

            printBin(LUI_OP, 6, obj);       // OpCode
            printBin(0, 5, obj);
            printBin(rt, 5, obj);
            printBin(im, 16, obj);
        }
        else if (!strcmp(command, "lb")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, '(');
            int of = getReg(arg2);

            code.getline(arg3, 20, ')');
            int rs = getReg(arg3);

            printBin(LB_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "lbu")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, '(');
            int of = getReg(arg2);

            code.getline(arg3, 20, ')');
            int rs = getReg(arg3);

            printBin(LBU_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "lh")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, '(');
            int of = getReg(arg2);

            code.getline(arg3, 20, ')');
            int rs = getReg(arg3);

            printBin(LH_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "lhu")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, '(');
            int of = getReg(arg2);

            code.getline(arg3, 20, ')');
            int rs = getReg(arg3);

            printBin(LHU_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "sb")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, '(');
            int of = getReg(arg2);

            code.getline(arg3, 20, ')');
            int rs = getReg(arg3);

            printBin(SB_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "sh")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, '(');
            int of = getReg(arg2);

            code.getline(arg3, 20, ')');
            int rs = getReg(arg3);

            printBin(SH_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "lw")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, '(');
            int of = getReg(arg2);

            code.getline(arg3, 20, ')');
            int rs = getReg(arg3);

            printBin(LW_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "sw")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, '(');
            int of = getReg(arg2);

            code.getline(arg3, 20, ')');
            int rs = getReg(arg3);

            printBin(SW_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "beq")){

            code.getline(arg1, 20, ',');
            int rs = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rt = getReg(arg2);

            code.getline(arg3, 20);
            int of = getReg(arg3);

            printBin(BEQ_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "bne")){

            code.getline(arg1, 20, ',');
            int rs = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rt = getReg(arg2);

            code.getline(arg3, 20);
            int of = getReg(arg3);

            printBin(BNE_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "bgez")){

            code.getline(arg1, 20, ',');
            int rs = getReg(arg1);

            code.getline(arg3, 20);
            int of = getReg(arg3);

            printBin(BGEZ_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(0x01, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "bgtz")){

            code.getline(arg1, 20, ',');
            int rs = getReg(arg1);

            code.getline(arg3, 20);
            int of = getReg(arg3);

            printBin(BGTZ_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(0x00, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "blez")){

            code.getline(arg1, 20, ',');
            int rs = getReg(arg1);

            code.getline(arg3, 20);
            int of = getReg(arg3);

            printBin(BLEZ_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(0x00, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "bltz")){

            code.getline(arg1, 20, ',');
            int rs = getReg(arg1);

            code.getline(arg3, 20);
            int of = getReg(arg3);

            printBin(BLTZ_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(0x00, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "bgezal")){

            code.getline(arg1, 20, ',');
            int rs = getReg(arg1);

            code.getline(arg3, 20);
            int of = getReg(arg3);

            printBin(BGEZAL_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(0x11, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "bltzal")){

            code.getline(arg1, 20, ',');
            int rs = getReg(arg1);

            code.getline(arg3, 20);
            int of = getReg(arg3);

            printBin(BLTZAL_OP, 6, obj);       // OpCode
            printBin(rs, 5, obj);
            printBin(0x10, 5, obj);
            printBin(of, 16, obj);
        }
        else if (!strcmp(command, "slti")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int im = getReg(arg3);

            printBin(SLTI_OP, 6, obj);
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(im, 16, obj);
        }
        else if (!strcmp(command, "sltiu")){

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20, ',');
            int rs = getReg(arg2);

            code.getline(arg3, 20);
            int im = getReg(arg3);

            printBin(SLTIU_OP, 6, obj);
            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(im, 16, obj);
        }
        else if (!strcmp(command, "lw")){  // LW $rt, offset($rs)
            printBin(0x23, 6, obj);

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20);
            int offset = 0;
            int sign = 1;
            char *p = arg2;

            while (*p == ' ') p++;
            if (*p == '-'){
                p++;
                sign = -1;
            }
            // Parse
            while (*p >= '0' && *p <= '9'){
                offset = 10 * offset + (*p - '0');
                p++;
            }
            offset = sign * offset;

            while (*p == ' ') p++;
            if (*p == '(') p++;

            char *q = arg2 + (strlen(arg2) - 1);
            while (*q == ' ') q--;
            if (*q == ')') *q = '\0';

            int rs = getReg(p);

            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(offset, 16, obj);
        }
        else if (!strcmp(command, "sw")){ // SW $rt, offset($rs)
            printBin(0x2B, 6, obj);

            code.getline(arg1, 20, ',');
            int rt = getReg(arg1);

            code.getline(arg2, 20);
            int offset = 0;
            int sign = 1;
            char *p = arg2;

            while (*p == ' ') p++;
            if (*p == '-'){
                p++;
                sign = -1;
            }
            while (*p >= '0' && *p <= '9'){
                offset = 10 * offset + (*p - '0');
                p++;
            }
            offset = sign * offset;

            while (*p == ' ') p++;
            if (*p == '(') p++;
            char *q = arg2 + (strlen(arg2) - 1);
            while (*q == ' ') q--;
            if (*q == ')') *q = '\0';

            int rs = getReg(p);

            printBin(rs, 5, obj);
            printBin(rt, 5, obj);
            printBin(offset, 16, obj);
        }
        else if (!strcmp(command, "j")){ // J addr
            printBin(0x02, 6, obj);
            int addr;
            code >> addr;
            addr/=4;
            printBin(addr, 26, obj);
        }
        else if (!strcmp(command, "jal")){ // Jal addr
            printBin(0x03, 6, obj);
            int addr;
            code >> addr;
            addr/=4;
            printBin(addr, 26, obj);
        }
        else if (!strcmp(command, "jr")){ // Jr addr
            printBin(0x0, 6, obj);
            int addr;
            code >> addr;
            addr/=4;
            printBin(addr, 26, obj);
        }
        else if (!strcmp(command, "nop")){ // NOP
            printBin(0, 32, obj);

        }
        N++;
        obj<<",";
        obj << endl;
    }
    for(int i=N;i<63;i++){
        printBin(0, 32,obj);
        obj<<","<<endl;
    }
    printBin(0, 32,obj);
    obj<<";"<<endl;
    code.close();
    obj.close();
    return 0;
}
