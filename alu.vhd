library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
entity alu is
    Port ( alusel : in STD_LOGIC_VECTOR (2 downto 0);
           a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           nf : out STD_LOGIC;
           zf : out STD_LOGIC;
           cf : out STD_LOGIC;
           ovf : out STD_LOGIC;
           y : out STD_LOGIC_VECTOR (3 downto 0));
end alu;

architecture Behavioral of alu is
begin
    process(a,b,alusel)
        variable temp:std_logic_vector(4 downto 0);
        variable yv:std_logic_vector(3 downto 0);
        variable cfu,zfu:std_logic;
        begin
            cf<='0';
            ovf<='0';
            temp:="00000";
            zfu:='0';
            
            case alusel is
                when "000" => --pass
                    yv:=a;
                when "001" => --a+b
                    temp:=('0'&a)+('0'&b);
                    yv:=temp(3 downto 0);
                    cfu:=temp(4);
                    ovf<=yv(3) xor a(3) xor b(3) xor cfu;
                    cf<=cfu;
                when "010" => -- a-b 
                    temp:=('0'&a)-('0'&b);
                    yv:=temp(3 downto 0);
                    ovf<=yv(3) xor a(3) xor b(3) xor cfu;
                    cf<=cfu;
                when "011" => --b-a
                    temp:=('0'&b)-('0'&a);
                    yv:=temp(3 downto 0);
                    ovf<=yv(3) xor a(3) xor b(3) xor cfu;
                    cf<=cfu;
                when "100" => --NOT
                    yv:=not a;
                when "101" => --AND
                    yv:=a and b;
                when "110" => --OR
                    yv:=a or b;
                when "111" => --XOR
                    yv:=a xor b;
                when others =>
                    yv:=a;
            end case;
            
            for i in 0 to 3 loop
                zfu := zfu or yv(i); --if all y(i)='0' then zfu='0'
            end loop;
            
            y<=yv;
            zf<=not zfu;
            nf<=yv(3);
        end process; 
end Behavioral;
