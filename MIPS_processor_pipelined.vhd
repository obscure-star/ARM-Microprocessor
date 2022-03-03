-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
-- CREATED		"Fri Dec 03 15:39:33 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY MIPS_processor_pipelined IS 
	PORT
	(
		MIPS_clock :  IN  STD_LOGIC;
		reset_n :  IN  STD_LOGIC
	);
END MIPS_processor_pipelined;

ARCHITECTURE bdf_type OF MIPS_processor_pipelined IS 

COMPONENT alu_32bit
	PORT(Ainvert : IN STD_LOGIC;
		 cin : IN STD_LOGIC;
		 Binvert : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 operation : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Negative : OUT STD_LOGIC;
		 Overflow : OUT STD_LOGIC;
		 Carryout : OUT STD_LOGIC;
		 z : OUT STD_LOGIC;
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alucontrol_proc
	PORT(AluOp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 F : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 AInvert : OUT STD_LOGIC;
		 BInvert : OUT STD_LOGIC;
		 Operation : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT branchadder
	PORT(dataa : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT control_proc
	PORT(Op : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 RegDst : OUT STD_LOGIC;
		 ALUSrc : OUT STD_LOGIC;
		 MemtoReg : OUT STD_LOGIC;
		 RegWrite : OUT STD_LOGIC;
		 MemRead : OUT STD_LOGIC;
		 MemWrite : OUT STD_LOGIC;
		 Branch : OUT STD_LOGIC;
		 ALUOp1 : OUT STD_LOGIC;
		 ALUOp0 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT datamem
	PORT(wren : IN STD_LOGIC;
		 rden : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rdaddress : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 wraddress : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT \32_bit_register\
	PORT(CLK : IN STD_LOGIC;
		 ENABLE : IN STD_LOGIC;
		 CLRN : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT \1_bit_register\
	PORT(CLK : IN STD_LOGIC;
		 ENABLE : IN STD_LOGIC;
		 CLRN : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(0 TO 0);
		 Q : OUT STD_LOGIC_VECTOR(0 TO 0)
	);
END COMPONENT;

COMPONENT \2_bit_register\
	PORT(CLK : IN STD_LOGIC;
		 ENABLE : IN STD_LOGIC;
		 CLRN : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT \5_bit_register\
	PORT(CLK : IN STD_LOGIC;
		 ENABLE : IN STD_LOGIC;
		 CLRN : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT \3_bit_register\
	PORT(CLK : IN STD_LOGIC;
		 ENABLE : IN STD_LOGIC;
		 CLRN : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT \4_bit_register\
	PORT(CLK : IN STD_LOGIC;
		 ENABLE : IN STD_LOGIC;
		 CLRN : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mem1p128w32b
	PORT(wren : IN STD_LOGIC;
		 rden : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux_alusrc
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux_branch
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux_memtoreg
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux_regdst
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pcadder
	PORT(dataa : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pcproc0
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register_file
	PORT(CLK : IN STD_LOGIC;
		 Write_Enable : IN STD_LOGIC;
		 CLRN : IN STD_LOGIC;
		 Read_register1x : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 Read_register2x : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 Write_Data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Write_Register : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 Read_Data1x : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Read_Data2x : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT signextender_proc
	PORT(i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 o : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sl2_proc
	PORT(i : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	ALU_proc0result :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ALUAinvert :  STD_LOGIC;
SIGNAL	ALUBinvert :  STD_LOGIC;
SIGNAL	ALUOp0 :  STD_LOGIC;
SIGNAL	ALUOp1 :  STD_LOGIC;
SIGNAL	ALUoperation :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	ALUSrc :  STD_LOGIC;
SIGNAL	Branch :  STD_LOGIC;
SIGNAL	BranchPCcontrol :  STD_LOGIC;
SIGNAL	clk :  STD_LOGIC;
SIGNAL	dataInst :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	DataMemout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	EX_MEMADDBranchout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	EX_MEMALUresultout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	EX_MEMControlMout :  STD_LOGIC;
SIGNAL	EX_MEMControlWBout :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	EX_MEMWriteregisterout :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	EX_MEMZeroout :  STD_LOGIC;
SIGNAL	GND :  STD_LOGIC;
SIGNAL	ID_EX_ReadData1xout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ID_EX_ReadData2xout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ID_EX_Readregister2xout :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	ID_EX_SignExtendout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ID_EX_Writeregisterout :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	ID_EXContolMout :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	ID_EXControlEXout :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	ID_EXControlWBout :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	ID_EXPCadd4out :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	IF_IDInstmem_proc0out :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	IF_IDPCAdd4out :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Inst :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	MEM_WB_Writeregisterout :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	MEM_WBALUresultout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	MEM_WBControlWBout :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	MEM_WBDataMemoryout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	MemRead :  STD_LOGIC;
SIGNAL	MemtoReg :  STD_LOGIC;
SIGNAL	MemWrite :  STD_LOGIC;
SIGNAL	MUX_ALUSrcout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	MUX_MemtoReg0Result :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	PCadd4 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	PCAddr :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	PCBranch :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	PCRegistertoAdd :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ReadData1x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	ReadData2x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	RegDst :  STD_LOGIC;
SIGNAL	RegWrite :  STD_LOGIC;
SIGNAL	resultBranch :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rs :  STD_LOGIC;
SIGNAL	shiftLeft2Branch :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	signExtenderout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	VCC :  STD_LOGIC;
SIGNAL	WriteReg :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	zero :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	zFlag :  STD_LOGIC;

SIGNAL	GDFX_TEMP_SIGNAL_0 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	GDFX_TEMP_SIGNAL_1 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	GDFX_TEMP_SIGNAL_2 :  STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN 

GDFX_TEMP_SIGNAL_0 <= (Branch & MemRead & MemWrite);
GDFX_TEMP_SIGNAL_1 <= (RegDst & ALUOp1 & ALUOp0 & ALUSrc);
GDFX_TEMP_SIGNAL_2 <= (RegWrite & MemtoReg);


b2v_ALU_proc0 : alu_32bit
PORT MAP(Ainvert => ALUAinvert,
		 cin => ALUBinvert,
		 Binvert => ALUBinvert,
		 a => ID_EX_ReadData1xout,
		 b => MUX_ALUSrcout,
		 operation => ALUoperation,
		 z => zFlag,
		 result => ALU_proc0result);


b2v_ALUControl_proc0 : alucontrol_proc
PORT MAP(AluOp => ID_EXControlEXout(2 DOWNTO 1),
		 F => ID_EX_SignExtendout(5 DOWNTO 0),
		 AInvert => ALUAinvert,
		 BInvert => ALUBinvert,
		 Operation => ALUoperation);


BranchPCcontrol <= EX_MEMControlMout AND zFlag;


b2v_BranchAdder_proc0 : branchadder
PORT MAP(dataa => ID_EXPCadd4out,
		 datab => shiftLeft2Branch,
		 result => PCBranch);


b2v_Control_proc0 : control_proc
PORT MAP(Op => IF_IDInstmem_proc0out(31 DOWNTO 26),
		 RegDst => RegDst,
		 ALUSrc => ALUSrc,
		 MemtoReg => MemtoReg,
		 RegWrite => RegWrite,
		 MemRead => MemRead,
		 MemWrite => MemWrite,
		 Branch => Branch,
		 ALUOp1 => ALUOp1,
		 ALUOp0 => ALUOp0);


b2v_DataMemProc0 : datamem
PORT MAP(wren => ID_EXContolMout(0),
		 rden => ID_EXContolMout(1),
		 clock => clk,
		 data => ID_EX_ReadData2xout,
		 rdaddress => ALU_proc0result(8 DOWNTO 2),
		 wraddress => ALU_proc0result(8 DOWNTO 2),
		 q => DataMemout);


b2v_EX_MEMADDBranch : \32_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => PCBranch,
		 Q => EX_MEMADDBranchout);


b2v_EX_MEMALUresult : \32_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => ALU_proc0result,
		 Q => EX_MEMALUresultout);


b2v_EX_MEMControlM : \1_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D(0) => ID_EXContolMout(2),
		 Q(0) => EX_MEMControlMout);


b2v_EX_MEMControlWB : \2_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => ID_EXControlWBout,
		 Q => EX_MEMControlWBout);


b2v_EX_MEMWriteregister : \5_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => WriteReg,
		 Q => EX_MEMWriteregisterout);


b2v_EX_MEMZero : \1_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D(0) => zFlag);





b2v_ID_EX_ReadData1x : \32_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => ReadData1x,
		 Q => ID_EX_ReadData1xout);


b2v_ID_EX_ReadData2x : \32_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => ReadData2x,
		 Q => ID_EX_ReadData2xout);


b2v_ID_EX_Readregister2x : \5_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => IF_IDInstmem_proc0out(20 DOWNTO 16),
		 Q => ID_EX_Readregister2xout);


b2v_ID_EX_SignExtend : \32_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => signExtenderout,
		 Q => ID_EX_SignExtendout);


b2v_ID_EX_Writeregister : \5_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => IF_IDInstmem_proc0out(15 DOWNTO 11),
		 Q => ID_EX_Writeregisterout);


b2v_ID_EXContolM : \3_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => GDFX_TEMP_SIGNAL_0,
		 Q => ID_EXContolMout);


b2v_ID_EXControlEX : \4_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => GDFX_TEMP_SIGNAL_1,
		 Q => ID_EXControlEXout);


b2v_ID_EXControlWB : \2_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => GDFX_TEMP_SIGNAL_2,
		 Q => ID_EXControlWBout);


b2v_ID_EXPCadd4 : \32_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => IF_IDPCAdd4out,
		 Q => ID_EXPCadd4out);


