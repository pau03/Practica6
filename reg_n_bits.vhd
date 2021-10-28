library IEEE;
use IEEE.std_logic_1164.all;

entity reg_n_bits is

	 generic 
	 ( 
		DATA_WIDTH : natural := 8
	 );
    port (
        q : out std_logic_vector (DATA_WIDTH-1 downto 0);
        d : in std_logic_vector (DATA_WIDTH-1 downto 0);
        rst, clk : in std_logic
    );
end entity reg_n_bits;


architecture arch_reg_n_bits of reg_n_bits is

begin
		
	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				q <= (others => '0');
			else
				q <= d;
			end if;
		end if;
	end process;
	
end architecture arch_reg_n_bits;