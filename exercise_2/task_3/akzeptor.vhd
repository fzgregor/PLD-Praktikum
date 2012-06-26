----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:07:24 06/26/2012 
-- Design Name: 
-- Module Name:    akzeptor - Behavioral 
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

entity akzeptor is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           BTN : in  STD_LOGIC_VECTOR (4 downto 0);
           OFFEN : out  STD_LOGIC;
           LOCKED : out  STD_LOGIC);
end akzeptor;

architecture Behavioral of akzeptor is
	type StateT is (start, st1, st2, st3, st4, openS, lockedS);
	signal state : StateT := start;
	signal next_state : StateT;
	signal BTN_BUFFERED : STD_LOGIC_VECTOR(4 downto 0);
begin
	process (CLK, RST, BTN)
	begin
		if rising_edge(CLK) then
			if RST = '1' then
				state <= start;
				BTN_BUFFERED <= "00000";
			else
				if BTN /= "00000" then
					BTN_BUFFERED <= BTN_BUFFERED or BTN;
				else
					state <= next_state;
					BTN_BUFFERED <= "00000";
				end if;
			end if;
		end if;
	end process;
	
	process (state, BTN_BUFFERED)
	begin
		next_state <= state;
		OFFEN <= '0';
		LOCKED <= '0';
		case state is
			when start =>
				if BTN_BUFFERED = "00001" then
					next_state <= st1;
				elsif BTN_BUFFERED /= "00000" then
					next_state <= lockedS;
				end if;
			when st1 =>
				if BTN_BUFFERED = "00010" then
					next_state <= st2;
				elsif BTN_BUFFERED /= "00000" then
					next_state <= lockedS;
				end if;
			when st2 =>
				if BTN_BUFFERED = "00100" then
					next_state <= st3;
				elsif BTN_BUFFERED /= "00000" then
					next_state <= lockedS;
				end if;
			when st3 =>
				if BTN_BUFFERED = "01000" then
					next_state <= st4;
				elsif BTN_BUFFERED /= "00000" then
					next_state <= lockedS;
				end if;
			when st4 =>
				if BTN_BUFFERED = "10000" then
					next_state <= openS;
				elsif BTN_BUFFERED /= "00000" then
					next_state <= lockedS;
				end if;
			when openS =>
				OFFEN <= '1';
			when lockedS =>
				LOCKED <= '1';
			when others =>
				null;
		end case;
	end process;


end Behavioral;

