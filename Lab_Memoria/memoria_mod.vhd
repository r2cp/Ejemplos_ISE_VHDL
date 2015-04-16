----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:30:11 12/10/2014 
-- Design Name: 
-- Module Name:    memoria_mod - Behavioral 
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

entity memoria_mod is
	generic (
		addr_length :  natural := 8
	);
	port (
		clk : in std_logic;
		address : in std_logic_vector(addr_length-1 downto 0);
		data_out : out std_logic_vector(7 downto 0)
	);
end memoria_mod;

architecture Behavioral of memoria_mod is

	type t_string is array (natural range <>) of character;

	constant mem_size : natural := 2**addr_length;
	subtype mem_char is  std_logic_vector(7 downto 0);
	type mem_type is array (mem_size-1 downto 0) of mem_char;

--	attribute rom_style : string;
--	attribute rom_style of data_out : signal is "block";
	
	function llenarMemoria (string_mem : t_string) return mem_type is
		variable full_mem : mem_type;
	begin
		for i in string_mem'range loop
			full_mem(i) := std_logic_vector(to_unsigned(character'pos(string_mem(i)),8));
		end loop;
		return full_mem;
	end llenarMemoria;
	
	constant msj1 : t_string := "Laboratorio: Completado por Rodrigo Chang"; -- 41, 0-40
	constant msj2 : t_string := "ICTP 2014 Costa Rica"; -- 20, 41-60
	constant msj3 : t_string := "¡Guatemala!"; -- 11, 61-71
	constant msj4 : t_string := "Digilent Nexys 2"; -- 16, 72-87
	
	constant mem : mem_type := llenarMemoria(msj1 & msj2 & msj3 & msj4);

begin

	ret_proc : process (clk) 
	begin
		if (rising_edge(clk)) then
			data_out <= mem(to_integer(unsigned(address)));
		end if;
	end process ret_proc;

end Behavioral;

