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
-- CREATED		"Fri Nov 19 11:13:45 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY \2_bit_register\ IS 
	PORT
	(
		CLRN :  IN  STD_LOGIC;
		ENABLE :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		D :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		Q :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END \2_bit_register\;

ARCHITECTURE bdf_type OF \2_bit_register\ IS 

SIGNAL	PRN :  STD_LOGIC;
SIGNAL	Q_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(1 DOWNTO 0);


BEGIN 




PROCESS(CLK,CLRN,PRN)
BEGIN
IF (CLRN = '0') THEN
	Q_ALTERA_SYNTHESIZED(0) <= '0';
ELSIF (PRN = '0') THEN
	Q_ALTERA_SYNTHESIZED(0) <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	IF (ENABLE = '1') THEN
	Q_ALTERA_SYNTHESIZED(0) <= D(0);
	END IF;
END IF;
END PROCESS;


PROCESS(CLK,CLRN,PRN)
BEGIN
IF (CLRN = '0') THEN
	Q_ALTERA_SYNTHESIZED(1) <= '0';
ELSIF (PRN = '0') THEN
	Q_ALTERA_SYNTHESIZED(1) <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	IF (ENABLE = '1') THEN
	Q_ALTERA_SYNTHESIZED(1) <= D(1);
	END IF;
END IF;
END PROCESS;

Q <= Q_ALTERA_SYNTHESIZED;

PRN <= '1';
END bdf_type;