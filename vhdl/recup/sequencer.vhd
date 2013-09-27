-------------------------------------------------------
-- Design Name : sequencer
-- File Name   : sequencer.vhd
-- Function    : counter + control signals generation
-- designer    : Camille Leroux - IMS Lab - IPB
-------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity sequencer is
port (
	clk : in std_logic;
	reset : in std_logic;
	-- data generator:
	en_data_generator : out std_logic;
	-- sync byte generator:
	inv_sync_byte : out std_logic;
	sel_data_sync : out std_logic_vector(3 downto 0));
end entity;

architecture rtl of sequencer is

signal bit_counter : std_logic_vector(10 downto 0);
signal byte_counter : std_logic_vector(7 downto 0);
signal packet_counter : std_logic_vector(2 downto 0);

begin

-- counters:
process (clk, reset) begin
	if (reset = '1') then
		bit_counter <= (others => '0');
		byte_counter <= (others => '0');
		packet_counter <= (others => '0');
	elsif (rising_edge(clk)) then
		if(bit_counter=conv_std_logic_vector(2039,11)) then
			bit_counter <= (others => '0');			
		else
			bit_counter <= bit_counter + 1;
		end if;
		
		if (bit_counter = conv_std_logic_vector(2039,11)) then
			packet_counter <= packet_counter + 1;
		end if;
		
		if (byte_counter = conv_std_logic_vector(254,11) and bit_counter(2 downto 0) = "111") then
			byte_counter <= (others => '0');
		elsif(bit_counter(2 downto 0) = "111") then
			byte_counter <= byte_counter + 1;
		end if;
	end if;
end process;

-- data generator:
en_data_generator <= '0' when ((bit_counter >= conv_std_logic_vector(0,11) and bit_counter < conv_std_logic_vector(8,11)) or (bit_counter>conv_std_logic_vector(1503,11))) else '1';

-- sync byte generator:

-- scrambler:

-- bit stuffing:

-- rs encoder:

-- remove bit stuffing:


end architecture;
