--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:11:51 12/09/2014
-- Design Name:   
-- Module Name:   C:/Users/Rodrigo/Documents/Curso_ICTP/Lab5_FSM_ejemplo/generador_tb.vhd
-- Project Name:  Lab5_FSM_ejemplo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: generador_mod
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
 
ENTITY generador_tb IS
END generador_tb;
 
ARCHITECTURE behavior OF generador_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT generador_mod
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         z : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal z : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: generador_mod PORT MAP (
          clk => clk,
          rst => rst,
          z => z
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
      rst <= '0';
		wait for clk_period*2;	
		rst <= '1';
		wait for clk_period/3;
		rst <= '0';

      wait for clk_period*4;

		rst <= '1';
		wait for clk_period*2;
		rst <= '0';
		
		wait for clk_period*6;

      wait;
   end process;

END;
