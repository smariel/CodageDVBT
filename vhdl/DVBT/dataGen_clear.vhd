-------------------------------------------------------
-- Design Name : dataGen_clear
-- File Name   : dataGen_clear.vhd
-- Function    : Linear feedback shift register
-- designer    : Camille Leroux - IMS Lab - IPB
-------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity dataGen_clear is
port (
	clk : in std_logic;
	reset : in std_logic;
	clk_enable : in  std_logic;
	data : out std_logic);
end entity;

architecture rtl of dataGen_clear is

--signal count : std_logic_vector (15 downto 0);
--signal linear_feedback : std_logic;
signal bit_count : std_logic_vector(2 downto 0);
signal byte : std_logic_vector(7 downto 0);

begin

--linear_feedback <= (count(15) xor count(13) xor count(12) xor count(10));
--
--process (clk, reset) begin
--	if (reset = '1') then
--		count <= "1000011100110101";
--	elsif (rising_edge(clk)) then
--		if (enable = '1') then
--			count <= (count(14 downto 0) & linear_feedback);
--		end if;
--	end if;
--end process;

--data_out <= count(15);

process (clk, reset) begin
	if (reset = '1') then
		byte <= (others => '0');
		bit_count <= (others => '0');
	elsif (rising_edge(clk)) then
		if (clk_enable = '1' and bit_count= "111") then
			byte <= byte + 1;
		end if;
		if(clk_enable = '1') then
			bit_count <= bit_count +1;
			data <= byte(conv_integer(not(bit_count)));
		end if;
	end if;
end process;



end architecture;