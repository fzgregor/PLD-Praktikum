----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:47:31 06/05/2012 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( clk : in  STD_LOGIC;
           seg7_sg : out  STD_LOGIC_VECTOR (7 downto 0);
           seg7_an : out  STD_LOGIC_VECTOR (3 downto 0);
           switches : in  STD_LOGIC_VECTOR (7 downto 0);
				 leds : out STD_LOGIC_VECTOR(7 downto 0));
end top;

architecture Behavioral of top is
	component seg4x7 is
		Port ( clk : in  STD_LOGIC;
				 value : in STD_LOGIC_VECTOR (15 downto 0);
				 seg7_sg : out STD_LOGIC_VECTOR (6 downto 0);
				 seg7_an : out STD_LOGIC_VECTOR(3 downto 0));
	end component;
	signal value : STD_LOGIC_VECTOR (15 downto 0);
	signal cnt : unsigned(31 downto 0) := (others => '0');
begin
leds <= (others => '0');

seg4x7_inst : seg4x7
	port map (clk => clk,
				 seg7_sg => seg7_sg(7 downto 1),
				 seg7_an => seg7_an,
				 value => value);
				 
seg7_sg(0) <= '1';

process (clk, switches)
begin
   if switches(0) = '1' then
		cnt <= (others => '0');
	elsif rising_edge(clk) and switches(1) = '1' then
		cnt <= cnt + 1;
	end if;
end process;

--value <= x"12ef";
--value <=	not switches & switches;
value <= std_logic_vector(cnt(31 downto 16));
				


end Behavioral;

