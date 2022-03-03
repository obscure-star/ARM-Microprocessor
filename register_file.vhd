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
-- CREATED		"Fri Oct 29 09:51:12 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY register_file IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		CLRN :  IN  STD_LOGIC;
		Write_Enable :  IN  STD_LOGIC;
		Read_register1x :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		Read_register2x :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		Write_Data :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Write_Register :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		Read_Data1x :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Read_Data2x :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END register_file;

ARCHITECTURE bdf_type OF register_file IS 

COMPONENT mux_readdata
	PORT(data0x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data10x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data11x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data12x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data13x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data14x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data15x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data16x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data17x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data18x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data19x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data20x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data21x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data22x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data23x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data24x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data25x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data26x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data27x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data28x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data29x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data2x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data30x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data31x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data3x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data4x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data5x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data6x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data7x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data8x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 data9x : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
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

COMPONENT decode_writeenable
	PORT(enable : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 eq0 : OUT STD_LOGIC;
		 eq1 : OUT STD_LOGIC;
		 eq2 : OUT STD_LOGIC;
		 eq3 : OUT STD_LOGIC;
		 eq4 : OUT STD_LOGIC;
		 eq5 : OUT STD_LOGIC;
		 eq6 : OUT STD_LOGIC;
		 eq7 : OUT STD_LOGIC;
		 eq8 : OUT STD_LOGIC;
		 eq9 : OUT STD_LOGIC;
		 eq10 : OUT STD_LOGIC;
		 eq11 : OUT STD_LOGIC;
		 eq12 : OUT STD_LOGIC;
		 eq13 : OUT STD_LOGIC;
		 eq14 : OUT STD_LOGIC;
		 eq15 : OUT STD_LOGIC;
		 eq16 : OUT STD_LOGIC;
		 eq17 : OUT STD_LOGIC;
		 eq18 : OUT STD_LOGIC;
		 eq19 : OUT STD_LOGIC;
		 eq20 : OUT STD_LOGIC;
		 eq21 : OUT STD_LOGIC;
		 eq22 : OUT STD_LOGIC;
		 eq23 : OUT STD_LOGIC;
		 eq24 : OUT STD_LOGIC;
		 eq25 : OUT STD_LOGIC;
		 eq26 : OUT STD_LOGIC;
		 eq27 : OUT STD_LOGIC;
		 eq28 : OUT STD_LOGIC;
		 eq29 : OUT STD_LOGIC;
		 eq30 : OUT STD_LOGIC;
		 eq31 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	c :  STD_LOGIC;
SIGNAL	e :  STD_LOGIC;
SIGNAL	e1 :  STD_LOGIC;
SIGNAL	e10 :  STD_LOGIC;
SIGNAL	e11 :  STD_LOGIC;
SIGNAL	e12 :  STD_LOGIC;
SIGNAL	e13 :  STD_LOGIC;
SIGNAL	e14 :  STD_LOGIC;
SIGNAL	e15 :  STD_LOGIC;
SIGNAL	e16 :  STD_LOGIC;
SIGNAL	e17 :  STD_LOGIC;
SIGNAL	e18 :  STD_LOGIC;
SIGNAL	e19 :  STD_LOGIC;
SIGNAL	e2 :  STD_LOGIC;
SIGNAL	e20 :  STD_LOGIC;
SIGNAL	e21 :  STD_LOGIC;
SIGNAL	e22 :  STD_LOGIC;
SIGNAL	e23 :  STD_LOGIC;
SIGNAL	e24 :  STD_LOGIC;
SIGNAL	e25 :  STD_LOGIC;
SIGNAL	e26 :  STD_LOGIC;
SIGNAL	e27 :  STD_LOGIC;
SIGNAL	e28 :  STD_LOGIC;
SIGNAL	e29 :  STD_LOGIC;
SIGNAL	e3 :  STD_LOGIC;
SIGNAL	e30 :  STD_LOGIC;
SIGNAL	e31 :  STD_LOGIC;
SIGNAL	e4 :  STD_LOGIC;
SIGNAL	e5 :  STD_LOGIC;
SIGNAL	e6 :  STD_LOGIC;
SIGNAL	e7 :  STD_LOGIC;
SIGNAL	e8 :  STD_LOGIC;
SIGNAL	e9 :  STD_LOGIC;
SIGNAL	Q0x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q10x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q11x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q12x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q13x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q14x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q15x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q16x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q17x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q18x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q19x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q1x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q20x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q21x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q22x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q23x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q24x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q25x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q26x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q27x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q28x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q29x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q2x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q30x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q31x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q3x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q4x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q5x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q6x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q7x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q8x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	Q9x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rdx1x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	rdx2x :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	wd :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	wR :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	zero :  STD_LOGIC;


BEGIN 




b2v_Mux1 : mux_readdata
PORT MAP(data0x => Q0x,
		 data10x => Q10x,
		 data11x => Q11x,
		 data12x => Q12x,
		 data13x => Q13x,
		 data14x => Q14x,
		 data15x => Q15x,
		 data16x => Q16x,
		 data17x => Q17x,
		 data18x => Q18x,
		 data19x => Q19x,
		 data1x => Q1x,
		 data20x => Q20x,
		 data21x => Q21x,
		 data22x => Q22x,
		 data23x => Q23x,
		 data24x => Q24x,
		 data25x => Q25x,
		 data26x => Q26x,
		 data27x => Q27x,
		 data28x => Q28x,
		 data29x => Q29x,
		 data2x => Q2x,
		 data30x => Q30x,
		 data31x => Q31x,
		 data3x => Q3x,
		 data4x => Q4x,
		 data5x => Q5x,
		 data6x => Q6x,
		 data7x => Q7x,
		 data8x => Q8x,
		 data9x => Q9x,
		 sel => Read_register1x,
		 result => rdx1x);


b2v_Mux2 : mux_readdata
PORT MAP(data0x => Q0x,
		 data10x => Q10x,
		 data11x => Q11x,
		 data12x => Q12x,
		 data13x => Q13x,
		 data14x => Q14x,
		 data15x => Q15x,
		 data16x => Q16x,
		 data17x => Q17x,
		 data18x => Q18x,
		 data19x => Q19x,
		 data1x => Q1x,
		 data20x => Q20x,
		 data21x => Q21x,
		 data22x => Q22x,
		 data23x => Q23x,
		 data24x => Q24x,
		 data25x => Q25x,
		 data26x => Q26x,
		 data27x => Q27x,
		 data28x => Q28x,
		 data29x => Q29x,
		 data2x => Q2x,
		 data30x => Q30x,
		 data31x => Q31x,
		 data3x => Q3x,
		 data4x => Q4x,
		 data5x => Q5x,
		 data6x => Q6x,
		 data7x => Q7x,
		 data8x => Q8x,
		 data9x => Q9x,
		 sel => Read_register2x,
		 result => rdx2x);


b2v_REGB0 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => zero,
		 CLRN => c,
		 D => wd,
		 Q => Q0x);


b2v_REGB1 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e1,
		 CLRN => c,
		 D => wd,
		 Q => Q1x);


