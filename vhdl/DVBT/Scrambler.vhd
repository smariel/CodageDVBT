----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:40:33 11/21/2013 
-- Design Name: 
-- Module Name:    Scrambler - Behavioral 
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

entity Scrambler is
    Port ( clk					: in  STD_LOGIC;
           rst					: in  STD_LOGIC;
           ce					: in  STD_LOGIC;
           LFSR_enableOut	: in  STD_LOGIC;
           LFSR_init			: in  STD_LOGIC;
           dataIn				: in  STD_LOGIC;
           dataOut			: out  STD_LOGIC);
end Scrambler;

architecture Behavioral of Scrambler is


signal LFSR_in : std_logic;
signal LFSR_0to1 : std_logic;
signal LFSR_1to2 : std_logic;
signal LFSR_2to3 : std_logic;
signal LFSR_3to4 : std_logic;
signal LFSR_4to5 : std_logic;
signal LFSR_5to6 : std_logic;
signal LFSR_6to7 : std_logic;
signal LFSR_out : std_logic;


begin

	
		
end Behavioral;

