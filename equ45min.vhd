----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Mehdi SLAMA & Mathieu VIAL
-- 
-- Create Date:    08:50:35 02/25/2020 
-- Design Name: 
-- Module Name:    equ45min - Behavioral 
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

entity equ45min is
    Port ( min_dec : in  STD_LOGIC_VECTOR (3 downto 0);
           min_unit : in  STD_LOGIC_VECTOR (3 downto 0);
           equ : out  STD_LOGIC);
end equ45min;

architecture Behavioral of equ45min is

begin
equ <= '1' when (min_dec="0100" and min_unit="0101")
else '0' ;

end Behavioral;

