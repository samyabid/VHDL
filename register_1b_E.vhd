----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:58 02/25/2020 
-- Design Name: 
-- Module Name:    register_1b_E - Behavioral 
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

entity register_1b_E is
    Port ( CE : in  STD_LOGIC;
           D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end register_1b_E;

architecture Behavioral of register_1b_E is

signal Q_int : STD_LOGIC :='0';

begin
process(clk,CE)
begin
if (rising_edge(clk) and CE ='1') then
	Q <= D;
	
end if;
end process;

end Behavioral;

