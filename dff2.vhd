library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff2 is
    Port ( clc : in STD_LOGIC;
           clr : in STD_LOGIC;
           D : in STD_LOGIC;
           q : out STD_LOGIC);
end dff2;

architecture Behavioral of dff2 is

begin
    process (clc,clr)
        begin
            if (clr='1') then
                q<='0';
            elsif (clc'event and clc='1') then
                q<=D;
            end if;
        end process;
end Behavioral;