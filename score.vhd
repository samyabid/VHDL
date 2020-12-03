----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:26:48 05/31/2020 
-- Design Name: 
-- Module Name:    score - Behavioral 
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

entity score is
    Port ( CE_1ms : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           BPL : in  STD_LOGIC;
           BPreset : in  STD_LOGIC;
           BPV : in  STD_LOGIC;
           loc_unit : out  STD_LOGIC_VECTOR (3 downto 0);
           loc_dec : out  STD_LOGIC_VECTOR (3 downto 0);
           vis_unit : out  STD_LOGIC_VECTOR (3 downto 0);
           vis_dec : out  STD_LOGIC_VECTOR (3 downto 0));
end score;

architecture Behavioral of score is

component register_1b_E
port(   CE : in  std_logic;
        clk : in  std_logic;
		  D : in  std_logic;
        Q : out  std_logic
        );
		  end component; 

component register_1b
port( clk : in std_logic;
		D: in std_logic;
		Q: out std_logic ) ;
		end component; 
		
component counterDec_4b_RE 
port( CE : in std_logic;
		clk : in std_logic;
		R : in std_logic;
		Q : out std_logic_vector(3 downto 0);
		TC : out std_logic ) ;
		end component;
		
signal bpl_r : std_logic;
signal bpl_d : std_logic;
signal bpl_f : std_logic;
signal bpl_fr : std_logic;
signal bpl_inc : std_logic;
signal CE_LOC : std_logic;

signal bpv_r : std_logic;
signal bpv_d : std_logic;
signal bpv_f : std_logic;
signal bpv_fr : std_logic;
signal bpv_inc : std_logic;
signal CE_VIS : std_logic;



begin

U0 : register_1b_E 
PORT MAP ( CE => CE_1ms,
				clk => CLK,
				D => BPL,
				Q => bpl_r );
				

U1: register_1b_E 
PORT MAP (
          CE => CE_1ms,
			 clk => CLK,
          D => bpl_r,
          Q => bpl_d
        );
		  
U2: register_1b 
PORT MAP (
			 clk => CLK,
          D => bpl_d,
          Q => bpl_f
        );
		  
U5: register_1b_E 
PORT MAP (
          CE => CE_1ms,
          D => BPV,
          clk => CLK,
          Q => bpv_r
        );

U6: register_1b_E 
PORT MAP (
          CE => CE_1ms,
			 clk => CLK,
          D => bpv_r,
          Q => bpv_d
        );
		  
U7: register_1b 
PORT MAP (
			 clk => CLK,
          D => bpv_d,
          Q => bpv_f
        );
		  
U10: counterDec_4b_RE 
PORT MAP (
          CE => bpl_inc,
          clk => CLK,
			 R => BPreset,
          Q => loc_unit,
          TC => CE_LOC
        );
	
U11: counterDec_4b_RE 
PORT MAP (
          R => BPreset,
          CE => CE_LOC,
          clk => CLK,
          Q => loc_dec,
          TC => open
        );
	
U12: counterDec_4b_RE 
PORT MAP (
          R => BPreset,
          CE => bpv_inc,
          clk => CLK,
          Q => vis_unit,
          TC => CE_VIS
        );

U13: counterDec_4b_RE 
PORT MAP (
          R => BPreset,
          CE => CE_VIS,
          clk => CLK,
          Q => vis_dec,
          TC => open
			 );

bpl_inc <= bpl_d and bpl_fr;
bpv_inc <= bpv_d and bpv_fr;
bpl_fr <= bpl_d xor bpl_f;
bpv_fr <= bpv_f xor bpv_d;			 


end Behavioral;
