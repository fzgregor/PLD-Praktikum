----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:56:58 06/17/2012 
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
    Port ( btn : in  STD_LOGIC_VECTOR (2 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (4 downto 0));
end akzeptor;

architecture Behavioral of akzeptor is
	type StateT is (st0, st1, st2, st3, st4);
	signal state : StateT := st0;
	signal state_next : StateT;
begin
	clocked_process : process(clk)
	begin
		if rising_edge(clk) then
			state <= state_next;
		end if;
	end process;
	
	state_machine : process(state, btn, rst)
	begin
		state_next <= state;
		if rst = '1' then
			state_next <= st0;
		elsif state = st0 then
			if btn = "001" then
				state_next <= st1;
			elsif btn /= "000" then
				state_next <= st4;
			end if;
		elsif state = st1 then
			if btn = "010" then
				state_next <= st2;
			elsif btn /= "000" then
				state_next <= st4;
			end if;
		elsif state = st2 then
			if btn = "100" then
				state_next <= st3;
			elsif btn /= "000" then
				state_next <= st4;
			end if;
		end if;
	end process;
	
	with state select
		led <= "00000" when st0,
		       "00001" when st1,
				 "00010" when st2,
				 "10011" when st3,
				 "01111" when st4,
				 "11111" when others;

end Behavioral;

