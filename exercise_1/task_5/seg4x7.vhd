----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:39:38 05/30/2012 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seg4x7 is
	Port ( clk : in  STD_LOGIC;
			 value : in STD_LOGIC_VECTOR (15 downto 0);
			 seg7_sg : out STD_LOGIC_VECTOR (6 downto 0);
			 seg7_an : out STD_LOGIC_VECTOR(3 downto 0));
end seg4x7;

architecture Behavioral of seg4x7 is

	component one_hot_code is
    Port ( binary_code : in  STD_LOGIC_VECTOR (1 downto 0);
           one_hot_code : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component taktteiler is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           enable_clock : in  STD_LOGIC;
           clks : out  STD_LOGIC_VECTOR (1 downto 0));
	end component;
	
	component seg7 is
    Port ( sw : in  STD_LOGIC_VECTOR (3 downto 0);
           seg7_seg : out  STD_LOGIC_VECTOR (6 downto 0));
	end component;

	signal clks_TO_binary_code : STD_LOGIC_VECTOR(1 downto 0);
	signal sw_in : STD_LOGIC_VECTOR(3 downto 0);
	signal seg7_an_neg : STD_LOGIC_VECTOR(3 downto 0);

begin

one_hot_code_inst : one_hot_code
	port map (binary_code => clks_TO_binary_code,
				 one_hot_code => seg7_an_neg);
				 
taktteiler_inst : taktteiler
	port map (clk => clk,
				 rst => '0',
				 enable_clock => '1',
				 clks => clks_TO_binary_code);

seg7_inst : seg7
	port map (sw => sw_in,
				 seg7_seg => seg7_sg);
				 
with clks_TO_binary_code select
	sw_in <= value(3 downto 0) when "00",
				value(7 downto 4) when "01",
				value(11 downto 8) when "10",
				value(15 downto 12) when "11",
				"----" when others;
				
seg7_an <= not seg7_an_neg;


end Behavioral;

