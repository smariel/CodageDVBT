-------------------------------------------------------
-- Design Name : top_level
-- File Name   : top_level.vhd
-- Function    : top_level of the DVB-T transmitter
-- designer    : Camille Leroux - IMS Lab - IPB
-------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity top_level is
port (
	clk : in std_logic;
	reset : in std_logic);
end entity;

architecture rtl of top_level is


signal en_data_generator, raw_data, inv_sync_byte, out_mux_data : std_logic;

signal sel_data_sync : std_logic_vector(3 downto 0);

signal en_data_generator, raw_data, inv_sync_byte, out_mux_data, en_scrambler, en_output_scrambler, init_scrambler, sel_bit_stuff, rs_enc_input_data_valid, rs_enc_input_last_data, rmv_bit_stuffing : std_logic;

begin

i_data_gen : entity work.data_generator port map(	clk,
																	reset,
																	en_data_generator,
																	raw_data);

sync_byte_insert : entity work.sync_byte_generator port map (	raw_data,
																					sel_data_sync,
																					inv_sync_byte,
																					out_mux_data);


i_sequencer : entity work.sequencer port map(	clk,
																reset,
																en_data_generator,
																inv_sync_byte,
																sel_data_sync,
																en_scrambler,
																en_output_scrambler,
																init_scrambler,
																sel_bit_stuff,
																rs_enc_input_data_valid,
																rs_enc_input_last_data,
																rmv_bit_stuffing);
							
end architecture;

