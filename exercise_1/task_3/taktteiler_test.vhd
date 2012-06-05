--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:25:15 05/27/2012
-- Design Name:   
-- Module Name:   /home/live/workspace/pld/exercise_1/task_3/taktteiler_test.vhd
-- Project Name:  task_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: taktteiler
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
 
ENTITY taktteiler_test IS
END taktteiler_test;
 
ARCHITECTURE behavior OF taktteiler_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
--    COMPONENT taktteiler
--    PORT(
--         clk : IN  std_logic;
--         rst : IN  std_logic;
--         enable_clock : IN  std_logic;
--         clks : OUT  std_logic_vector(7 downto 0)
--        );
--    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal enable : std_logic := '1';

 	--Outputs
   signal clks : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.taktteiler PORT MAP (
          clk => clk,
          rst => rst,
          enable_clock => enable,
          clks => clks
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		
		rst <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
