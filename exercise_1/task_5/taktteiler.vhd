----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:15:23 05/27/2012 
-- Design Name: 
-- Module Name:    taktteiler - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity taktteiler is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           enable_clock : in  STD_LOGIC;
           clks : out  STD_LOGIC_VECTOR (1 downto 0));
end taktteiler;

architecture Behavioral of taktteiler is
	 signal cnt : unsigned(6 downto 0) := (others => '0');
begin

clks <= std_logic_vector(cnt(6 downto 5));

process(clk, rst, enable_clock)
begin
    if rst = '1' then
	     cnt <= (others => '0');
    elsif rising_edge(clk) and enable_clock = '1' then
	     cnt <= cnt + 1;
	 end if;
end process;


end Behavioral;

