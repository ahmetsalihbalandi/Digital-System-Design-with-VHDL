library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dtypeflipflop is
    Port ( clock : in STD_LOGIC;
           D : in STD_LOGIC;
           q : out STD_LOGIC;
           notq : out STD_LOGIC);
end dtypeflipflop;

architecture Structural of dtypeflipflop is
    signal f1,f2,f3,f4,f5,f6:std_logic;
begin
        f1 <= not(f4 and f2);
        f2 <= not(f1 and f5);
        f3 <= not(f4 and f6);
        f4 <= not(f3 and clock);
        f5 <= not(f4 and clock and f6);
        f6 <= not(f5 and D);
        q <= f1;
        notq <= f2;
end Behavioral;
