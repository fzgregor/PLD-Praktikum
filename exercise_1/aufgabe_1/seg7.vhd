----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:35:16 05/24/2012 
-- Design Name: 
-- Module Name:    seg7 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seg7 is
    Port ( sw : in  STD_LOGIC_VECTOR (3 downto 0);
           seg7_seg : out  STD_LOGIC_VECTOR (6 downto 0);
           seg7_an : out  STD_LOGIC_VECTOR (3 downto 0));
end seg7;

architecture case_statement of seg7 is
signal seg7_neg : STD_LOGIC_VECTOR (6 downto 0);

begin
seg7_an <= "1110";
seg7_seg <= not seg7_neg ;

process (sw)
begin
   case sw is
	   when X"0" => seg7_neg <= "1111110";
		when X"1" => seg7_neg <= "0110000";
		when X"2" => seg7_neg <= "1101101";
		when X"3" => seg7_neg <= "1111001";
		when X"4" => seg7_neg <= "0110011";
		when X"5" => seg7_neg <= "0110000";
		when X"6" => seg7_neg <= "0110000";
		when X"7" => seg7_neg <= "0110000";
		when X"8" => seg7_neg <= "0110000";
		when X"9" => seg7_neg <= "0110000";
		when X"A" => seg7_neg <= "0110000";
		when X"B" => seg7_neg <= "0110000";
		when X"C" => seg7_neg <= "0110000";
		when X"D" => seg7_neg <= "0110000";
		when X"E" => seg7_neg <= "0110000";
		when X"F" => seg7_neg <= "0110000";
		when others => seg7_neg <= "-------";
	end case;
end process;

end case_statement;

architecture with_select_statement of seg7 is
signal seg7_neg : STD_LOGIC_VECTOR (6 downto 0);

begin
seg7_an <= "1110";
seg7_seg <= not seg7_neg ;

with sw select 
	seg7_neg <= "1111110" when "0000", --0
					"0110000" when "0001", --1
					"1101101" when "0010", --2
					"1111001" when "0011", --3
					"0110011" when "0100", --4
					"1011011" when "0101", --5
					"1011111" when "0110", --6
					"1110000" when "0111", --7
					"1111111" when "1000", --8
					"1111011" when "1001", --9
					"1110111" when "1010", --A
					"0011111" when "1011", --b
					"1001110" when "1100", --C
					"0111101" when "1101", --d
					"1001111" when "1110", --E
					"1000111" when "1111", --F
					"0000000" when others;
end with_select_statement;


