----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:52:32 12/09/2014 
-- Design Name: 
-- Module Name:    generador_mod - Behavioral 
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

entity generador_mod is
	port (
		clk, rst : in std_logic;
		z : out std_logic_vector(1 downto 0)
	);
end generador_mod;

architecture Behavioral of generador_mod is

type fsm_state is (idle, active, inactive);
signal current_state : fsm_state;

begin

	present_state_logic : process (clk, rst)
	begin
		if (rst = '1') then
			current_state <= idle;
		elsif (rising_edge(clk)) then
			case current_state is
				when idle =>
					current_state <= active;
				when active =>
					current_state <= inactive;
				when inactive =>
					current_state <= active;
			end case;
		end if;
	end process present_state_logic;
	
	output_logic : process (current_state)
	begin
		case current_state is
			when idle => z <= "00";
			when active => z <= "01";
			when inactive => z <= "11";
		end case;
	end process output_logic;
	
--	next_state_logic : process (

end Behavioral;

