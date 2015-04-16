--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:01:43 12/09/2014
-- Design Name:   
-- Module Name:   C:/Users/Rodrigo/Documents/Curso_ICTP/Lab5_TX_UART/tx_uart_tb.vhd
-- Project Name:  Lab5_TX_UART
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tx_uart_mod
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
 
ENTITY tx_uart_tb IS
END tx_uart_tb;
 
ARCHITECTURE behavior OF tx_uart_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tx_uart_mod
    PORT(
         data_in : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         en : IN  std_logic;
         data_out : OUT  std_logic;
         ack : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal en : std_logic := '0';

 	--Outputs
   signal data_out : std_logic;
   signal ack : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: tx_uart_mod PORT MAP (
          data_in => data_in,
          clk => clk,
          rst => rst,
          en => en,
          data_out => data_out,
          ack => ack
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
		wait for clk_period;
		rst <= '1';
		wait for clk_period;
		rst <= '0';

		data_in <= x"ab";
		wait for clk_period;

		en <= '1';
		wait for clk_period*2;
		
		en <= '0';
		wait for clk_period*15;
		
		data_in <= x"a5";
		en <= '1';
		wait for clk_period*30;

      wait;
   end process;

END;
