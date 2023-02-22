# GDB script to load OpenSBI
# Assumption is that GDB is run with -se <opensbi file>

load

# Load device tree
restore system.dtb binary 0x80400000

# Set registers
set $a1=0x80400000
set $priv=0x3
