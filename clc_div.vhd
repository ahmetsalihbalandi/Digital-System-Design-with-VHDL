----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2025 15:39:33
-- Design Name: 
-- Module Name: clc_div - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clc_div is
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           clk25 : out STD_LOGIC;
           clk190 : out STD_LOGIC;
           clk3 : out STD_LOGIC);
end clc_div;

architecture Behavioral of clc_div is
signal q:std_logic_vector(24 downto 0):=(others=>'0');
begin
    process(clk,clr)
        begin
            if clr='1' then
                q<=(others=>'0');
            elsif clk'event and clk='1' then
                q<=q+1;
            end if;
    
begin


end Behavioral;
