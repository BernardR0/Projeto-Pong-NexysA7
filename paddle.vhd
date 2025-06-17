library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity paddle is
    Port ( clk    : in STD_LOGIC;
           rst    : in STD_LOGIC;
           up     : in STD_LOGIC;
           down   : in STD_LOGIC;
           y_pos  : out INTEGER range 0 to 479);
end paddle;

architecture Behavioral of paddle is
    signal pos : INTEGER range 0 to 419 := 210; -- altura da raquete = 60
begin
    process(clk, rst)
    begin
        if rst = '1' then
            pos <= 210;
        elsif rising_edge(clk) then
            if up = '1' and pos > 0 then
                pos <= pos - 2;
            elsif down = '1' and pos < 419 then
                pos <= pos + 2;
            end if;
        end if;
    end process;
    y_pos <= pos;
end Behavioral;