b2v_REGB10 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e10,
		 CLRN => c,
		 D => wd,
		 Q => Q10x);


b2v_REGB11 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e11,
		 CLRN => c,
		 D => wd,
		 Q => Q11x);


b2v_REGB12 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e12,
		 CLRN => c,
		 D => wd,
		 Q => Q12x);


b2v_REGB13 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e13,
		 CLRN => c,
		 D => wd,
		 Q => Q13x);


b2v_REGB14 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e14,
		 CLRN => c,
		 D => wd,
		 Q => Q14x);


b2v_REGB15 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e15,
		 CLRN => c,
		 D => wd,
		 Q => Q15x);


b2v_REGB16 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e16,
		 CLRN => c,
		 D => wd,
		 Q => Q16x);


b2v_REGB17 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e17,
		 CLRN => c,
		 D => wd,
		 Q => Q17x);


b2v_REGB18 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e18,
		 CLRN => c,
		 D => wd,
		 Q => Q18x);


b2v_REGB19 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e19,
		 CLRN => c,
		 D => wd,
		 Q => Q19x);


b2v_REGB2 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e2,
		 CLRN => c,
		 D => wd,
		 Q => Q2x);


b2v_REGB20 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e20,
		 CLRN => c,
		 D => wd,
		 Q => Q20x);


