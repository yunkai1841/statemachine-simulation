library IEEE;
use IEEE.std_logic_1164.ALL;
use WORK.ALL;

entity myor2 is
    port(a, b: in std_logic;
    c: out std_logic);
end myor2;

architecture behave of myor2 is
begin
	process(a, b)
	begin
		if(a = '1' or b = '1') then
			c <= '1';
		elsif (a = '0' and b = '0') then
			c <= '0';
		else
			c <= 'X';
		end if;
	end process;
end behave;