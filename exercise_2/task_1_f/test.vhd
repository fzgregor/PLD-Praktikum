--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:32:05 06/17/2012
-- Design Name:   
-- Module Name:   /home/live/workspace/pld/exercise_2/task_1/test.vhd
-- Project Name:  task_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: state_machine
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
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal btn : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal led : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.state_machine PORT MAP (
          clk => clk,
          rst => rst,
          btn => btn,
          led => led
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin

      wait for clk_period;
		btn <= "001";
      wait for clk_period;
		assert led = "001";
		rst <= '1';
      wait for clk_period;
		assert led = "000";
		rst <= '0';
		btn <= "010";
      wait for clk_period;
		assert led = "010";
		btn <= "111";
		wait for clk_period;
		assert led = "010";
		btn <= "100";
		wait for clk_period;
		assert led = "100";


      wait;
   end process;

END;
