library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clk_div is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end clk_div;

architecture Behavioral of clk_div is
    signal counter : unsigned(1 downto 0) := (others => '0');
    signal clk_reg : STD_LOGIC := '0';
begin
    process(clk, rst)
    begin
        if rst = '1' then
            counter <= (others => '0');
            clk_reg <= '0';
        elsif rising_edge(clk) then
            if counter = "01" then  -- conta até 1
                clk_reg <= not clk_reg;
                counter <= (others => '0');
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    clk_out <= clk_reg;
end Behavioral;
