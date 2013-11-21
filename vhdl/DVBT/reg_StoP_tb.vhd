--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:09:34 11/21/2013
-- Design Name:   
-- Module Name:   C:/Users/Thomas/Desktop/Vhdl/reg_StoP/reg_StoP_tb.vhd
-- Project Name:  reg_StoP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg_StoP
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
 
ENTITY reg_StoP_tb IS
END reg_StoP_tb;
 
ARCHITECTURE behavior OF reg_StoP_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_StoP
    PORT(
         dataIn : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         ce : IN  std_logic;
         dataOut : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dataIn : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ce : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_StoP PORT MAP (
          dataIn => dataIn,
          clk => clk,
          rst => rst,
          ce => ce,
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
      rst <='1';
		ce <='1';
		wait for 10 ns;	
		rst <='0';

      wait for 10 ns;	
		dataIn <='1';
		wait for 10 ns;	
		dataIn <='0';
		wait for 10 ns;	
		dataIn <='1';
		wait for 10 ns;	
		dataIn <='0';
		wait for 10 ns;	
		dataIn <='1';
		wait for 10 ns;	
		dataIn <='0';
		wait for 10 ns;	
		dataIn <='1';
		wait for 10 ns;	
		dataIn <='0';
		wait for 10 ns;	
		dataIn <='0';
		wait for 10 ns;	
		dataIn <='0';
		wait for 10 ns;	
		dataIn <='0';
		wait for 10 ns;	
		dataIn<='0';
		wait for 10 ns;	
		dataIn<='1';
		wait for 10 ns;	
		dataIn<='1';
		wait for 10 ns;	
		dataIn<='1';
		wait for 10 ns;	
		dataIn<='1';


      -- insert stimulus here 

      wait;
   end process;

END;
