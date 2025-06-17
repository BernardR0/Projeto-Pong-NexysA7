library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pong_top is
    Port (
        clk     : in  STD_LOGIC;
        rst     : in  STD_LOGIC;
        btnU    : in  STD_LOGIC;
        btnD    : in  STD_LOGIC;
        hsync   : out STD_LOGIC;
        vsync   : out STD_LOGIC;
        vga_red : out STD_LOGIC_VECTOR(3 downto 0);
        vga_green : out STD_LOGIC_VECTOR(3 downto 0);
        vga_blue  : out STD_LOGIC_VECTOR(3 downto 0)
    );
end pong_top;

architecture Behavioral of pong_top is

    -- Declarações internas
    signal clk25       : STD_LOGIC;
    signal clk_en   : std_logic;
    signal clk_en_game : STD_LOGIC;
    signal up_db, down_db : STD_LOGIC;

    -- VGA sinais
    signal px         : INTEGER range 0 to 799;
    signal py         : INTEGER range 0 to 524;
    signal active     : STD_LOGIC;

    -- Jogo
    signal ball_x, ball_y     : INTEGER range 0 to 639;
    signal paddle_y           : INTEGER range 0 to 479;

    -- Cores
    signal red, green, blue   : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instancia o divisor de clock 25 MHz para VGA
    clk_div_inst : entity work.clk_div
        port map(
            clk => clk,
            rst => rst,
            clk_out => clk25
        );

    -- Instancia debounce para os botões
    dbU : entity work.debounce
        port map(clk => clk, btn_in => btnU, btn_out => up_db);

    dbD : entity work.debounce
        port map(clk => clk, btn_in => btnD, btn_out => down_db);

    -- Instancia VGA sync
    vga_inst : entity work.vga_sync
        port map(
            clk     => clk25,
            rst     => rst,
            hsync   => hsync,
            vsync   => vsync,
            px      => px,
            py      => py,
            active  => active
        );

    -- Instancia paddle
    paddle_inst : entity work.paddle
        port map(
            clk      => clk25,
            rst      => rst,
            up       => up_db,
            down     => down_db,
            y_pos    => paddle_y
        );

    -- Instancia bola
    ball_inst : entity work.ball
        port map(
            clk      => clk25,
            rst      => rst,
            ball_x   => ball_x,
            ball_y   => ball_y,
            paddle_y => paddle_y
        );

    -- Lógica de cor: desenha paddle e bola
    process(clk25)
    begin
        if rising_edge(clk25) then
            if active = '1' then
                if (px >= 20 and px < 25 and py >= paddle_y and py < paddle_y + 60) then
                    red <= "1111"; green <= "0000"; blue <= "0000"; -- Paddle vermelho
                elsif (px >= ball_x and px < ball_x + 10 and py >= ball_y and py < ball_y + 10) then
                    red <= "1111"; green <= "1111"; blue <= "0000"; -- Bola amarela
                else
                    red <= (others => '0');
                    green <= (others => '0');
                    blue <= (others => '0');
                end if;
            else
                red <= (others => '0');
                green <= (others => '0');
                blue <= (others => '0');
            end if;
        end if;
    end process;

    -- Saída VGA
    vga_red <= red;
    vga_green <= green;
    vga_blue <= blue;

end Behavioral;