----------------------------------------------------------------------------------
-- Company: 
-- Engineer: ABID CHAREF Samy SLAMA Mehdi
-- 
-- Create Date:    08:40:41 02/18/2020 
-- Design Name:  
-- Module Name:    transcoder_3v8 - Behavioral 
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

entity transcoder_3v8 is
    Port ( A : in  STD_LOGIC_VECTOR (2 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end transcoder_3v8;

architecture Behavioral of transcoder_3v8 is


begin
with A select
O <=  "11111110" when "000",
		"11111101" when "001",
		"11111011" when "010",
		"11110111" when "011",
		"11101111" when "100",
		"11011111" when "101",
		"10111111" when "110",
		"01111111" when others;
end Behavioral;

