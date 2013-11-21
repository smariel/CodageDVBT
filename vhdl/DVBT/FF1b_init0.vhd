----------------------------------------------------------------------------------
-- Company: ENSEIRB-MATMECA
-- Engineer: Sylvain MARIEL (sylvain.mariel@otmax.fr)
-- Engineer: Thomas MOREAU  (thomas.moreau-33@hotmail.fr)

-- Create Date:    21/05/2013 
-- Design Name: 
-- Module Name:    FF1bit - Behavioral 
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

entity FF1b_init0 is
	Port (	CLK		: in	STD_LOGIC;	-- Horloge
				RST		: in	STD_LOGIC;	-- Reset asynchrone du composant
				CE			: in  STD_LOGIC;	-- Clock Enable, actication du composant
				Init		: in	STD_LOGIC;	-- Init, initialisation synchrone
				Load		: in  STD_LOGIC;	-- Chargement de la valeur d'entre
				Data_In	: in	STD_LOGIC;	-- Valeur d'entre
				Data_Out	: out	STD_LOGIC);	-- Valeur de sortie
end FF1b_init0;

architecture Behavioral of FF1b_init0 is

begin

	process (CLK,RST)
	begin
		
		if (RST = '1') then
			Data_Out <= '0';
			
		elsif (CLK'event AND CLK = '1') then
			if (CE = '1') then
			
				if (Init = '1') then
					Data_Out <= '0';
					
				elsif (Load = '1') then
					Data_Out <= Data_In;
					
				end if;
				
			end if;
			
		end if;
		
	end process;

end Behavioral;

