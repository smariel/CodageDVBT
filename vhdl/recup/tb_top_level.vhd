--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:24:24 05/24/2012
-- Design Name:   
-- Module Name:   /home/cleroux/work/enseignement/ENSEIRB/2011-2012/SEE/EN3x8/TP/ISE/DVB-T-transmitter/tb_sequencer.vhd
-- Project Name:  DVB-T-transmitter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_level
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
 
ENTITY tb_top_level IS
END tb_top_level;
 
ARCHITECTURE behavior OF tb_top_level IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
component top_level is
port (
	clk : in std_logic;
	reset : in std_logic);
end component;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_level PORT MAP (
          clk => clk,
          reset => reset
        );

	clk <= not clk after 10 ns;
	reset <= '1', '0' after 112 ns;

END;
