## Arquivo de restrições para Nexys A7-100T - Pong 1 Jogador

## CLOCK
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## RESET (BTNC)
set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## BOT�ES
set_property PACKAGE_PIN T18 [get_ports btnU]
set_property IOSTANDARD LVCMOS33 [get_ports btnU]

set_property PACKAGE_PIN W19 [get_ports btnD]
set_property IOSTANDARD LVCMOS33 [get_ports btnD]

## VGA SYNC
set_property PACKAGE_PIN P19 [get_ports hsync]
set_property IOSTANDARD LVCMOS33 [get_ports hsync]

set_property PACKAGE_PIN R19 [get_ports vsync]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]

## VGA RED
set_property PACKAGE_PIN R17 [get_ports {vga_red[0]}]
set_property PACKAGE_PIN N17 [get_ports {vga_red[1]}]
set_property PACKAGE_PIN P18 [get_ports {vga_red[2]}]
set_property PACKAGE_PIN P17 [get_ports {vga_red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[*]}]

## VGA GREEN
set_property PACKAGE_PIN N18 [get_ports {vga_green[0]}]
set_property PACKAGE_PIN L18 [get_ports {vga_green[1]}]
set_property PACKAGE_PIN M18 [get_ports {vga_green[2]}]
set_property PACKAGE_PIN M19 [get_ports {vga_green[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[*]}]

## VGA BLUE
set_property PACKAGE_PIN K18 [get_ports {vga_blue[0]}]
set_property PACKAGE_PIN J18 [get_ports {vga_blue[1]}]
set_property PACKAGE_PIN J19 [get_ports {vga_blue[2]}]
set_property PACKAGE_PIN H17 [get_ports {vga_blue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[*]}]


set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

