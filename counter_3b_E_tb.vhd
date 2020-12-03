--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:23:58 06/01/2020
-- Design Name:   
-- Module Name:   C:/Users/samya/Documents/ELN2/chronoscore_phase1/counter_3b_E_tb.vhd
-- Project Name:  chronoscore_phase1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter_3b_E
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
 
ENTITY counter_3b_E_tb IS
END counter_3b_E_tb;
 
ARCHITECTURE behavior OF counter_3b_E_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_3b_E
    PORT(
         CE : IN  std_logic;
         clk : IN  std_logic;
         Q : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CE : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_3b_E PORT MAP (
          CE => CE,
          clk => clk,
          Q => Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

CE <= '1', '0' after 60 ns, '1' after 100 ns;

END;
