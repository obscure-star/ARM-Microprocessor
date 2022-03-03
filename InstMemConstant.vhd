-- megafunction wizard: %LPM_CONSTANT%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: LPM_CONSTANT 

-- ============================================================
-- File Name: InstMemConstant.vhd
-- Megafunction Name(s):
-- 			LPM_CONSTANT
--
-- Simulation Library Files(s):
-- 			
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 20.1.0 Build 711 06/05/2020 SJ Lite Edition
-- ************************************************************


--Copyright (C) 2020  Intel Corporation. All rights reserved.
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


--lpm_constant CBX_AUTO_BLACKBOX="ALL" ENABLE_RUNTIME_MOD="NO" LPM_CVALUE=F0F0F0F0 LPM_WIDTH=32 result
--VERSION_BEGIN 20.1 cbx_lpm_constant 2020:06:05:12:04:51:SJ cbx_mgl 2020:06:05:12:11:10:SJ  VERSION_END

--synthesis_resources = 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  InstMemConstant_lpm_constant_j79 IS 
	 PORT 
	 ( 
		 result	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0)
	 ); 
 END InstMemConstant_lpm_constant_j79;

 ARCHITECTURE RTL OF InstMemConstant_lpm_constant_j79 IS

 BEGIN

	result <= "11110000111100001111000011110000";

 END RTL; --InstMemConstant_lpm_constant_j79
--VALID FILE


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY InstMemConstant IS
	PORT
	(
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END InstMemConstant;


ARCHITECTURE RTL OF instmemconstant IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (31 DOWNTO 0);



	COMPONENT InstMemConstant_lpm_constant_j79
	PORT (
			result	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	result    <= sub_wire0(31 DOWNTO 0);

	InstMemConstant_lpm_constant_j79_component : InstMemConstant_lpm_constant_j79
	PORT MAP (
		result => sub_wire0
	);



END RTL;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: PRIVATE: JTAG_ENABLED NUMERIC "0"
-- Retrieval info: PRIVATE: JTAG_ID STRING "NONE"
-- Retrieval info: PRIVATE: Radix NUMERIC "16"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: Value NUMERIC "4042322160"
-- Retrieval info: PRIVATE: nBit NUMERIC "32"
-- Retrieval info: PRIVATE: new_diagram STRING "1"
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: CONSTANT: LPM_CVALUE NUMERIC "4042322160"
-- Retrieval info: CONSTANT: LPM_HINT STRING "ENABLE_RUNTIME_MOD=NO"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_CONSTANT"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "32"
-- Retrieval info: USED_PORT: result 0 0 32 0 OUTPUT NODEFVAL "result[31..0]"
-- Retrieval info: CONNECT: result 0 0 32 0 @result 0 0 32 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL InstMemConstant.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL InstMemConstant.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL InstMemConstant.cmp FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL InstMemConstant.bsf TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL InstMemConstant_inst.vhd FALSE
