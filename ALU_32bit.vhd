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
-- CREATED		"Fri Nov 12 09:19:20 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ALU_32bit IS 
	PORT
	(
		cin :  IN  STD_LOGIC;
		Ainvert :  IN  STD_LOGIC;
		Binvert :  IN  STD_LOGIC;
		a :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		b :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		operation :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		Carryout :  OUT  STD_LOGIC;
		z :  OUT  STD_LOGIC;
		Overflow :  OUT  STD_LOGIC;
		Negative :  OUT  STD_LOGIC;
		result :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END ALU_32bit;

ARCHITECTURE bdf_type OF ALU_32bit IS 

COMPONENT alu_1bit
	PORT(Ainvert : IN STD_LOGIC;
		 Less : IN STD_LOGIC;
		 cin : IN STD_LOGIC;
		 a : IN STD_LOGIC;
		 b : IN STD_LOGIC;
		 Binvert : IN STD_LOGIC;
		 operation : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 result : OUT STD_LOGIC;
		 cout : OUT STD_LOGIC;
		 set : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	cout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	GND :  STD_LOGIC;
SIGNAL	result_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	set :  STD_LOGIC_VECTOR(31 TO 31);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;


BEGIN 



b2v_ALU0 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => set(31),
		 cin => cin,
		 a => a(0),
		 b => b(0),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(0),
		 cout => cout(0));


b2v_ALU1 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(0),
		 a => a(1),
		 b => b(1),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(1),
		 cout => cout(1));


b2v_ALU10 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(9),
		 a => a(10),
		 b => b(10),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(10),
		 cout => cout(10));


b2v_ALU11 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(10),
		 a => a(11),
		 b => b(11),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(11),
		 cout => cout(11));


b2v_ALU12 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(11),
		 a => a(12),
		 b => b(12),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(12),
		 cout => cout(12));


b2v_ALU13 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(12),
		 a => a(13),
		 b => b(13),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(13),
		 cout => cout(13));


b2v_ALU14 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(13),
		 a => a(14),
		 b => b(14),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(14),
		 cout => cout(14));


b2v_ALU15 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(14),
		 a => a(15),
		 b => b(15),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(15),
		 cout => cout(15));


b2v_ALU16 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(15),
		 a => a(16),
		 b => b(16),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(16),
		 cout => cout(16));


b2v_ALU17 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(16),
		 a => a(17),
		 b => b(17),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(17),
		 cout => cout(17));


b2v_ALU18 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(17),
		 a => a(18),
		 b => b(18),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(18),
		 cout => cout(18));


b2v_ALU19 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(18),
		 a => a(19),
		 b => b(19),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(19),
		 cout => cout(19));


b2v_ALU2 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(1),
		 a => a(2),
		 b => b(2),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(2),
		 cout => cout(2));


b2v_ALU20 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(19),
		 a => a(20),
		 b => b(20),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(20),
		 cout => cout(20));


b2v_ALU21 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(20),
		 a => a(21),
		 b => b(21),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(21),
		 cout => cout(21));


b2v_ALU22 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(21),
		 a => a(22),
		 b => b(22),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(22),
		 cout => cout(22));


b2v_ALU23 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(22),
		 a => a(23),
		 b => b(23),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(23),
		 cout => cout(23));


b2v_ALU24 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(23),
		 a => a(24),
		 b => b(24),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(24),
		 cout => cout(24));


b2v_ALU25 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(24),
		 a => a(25),
		 b => b(25),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(25),
		 cout => cout(25));


b2v_ALU26 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(25),
		 a => a(26),
		 b => b(26),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(26),
		 cout => cout(26));


b2v_ALU27 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(26),
		 a => a(27),
		 b => b(27),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(27),
		 cout => cout(27));


b2v_ALU28 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(27),
		 a => a(28),
		 b => b(28),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(28),
		 cout => cout(28));


b2v_ALU29 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(28),
		 a => a(29),
		 b => b(29),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(29),
		 cout => cout(29));


b2v_ALU3 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(2),
		 a => a(3),
		 b => b(3),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(3),
		 cout => cout(3));


b2v_ALU30 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(29),
		 a => a(30),
		 b => b(30),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(30),
		 cout => cout(30));


b2v_ALU31 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(30),
		 a => a(31),
		 b => b(31),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(31),
		 cout => cout(31),
		 set => set(31));


b2v_ALU4 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(3),
		 a => a(4),
		 b => b(4),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(4),
		 cout => cout(4));


b2v_ALU5 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(4),
		 a => a(5),
		 b => b(5),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(5),
		 cout => cout(5));


b2v_ALU6 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(5),
		 a => a(6),
		 b => b(6),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(6),
		 cout => cout(6));


b2v_ALU7 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(6),
		 a => a(7),
		 b => b(7),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(7),
		 cout => cout(7));


b2v_ALU8 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(7),
		 a => a(8),
		 b => b(8),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(8),
		 cout => cout(8));


b2v_ALU9 : alu_1bit
PORT MAP(Ainvert => Ainvert,
		 Less => GND,
		 cin => cout(8),
		 a => a(9),
		 b => b(9),
		 Binvert => Binvert,
		 operation => operation,
		 result => result_ALTERA_SYNTHESIZED(9),
		 cout => cout(9));


z <= SYNTHESIZED_WIRE_0 AND SYNTHESIZED_WIRE_1 AND SYNTHESIZED_WIRE_2 AND SYNTHESIZED_WIRE_3;



SYNTHESIZED_WIRE_0 <= NOT(result_ALTERA_SYNTHESIZED(0) OR result_ALTERA_SYNTHESIZED(2) OR result_ALTERA_SYNTHESIZED(1) OR result_ALTERA_SYNTHESIZED(3) OR result_ALTERA_SYNTHESIZED(5) OR result_ALTERA_SYNTHESIZED(4) OR result_ALTERA_SYNTHESIZED(6) OR result_ALTERA_SYNTHESIZED(7));


SYNTHESIZED_WIRE_1 <= NOT(result_ALTERA_SYNTHESIZED(8) OR result_ALTERA_SYNTHESIZED(10) OR result_ALTERA_SYNTHESIZED(9) OR result_ALTERA_SYNTHESIZED(11) OR result_ALTERA_SYNTHESIZED(13) OR result_ALTERA_SYNTHESIZED(12) OR result_ALTERA_SYNTHESIZED(14) OR result_ALTERA_SYNTHESIZED(15));


SYNTHESIZED_WIRE_2 <= NOT(result_ALTERA_SYNTHESIZED(16) OR result_ALTERA_SYNTHESIZED(18) OR result_ALTERA_SYNTHESIZED(17) OR result_ALTERA_SYNTHESIZED(19) OR result_ALTERA_SYNTHESIZED(21) OR result_ALTERA_SYNTHESIZED(20) OR result_ALTERA_SYNTHESIZED(22) OR result_ALTERA_SYNTHESIZED(23));


SYNTHESIZED_WIRE_3 <= NOT(result_ALTERA_SYNTHESIZED(24) OR result_ALTERA_SYNTHESIZED(26) OR result_ALTERA_SYNTHESIZED(25) OR result_ALTERA_SYNTHESIZED(27) OR result_ALTERA_SYNTHESIZED(29) OR result_ALTERA_SYNTHESIZED(28) OR result_ALTERA_SYNTHESIZED(30) OR result_ALTERA_SYNTHESIZED(31));


Overflow <= cout(30) XOR cout(31);

Carryout <= cout(31);
Negative <= result_ALTERA_SYNTHESIZED(31);
result <= result_ALTERA_SYNTHESIZED;

GND <= '0';
END bdf_type;