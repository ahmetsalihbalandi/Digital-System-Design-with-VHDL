library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity mux21a_tb is
end;

architecture bench of mux21a_tb is

  component mux21a
      Port ( a : in STD_LOGIC;
             b : in STD_LOGIC;
             s : in STD_LOGIC;
             y : out STD_LOGIC);
  end component;

  signal a: STD_LOGIC;
  signal b: STD_LOGIC;
  signal s: STD_LOGIC;
  signal y: STD_LOGIC;

begin

  uut: mux21a port map ( a => a,
                         b => b,
                         s => s,
                         y => y );

  stimulus: process
  begin
        wait for 200 ns;
        
        a<='0';
        b<='0';
        s<='0';
        
        wait for 30 ns;
        
        a<='0';
        b<='0';
        s<='1';
        
        wait for 30 ns;
        
        a<='0';
        b<='1';
        s<='0';
        
        wait for 30 ns;
        
        a<='0';
        b<='1';
        s<='1';
        
        wait for 30 ns;
        
        a<='1';
        b<='0';
        s<='0';
        
        wait for 30 ns;
        
        a<='1';
        b<='0';
        s<='1';
        
        wait for 30 ns;
        
        a<='1';
        b<='1';
        s<='0';
        
        wait for 30 ns;
        
        a<='1';
        b<='1';
        s<='1';
        
        wait for 30 ns;

    wait;
  end process;


end;