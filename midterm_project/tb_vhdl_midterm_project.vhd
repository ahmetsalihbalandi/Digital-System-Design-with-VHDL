library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_vhdl_midterm_project is
end entity;

architecture sim of tb_vhdl_midterm_project is

    signal clk   : std_logic := '0';
    signal rst   : std_logic := '0';
    signal d_in  : std_logic := '0';
    signal d_out : std_logic_vector(2 downto 0);

    constant Tclk : time := 10 ns;
    constant Tskew : time := 2 ns;   -- input'u clock edge'inden uzaklaþtýrmak için

begin

    -- DUT
    uut: entity work.vhdl_midterm_project
        port map (
            clk   => clk,
            rst   => rst,
            d_in  => d_in,
            d_out => d_out
        );

    -- clock
    clk <= not clk after Tclk/2;

    stim_proc: process
        constant seq : std_logic_vector := "01011001110100011101";
    begin
        -- async reset
        d_in <= '0';
        rst  <= '1';
        wait for 25 ns;
        rst  <= '0';

        -- ilk rising edge'i bekle (reset sonrasý senkron baþlasýn)
        wait until rising_edge(clk);

        for i in seq'range loop
            wait for Tskew;          -- input edge ile clk edge çakýþmasýn
            d_in <= seq(i);

            -- bir sonraki clock kenarýnda DUT bu d_in'i örnekleyecek
            wait until rising_edge(clk);

            report "t=" & time'image(now) &
                   "  applied(d_in)=" & std_logic'image(d_in) &
                   "  observed(d_out)=" &
                   std_logic'image(d_out(2)) &
                   std_logic'image(d_out(1)) &
                   std_logic'image(d_out(0));
        end loop;

        -- Async reset'i de clock'tan baðýmsýz bir anda dene
        report "---- Async reset test ----";
        wait for 3 ns;   -- özellikle clock edge'e denk getirmemek için
        rst <= '1';
        wait for 11 ns;
        rst <= '0';

        -- reset sonrasý birkaç vuruþ daha
        wait until rising_edge(clk);
        wait for Tskew;
        d_in <= '1';
        wait until rising_edge(clk);
        report "After async reset: d_out=" &
               std_logic'image(d_out(2)) &
               std_logic'image(d_out(1)) &
               std_logic'image(d_out(0));

        report "SIM DONE" severity note;
        wait;
    end process;

end architecture;