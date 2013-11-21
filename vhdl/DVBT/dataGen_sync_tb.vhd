--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:53:11 11/21/2013
-- Design Name:   
-- Module Name:   C:/Users/Thomas/Desktop/Vhdl/Sync_Data_Generator/dataGen_sync_tb.vhd
-- Project Name:  Sync_Data_Generator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dataGen_sync
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
--use IEEE.std_logic_arith.all;
--use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY dataGen_sync_tb IS
END dataGen_sync_tb;
 
ARCHITECTURE behavior OF dataGen_sync_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dataGen_sync
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ce : IN  std_logic;
         notSync : IN  std_logic;
         dataOut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ce : std_logic := '0';
   signal notSync : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dataGen_sync PORT MAP (
          clk => clk,
          rst => rst,
          ce => ce,
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
		ce <='1';
		rst <='1';
      wait for 10 ns;	
		rst <='0';      
      wait for 400 ns;	
		notSync <='1';

      -- insert stimulus here 

      wait;
   end process;

END;
