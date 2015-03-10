----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:46:57 03/09/2015 
-- Design Name: 
-- Module Name:    semaforo_mod - Behavioral 
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

entity semaforo_mod is
	port (
		clk, rst : in std_logic;
		red, yellow, green : out std_logic
	);
end semaforo_mod;

architecture Behavioral of semaforo_mod is
	-- Declaracion de los tipos enumerados para la FSM
	type fsm_state is (WAIT_RED, WAIT_GREEN, WAIT_YELLOW);
	-- Declaracion para las señales de estado actual y siguiente estado
	signal current_state, next_state : fsm_state;
	
	-- Señal para llevar cuenta de los ciclos en cada estado
	signal count : integer range 0 to 15;
	
	-- Declaraciones de ciclos de reloj para cada estado
	constant RED_CYCLES : integer range 0 to 15 := 5;
	constant YELLOW_CYCLES : integer range 0 to 15 := 2;
	constant GREEN_CYCLES : integer range 0 to 15 := 8;
	
begin

	-- ********************************************************************************
	-- Arquitectura de prueba
	-- ********************************************************************************
	
	red <= '1';
	yellow <= '1';
	green <= '1';	


	-- ********************************************************************************
	-- FSM tipo A (todos los procesos separados y combinacional)
	-- ********************************************************************************

--	-- Logica del estado presente
--	pst_st_logic_a_type : process (clk, rst)
--	begin
--		if (rst = '1') then
--			current_state <= WAIT_RED;
--		elsif (rising_edge(clk)) then
--			current_state <= next_state;
--			
--			-- Lógica del contador
--			if (count = (RED_CYCLES + YELLOW_CYCLES + GREEN_CYCLES)) then
--				count <= 1;
--			else
--				count <= count + 1;
--			end if;
--		end if;
--	end process pst_st_logic_a_type;
--
--	-- Lógica del estado siguiente
--	nxt_st_logic_a_type : process (current_state, count)
--	begin
--		case current_state is
--			when WAIT_RED =>
--				if (count = RED_CYCLES) then
--					next_state <= WAIT_GREEN;
--				else
--					next_state <= WAIT_RED;
--				end if;
--				
--			when WAIT_GREEN =>
--				if (count = (RED_CYCLES + GREEN_CYCLES)) then
--					next_state <= WAIT_YELLOW;
--				else
--					next_state <= WAIT_GREEN;
--				end if;
--				
--			when WAIT_YELLOW =>
--				if (count = (RED_CYCLES + GREEN_CYCLES + YELLOW_CYCLES)) then
--					next_state <= WAIT_RED;
--				else
--					next_state <= WAIT_YELLOW;
--				end if;
--		end case;
--	end process nxt_st_logic_a_type;
--
--	-- Logica de salida
--	output_logic_a_type : process (current_state)
--	begin
--		case current_state is
--			when WAIT_RED =>
--				red <= '1';
--				yellow <= '0';
--				green <= '0';
--			when WAIT_GREEN =>
--				red <= '0';
--				yellow <= '0';
--				green <= '1';
--			when WAIT_YELLOW =>
--				red <= '0';
--				yellow <= '1';
--				green <= '0';				
--		end case;
--	end process output_logic_a_type;
	
	
	-- ********************************************************************************
	-- Logica del estado presente y siguiente, FSM tipo C (procesos de estado actual y 
	-- siguiente separados del proceso de salida)
	-- ********************************************************************************

--	-- Lógica del estado presente y siguiente 
--	st_logic_c_type : process (clk, rst)
--	begin
--		if (rst = '1') then
--			current_state <= WAIT_RED;
--		elsif (rising_edge(clk)) then
--			case current_state is
--				when WAIT_RED =>
--					if (count = RED_CYCLES) then
--						current_state <= WAIT_GREEN;
--						count <= 1;
--					else
--						count <= count + 1;
--					end if;
--					
--				when WAIT_GREEN =>
--					if (count = GREEN_CYCLES) then
--						current_state <= WAIT_YELLOW;
--						count <= 1;
--					else
--						count <= count + 1;
--					end if;
--					
--				when WAIT_YELLOW =>
--					if (count = YELLOW_CYCLES) then
--						current_state <= WAIT_RED;
--						count <= 1;
--					else
--						count <= count + 1;
--					end if;
--			end case;
--		end if;
--	end process st_logic_c_type;
--
--	--	Lógica de salidas
--	output_logic_c_type : process (current_state)
--	begin
--		case current_state is
--			when WAIT_RED =>
--				red <= '1';
--				yellow <= '0';
--				green <= '0';
--			when WAIT_GREEN =>
--				red <= '0';
--				yellow <= '0';
--				green <= '1';
--			when WAIT_YELLOW =>
--				red <= '0';
--				yellow <= '1';
--				green <= '0';				
--		end case;
--	end process output_logic_c_type;


end Behavioral;

