
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
--use ieee.numeric_std.all;

entity dataGen_sync is
Port (clk		: in  std_logic;
		rst		: in  std_logic;
		ce			: in  std_logic;
		notSync	: in  std_logic;
		dataOut 	: out std_logic);
end dataGen_sync;

architecture Behavioral of dataGen_sync is

constant S 		: std_logic_vector(7 downto 0) := "01000111";
constant notS 	: std_logic_vector(7 downto 0) := "10111000";
signal cpt 		: std_logic_vector(2 downto 0) := "000";

begin


	process (clk, rst) begin
		if (rst = '1') then
			cpt <= "111";
			dataOut <= '0';
		elsif (clk'EVENT AND clk='1') then
			if (ce = '1') then
				cpt <= cpt - 1;
				
				if(notSync = '0') then
					dataOut <= 	S(conv_integer(cpt));
				else
					dataOut <= notS(conv_integer(cpt));
				end if;
			end if;
		end if;
	end process;


	
end Behavioral;

