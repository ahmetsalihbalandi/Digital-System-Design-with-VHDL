library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Döngüde saydýrma iþlemi için gerekli

entity mux81_tb is
-- Testbench entity'si boþtur, port içermez.
end mux81_tb;

architecture Behavioral of mux81_tb is

    -- 1. Test edilecek bileþenin (DUT - Device Under Test) tanýmlanmasý
    component mux81_top
        Port ( C : in STD_LOGIC_VECTOR (7 downto 0);
               S : in STD_LOGIC_VECTOR (2 downto 0);
               Y : out STD_LOGIC);
    end component;

    -- 2. Giriþ ve Çýkýþ sinyallerinin tanýmlanmasý
    signal C_tb : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal S_tb : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal Y_tb : STD_LOGIC;

    -- Bekleme süresi sabiti
    constant wait_time : time := 30 ns;

begin

    -- 3. Port haritalama (Port Mapping)
    uut: mux81_top port map (
        C => C_tb,
        S => S_tb,
        Y => Y_tb
    );

    -- 4. Uyarýcý (Stimulus) Süreci
    stim_proc: process
    begin
        -- Test Durumu 1: C giriþine karýþýk bir deðer verelim
        -- C = "10110011" olsun.
        -- S=0 iken Y=1 (C(0)) olmalý
        -- S=2 iken Y=0 (C(2)) olmalý vb.
        C_tb <= "10110011"; 
        
        report "Test 1 Basladi: C = 10110011";
        
        -- S giriþini 000'dan 111'e kadar (0-7) döngü ile deðiþtir
        for i in 0 to 9 loop
            S_tb <= std_logic_vector(to_unsigned(i, 3));
            wait for wait_time;
        end loop;
        
        wait for wait_time;

        -- Test Durumu 2: C giriþini deðiþtirelim
        -- C = "11110000" (Üst 4 bit 1, alt 4 bit 0)
        C_tb <= "11110000";
        
        report "Test 2 Basladi: C = 11110000";

        for i in 0 to 7 loop
            S_tb <= std_logic_vector(to_unsigned(i, 3));
            wait for wait_time;
        end loop;

        -- Simülasyonu bitir
        report "Simulasyon Tamamlandi.";
        wait;
    end process;

end Behavioral;