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
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Fri Nov 12 10:55:35 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ALUControl_proc IS 
	PORT
	(
		AluOp :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		F :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		BInvert :  OUT  STD_LOGIC;
		AInvert :  OUT  STD_LOGIC;
		Operation :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END ALUControl_proc;

ARCHITECTURE bdf_type OF ALUControl_proc IS 

SIGNAL	AluOpout :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;


BEGIN 



AluOpout(3) <= AluOp(0) AND SYNTHESIZED_WIRE_0;


SYNTHESIZED_WIRE_2 <= AluOp(1) AND F(1);


AluOpout(0) <= AluOp(1) AND SYNTHESIZED_WIRE_1;


SYNTHESIZED_WIRE_0 <= NOT(AluOp(0));



SYNTHESIZED_WIRE_4 <= NOT(AluOp(1));



SYNTHESIZED_WIRE_3 <= NOT(F(2));



AluOpout(2) <= SYNTHESIZED_WIRE_2 OR AluOp(0);


SYNTHESIZED_WIRE_1 <= F(0) OR F(3);


AluOpout(1) <= SYNTHESIZED_WIRE_3 OR SYNTHESIZED_WIRE_4;

BInvert <= AluOpout(2);
AInvert <= AluOpout(3);
Operation(1 DOWNTO 0) <= AluOpout(1 DOWNTO 0);

END bdf_type;