library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vga_sync is
    Port ( clk    : in  STD_LOGIC;
           rst    : in  STD_LOGIC;
           hsync  : out STD_LOGIC;
           vsync  : out STD_LOGIC;
           px     : out INTEGER range 0 to 799;
           py     : out INTEGER range 0 to 524;
           active : out STD_LOGIC);
end vga_sync;

architecture Behavioral of vga_sync is
    signal h_count : INTEGER range 0 to 799 := 0;
    signal v_count : INTEGER range 0 to 524 := 0;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            h_count <= 0;
            v_count <= 0;
        elsif rising_edge(clk) then
            if h_count = 799 then
                h_count <= 0;
                if v_count = 524 then
                    v_count <= 0;
                else
                    v_count <= v_count + 1;
                end if;
            else
                h_count <= h_count + 1;
            end if;
        end if;
    end process;

    hsync <= '0' when (h_count >= 656 and h_count < 752) else '1';
    vsync <= '0' when (v_count >= 490 and v_count < 492) else '1';

    active <= '1' when (h_count < 640 and v_count < 480) else '0';

    px <= h_count;
    py <= v_count;
end Behavioral;