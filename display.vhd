----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:11:45 05/31/2020 
-- Design Name: 
-- Module Name:    display - Behavioral 
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

entity display is
    Port ( CE_1ms : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  CE_1s : in STD_LOGIC;
           data_disp1_R0 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp1_R1 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp1_L0 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp1_L1 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_R0 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_R1 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_L0 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_L1 : in  STD_LOGIC_VECTOR (3 downto 0);
           AN : out  STD_LOGIC_VECTOR (7 downto 0);
           LEDS : out  STD_LOGIC_VECTOR (7 downto 0));
end display;

architecture Behavioral of display is

component counter_3b_E 
PORT ( CE : in std_logic;
		 clk : in std_logic;
		 Q : out std_logic_vector(2 downto 0) ) ;
		 end component;
component transcoder_3v8
PORT ( A : in  STD_LOGIC_VECTOR (2 downto 0);
       O : out  STD_LOGIC_VECTOR (7 downto 0));
		 end component ;
		 
component transcoder_7segs
Port (  A : in  STD_LOGIC_VECTOR (3 downto 0);
           O : out  STD_LOGIC_VECTOR (6 downto 0));
			  end component;
			  
component register_8b 
Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (7 downto 0));
			  end component;

component mux_8x1x4b
Port (  A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC_VECTOR (3 downto 0);
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           E : in  STD_LOGIC_VECTOR (3 downto 0);
           F : in  STD_LOGIC_VECTOR (3 downto 0);
           G : in  STD_LOGIC_VECTOR (3 downto 0);
           H : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           O : out  STD_LOGIC_VECTOR (3 downto 0));
			  end component; 

component mux_8x1x1b
Port (  A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           E : in  STD_LOGIC;
           F : in  STD_LOGIC;
           G : in  STD_LOGIC;
           H : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           O : out  STD_LOGIC );
			  end component;

component Tregister_1b
Port ( T : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC);
			end component;

signal AN_sel : std_logic_vector(2 downto 0) ;
signal AN_T3v8 : std_logic_vector(7 downto 0) ;
signal T1s : std_logic ;
signal DP : std_logic ;
signal segs_data : std_logic_vector(3 downto 0) ;
signal sseg_7 : std_logic_vector(6 downto 0) ; 
signal sseg: std_logic_vector(7 downto 0) ;

begin

U0 : counter_3b_E
PORT MAP ( CE => CE_1ms,
			  clk => CLK,
			  Q => AN_sel); 

U1 : transcoder_3v8
PORT MAP ( A => AN_sel,
			  O => AN_T3v8); 
			  
U2 : register_8b
PORT MAP ( D => AN_T3v8,
			  clk => CLK,
			  Q => AN); 
			  
U3 : Tregister_1b
PORT MAP ( T => CE_1s,
			  clk => CLK,
           Q => T1s); 
			  
U4 : mux_8x1x1b
PORT MAP ( A => '1',
           B => '1',
           C => T1s,
           D => '1',
           E => '1',
           F => '1',
           G => '1',
           H => '1',
           sel => AN_sel,
           O => DP); 
			  
U5 : mux_8x1x4b
PORT MAP ( A => data_disp1_R0, 
           B => data_disp1_R1,
           C => data_disp1_L0,
           D => data_disp1_L1,
           E => data_disp2_R0,
           F => data_disp2_R1,
           G => data_disp2_L0,
           H => data_disp2_L1,
           sel => AN_sel, 
           O => segs_data ); 
			  
U6 : transcoder_7segs
PORT MAP ( A => segs_data,
           O => sseg_7); 
			  
U7 : register_8b
PORT MAP ( D => sseg,
           clk => CLK,
           Q => LEDS); 

sseg <= DP & sseg_7;
			  


end Behavioral;

