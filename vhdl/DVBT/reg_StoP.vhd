----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:51:41 11/21/2013 
-- Design Name: 
-- Module Name:    reg_StoP - Behavioral 
-- Project Name: 	 DVBT
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

entity reg_StoP is
    Port ( dataIn : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ce : in  STD_LOGIC;
           dataOut : out  STD_LOGIC_VECTOR (7 downto 0));
end reg_StoP;

architecture Behavioral of reg_StoP is

signal inter : std_logic_vector (7 downto 0) :="00000000";

begin

	process (clk, rst) begin
		if (rst = '1') then
			inter <= "00000000";
		elsif (clk'EVENT AND clk='1') then
			if (ce = '1') then
				inter(7 downto 1) <= inter(6 downto 0);
				inter(0) <= dataIn;
			end if;
		end if;
	end process;

	dataOut <= inter;

end Behavioral;

