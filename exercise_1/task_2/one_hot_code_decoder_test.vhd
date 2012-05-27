--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:37:40 05/27/2012
-- Design Name:   
-- Module Name:   /home/live/workspace/pld/exercise_1/task_2/one_hot_code_test.vhd
-- Project Name:  task_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: one_hot_code
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
 
ENTITY one_hot_code_test IS
END one_hot_code_test;
 
ARCHITECTURE behavior OF one_hot_code_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT one_hot_code_decoder
    PORT(
         binary_code : IN  std_logic_vector(2 downto 0);
         one_hot_code : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal binary_code : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal one_hot_code : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: one_hot_code_decoder PORT MAP (
          binary_code => binary_code,
          one_hot_code => one_hot_code
        );
 

   -- Stimulus process
   stim_proc: process
   begin
      wait for 1 ps;
		binary_code <= "000";
		wait for 1 ps;
		assert one_hot_code = "10000000"
		severity failure;
      wait for 1 ps;
		binary_code <= "001";
		wait for 1 ps;
		assert one_hot_code = "01000000"
		severity failure;
      wait for 1 ps;
		binary_code <= "010";
		wait for 1 ps;
		assert one_hot_code = "00100000"
		severity failure;
      wait for 1 ps;
		binary_code <= "011";
		wait for 1 ps;
		assert one_hot_code = "00010000"
		severity failure;
      wait for 1 ps;
		binary_code <= "100";
		wait for 1 ps;
		assert one_hot_code = "00001000"
		severity failure;
      wait for 1 ps;
		binary_code <= "101";
		wait for 1 ps;
		assert one_hot_code = "00000100"
		severity failure;
      wait for 1 ps;
		binary_code <= "110";
		wait for 1 ps;
		assert one_hot_code = "00000010"
		severity failure;
      wait for 1 ps;
		binary_code <= "111";
		wait for 1 ps;
		assert one_hot_code = "00000001"
		severity failure;
		
      wait;
   end process;

END;
