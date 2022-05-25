library IEEE;
use IEEE.std_logic_1164.ALL;
use WORK.ALL;

entity mydff is
	port(d: in std_logic;
	clock, reset: in std_logic;
	q: out std_logic);
end mydff;

architecture behave of mydff is 
begin
	process(clock, reset)
	begin
		if (reset ='1') then
			q <= '0';
		elsif (clock'event and clock = '1') then
			q <= d;
		end if;
	end process;
end behave;