----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:36:56 12/08/2014 
-- Design Name: 
-- Module Name:    PWM_mod - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWM_mod is
	generic (
		bus_width : natural := 8
	);
	port (
		clk, rst, load : in std_logic;
		duty_cycle : in std_logic_vector(bus_width-1 downto 0);
		pwm_out : out std_logic
	);
end PWM_mod;

architecture Behavioral of PWM_mod is
	signal cnt, comp_val : unsigned (bus_width-1 downto 0);
begin

	count_proc : process (clk, rst)
	begin
		if (rst = '1') then
			cnt <= to_unsigned(0, bus_width);
		elsif (rising_edge(clk)) then
			if (load = '1') then
				comp_val <= unsigned(duty_cycle);
			else
				cnt <= cnt + 1;
			end if;
		end if;
	end process count_proc;

	pwm_out <= '0' when (cnt < comp_val) else '1';

end Behavioral;

