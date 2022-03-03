--
-- Seven Segment Decoder for DE-10
--
-- Since DE-10 only has 6 seven segment displays,
-- the 32-bit value is displayed as Hi/Lo parts.
-- So value of 0x12345678 would diplay as:
--       H-1234   when h1l0 is '1'
--       L-5678   when h1l0 is '0'
-- Inputs:
--         val:  32-bit value
--        h1l0:  display hi/lo part of value
--    segments:  seven-segment display signals
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SevenSegDecode is
  port (
    h1l0      :  in std_logic;
    val       :  in std_logic_vector(31 downto 0);
    segments  : out std_logic_vector(41 downto 0)
  );
end entity SevenSegDecode;

architecture rtl of SevenSegDecode is
  signal decode_part: std_logic_vector(15 downto 0);

  function decodeDigit(inVal: std_logic_vector(3 downto 0)) 
              return std_logic_vector is
    variable segs : std_logic_vector(6 downto 0);
  begin
    case inVal is
        when "0000" => segs := "1000000";
        when "0001" => segs := "1111001";
        when "0010" => segs := "0100100";
        when "0011" => segs := "0110000";
        when "0100" => segs := "0011001";
        when "0101" => segs := "0010010";
        when "0110" => segs := "0000010";
        when "0111" => segs := "1111000";
        when "1000" => segs := "0000000";
        when "1001" => segs := "0010000";
        when "1010" => segs := "0001000";
        when "1011" => segs := "0000011";
        when "1100" => segs := "1000110";
        when "1101" => segs := "0100001";
        when "1110" => segs := "0000110";
        when "1111" => segs := "0001110";
        when others => segs := "0000000";
     end case;
     return segs;
  end function;
begin
  
  -- 2:1 mux that determines which part of the input value to display
  decode_part <= val(31 downto 16) when (h1l0 = '1') else val(15 downto 0);

  -- Use "upper" seven segment displays to indicate which part displayed
  segments(41 downto 35) <= "0001001" when (h1l0 = '1') else "1000111";

  -- Use "next seven segment display to show "-"
  segments(34 downto 28) <= "0111111";

  -- Decode the 16 bits selected
  segments(27 downto 21) <= decodeDigit(decode_part(15 downto 12));
  segments(20 downto 14) <= decodeDigit(decode_part(11 downto  8));
  segments(13 downto  7) <= decodeDigit(decode_part( 7 downto  4));
  segments( 6 downto  0) <= decodeDigit(decode_part( 3 downto  0));
  
end architecture rtl;

