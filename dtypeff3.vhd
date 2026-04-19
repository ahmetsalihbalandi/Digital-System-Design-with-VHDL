library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dtypeflipflop is
    Port ( clk : in STD_LOGIC;
           D : in STD_LOGIC;
           q : out STD_LOGIC;
           notq : out STD_LOGIC);
end dtypeflipflop;

architecture Structural of dtypeflipflop is
    signal f1,f2,f3,f4:std_logic;
begin
        f1 <= not(f4 and f2);
        f2 <= not(f1 and f3);
        f3 <= not(not D and clk);
        f4 <= not(D and clk);
        q <= f1;
        notq <= f2;
end Structural;