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
-- CREATED		"Thu Nov 11 19:16:00 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY SL2_proc_jump IS 
	PORT
	(
		i :  IN  STD_LOGIC_VECTOR(25 DOWNTO 0);
		o :  OUT  STD_LOGIC_VECTOR(27 DOWNTO 0)
	);
END SL2_proc_jump;

ARCHITECTURE bdf_type OF SL2_proc_jump IS 

SIGNAL	ZE :  STD_LOGIC;


BEGIN 



o(27) <= ZE;
o(26) <= ZE;
o(25 DOWNTO 2) <= i(23 DOWNTO 0);
o(1) <= ZE;
o(0) <= ZE;

ZE <= '0';
END bdf_type;