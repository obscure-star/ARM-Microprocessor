-- megafunction wizard: %LPM_MUX%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: LPM_MUX 

-- ============================================================
-- File Name: ALUSrc_MUX.vhd
-- Megafunction Name(s):
-- 			LPM_MUX
--
-- Simulation Library Files(s):
-- 			lpm
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 18.1.1 Build 646 04/11/2019 SJ Lite Edition
-- ************************************************************


--Copyright (C) 2019  Intel Corporation. All rights reserved.
--Your use of Intel Corporation's design tools, logic functions 
--and other software and tools, and any partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Intel Program License 
--Subscription Agreement, the Intel Quartus Prime License Agreement,
--the Intel FPGA IP License Agreement, or other applicable license
--agreement, including, without limitation, that your use is for
--the sole purpose of programming logic devices manufactured by
--Intel and sold by Intel or its authorized distributors.  Please
--refer to the applicable agreement for further details, at
--https://fpgasoftware.intel.com/eula.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.lpm_components.all;

ENTITY ALUSrc_MUX IS
	PORT
	(
		data0x		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		data1x		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		sel		: IN STD_LOGIC ;
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END ALUSrc_MUX;


ARCHITECTURE SYN OF alusrc_mux IS

--	type STD_LOGIC_2D is array (NATURAL RANGE <>, NATURAL RANGE <>) of STD_LOGIC;

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC_2D (1 DOWNTO 0, 31 DOWNTO 0);
	SIGNAL sub_wire2	: STD_LOGIC_VECTOR (31 DOWNTO 0);
	SIGNAL sub_wire3	: STD_LOGIC ;
	SIGNAL sub_wire4	: STD_LOGIC_VECTOR (0 DOWNTO 0);
	SIGNAL sub_wire5	: STD_LOGIC_VECTOR (31 DOWNTO 0);

BEGIN
	sub_wire2    <= data0x(31 DOWNTO 0);
	sub_wire0    <= data1x(31 DOWNTO 0);
	sub_wire1(1, 0)    <= sub_wire0(0);
	sub_wire1(1, 1)    <= sub_wire0(1);
	sub_wire1(1, 2)    <= sub_wire0(2);
	sub_wire1(1, 3)    <= sub_wire0(3);
	sub_wire1(1, 4)    <= sub_wire0(4);
	sub_wire1(1, 5)    <= sub_wire0(5);
	sub_wire1(1, 6)    <= sub_wire0(6);
	sub_wire1(1, 7)    <= sub_wire0(7);
	sub_wire1(1, 8)    <= sub_wire0(8);
	sub_wire1(1, 9)    <= sub_wire0(9);
	sub_wire1(1, 10)    <= sub_wire0(10);
	sub_wire1(1, 11)    <= sub_wire0(11);
	sub_wire1(1, 12)    <= sub_wire0(12);
	sub_wire1(1, 13)    <= sub_wire0(13);
	sub_wire1(1, 14)    <= sub_wire0(14);
	sub_wire1(1, 15)    <= sub_wire0(15);
	sub_wire1(1, 16)    <= sub_wire0(16);
	sub_wire1(1, 17)    <= sub_wire0(17);
	sub_wire1(1, 18)    <= sub_wire0(18);
	sub_wire1(1, 19)    <= sub_wire0(19);
	sub_wire1(1, 20)    <= sub_wire0(20);
	sub_wire1(1, 21)    <= sub_wire0(21);
	sub_wire1(1, 22)    <= sub_wire0(22);
	sub_wire1(1, 23)    <= sub_wire0(23);
	sub_wire1(1, 24)    <= sub_wire0(24);
	sub_wire1(1, 25)    <= sub_wire0(25);
	sub_wire1(1, 26)    <= sub_wire0(26);
	sub_wire1(1, 27)    <= sub_wire0(27);
	sub_wire1(1, 28)    <= sub_wire0(28);
	sub_wire1(1, 29)    <= sub_wire0(29);
	sub_wire1(1, 30)    <= sub_wire0(30);
	sub_wire1(1, 31)    <= sub_wire0(31);
	sub_wire1(0, 0)    <= sub_wire2(0);
	sub_wire1(0, 1)    <= sub_wire2(1);
	sub_wire1(0, 2)    <= sub_wire2(2);
	sub_wire1(0, 3)    <= sub_wire2(3);
	sub_wire1(0, 4)    <= sub_wire2(4);
	sub_wire1(0, 5)    <= sub_wire2(5);
	sub_wire1(0, 6)    <= sub_wire2(6);
	sub_wire1(0, 7)    <= sub_wire2(7);
	sub_wire1(0, 8)    <= sub_wire2(8);
	sub_wire1(0, 9)    <= sub_wire2(9);
	sub_wire1(0, 10)    <= sub_wire2(10);
	sub_wire1(0, 11)    <= sub_wire2(11);
	sub_wire1(0, 12)    <= sub_wire2(12);
	sub_wire1(0, 13)    <= sub_wire2(13);
	sub_wire1(0, 14)    <= sub_wire2(14);
	sub_wire1(0, 15)    <= sub_wire2(15);
	sub_wire1(0, 16)    <= sub_wire2(16);
	sub_wire1(0, 17)    <= sub_wire2(17);
	sub_wire1(0, 18)    <= sub_wire2(18);
	sub_wire1(0, 19)    <= sub_wire2(19);
	sub_wire1(0, 20)    <= sub_wire2(20);
	sub_wire1(0, 21)    <= sub_wire2(21);
	sub_wire1(0, 22)    <= sub_wire2(22);
	sub_wire1(0, 23)    <= sub_wire2(23);
	sub_wire1(0, 24)    <= sub_wire2(24);
	sub_wire1(0, 25)    <= sub_wire2(25);
	sub_wire1(0, 26)    <= sub_wire2(26);
	sub_wire1(0, 27)    <= sub_wire2(27);
	sub_wire1(0, 28)    <= sub_wire2(28);
	sub_wire1(0, 29)    <= sub_wire2(29);
	sub_wire1(0, 30)    <= sub_wire2(30);
	sub_wire1(0, 31)    <= sub_wire2(31);
	sub_wire3    <= sel;
	sub_wire4(0)    <= sub_wire3;
	result    <= sub_wire5(31 DOWNTO 0);

	LPM_MUX_component : LPM_MUX
	GENERIC MAP (
		lpm_size => 2,
		lpm_type => "LPM_MUX",
		lpm_width => 32,
		lpm_widths => 1
	)
	PORT MAP (
		data => sub_wire1,
		sel => sub_wire4,
		result => sub_wire5
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: new_diagram STRING "1"
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: CONSTANT: LPM_SIZE NUMERIC "2"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_MUX"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "32"
-- Retrieval info: CONSTANT: LPM_WIDTHS NUMERIC "1"
-- Retrieval info: USED_PORT: data0x 0 0 32 0 INPUT NODEFVAL "data0x[31..0]"
-- Retrieval info: USED_PORT: data1x 0 0 32 0 INPUT NODEFVAL "data1x[31..0]"
-- Retrieval info: USED_PORT: result 0 0 32 0 OUTPUT NODEFVAL "result[31..0]"
-- Retrieval info: USED_PORT: sel 0 0 0 0 INPUT NODEFVAL "sel"
-- Retrieval info: CONNECT: @data 1 0 32 0 data0x 0 0 32 0
-- Retrieval info: CONNECT: @data 1 1 32 0 data1x 0 0 32 0
-- Retrieval info: CONNECT: @sel 0 0 1 0 sel 0 0 0 0
-- Retrieval info: CONNECT: result 0 0 32 0 @result 0 0 32 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL ALUSrc_MUX.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL ALUSrc_MUX.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL ALUSrc_MUX.cmp FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL ALUSrc_MUX.bsf TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL ALUSrc_MUX_inst.vhd FALSE
-- Retrieval info: LIB_FILE: lpm
