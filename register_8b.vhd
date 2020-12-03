----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:52:48 05/31/2020 
-- Design Name: 
-- Module Name:    register_8b - Behavioral 
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

entity register_8b is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
end register_8b;

architecture Behavioral of register_8b is
signal Q_int : std_logic_vector(7 downto 0) := "00000000";
begin
process (clk)
begin 
	if (rising_edge(clk)) then
	Q_int <= D;
	end if; 
end process; 
Q <= Q_int;


end Behavioral;

