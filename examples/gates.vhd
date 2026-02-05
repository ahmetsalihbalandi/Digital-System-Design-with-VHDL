library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gates is
    Port ( z : out STD_LOGIC_VECTOR (5 downto 0);
           a : in STD_LOGIC;
           b : in STD_LOGIC);
end gates;

architecture Structural of gates is

begin
        Z(5)<= a and b;
        Z(4)<= a or b;
        Z(3)<= a nand b;
        Z(2)<= a xor b;
        Z(1)<= a xnor b;
        Z(0)<= a nor b;

end Structural;
