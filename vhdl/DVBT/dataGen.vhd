----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:05:37 11/21/2013 
-- Design Name: 
-- Module Name:    dataGen - Behavioral 
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

entity dataGen is
    Port ( clk						: in  STD_LOGIC;
           rst						: in  STD_LOGIC;
           enable_clearData	: in  STD_LOGIC;
           enable_sync			: in  STD_LOGIC;
           enable_parity		: in  STD_LOGIC;
			  notSync				: in  STD_LOGIC;
           dataOut				: out STD_LOGIC);
end dataGen;

architecture Behavioral of dataGen is

component dataGen_clear is
port (
	clk			: in  std_logic;
	reset			: in  std_logic;
	clk_enable	: in  std_logic;
	data			: out std_logic);
end component;

component dataGen_sync is
port (
	clk		: in  std_logic;
	rst		: in  std_logic;
	ce			: in  std_logic;
	notSync	: in  std_logic;
	dataOut	: out std_logic);
end component;


signal	data_clear:		std_logic;
signal	data_sync:		std_logic;

constant	data_parity:	std_logic := '0';

begin

	dataOut <=	data_clear	WHEN enable_clearData = '1' ELSE
					data_sync	WHEN enable_sync = '1' ELSE
					data_parity	WHEN enable_parity = '1' ELSE
					'0';

	gen_clear: dataGen_clear port map (
		clk			=> clk,
		reset			=> rst,
		clk_enable	=> enable_clearData,
		data			=> data_clear
	);	
	
	gen_sync: dataGen_sync port map (
		clk		=> clk,
		rst		=> rst,
		ce			=> enable_sync,
		notSync	=> notSync,
		dataOut	=> data_sync
	);
	
	

end Behavioral;

