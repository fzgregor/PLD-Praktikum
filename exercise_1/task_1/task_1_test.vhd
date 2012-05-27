--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:32:12 05/27/2012
-- Design Name:   
-- Module Name:   /home/live/workspace/pld/exercise_1/aufgabe_1/task_1_test.vhd
-- Project Name:  aufgabe_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: task_1_top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY task_1_test IS
END task_1_test;
 
ARCHITECTURE behavior OF task_1_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT task_1_top
    PORT(
         segments : OUT  std_logic_vector(7 downto 0);
         anode : OUT  std_logic_vector(3 downto 0);
         switches : IN  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal switches : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal segments : std_logic_vector(7 downto 0);
   signal anode : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace clk below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: task_1_top PORT MAP (
          segments => segments,
          anode => anode,
          switches => switches
        );

--   -- Clock process definitions
--   clk_process :process
--   begin
--		clk <= '0';
--		wait for clk_period/2;
--		clk <= '1';
--		wait for clk_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
		wait for 1 ps;
		switches <= X"0";
		wait for 1 ps;
		assert anode = "1110" and segments = "00000011"
		severity failure;
		wait for 1 ps;
		switches <= x"1";
		wait for 1 ps;
		assert anode = "1110" and segments = "10011111"
		severity failure;
		wait for 1 ps;
		switches <= x"2";
		wait for 1 ps;
		assert anode = "1110" and segments = "00100101"
		severity failure;
		wait for 1 ps;
		switches <= x"3";
		wait for 1 ps;
		assert anode = "1110" and segments = "00001101"
		severity failure;
		wait for 1 ps;
		switches <= x"4";
		wait for 1 ps;
		assert anode = "1110" and segments = "10011001"
		severity failure;
		wait for 1 ps;
		switches <= x"5";
		wait for 1 ps;
		assert anode = "1110" and segments = "01001001"
		severity failure;
		wait for 1 ps;
		switches <= x"6";
		wait for 1 ps;
		assert anode = "1110" and segments = "01000001"
		severity failure;
		wait for 1 ps;
		switches <= x"7";
		wait for 1 ps;
		assert anode = "1110" and segments = "00011111"
		severity failure;
		wait for 1 ps;
		switches <= x"8";
		wait for 1 ps;
		assert anode = "1110" and segments = "00000001"
		severity failure;
		wait for 1 ps;
		switches <= x"9";
		wait for 1 ps;
		assert anode = "1110" and segments = "00001001"
		severity failure;
		wait for 1 ps;
		switches <= x"A";
		wait for 1 ps;
		assert anode = "1110" and segments = "00010001"
		severity failure;
		wait for 1 ps;
		switches <= x"b";
		wait for 1 ps;
		assert anode = "1110" and segments = "11000001"
		severity failure;
		wait for 1 ps;
		switches <= x"C";
		wait for 1 ps;
		assert anode = "1110" and segments = "01100011"
		severity failure;
		wait for 1 ps;
		switches <= x"d";
		wait for 1 ps;
		assert anode = "1110" and segments = "10000101"
		severity failure;
		wait for 1 ps;
		switches <= x"E";
		wait for 1 ps;
		assert anode = "1110" and segments = "01100001"
		severity failure;
		wait for 1 ps;
		switches <= x"F";
		wait for 1 ps;
		assert anode = "1110" and segments = "01110001"
		severity failure;
		wait for 1 ps;
      wait;
   end process;

END;
