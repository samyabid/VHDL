--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:58:40 02/25/2020
-- Design Name:   
-- Module Name:   C:/CPE_USERS/TPelec_3ETI/ELN2/Groupe_D/chronoscore_phase2/equ45min_tb.vhd
-- Project Name:  chronoscore_phase2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: equ45min
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY equ45min_tb IS
END equ45min_tb;
 
ARCHITECTURE behavior OF equ45min_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT equ45min
    PORT(
         min_dec : IN  std_logic_vector(3 downto 0);
         min_unit : IN  std_logic_vector(3 downto 0);
         equ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal min_dec : std_logic_vector(3 downto 0) := (others => '0');
   signal min_unit : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal equ : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: equ45min PORT MAP (
          min_dec => min_dec,
          min_unit => min_unit,
          equ => equ
        );
min_unit<="0000","0001" after 20ns,"0010" after 40ns,"0011" after 60ns,"0100" after 80ns,"0101" after 100ns,"0110" after 120ns,"0111" after 140ns,"1000" after 160ns,"1001" after 180ns;
min_dec<="0100"; 

   
END;
