--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:25:00 12/10/2014
-- Design Name:   
-- Module Name:   C:/Users/Rodrigo/Documents/Curso_ICTP/Lab5_Memoria/bllk_mem_tb.vhd
-- Project Name:  Lab5_Memoria
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: blk_mem_gen_v7_3
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
USE ieee.numeric_std.ALL;
 
ENTITY bllk_mem_tb IS
END bllk_mem_tb;
 
ARCHITECTURE behavior OF bllk_mem_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT blk_mem_gen_v7_3
    PORT(
         clka : IN  std_logic;
         addra : IN  std_logic_vector(7 downto 0);
         douta : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clka : std_logic := '0';
   signal addra : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal douta : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clka_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: blk_mem_gen_v7_3 PORT MAP (
          clka => clka,
          addra => addra,
          douta => douta
        );

   -- Clock process definitions
   clka_process :process
   begin
		clka <= '0';
		wait for clka_period/2;
		clka <= '1';
		wait for clka_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      for i in 0 to 90 loop
			addra <= std_logic_vector(to_unsigned(i,8));
			wait for clka_period;
		end loop;

      wait;
   end process;

END;
