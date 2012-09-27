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
           clks : out  STD_LOGIC_VECTOR (7 downto 0));
end taktteiler;

architecture Behavioral of taktteiler is
	 signal cnt : unsigned(20 downto 0) := (others => '0');
begin

clks(7) <= cnt(20);
clks(6) <= cnt(19);
clks(5) <= cnt(18);
clks(4) <= cnt(17);
clks(3) <= cnt(16);
clks(2) <= cnt(15);
clks(1) <= cnt(14);
clks(0) <= cnt(13);

process(clk, rst, enable_clock)
begin
    if rising_edge(clk) then
		if rst = '1' then
			cnt <= (others => '0');
	   elsif enable_clock = '1' then
			cnt <= cnt + 1;
		end if;
	 end if;
end process;


end Behavioral;

