transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/daniel/Documents/GitHub/handshake_memory/hdl/memory.vhd}
vcom -93 -work work {/home/daniel/Documents/GitHub/handshake_memory/hdl/memory_state_machine.vhd}
vcom -93 -work work {/home/daniel/Documents/GitHub/handshake_memory/hdl/top.vhd}

