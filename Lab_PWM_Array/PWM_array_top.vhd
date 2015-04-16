----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:53:36 12/09/2014 
-- Design Name: 
-- Module Name:    PWM_array_top - Behavioral 
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

-- Usar el paquete 
use work.pwm_pack.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
	
entity PWM_array_top is
	generic ( bus_width : positive := 8 );
	port (
		clk, rst : in std_logic;
		duty_cycle : in std_logic_vector(bus_width-1 downto 0);
		-- Entradas y salidas para PWM
		load : in std_logic_vector (2 downto 0);
		pwm_out : out std_logic_vector (2 downto 0);
		-- Status
		led_status : out std_logic
	);
end PWM_array_top;

architecture Behavioral of PWM_array_top is

begin

	-- Instanciar los componentes de PWM
	for_pwm : for i in 0 to 2 generate
	begin
		PWM : PWM_mod 
			generic map ( 
				bus_width => 8 
			)
			port map (
				clk => clk, 
				rst => rst,
				load => load(i),
				duty_cycle => duty_cycle,
				pwm_out => pwm_out(i)
			);
	end generate for_pwm;
	
	led_status <= '1';

end Behavioral;