b2v_REGB21 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e21,
		 CLRN => c,
		 D => wd,
		 Q => Q21x);


b2v_REGB22 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e22,
		 CLRN => c,
		 D => wd,
		 Q => Q22x);


b2v_REGB23 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e23,
		 CLRN => c,
		 D => wd,
		 Q => Q23x);


b2v_REGB24 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e24,
		 CLRN => c,
		 D => wd,
		 Q => Q24x);


b2v_REGB25 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e25,
		 CLRN => c,
		 D => wd,
		 Q => Q25x);


b2v_REGB26 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e26,
		 CLRN => c,
		 D => wd,
		 Q => Q26x);


b2v_REGB27 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e27,
		 CLRN => c,
		 D => wd,
		 Q => Q27x);


b2v_REGB28 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e28,
		 CLRN => c,
		 D => wd,
		 Q => Q28x);


b2v_REGB29 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e29,
		 CLRN => c,
		 D => wd,
		 Q => Q29x);


b2v_REGB3 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e3,
		 CLRN => c,
		 D => wd,
		 Q => Q3x);


b2v_REGB30 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e30,
		 CLRN => c,
		 D => wd,
		 Q => Q30x);


b2v_REGB31 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e31,
		 CLRN => c,
		 D => wd,
		 Q => Q31x);


b2v_REGB4 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e4,
		 CLRN => c,
		 D => wd,
		 Q => Q4x);


b2v_REGB5 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e5,
		 CLRN => c,
		 D => wd,
		 Q => Q5x);


b2v_REGB6 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e6,
		 CLRN => c,
		 D => wd,
		 Q => Q6x);


b2v_REGB7 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e7,
		 CLRN => c,
		 D => wd,
		 Q => Q7x);


b2v_REGB8 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e8,
		 CLRN => c,
		 D => wd,
		 Q => Q8x);


b2v_REGB9 : \32_bit_register\
PORT MAP(CLK => CLK,
		 ENABLE => e9,
		 CLRN => c,
		 D => wd,
		 Q => Q9x);


b2v_Wre0 : decode_writeenable
PORT MAP(enable => e,
		 data => wR,
		 eq1 => e1,
		 eq2 => e2,
		 eq3 => e3,
		 eq4 => e4,
		 eq5 => e5,
		 eq6 => e6,
		 eq7 => e7,
		 eq8 => e8,
		 eq9 => e9,
		 eq10 => e10,
		 eq11 => e11,
		 eq12 => e12,
		 eq13 => e13,
		 eq14 => e14,
		 eq15 => e15,
		 eq16 => e16,
		 eq17 => e17,
		 eq18 => e18,
		 eq19 => e19,
		 eq20 => e20,
		 eq21 => e21,
		 eq22 => e22,
		 eq23 => e23,
		 eq24 => e24,
		 eq25 => e25,
		 eq26 => e26,
		 eq27 => e27,
		 eq28 => e28,
		 eq29 => e29,
		 eq30 => e30,
		 eq31 => e31);

Read_Data1x <= rdx1x;
c <= CLRN;
wd <= Write_Data;
e <= Write_Enable;
wR <= Write_Register;
Read_Data2x <= rdx2x;

zero <= '0';
END bdf_type;