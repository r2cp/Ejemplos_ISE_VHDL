----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:44:05 12/09/2014 
-- Design Name: 
-- Module Name:    tx_uart_mod - Behavioral 
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

entity tx_uart_mod is
	generic (
		data_width : positive := 8
	);
	port (
		data_in : in std_logic_vector(data_width-1 downto 0);
		clk, rst : in std_logic;
		-- enable y acknowledge
		en : in std_logic;
		data_out, ack : out std_logic
	);
end tx_uart_mod;

architecture Behavioral of tx_uart_mod is
	-- Definicion de constantes
	constant START_BIT : std_logic := '0';
	constant STOP_BIT : std_logic := '1';
	constant IDLE_BIT : std_logic := '1';
	
	constant LAST_BIT : integer range 0 to 15 := data_width-1;
	
	-- Definiciones de la maquina de estados
	type fsm_state is (IDLE, START, DATA, PARITY, STOP);
	signal state, next_state : fsm_state;
	
	-- Señal para contar el bit a enviar
	signal cnt : integer range 0 to 15;
	
	-- Definicion de funciones
	function parity_calc (D : std_logic_vector) return std_logic is
		variable result : std_logic := '0';
	begin
		for i in D'range loop
			result := result xor D(i);
		end loop;
		return result;
	end parity_calc;
	
begin

	-- Lógica del estado presente
	pst_st_logic : process (clk, rst)
	begin
		if (rst = '1') then
			state <= IDLE;
		elsif (rising_edge(clk)) then
			state <= next_state;
		end if;
	end process pst_st_logic;
	
	
	-- Lógica del estado siguiente
	nxt_st_logic : process (state, en, cnt)
	begin
		case state is
			when IDLE =>
				if (en = '1') then
					next_state <= START;
				else
					next_state <= IDLE;
				end if;
			
			when START =>
				next_state <= DATA;
				
			when DATA =>
				if (cnt = LAST_BIT) then
					next_state <= PARITY;
				else
					next_state <= DATA;
				end if;
			
			when PARITY =>
				next_state <= STOP;
				
			when STOP =>
				next_state <= IDLE;
				
		end case;
	end process nxt_st_logic;


	-- Maquina tipo E - Todos los procesos separados y salida secuencial
	-- Lógica de salida secuencial para cada estado
	out_logic : process (clk)
	begin
		if (rising_edge(clk)) then
			case state is 
				when IDLE => 
					data_out <= IDLE_BIT;
					ack <= '1';
					cnt <= 0;
				
				when START => 
					data_out <= START_BIT;
					ack <= '0';
				
				when DATA => 
					data_out <= data_in(cnt);
					ack <= '0';
					cnt <= cnt + 1;
				
				when PARITY => 
					data_out <= parity_calc(data_in);
					ack <= '0';
					
				when STOP => 
					ack <= '0';
					data_out <= STOP_BIT;
			end case;
		end if;
	end process out_logic;
	
	-- Máquina tipo A - Todos los procesos separados y la salida combinacional
	-- Lógica de salida secuencial para cada estado
--	out_logic : process (state)
--	begin
--		case state is 
--			when IDLE => 
--				data_out <= IDLE_BIT;
--				ack <= '0';
--				cnt <= 0;
--			
--			when START => 
--				data_out <= START_BIT;
--			
--			when DATA => 
--				data_out <= data_in(cnt);
--				cnt <= cnt + 1;
--			
--			when PARITY => 
--				data_out <= '1';
--			
--			when STOP => 
--				ack <= '1';
--				data_out <= STOP_BIT;
--		end case;
--	end process out_logic;

end Behavioral;

