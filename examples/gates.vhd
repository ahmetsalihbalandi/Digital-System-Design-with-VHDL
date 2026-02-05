----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.10.2025 15:32:05
-- Design Name: 
-- Module Name: gates - Structural
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
