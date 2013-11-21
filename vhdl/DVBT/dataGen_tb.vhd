--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:56:05 11/21/2013
-- Design Name:   
-- Module Name:   /mnt/hgfs/Dev/VHDL/CodageDVBT/vhdl/DVBT/dataGen_tb.vhd
-- Project Name:  DVBT
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dataGen
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
 
ENTITY dataGen_tb IS
END dataGen_tb;
 
ARCHITECTURE behavior OF dataGen_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dataGen
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         enable_clearData : IN  std_logic;
         enable_sync : IN  std_logic;
         enable_parity : IN  std_logic;
         notSync : IN  std_logic;
         dataOut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal enable_clearData : std_logic := '0';
   signal enable_sync : std_logic := '0';
   signal enable_parity : std_logic := '0';
   signal notSync : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dataGen PORT MAP (
          clk => clk,
          rst => rst,
          enable_clearData => enable_clearData,
          enable_sync => enable_sync,
          enable_parity => enable_parity,
          notSync => notSync,
          dataOut => dataOut
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
		rst <= '1';
		enable_clearData <= '0';
		enable_sync <= '0';
		enable_parity <= '0';
		notSync <= '0';
      wait for 25 ns;
		rst <= '0';
		wait for 10 ns;
		
		notSync <= '1';
		enable_clearData <= '0';
		enable_sync <= '1';
		enable_parity <= '0';
		wait for clk_period*8;
		
		enable_clearData <= '1';
		enable_sync <= '0';
		enable_parity <= '0';
		wait for clk_period*8*4;
		
		enable_clearData <= '0';
		enable_sync <= '0';
		enable_parity <= '1';
		wait for clk_period*8*2;
		
		notSync <= '0';
		enable_clearData <= '0';
		enable_sync <= '1';
		enable_parity <= '0';
		wait for clk_period*8;
		

      wait;
   end process;

END;
