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
-- CREATED		"Thu Nov 11 19:20:01 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY SignExtender_proc IS 
	PORT
	(
		i :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		o :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END SignExtender_proc;

ARCHITECTURE bdf_type OF SignExtender_proc IS 



BEGIN 


o(31) <= i(15);
o(30) <= i(15);
o(29) <= i(15);
o(28) <= i(15);
o(27) <= i(15);
o(26) <= i(15);
o(25) <= i(15);
o(24) <= i(15);
o(23) <= i(15);
o(22) <= i(15);
o(21) <= i(15);
o(20) <= i(15);
o(19) <= i(15);
o(18) <= i(15);
o(17) <= i(15);
o(16) <= i(15);
o(15 DOWNTO 0) <= i(15 DOWNTO 0);

END bdf_type;