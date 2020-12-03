--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:44:23 06/03/2020
-- Design Name:   
-- Module Name:   C:/Users/samya/Documents/ELN2/chronoscore_phase2/score_tb.vhd
-- Project Name:  chronoscore_phase2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: score
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
 
ENTITY score_tb IS
END score_tb;
 
ARCHITECTURE behavior OF score_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT score
    PORT(
         CE_1ms : IN  std_logic;
         CLK : IN  std_logic;
         BPL : IN  std_logic;
         BPreset : IN  std_logic;
         BPV : IN  std_logic;
         loc_unit : OUT  std_logic_vector(3 downto 0);
         loc_dec : OUT  std_logic_vector(3 downto 0);
         vis_unit : OUT  std_logic_vector(3 downto 0);
         vis_dec : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CE_1ms : std_logic := '0';
   signal CLK : std_logic := '0';
   signal BPL : std_logic := '0';
   signal BPreset : std_logic := '0';
   signal BPV : std_logic := '0';

 	--Outputs
   signal loc_unit : std_logic_vector(3 downto 0);
   signal loc_dec : std_logic_vector(3 downto 0);
   signal vis_unit : std_logic_vector(3 downto 0);
   signal vis_dec : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	constant CE_1ms_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: score PORT MAP (
          CE_1ms => CE_1ms,
          CLK => CLK,
          BPL => BPL,
          BPreset => BPreset,
          BPV => BPV,
          loc_unit => loc_unit,
          loc_dec => loc_dec,
          vis_unit => vis_unit,
          vis_dec => vis_dec
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
	
	CE_1ms_process :process 
	begin
		CE_1ms <= '0';
		wait for 90 ns;
		CE_1ms <= '1';
		wait for 10 ns;
	end process;	
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;
	
--BPV <= '0','1' after 60 ns , '0' after 120 ns, '1' after 180 ns, '0' after 280 ns, '1' after 300 ns, '0' after 400 ns ;
--BPreset <= '0';	
--BPL <= '0';

--BPL <= '0','1' after 60 ns , '0' after 90 ns, '1' after 290 ns, '0' after 320 ns, '1' after 520 ns, '0' after 550 ns, '1' after 750 ns , '0' after 780 ns , '1' after 980 ns , '0' after 1010 ns, '1' after 1210 ns , '0' after 1230 ns, '1' after 1430 ns , '0' after 1460 ns , '1' after 1660 ns , '0' after 1690 ns, '1' after 1890 ns , '0' after 1920 ns , '1' after 2120 ns , '0' after 2150 ns , '1' after 2350 ns , '0' after 2380 ns, '1' after 2580 ns , '0' after 2610 ns 
--,'1' after 2810 ns ;
--BPreset <= '0';	
--BPV <= '0','1' after 60 ns , '0' after 90 ns, '1' after 290 ns, '0' after 320 ns, '1' after 520 ns, '0' after 550 ns, '1' after 750 ns , '0' after 780 ns , '1' after 980 ns , '0' after 1010 ns, '1' after 1210 ns , '0' after 1230 ns, '1' after 1430 ns , '0' after 1460 ns , '1' after 1660 ns , '0' after 1690 ns, '1' after 1890 ns , '0' after 1920 ns , '1' after 2120 ns , '0' after 2150 ns , '1' after 2350 ns , '0' after 2380 ns, '1' after 2580 ns , '0' after 2610 ns 
--,'1' after 2810 ns , '0' after 2830 ns , '1' after 3030 ns , '0' after 3060 ns , '1' after 3260 ns  , '0' after 3290 ns , '1' after 4190 ns;
--
BPL <= '0','1' after 100 ns , '0' after 200 ns , '1' after 300 ns, '0' after 400 ns , '1' after 500 ns , '0' after 600 ns , 
'1' after 700 ns , '0' after 800 ns , '1' after 900 ns , '0' after 1000 ns , '1' after 1100 ns , '0' after 1200 ns ,
'1' after 1300 ns , '0' after 1400 ns , '1' after 1500 ns , '0' after 1600 ns , '1' after 1700 ns , '0' after 1800 ns,
'1' after 1900 ns , '0' after 2000 ns , '1' after 2100 ns , '0' after 2200 ns ; 
BPreset <= '0' ,'1' after 2500 ns;	
BPV <= '0'; 
END;
