-- Quartus Prime VHDL Template
-- Single-Port ROM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoria_rom is

	generic 
	(
		DATA_WIDTH : natural := 8;
		ADDR_WIDTH : natural := 8
	);

	port 
	(
		rst	: in std_logic;
		addr  : in std_logic_vector((ADDR_WIDTH - 1) downto 0);
		q		: out std_logic_vector((DATA_WIDTH -1) downto 0)
	);

end entity memoria_rom;

architecture rtl of memoria_rom is

	-- Build a 2-D array type for the ROM
	type memory_t is array(2**ADDR_WIDTH-1 downto 0) of 
	std_logic_vector((DATA_WIDTH-1) downto 0);

	constant rom : memory_t :=
		(
			0=> b"1110",
			1=> b"1110",
			2=> b"0110",
			3=> b"0111",
			4=> b"1011",
			5=> b"1011",
			6=> b"1100",
			7=> b"1101",
			others=> b"0000"
		);
		

begin
	
	
	--ROM asincrono
	process (rst)
	begin
		if rst = '1' then
			q <= (others => '0');
		else
			q <= rom(to_integer(unsigned(addr)));
		end if;
	end process;
		
end rtl;