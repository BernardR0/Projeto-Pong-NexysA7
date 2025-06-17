library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity debounce is
    Port ( clk : in STD_LOGIC;
           btn_in : in STD_LOGIC;
           btn_out : out STD_LOGIC);
end debounce;

architecture Behavioral of debounce is
    signal count : unsigned(19 downto 0) := (others => '0');
    signal btn_sync : STD_LOGIC := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if btn_in /= btn_sync then
                count <= count + 1;
                if count = 1000000 then
                    btn_sync <= btn_in;
                    count <= (others => '0');
                end if;
            else
                count <= (others => '0');
            end if;
        end if;
    end process;
    btn_out <= btn_sync;
end Behavioral;