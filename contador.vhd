library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contador is
	generic 
	(
		DATA_WIDTH : natural := 8
	);

    port(
        clk: in std_logic;
        rst: in std_logic;
        load: in std_logic;
        count: out std_logic_vector(DATA_WIDTH-1 downto 0);
        valor: in std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end entity;

architecture rtl of contador is
    signal cuenta : integer range 0 to 2**DATA_WIDTH-1 := 0;

begin
    process(clk,rst)
    begin
        if (rst='1') then
            cuenta <= 0;            
        elsif(rising_edge(clk)) then
            if load = '1' then
                cuenta<= to_integer(unsigned(valor));
            else
                if(cuenta=2**DATA_WIDTH-1) then
                    cuenta <= 0;                
                else    
                    cuenta <= cuenta + 1;
                end if;         
            end if;
        end if;
    end process;
    
    count <= std_logic_vector(to_unsigned(cuenta, DATA_WIDTH));

end architecture;