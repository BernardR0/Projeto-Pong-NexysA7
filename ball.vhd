library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ball is
    Port ( clk      : in STD_LOGIC;
           rst      : in STD_LOGIC;
           ball_x   : out INTEGER range 0 to 639;
           ball_y   : out INTEGER range 0 to 479;
           paddle_y : in INTEGER range 0 to 479);
end ball;

architecture Behavioral of ball is
    signal x, y : INTEGER range 0 to 639 := 320;
    signal dx   : INTEGER := -2;
    signal dy   : INTEGER := 2;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            x <= 320;
            y <= 240;
            dx <= -2;
            dy <= 2;
        elsif rising_edge(clk) then
            -- Movimento da bola
            x <= x + dx;
            y <= y + dy;

            -- Colisão com topo e base
            if y <= 0 or y >= 470 then
                dy <= -dy;
            end if;

            -- Colisão com raquete
            if x <= 25 and x >= 20 and y >= paddle_y and y <= paddle_y + 60 then
                dx <= -dx;
            end if;

            -- Reinicia se perder
            if x < 0 then
                x <= 320;
                y <= 240;
                dx <= -2;
                dy <= 2;
            end if;
        end if;
    end process;
    ball_x <= x;
    ball_y <= y;
end Behavioral;