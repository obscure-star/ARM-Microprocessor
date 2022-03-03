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
-- CREATED		"Fri Oct 01 10:23:32 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ALU_1bit IS 
	PORT
	(
		a :  IN  STD_LOGIC;
		b :  IN  STD_LOGIC;
		Less :  IN  STD_LOGIC;
		cin :  IN  STD_LOGIC;
		Binvert :  IN  STD_LOGIC;
		Ainvert :  IN  STD_LOGIC;
		operation :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		result :  OUT  STD_LOGIC;
		cout :  OUT  STD_LOGIC;
		set :  OUT  STD_LOGIC
	);
END ALU_1bit;

ARCHITECTURE bdf_type OF ALU_1bit IS 

COMPONENT alu_1bit_adder
	PORT(cin : IN STD_LOGIC;
		 dataa : IN STD_LOGIC_VECTOR(0 TO 0);
		 datab : IN STD_LOGIC_VECTOR(0 TO 0);
		 cout : OUT STD_LOGIC;
		 result : OUT STD_LOGIC_VECTOR(0 TO 0)
	);
END COMPONENT;

COMPONENT mux_2_1_1b
	PORT(data1 : IN STD_LOGIC;
		 data0 : IN STD_LOGIC;
		 sel : IN STD_LOGIC;
		 result : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT mux_3_1_1c
	PORT(data3 : IN STD_LOGIC;
		 data2 : IN STD_LOGIC;
		 data1 : IN STD_LOGIC;
		 data0 : IN STD_LOGIC;
		 sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 result : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;


BEGIN 
set <= SYNTHESIZED_WIRE_6;



b2v_add0 : alu_1bit_adder
PORT MAP(cin => cin,
		 dataa(0) => SYNTHESIZED_WIRE_11,
		 datab(0) => SYNTHESIZED_WIRE_12,
		 cout => cout,
		 result(0) => SYNTHESIZED_WIRE_6);


SYNTHESIZED_WIRE_8 <= SYNTHESIZED_WIRE_11 AND SYNTHESIZED_WIRE_12;


SYNTHESIZED_WIRE_4 <= NOT(a);



SYNTHESIZED_WIRE_5 <= NOT(b);



b2v_mux0_1 : mux_2_1_1b
PORT MAP(data1 => SYNTHESIZED_WIRE_4,
		 data0 => a,
		 sel => Ainvert,
		 result => SYNTHESIZED_WIRE_11);


b2v_mux0_2 : mux_2_1_1b
PORT MAP(data1 => SYNTHESIZED_WIRE_5,
		 data0 => b,
		 sel => Binvert,
		 result => SYNTHESIZED_WIRE_12);


b2v_mux0_3 : mux_3_1_1c
PORT MAP(data3 => Less,
		 data2 => SYNTHESIZED_WIRE_6,
		 data1 => SYNTHESIZED_WIRE_7,
		 data0 => SYNTHESIZED_WIRE_8,
		 sel => operation,
		 result => result);


SYNTHESIZED_WIRE_7 <= SYNTHESIZED_WIRE_12 OR SYNTHESIZED_WIRE_11;


END bdf_type;