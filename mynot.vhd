library IEEE;
use IEEE.std_logic_1164.ALL;
use WORK.ALL;

entity mynot is
    port(a: in std_logic;
    b: out std_logic);
end mynot;

architecture behave of mynot is
begin
	process(a)
	begin
		if(a = '1') then
			b <= '0';
		elsif (a = '0') then
			b <= '1';
		else
			b <= 'X';
		end if;
	end process;
end behave;