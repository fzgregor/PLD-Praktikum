----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:54:53 05/27/2012 
-- Design Name: 
-- Module Name:    task_1_top - Behavioral 
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

entity task_1_top is
    Port ( segments : out  STD_LOGIC_VECTOR (7 downto 0);
           anode : out  STD_LOGIC_VECTOR (3 downto 0);
           switches : in  STD_LOGIC_VECTOR (3 downto 0));
end task_1_top;

architecture Behavioral of task_1_top is

component seg7 is
    Port ( sw : in  STD_LOGIC_VECTOR (3 downto 0);
           seg7_seg : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

for seg7_inst : seg7 use entity work.seg7(case_statement);

begin

    seg7_inst : seg7
	 PORT MAP(
		seg7_seg => segments(7 downto 1),
		sw => switches
	 );
	 
	 segments(0) <= '1';
	 anode <= "1110";


end Behavioral;

