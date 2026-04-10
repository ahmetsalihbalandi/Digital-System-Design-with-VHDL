library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity dff2_tb is
end;

architecture bench of dff2_tb is

  component dff2
      Port ( clc : in STD_LOGIC;
             clr : in STD_LOGIC;
             D : in STD_LOGIC;
             q : out STD_LOGIC);
  end component;

  signal clc: STD_LOGIC;
  signal clr: STD_LOGIC;
  signal D: STD_LOGIC;
  signal q: STD_LOGIC;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: dff2 port map ( clc => clc,
                       clr => clr,
                       D   => D,
                       q   => q );

  stimulus: process
  begin

    -- Put initialisation code here


    -- Put test bench stimulus code here
    clr<='1';
    wait for 5ns;
    clr<='0';
    wait for 5ns;
    
    D
    
    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clc <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;