library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux81_top is
    Port ( C : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC);
end mux81_top;

architecture Behavioral of mux81_top is
    component mux21a is
                port(a,b,s : in std_logic;
                         y : out std_logic
                );
    end component;
    
    signal v,w : std_logic_vector (2 downto 0):= (others=>'0');
    
begin
        M1: mux21a port map (a=>C(0),b=>C(1),s=>S(0),y=>v(0));
        M2: mux21a port map (a=>C(2),b=>C(3),s=>S(0),y=>w(0));
        M3: mux21a port map (a=>C(4),b=>C(5),s=>S(0),y=>v(1));
        M4: mux21a port map (a=>C(6),b=>C(7),s=>S(0),y=>w(1));
        M5: mux21a port map (a=>v(0),b=>w(0),s=>S(1),y=>v(2));
        M6: mux21a port map (a=>v(1),b=>w(1),s=>S(1),y=>w(2));
        M7: mux21a port map (a=>v(2),b=>w(2),s=>S(2),y=>y);

end Behavioral;