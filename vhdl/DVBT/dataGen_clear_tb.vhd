--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:04:46 11/21/2013
-- Design Name:   
-- Module Name:   /home/sylvain/Bureau/DVBT/dataGen_clear_tb.vhd
-- Project Name:  DVBT
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dataGen_clear
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
 
ENTITY dataGen_clear_tb IS
END dataGen_clear_tb;
 
ARCHITECTURE behavior OF dataGen_clear_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dataGen_clear
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         clk_enable : IN  std_logic;
         data : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk_enable : std_logic := '0';

 	--Outputs
   signal data : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant clk_enable_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dataGen_clear PORT MAP (
          clk => clk,
          reset => reset,
          clk_enable => clk_enable,
          data => data
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
      reset <= '1';
      wait for 33 ns;
		reset <= '0';
      wait for 10 ns;
		clk_enable <= '1';
		wait for 1000 ns;
		clk_enable <= '0';

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
