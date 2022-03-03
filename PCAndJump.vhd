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
-- CREATED		"Thu Nov 11 19:16:34 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY PCAndJump IS 
	PORT
	(
		Jump :  IN  STD_LOGIC_VECTOR(27 DOWNTO 0);
		PC :  IN  STD_LOGIC_VECTOR(31 DOWNTO 28);
		JumpAddr :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END PCAndJump;

ARCHITECTURE bdf_type OF PCAndJump IS 



BEGIN 


JumpAddr(31 DOWNTO 28) <= PC(31 DOWNTO 28);
JumpAddr(27 DOWNTO 0) <= Jump(27 DOWNTO 0);

END bdf_type;