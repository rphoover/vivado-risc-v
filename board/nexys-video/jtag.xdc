# JTAG on Pmod A
set_property -dict {PACKAGE_PIN AB22 IOSTANDARD LVCMOS33} [get_ports { jtag_tdi }];
set_property -dict {PACKAGE_PIN AB21 IOSTANDARD LVCMOS33} [get_ports { jtag_trst }];
set_property -dict {PACKAGE_PIN AB20 IOSTANDARD LVCMOS33} [get_ports { jtag_tck }];
set_property -dict {PACKAGE_PIN AB18 IOSTANDARD LVCMOS33} [get_ports { jtag_tms }];
set_property -dict {PACKAGE_PIN Y21  IOSTANDARD LVCMOS33} [get_ports { jtag_tdo }];

set_property PULLUP   TRUE [get_ports jtag_tdi];
set_property PULLUP   TRUE [get_ports jtag_tms];
set_property PULLDOWN TRUE [get_ports jtag_trst];

# Vivado does not like clocks over PMOD so it suggested the following
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets jtag_tck_IBUF];

# Clock
set jtag_period 100;
create_clock -name tck -period $jtag_period [get_ports jtag_tck];

# JTAG I/O
set jtag_input_delay [ expr { 0.15 * $jtag_period } ];
set jtag_output_delay [ expr { 0.3 * $jtag_period } ];

set_input_delay  -clock tck $jtag_input_delay  [get_ports jtag_tdi];
set_input_delay  -clock tck $jtag_input_delay  [get_ports jtag_trst];
set_input_delay  -clock tck $jtag_input_delay  [get_ports jtag_tms];
set_output_delay -clock tck $jtag_output_delay [get_ports jtag_tdo];
