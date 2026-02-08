library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vhdl_midterm_project is
    Port ( 
        clk   : in  STD_LOGIC; -- Clock signal
        rst   : in  STD_LOGIC; -- Asynchronous Reset
        d_in  : in  STD_LOGIC; -- Input d(n)
        d_out  : out STD_LOGIC_vector(2 downto 0) -- Out1(n),Out2(n),Out3(n)
    );
end vhdl_midterm_project;

architecture Behavioral of vhdl_midterm_project is

    -- Define the states as shown in your diagram
    -- S0="00", S1="10", S2="01", S3="11"
    type state_type is (S0, S1, S2, S3);
    signal present_state, next_state : state_type;

begin

    -- Process 1: Synchronous Logic (State Memory)
    -- Updates current state on rising clock edge
    sync_proc: process(clk, rst)
    begin
        if rst = '1' then
            present_state <= S0; -- Reset to initial state 00
        elsif clk'event and clk='1' then
            present_state <= next_state;
        end if;
    end process;

    -- Process 2: Combinational Logic (Next State & Output Logic)
    -- Determines next state and outputs based on Input and Current State
    comb_proc: process(present_state, d_in)
    begin
        -- Default assignments to prevent latches
        next_state <= present_state;
        d_out<="000";

        case present_state is
            
            -- State S0 (d(n-1)=0, d(n-2)=0)
            when S0 =>
                if d_in = '0' then
                    next_state <= S0;
                    d_out<="000";
                else
                    next_state <= S1;
                    d_out<="110";
                end if;

            -- State S1 (d(n-1)=1, d(n-2)=0)
            when S1 =>
                if d_in = '0' then
                    next_state <= S2;
                    d_out<="101";
                else
                    next_state <= S3;
                    d_out<="011";
                end if;

            -- State S2 (d(n-1)=0, d(n-2)=1)
            when S2 =>
                if d_in = '0' then
                    next_state <= S0;
                    d_out<="111";
                else
                    next_state <= S1;
                    d_out<="001";
                end if;

            -- State S3 (d(n-1)=1, d(n-2)=1)
            when S3 =>
                if d_in = '0' then
                    next_state <= S2;
                    d_out<="010";
                else
                    next_state <= S3;
                    d_out<="100";
                end if;

        end case;
    end process;
    
end Behavioral;