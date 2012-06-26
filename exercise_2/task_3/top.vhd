----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:44:30 06/26/2012 
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

entity top is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           KOR : in  STD_LOGIC;
           BTN : in  STD_LOGIC_VECTOR (4 downto 0);
           RDY : out  STD_LOGIC;
           OFFEN : out  STD_LOGIC;
			  LED : out STD_LOGIC_VECTOR (5 downto 0)
			);
end top;

architecture Behavioral of top is
   -- component connection signals
	signal RST_AKZEPTOR_OUT : STD_LOGIC;
	signal RST_AKZEPTOR_IN : STD_LOGIC;
	signal LAST_VER : STD_LOGIC;
	signal AKZ_LOCKED : STD_LOGIC;
	signal OFFEN_TMP : STD_LOGIC;

begin
	fehlerzaehler_inst : entity work.fehlerzaehler PORT MAP (
			CLK => CLK,
			RST => RST,
			KOR => KOR,
			RST_AKZEPTOR => RST_AKZEPTOR_OUT,
			LAST_VER => LAST_VER);
	akzeptor_inst : entity work.akzeptor PORT MAP (
			CLK => CLK,
			RST => RST_AKZEPTOR_IN,
			BTN => BTN,
			OFFEN => OFFEN_TMP,
			LOCKED => AKZ_LOCKED);
	
	RDY <= not (AKZ_LOCKED and LAST_VER);
	LED <= (others => '0');
	RST_AKZEPTOR_IN <= (RST_AKZEPTOR_OUT and not OFFEN_TMP) or RST;
	OFFEN <= OFFEN_TMP;
end Behavioral;

