----------------------------------------------------------------------------------
-- Engineer:    Kai Mueller
-- Create Date: 05/12/2021 10:22:44 PM
-- Module Name: tlctsm_tb - Behavioral
-- Description: tlctsm test bench
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tlctsm_tb is
end tlctsm_tb;

architecture Behavioral of tlctsm_tb is
COMPONENT tlctsm is
	PORT ( reset : in std_logic;
		   clk : in std_logic;
		   start : in std_logic;
		   red : out std_logic;
		   yellow : out std_logic;
		   green : out std_logic );
END COMPONENT tlctsm;

SIGNAL reset : std_logic := '0';
SIGNAL clk : std_logic := '0';
SIGNAL start : std_logic := '0';
SIGNAL red : std_logic := '0';
SIGNAL yellow : std_logic := '0';
SIGNAL green : std_logic := '0';

CONSTANT clk_period : time := 10 ns;

begin

	uut : tlctsm
	PORT MAP ( reset => reset,
			   clk => clk, 
			   start => start,
			   red => red,
			   yellow => yellow, 
			   green => green );
			   
	clk_p : PROCESS
	BEGIN
		clk <= '0';
		wait for clk_period / 2;
		clk <= '1';
		wait for clk_period / 2;	
	END PROCESS clk_p;
	
		stim_p : PROCESS
	BEGIN
		wait for clk_period;
		reset <= '1';
		wait for clk_period;
		reset <= '0';
		wait for clk_period;
		start <= '1';
		wait for clk_period;
		start <= '0';
		wait for clk_period;
		report "tlctsm simulation done.";
		wait;
	END PROCESS stim_p;
	
end Behavioral;
