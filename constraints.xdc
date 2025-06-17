## Pong 1 Jogador - Nexys A7-100T XDC

## Clock de 100MHz
set_property PACKAGE_PIN E3 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {{0 5}} [get_ports clk]

## Reset (BotÃ£o Central - BTNC)
set_property PACKAGE_PIN N17 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## BotÃµes de controle
set_property PACKAGE_PIN M18 [get_ports btnU]
set_property IOSTANDARD LVCMOS33 [get_ports btnU]

set_property PACKAGE_PIN P18 [get_ports btnD]
set_property IOSTANDARD LVCMOS33 [get_ports btnD]

## Sinais VGA - SincronizaÃ§Ã£o
set_property PACKAGE_PIN B11 [get_ports hsync]
set_property IOSTANDARD LVCMOS33 [get_ports hsync]

set_property PACKAGE_PIN B12 [get_ports vsync]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]

## VGA Red
set_property PACKAGE_PIN A3 [get_ports {vga_red[0]}]
set_property PACKAGE_PIN B4 [get_ports {vga_red[1]}]
set_property PACKAGE_PIN C5 [get_ports {vga_red[2]}]
set_property PACKAGE_PIN A4 [get_ports {vga_red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[*]}]

## VGA Green
set_property PACKAGE_PIN C6 [get_ports {vga_green[0]}]
set_property PACKAGE_PIN A5 [get_ports {vga_green[1]}]
set_property PACKAGE_PIN B6 [get_ports {vga_green[2]}]
set_property PACKAGE_PIN A6 [get_ports {vga_green[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[*]}]

## VGA Blue
set_property PACKAGE_PIN B7 [get_ports {vga_blue[0]}]
set_property PACKAGE_PIN C7 [get_ports {vga_blue[1]}]
set_property PACKAGE_PIN D7 [get_ports {vga_blue[2]}]
set_property PACKAGE_PIN D8 [get_ports {vga_blue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[*]}]

## ConfiguraÃ§Ã£o da tensÃ£o do banco 0 (essencial para evitar erros DRC)
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
