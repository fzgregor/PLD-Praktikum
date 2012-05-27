----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:30:50 05/27/2012 
-- Design Name: 
-- Module Name:    one_hot_code - Behavioral 
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

entity one_hot_code_decoder is
    Port ( binary_code : in  STD_LOGIC_VECTOR (2 downto 0);
           one_hot_code : out  STD_LOGIC_VECTOR (7 downto 0));
end one_hot_code_decoder;

architecture Behavioral of one_hot_code_decoder is

begin

    with binary_code select
        one_hot_code <= "10000000" when "000",
		                  "01000000" when "001",
		                  "00100000" when "010",
		                  "00010000" when "011",
		                  "00001000" when "100",
		                  "00000100" when "101",
		                  "00000010" when "110",
		                  "00000001" when "111",
								"XXXXXXXX" when others;


end Behavioral;