b2v_IF_IDInstmem_proc0 : \32_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => Inst,
		 Q => IF_IDInstmem_proc0out);


b2v_IF_IDPCAdd4 : \32_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => PCadd4,
		 Q => IF_IDPCAdd4out);


b2v_InstructionMemory_proc0 : mem1p128w32b
PORT MAP(wren => GND,
		 rden => VCC,
		 clock => clk,
		 address => PCAddr(8 DOWNTO 2),
		 data => dataInst,
		 q => Inst);


b2v_MEM_WB_Writeregister : \5_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => EX_MEMWriteregisterout,
		 Q => MEM_WB_Writeregisterout);


b2v_MEM_WBALUresult : \32_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => EX_MEMALUresultout,
		 Q => MEM_WBALUresultout);


b2v_MEM_WBControlWB : \2_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => EX_MEMControlWBout,
		 Q => MEM_WBControlWBout);


b2v_MEM_WBDataMemory : \32_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => DataMemout,
		 Q => MEM_WBDataMemoryout);


b2v_MUX_ALUSrc0 : mux_alusrc
PORT MAP(sel => ID_EXControlEXout(0),
		 data0x => ID_EX_ReadData2xout,
		 data1x => ID_EX_SignExtendout,
		 result => MUX_ALUSrcout);


