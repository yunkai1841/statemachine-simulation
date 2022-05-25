LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE WORK.ALL;

ENTITY myand2 IS
	PORT(a, b : IN std_logic;
			c : OUT std_logic);
END myand2;

architecture behave of myand2 is
begin
	process(a, b)
	begin
		if(a = '1' and b = '1') then
			c <= '1';
		elsif (a = '0' or b = '0') then
			c <= '0';
		else
			c <= 'X';
		end if;
	end process;
end behave;