----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:58:53 06/26/2012 
-- Design Name: 
-- Module Name:    fehlerzaehler - Behavioral 
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

entity fehlerzaehler is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           KOR : in  STD_LOGIC;
           RST_AKZEPTOR : out  STD_LOGIC;
           LAST_VER : out  STD_LOGIC);
end fehlerzaehler;

architecture Behavioral of fehlerzaehler is
	type StateT is (v1, k1, v2, k2, v3);
	signal state : StateT := v1;
	signal next_state : StateT;
begin

	process(CLK, RST)
	begin
		if rising_edge(CLK) then
			if RST = '1' then
				state <= v1;
			else
				state <= next_state;
			end if;
		end if;
	end process;

	process(state, KOR)
	begin
		RST_AKZEPTOR <= '0';
		LAST_VER <= '0';
		next_state <= state;
		case state is
			when v1 =>
				if KOR = '1' then
					next_state <= k1;
				end if;
			when k1 =>
				RST_AKZEPTOR <= '1';
				if KOR = '0' then
					next_state <= v2;
				end if;
			when v2 =>
				if KOR = '1' then
					next_state <= k2;
				end if;
			when k2 =>
				RST_AKZEPTOR <= '1';
				if KOR = '0' then
					next_state <= v3;
				end if;
			when v3 =>
				LAST_VER <= '1';
			when others =>
				null;
		end case;
	end process;

end Behavioral;