b2v_MUX_Branch_proc0 : mux_branch
PORT MAP(sel => BranchPCcontrol,
		 data0x => PCadd4,
		 data1x => EX_MEMADDBranchout,
		 result => resultBranch);


b2v_MUX_MemtoReg_proc0 : mux_memtoreg
PORT MAP(sel => MEM_WBControlWBout(0),
		 data0x => MEM_WBALUresultout,
		 data1x => MEM_WBDataMemoryout,
		 result => MUX_MemtoReg0Result);


b2v_MUX_RegDst_proc0 : mux_regdst
PORT MAP(sel => ID_EXControlEXout(3),
		 data0x => ID_EX_Readregister2xout,
		 data1x => ID_EX_Writeregisterout,
		 result => WriteReg);


b2v_PCAdder_proc0 : pcadder
PORT MAP(dataa => PCRegistertoAdd,
		 result => PCadd4);


b2v_PCproc0 : pcproc0
PORT MAP(sel => rs,
		 data0x => zero,
		 data1x => resultBranch,
		 result => PCAddr);


b2v_PCRegister : \32_bit_register\
PORT MAP(CLK => clk,
		 ENABLE => VCC,
		 CLRN => rs,
		 D => PCAddr,
		 Q => PCRegistertoAdd);


b2v_Registers_proc0 : register_file
PORT MAP(CLK => clk,
		 Write_Enable => MEM_WBControlWBout(1),
		 CLRN => rs,
		 Read_register1x => IF_IDInstmem_proc0out(25 DOWNTO 21),
		 Read_register2x => IF_IDInstmem_proc0out(20 DOWNTO 16),
		 Write_Data => MUX_MemtoReg0Result,
		 Write_Register => MEM_WB_Writeregisterout,
		 Read_Data1x => ReadData1x,
		 Read_Data2x => ReadData2x);


b2v_SignExtender_proc0 : signextender_proc
PORT MAP(i => IF_IDInstmem_proc0out(15 DOWNTO 0),
		 o => signExtenderout);


b2v_SL2_proc1 : sl2_proc
PORT MAP(i => ID_EX_SignExtendout,
		 o => shiftLeft2Branch);


clk <= MIPS_clock;
rs <= reset_n;

dataInst <= "00000000000000000000000000000000";
GND <= '0';
VCC <= '1';
zero <= "00000000000000000000000000000000";
END bdf_type;