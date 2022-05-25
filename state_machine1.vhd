LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE WORK.ALL;
ENTITY state_machine1 IS
    PORT(x : IN std_logic;
        clock : IN std_logic;
        reset : IN std_logic;
        y0, y1 : OUT std_logic);
END state_machine1;

ARCHITECTURE structure OF state_machine1 IS
    COMPONENT myand2
    PORT(a, b : IN std_logic;
    c : OUT std_logic);
    END COMPONENT;

    COMPONENT myor2
    PORT(a, b : IN std_logic;
    c : OUT std_logic);
    END COMPONENT;

    COMPONENT mynot
    PORT(a : IN std_logic;
    b : OUT std_logic);
    END COMPONENT;

    COMPONENT mydff
    PORT(d : IN std_logic;
    clock, reset : IN std_logic;
    q : OUT std_logic);
    END COMPONENT;
    
    SIGNAL q0_out, q1_out : std_logic;
    SIGNAL a0_out, a1_out : std_logic;
    SIGNAL o0_out, o1_out : std_logic;
    SIGNAL n0_out : std_logic;

BEGIN
    dff0: mydff PORT MAP(d => a0_out, clock => clock, reset => reset, q => q0_out);
    dff1: mydff PORT MAP(d => o1_out, clock => clock, reset => reset, q => q1_out);
    a0: myand2 PORT MAP(a => n0_out, b => o0_out, c => a0_out);
    a1: myand2 PORT MAP(a => q1_out, b => x, c => a1_out);
    o0: myor2 PORT MAP(a => q0_out, b => x, c => o0_out);
    o1: myor2 PORT MAP(a => a1_out, b => q0_out, c => o1_out);
    n0: mynot PORT MAP(a => q1_out, b => n0_out);
    y0 <= q0_out;
    y1 <= q1_out;
END structure;
