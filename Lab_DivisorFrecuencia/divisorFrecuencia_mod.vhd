----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:32:05 12/08/2014 
-- Design Name: 
-- Module Name:    divisorFrecuencia_mod - Behavioral 
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

entity divisorFrecuencia_mod is
	generic (
		noCiclos : integer := 3
	);
	port (
		clk, rst : in std_logic;
		clk_out : out std_logic
	);
end divisorFrecuencia_mod;

architecture Behavioral of divisorFrecuencia_mod is
	signal cnt : integer;
	signal c : std_logic;
begin

	count_proc : process (clk, rst) 
	begin
		if (rst = '0') then
			cnt <= 0;
			c <= '0';
		elsif rising_edge(clk) then
			if (cnt = noCiclos-1) then
				cnt <= 0;
				c <= not c;
			else
				cnt <= cnt + 1;
			end if;
		end if;
	end process count_proc;
	
--	clk_out <= '0' when (cnt < noCiclos/2) else '1';
	clk_out <= c;

end Behavioral;

