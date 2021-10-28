library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity Multiplexor is
	generic (
		TAM_SELECTOR : natural := 3;
		TAM_ENTRADA : natural := 2
	);
	
    port (
        Salida : out std_logic_vector(TAM_ENTRADA-1 downto 0);
        Selector:  in std_logic_vector(TAM_SELECTOR-1 downto 0);
        Entradas : in std_logic_vector((2**TAM_SELECTOR * TAM_ENTRADA)-1 downto 0)
    );
end entity;

architecture archSelEnt of Multiplexor is    
	 constant VALORMAX : natural := (2**TAM_SELECTOR * TAM_ENTRADA)-1;
begin

	process (Selector, Entradas)
	variable dif : natural :=  to_integer(unsigned(Selector)) * TAM_ENTRADA;
	begin
		Salida <= Entradas(VALORMAX-dif downto VALORMAX-dif-(TAM_ENTRADA-1));
	end process;
	
end architecture;