LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE WORK.ALL;
ENTITY state_machine3_test IS
END state_machine3_test;
ARCHITECTURE state_machine3_test_bench OF state_machine3_test IS
    COMPONENT state_machine3
    PORT(x0, x1 : IN std_logic;
    clock : IN std_logic;
    reset : IN std_logic;
    y0, y1 : OUT std_logic);
    END COMPONENT;
    SIGNAL clock, reset, x0, x1, y0, y1 : std_logic;
BEGIN
    sm1: state_machine3 PORT MAP(x0 => x0, x1 => x1, clock => clock, reset => reset, y0 => y0, y1 => y1);
    PROCESS
    BEGIN
        clock <= '0';
        WAIT FOR 50 ns;
        clock <= '1';
        WAIT FOR 50 ns;
    END PROCESS;
    PROCESS
    BEGIN
        reset <= '1';
        WAIT FOR 25 ns;
        reset <= '0';
        WAIT;
    END PROCESS;

    process
    begin
        x0 <= '0'; x1 <= '0';
        wait for 75 ns;
        x0 <= '0'; x1 <= '1';
        wait for 100 ns;
        x0 <= '0'; x1 <= '0';
        wait for 100 ns;
        x0 <= '1'; x1 <= '0';
        wait for 100 ns;
        x0 <= '0'; x1 <= '1';
        wait for 100 ns;
        x0 <= '1'; x1 <= '1';
        wait for 100 ns;
        x0 <= '1'; x1 <= '1';
        wait for 100 ns;
        x0 <= '1'; x1 <= '0';
        wait for 100 ns;
        x0 <= '0'; x1 <= '1';
        wait for 100 ns;
        wait;
    end process;
END state_machine3_test_bench;

CONFIGURATION state_machine3_test_conf OF state_machine3_test IS
    FOR state_machine3_test_bench
    END for;
END state_machine3_test_conf;
