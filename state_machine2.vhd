library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity state_machine2 is
	port(x: in std_logic;
		clock : in std_logic;
		reset: in std_logic;
		y0, y1: out std_logic);
end state_machine2;

architecture behave of state_machine2 is

	type states is (st1, st2, st3, st4);
	signal present_state : states;
	signal next_state: states;

begin

	clkd: process(clock, reset)
	begin
		if (reset = '1') then
			present_state <= st1;
		elsif (clock'event and clock = '1') then
			present_state <= next_state;
		end if;
	end process clkd;

	state_trans: process(present_state, x)
	begin
		case present_state is
			when st1 =>
				y0 <= '0';
				y1 <= '0';
				if ( x = '1') then
					next_state <= st2;
				else 
					next_state <= st1;
				end if;
			when st2 =>
				y0 <= '1';
				y1 <= '0';
				next_state <= st3;
			when st3 =>
				y0 <= '1';
				y1 <= '1';
				next_state <= st4;
			when st4 =>
				y0 <= '0';
				y1 <= '1';
				if ( x = '1') then
					next_state <= st4;
				else 
					next_state <= st1;
				end if;
		end case;
	end process state_trans;
end behave;
				