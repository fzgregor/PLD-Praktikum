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

entity one_hot_code is
    Port ( binary_code : in  STD_LOGIC_VECTOR (1 downto 0);
           one_hot_code : out  STD_LOGIC_VECTOR (3 downto 0));
end one_hot_code;

architecture Behavioral of one_hot_code is

begin

    with binary_code select
        one_hot_code <= "1000" when "00",
		                  "0100" when "01",
		                  "0010" when "10",
		                  "0001" when "11",
								"XXXX" when others;


end Behavioral;